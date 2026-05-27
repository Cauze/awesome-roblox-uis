--[[
    Bracket V3.4 Example
    Source: https://github.com/kitodoescode/Bracket
]]

local Bracket = loadstring(game:HttpGet("https://raw.githubusercontent.com/kitodoescode/Bracket/main/BracketV34.lua"))()

local Window = Bracket:Window({
    Name = "Bracket Example",
    Size = UDim2.fromOffset(580, 420),
    Accent = Color3.fromRGB(100, 70, 200),
})

local MainTab = Window:Tab({ Name = "Main" })

local MainSection = MainTab:Section({ Name = "Controls" })

MainSection:Button({
    Name = "Print Hello",
    Callback = function()
        print("Hello from Bracket!")
    end,
})

MainSection:Toggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        print("Auto Farm:", state)
    end,
})

MainSection:Slider({
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
})

MainSection:Dropdown({
    Name = "Weapon",
    Options = {"Sword", "Gun", "Bow", "Staff"},
    Callback = function(value)
        print("Selected:", value)
    end,
})

MainSection:Textbox({
    Name = "Player Name",
    Default = "",
    Callback = function(text)
        print("Input:", text)
    end,
})

MainSection:Label({ Name = "Bracket V3.4 Example" })
