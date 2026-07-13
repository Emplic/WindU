local Creator = require("../modules/Creator")
local Motion = require("../modules/Motion")

local New = Creator.New
local Tween = Creator.Tween

local HOLDER_SIDE_MARGIN = 12
local HOLDER_TOP = 56
local HOLDER_BOTTOM = 100
local HOLDER_MAX_WIDTH = 360
local HOLDER_MIN_WIDTH = 200
local CARD_RADIUS = 14
local CARD_PADDING = 14
local CARD_GAP = 8
local ICON_SIZE = 38
local CLOSE_SIZE = 44
local ACTION_HEIGHT = 44
local MAX_ACTIONS = 2
local MAX_TITLE_HEIGHT = 38
local MAX_CONTENT_HEIGHT = 62
local PROGRESS_HEIGHT = 3
local MAX_VISIBLE = 5

local NOTIFICATION_STYLES = {
	Info = {
		Icon = "info",
		Color = Color3.fromHex("#2F80ED"),
	},
	Notice = {
		Icon = "bell",
		Color = Color3.fromHex("#38BDF8"),
	},
	Success = {
		Icon = "circle-check",
		Color = Color3.fromHex("#22C55E"),
	},
	Warning = {
		Icon = "triangle-alert",
		Color = Color3.fromHex("#F59E0B"),
	},
	Error = {
		Icon = "circle-x",
		Color = Color3.fromHex("#EF4444"),
	},
	Neutral = {
		Icon = "message-circle",
		Color = Color3.fromHex("#71717A"),
	},
}

local STYLE_ALIASES = {
	default = "Info",
	info = "Info",
	notice = "Notice",
	message = "Notice",
	success = "Success",
	successful = "Success",
	ok = "Success",
	green = "Success",
	warn = "Warning",
	warning = "Warning",
	caution = "Warning",
	error = "Error",
	fail = "Error",
	failed = "Error",
	danger = "Error",
	neutral = "Neutral",
}

local NotificationModule = {
	Holder = nil,
	NotificationIndex = 0,
	Notifications = {},
}

local function ResolveColor(Value, Fallback)
	if typeof(Value) == "Color3" then
		return Value
	end

	if typeof(Value) == "string" and string.sub(Value, 1, 1) == "#" then
		local Success, Color = pcall(Color3.fromHex, Value)
		if Success then
			return Color
		end
	end

	return Fallback
end

local function NormalizeStyleName(Value)
	local Key = tostring(Value or "Info"):lower():gsub("%s+", "")
	return STYLE_ALIASES[Key] or "Info"
end

local function ResolveDuration(Value)
	if Value == false then
		return false
	end

	local Number = tonumber(Value)
	if Number == nil then
		return 5
	end

	return math.max(Number, 0)
end

local function NormalizeIcon(Value)
	if typeof(Value) == "number" then
		return "rbxassetid://" .. tostring(Value)
	end
	if typeof(Value) == "string" then
		return Value
	end
	return nil
end

local function PaintIcon(Icon, Color, Transparency)
	if typeof(Icon) ~= "Instance" then
		return
	end

	local Targets = {}
	if Icon:IsA("ImageLabel") or Icon:IsA("ImageButton") then
		table.insert(Targets, Icon)
	end

	for _, Descendant in Icon:GetDescendants() do
		if Descendant:IsA("ImageLabel") or Descendant:IsA("ImageButton") then
			table.insert(Targets, Descendant)
		end
	end

	for _, Target in Targets do
		Target.ImageColor3 = Color
		if Transparency ~= nil then
			Target.ImageTransparency = Transparency
		end
	end
end

local function CreateCorner(Radius)
	return New("UICorner", {
		CornerRadius = UDim.new(0, Radius),
	})
end

