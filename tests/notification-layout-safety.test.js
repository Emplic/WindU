const fs = require("fs")

const source = fs.readFileSync("src/components/Notification.lua", "utf8")
const checks = {
	responsiveHolder: /UISizeConstraint/.test(source) && /MinSize/.test(source) && /MaxSize/.test(source),
	bottomProgress: /Name = "ProgressTrack"/.test(source) && /Name = "ProgressFill"/.test(source),
	deterministicHeight: /UpdateContainerHeight/.test(source) && !/Main\.AbsoluteSize\.Y/.test(source),
	touchClose:
		/Name = "CloseButton"[\s\S]{0,220}Size = UDim2\.fromOffset\(CLOSE_SIZE, CLOSE_SIZE\)/.test(source) &&
		/CLOSE_SIZE = 44/.test(source),
	boundedStack: /MAX_VISIBLE = 5/.test(source) && /TrimNotifications/.test(source),
	heightAwareStack: /AvailableHeight/.test(source) && /TotalHeight > AvailableHeight/.test(source),
	clippedExit: /Name = "NotificationContainer"[\s\S]{0,180}ClipsDescendants = true/.test(source),
	orderedActions: /for Index = 1, math\.min\(#Buttons, MAX_ACTIONS\)/.test(source),
}

const failed = Object.entries(checks).filter(([, ok]) => !ok)
if (failed.length > 0) {
	throw new Error("Notification layout regression: " + failed.map(([name]) => name).join(", "))
}

console.log("PASS notification layout safety")
