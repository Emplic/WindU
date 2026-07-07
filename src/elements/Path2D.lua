local Creator = require("../modules/Creator")
local Motion = require("../modules/Motion")
local New = Creator.New

local Utils = require("./DisplayElementUtils")

local Element = {}

local DEFAULT_POINTS = {
	Vector2.new(0.08, 0.72),
	Vector2.new(0.28, 0.38),
	Vector2.new(0.52, 0.56),
	Vector2.new(0.72, 0.24),
	Vector2.new(0.92, 0.42),
}

local function NormalizePoint(Point)
	if typeof(Point) == "Vector2" then
		return Vector2.new(math.clamp(Point.X, 0, 1), math.clamp(Point.Y, 0, 1))
	end

	if typeof(Point) == "table" then
		local X = Utils.ToFiniteNumber(Point.X or Point.x or Point[1]) or 0
		local Y = Utils.ToFiniteNumber(Point.Y or Point.y or Point[2]) or 0
		return Vector2.new(math.clamp(X, 0, 1), math.clamp(Y, 0, 1))
	end

	return Vector2.new(0, 0)
end

local function NormalizePoints(Points)
	local Normalized = {}
	for _, Point in next, Points or DEFAULT_POINTS do
		table.insert(Normalized, NormalizePoint(Point))
	end

	if #Normalized < 2 then
		Normalized = DEFAULT_POINTS
	end

	return Normalized
end

local function PointToUDim2(Point)
	return UDim2.new(Point.X, 0, Point.Y, 0)
end

local function GetAngle(Y, X)
	if math.atan2 then
		return math.atan2(Y, X)
	end

	if X == 0 then
		return Y >= 0 and math.pi / 2 or -math.pi / 2
	end

	local Angle = math.atan(Y / X)
	if X < 0 then
		Angle += math.pi
	end
	return Angle
end

