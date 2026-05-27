--[[
    Obsidian Example
    Source: https://github.com/deividcomsono/Obsidian
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()

local Window = Library:CreateWindow({
    Title = "Obsidian Example",
    Size = UDim2.fromOffset(580, 420),
    CornerRadius = 12,
    MinSize = Vector2.new(380, 280),
    MaxSize = Vector2.new(800, 600),
})

local MainTab = Window:CreateTab({
    Title = "Main",
    Icon = "home",
    Description = "Main tab",
})

local MainSection = MainTab:CreateSection("Controls")

MainTab:CreateButton({
    Title = "Print Hello",
    Callback = function()
        print("Hello from Obsidian!")
    end,
})

MainTab:CreateToggle({
    Title = "Auto Farm",
    Default = false,
    Callback = function(state)
        print("Auto Farm:", state)
    end,
})

MainTab:CreateSlider({
    Title = "Walk Speed",
    Value = { Min = 16, Max = 200, Default = 16 },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
})

MainTab:CreateDropdown({
    Title = "Weapon",
    Values = {"Sword", "Gun", "Bow", "Staff"},
    Callback = function(value)
        print("Selected:", value)
    end,
})

MainTab:CreateInput({
    Title = "Player Name",
    Callback = function(text)
        print("Input:", text)
    end,
})

MainTab:CreateLabel({ Title = "Obsidian Example v1.0" })

Library:Notify({
    Title = "Obsidian",
    Content = "UI loaded successfully!",
    Duration = 3,
})
