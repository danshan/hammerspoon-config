-- launch and focus applications with below shortkey
hs.fnutils.each({
    { key = "`", app = "iTerm" },
    -- { key = ",", app = "Quiver" },
    { key = ",", app = "Craft" },
    { key = ".", app = "Paw" },
    { key = "/", app = "Finder" },
    { key = ";", app = "Preview" },
    { key = "1", app = "Google Chrome" },
    -- { key = "1", app = "Brave Browser"},
--    { key = "1", app = "Chromium"},
    { key = "2", app = "Safari" },
    { key = "3", app = "Lark" },
    { key = "4", app = "WeChat" },
    { key = "d", app = "WebStorm" },
    { key = "e", app = "Sublime Text" },
    { key = "l", app = "Lift" },
    { key = "m", app = "Spotify" },
    { key = "n", app = "Telegram" },
    { key = "b", app = "BearyChat" },
    { key = "p", app = "PyCharm" },
    { key = "r", app = "Reminders" },
    { key = "s", app = "IntelliJ IDEA" },
    -- { key = "s", app = "IntelliJ IDEA Community" },
    -- { key = "s", app = "IntelliJ IDEA EAP" },
    { key = "t", app = "Tweetbot" },
    { key = "v", app = "Visual Studio Code" },
    { key = "w", app = "KeePassXC" },
}, function(object)
    launchApp(mash.app, object)
end)

------------------------------------------------------------
-- Window resize
------------------------------------------------------------

hs.hotkey.bind(mash.resize, "m", function()
    maximizeCurrentWindow()
end)

hs.hotkey.bind(mash.resize, "-", function()
    smallerCurrentWindow()
end)

hs.hotkey.bind(mash.resize, "=", function()
    largerCurrentWindow()
end)

hs.hotkey.bind(mash.resize, "left", function()
    leftHalfCurrentWindow()
end)

hs.hotkey.bind(mash.resize, "right", function()
    rightHalfCurrentWindow()
end)

hs.hotkey.bind(mash.resize, "up", function()
    upHalfCurrentWindow()
end)

hs.hotkey.bind(mash.resize, "down", function()
    downHalfCurrentWindow()
end)

-- Window fit screen height
hs.hotkey.bind(mash.resize, "h", function()
    fitScreenHeight()
end)

hs.hotkey.bind(mash.resize, "w", function()
    fitScreenWidth()
end)

------------------------------------------------------------
-- Window movement 
------------------------------------------------------------

-- Window <
hs.hotkey.bind(mash.movement, "h", function()
    moveCurrentWindow(-100, 0)
end)
-- Window >
hs.hotkey.bind(mash.movement, "l", function()
    moveCurrentWindow(100, 0)
end)
-- Window ^
hs.hotkey.bind(mash.movement, "k", function()
    moveCurrentWindow(0, -100)
end)
-- Window v
hs.hotkey.bind(mash.movement, "j", function()
    moveCurrentWindow(0, 100)
end)

-- move to next screen
hs.hotkey.bind(mash.movement, "n", function()
    moveToNextScreen()
end)

-- move to previous screen
hs.hotkey.bind(mash.movement, "p", function()
    moveToPreviousScreen()
end)
