local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UI_Libraries/Zypher/Library.lua"))()

local main = Library:CreateMain({
    projName = "Zypher UI Demo",
    Resizable = true,
    MinSize = UDim2.new(0, 400, 0, 400),
    MaxSize = UDim2.new(0, 750, 0, 500),
})

local mainCategory = main:CreateCategory("Main")
local widgetsCategory = main:CreateCategory("Widgets")
local settingsCategory = main:CreateCategory("Settings")

local basicSection = mainCategory:CreateSection("Basic Elements")
local advancedSection = mainCategory:CreateSection("Advanced Elements")

widgetsSection = widgetsCategory:CreateSection("All Widgets")

settingsSection = settingsCategory:CreateSection("Configuration")

basicSection:Create(
    "TextLabel",
    "Welcome to Zypher UI Library"
)

basicSection:Create(
    "Button",
    "Click Me!",
    function()
        print("Button clicked!")
    end,
    {
        animated = true,
    }
)

basicSection:Create(
    "Button",
    "Secondary Button",
    function()
        print("Secondary button pressed")
    end
)

basicSection:Create(
    "Toggle",
    "Enable Feature",
    function(state)
        print("Toggle state:", state)
    end,
    {
        default = false,
    }
)

basicSection:Create(
    "Toggle",
    "Default Enabled Toggle",
    function(state)
        print("Toggle state:", state)
    end,
    {
        default = true,
    }
)

advancedSection:Create(
    "Slider",
    "Sensitivity",
    function(value)
        print("Slider value:", value)
    end,
    {
        min = 0,
        max = 100,
        default = 50,
        precise = false,
    }
)

advancedSection:Create(
    "Slider",
    "Precise Value",
    function(value)
        print("Precise slider:", value)
    end,
    {
        min = 0,
        max = 1,
        default = 0.5,
        precise = true,
    }
)

advancedSection:Create(
    "TextBox",
    "Player Name",
    function(input)
        print("Player name set to:", input)
    end,
    {
        text = "Enter name here",
    }
)

advancedSection:Create(
    "KeyBind",
    "Toggle UI",
    function()
        print("Keybind activated!")
    end,
    {
        default = Enum.KeyCode.F,
    }
)

advancedSection:Create(
    "KeyBind",
    "Reset",
    function()
        print("Reset key pressed")
    end
)

widgetsSection:Create(
    "DropDown",
    "Select Mode",
    function(current)
        print("Selected:", current)
    end,
    {
        options = {
            "Normal",
            "Aggressive",
            "Passive",
            "Custom",
        },
        default = "Normal",
        search = false,
    }
)

widgetsSection:Create(
    "DropDown",
    "Search Players",
    function(current)
        print("Selected player:", current)
    end,
    {
        options = {
            "Player1",
            "Player2",
            "Player3",
        },
        default = "Player1",
        search = true,
    }
)

widgetsSection:Create(
    "ColorPicker",
    "Theme Color",
    function(Color)
        print("Color changed to: RGB(" .. math.floor(Color.R * 255) .. ", " .. math.floor(Color.G * 255) .. ", " .. math.floor(Color.B * 255) .. ")")
    end,
    {
        default = Color3.fromRGB(0, 183, 183),
    }
)

widgetsSection:Create(
    "ColorPicker",
    "Accent Color",
    function(Color)
        print("Accent color:", Color)
    end,
    {
        default = Color3.fromRGB(125, 92, 164),
    }
)

settingsSection:Create(
    "Toggle",
    "Show Watermark",
    function(state)
        print("Watermark:", state)
    end,
    {
        default = true,
    }
)

settingsSection:Create(
    "Slider",
    "UI Scale",
    function(value)
        print("UI Scale:", value)
    end,
    {
        min = 50,
        max = 150,
        default = 100,
        precise = false,
    }
)

settingsSection:Create(
    "Button",
    "Reset Settings",
    function()
        print("Settings reset!")
    end,
    {
        animated = true,
    }
)

settingsSection:Create(
    "TextLabel",
    "Zypher UI Library v1.0"
)