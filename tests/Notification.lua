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

assert(Notification.UIElements.ProgressTrack.Size.Y.Offset == 3)
assert(Notification.UIElements.ProgressFill.Size.X.Scale == 1)
assert(Notification.UIElements.CloseButton.Size.X.Offset >= 44)
assert(Notification.UIElements.Container.Size.Y.Offset == 0)
