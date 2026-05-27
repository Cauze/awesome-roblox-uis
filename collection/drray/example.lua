--[[
    DrRay Example
    Source: https://github.com/AZYsGithub/DrRay-UI-Library
]]

local DrRay = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local Window = DrRay:Window("DrRay Example")

local MainTab = Window:NewTab("Main")

local MainSection = MainTab:NewSection("Controls")

MainSection:NewButton("Print Hello", "Prints a message", function()
    print("Hello from DrRay!")
end)

MainSection:NewToggle("Auto Farm", "Toggles auto farming", function(state)
    print("Auto Farm:", state)
end)

MainSection:NewSlider("Walk Speed", 16, 200, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

MainSection:NewDropdown("Weapon", {"Sword", "Gun", "Bow", "Staff"}, function(value)
    print("Selected:", value)
end)

MainSection:NewTextBox("Player Name", "Enter name", function(text)
    print("Input:", text)
end)

MainSection:NewLabel("DrRay Example v1.0")
