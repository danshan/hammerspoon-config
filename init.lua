mash = {
    app = { "alt" },
    movement = { "alt", "ctrl" },
    resize = { "alt", "shift" }
}

require("setup")
require("layout")

require("modules/apps")
require("modules/windows")
require("modules/screens")
require("modules/layout")
require("modules/mouse")

require("keybind")
require("urlbind")

hs.alert.show('Hammerspoon config reload')
