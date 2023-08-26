local logger = hs.logger.new("window", "verbose")

local windowMeta = {}
local window = require('hs.window')
local grid = require('hs.grid')
grid.setMargins('0, 0')

local module = {}

-- Set screen watcher, in case you connect a new monitor, or unplug a monitor
screen = {}
screenArr = {}
local screenWatcher = hs.screen.watcher.new(function()
    screens = hs.screen.allScreens()
end)
screenWatcher:start()

-- Construct list of screens
local indexDiff = 0
for index = 1, #hs.screen.allScreens() do
    local xIndex, yIndex = hs.screen.allScreens()[index]:position()
    logger.i("found screen: " .. hs.screen.allScreens()[index]:name() .. "pos: " .. xIndex .. ", " .. yIndex)
    screenArr[xIndex] = hs.screen.allScreens()[index]
end

-- Find lowest screen index, save to indexDiff if negative
hs.fnutils.each(screenArr, function(e)
    local currentIndex = hs.fnutils.indexOf(screenArr, e)
    if currentIndex < 0 and currentIndex < indexDiff then
        indexDiff = currentIndex
    end
end)

-- Set screen grid depending on resolution
-- TODO: set grid according to pixels
for _index, screen in pairs(hs.screen.allScreens()) do
    if screen:frame().w / screen:frame().h > 2 then
        -- 10 * 4 for ultra wide screen
        grid.setGrid('10 * 4', screen)
    else
        if screen:frame().w < screen:frame().h then
            -- 4 * 8 for vertically aligned screen
            grid.setGrid('4 * 8', screen)
        else
            -- 8 * 4 for normal screen
            grid.setGrid('8 * 4', screen)
        end
    end
end

-- Some constructors, just for programming
function Cell(x, y, w, h)
    return hs.geometry(x, y, w, h)
end

-- Bind new method to windowMeta
function windowMeta.new()
    local self = setmetatable(windowMeta, {
        -- Treate table like a function
        -- Event listener when windowMeta() is called
        __call = function(cls, ...)
            return cls.new(...)
        end,
    })

    self.window = window.focusedWindow()
    self.screen = self.window:screen()
    self.windowGrid = grid.get(self.window)
    self.screenGrid = grid.getGrid(self.screen)
    self.windowFrame = self.window:frame()

    return self
end


module.maximizeWindow = function()
    local this = windowMeta.new()
    hs.grid.maximizeWindow(this.window)
end

module.leftHalfWindow = function()
    local this = windowMeta.new()
--    local cell = Cell(0, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
    local cell = Cell(0, this.windowGrid.y, 0.5 * this.screenGrid.w, this.windowGrid.h)
    grid.set(this.window, cell, this.screen)
end

module.rightHalfWindow = function()
    local this = windowMeta.new()
--    local cell = Cell(0.5 * this.screenGrid.w, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
    local cell = Cell(0.5 * this.screenGrid.w, this.windowGrid.y, 0.5 * this.screenGrid.w, this.windowGrid.h)
    grid.set(this.window, cell, this.screen)
end

function moveCurrentWindow(offsetX, offsetY)
    local window = hs.window.focusedWindow()
    local frame = window:frame()
    moveFrame(frame, offsetX, offsetY)
    window:setFrame(frame)
end

module.upHalfWindow = function()
    local this = windowMeta.new()
--    local cell = Cell(0, 0, this.screenGrid.w, 0.5 * this.screenGrid.h)
    local cell = Cell(this.windowGrid.x, 0, this.windowGrid.w, 0.5 * this.screenGrid.h)
    grid.set(this.window, cell, this.screen)
end

module.downHalfWindow = function()
    local this = windowMeta.new()
--    local cell = Cell(0, 0.5 * this.screenGrid.h, this.screenGrid.w, 0.5 * this.screenGrid.h)
    local cell = Cell(this.windowGrid.x, 0.5 * this.screenGrid.h, this.windowGrid.w, 0.5 * this.screenGrid.h)
    grid.set(this.window, cell, this.screen)
end

module.smallerWindow = function()
    resizeFrame(0.9)
end

module.largeWindow = function()
    resizeFrame(1.1)
end

function resizeFrame(ratio)
    local this = windowMeta.new()
    logger.v("origin x: " .. this.windowFrame.x)
    logger.v("origin y: " .. this.windowFrame.y)
    logger.v("origin w: " .. this.windowFrame.w)
    logger.v("origin h: " .. this.windowFrame.h)

    local frame = {
        x = this.windowFrame.x + this.windowFrame.w / 2 * (1 - ratio),
        y = this.windowFrame.y + this.windowFrame.h / 2 * (1 - ratio),
        w = this.windowFrame.w * ratio,
        h = this.windowFrame.h * ratio,
    }
    logger.v("after x: " .. frame.x)
    logger.v("after y: " .. frame.y)
    logger.v("after w: " .. frame.w)
    logger.v("after h: " .. frame.h)

    this.window:setFrame(frame)
end

function moveFrame(frame, offsetX, offsetY)
    frame.x = frame.x + offsetX
    frame.y = frame.y + offsetY
end

module.moveToLeftScreen = function()
    local this = windowMeta.new()
    this.window:moveOneScreenWest(false, true)
end

module.moveToRightScreen = function()
    local this = windowMeta.new()
    this.window:moveOneScreenEast(false, true)
end

module.moveToUpScreen = function()
    local this = windowMeta.new()
    this.window:moveOneScreenNorth(false, true)
end

module.moveToDownScreen = function()
    local this = windowMeta.new()
    this.window:moveOneScreenSouth(false, true)
end

return module
