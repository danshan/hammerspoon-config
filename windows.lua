
function maximizeCurrentWindow()
    local window = hs.window.focusedWindow()
    window:maximize()
end

function leftHalfCurrentWindow()
    local window = hs.window.focusedWindow()
    local screen = window:screen()
    local max = screen:frame()

    local frameOrigin = window:frame()

    local frame1 = window:frame()
    frame1.w = math.floor(max.w / 2)

    local frame2 = window:frame()
    frame2.w = math.floor(max.w / 3)

    local frame3 = window:frame()
    frame3.w = math.floor(max.w / 4)

    local frame = frame1
    if frameEquals(frameOrigin, frame1) then
        frame = frame2
    end
    if frameEquals(frameOrigin, frame2) then
        frame = frame3
    end

    frame.x = max.x
    frame.y = frame.y
    frame.h = frame.h
    
    window:setFrame(frame)
end

function rightHalfCurrentWindow()
    local window = hs.window.focusedWindow()
    local screen = window:screen()
    local max = screen:frame()

    local frameOrigin = window:frame()

    local frame1 = window:frame()
    frame1.x = max.x + math.floor(max.w / 2)
    frame1.w = math.floor(max.w / 2)

    local frame2 = window:frame()
    frame2.x = max.x + math.floor(max.w / 3) * 2
    frame2.w = math.floor(max.w / 3)

    local frame3 = window:frame()
    frame3.x = max.x + math.floor(max.w / 4) * 3
    frame3.w = math.floor(max.w / 4)

    local frame = frame1
    if frameEquals(frameOrigin, frame1) then
        frame = frame2
    end
    if frameEquals(frameOrigin, frame2) then
        frame = frame3
    end

    frame.y = frame.y
    frame.h = frame.h
    
    window:setFrame(frame)
end

function moveCurrentWindow(offsetX, offsetY)
    local window = hs.window.focusedWindow()
    local frame = window:frame()
    moveFrame(frame, offsetX, offsetY)
    window:setFrame(frame)
end

function upHalfCurrentWindow()
    local window = hs.window.focusedWindow()
    local screen = window:screen()
    local max = screen:frame()

    local frameOrigin = window:frame()

    local frame1 = window:frame()
    frame1.h = math.floor(max.h / 2)

    local frame2 = window:frame()
    frame2.h = math.floor(max.h / 3)

    local frame3 = window:frame()
    frame3.h = math.floor(max.h / 4)

    local frame = frame1
    if frameEquals(frameOrigin, frame1) then
        frame = frame2
    end
    if frameEquals(frameOrigin, frame2) then
        frame = frame3
    end

    frame.x = frame.x
    frame.y = max.y
    frame.w = frame.w
    
    window:setFrame(frame)
end

function downHalfCurrentWindow()
    local window = hs.window.focusedWindow()
    local screen = window:screen()
    local max = screen:frame()

    local frameOrigin = window:frame()

    local frame1 = window:frame()
    frame1.y = max.y + math.floor(max.h / 2)
    frame1.h = math.floor(max.h / 2)

    local frame2 = window:frame()
    frame2.y = max.y + math.floor(max.h / 3) * 2
    frame2.h = math.floor(max.h / 3)

    local frame3 = window:frame()
    frame3.y = max.y + math.floor(max.h / 4) * 3
    frame3.h = math.floor(max.h / 4)

    local frame = frame1
    if frameEquals(frameOrigin, frame1) then
        frame = frame2
    end
    if frameEquals(frameOrigin, frame2) then
        frame = frame3
    end

    frame.x = frame.x
    frame.w = frame.w
    
    window:setFrame(frame)
end

function frameEquals(frame1, frame2)
    return frame1.x == frame2.x and frame1.y == frame2.y and frame1.w == frame2.w and frame1.h == frame2.h
end

function smallerCurrentWindow() 
    local window = hs.window.focusedWindow()
    local frame = window:frame()

    smallerFrame(frame)
    window:setFrame(frame)
end

function largerCurrentWindow()
    local window = hs.window.focusedWindow()
    local frame = window:frame()

    largerFrame(frame)
    window:setFrame(frame)
end

function smallerFrame(frame)
    resizeFrame(frame, 0.9)
end

function largerFrame(frame)
    resizeFrame(frame, 1.1)
end

function resizeFrame(frame, ratio)
    frame.x = frame.x + frame.w / 2 * (1 - ratio)
    frame.y = frame.y + frame.h / 2 * (1 - ratio)
    frame.w = frame.w * ratio
    frame.h = frame.h * ratio
end

function moveFrame(frame, offsetX, offsetY) 
    frame.x = frame.x + offsetX
    frame.y = frame.y + offsetY
end

function fitScreenHeight()
    local window = hs.window.focusedWindow()
    local frame = window:frame()

    frame.y = window:screen():frame().y
    frame.h = window:screen():frame().h

    window:setFrame(frame)
end

function fitScreenWidth()
    local window = hs.window.focusedWindow()
    local frame = window:frame()

    frame.x = window:screen():frame().x
    frame.w = window:screen():frame().w

    window:setFrame(frame)
end

function moveToNextScreen()
    local window = hs.window.focusedWindow()
    local screen = window:screen()
    local nextScreen = screen:next()
    window:moveToScreen(nextScreen)
end
