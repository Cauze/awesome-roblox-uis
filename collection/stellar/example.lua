-- Stellar Library Example
-- Source: https://github.com/Da7mu/Leaked-Stellar-Ui

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Da7mu/Leaked-Stellar-Ui/refs/heads/main/Library.lua"))()

local Window = Library:CreateWindow({
    Name = "Stellar UI",
    SubName = "Example",
    Logo = "rbxassetid://81441172534384",
    WatermarkEnabled = true,
    WatermarkText = "Stellar Example",
    SettingsTabEnabled = true,
    ExpiresSeconds = 86400
})

local CombatPage = Window:AddTab({
    Name = "Combat",
    Icon = "sword"
})

local AimbotSection = CombatPage:AddSection({
    Name = "Aimbot & Triggerbot",
    Icon = "crosshair"
})

AimbotSection:AddToggle({
    Name = "Enable Aimbot",
    Default = false,
    Flag = "AimbotEnabled",
    Callback = function(v)
        print("Aimbot:", v)
    end
})

AimbotSection:AddButton({
    Name = "Force Headshot",
    Callback = function(value)
        print("Force Headshot clicked")
    end
})

AimbotSection:AddSlider({
    Name = "FOV",
    Min = 0,
    Max = 360,
    Default = 120,
    Flag = "AimbotFOV",
    Callback = function(value)
        print("FOV:", value)
    end
})

AimbotSection:AddDropdown({
    Name = "Aim Part",
    Items = {"Head", "UpperTorso", "HumanoidRootPart", "Random"},
    Default = "Head",
    Flag = "AimPart",
    Callback = function(value)
        print("Aim Part:", value)
    end
})

AimbotSection:AddDropdown({
    Name = "Hit Chance",
    Items = {"100%", "90%", "75%", "50%"},
    Default = {"100%"},
    Multi = true,
    Flag = "HitChance",
    Callback = function(value)
        print("Hit Chance:", value)
    end
})

AimbotSection:AddTextbox({
    Name = "Amount of Hitlers",
    Placeholder = "0.12",
    Default = "0.125",
    Numeric = true,
    Finished = true,
    Flag = "hitlersvalue",
    Callback = function(value)
        print("Hitlers Value:", value)
    end
})

AimbotSection:AddLabel("Advanced Options")

AimbotSection:AddToggle({
    Name = "Wallbang",
    Default = false,
    Flag = "Wallbang",
    Callback = function(value)
        print("Wallbang:", value)
    end
})

AimbotSection:AddLabel("Wallbang Color"):Colorpicker({
    Default = Color3.fromRGB(255, 0, 100),
    Flag = "WallbangColor",
    Callback = function(value)
        print("Wallbang Color:", value)
    end
})

AimbotSection:AddToggle({
    Name = "Triggerbot",
    Default = false,
    Flag = "Triggerbot",
    Callback = function(value)
        print("Triggerbot:", value)
    end
})

local VisualsPage = Window:AddTab({
    Name = "Visuals",
    Icon = "eye"
})

local ESPSection = VisualsPage:AddSection({
    Name = "ESP Settings",
    Icon = "box"
})

ESPSection:AddToggle({
    Name = "Box ESP",
    Default = false,
    Flag = "BoxESP",
    Callback = function(value)
        print("Box ESP:", value)
    end
})

ESPSection:AddToggle({
    Name = "Name ESP",
    Default = false,
    Flag = "NameESP",
    Callback = function(value)
        print("Name ESP:", value)
    end
})

ESPSection:AddSlider({
    Name = "ESP Distance",
    Min = 0,
    Max = 500,
    Default = 100,
    Flag = "ESPDistance",
    Callback = function(value)
        print("ESP Distance:", value)
    end
})

ESPSection:AddDropdown({
    Name = "ESP Color",
    Items = {"Red", "Green", "Blue", "Yellow"},
    Default = "Red",
    Flag = "ESPColor",
    Callback = function(value)
        print("ESP Color:", value)
    end
})

local SettingsPage = Window:AddSettingsPage({
    Name = "Settings"
})

SettingsPage:AddToggle({
    Name = "Save Config",
    Default = true,
    Flag = "SaveConfig"
})

SettingsPage:AddButton({
    Name = "Reset Settings",
    Callback = function()
        print("Reset clicked")
    end
})

Library.MenuKeybind = tostring(Enum.KeyCode.RightControl)

-- Library:Unload()