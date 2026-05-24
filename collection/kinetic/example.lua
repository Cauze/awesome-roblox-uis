--[[
    KINETIC UI

    Author: Blissful#4492
    Finish Date: 26/2/22
    Documentation: https://blissful.gitbook.io/kinetic/
    GitHub: https://github.com/Blissful4992/Kinetic
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Kinetic"))()

local Overrides = {
    Background = Color3.fromRGB(23, 30, 51),
    Section_Background = Color3.fromRGB(18, 23, 38),
    Dark_Borders = Color3.fromRGB(18, 23, 38),
    Light_Borders = Color3.fromRGB(255, 255, 255),
    Text_Color = Color3.fromRGB(235, 235, 235),
    Accent = Color3.fromRGB(255, 81, 0),
    Dark_Accent = Color3.fromRGB(140, 45, 0),
}

local Window = Library.NewWindow({
    Text = "Kinetic UI Demo",
    WindowSize = Vector2.new(550, 450),
    WindowPosition = Vector2.new(400, 200),
    ThemeOverrides = Overrides,
    Scalable = true,
    WindowSizeCallback = function(new)
        print("Window size changed to: " .. new.X .. ", " .. new.Y)
    end,
    WindowPositionCallback = function(new)
        print("Window position changed to: " .. new.X .. ", " .. new.Y)
    end,
    CloseCallback = function()
        print("UI closed!")
    end
})

local Page1 = Window.NewPage({Text = "Main"})
local Page2 = Window.NewPage({Text = "Settings"})

local Section1 = Page1.NewSection({Text = "Basic Widgets"})
local Section2 = Page1.NewSection({Text = "Selection Widgets"})

Section1.NewButton({
    Text = "Click Me",
    Callback = function()
        print("Button clicked!")
    end,
    Description = "A simple button for one-time actions"
})

Section1.NewToggle({
    Text = "Toggle Me",
    Callback = function(bool)
        print("Toggle value:", bool)
    end,
    Default = true,
    Description = "A toggle switch that can be turned on/off"
})

Section1.NewTextBox({
    Text = "Text Input",
    PlaceHolderText = "Type here...",
    Callback = function(text)
        print("Text input:", text)
    end,
    Default = "Green",
    Description = "A text input box",
    OnlyNumeric = false,
})

Section1.NewSlider({
    Text = "Volume",
    Callback = function(value)
        print("Slider value:", value)
    end,
    Default = 50,
    Min = 0,
    Max = 100,
    Decimals = 0,
    Suffix = "%",
    Description = "A slider for numerical values"
})

Section2.NewDropdown({
    Text = "Select Option",
    Callback = function(option)
        print("Selected:", option)
    end,
    Options = {"Red", "Green", "Blue", "Yellow"},
    Default = 2,
    Description = "A dropdown to select one option"
})

Section2.NewKeybind({
    Text = "Press Key",
    Callback = function()
        print("Keybind activated!")
    end,
    KeyCallback = function(new)
        print("Key changed to:", string.sub(tostring(new), 14, #tostring(new)))
    end,
    Default = Enum.KeyCode.X,
    Description = "A keybind that triggers on press"
})

Section2.NewColorPicker({
    Text = "Choose Color",
    Callback = function(color)
        print("Color picked:", color.R, color.G, color.B)
    end,
    Default = Color3.fromRGB(255, 81, 0),
    Description = "A color picker widget"
})

Section2.NewChipset({
    Text = "Features",
    Callback = function(tbl)
        print("Chipset options:")
        for i, v in pairs(tbl) do
            print("  " .. tostring(i) .. ": " .. tostring(v))
        end
    end,
    Options = {
        FeatureA = true,
        FeatureB = false,
        FeatureC = true
    },
    Description = "Multiple toggle switches in a compact layout"
})

local PlayerTbl = {}
Section2.NewPlayerChipset({
    Text = "Select Players",
    Callback = function(tbl)
        PlayerTbl = tbl
        print("Selected players:", #tbl)
    end,
    Description = "Auto-updating player selection list"
})

local NotificationSection = Page2.NewSection({Text = "Notifications"})
NotificationSection.NewButton({
    Text = "Show Notification",
    Callback = function()
        Window.NewNotification({
            Title = "Notification",
            Body = "This is a notification from Kinetic UI!",
            Time = 5
        })
    end,
    Description = "Display a notification"
})

Window.NewNotification({
    Title = "Welcome",
    Body = "Kinetic UI loaded successfully!",
    Time = 3
})