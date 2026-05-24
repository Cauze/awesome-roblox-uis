local Cascade = loadstring(game:HttpGet("https://raw.githubusercontent.com/cascadeui/Cascade/refs/heads/main/src/init.luau"))()

local App = Cascade.New({
    Name = "Cascade Example",
    Theme = Cascade.Themes.Light,
    Accent = Cascade.Accents.Blue,
})

App:WindowPill(true)

local Window = App:Window({
    Title = "Cascade UI",
    Size = UDim2.fromOffset(800, 500),
})

local MainPage = Window:Page({
    Name = "Main",
    Theme = {
        Background = Color3.fromRGB(20, 20, 20),
    },
})

local CombatSection = MainPage:Section({
    Title = "Combat",
})

CombatSection:Toggle({
    Label = "Enable Aimbot",
    Default = false,
    OnClick = function(state)
        print("Aimbot:", state)
    end,
})

CombatSection:Slider({
    Label = "Aimbot Speed",
    Min = 1,
    Max = 100,
    Default = 50,
    OnChange = function(value)
        print("Speed:", value)
    end,
})

CombatSection:Dropdown({
    Label = "Target Part",
    Options = {"Head", "Torso", "HumanoidRootPart"},
    Default = "Head",
    OnSelect = function(option)
        print("Target:", option)
    end,
})

CombatSection:ColorPicker({
    Label = "ESP Color",
    Default = Color3.fromRGB(255, 0, 0),
    OnChange = function(color)
        print("Color:", color)
    end,
})

local PlayerSection = MainPage:Section({
    Title = "Player",
})

PlayerSection:Toggle({
    Label = "Speed Hack",
    Default = false,
    OnClick = function(state)
        print("Speed Hack:", state)
    end,
})

PlayerSection:Slider({
    Label = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    OnChange = function(value)
        print("Walk Speed:", value)
    end,
})

PlayerSection:KeybindField({
    Label = "Fly Key",
    Default = Enum.KeyCode.F,
    OnClick = function()
        print("Fly toggled!")
    end,
})

PlayerSection:TextField({
    Label = "Player Name",
    Placeholder = "Enter name...",
    OnSubmit = function(text)
        print("Player:", text)
    end,
})

local VisualsPage = Window:Page({
    Name = "Visuals",
})

local ESPSection = VisualsPage:Section({
    Title = "ESP",
})

ESPSection:Toggle({
    Label = "Player ESP",
    Default = false,
    OnClick = function(state)
        print("Player ESP:", state)
    end,
})

ESPSection:Toggle({
    Label = "Box ESP",
    Default = false,
    OnClick = function(state)
        print("Box ESP:", state)
    end,
})

ESPSection:Toggle({
    Label = "Tracers",
    Default = false,
    OnClick = function(state)
        print("Tracers:", state)
    end,
})

ESPSection:Button({
    Label = "Refresh ESP",
    OnClick = function()
        print("ESP refreshed!")
    end,
})

Window:Notification({
    Title = "Cascade UI",
    Description = "UI loaded successfully!",
    Duration = 3,
})

print("Cascade Example loaded!")