function launchApp(basicKey, object)
    hs.hotkey.bind(basicKey, object.key, function() 
        hs.application.launchOrFocus(object.app)
        local application = hs.application.get(object.app)
        if application ~= nil then
            local window = application:focusedWindow()
        end
    end)
end
