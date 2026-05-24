-- Kavo UI Library Example
-- https://github.com/xHeptc/Kavo-UI-Library

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Available themes: "DarkTheme", "LightTheme", "BloodTheme", "GrapeTheme", "Ocean", "Midnight", "Sentinel", "Synapse", "Serpent"
local Window = Library.CreateLib("Kavo UI Demo", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Basic Elements")

Section:NewButton("Godmode", "Click to activate godmode", function()
    print("Godmode activated!")
end)

Section:NewToggle("Kill All", "Toggle to kill all players", function(state)
    print("Kill All:", state and "Enabled" or "Disabled")
end)

Section:NewSlider("Walkspeed", "Adjust player walkspeed", 500, 0, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

Section:NewTextBox("Jumppower", "Enter jumppower value", function(value)
    local num = tonumber(value)
    if num then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
    end
end)

Section:NewKeybind("Toggle UI", "Press to toggle UI visibility", Enum.KeyCode.F, function()
    print("UI Toggled!")
end)

Section:NewDropdown("Select Body Part", "Choose a body part", {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}, function(selection)
    print("Selected:", selection)
end)

Section:NewColorPicker("Theme Color", "Pick a theme color", Color3.fromRGB(74, 99, 135), function(color)
    print("Color selected:", color)
end)

local Section2 = Tab:NewSection("Additional Controls")

Section2:NewLabel("This is a label")

Section2:NewDivider()

Section2:NewParagraph("Info", "This is a paragraph element\n\nIt can contain multiple lines of text.")

local Tab2 = Window:NewTab("Settings")

local Section3 = Tab2:NewSection("Info")
Section3:NewLabel("To change theme, create a new window with a different theme name")
Section3:NewButton("Recreate with Ocean Theme", "Recreates UI with Ocean theme", function()
    Window:Destroy()
    Library.CreateLib("Kavo UI Demo", "Ocean")
end)

local Section4 = Tab2:NewSection("Window Controls")
Section4:NewButton("Destroy UI", "Closes and destroys the UI", function()
    Window:Destroy()
end)