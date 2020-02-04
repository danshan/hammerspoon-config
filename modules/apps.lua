function launchApp(basicKey, object)
    hs.hotkey.bind(basicKey, object.key, function() 
        hs.application.launchOrFocus(object.app)
        local window = hs.application.get(object.app):focusedWindow()
        moveToCenterOfWindow(window)
    end)
end