local function GetActions(Buttons)
	local Actions = {}
	if typeof(Buttons) ~= "table" then
		return Actions
	end

	for Index = 1, math.min(#Buttons, MAX_ACTIONS) do
		local Action = Buttons[Index]
		if typeof(Action) == "table" then
			table.insert(Actions, Action)
		end
	end

	return Actions
end

local function TrimNotifications(MaxVisible, AvailableHeight)
	local Active = {}
	for _, Notification in NotificationModule.Notifications do
		if not Notification.Closed then
			table.insert(Active, Notification)
		end
	end

	table.sort(Active, function(A, B)
		return A.Index < B.Index
	end)

	local TotalHeight = math.max(#Active - 1, 0) * CARD_GAP
	for _, Notification in Active do
		TotalHeight = TotalHeight + (Notification.LayoutHeight or 64)
	end

	while #Active > 1 and (#Active > MaxVisible or TotalHeight > AvailableHeight) do
		local Oldest = table.remove(Active, 1)
		TotalHeight = TotalHeight - (Oldest.LayoutHeight or 64) - CARD_GAP
		Oldest:Close()
	end
end

function NotificationModule.Init(Parent)
	local NotModule = {
		Lower = false,
	}

	NotModule.Frame = New("Frame", {
		Name = "NotificationHolder",
		Position = UDim2.new(1, -HOLDER_SIDE_MARGIN, 0, HOLDER_TOP),
		AnchorPoint = Vector2.new(1, 0),
		Size = UDim2.new(1, -(HOLDER_SIDE_MARGIN * 2), 1, -(HOLDER_TOP + HOLDER_BOTTOM)),
		Parent = Parent,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 100,
	}, {
		New("UISizeConstraint", {
			MinSize = Vector2.new(HOLDER_MIN_WIDTH, 0),
			MaxSize = Vector2.new(HOLDER_MAX_WIDTH, 10000),
		}),
		New("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, CARD_GAP),
		}),
	})

	function NotModule.SetLower(Value)
		NotModule.Lower = Value == true
		local Bottom = if NotModule.Lower then 12 else HOLDER_BOTTOM
		NotModule.Frame.Size = UDim2.new(1, -(HOLDER_SIDE_MARGIN * 2), 1, -(HOLDER_TOP + Bottom))
	end

	NotificationModule.Holder = NotModule.Frame
	return NotModule
end

function NotificationModule.New(Config)
	Config = if typeof(Config) == "table" then Config else {}

	local StyleName = NormalizeStyleName(Config.Style or Config.Type or Config.Variant)
	local Style = NOTIFICATION_STYLES[StyleName] or NOTIFICATION_STYLES.Info
	local AccentColor = ResolveColor(Config.AccentColor or Config.Color, Style.Color)
	local IconValue
	if Config.Icon == false or Config.Icon == "" then
		IconValue = nil
	elseif Config.Icon ~= nil then
		IconValue = NormalizeIcon(Config.Icon)
	else
		IconValue = Style.Icon
	end

	local Notification = {
		Title = tostring(Config.Title or "Notification"),
		Content = Config.Content ~= nil and tostring(Config.Content) or nil,
		Icon = IconValue,
		IconThemed = Config.IconThemed,
		Style = StyleName,
		AccentColor = AccentColor,
		ProgressColor = ResolveColor(Config.ProgressColor, AccentColor),
		Background = Config.Background,
		BackgroundImageTransparency = Creator.ClampTransparency(Config.BackgroundImageTransparency, 0.35),
		Duration = ResolveDuration(Config.Duration),
		Buttons = GetActions(Config.Buttons),
		CanClose = Config.CanClose ~= false,
		UIElements = {},
		Closed = false,
	}

	NotificationModule.NotificationIndex = NotificationModule.NotificationIndex + 1
	Notification.Index = NotificationModule.NotificationIndex
	NotificationModule.Notifications[Notification.Index] = Notification

	local Holder = Config.Holder or NotificationModule.Holder
	assert(Holder, "Notification holder is not initialized")

	local HasTimer = typeof(Notification.Duration) == "number" and Notification.Duration > 0
	local LeftSpace = Notification.Icon and (ICON_SIZE + 10) or 0
	local RightSpace = Notification.CanClose and (CLOSE_SIZE + 6) or 0
	local ProgressTween
	local TimerToken = 0
	local Opened = false
	local CanTrim = false
	local TargetHeight = 64
	local Connections = {}

	local function Connect(Signal, Callback)
		local Connection = Signal:Connect(Callback)
		table.insert(Connections, Connection)
		return Connection
	end

	local function AttachPress(Button, Amount)
		Connect(Button.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				Motion.Press(Button, true, Amount)
			end
		end)
		Connect(Button.InputEnded, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				Motion.Press(Button, false, Amount)
			end
		end)
		Connect(Button.MouseLeave, function()
			Motion.Press(Button, false, Amount)
		end)
	end

	local function DisconnectSignals()
		for _, Connection in Connections do
			Connection:Disconnect()
		end
		table.clear(Connections)
	end

	local MainContainer = New("Frame", {
		Name = "NotificationContainer",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		ClipsDescendants = true,
		LayoutOrder = -Notification.Index,
		ZIndex = 100,
		Parent = Holder,
	})

	local Main = New("Frame", {
		Name = "Notification",
		BackgroundColor3 = Color3.fromRGB(16, 18, 24),
		BackgroundTransparency = 0.03,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, TargetHeight),
		Position = UDim2.new(0, 28, 0, 0),
		ClipsDescendants = true,
		ZIndex = 101,
		ThemeTag = {
			BackgroundColor3 = "Notification",
		},
		Parent = MainContainer,
	}, {
		CreateCorner(CARD_RADIUS),
		New("UIStroke", {
			Color = Notification.AccentColor,
			Transparency = 0.72,
			Thickness = 1,
		}),
	})

	New("Frame", {
		Name = "Surface",
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		BackgroundTransparency = 0.94,
		Size = UDim2.fromScale(1, 1),
		ZIndex = 102,
		ThemeTag = {
			BackgroundColor3 = "Notification2",
			BackgroundTransparency = "Notification2Transparency",
		},
		Parent = Main,
	}, {
		CreateCorner(CARD_RADIUS),
	})

	if typeof(Notification.Background) == "string" and Notification.Background ~= "" then
		New("ImageLabel", {
			Name = "Background",
			Image = Notification.Background,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			ImageTransparency = Notification.BackgroundImageTransparency,
			ZIndex = 103,
			Parent = Main,
		}, {
			CreateCorner(CARD_RADIUS),
		})
	end

	New("Frame", {
		Name = "StyleWash",
		BackgroundColor3 = Notification.AccentColor,
		BackgroundTransparency = 0.9,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		ZIndex = 104,
		Parent = Main,
	}, {
		CreateCorner(CARD_RADIUS),
		New("UIGradient", {
			Rotation = 0,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.12),
				NumberSequenceKeypoint.new(0.42, 0.78),
				NumberSequenceKeypoint.new(1, 1),
			}),
		}),
	})

	New("Frame", {
		Name = "Accent",
		BackgroundColor3 = Notification.AccentColor,
		BackgroundTransparency = 0.08,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 3, 1, -20),
		Position = UDim2.new(0, 0, 0, 10),
		ZIndex = 105,
		Parent = Main,
	}, {
		CreateCorner(2),
	})

	local Body = New("Frame", {
		Name = "Body",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -(CARD_PADDING * 2), 0, 0),
		Position = UDim2.fromOffset(CARD_PADDING, CARD_PADDING),
		ZIndex = 106,
		Parent = Main,
	})

	local BodyLayout = New("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10),
		Parent = Body,
	})

	local HeaderRow = New("Frame", {
		Name = "Header",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, math.max(Notification.Icon and ICON_SIZE or 0, Notification.CanClose and CLOSE_SIZE or 0, 20)),
		LayoutOrder = 1,
		ZIndex = 107,
		Parent = Body,
	})

	local TextContainer = New("Frame", {
		Name = "TextContainer",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -(LeftSpace + RightSpace), 0, 0),
		Position = UDim2.fromOffset(LeftSpace, 0),
		ZIndex = 108,
		Parent = HeaderRow,
	})

	local TextLayout = New("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 3),
		Parent = TextContainer,
	})

	local Title = New("TextLabel", {
		Name = "Title",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		Text = Notification.Title,
		TextWrapped = true,
		TextTruncate = Enum.TextTruncate.AtEnd,
		RichText = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 15,
		LineHeight = 1.05,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		LayoutOrder = 1,
		ZIndex = 108,
		ThemeTag = {
			TextColor3 = "NotificationTitle",
			TextTransparency = "NotificationTitleTransparency",
		},
		Parent = TextContainer,
	}, {
		New("UISizeConstraint", {
			MinSize = Vector2.new(0, 18),
			MaxSize = Vector2.new(10000, MAX_TITLE_HEIGHT),
		}),
	})

	local Content
	if Notification.Content then
		Content = New("TextLabel", {
			Name = "Content",
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			Text = Notification.Content,
			TextWrapped = true,
			TextTruncate = Enum.TextTruncate.AtEnd,
			RichText = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextSize = 13,
			LineHeight = 1.08,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			LayoutOrder = 2,
			ZIndex = 108,
			ThemeTag = {
				TextColor3 = "NotificationContent",
				TextTransparency = "NotificationContentTransparency",
			},
			Parent = TextContainer,
		}, {
			New("UISizeConstraint", {
				MinSize = Vector2.new(0, 16),
				MaxSize = Vector2.new(10000, MAX_CONTENT_HEIGHT),
			}),
		})
	end

	local IconBubble
	if Notification.Icon then
		local Icon = Creator.Image(
			Notification.Icon,
			Notification.Title .. ":" .. tostring(Notification.Icon),
			0,
			Config.Window,
			"Notification",
			Notification.IconThemed
		)
		Icon.Name = "Icon"
		Icon.Size = UDim2.fromOffset(20, 20)
		Icon.Position = UDim2.fromScale(0.5, 0.5)
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.ZIndex = 110
		if Creator.Icon(Notification.Icon) and Notification.IconThemed ~= true then
			PaintIcon(Icon, Color3.new(1, 1, 1), 0)
		end

		IconBubble = New("Frame", {
			Name = "IconBubble",
			BackgroundColor3 = Notification.AccentColor,
			BackgroundTransparency = 0.16,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(ICON_SIZE, ICON_SIZE),
			ZIndex = 109,
			Parent = HeaderRow,
		}, {
			CreateCorner(12),
			New("UIStroke", {
				Color = Notification.AccentColor,
				Transparency = 0.58,
				Thickness = 1,
			}),
			Icon,
		})
	end

	local CloseButton
	if Notification.CanClose then
		local CloseIconData = Creator.Icon("x")
		CloseButton = New("TextButton", {
			Name = "CloseButton",
			Text = "",
			AutoButtonColor = false,
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 0.94,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(CLOSE_SIZE, CLOSE_SIZE),
			Position = UDim2.new(1, 0, 0, 0),
			AnchorPoint = Vector2.new(1, 0),
			ZIndex = 109,
			ThemeTag = {
				BackgroundColor3 = "Notification2",
			},
			Parent = HeaderRow,
		}, {
			CreateCorner(10),
			New("ImageLabel", {
				Name = "Icon",
				Image = CloseIconData and CloseIconData[1] or "",
				ImageRectSize = CloseIconData and CloseIconData[2] and CloseIconData[2].ImageRectSize or Vector2.zero,
				ImageRectOffset = CloseIconData and CloseIconData[2] and CloseIconData[2].ImageRectPosition or Vector2.zero,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageTransparency = 0.34,
				ZIndex = 110,
				ThemeTag = {
					ImageColor3 = "NotificationTitle",
				},
			}),
		})
		AttachPress(CloseButton, 0.96)
	end

	local ActionRow
	if #Notification.Buttons > 0 then
		ActionRow = New("Frame", {
			Name = "Actions",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, ACTION_HEIGHT),
			LayoutOrder = 2,
			ZIndex = 107,
			Parent = Body,
		})

		New("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 6),
			Parent = ActionRow,
		})

		for Index, Action in Notification.Buttons do
			local ButtonSize
			if #Notification.Buttons == 2 then
				ButtonSize = UDim2.new(0.5, -3, 0, ACTION_HEIGHT)
			else
				ButtonSize = UDim2.new(1, 0, 0, ACTION_HEIGHT)
			end

			local ActionButton = New("TextButton", {
				Name = "Action" .. Index,
				Text = tostring(Action.Title or Action.Text or "Action"),
				TextSize = 13,
				FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
				AutoButtonColor = false,
				BackgroundColor3 = if Index == 1 then Notification.AccentColor else Color3.new(1, 1, 1),
				BackgroundTransparency = if Index == 1 then 0.08 else 0.93,
				BorderSizePixel = 0,
				Size = ButtonSize,
				LayoutOrder = Index,
				ZIndex = 108,
				ThemeTag = if Index == 1
					then {
						TextColor3 = "White",
					}
					else {
						BackgroundColor3 = "Notification2",
						TextColor3 = "NotificationTitle",
					},
				Parent = ActionRow,
			}, {
				CreateCorner(10),
			})
			AttachPress(ActionButton, 0.97)

			Connect(ActionButton.MouseButton1Click, function()
				Creator.SafeCallback(Action.Callback, Notification, Action)
				if Action.Close ~= false and Action.CloseOnClick ~= false then
					Notification:Close()
				end
			end)
		end
	end

	local AnimateProgress = HasTimer and Motion:IsEnabled() and not Motion.Reduced
	local ProgressTrack = New("Frame", {
		Name = "ProgressTrack",
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 0.9,
		BorderSizePixel = 0,
		Size = UDim2.new(1, -(CARD_PADDING * 2), 0, PROGRESS_HEIGHT),
		Position = UDim2.new(0, CARD_PADDING, 1, -7),
		AnchorPoint = Vector2.new(0, 1),
		Visible = AnimateProgress,
		ZIndex = 111,
		ThemeTag = {
			BackgroundColor3 = "NotificationDuration",
			BackgroundTransparency = "NotificationDurationTransparency",
		},
		Parent = Main,
	}, {
		CreateCorner(PROGRESS_HEIGHT),
	})

	local ProgressFill = New("Frame", {
		Name = "ProgressFill",
		BackgroundColor3 = Notification.ProgressColor,
		BackgroundTransparency = Creator.ClampTransparency(Config.ProgressTransparency, 0.08),
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		ZIndex = 112,
		Parent = ProgressTrack,
	}, {
		CreateCorner(PROGRESS_HEIGHT),
		New("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Notification.ProgressColor),
				ColorSequenceKeypoint.new(1, Notification.ProgressColor:Lerp(Color3.new(1, 1, 1), 0.3)),
			}),
		}),
	})

	local function UpdateContainerHeight(Animate)
		local BodyHeight = math.max(math.ceil(BodyLayout.AbsoluteContentSize.Y), HeaderRow.Size.Y.Offset)
		TargetHeight = CARD_PADDING + BodyHeight + CARD_PADDING
		Notification.LayoutHeight = TargetHeight
		Main.Size = UDim2.new(1, 0, 0, TargetHeight)

		if Opened then
			if Animate == false then
				MainContainer.Size = UDim2.new(1, 0, 0, TargetHeight)
			else
				Motion.Play(
					MainContainer,
					"Resize",
					{ Size = UDim2.new(1, 0, 0, TargetHeight) },
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out,
					"Resize"
				)
			end
		end

		if CanTrim then
			local AvailableHeight = math.max(Holder.AbsoluteSize.Y, TargetHeight)
			TrimNotifications(math.max(math.floor(tonumber(Config.MaxVisible) or MAX_VISIBLE), 1), AvailableHeight)
		end
	end

	local function UpdateTextHeight()
		local TextHeight = math.max(math.ceil(TextLayout.AbsoluteContentSize.Y), 20)
		TextContainer.Size = UDim2.new(1, -(LeftSpace + RightSpace), 0, TextHeight)
		HeaderRow.Size = UDim2.new(
			1,
			0,
			0,
			math.max(TextHeight, Notification.Icon and ICON_SIZE or 0, Notification.CanClose and CLOSE_SIZE or 0)
		)
		UpdateContainerHeight(Opened)
	end

	Connect(TextLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
		UpdateTextHeight()
	end)
	Connect(BodyLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
		UpdateContainerHeight(Opened)
	end)

	function Notification:Close()
		if Notification.Closed then
			return
		end

		Notification.Closed = true
		TimerToken = TimerToken + 1
		DisconnectSignals()
		if ProgressTween then
			ProgressTween:Cancel()
		end

		Motion.Cancel(MainContainer, "Open")
		Motion.Cancel(MainContainer, "Resize")
		Motion.Cancel(Main, "Open")
		Motion.Play(
			MainContainer,
			"NotificationClose",
			{ Size = UDim2.new(1, 0, 0, 0) },
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out,
			"Close"
		)
		Motion.Play(
			Main,
			"NotificationClose",
			{ Position = UDim2.new(0, 28, 0, 0) },
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out,
			"Close"
		)

		local CloseDelay = if Motion:IsEnabled() and not Motion.Reduced then Motion.GetDuration("NotificationClose") + 0.02 else 0
		task.delay(CloseDelay, function()
			NotificationModule.Notifications[Notification.Index] = nil
			if MainContainer.Parent then
				MainContainer:Destroy()
			end
		end)
	end

	if CloseButton then
		Connect(CloseButton.MouseButton1Click, function()
			Notification:Close()
		end)
	end

	Notification.UIElements = {
		Container = MainContainer,
		Main = Main,
		Body = Body,
		Header = HeaderRow,
		TextContainer = TextContainer,
		Title = Title,
		Content = Content,
		IconBubble = IconBubble,
		CloseButton = CloseButton,
		Actions = ActionRow,
		ProgressTrack = ProgressTrack,
		ProgressFill = ProgressFill,
	}

	UpdateTextHeight()
	CanTrim = true
	TrimNotifications(
		math.max(math.floor(tonumber(Config.MaxVisible) or MAX_VISIBLE), 1),
		math.max(Holder.AbsoluteSize.Y, TargetHeight)
	)

	task.spawn(function()
		task.wait()
		if Notification.Closed then
			return
		end

		UpdateTextHeight()
		Opened = true
		Motion.Play(
			MainContainer,
			"Notification",
			{ Size = UDim2.new(1, 0, 0, TargetHeight) },
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out,
			"Open"
		)
		Motion.Play(
			Main,
			"Notification",
			{ Position = UDim2.new(0, 0, 0, 0) },
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out,
			"Open"
		)

		if HasTimer then
			TimerToken = TimerToken + 1
			local CurrentToken = TimerToken
			if AnimateProgress then
				ProgressFill.Size = UDim2.fromScale(1, 1)
				ProgressTween = Tween(
					ProgressFill,
					Notification.Duration,
					{ Size = UDim2.new(0, 0, 1, 0) },
					Enum.EasingStyle.Linear,
					Enum.EasingDirection.InOut
				)
				ProgressTween:Play()
			end

			task.delay(Notification.Duration, function()
				if CurrentToken == TimerToken and not Notification.Closed then
					Notification:Close()
				end
			end)
		end
	end)

	return Notification
end

return NotificationModule
