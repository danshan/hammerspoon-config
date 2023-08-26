local wm = require("modules/windows")
local hk = require("hs.hotkey")

-- launch and focus applications with below shortkey
hs.fnutils.each({
    { key = "`", app = "iTerm" },
    { key = ",", app = "Notion" },
    { key = ".", app = "Postman" },
    { key = "/", app = "Finder" },
    { key = ";", app = "Preview" },
    -- { key = "1", app = "Google Chrome" },
    { key = "1", app = "Microsoft Edge" },
    { key = "2", app = "Safari" },
    { key = "3", app = "Lark" },
    { key = "4", app = "WeChat" },
    { key = "5", app = "企业微信" },
    { key = "6", app = "Feishu Meetings" },
    { key = "a", app = "iStatistica Pro" },
    { key = "d", app = "WebStorm" },
    { key = "e", app = "Sublime Text" },
    { key = "m", app = "Spotify" },
    { key = "n", app = "Telegram" },
    { key = "p", app = "PyCharm CE" },
    { key = "r", app = "Reminders" },
    { key = "s", app = "IntelliJ IDEA" },
    { key = "t", app = "Tweetbot" },
    { key = "v", app = "Visual Studio Code" },
    -- { key = "w", app = "KeePassXC" },
    { key = "w", app = "Strongbox" },
}, function(object)
    launchApp(KEYS.app, object)
end)

-- reload hammerspoon config
hs.hotkey.bind(KEYS.app, "b", function()
    hs.reload()
end)

local function windowBind(hyper, keyFuncTable)
    hs.fnutils.each(keyFuncTable, function(object)
        hk.bind(hyper, object.key, object.module)
    end)
end

------------------------------------------------------------
-- Window resize
------------------------------------------------------------

windowBind(KEYS.resize, {
    {key = "m", module = wm.maximizeWindow},
    {key = "left", module = wm.leftHalfWindow},
    {key = "right", module = wm.rightHalfWindow},
    {key = "up", module = wm.upHalfWindow},
    {key = "down", module = wm.downHalfWindow},
    {key = "-", module = wm.smallerWindow},
    {key = "=", module = wm.largeWindow},
})

------------------------------------------------------------
-- Window movement
------------------------------------------------------------

windowBind(KEYS.movement, {
    {key = "h", module = wm.moveToLeftScreen},
    {key = "l", module = wm.moveToRightScreen},
    {key = "k", module = wm.moveToUpScreen},
    {key = "j", module = wm.moveToDownScreen},
})
