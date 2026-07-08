local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local Creator = require("../../modules/Creator")
local Motion = require("../../modules/Motion")
local New = Creator.New

local KeyBindMenu = {}

local function ContainsPoint(Object, Position)
	if typeof(Object) ~= "Instance" or not Object.Visible then
		return false
	end

	local AbsolutePosition = Object.AbsolutePosition
	local AbsoluteSize = Object.AbsoluteSize

	return Position.X >= AbsolutePosition.X
		and Position.X <= AbsolutePosition.X + AbsoluteSize.X
		and Position.Y >= AbsolutePosition.Y
		and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y
end

local function NormalizeKey(Value)
	if typeof(Value) == "EnumItem" then
		return Value.Name, Value
	end
	if typeof(Value) == "string" and Enum.KeyCode[Value] then
		return Value, Enum.KeyCode[Value]
	end
	return "None", nil
end

function KeyBindMenu.New(Window, WindUI, Config)
	local MenuConfig = typeof(Window.KeyBindMenu) == "table" and Window.KeyBindMenu or {}
	local IsMobile = (UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled) or Window.IsPC == false
	local Compact = MenuConfig.Compact == true or (MenuConfig.Compact ~= false and IsMobile)
	local RootWidth = MenuConfig.Width or (Compact and 330 or 326)
	local RootHeight = MenuConfig.Height or (Compact and 216 or 230)
	local ContentPadding = Compact and 10 or 14
	local ContentGap = Compact and 9 or 12
	local QuickKeys = MenuConfig.QuickKeys or { "RightShift", "F", "LeftControl" }
	local Menu = {
		Open = false,
		Button = nil,
		Token = 0,
		Capturing = false,
		UserMoved = false,
		StoredPosition = nil,
		TargetPosition = nil,
		UIElements = {},
	}

	local function Notify(Title, Content, Icon)
		if WindUI.Notify then
			WindUI:Notify({
				Title = Title,
				Content = Content,
				Icon = Icon,
			})
		end
	end

	local function GetViewportSize()
		local Camera = Workspace.CurrentCamera
		return Camera and Camera.ViewportSize or Vector2.new(1280, 720)
	end

	local function CreateIcon(IconName, Parent, Size)
		local Icon = Creator.Image(IconName, IconName, 0, Window.Folder, "KeyBindMenu", true, true, "Icon")
		Icon.Size = UDim2.new(0, Size or 16, 0, Size or 16)
		Icon.Parent = Parent
		return Icon
	end

	local function CreateText(Parent, Text, Size, Weight, Transparency)
		return New("TextLabel", {
			BackgroundTransparency = 1,
			Text = Text or "",
			TextSize = Size or 14,
			TextTransparency = Transparency or 0,
			TextXAlignment = "Left",
			TextWrapped = true,
			AutomaticSize = "Y",
			Size = UDim2.new(1, 0, 0, 0),
			Parent = Parent,
			FontFace = Font.new(Creator.Font, Weight or Enum.FontWeight.Medium),
			ThemeTag = {
				TextColor3 = "Text",
			},
		})
	end

	local Root = Creator.NewRoundFrame(Window.ElementConfig.UICorner, "Squircle", {
		Name = "KeyBindMenu",
		Size = UDim2.new(0, RootWidth, 0, RootHeight),
		AnchorPoint = Compact and Vector2.new(0.5, 1) or Vector2.new(1, 0),
		Position = UDim2.fromOffset(0, 0),
		ImageTransparency = 1,
		Visible = false,
		Active = false,
		ClipsDescendants = true,
		ZIndex = 10020,
		Parent = WindUI.ScreenGui,
		ThemeTag = {
			ImageColor3 = "Background",
		},
	}, {
		New("UIScale", {
			Name = "Scale",
			Scale = 0.98,
		}),
		Creator.NewRoundFrame(Window.ElementConfig.UICorner, "SquircleGlass", {
			Name = "GlassLayer",
			Size = UDim2.new(1, 0, 1, 0),
			ImageTransparency = 1,
			ZIndex = 10020,
			ThemeTag = {
				ImageColor3 = "Primary",
			},
		}),
		Creator.NewRoundFrame(Window.ElementConfig.UICorner, "SquircleOutline", {
			Name = "Outline",
			Size = UDim2.new(1, 0, 1, 0),
			ImageTransparency = 1,
			ZIndex = 10021,
			ThemeTag = {
				ImageColor3 = "Outline",
			},
		}),
	})

	local Scrim = New("Frame", {
		Name = "KeyBindScrim",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 1,
		Visible = false,
		Active = false,
		ZIndex = 10018,
		Parent = WindUI.ScreenGui,
	})

	local Content = New("CanvasGroup", {
		Name = "Content",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		GroupTransparency = 1,
		ZIndex = 10022,
		Parent = Root,
	}, {
		New("UIPadding", {
			PaddingTop = UDim.new(0, ContentPadding),
			PaddingLeft = UDim.new(0, ContentPadding),
			PaddingRight = UDim.new(0, ContentPadding),
			PaddingBottom = UDim.new(0, ContentPadding),
		}),
		New("UIListLayout", {
			Padding = UDim.new(0, ContentGap),
			FillDirection = "Vertical",
			HorizontalAlignment = "Left",
			SortOrder = "LayoutOrder",
		}),
	})

	Menu.UIElements.Root = Root
	Menu.UIElements.Scale = Root.Scale
	Menu.UIElements.Scrim = Scrim
	Menu.UIElements.Content = Content
	Menu.UIElements.GlassLayer = Root.GlassLayer
	Menu.UIElements.Outline = Root.Outline

	local function IsImageBackground(Value)
		if typeof(Value) ~= "string" then
			return false
		end
		if string.sub(Value, 1, 1) == "#" then
			return false
		end
		if string.match(Value, "^video:") then
			return false
		end
		return Value ~= ""
	end

	local function ApplyBackgroundMedia()
		if MenuConfig.UseWindowBackground == false then
			return
		end

		local Gradient = MenuConfig.BackgroundGradient
			or (typeof(MenuConfig.Background) == "table" and MenuConfig.Background)
			or Window.BackgroundGradient
			or (typeof(Window.Background) == "table" and Window.Background)
		local Image = MenuConfig.BackgroundImage
			or (IsImageBackground(MenuConfig.Background) and MenuConfig.Background)
			or (IsImageBackground(Window.Background) and Window.Background)

		if Image then
			Menu.UIElements.BackgroundImage = New("ImageLabel", {
				Name = "BackgroundImage",
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Image = tostring(Image),
				ImageTransparency = MenuConfig.BackgroundImageTransparency or Window.BackgroundImageTransparency or 0.46,
				ScaleType = MenuConfig.BackgroundScaleType or Window.BackgroundScaleType or "Crop",
				ZIndex = 10019,
				Parent = Root,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, Window.ElementConfig.UICorner),
				}),
			})
		end

		if Gradient then
			local UIGradient = New("UIGradient")
			for Key, Value in next, Gradient do
				UIGradient[Key] = Value
			end

			Menu.UIElements.BackgroundGradient = Creator.NewRoundFrame(Window.ElementConfig.UICorner, "Squircle", {
				Name = "BackgroundGradient",
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = MenuConfig.BackgroundGradientTransparency
					or MenuConfig.BackgroundOverlayTransparency
					or Window.BackgroundOverlayTransparency
					or 0.55,
				ZIndex = 10019,
				Parent = Root,
			}, {
				UIGradient,
			})
		end
	end

	ApplyBackgroundMedia()

	local Handle = New("Frame", {
		Name = "DragHandle",
		Size = UDim2.new(1, 0, 0, 8),
		BackgroundTransparency = 1,
		LayoutOrder = 0,
		Visible = Compact,
		Parent = Content,
	}, {
		New("Frame", {
			Size = UDim2.new(0, 42, 0, 4),
			Position = UDim2.new(0.5, 0, 0, 1),
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.72,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(1, 0),
			}),
		}),
	})

	local Header = New("Frame", {
		Name = "Header",
		Size = UDim2.new(1, 0, 0, Compact and 34 or 42),
		BackgroundTransparency = 1,
		Active = true,
		LayoutOrder = 1,
		Parent = Content,
	}, {
		New("UIListLayout", {
			Padding = UDim.new(0, Compact and 8 or 10),
			FillDirection = "Horizontal",
			VerticalAlignment = "Center",
		}),
	})

	local HeaderGlyph = CreateIcon("keyboard", nil, Compact and 15 or 18)
	local HeaderIcon = Creator.NewRoundFrame(999, "Squircle", {
		Size = UDim2.new(0, Compact and 32 or 38, 0, Compact and 32 or 38),
		ImageTransparency = 0.86,
		Parent = Header,
		ThemeTag = {
			ImageColor3 = "Primary",
		},
	}, {
		HeaderGlyph,
	})
	HeaderGlyph.Position = UDim2.new(0.5, 0, 0.5, 0)
	HeaderGlyph.AnchorPoint = Vector2.new(0.5, 0.5)

	local HeaderText = New("Frame", {
		Size = UDim2.new(1, Compact and -78 or -48, 0, 0),
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		Parent = Header,
	}, {
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding = UDim.new(0, 2),
		}),
	})
	CreateText(HeaderText, MenuConfig.Title or (Compact and "Keybind" or "KeyBind Menu"), Compact and 14 or 16, Enum.FontWeight.Bold, 0)
	local HeaderDesc = CreateText(
		HeaderText,
		MenuConfig.Desc or (Compact and "Mobile quick toggle controls." or "Set the window toggle shortcut."),
		Compact and 11 or 12,
		Enum.FontWeight.Medium,
		0.42
	)
	if MenuConfig.HideDesc ~= nil then
		HeaderDesc.Visible = not MenuConfig.HideDesc
	else
		HeaderDesc.Visible = not Compact
	end

	local CloseIcon = CreateIcon("x", nil, 13)
	local CloseButton = Creator.NewRoundFrame(999, "Squircle", {
		Size = Compact and UDim2.new(0, 28, 0, 28) or UDim2.new(0, 0, 0, 0),
		ImageTransparency = 0.9,
		Visible = Compact,
		Parent = Header,
		ThemeTag = {
			ImageColor3 = "ElementBackground",
		},
	}, {
		CloseIcon,
	})
	CloseIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
	CloseIcon.AnchorPoint = Vector2.new(0.5, 0.5)

	Creator.AddSignal(CloseButton.MouseButton1Click, function()
		Menu:CloseMenu()
	end)

	local CurrentPanel = Creator.NewRoundFrame(16, "Squircle", {
		Size = UDim2.new(1, 0, 0, Compact and 48 or 58),
		ImageTransparency = Compact and 0.8 or 0.88,
		LayoutOrder = 2,
		Parent = Content,
		ThemeTag = {
			ImageColor3 = "ElementBackground",
		},
	}, {
		New("UIStroke", {
			ApplyStrokeMode = "Border",
			Color = Color3.new(1, 1, 1),
			Transparency = Compact and 0.8 or 0.88,
			Thickness = 1,
		}),
		New("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
		}),
		New("UIListLayout", {
			FillDirection = "Horizontal",
			VerticalAlignment = "Center",
		}),
	})

	local CurrentKeyName = NormalizeKey(Window.ToggleKey or MenuConfig.DefaultKey or MenuConfig.Value)
	local CurrentLabel = New("TextLabel", {
		Size = UDim2.new(0.4, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "Current",
		TextSize = Compact and 11 or 12,
		TextXAlignment = "Left",
		TextTransparency = 0.44,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
		Parent = CurrentPanel,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	local CurrentKey = New("TextLabel", {
		Size = UDim2.new(0.6, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = CurrentKeyName,
		TextSize = Compact and 16 or 18,
		TextXAlignment = "Right",
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Bold),
		Parent = CurrentPanel,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	local Actions = New("Frame", {
		Size = UDim2.new(1, 0, 0, Compact and 38 or 38),
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Parent = Content,
	}, {
		New("UIListLayout", {
			Padding = UDim.new(0, 8),
			FillDirection = "Horizontal",
			HorizontalAlignment = "Center",
		}),
	})

	local function CreateButton(Parent, Title, IconName, Variant, Callback)
		local Button = Creator.NewRoundFrame(14, "Squircle", {
			Size = UDim2.new(0.5, -4, 1, 0),
			ImageTransparency = Variant == "Primary" and (Compact and 0.08 or 0.18) or (Compact and 0.84 or 0.9),
			Parent = Parent,
			ThemeTag = {
				ImageColor3 = Variant == "Primary" and "Primary" or "ElementBackground",
			},
		}, {
			New("UIPadding", {
				PaddingLeft = UDim.new(0, Compact and 8 or 10),
				PaddingRight = UDim.new(0, Compact and 8 or 10),
			}),
			New("UIListLayout", {
				Padding = UDim.new(0, Compact and 5 or 7),
				FillDirection = "Horizontal",
				VerticalAlignment = "Center",
				HorizontalAlignment = "Center",
			}),
			IconName and CreateIcon(IconName, nil, Compact and 13 or 15) or nil,
			New("TextLabel", {
				Name = "Title",
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = "X",
				BackgroundTransparency = 1,
				Text = Title,
				TextSize = Compact and 12 or 13,
				FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = "Text",
				},
			}),
		}, true)

		Motion.AttachPress(Button, Creator, {
			Amount = 0.97,
		})

		Creator.AddSignal(Button.MouseButton1Click, function()
			Creator.SafeCallback(Callback)
		end)

		return Button
	end

	local CaptureConnection

	local function ApplyKey(KeyCode, Silent)
		local Name, EnumKey = NormalizeKey(KeyCode)
		Window:SetToggleKey(EnumKey)
		CurrentKey.Text = Name
		if not Silent then
			Notify("Keybind updated", EnumKey and ("Toggle key: " .. Name) or "Toggle key cleared.", "keyboard")
		end
	end

	local function StopCapture()
		Menu.Capturing = false
		if CaptureConnection then
			CaptureConnection:Disconnect()
			CaptureConnection = nil
		end
	end

	function Menu:Capture()
		if Menu.Capturing then
			return
		end

		Menu.Capturing = true
		CurrentKey.Text = "Press key..."

		CaptureConnection = UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType ~= Enum.UserInputType.Keyboard then
				return
			end
			if Input.KeyCode == Enum.KeyCode.Unknown then
				return
			end
			if Input.KeyCode == Enum.KeyCode.Escape then
				StopCapture()
				local Name = NormalizeKey(Window.ToggleKey)
				CurrentKey.Text = Name
				return
			end

			ApplyKey(Input.KeyCode)
			StopCapture()
		end)
	end

	local SetButton = CreateButton(Actions, Compact and "Bind" or "Set Key", "scan-line", "Primary", function()
		Menu:Capture()
	end)
	local ClearButton = CreateButton(Actions, "Clear", "x", "Secondary", function()
		StopCapture()
		ApplyKey(nil)
	end)

	local QuickRow = New("Frame", {
		Name = "QuickKeys",
		Size = UDim2.new(1, 0, 0, Compact and 34 or 32),
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Parent = Content,
	}, {
		New("UIListLayout", {
			Padding = UDim.new(0, 6),
			FillDirection = "Horizontal",
			HorizontalAlignment = "Center",
		}),
	})

	local function ShortKeyName(KeyName)
		local Text = tostring(KeyName)
		if not Compact then
			return Text
		end

		Text = Text:gsub("Right", "R")
		Text = Text:gsub("Left", "L")
		Text = Text:gsub("Control", "Ctrl")
		return Text
	end

	for _, KeyName in next, QuickKeys do
		local _, EnumKey = NormalizeKey(KeyName)
		if EnumKey then
			CreateButton(QuickRow, ShortKeyName(KeyName), nil, "Secondary", function()
				StopCapture()
				ApplyKey(EnumKey)
			end).Size = UDim2.new(1 / #QuickKeys, -4, 1, 0)
		end
	end

	if Window.ToggleKey == nil and MenuConfig.DefaultKey and MenuConfig.ApplyDefault ~= false then
		local _, DefaultKey = NormalizeKey(MenuConfig.DefaultKey)
		if DefaultKey then
			ApplyKey(DefaultKey, true)
		end
	end

	local function UpdateRootPosition()
		local Viewport = GetViewportSize()
		local Margin = 12

		if Compact then
			RootWidth = math.min(MenuConfig.Width or 330, math.max(240, Viewport.X - (Margin * 2)))
			RootHeight = MenuConfig.Height or 216
			Root.Size = UDim2.fromOffset(RootWidth, RootHeight)
			Root.AnchorPoint = Vector2.new(0.5, 1)
			Menu.TargetPosition = UDim2.fromOffset(Viewport.X / 2, Viewport.Y - Margin)
			Root.Position = Menu.TargetPosition
			Scrim.Size = UDim2.fromOffset(Viewport.X, Viewport.Y)

			if Menu.UserMoved and Menu.StoredPosition then
				Root.Position = Menu.StoredPosition
				Menu.TargetPosition = Menu.StoredPosition
			end

			return
		end

		local X = Viewport.X - Margin
		local Y = Margin + Window.Topbar.Height

		if Menu.Button and Menu.Button.AbsoluteSize.X > 0 then
			local ButtonPosition = Menu.Button.AbsolutePosition
			local ButtonSize = Menu.Button.AbsoluteSize
			X = ButtonPosition.X + ButtonSize.X
			Y = ButtonPosition.Y + ButtonSize.Y + 10
		end

		if X - RootWidth < Margin then
			X = math.min(Viewport.X - Margin, Margin + RootWidth)
		end
		if Y + RootHeight > Viewport.Y - Margin then
			Y = math.max(Margin, Viewport.Y - RootHeight - Margin)
		end

		Root.Position = UDim2.fromOffset(X, Y)
		Menu.TargetPosition = Root.Position
		Scrim.Size = UDim2.fromOffset(Viewport.X, Viewport.Y)

		if Menu.UserMoved and Menu.StoredPosition then
			Root.Position = Menu.StoredPosition
		end
	end

	function Menu:SetButton(Button)
		Menu.Button = Button
	end

	local DragModule = Creator.Drag(Root, { Header, Handle }, function(Dragging)
		if not Dragging then
			Menu.UserMoved = true
			Menu.StoredPosition = Root.Position
		end
	end)
	Menu.UIElements.Drag = DragModule

	function Menu:OpenMenu()
		if Menu.Open then
			return
		end

		Menu.Open = true
		Menu.Token += 1
		UpdateRootPosition()
		local TargetPosition = Menu.TargetPosition or Root.Position
		Root.Visible = true
		Root.Active = true
		Scrim.Visible = true
		if Compact then
			Root.Position = UDim2.new(
				TargetPosition.X.Scale,
				TargetPosition.X.Offset,
				TargetPosition.Y.Scale,
				TargetPosition.Y.Offset + 18
			)
		end
		Root.ImageTransparency = 1
		Content.GroupTransparency = 1
		Root.GlassLayer.ImageTransparency = 1
		Root.Outline.ImageTransparency = 1
		Root.Scale.Scale = 0.98
		Scrim.BackgroundTransparency = 1
		Motion.Play(Root, "DropdownOpen", {
			ImageTransparency = Compact and 0.06 or 0.18,
			Position = TargetPosition,
		}, nil, nil, "KeyBindMenu")
		Motion.Play(Content, "DropdownOpen", { GroupTransparency = 0 }, nil, nil, "KeyBindContent")
		Motion.Play(Root.GlassLayer, "DropdownOpen", { ImageTransparency = Compact and 0.9 or 0.78 }, nil, nil, "KeyBindGlass")
		Motion.Play(Root.Outline, "DropdownOpen", { ImageTransparency = Compact and 0.5 or 0.72 }, nil, nil, "KeyBindOutline")
		Motion.Play(Root.Scale, "DropdownOpen", { Scale = 1 }, nil, nil, "KeyBindScale")
		Motion.Play(
			Scrim,
			"DropdownOpen",
			{ BackgroundTransparency = MenuConfig.ScrimTransparency or (Compact and 0.62 or 0.78) },
			nil,
			nil,
			"KeyBindScrim"
		)
	end

	function Menu:CloseMenu()
		if not Menu.Open then
			return
		end

		Menu.Open = false
		Menu.Token += 1
		local Token = Menu.Token
		StopCapture()
		Root.Active = false
		local ClosePosition = Root.Position
		if Compact then
			ClosePosition = UDim2.new(
				Root.Position.X.Scale,
				Root.Position.X.Offset,
				Root.Position.Y.Scale,
				Root.Position.Y.Offset + 18
			)
		end
		Motion.Play(Root, "DropdownClose", { ImageTransparency = 1, Position = ClosePosition }, nil, nil, "KeyBindMenu")
		Motion.Play(Content, "DropdownClose", { GroupTransparency = 1 }, nil, nil, "KeyBindContent")
		Motion.Play(Root.GlassLayer, "DropdownClose", { ImageTransparency = 1 }, nil, nil, "KeyBindGlass")
		Motion.Play(Root.Outline, "DropdownClose", { ImageTransparency = 1 }, nil, nil, "KeyBindOutline")
		Motion.Play(Root.Scale, "DropdownClose", { Scale = 0.98 }, nil, nil, "KeyBindScale")
		Motion.Play(Scrim, "DropdownClose", { BackgroundTransparency = 1 }, nil, nil, "KeyBindScrim")
		task.delay(Motion.GetDuration("DropdownClose"), function()
			if Token == Menu.Token then
				Root.Visible = false
				Scrim.Visible = false
			end
		end)
	end

	function Menu:Toggle()
		if Menu.Open then
			Menu:CloseMenu()
		else
			Menu:OpenMenu()
		end
	end

	Creator.AddSignal(UserInputService.InputBegan, function(Input)
		if not Menu.Open then
			return
		end
		if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		if ContainsPoint(Root, Input.Position) or ContainsPoint(Menu.Button, Input.Position) then
			return
		end
		Menu:CloseMenu()
	end)

	Menu.UIElements.CurrentKey = CurrentKey
	Menu.UIElements.SetButton = SetButton
	Menu.UIElements.ClearButton = ClearButton

	return Menu
end

return KeyBindMenu
