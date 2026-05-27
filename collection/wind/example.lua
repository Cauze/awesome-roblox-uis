--[[
    WindUI Example
    Source: https://github.com/Footagesus/WindUI
]]

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "WindUI Example",
    Author = "Example Hub",
    Folder = "WindUI_Example",
    Size = UDim2.fromOffset(580, 490),
    Theme = "Dark",
    Acrylic = false,
})

local MainTab = Window:Tab({ Title = "Main", Icon = "home" })

MainTab:Button({
    Title = "Print Hello",
    Callback = function()
        print("Hello from WindUI!")
    end,
})

MainTab:Toggle({
    Title = "Auto Farm",
    Default = false,
    Callback = function(state)
        print("Auto Farm:", state)
    end,
})

MainTab:Slider({
    Title = "Walk Speed",
    Value = { Min = 16, Max = 200, Default = 16 },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
})

MainTab:Dropdown({
    Title = "Weapon",
    Values = {"Sword", "Gun", "Bow", "Staff"},
    Callback = function(value)
        print("Selected:", value)
    end,
})

MainTab:Input({
    Title = "Player Name",
    Callback = function(text)
        print("Input:", text)
    end,
})

MainTab:Label({ Title = "WindUI Example v1.0" })
