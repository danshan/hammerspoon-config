KEYS = {
    app = { "alt" },
    movement = { "alt", "ctrl" },
    resize = { "alt", "shift" }
}

require("setup")
--require("layout")

require("modules/apps")
require("modules/layout")
require("modules/mouse")

require("keybind")
--require("urlbind")

hs.alert.show('Hammerspoon config reload')
