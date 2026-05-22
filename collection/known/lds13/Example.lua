local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/sametexe001/sametlibs/main/lds13/Library.lua"))()

local Window = Library:Window({
    Name = "LDS13 Example",
    SubTitle = "Premium UI Library",
    TimeRemaining = 0
})

local CombatTab = Window:Page({
    Name = "Combat",
    Icon = "6102786895",
    Columns = 2
})

local VisualsTab = Window:Page({
    Name = "Visuals",
    Icon = "12438925883",
    Columns = 2
})

local MiscTab = Window:Page({
    Name = "Miscellaneous",
    Icon = "3218332451",
    Columns = 2
})

local SettingsTab = Window:Page({
    Name = "Settings",
    Icon = "7733969237",
    Columns = 2
})

local CombatMain = CombatTab:Section({
    Name = "Main",
    Side = 1
})

local CombatAim = CombatTab:Section({
    Name = "Aimbot",
    Side = 2
})

local VisualsESP = VisualsTab:Section({
    Name = "ESP",
    Side = 1
})

local VisualsWorld = VisualsTab:Section({
    Name = "World",
    Side = 2
})

local MiscUI = MiscTab:Section({
    Name = "UI Settings",
    Side = 1
})

local MiscInfo = MiscTab:Section({
    Name = "Information",
    Side = 2
})

CombatMain:Toggle({
    Name = "Silent Aim",
    Flag = "SilentAim",
    Default = false,
    Callback = function(Value)
        print("Silent Aim:", Value)
    end
}):Colorpicker({
    Name = "Color",
    Flag = "SilentAimColor",
    Default = Color3.fromRGB(255, 100, 100),
    Callback = function(Value)
        print("Silent Aim Color:", Value)
    end
})

CombatMain:Toggle({
    Name = "Targeting",
    Flag = "Targeting",
    Default = true,
    Callback = function(Value)
        print("Targeting:", Value)
    end
}):Keybind({
    Name = "Key",
    Flag = "TargetingKey",
    Default = Enum.KeyCode.Q,
    Mode = "Toggle",
    Callback = function(Value)
        print("Targeting Key:", Value)
    end
})

CombatMain:Slider({
    Name = "FOV",
    Flag = "FOV",
    Min = 10,
    Max = 500,
    Default = 90,
    Suffix = "",
    Decimals = 0,
    Callback = function(Value)
        print("FOV:", Value)
    end
})

CombatMain:Dropdown({
    Name = "Hitbox",
    Flag = "Hitbox",
    Items = {"Head", "Torso", "Random"},
    Default = "Head",
    MaxSize = 145,
    Multi = false,
    Callback = function(Value)
        print("Hitbox:", Value)
    end
})

CombatMain:Button({
    Name = "Kill All",
    Callback = function()
        print("Kill All pressed")
    end
})

CombatMain:Button({
    Name = "Teleport to Player",
    Callback = function()
        print("Teleport pressed")
    end
})

CombatAim:Slider({
    Name = "Smoothness",
    Flag = "Smoothness",
    Min = 0,
    Max = 100,
    Default = 50,
    Suffix = "%",
    Decimals = 1,
    Callback = function(Value)
        print("Smoothness:", Value)
    end
})

CombatAim:Toggle({
    Name = "Prediction",
    Flag = "Prediction",
    Default = true,
    Callback = function(Value)
        print("Prediction:", Value)
    end
})

CombatAim:Slider({
    Name = "Prediction Amount",
    Flag = "PredictionAmount",
    Min = 0,
    Max = 10,
    Default = 2,
    Suffix = "ms",
    Decimals = 1,
    Callback = function(Value)
        print("Prediction Amount:", Value)
    end
})

VisualsESP:Toggle({
    Name = "Player ESP",
    Flag = "PlayerESP",
    Default = false,
    Callback = function(Value)
        print("Player ESP:", Value)
    end
})

VisualsESP:Toggle({
    Name = "Box ESP",
    Flag = "BoxESP",
    Default = true,
    Callback = function(Value)
        print("Box ESP:", Value)
    end
})

VisualsESP:Toggle({
    Name = "Tracers",
    Flag = "Tracers",
    Default = false,
    Callback = function(Value)
        print("Tracers:", Value)
    end
})

VisualsESP:Label("ESP Color"):Colorpicker({
    Name = "Color",
    Flag = "ESPColor",
    Default = Color3.fromRGB(85, 170, 255),
    Callback = function(Value)
        print("ESP Color:", Value)
    end
})

VisualsWorld:Toggle({
    Name = "World ESP",
    Flag = "WorldESP",
    Default = false,
    Callback = function(Value)
        print("World ESP:", Value)
    end
})

VisualsWorld:Slider({
    Name = "ESP Distance",
    Flag = "ESPDistance",
    Min = 50,
    Max = 2000,
    Default = 500,
    Suffix = "st",
    Decimals = 0,
    Callback = function(Value)
        print("ESP Distance:", Value)
    end
})

VisualsWorld:Dropdown({
    Name = "ESP Type",
    Flag = "ESPType",
    Items = {"2D Box", "3D Box", "Circle"},
    Default = "2D Box",
    MaxSize = 145,
    Multi = false,
    Callback = function(Value)
        print("ESP Type:", Value)
    end
})

MiscUI:Toggle({
    Name = "Hide UI",
    Flag = "HideUI",
    Default = false,
    Callback = function(Value)
        print("Hide UI:", Value)
    end
})

MiscUI:Slider({
    Name = "UI Scale",
    Flag = "UIScale",
    Min = 50,
    Max = 150,
    Default = 100,
    Suffix = "%",
    Decimals = 0,
    Callback = function(Value)
        print("UI Scale:", Value)
    end
})

MiscUI:Textbox({
    Name = "Username",
    Flag = "Username",
    Placeholder = "Enter username",
    Default = "",
    Callback = function(Value)
        print("Username:", Value)
    end,
    Finished = true
})

MiscInfo:Label("LDS13 v1.0.0")
MiscInfo:Label("Created by samet")

MiscInfo:Button({
    Name = "Join Discord",
    Callback = function()
        print("Join Discord pressed")
    end
})

MiscInfo:Button({
    Name = "Copy GitHub Link",
    Callback = function()
        print("Copy GitHub Link pressed")
    end
})

Library:CreateSettingsPage(Window)

return Library