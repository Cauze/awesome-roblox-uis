local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create({
    Name = "Mercury Demo",
    Size = UDim2.fromOffset(600, 450),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
})

local Tab1 = GUI:Tab({
    Name = "Widgets",
    Icon = "rbxassetid://8569322835"
})

local Tab2 = GUI:Tab({
    Name = "Settings",
    Icon = "rbxassetid://8559790237"
})

local Tab3 = GUI:Tab({
    Name = "Credits",
    Icon = "rbxassetid://8577523456"
})

Tab1:Button({
    Name = "Action Button",
    Description = "A simple button widget",
    Callback = function()
        GUI:Notification({
            Title = "Button Clicked",
            Text = "You clicked the action button!",
            Duration = 3
        })
    end
})

Tab1:Toggle({
    Name = "Enable Feature",
    Description = "Toggle a feature on/off",
    StartingState = false,
    Callback = function(state)
        print("Toggle state:", state)
    end
})

Tab1:Slider({
    Name = "Volume",
    Description = "Adjust the volume level",
    Default = 50,
    Min = 0,
    Max = 100,
    Callback = function(value)
        print("Volume:", value)
    end
})

local Dropdown = Tab1:Dropdown({
    Name = "Select Option",
    StartingText = "Choose...",
    Description = "Select an option from the list",
    Items = {
        {"Option 1", "value1"},
        {"Option 2", "value2"},
        {"Option 3", "value3"}
    },
    Callback = function(item)
        print("Selected:", item)
    end
})

Dropdown:AddItems({
    {"Option 4", "value4"},
    {"Option 5", "value5"}
})

Tab1:Textbox({
    Name = "Enter Text",
    Callback = function(text)
        print("Text entered:", text)
    end
})

Tab1:ColorPicker({
    Style = Mercury.ColorPickerStyles.Legacy,
    Callback = function(color)
        print("Color selected:", color)
    end
})

Tab1:Keybind({
    Name = "Toggle UI",
    Description = "Press to toggle the UI",
    Keybind = Enum.KeyCode.RightControl,
    Callback = function()
        Mercury.Toggled = not Mercury.Toggled
        Mercury:show(Mercury.Toggled)
    end
})

Tab2:Button({
    Name = "Show Notification",
    Description = "Display a notification",
    Callback = function()
        GUI:Notification({
            Title = "Settings",
            Text = "This is a notification from the settings tab",
            Duration = 5
        })
    end
})

local ToggleState = false
Tab2:Toggle({
    Name = "Dark Mode",
    Description = "Enable dark mode theme",
    StartingState = true,
    Callback = function(state)
        ToggleState = state
        if state then
            GUI:change_theme(Mercury.Themes.Dark)
        else
            GUI:change_theme(Mercury.Themes.Legacy)
        end
    end
})

Tab2:Slider({
    Name = "Drag Speed",
    Description = "Adjust UI drag smoothness",
    Default = 14,
    Min = 1,
    Max = 20,
    Callback = function(value)
        Mercury.DragSpeed = (20 - value) / 100
    end
})

Tab3:Credit({
    Name = "Abstract",
    Description = "UI Library Developer",
    Discord = "Abstract#8007",
    V3rmillion = "AbstractPoo"
})

Tab3:Credit({
    Name = "Deity",
    Description = "UI Library Developer",
    Discord = "Deity#0228",
    V3rmillion = "0xDEITY"
})

Tab3:Credit({
    Name = "Repository",
    Description = "UI Library Repository",
    Github = "https://github.com/deeeity/mercury-lib/blob/master/src.lua"
})

GUI:Prompt({
    Followup = false,
    Title = "Welcome to Mercury",
    Text = "Mercury is a free and open sourced Roblox UI library. Use the tabs above to explore different widgets.",
    Buttons = {
        ok = function()
            GUI:Notification({
                Title = "Get Started",
                Text = "Explore the widgets tab to see all available UI elements!",
                Duration = 5
            })
            return true
        end
    }
})