function Element:New(Config)
	local Path2D = {
		__type = "Path2D",
		Title = Config.Title or "Path 2D",
		Desc = Config.Desc,
		Points = NormalizePoints(Config.Points or Config.Path),
		Labels = Config.Labels or {},
		Height = math.max(Utils.ToFiniteNumber(Config.Height) or 156, 96),
		Thickness = math.max(Utils.ToFiniteNumber(Config.Thickness) or 4, 2),
		Duration = math.max(Utils.ToFiniteNumber(Config.Duration) or 1.2, 0.18),
		StepDelay = math.max(Utils.ToFiniteNumber(Config.StepDelay) or 0.055, 0),
		Loop = Config.Loop == true,
		AutoPlay = Config.AutoPlay ~= false,
		UIElements = {},
		Segments = {},
		Dots = {},
		LabelObjects = {},
		PlayToken = 0,
		HasRendered = false,
		Destroyed = false,
	}

	Path2D.Path2DFrame = require("../components/window/Element")({
		Title = Path2D.Title,
		Desc = Path2D.Desc,
		Parent = Config.Parent,
		TextOffset = 0,
		Hover = Config.Hover == true,
		Tab = Config.Tab,
		Index = Config.Index,
		Window = Config.Window,
		ElementTable = Path2D,
		ParentConfig = Config,
		Tags = Config.Tags,
	})

	Path2D.UIElements.Canvas = Creator.NewRoundFrame(Config.Window.ElementConfig.UICorner, "Squircle", {
		Name = "Path2DCanvas",
		Size = UDim2.new(1, 0, 0, Path2D.Height),
		ClipsDescendants = true,
		ImageTransparency = 0.93,
		Parent = Path2D.Path2DFrame.UIElements.Container,
		ThemeTag = {
			ImageColor3 = "Path2DBackground",
		},
	}, {
		New("UIGradient", {
			Rotation = 25,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.08),
				NumberSequenceKeypoint.new(1, 0.28),
			}),
		}),
	})

	local function ClearObjects()
		for _, Segment in next, Path2D.Segments do
			Segment.Track:Destroy()
		end
		for _, Dot in next, Path2D.Dots do
			Dot:Destroy()
		end
		for _, Label in next, Path2D.LabelObjects do
			Label:Destroy()
		end

		Path2D.Segments = {}
		Path2D.Dots = {}
		Path2D.LabelObjects = {}
	end

	local function GetCanvasSize()
		local Size = Path2D.UIElements.Canvas.AbsoluteSize
		return Vector2.new(Size.X / Config.UIScale, Size.Y / Config.UIScale)
	end

	local function GetPixelPoint(Point, CanvasSize)
		return Vector2.new(Point.X * CanvasSize.X, Point.Y * CanvasSize.Y)
	end

	function Path2D:Render(ShouldPlay)
		local CanvasSize = GetCanvasSize()
		if CanvasSize.X <= 0 or CanvasSize.Y <= 0 then
			return
		end

		Path2D.PlayToken = Path2D.PlayToken + 1
		Path2D.HasRendered = true
		ClearObjects()

		for Index, Point in next, Path2D.Points do
			local Dot = Creator.NewRoundFrame(999, "Circle", {
				Name = "Point" .. tostring(Index),
				Size = UDim2.new(0, Index == 1 and 12 or 9, 0, Index == 1 and 12 or 9),
				Position = PointToUDim2(Point),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageTransparency = 0.35,
				Parent = Path2D.UIElements.Canvas,
				ThemeTag = {
					ImageColor3 = Index == #Path2D.Points and "Path2DMarker" or "Path2DLine",
				},
			})
			table.insert(Path2D.Dots, Dot)
		end

		for Index = 1, #Path2D.Points - 1 do
			local StartPoint = GetPixelPoint(Path2D.Points[Index], CanvasSize)
			local EndPoint = GetPixelPoint(Path2D.Points[Index + 1], CanvasSize)
			local Delta = EndPoint - StartPoint
			local Length = Delta.Magnitude
			local Angle = math.deg(GetAngle(Delta.Y, Delta.X))

			local Track = Creator.NewRoundFrame(999, "Squircle", {
				Name = "Segment" .. tostring(Index),
				Size = UDim2.new(0, Length, 0, Path2D.Thickness),
				Position = UDim2.fromOffset(StartPoint.X, StartPoint.Y),
				AnchorPoint = Vector2.new(0, 0.5),
				Rotation = Angle,
				ImageTransparency = 0.84,
				Parent = Path2D.UIElements.Canvas,
				ThemeTag = {
					ImageColor3 = "Path2DTrack",
				},
			})

			local Fill = Creator.NewRoundFrame(999, "Squircle", {
				Name = "Fill",
				Size = UDim2.new(0, ShouldPlay == false and Length or 0, 1, 0),
				ImageTransparency = 0,
				Parent = Track,
				ThemeTag = {
					ImageColor3 = "Path2DLine",
				},
			})

			table.insert(Path2D.Segments, {
				Track = Track,
				Fill = Fill,
				Length = Length,
				From = Path2D.Points[Index],
				To = Path2D.Points[Index + 1],
			})
		end

		for _, LabelConfig in next, Path2D.Labels do
			if typeof(LabelConfig) ~= "table" then
				LabelConfig = {
					Text = tostring(LabelConfig),
				}
			end
			local PointIndex = math.clamp(math.floor(Utils.ToFiniteNumber(LabelConfig.Point or LabelConfig.Index) or 1), 1, #Path2D.Points)
			local Label = New("TextLabel", {
				Name = "PathLabel",
				Size = UDim2.new(0, 86, 0, 20),
				Position = PointToUDim2(Path2D.Points[PointIndex]),
				AnchorPoint = Vector2.new(0.5, LabelConfig.Above == false and 0 or 1),
				BackgroundTransparency = 1,
				Text = tostring(LabelConfig.Text or LabelConfig.Title or PointIndex),
				TextSize = 12,
				TextTransparency = 0.22,
				TextXAlignment = "Center",
				FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
				Parent = Path2D.UIElements.Canvas,
				ThemeTag = {
					TextColor3 = "Path2DLabel",
				},
			})
			table.insert(Path2D.LabelObjects, Label)
		end

		local Marker = Creator.NewRoundFrame(999, "Circle", {
			Name = "Marker",
			Size = UDim2.new(0, 16, 0, 16),
			Position = PointToUDim2(Path2D.Points[1]),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageTransparency = 0,
			Parent = Path2D.UIElements.Canvas,
			ThemeTag = {
				ImageColor3 = "Path2DMarker",
			},
		}, {
			Creator.NewRoundFrame(999, "Circle", {
				Name = "Core",
				Size = UDim2.new(0, 6, 0, 6),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = Color3.new(1, 1, 1),
			}),
		})
		Path2D.UIElements.Marker = Marker

		if ShouldPlay ~= false and Path2D.AutoPlay then
			Path2D:Play()
		end
	end

	function Path2D:Play()
		Path2D.PlayToken = Path2D.PlayToken + 1
		local Token = Path2D.PlayToken
		local SegmentDuration = Path2D.Duration / math.max(#Path2D.Segments, 1)

		if Path2D.UIElements.Marker then
			Path2D.UIElements.Marker.Position = PointToUDim2(Path2D.Points[1])
		end
		for _, Dot in next, Path2D.Dots do
			Dot.ImageTransparency = 0.72
		end
		for _, Segment in next, Path2D.Segments do
			Segment.Fill.Size = UDim2.new(0, 0, 1, 0)
		end

		for Index, Segment in next, Path2D.Segments do
			local DelayTime = (Index - 1) * (SegmentDuration + Path2D.StepDelay)
			task.delay(DelayTime, function()
				if Token ~= Path2D.PlayToken or Path2D.Destroyed then
					return
				end

				if Path2D.Dots[Index] then
					Motion.Play(Path2D.Dots[Index], "Reveal", { ImageTransparency = 0.12 }, nil, nil, "Point")
				end
				Motion.Play(
					Segment.Fill,
					SegmentDuration,
					{ Size = UDim2.new(0, Segment.Length, 1, 0) },
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out,
					"Draw"
				)
				if Path2D.UIElements.Marker then
					Motion.Play(
						Path2D.UIElements.Marker,
						SegmentDuration,
						{ Position = PointToUDim2(Segment.To) },
						Enum.EasingStyle.Quint,
						Enum.EasingDirection.Out,
						"Path"
					)
				end
			end)
		end

		local EndDelay = #Path2D.Segments * (SegmentDuration + Path2D.StepDelay)
		task.delay(EndDelay, function()
			if Token ~= Path2D.PlayToken or Path2D.Destroyed then
				return
			end
			if Path2D.Dots[#Path2D.Dots] then
				Motion.Play(Path2D.Dots[#Path2D.Dots], "Reveal", { ImageTransparency = 0 }, nil, nil, "Point")
			end
			if Path2D.Loop then
				task.delay(0.4, function()
					if Token == Path2D.PlayToken and not Path2D.Destroyed then
						Path2D:Play()
					end
				end)
			end
		end)
	end

	function Path2D:Stop()
		Path2D.PlayToken = Path2D.PlayToken + 1
		if Path2D.UIElements.Marker then
			Motion.Cancel(Path2D.UIElements.Marker, "Path")
		end
		for _, Segment in next, Path2D.Segments do
			Motion.Cancel(Segment.Fill, "Draw")
		end
	end

	function Path2D:SetPoints(Points)
		Path2D.Points = NormalizePoints(Points)
		Path2D:Render(true)
		return Path2D.Points
	end

	function Path2D:Destroy()
		Path2D.Destroyed = true
		Path2D:Stop()
		Path2D.Path2DFrame:Destroy()
	end

	Creator.AddSignal(Path2D.UIElements.Canvas:GetPropertyChangedSignal("AbsoluteSize"), function()
		Path2D:Render(not Path2D.HasRendered)
	end)

	task.defer(function()
		Path2D:Render(true)
	end)

	return Path2D.__type, Path2D
end

return Element
