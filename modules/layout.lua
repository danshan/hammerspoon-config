function applyLayouts(layouts)

    for i, layout in ipairs(layouts) do
        if (type(layout.name) == "table") then
            --hs.alert.show("Applying Layout in table")
            for i, appName in ipairs(layout.name) do
                --print("Applying Layout in table i -> " .. i)
                --print("Applying Layout in table appName -> " .. appName)
                -- focus or launch
                hs.application.launchOrFocus(appName)
                local app = hs.application.find(appName)
          
                if (app) then
                    local wins = app:allWindows()
                    local counter = 1
                    for j, win in ipairs(wins) do
                        if (win:isVisible() and layout.func) then
                            layout.func(counter, win)
                            counter = counter + 1
                        end
                    end
                end
            end
        elseif (type(layout.name) == "string") then
            --hs.alert.show("Applying Layout in string")
            hs.application.launchOrFocus(layout.name)
            local app = hs.appfinder.appFromName(layout.name)

            if (app) then
                local wins = app:allWindows()
                local counter = 1
                for j, win in ipairs(wins) do
                    if (win:isVisible() and layout.func) then
                        layout.func(counter, win)
                        counter = counter + 1
                    end
                end
            end
        end
    end
 end

function pushCurrent(x, y, w, h)
    local window = hs.window.focusedWindow()
    pushWindow(window, x, y, w, h)
end

function pushWindow(window, x, y, w, h)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()
  
    frame.x = max.x + (max.w * x)
    frame.y = max.y + (max.h * y)
    frame.w = max.w * w
    frame.h = max.h * h
    window:setFrame(frame)
end
