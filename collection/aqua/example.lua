--[[
    AquaLIB Example
    Source: https://github.com/GhostDuckyy/UI-Libraries (AquaLIB)
]]

local AquaLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/main/AquaLIB/source.lua"))()

local Window = AquaLib.createWindow("AquaLibExample", "AquaLIB Example", true)

local MainTab = Window.createTab("Main")

MainTab.createButton("Print Hello", function()
    print("Hello from AquaLIB!")
end)

MainTab.createToggle("Auto Farm", false, function(state)
    print("Auto Farm:", state)
end)

MainTab.createSlider("Walk Speed", 16, 200, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

MainTab.createDropdown("Weapon", {"Sword", "Gun", "Bow", "Staff"}, function(value)
    print("Selected:", value)
end)

MainTab.createTextbox("Player Name", function(text)
    print("Input:", text)
end)

MainTab.createText("AquaLIB Example v1.0")
