local Creator = require("../modules/Creator")
local Motion = require("../modules/Motion")
local New = Creator.New
local Tween = Creator.Tween

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
	Size = UDim2.new(0, 300, 1, -100 - 56),
	SizeLower = UDim2.new(0, 300, 1, -56),
	UICorner = 18,
	UIPadding = 14,
	--ButtonPadding = 9,
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

function NotificationModule.Init(Parent)
	local NotModule = {
		Lower = false,
	}

	function NotModule.SetLower(val)
		NotModule.Lower = val
		NotModule.Frame.Size = val and NotificationModule.SizeLower or NotificationModule.Size
	end

	NotModule.Frame = New("Frame", {
		Position = UDim2.new(1, -116 / 4, 0, 56),
		AnchorPoint = Vector2.new(1, 0),
		Size = NotificationModule.Size,
		Parent = Parent,
		BackgroundTransparency = 1,
		--[[ScrollingDirection = "Y",
        ScrollBarThickness = 0,
        CanvasSize = UDim2.new(0,0,0,0),
        AutomaticCanvasSize = "Y",--]]
	}, {
		New("UIListLayout", {
			HorizontalAlignment = "Center",
			SortOrder = "LayoutOrder",
			VerticalAlignment = "Bottom",
			Padding = UDim.new(0, 8),
		}),
		New("UIPadding", {
			PaddingBottom = UDim.new(0, 116 / 4),
		}),
	})
	return NotModule
end

