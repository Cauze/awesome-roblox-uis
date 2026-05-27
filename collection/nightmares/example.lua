--[[
    nightmares.fun Example
    Source: https://github.com/GhostDuckyy/UI-Libraries (nightmares.fun)
]]

local Nightmares = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/main/nightmares.fun/source.lua"))()

local Window = Nightmares.Create("Nightmares Example")

local Tab = Window:Tab("Main")

Tab:Button("Print Hello", function()
    print("Hello from nightmares.fun!")
end)

Tab:Toggle("Auto Farm", false, function(state)
    print("Auto Farm:", state)
end)

Tab:Slider("Walk Speed", 16, 200, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

Tab:Dropdown("Weapon", {"Sword", "Gun", "Bow", "Staff"}, function(value)
    print("Selected:", value)
end)

Tab:Textbox("Player Name", function(text)
    print("Input:", text)
end)

Tab:Label("nightmares.fun Example v1.0")
