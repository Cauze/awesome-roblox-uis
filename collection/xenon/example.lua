--[[
    Xenon UI Library - Example
    Source: https://github.com/x2Swiftz/UI-Library
]]

-- Settings (required by Xenon library)
_G.Settings = {
    HidePicture = false,
    HideName = false,
}

-- Load the library
local Xenon = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2Swiftz/UI-Library/main/Libraries/Xenon%20-%20Library.lua"))()

-- Create the window
local lib = Xenon.Create("Xenon Example", "Test Hub")

-- Main Tab
local mainTab = lib:Tab("Main", 4483362458)

mainTab:Button("Print Hello", "Prints a message to console", function()
    print("Hello from Xenon!")
end)

mainTab:Button("Destroy GUI", "Destroys the UI", function()
    lib:ToggleUI()
end)

mainTab:Seperator()

mainTab:Toggle("Auto Farm", "Toggles auto farming", false, function(state)
    print("Auto Farm:", state)
end)

mainTab:Toggle("ESP", "Toggles player ESP", true, function(state)
    print("ESP:", state)
end)

mainTab:Seperator()

mainTab:Slider("Walk Speed", 16, 200, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

mainTab:Slider("Jump Power", 50, 300, 50, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

mainTab:Seperator()

mainTab:Dropdown("Weapon", {"Sword", "Gun", "Bow", "Staff"}, function(value)
    print("Selected weapon:", value)
end)

mainTab:Seperator()

mainTab:TextBox("Player Name", function(text)
    print("Input:", text)
end)

mainTab:Keybind("Toggle UI", Enum.KeyCode.RightControl, {Enum.KeyCode.W, Enum.KeyCode.Unknown}, function()
    lib:ToggleUI()
end)

-- Settings Tab
local settingsTab = lib:Tab("Settings", 4483362458)

settingsTab:Toggle("Sound Effects", "Toggle game sounds", true, function(state)
    print("Sound:", state)
end)

settingsTab:Toggle("Notifications", "Toggle notifications", true, function(state)
    print("Notifications:", state)
end)

settingsTab:Slider("Volume", 0, 10, 5, function(value)
    print("Volume:", value)
end)

settingsTab:Label("Xenon UI Library Example")
settingsTab:Label("Version 1.0")