function NotificationModule.New(Config)
	local StyleName = NormalizeStyleName(Config.Style or Config.Type or Config.Variant)
	local Style = NOTIFICATION_STYLES[StyleName] or NOTIFICATION_STYLES.Info
	local AccentColor = ResolveColor(Config.AccentColor or Config.Color, Style.Color)
	local IconValue
	if Config.Icon == false or Config.Icon == "" then
		IconValue = nil
	elseif Config.Icon ~= nil then
		IconValue = Config.Icon
	else
		IconValue = Style.Icon
	end

	local Notification = {
		Title = Config.Title or "Notification",
		Content = Config.Content or nil,
		Icon = IconValue,
		IconThemed = Config.IconThemed,
		Style = StyleName,
		AccentColor = AccentColor,
		ProgressColor = ResolveColor(Config.ProgressColor, AccentColor),
		Background = Config.Background,
		BackgroundImageTransparency = Config.BackgroundImageTransparency,
		Duration = ResolveDuration(Config.Duration),
		Buttons = Config.Buttons or {},
		CanClose = Config.CanClose ~= false,
		UIElements = {},
		Closed = false,
	}
	--[[if Notification.CanClose == nil then
        Notification.CanClose = true
    end--]]
	NotificationModule.NotificationIndex = NotificationModule.NotificationIndex + 1
	Notification.Index = NotificationModule.NotificationIndex
	NotificationModule.Notifications[Notification.Index] = Notification

	-- local UIStroke = New("UIStroke", {
	--     ThemeTag = {
	--         Color = "Text"
	--     },
	--     Transparency = 1, -- - .9
	--     Thickness = .6,
	-- })

	local Icon

	if Notification.Icon then
		local IconBubble = Creator.NewRoundFrame(999, "Squircle", {
			Name = "IconBubble",
			Size = UDim2.new(0, 38, 0, 38),
			Position = UDim2.new(0, 10, 0, 10),
			ImageColor3 = Notification.AccentColor,
			ImageTransparency = 0.12,
		}, {
			Creator.NewRoundFrame(999, "SquircleGlass", {
				Size = UDim2.new(1, 1, 1, 1),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = Color3.new(1, 1, 1),
				ImageTransparency = 0.87,
			}),
		})
		Notification.UIElements.IconBubble = IconBubble

		-- if Creator.Icon(Notification.Icon) and Creator.Icon(Notification.Icon)[2] then
		--     Icon = New("ImageLabel", {
		--         Size = UDim2.new(0,26,0,26),
		--         Position = UDim2.new(0,NotificationModule.UIPadding,0,NotificationModule.UIPadding),
		--         BackgroundTransparency = 1,
		--         Image = Creator.Icon(Notification.Icon)[1],
		--         ImageRectSize = Creator.Icon(Notification.Icon)[2].ImageRectSize,
		--         ImageRectOffset = Creator.Icon(Notification.Icon)[2].ImageRectPosition,
		--         ThemeTag = {
		--             ImageColor3 = "Text"
		--         }
		--     })
		-- elseif string.find(Notification.Icon, "rbxassetid") then
		--     Icon = New("ImageLabel", {
		--         Size = UDim2.new(0,26,0,26),
		--         BackgroundTransparency = 1,
		--         Position = UDim2.new(0,NotificationModule.UIPadding,0,NotificationModule.UIPadding),
		--         Image = Notification.Icon
		--     })
		-- end

		Icon = Creator.Image(
			Notification.Icon,
			Notification.Title .. ":" .. Notification.Icon,
			0,
			Config.Window,
			"Notification",
			Notification.IconThemed
		)
		Icon.Size = UDim2.new(0, 22, 0, 22)
		Icon.Position = UDim2.new(0, 29, 0, 29)
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		if Creator.Icon(Notification.Icon) and Notification.IconThemed ~= true then
			PaintIcon(Icon, Color3.new(1, 1, 1), 0)
		end
		-- Icon.LayoutOrder = -1
	end

	local CloseButton
	if Notification.CanClose then
		CloseButton = New("ImageButton", {
			Image = Creator.Icon("x")[1],
			ImageRectSize = Creator.Icon("x")[2].ImageRectSize,
			ImageRectOffset = Creator.Icon("x")[2].ImageRectPosition,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 16, 0, 16),
			Position = UDim2.new(1, -NotificationModule.UIPadding, 0, NotificationModule.UIPadding),
			AnchorPoint = Vector2.new(1, 0),
			ThemeTag = {
				ImageColor3 = "Text",
			},
			ImageTransparency = 0.4,
		}, {
			New("TextButton", {
				Size = UDim2.new(1, 8, 1, 8),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Text = "",
			}),
		})
	end

	local Duration = Creator.NewRoundFrame(NotificationModule.UICorner, "Squircle", {
		Size = UDim2.new(0, 0, 1, 0),
		ImageColor3 = Notification.ProgressColor,
		ImageTransparency = Creator.ClampTransparency(Config.ProgressTransparency, 0.9),
		--Visible = false,
	})

	local TextContainer = New("Frame", {
		Size = UDim2.new(1, Notification.Icon and -52 or 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1,
		AutomaticSize = "Y",
	}, {
		New("UIPadding", {
			PaddingTop = UDim.new(0, NotificationModule.UIPadding),
			PaddingLeft = UDim.new(0, NotificationModule.UIPadding),
			PaddingRight = UDim.new(0, NotificationModule.UIPadding),
			PaddingBottom = UDim.new(0, NotificationModule.UIPadding),
		}),
		New("TextLabel", {
			AutomaticSize = "Y",
			Size = UDim2.new(1, -30 - NotificationModule.UIPadding, 0, 0),
			TextWrapped = true,
			TextXAlignment = "Left",
			RichText = true,
			BackgroundTransparency = 1,
			TextSize = 18,
			ThemeTag = {
				TextColor3 = "NotificationTitle",
				TextTransparency = "NotificationTitleTransparency",
			},
			Text = Notification.Title,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		}),
		New("UIListLayout", {
			Padding = UDim.new(0, NotificationModule.UIPadding / 3),
		}),
	})

	if Notification.Content then
		New("TextLabel", {
			AutomaticSize = "Y",
			Size = UDim2.new(1, 0, 0, 0),
			TextWrapped = true,
			TextXAlignment = "Left",
			RichText = true,
			BackgroundTransparency = 1,
			--TextTransparency = .4,
			TextSize = 15,
			ThemeTag = {
				TextColor3 = "NotificationContent",
				TextTransparency = "NotificationContentTransparency",
			},
			Text = Notification.Content,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			Parent = TextContainer,
		})
	end

	local Main = Creator.NewRoundFrame(NotificationModule.UICorner, "Squircle", {
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(2, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		AutomaticSize = "Y",
		ImageTransparency = 0.05,
		ThemeTag = {
			ImageColor3 = "Notification",
		},
		--ZIndex = 20
	}, {
		Creator.NewRoundFrame(NotificationModule.UICorner, "Squircle", {
			Size = UDim2.new(1, 0, 1, 0),
			ThemeTag = {
				ImageColor3 = "Notification2",
				ImageTransparency = "Notification2Transparency",
			},
		}),
		New("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Name = "DurationFrame",
		}, {
			--[[Creator.NewRoundFrame(NotificationModule.UICorner, "SquircleOutline", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 0.8,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
			}),]]
			New("Frame", {
				Size = UDim2.new(1, 0, 1, 0), -- 0,0,1,0
				BackgroundTransparency = 1,
				ClipsDescendants = true,
			}, {
				Duration,
			}),

			-- New("UICorner", {
			--     CornerRadius = UDim.new(0,NotificationModule.UICorner),
			-- })
		}),
		New("ImageLabel", {
			Name = "Background",
			Image = Notification.Background,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ScaleType = "Crop",
			ImageTransparency = Notification.BackgroundImageTransparency,
			--ZIndex = 19,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, NotificationModule.UICorner),
			}),
		}),
		Creator.NewRoundFrame(NotificationModule.UICorner, "Squircle", {
			Name = "StyleWash",
			Size = UDim2.new(1, 0, 1, 0),
			ImageColor3 = Notification.AccentColor,
			ImageTransparency = 0.9,
		}, {
			New("UIGradient", {
				Rotation = 0,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0.08),
					NumberSequenceKeypoint.new(0.58, 0.74),
					NumberSequenceKeypoint.new(1, 1),
				}),
			}),
		}),
		Creator.NewRoundFrame(999, "Squircle", {
			Name = "Accent",
			Size = UDim2.new(0, 4, 1, -20),
			Position = UDim2.new(0, 8, 0, 10),
			ImageColor3 = Notification.AccentColor,
			ImageTransparency = 0.08,
		}),

		TextContainer,
		Notification.UIElements.IconBubble,
		Icon,
		CloseButton,
		New("UIStroke", {
			Color = Notification.AccentColor,
			Transparency = 0.66,
			Thickness = 1,
		}),
	})

	local MainContainer = New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		Parent = Config.Holder,
	}, {
		Main,
	})

	function Notification:Close()
		if not Notification.Closed then
			Notification.Closed = true
			Motion.Play(
				MainContainer,
				"NotificationClose",
				{ Size = UDim2.new(1, 0, 0, -8) },
				Enum.EasingStyle.Quint,
				Enum.EasingDirection.Out,
				"Close"
			)
			Motion.Play(
				Main,
				"NotificationClose",
				{ Position = UDim2.new(2, 0, 1, 0) },
				Enum.EasingStyle.Quint,
				Enum.EasingDirection.Out,
				"Close"
			)
			task.wait(Motion.GetDuration("NotificationClose") + 0.03)
			NotificationModule.Notifications[Notification.Index] = nil
			MainContainer:Destroy()
		end
	end

	task.spawn(function()
		task.wait()
		Motion.Play(
			MainContainer,
			"Notification",
			{ Size = UDim2.new(1, 0, 0, Main.AbsoluteSize.Y) },
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out,
			"Open"
		)
		Motion.Play(
			Main,
			"Notification",
			{ Position = UDim2.new(0, 0, 1, 0) },
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out,
			"Open"
		)
		if typeof(Notification.Duration) == "number" and Notification.Duration > 0 then
			Duration.Size = UDim2.new(0, Main.DurationFrame.AbsoluteSize.X, 1, 0)
			Tween(
				Main.DurationFrame.Frame,
				Notification.Duration,
				{ Size = UDim2.new(0, 0, 1, 0) },
				Enum.EasingStyle.Linear,
				Enum.EasingDirection.InOut
			):Play()
			task.wait(Notification.Duration)
			Notification:Close()
		end
	end)

	if CloseButton then
		Creator.AddSignal(CloseButton.TextButton.MouseButton1Click, function()
			Notification:Close()
		end)
	end

	--Tween():Play()
	return Notification
end

return NotificationModule
