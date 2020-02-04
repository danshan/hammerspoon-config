local geometry = require "hs.geometry"

function moveToCenterOfWindow(window) 
--    local window = hs.window.focusedWindow()
    local frame = window:frame()
    hs.mouse.setAbsolutePosition(geometry.rectMidPoint(frame))
end