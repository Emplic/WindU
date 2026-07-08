local KeySystem = {}

local Creator = require("../modules/Creator")
local Motion = require("../modules/Motion")
local New = Creator.New
local Workspace = game:GetService("Workspace")

local CreateButton = require("./ui/Button").New
local CreateInput = require("./ui/Input").New

local function GetViewportSize()
	local Camera = Workspace.CurrentCamera
	return Camera and Camera.ViewportSize or Vector2.new(1280, 720)
end

function KeySystem.new(Config, Filename, func, keyValidator)
	local KeyDialogInit = require("./window/Dialog")
	local KeyDialog = KeyDialogInit.Create(true, "Popup", Config.Window, Config.WindUI, Config.WindUI.ScreenGui.KeySystem)

	local Services = {}

	local EnteredKey

	local ViewportSize = GetViewportSize()
	local IsCompact = ViewportSize.X < 560
	local UseThumbnail = Config.KeySystem.Thumbnail and Config.KeySystem.Thumbnail.Image and not IsCompact
	local ThumbnailSize = (UseThumbnail and Config.KeySystem.Thumbnail.Width) or 200

	local UISize = Config.KeySystem.Width or 430
	if UseThumbnail then
		UISize = 430 + (ThumbnailSize / 2)
	end
	UISize = math.floor(math.min(UISize, math.max(300, ViewportSize.X - 24)))

	KeyDialog.UIElements.Main.AutomaticSize = "Y"
	KeyDialog.UIElements.Main.Size = UDim2.new(0, UISize, 0, 0)
	KeyDialog.UIElements.MainContainer.ClipsDescendants = true

	local DialogScale = New("UIScale", {
		Name = "Scale",
		Scale = 0.96,
		Parent = KeyDialog.UIElements.MainContainer,
	})

	Creator.NewRoundFrame(26, "SquircleGlass", {
		Name = "GlassLayer",
		Size = UDim2.new(1, 1, 1, 1),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		ImageTransparency = 0.84,
		ZIndex = 9998,
		Parent = KeyDialog.UIElements.MainContainer,
		ThemeTag = {
			ImageColor3 = "Primary",
		},
	})

	Creator.NewRoundFrame(26, "SquircleOutline", {
		Name = "Outline",
		Size = UDim2.new(1, 0, 1, 0),
		ImageTransparency = 0.62,
		ZIndex = 9998,
		Parent = KeyDialog.UIElements.MainContainer,
		ThemeTag = {
			ImageColor3 = "Outline",
		},
	})

	local IconFrame

	if Config.Icon then
		IconFrame =
			Creator.Image(Config.Icon, Config.Title .. ":" .. Config.Icon, 0, "Temp", "KeySystem", Config.IconThemed)
		IconFrame.Size = UDim2.new(0, 24, 0, 24)
		IconFrame.LayoutOrder = -1
	end

	local Title = New("TextLabel", {
		AutomaticSize = "XY",
		BackgroundTransparency = 1,
		Text = Config.KeySystem.Title or Config.Title,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		ThemeTag = {
			TextColor3 = "Text",
		},
		TextSize = 20,
	})

	local KeySystemTitle = New("TextLabel", {
		AutomaticSize = "Y",
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		Text = Config.KeySystem.Subtitle or Config.KeySystem.Description or "Secure access gate",
		TextXAlignment = "Left",
		TextTransparency = 0.34,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
		ThemeTag = {
			TextColor3 = "Text",
		},
		TextSize = 13,
	})

	local IconAndTitleContainer = New("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = "XY",
	}, {
		New("UIListLayout", {
			Padding = UDim.new(0, 14),
			FillDirection = "Horizontal",
			VerticalAlignment = "Center",
		}),
		IconFrame,
		Title,
	})

	local StatusText = New("TextLabel", {
		BackgroundTransparency = 1,
		Text = "Waiting",
		TextSize = 12,
		TextTransparency = 0.08,
		AutomaticSize = "XY",
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Bold),
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	local StatusPill = Creator.NewRoundFrame(999, "Squircle", {
		Size = UDim2.new(0, 0, 0, 28),
		AutomaticSize = "X",
		ImageTransparency = 0.84,
		ThemeTag = {
			ImageColor3 = "ElementBackground",
		},
	}, {
		New("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
		}),
		New("UIListLayout", {
			FillDirection = "Horizontal",
			VerticalAlignment = "Center",
			Padding = UDim.new(0, 6),
		}),
		Creator.NewRoundFrame(999, "Squircle", {
			Name = "Dot",
			Size = UDim2.fromOffset(7, 7),
			ImageTransparency = 0,
			ThemeTag = {
				ImageColor3 = "Primary",
			},
		}),
		StatusText,
	})

	local HeaderTop = New("Frame", {
		AutomaticSize = "Y",
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			Padding = UDim.new(0, 10),
			FillDirection = "Horizontal",
			VerticalAlignment = "Center",
		}),
		IconAndTitleContainer,
		StatusPill,
	})

	IconAndTitleContainer.Size = UDim2.new(1, -112, 0, 0)

	local TitleContainer = Creator.NewRoundFrame(18, "Squircle", {
		AutomaticSize = "Y",
		Size = UDim2.new(1, 0, 0, 0),
		ImageTransparency = 0.86,
		ThemeTag = {
			ImageColor3 = "ElementBackground",
		},
	}, {
		New("UIGradient", {
			Rotation = 18,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.06),
				NumberSequenceKeypoint.new(1, 0.34),
			}),
		}),
		New("UIPadding", {
			PaddingTop = UDim.new(0, 14),
			PaddingLeft = UDim.new(0, 14),
			PaddingRight = UDim.new(0, 14),
			PaddingBottom = UDim.new(0, 14),
		}),
		New("UIListLayout", {
			Padding = UDim.new(0, 6),
			FillDirection = "Vertical",
		}),
		HeaderTop,
		KeySystemTitle,
	})

	local InputFrame = CreateInput(Config.KeySystem.Placeholder or "Enter Key", "key", nil, "Input", function(k)
		EnteredKey = k
	end)

	local NoteText
	if Config.KeySystem.Note and Config.KeySystem.Note ~= "" then
		NoteText = New("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = "Y",
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			TextXAlignment = "Left",
			Text = Config.KeySystem.Note,
			TextSize = 18,
			TextTransparency = 0.4,
			ThemeTag = {
				TextColor3 = "Text",
			},
			BackgroundTransparency = 1,
			RichText = true,
			TextWrapped = true,
		})
	end

	local ProgressFill = Creator.NewRoundFrame(999, "Squircle", {
		Name = "Fill",
		Size = UDim2.new(0.18, 0, 1, 0),
		ImageTransparency = 0.06,
		ThemeTag = {
			ImageColor3 = "Primary",
		},
	})
	local ProgressText = New("TextLabel", {
		Size = UDim2.new(1, 0, 0, 16),
		BackgroundTransparency = 1,
		Text = "Access check ready",
		TextSize = 12,
		TextTransparency = 0.34,
		TextXAlignment = "Left",
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
		ThemeTag = {
			TextColor3 = "Text",
		},
	})
	local ProgressCard = New("Frame", {
		Size = UDim2.new(1, 0, 0, 30),
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding = UDim.new(0, 6),
		}),
		ProgressText,
		Creator.NewRoundFrame(999, "Squircle", {
			Size = UDim2.new(1, 0, 0, 8),
			ImageTransparency = 0.86,
			ThemeTag = {
				ImageColor3 = "ElementBackground",
			},
		}, {
			ProgressFill,
		}),
	})

	local function SetState(Text, Progress, IsError)
		StatusText.Text = tostring(Text or StatusText.Text)
		ProgressText.Text = tostring(Text or ProgressText.Text)
		if IsError then
			StatusPill.Dot.ImageColor3 = Color3.fromRGB(255, 94, 94)
		else
			Creator.SetThemeTag(StatusPill.Dot, {
				ImageColor3 = "Primary",
			}, 0.12)
		end
		if Progress ~= nil then
			Motion.Play(ProgressFill, "Switch", {
				Size = UDim2.new(math.clamp(tonumber(Progress) or 0, 0, 1), 0, 1, 0),
			}, nil, nil, "KeySystemProgress")
		end
	end

	local ButtonsContainer = New("Frame", {
		Size = UDim2.new(1, 0, 0, 42),
		BackgroundTransparency = 1,
	}, {
		New("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = "X",
			Size = UDim2.new(0, 0, 1, 0),
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 18 / 2),
				FillDirection = "Horizontal",
			}),
		}),
	})

	local ThumbnailFrame
	if UseThumbnail then
		local ThumbnailTitle
		if Config.KeySystem.Thumbnail.Title then
			ThumbnailTitle = New("TextLabel", {
				Text = Config.KeySystem.Thumbnail.Title,
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 18,
				FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
			})
		end
		ThumbnailFrame = New("ImageLabel", {
			Image = Config.KeySystem.Thumbnail.Image,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ThumbnailSize, 1, -12),
			Position = UDim2.new(0, 6, 0, 6),
			Parent = KeyDialog.UIElements.Main,
			ScaleType = "Crop",
		}, {
			ThumbnailTitle,
			New("UICorner", {
				CornerRadius = UDim.new(0, 26 - 6),
			}),
		})
	end

	local MainFrame = New("Frame", {
		--AutomaticSize = "XY",
		Size = UDim2.new(1, ThumbnailFrame and -ThumbnailSize or 0, 1, 0),
		Position = UDim2.new(0, ThumbnailFrame and ThumbnailSize or 0, 0, 0),
		BackgroundTransparency = 1,
		Parent = KeyDialog.UIElements.Main,
	}, {
		New("Frame", {
			--AutomaticSize = "XY",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 18),
				FillDirection = "Vertical",
			}),
			TitleContainer,
			NoteText,
			InputFrame,
			ProgressCard,
			ButtonsContainer,
			New("UIPadding", {
				PaddingTop = UDim.new(0, 16),
				PaddingLeft = UDim.new(0, 16),
				PaddingRight = UDim.new(0, 16),
				PaddingBottom = UDim.new(0, 16),
			}),
		}),
	})

	-- for _, values in next, KeySystemButtons do
	--     CreateButton(values.Title, values.Icon, values.Callback, values.Variant)
	-- end

	local ExitButton = CreateButton("Exit", "log-out", function()
		KeyDialog:Close()()
	end, "Tertiary", ButtonsContainer.Frame)

	if ThumbnailFrame then
		ExitButton.Parent = ThumbnailFrame
		ExitButton.Size = UDim2.new(0, 0, 0, 42)
		ExitButton.Position = UDim2.new(0, 10, 1, -10)
		ExitButton.AnchorPoint = Vector2.new(0, 1)
	end

	if Config.KeySystem.URL then
		CreateButton("Get key", "key", function()
			if setclipboard then
				setclipboard(Config.KeySystem.URL)
			end
			SetState("Key link copied", 0.36)
		end, "Secondary", ButtonsContainer.Frame)
	end

	if Config.KeySystem.API then
		-- local Icons = {
		--     platoboost = "rbxassetid://75920162824531",
		--     pandadevelopment = "panda",
		-- }
		-- local Names = {
		--     platoboost = "Platoboost",
		--     pandadevelopment = "Panda Development",
		-- }
		local Width = math.min(240, math.max(190, UISize - 42))
		local Opened = false
		local ButtonFrame = CreateButton("Get key", "key", nil, "Secondary", ButtonsContainer.Frame)

		local Divider = Creator.NewRoundFrame(99, "Squircle", {
			Size = UDim2.new(0, 1, 1, 0),
			ThemeTag = {
				ImageColor3 = "Text",
			},
			ImageTransparency = 0.9,
		})

		local DividerContainer = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = "X",
			Parent = ButtonFrame.Frame,
		}, {
			Divider,
			New("UIPadding", {
				PaddingLeft = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
			}),
		})

		local ChevronDown = Creator.Image("chevron-down", "chevron-down", 0, "Temp", "KeySystem", true)

		ChevronDown.Size = UDim2.new(1, 0, 1, 0)

		local IconContainer = New("Frame", {
			Size = UDim2.new(0, 24 - 3, 0, 24 - 3),
			Parent = ButtonFrame.Frame,
			BackgroundTransparency = 1,
		}, {
			ChevronDown,
		})

		local DropdownFrame = Creator.NewRoundFrame(15, "Squircle", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = "Y",
			ThemeTag = {
				ImageColor3 = "Background",
			},
		}, {
			New("UIPadding", {
				PaddingTop = UDim.new(0, 10 / 2),
				PaddingLeft = UDim.new(0, 10 / 2),
				PaddingRight = UDim.new(0, 10 / 2),
				PaddingBottom = UDim.new(0, 10 / 2),
			}),
			New("UIListLayout", {
				FillDirection = "Vertical",
				Padding = UDim.new(0, 10 / 2),
			}),
		})

		local DropdownContainer = New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, Width, 0, 0),
			ClipsDescendants = true,
			AnchorPoint = Vector2.new(1, 0),
			Parent = ButtonFrame,
			Position = UDim2.new(1, 0, 1, 15),
		}, {
			DropdownFrame,
		})

		New("TextLabel", {
			Text = "Select Service",
			BackgroundTransparency = 1,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			ThemeTag = { TextColor3 = "Text" },
			TextTransparency = 0.2,
			TextSize = 16,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = "Y",
			TextWrapped = true,
			TextXAlignment = "Left",
			Parent = DropdownFrame,
		}, {
			New("UIPadding", {
				PaddingTop = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10),
			}),
		})

		for _, i in next, Config.KeySystem.API do
			local serviceDef = Config.WindUI.Services[i.Type]
			if serviceDef then
				local args = {}
				for _, argName in next, serviceDef.Args do
					table.insert(args, i[argName])
				end

				local serviceInstance = serviceDef.New(table.unpack(args))
				serviceInstance.Type = i.Type
				table.insert(Services, serviceInstance)

				local ServiceIcon = i.Icon or serviceDef.Icon or "key-round"
				local IconFrame = Creator.Image(ServiceIcon, ServiceIcon, 0, "Temp", "KeySystem", true)
				IconFrame.Size = UDim2.new(0, 24, 0, 24)

				local APIFrame = Creator.NewRoundFrame(10, "Squircle", {
					Size = UDim2.new(1, 0, 0, 0),
					ThemeTag = { ImageColor3 = "Text" },
					ImageTransparency = 1,
					Parent = DropdownFrame,
					AutomaticSize = "Y",
				}, {
					New("UIListLayout", {
						FillDirection = "Horizontal",
						Padding = UDim.new(0, 10),
						VerticalAlignment = "Center",
					}),
					IconFrame,
					New("UIPadding", {
						PaddingTop = UDim.new(0, 10),
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10),
						PaddingBottom = UDim.new(0, 10),
					}),
					New("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -24 - 10, 0, 0),
						AutomaticSize = "Y",
					}, {
						New("UIListLayout", {
							FillDirection = "Vertical",
							Padding = UDim.new(0, 5),
							HorizontalAlignment = "Center",
						}),
						New("TextLabel", {
							Text = i.Title or serviceDef.Name,
							BackgroundTransparency = 1,
							FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
							ThemeTag = { TextColor3 = "Text" },
							TextTransparency = 0.05,
							TextSize = 18,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = "Y",
							TextWrapped = true,
							TextXAlignment = "Left",
						}),
						New("TextLabel", {
							Text = i.Desc or "",
							BackgroundTransparency = 1,
							FontFace = Font.new(Creator.Font, Enum.FontWeight.Regular),
							ThemeTag = { TextColor3 = "Text" },
							TextTransparency = 0.2,
							TextSize = 16,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = "Y",
							TextWrapped = true,
							Visible = i.Desc and true or false,
							TextXAlignment = "Left",
						}),
					}),
				}, true)

				Creator.AddSignal(APIFrame.MouseEnter, function()
					Motion.Play(APIFrame, "Hover", { ImageTransparency = 0.94 }, nil, nil, "ServiceHover")
				end)
				Creator.AddSignal(APIFrame.InputEnded, function()
					Motion.Play(APIFrame, "Hover", { ImageTransparency = 1 }, nil, nil, "ServiceHover")
				end)
				Motion.AttachPress(APIFrame, Creator, {
					Amount = 0.985,
				})
				Creator.AddSignal(APIFrame.MouseButton1Click, function()
					serviceInstance.Copy()
					SetState("Key link copied", 0.36)
					Config.WindUI:Notify({
						Title = "Key System",
						Content = "Key link copied to clipboard.",
						Icon = "key",
					})
				end)
			end
		end

		Creator.AddSignal(ButtonFrame.MouseButton1Click, function()
			if not Opened then
				Motion.Play(
					DropdownContainer,
					"Expand",
					{ Size = UDim2.new(0, Width, 0, DropdownFrame.AbsoluteSize.Y + 1) },
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out,
					"KeyService"
				)
				Motion.Play(ChevronDown, "Expand", { Rotation = 180 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, "KeyServiceChevron")
			else
				Motion.Play(
					DropdownContainer,
					"Expand",
					{ Size = UDim2.new(0, Width, 0, 0) },
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out,
					"KeyService"
				)
				Motion.Play(ChevronDown, "Expand", { Rotation = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, "KeyServiceChevron")
			end
			Opened = not Opened
		end)
	end

	local function handleSuccess(key, ShouldSave)
		SetState("Access granted", 1)
		KeyDialog:Close()()
		if ShouldSave and writefile then
			pcall(function()
				writefile((Config.Folder or "Temp") .. "/" .. Filename .. ".key", tostring(key))
			end)
		end
		task.wait(0.35)
		func(true)
	end

	local IsChecking = false
	local SubmitButton = CreateButton("Submit", "arrow-right", function()
		if IsChecking then
			return
		end
		IsChecking = true
		SetState("Checking key", 0.72)

		local key = tostring(EnteredKey or "empty")
		local function Reject(Message)
			IsChecking = false
			SetState("Invalid key", 0.08, true)
			Config.WindUI:Notify({
				Title = "Key System",
				Content = Message or "Invalid key.",
				Icon = "triangle-alert",
			})
		end

		if Config.KeySystem.KeyValidator then
			local ValidatorOk, isValid, Message = pcall(Config.KeySystem.KeyValidator, key)
			if not ValidatorOk then
				Reject(tostring(isValid))
				return
			end

			if isValid then
				handleSuccess(key, Config.KeySystem.SaveKey)
			else
				Reject(Message or "Invalid key.")
			end
		elseif not Config.KeySystem.API then
			local isKey = type(Config.KeySystem.Key) == "table" and table.find(Config.KeySystem.Key, key)
				or Config.KeySystem.Key == key

			if isKey then
				handleSuccess(key, Config.KeySystem.SaveKey)
			else
				Reject("Invalid key.")
			end
		else
			local isSuccess, result
			for _, service in next, Services do
				local VerifyOk, success, res = pcall(service.Verify, key)
				if not VerifyOk then
					local ErrorMessage = success
					success = false
					res = tostring(ErrorMessage)
				end
				if success then
					isSuccess, result = true, res
					break
				end
				result = res
			end

			if isSuccess then
				handleSuccess(key, Config.KeySystem.SaveKey ~= false)
			else
				Reject(result or "Invalid key.")
			end
		end
	end, "Primary", ButtonsContainer)

	SubmitButton.AnchorPoint = Vector2.new(1, 0.5)
	SubmitButton.Position = UDim2.new(1, 0, 0.5, 0)

	-- TitleContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
	--     KeyDialog.UIElements.Main.Size = UDim2.new(
	--         0,
	--         TitleContainer.AbsoluteSize.X +24+24+24+24+9,
	--         0,
	--         0
	--     )
	-- end)

	SetState("Waiting for key", 0.18)
	KeyDialog:Open()
	Motion.Play(DialogScale, "DropdownOpen", { Scale = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, "KeySystemScale")
end

return KeySystem
