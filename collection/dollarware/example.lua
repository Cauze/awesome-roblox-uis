-- Dollarware UI Library Example
-- Written by wally for awesome-roblox-uis

local repo = 'https://raw.githubusercontent.com/topitbopit/dollarware/main/'
local uiLoader = loadstring(game:HttpGet(repo .. 'library.lua'))

local ui = uiLoader({
    rounding = true,
    theme = 'cherry',
    smoothDragging = true
})

ui.autoDisableToggles = true

local window = ui.newWindow({
    text = 'Dollarware Demo',
    resize = true,
    size = Vector2.new(600, 450),
    position = nil
})

local menu = window:addMenu({
    text = 'Home'
})

do
    local section = menu:addSection({
        text = 'Basic Widgets',
        side = 'auto',
        showMinButton = true
    })

    section:addLabel({
        text = 'Welcome to Dollarware!'
    })

    local toggle = section:addToggle({
        text = 'Toggle Me',
        state = false
    })
    toggle:bindToEvent('onToggle', function(newState)
        ui.notify({
            title = 'Toggle',
            message = 'State: ' .. tostring(newState),
            duration = 2
        })
    end)

    section:addButton({
        text = 'Small Button',
        style = 'small'
    }):bindToEvent('onClick', function()
        ui.notify({
            title = 'Button',
            message = 'Small button clicked!',
            duration = 2
        })
    end):setTooltip('This is a small button')

    section:addButton({
        text = 'Large Button',
        style = 'large'
    }):bindToEvent('onClick', function()
        ui.notify({
            title = 'Button',
            message = 'Large button clicked!',
            duration = 2
        })
    end):setTooltip('This is a large button')

    local hotkey = section:addHotkey({
        text = 'Hotkey'
    })
    hotkey:setHotkey(Enum.KeyCode.G)
    hotkey:setTooltip('Press G to trigger')
    hotkey:linkToControl(toggle)
end

do
    local section = menu:addSection({
        text = 'Values',
        side = 'right',
        showMinButton = true
    })

    section:addSlider({
        text = 'Speed',
        min = 1,
        max = 100,
        step = 1,
        val = 50
    }, function(newValue)
        print('Speed:', newValue)
    end):setTooltip('Adjust speed setting')

    section:addSlider({
        text = 'Volume',
        min = 0,
        max = 100,
        step = 0.1,
        val = 75
    }, function(newValue)
        print('Volume:', newValue)
    end)

    section:addColorPicker({
        text = 'Color',
        color = Color3.fromRGB(255, 100, 100)
    }, function(newColor)
        print('Color:', newColor)
    end)
end

window:addMenu({
    text = 'More'
})

do
    local section = window:addMenu({
        text = 'Inputs'
    }):addSection({
        text = 'Text Input',
        side = 'auto',
        showMinButton = true
    })

    section:addTextbox({
        text = 'Username'
    }):bindToEvent('onFocusLost', function(text)
        ui.notify({
            title = 'Textbox',
            message = 'Entered: ' .. text,
            duration = 3
        })
    end):setTooltip('Type and press Enter')

    section:addTextbox({
        text = 'Search'
    }):bindToEvent('onFocusLost', function(text)
        if text ~= '' then
            ui.notify({
                title = 'Search',
                message = 'Searching for: ' .. text,
                duration = 2
            })
        end
    end)

    local toggle2 = section:addToggle({
        text = 'Enabled Feature',
        state = true
    })
    toggle2:bindToEvent('onToggle', function(state)
        print('Feature', state and 'enabled' or 'disabled')
    end)

    section:addButton({
        text = 'Action Button',
        style = 'large'
    }):bindToEvent('onClick', function()
        ui.notify({
            title = 'Action',
            message = 'Button action executed!',
            duration = 2
        })
    end)
end

window:addMenu({
    text = 'Settings'
})

do
    local section = window:addMenu({
        text = 'Config'
    }):addSection({
        text = 'Configuration',
        side = 'auto',
        showMinButton = false
    })

    section:addLabel({
        text = 'Theme Settings'
    })

    section:addSlider({
        text = 'Transparency',
        min = 0,
        max = 1,
        step = 0.01,
        val = 0.5
    }, function(val)
        print('Transparency:', val)
    end)

    local colorPicker = section:addColorPicker({
        text = 'Accent Color',
        color = Color3.fromRGB(249, 22, 52)
    }, function(newColor)
        print('Accent Color:', newColor)
    end)

    section:addToggle({
        text = 'Dark Mode',
        state = true
    }):bindToEvent('onToggle', function(state)
        print('Dark Mode:', state)
    end)

    section:addButton({
        text = 'Reset Settings',
        style = 'small'
    }):bindToEvent('onClick', function()
        ui.notify({
            title = 'Reset',
            message = 'Settings have been reset!',
            duration = 2
        })
    end)
end

ui.notify({
    title = 'Dollarware',
    message = 'Welcome! Explore all the widgets.',
    duration = 3
})