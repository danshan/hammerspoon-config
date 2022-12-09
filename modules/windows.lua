
function maximizeCurrentWindow()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()

    window:setTopLeft(screenFrame.x, screenFrame.y)
    hs.timer.usleep(0.2 * 1000 * 1000)

    window:setFrame(screenFrame)
--    window:maximize()
end

function leftHalfCurrentWindow()
    local window = hs.window.focusedWindow()
    local screen = window:screen()
    local max = screen:frame()

    local frameOrigin = window:frame()

    local frame3_4 = window:frame()
    frame3_4.w = math.floor(max.w / 4 * 3)

    local frame2_3 = window:frame()
    frame2_3.w = math.floor(max.w / 3 * 2)

    local frame1_2 = window:frame()
    frame1_2.w = math.floor(max.w / 2 * 1)

    local frame1_3 = window:frame()
    frame1_3.w = math.floor(max.w / 3 * 1)

    local frame1_4 = window:frame()
    frame1_4.w = math.floor(max.w / 4 * 1)

    local all_frames = { frame3_4, frame2_3, frame1_2, frame1_3, frame1_4 }
    local frame = all_frames[1]
    for key, value in ipairs(all_frames) do
        if frameEquals(frameOrigin, value) then
            if key == #all_frames then
                frame = all_frames[1]
            else 
                frame = all_frames[key + 1]
            end
            break
        end
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

    local frame3_4 = window:frame()
    frame3_4.x = max.x + math.floor(max.w / 4 * 1)
    frame3_4.w = math.floor(max.w / 4 * 3)

    local frame2_3 = window:frame()
    frame2_3.x = max.x + math.floor(max.w / 3 * 1)
    frame2_3.w = math.floor(max.w / 3 * 2)

    local frame1_2 = window:frame()
    frame1_2.x = max.x + math.floor(max.w / 2 * 1)
    frame1_2.w = math.floor(max.w / 2 * 1)

    local frame1_3 = window:frame()
    frame1_3.x = max.x + math.floor(max.w / 3 * 2)
    frame1_3.w = math.floor(max.w / 3 * 1)

    local frame1_4 = window:frame()
    frame1_4.x = max.x + math.floor(max.w / 4 * 3)
    frame1_4.w = math.floor(max.w / 4 * 1)

    local all_frames = { frame3_4, frame2_3, frame1_2, frame1_3, frame1_4 }
    local frame = all_frames[1]
    for key, value in ipairs(all_frames) do
        if frameEquals(frameOrigin, value) then
            if key == #all_frames then
                frame = all_frames[1]
            else 
                frame = all_frames[key + 1]
            end
            break
        end
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

    local frame2_3 = window:frame()
    frame2_3.h = math.floor(max.h / 3 * 2)

    local frame1_2 = window:frame()
    frame1_2.h = math.floor(max.h / 2 * 1)

    local frame1_3 = window:frame()
    frame1_3.h = math.floor(max.h / 3 * 1)

    local all_frames = { frame2_3, frame1_2, frame1_3 }
    local frame = all_frames[1]
    for key, value in ipairs(all_frames) do
        if frameEquals(frameOrigin, value) then
            if key == #all_frames then
                frame = all_frames[1]
            else 
                frame = all_frames[key + 1]
            end
            break
        end
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

    local frame2_3 = window:frame()
    frame2_3.y = max.y + math.floor(max.h / 3 * 1)
    frame2_3.h = math.floor(max.h / 3 * 2)

    local frame1_2 = window:frame()
    frame1_2.y = max.y + math.floor(max.h / 2 * 1)
    frame1_2.h = math.floor(max.h / 2 * 1)

    local frame1_3 = window:frame()
    frame1_3.y = max.y + math.floor(max.h / 3 * 2)
    frame1_3.h = math.floor(max.h / 3 * 1)

    local all_frames = { frame2_3, frame1_2, frame1_3 }
    local frame = all_frames[1]
    for key, value in ipairs(all_frames) do
        if frameEquals(frameOrigin, value) then
            if key == #all_frames then
                frame = all_frames[1]
            else 
                frame = all_frames[key + 1]
            end
            break
        end
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

function moveToPreviousScreen()
    local window = hs.window.focusedWindow()
    local screen = window:screen()
    local nextScreen = screen:previous()
    window:moveToScreen(nextScreen)
end
