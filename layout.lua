layout = {
    idea = {
        {
            name = {"iTerm"},
            func = function(index, window)
                window:moveToScreen(hs.screen.primaryScreen())
                pushWindow(window, (2/3), 0, (1/3), 1)
            end
        },
        {
            name = {"Google Chrome"},
            func = function(index, window)
                window:moveToScreen(hs.screen.primaryScreen():next())
                pushWindow(window, 0, 0, 1, 1)
            end
        },
        {
            name = {'IntelliJ IDEA'},
            screen = "primary",
            func = function(index, window)
                window:moveToScreen(hs.screen.primaryScreen())
                pushWindow(window, 0, 0, (2/3), 1)
            end
        },
    },

    vscode = {
        {
            name = {"iTerm"},
            func = function(index, window)
                window:moveToScreen(hs.screen.primaryScreen())
                pushWindow(window, (2/3), 0, (1/3), 1)
            end
        },
        {
            name = {"Google Chrome"},
            func = function(index, window)
                window:moveToScreen(hs.screen.primaryScreen():next())
                pushWindow(window, 0, 0, 1, 1)
            end
        },
        {
            name = {'Code'},
            screen = "primary",
            func = function(index, window)
                window:moveToScreen(hs.screen.primaryScreen())
                pushWindow(window, 0, 0, (2/3), 1)
            end
        },
    },

    chat = {
        {
            name = {"WeChat"},
            func = function(index, window)
                pushWindow(window, (1/2), 0, (1/2), 1)
            end
        },
        {
            name = {'云图梭'},
            func = function(index, window)
                pushWindow(window, 0, 0, (1/2), 1)
            end
        }
    }
}
