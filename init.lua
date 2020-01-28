hs.window.animationDuration = 0
hs.window.setShadows(false)


local mash = { "alt" }
local mashShift = { "alt", "shift" }
local mashCtrl = { "alt", "ctrl" }

require("apps")
require("windows")
require("screens")

-- launch and focus applications with below shortkey
hs.fnutils.each({
    { key = "`", app = "iTerm" },
    { key = ",", app = "Quiver" },
    { key = ".", app = "Mail" },
    { key = "/", app = "Finder" },
    { key = ";", app = "Preview" },
    { key = "1", app = "Google Chrome" },
    { key = "2", app = "Safari" },
    { key = "3", app = "龙信" },
    { key = "4", app = "WeChat" },
    { key = "d", app = "WebStorm" },
    { key = "e", app = "Sublime Text" },
    { key = "n", app = "Slack" },
    { key = "b", app = "BearyChat" },
    { key = "r", app = "Reminders" },
    { key = "s", app = "IntelliJ IDEA Ultimate Release" },
    -- { key = "s", app = "IntelliJ IDEA Community" },
    -- { key = "s", app = "IntelliJ IDEA EAP" },
    { key = "t", app = "Tweetbot" },
    { key = "w", app = "KeePassXC" },
}, function(object)
    launchApp(mash, object)
end)

------------------------------------------------------------
-- Window resize
------------------------------------------------------------

hs.hotkey.bind(mashShift, "m", function()
    maximizeCurrentWindow()
end)

hs.hotkey.bind(mash, "-", function()
    smallerCurrentWindow()
end)

hs.hotkey.bind(mash, "=", function()
    largerCurrentWindow()
end)

hs.hotkey.bind(mashCtrl, "left", function()
    leftHalfCurrentWindow()
end)

hs.hotkey.bind(mashCtrl, "right", function()
    rightHalfCurrentWindow()
end)

hs.hotkey.bind(mashCtrl, "up", function()
    upHalfCurrentWindow()
end)

hs.hotkey.bind(mashCtrl, "down", function()
    downHalfCurrentWindow()
end)

-- Window fit screen height
hs.hotkey.bind(mash, "\\", function()
    fitScreenHeight()
end)

hs.hotkey.bind(mashShift, "\\", function()
    fitScreenWidth()
end)

------------------------------------------------------------
-- Window movement 
------------------------------------------------------------

-- Window <
hs.hotkey.bind(mashCtrl, "h", function()
    moveCurrentWindow(-100, 0)
end)
-- Window >
hs.hotkey.bind(mashCtrl, "l", function()
    moveCurrentWindow(100, 0)
end)
-- Window ^
hs.hotkey.bind(mashCtrl, "k", function()
    moveCurrentWindow(0, -100)
end)
-- Window v
hs.hotkey.bind(mashCtrl, "j", function()
    moveCurrentWindow(0, 100)
end)

-- move to next screen
hs.hotkey.bind(mashShift, "l", function()
    moveToNextScreen()
end)

-- move to previous screen
hs.hotkey.bind(mashShift, "h", function()
    moveToPreviousScreen()
end)

hs.alert.show('config reloaded')