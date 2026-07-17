local WindUI = require("../src/Init")

local Notification = WindUI:Notify({
	Title = "A notification title that wraps safely on a narrow mobile viewport",
	Content = "Long content must stay inside the card without touching the close button or progress indicator.",
	Style = "Warning",
	Duration = 3,
	Buttons = {
		{
			Title = "Dismiss",
		},
		{
			Title = "Retry",
			Close = false,
		},
	},
})

assert(Notification.Appearance == "Compact")
assert(Notification.UIElements.Main:GetAttribute("Appearance") == "Compact")
assert(Notification.UIElements.Surface.Name == "CapsuleSurface")
assert(Notification.UIElements.ProgressTrack.Size.Y.Offset == 2)
assert(Notification.UIElements.ProgressFill.Size.X.Scale == 1)
assert(Notification.UIElements.CloseButton.Size.X.Offset >= 44)
assert(Notification.UIElements.CloseSurface.Size.X.Offset == 24)
assert(Notification.UIElements.Container.Size.Y.Offset == 0)
assert(Notification.UIElements.Transition:IsA("CanvasGroup"))
assert(Notification.UIElements.Main:GetAttribute("LayoutVersion") == 2)
assert(type(Notification.Pause) == "function")
assert(type(Notification.Resume) == "function")
assert(type(Notification.Update) == "function")

Notification:Update({
	Title = "Updated notification",
	Content = "Updated without creating a second card.",
})

assert(Notification.UIElements.Title.Text == "Updated notification")
assert(Notification.UIElements.Content.Text == "Updated without creating a second card.")

local CardNotification = WindUI:Notify({
	Title = "Anonim",
	Content = "Metadata card notification",
	Avatar = "rbxassetid://123456789",
	Timestamp = "May 23, 2025",
	Duration = false,
})

assert(CardNotification.Appearance == "Card")
assert(CardNotification.UIElements.Timestamp.Text == "May 23, 2025")
assert(CardNotification.UIElements.IconBubble.Size.X.Offset == 40)
