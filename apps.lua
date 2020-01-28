function launchApp(mashKey, object)
    hs.hotkey.bind(mashKey, object.key, function() 
        hs.application.launchOrFocus(object.app)
    end)
end
