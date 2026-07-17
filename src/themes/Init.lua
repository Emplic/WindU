return function(WindUI, Creator)
	return {
		Dark = {
			Name = "Dark",

			Accent = Color3.fromHex("#18181b"),
			Dialog = Color3.fromHex("#1a1a1a"),
			Outline = Color3.fromHex("#FFFFFF"),
			Text = Color3.fromHex("#FFFFFF"),
			Placeholder = Color3.fromHex("#a1a1a1"),
			Background = Color3.fromHex("#101010"),
			Button = Color3.fromHex("#52525b"),
			Icon = Color3.fromHex("#a1a1aa"),
			Toggle = Color3.fromHex("#33C759"),
			Slider = Color3.fromHex("#0091FF"),
			Checkbox = Color3.fromHex("#0091FF"),

			PanelBackground = Color3.fromHex("#FFFFFF"),
			PanelBackgroundTransparency = 0.95,

			SliderIcon = Color3.fromHex("#908F95"),
			Primary = Color3.fromHex("#0091FF"),

			--WindowTopbarButtonIcon = Color3.fromHex("#ffffff"),
			LabelBackground = Color3.fromHex("#000000"),
			LabelBackgroundTransparency = 0.83,

			ElementBackground = Color3.fromHex("#2A2A2C"),
			ElementBackgroundTransparency = 0,
		},

		Light = {
			Name = "Light",

			Accent = Color3.fromHex("#efefef"),
			Dialog = Color3.fromHex("#f4f4f5"),
			Outline = Color3.fromHex("#ffffff"),
			Text = Color3.fromHex("#000000"),
			Placeholder = Color3.fromHex("#555555"),
			Background = Color3.fromHex("#FFFFFF"),
			Button = Color3.fromHex("#18181b"),
			Icon = Color3.fromHex("#52525b"),
			Toggle = Color3.fromHex("#33C759"),
			Slider = Color3.fromHex("#0091FF"),
			Checkbox = Color3.fromHex("#0091FF"),

			DropdownTabBackground = Color3.fromHex("#bebebe"),
			DropdownBackground = Color3.fromHex("#ffffff"),

			TabBackground = Color3.fromHex("#ffffff"),
			TabBackgroundHover = Color3.fromHex("#f3f3f3"),
			TabBackgroundHoverTransparency = 0,
			TabBackgroundActive = Color3.fromHex("#efefef"),
			TabBackgroundActiveTransparency = 0,

			PanelBackground = Color3.fromHex("#efefef"),
			PanelBackgroundTransparency = 0,

			LabelBackground = Color3.fromHex("#efefef"),
			LabelBackgroundTransparency = 0,

			ElementBackground = Color3.fromHex("#ffffff"),
			ElementBackgroundTransparency = 0,
		},

		Rose = {
			Name = "Rose",

			Accent = Color3.fromHex("#be185d"),
			Dialog = Color3.fromHex("#4c0519"),
			--Outline = Color3.fromHex("#fecdd3"),
			Text = Color3.fromHex("#fdf2f8"),
			Placeholder = Color3.fromHex("#d67aa6"),
			Background = Color3.fromHex("#1f0308"),
			Button = Color3.fromHex("#e95f74"),
			Icon = Color3.fromHex("#fb7185"),

			ElementBackground = Color3.fromHex("#381E23"),
			ElementBackgroundTransparency = 0,
		},

		Plant = {
			Name = "Plant",

			Accent = Color3.fromHex("#166534"),
			Dialog = Color3.fromHex("#052e16"),
			--Outline = Color3.fromHex("#bbf7d0"),
			Text = Color3.fromHex("#f0fdf4"),
			Placeholder = Color3.fromHex("#4fbf7a"),
			Background = Color3.fromHex("#0a1b0f"),
			Button = Color3.fromHex("#16a34a"),
			Icon = Color3.fromHex("#4ade80"),

			ElementBackground = Color3.fromHex("#28342A"),
			ElementBackgroundTransparency = 0,
		},

		Red = {
			Name = "Red",

			Accent = Color3.fromHex("#991b1b"),
			Dialog = Color3.fromHex("#450a0a"),
			--Outline = Color3.fromHex("#fecaca"),
			Text = Color3.fromHex("#fef2f2"),
			Placeholder = Color3.fromHex("#d95353"),
			Background = Color3.fromHex("#1c0606"),
			Button = Color3.fromHex("#dc2626"),
			Icon = Color3.fromHex("#ef4444"),

			ElementBackground = Color3.fromHex("#322221"),
			ElementBackgroundTransparency = 0,
		},

		Indigo = {
			Name = "Indigo",

			Accent = Color3.fromHex("#3730a3"),
			Dialog = Color3.fromHex("#1e1b4b"),
			--Outline = Color3.fromHex("#c7d2fe"),
			Text = Color3.fromHex("#f1f5f9"),
			Placeholder = Color3.fromHex("#7078d9"),
			Background = Color3.fromHex("#0f0a2e"),
			Button = Color3.fromHex("#4f46e5"),
			Icon = Color3.fromHex("#6366f1"),

			ElementBackground = Color3.fromHex("#282543"),
			ElementBackgroundTransparency = 0,
		},

		Sky = {
			Name = "Sky",

			Accent = Color3.fromHex("#00d4ff"),
			Dialog = Color3.fromHex("#0a4d66"),
			--Outline = Color3.fromHex("#4dd9ff"),
			Text = Color3.fromHex("#e6f7ff"),
			Placeholder = Color3.fromHex("#66b3cc"),
			Background = Color3.fromHex("#051a26"),
			Button = Color3.fromHex("#00a8cc"),
			Icon = Color3.fromHex("#2db8d9"),

			Toggle = Color3.fromHex("#00d9d9"),
			Slider = Color3.fromHex("#00d4ff"),
			Checkbox = Color3.fromHex("#00d4ff"),

			PanelBackground = Color3.fromHex("#0d3a47"),
			PanelBackgroundTransparency = 0.8,

			ElementBackground = Color3.fromHex("#172E3B"),
			ElementBackgroundTransparency = 0,
		},

		Violet = {
			Name = "Violet",

			Accent = Color3.fromHex("#6d28d9"),
			Dialog = Color3.fromHex("#3c1361"),
			--Outline = Color3.fromHex("#ddd6fe"),
			Text = Color3.fromHex("#faf5ff"),
			Placeholder = Color3.fromHex("#8f7ee0"),
			Background = Color3.fromHex("#1e0a3e"),
			Button = Color3.fromHex("#7c3aed"),
			Icon = Color3.fromHex("#8b5cf6"),

			ElementBackground = Color3.fromHex("#342650"),
			ElementBackgroundTransparency = 0,
		},

		Amber = {
			Name = "Amber",

			Accent = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#b45309"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#d97706"), Transparency = 0 },
			}, { Rotation = 45 }),

			Dialog = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#451a03"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#6b2e05"), Transparency = 0 },
			}, { Rotation = 90 }),

			--Outline = WindUI:Gradient({
			--	["0"] = { Color = Color3.fromHex("#fde68a"), Transparency = 0 },
			--	["100"] = { Color = Color3.fromHex("#fcd34d"), Transparency = 0 },
			--}, { Rotation = 45 }),

			Text = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#fffbeb"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#fff7ed"), Transparency = 0 },
			}, { Rotation = 45 }),

			Placeholder = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#d1a326"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#fbbf24"), Transparency = 0 },
			}, { Rotation = 45 }),

			Background = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#1c1003"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#3f210d"), Transparency = 0 },
			}, { Rotation = 90 }),

			Button = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#d97706"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#f59e0b"), Transparency = 0 },
			}, { Rotation = 45 }),

			Icon = Color3.fromHex("#f59e0b"),

			Toggle = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#d97706"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#f59e0b"), Transparency = 0 },
			}, { Rotation = 45 }),

			Slider = Color3.fromHex("#d97706"),

			Checkbox = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#d97706"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#fbbf24"), Transparency = 0 },
			}, { Rotation = 45 }),

			PanelBackground = Color3.fromHex("#FFFFFF"),
			PanelBackgroundTransparency = 0.95,

			ElementBackground = Color3.fromHex("#3A2E22"),
			ElementBackgroundTransparency = 0,
		},

		Emerald = {
			Name = "Emerald",

			Accent = Color3.fromHex("#047857"),
			Dialog = Color3.fromHex("#022c22"),
			--Outline = Color3.fromHex("#a7f3d0"),
			Text = Color3.fromHex("#ecfdf5"),
			Placeholder = Color3.fromHex("#3fbf8f"),
			Background = Color3.fromHex("#011411"),
			Button = Color3.fromHex("#059669"),
			Icon = Color3.fromHex("#10b981"),

			ElementBackground = Color3.fromHex("#202E2A"),
			ElementBackgroundTransparency = 0,
		},

		Midnight = {
			Name = "Midnight",

			-- Matte-black foundation with restrained platinum highlights.
			Accent = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#D7DAE2"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#9299A8"), Transparency = 0 },
			}, { Rotation = 35 }),

			Dialog = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#111214"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#0B0C0E"), Transparency = 0 },
			}, { Rotation = 125 }),

			Outline = Color3.fromHex("#303238"),
			Text = Color3.fromHex("#F5F5F6"),
			Placeholder = Color3.fromHex("#85878D"),

			Background = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#050506"), Transparency = 0 },
				["58"] = { Color = Color3.fromHex("#090A0C"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#0D0E11"), Transparency = 0 },
			}, { Rotation = 145 }),

			Button = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#2B2D32"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#1C1D21"), Transparency = 0 },
			}, { Rotation = 90 }),

			Primary = Color3.fromHex("#B9C2D6"),
			Icon = Color3.fromHex("#C4C7CE"),
			Toggle = Color3.fromHex("#AEB8CF"),
			Slider = Color3.fromHex("#AEB8CF"),
			SliderIcon = Color3.fromHex("#F1F2F4"),
			Checkbox = Color3.fromHex("#B9C2D6"),

			DropdownTabBackground = Color3.fromHex("#17181B"),
			DropdownBackground = Color3.fromHex("#0D0E10"),

			TabBackground = Color3.fromHex("#0B0C0E"),
			TabBackgroundHover = Color3.fromHex("#17181C"),
			TabBackgroundHoverTransparency = 0,
			TabBackgroundActive = Color3.fromHex("#22242A"),
			TabBackgroundActiveTransparency = 0,

			PanelBackground = Color3.fromHex("#141518"),
			PanelBackgroundTransparency = 0.08,

			LabelBackground = Color3.fromHex("#101113"),
			LabelBackgroundTransparency = 0.08,

			ElementBackground = Color3.fromHex("#151619"),
			ElementBackgroundTransparency = 0,
		},

		Crimson = {
			Name = "Crimson",

			Accent = Color3.fromHex("#b91c1c"),
			Dialog = Color3.fromHex("#450a0a"),
			--Outline = Color3.fromHex("#fca5a5"),
			Text = Color3.fromHex("#fef2f2"),
			Placeholder = Color3.fromHex("#6f757b"),
			Background = Color3.fromHex("#0c0404"),
			Button = Color3.fromHex("#991b1b"),
			Icon = Color3.fromHex("#dc2626"),

			ElementBackground = Color3.fromHex("#251F1F"),
			ElementBackgroundTransparency = 0,
		},

		MonokaiPro = {
			Name = "Monokai Pro",

			Accent = Color3.fromHex("#fc9867"),
			Dialog = Color3.fromHex("#1e1e1e"),
			--Outline = Color3.fromHex("#78dce8"),
			Text = Color3.fromHex("#fcfcfa"),
			Placeholder = Color3.fromHex("#afafaf"),
			Background = Color3.fromHex("#191622"),
			Button = Color3.fromHex("#ab9df2"),
			Icon = Color3.fromHex("#a9dc76"),

			ElementBackground = Color3.fromHex("#323039"),
			ElementBackgroundTransparency = 0,

			Metadata = {
				PullRequest = 23,
			},
		},

		CottonCandy = {
			Name = "Cotton Candy",

			Accent = Color3.fromHex("#ec4899"),
			Dialog = Color3.fromHex("#2d1b3d"),
			--Outline = Color3.fromHex("#f9a8d4"),
			Text = Color3.fromHex("#fdf2f8"),
			Placeholder = Color3.fromHex("#8a5fd3"),
			Background = Color3.fromHex("#1a0b2e"),
			Button = Color3.fromHex("#d946ef"),
			Slider = Color3.fromHex("#d946ef"),
			Icon = Color3.fromHex("#06b6d4"),

			ElementBackground = Color3.fromHex("#312643"),
			ElementBackgroundTransparency = 0,
		},

		Mellowsi = {
			Name = "Mellowsi",

			Accent = Color3.fromHex("#342A1E"),
			Dialog = Color3.fromHex("#291C13"),
			--Outline = Color3.fromHex("#6B5A45"),
			Text = Color3.fromHex("#F5EBDD"),
			Placeholder = Color3.fromHex("#9C8A73"),
			Background = Color3.fromHex("#1C1002"),
			Button = Color3.fromHex("#342A1E"),
			Icon = Color3.fromHex("#C9B79C"),

			Toggle = Color3.fromHex("#a9873f"),
			Slider = Color3.fromHex("#C9A24D"),
			Checkbox = Color3.fromHex("#C9A24D"),

			ElementBackground = Color3.fromHex("#33291E"),
			ElementBackgroundTransparency = 0,

			Metadata = {
				PullRequest = 52,
			},
		},

		Rainbow = {
			Name = "Rainbow",

			Accent = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#00ff41"), Transparency = 0 },
				["33"] = { Color = Color3.fromHex("#00ffff"), Transparency = 0 },
				["66"] = { Color = Color3.fromHex("#0080ff"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#8000ff"), Transparency = 0 },
			}, { Rotation = 45 }),

			Dialog = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#ff0080"), Transparency = 0 },
				["25"] = { Color = Color3.fromHex("#8000ff"), Transparency = 0 },
				["50"] = { Color = Color3.fromHex("#0080ff"), Transparency = 0 },
				["75"] = { Color = Color3.fromHex("#00ff80"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#ff8000"), Transparency = 0 },
			}, { Rotation = 135 }),

			--Outline = Color3.fromHex("#ffffff"),
			Text = Color3.fromHex("#ffffff"),
			Placeholder = Color3.fromHex("#00ff80"),

			Background = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#ff0040"), Transparency = 0 },
				["20"] = { Color = Color3.fromHex("#ff4000"), Transparency = 0 },
				["40"] = { Color = Color3.fromHex("#ffff00"), Transparency = 0 },
				["60"] = { Color = Color3.fromHex("#00ff40"), Transparency = 0 },
				["80"] = { Color = Color3.fromHex("#0040ff"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#4000ff"), Transparency = 0 },
			}, { Rotation = 90 }),

			Button = WindUI:Gradient({
				["0"] = { Color = Color3.fromHex("#ff0080"), Transparency = 0 },
				["25"] = { Color = Color3.fromHex("#ff8000"), Transparency = 0 },
				["50"] = { Color = Color3.fromHex("#ffff00"), Transparency = 0 },
				["75"] = { Color = Color3.fromHex("#80ff00"), Transparency = 0 },
				["100"] = { Color = Color3.fromHex("#00ffff"), Transparency = 0 },
			}, { Rotation = 60 }),

			Icon = Color3.fromHex("#ffffff"),
		},
	}
end
