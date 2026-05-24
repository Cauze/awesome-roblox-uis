local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/sametexe001/sametlibs/main/avilon/Library.lua"))()

local Window = Library:Window({
    Name = "Avilon UI",
    SubName = "Premium UI Library",
    Logo = "rbxassetid://114856413138528"
})

local CombatTab = Window:Page({
    Name = "Combat",
    Icon = "rbxassetid://6031071053"
})

local VisualsTab = Window:Page({
    Name = "Visuals",
    Icon = "rbxassetid://6031068420"
})

local MiscTab = Window:Page({
    Name = "Miscellaneous",
    Icon = "rbxassetid://6031068914"
})

local SettingsTab = Window:Page({
    Name = "Settings",
    Icon = "rbxassetid://118813823415057"
})

local CombatPage = CombatTab:SubPage({
    Name = "Main",
    Description = "Combat-related features",
    Icon = "rbxassetid://74595432438103"
})

local CombatSection = CombatPage:Section({
    Name = "Aimbot",
    Description = "Aimbot configuration",
    Side = 1
})

CombatSection:Toggle({
    Name = "Enable Aimbot",
    Flag = "AimbotEnabled",
    Default = false,
    Callback = function(State)
        print("Aimbot Enabled:", State)
    end
})

CombatSection:Slider({
    Name = "Aimbot FOV",
    Flag = "AimbotFOV",
    Min = 10,
    Max = 360,
    Default = 90,
    Suffix = "",
    Decimals = 0,
    Callback = function(Value)
        print("Aimbot FOV:", Value)
    end
})

CombatSection:Slider({
    Name = "Smoothness",
    Flag = "AimbotSmooth",
    Min = 0.1,
    Max = 5,
    Default = 1,
    Suffix = "x",
    Decimals = 1,
    Callback = function(Value)
        print("Smoothness:", Value)
    end
})

CombatSection:Dropdown({
    Name = "Target Part",
    Flag = "TargetPart",
    Items = {"Head", "Torso", "HumanoidRootPart"},
    Default = "Head",
    MaxSize = 120,
    Multi = false,
    Callback = function(Value)
        print("Target Part:", Value)
    end
})

CombatSection:Toggle({
    Name = "Show FOV Circle",
    Flag = "ShowFOV",
    Default = true,
    Callback = function(State)
        print("Show FOV:", State)
    end
})

CombatSection:Button({
    Name = "Silent Aim",
    Callback = function()
        print("Silent Aim clicked")
    end
})

local SecondSection = CombatPage:Section({
    Name = "Other Combat",
    Description = "Additional combat features",
    Side = 2
})

SecondSection:Toggle({
    Name = "Triggerbot",
    Flag = "Triggerbot",
    Default = false,
    Callback = function(State)
        print("Triggerbot:", State)
    end
})

SecondSection:Toggle({
    Name = "Auto Fire",
    Flag = "AutoFire",
    Default = false,
    Callback = function(State)
        print("Auto Fire:", State)
    end
})

SecondSection:Slider({
    Name = "Fire Rate",
    Flag = "FireRate",
    Min = 100,
    Max = 1000,
    Default = 500,
    Suffix = "ms",
    Decimals = 0,
    Callback = function(Value)
        print("Fire Rate:", Value)
    end
})

local VisualsPage = VisualsTab:SubPage({
    Name = "ESP",
    Description = "Visual enhancements",
    Icon = "rbxassetid://74595432438103"
})

local ESPSection = VisualsPage:Section({
    Name = "Player ESP",
    Description = "Player visibility features",
    Side = 1
})

ESPSection:Toggle({
    Name = "Player ESP",
    Flag = "PlayerESP",
    Default = false,
    Callback = function(State)
        print("Player ESP:", State)
    end
})

ESPSection:Toggle({
    Name = "Box ESP",
    Flag = "BoxESP",
    Default = false,
    Callback = function(State)
        print("Box ESP:", State)
    end
})

ESPSection:Toggle({
    Name = "Tracers",
    Flag = "Tracers",
    Default = false,
    Callback = function(State)
        print("Tracers:", State)
    end
})

ESPSection:Toggle({
    Name = "Name ESP",
    Flag = "NameESP",
    Default = false,
    Callback = function(State)
        print("Name ESP:", State)
    end
})

ESPSection:Colorpicker({
    Name = "ESP Color",
    Flag = "ESPColor",
    Default = Color3.fromRGB(255, 0, 0),
    Alpha = 0,
    Callback = function(Color, Alpha)
        print("ESP Color:", Color, "Alpha:", Alpha)
    end
})

local WorldSection = VisualsPage:Section({
    Name = "World ESP",
    Description = "World-related visuals",
    Side = 2
})

WorldSection:Toggle({
    Name = "Object ESP",
    Flag = "ObjectESP",
    Default = false,
    Callback = function(State)
        print("Object ESP:", State)
    end
})

WorldSection:Dropdown({
    Name = "ESP Type",
    Flag = "ESPType",
    Items = {"Box", "Corner", "Outline"},
    Default = "Box",
    MaxSize = 100,
    Multi = false,
    Callback = function(Value)
        print("ESP Type:", Value)
    end
})

WorldSection:Slider({
    Name = "ESP Range",
    Flag = "ESPRange",
    Min = 50,
    Max = 2000,
    Default = 500,
    Suffix = "studs",
    Decimals = 0,
    Callback = function(Value)
        print("ESP Range:", Value)
    end
})

local MiscPage = MiscTab:SubPage({
    Name = "General",
    Description = "General settings",
    Icon = "rbxassetid://74595432438103"
})

local GeneralSection = MiscPage:Section({
    Name = "Player Modifications",
    Description = "Modify player behavior",
    Side = 1
})

GeneralSection:Toggle({
    Name = "Speed Hack",
    Flag = "SpeedHack",
    Default = false,
    Callback = function(State)
        print("Speed Hack:", State)
    end
})

GeneralSection:Slider({
    Name = "Walk Speed",
    Flag = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 16,
    Suffix = "",
    Decimals = 0,
    Callback = function(Value)
        print("Walk Speed:", Value)
    end
})

GeneralSection:Toggle({
    Name = "Jump Hack",
    Flag = "JumpHack",
    Default = false,
    Callback = function(State)
        print("Jump Hack:", State)
    end
})

GeneralSection:Slider({
    Name = "Jump Power",
    Flag = "JumpPower",
    Min = 50,
    Max = 300,
    Default = 50,
    Suffix = "",
    Decimals = 0,
    Callback = function(Value)
        print("Jump Power:", Value)
    end
})

GeneralSection:Textbox({
    Name = "Player Name",
    Flag = "PlayerName",
    Default = "",
    Placeholder = "Enter player name...",
    Finished = false,
    Numeric = false,
    Callback = function(Value)
        print("Player Name:", Value)
    end
})

local LabelSection = MiscPage:Section({
    Name = "Labels & Keybinds",
    Description = "Info labels with keybinds",
    Side = 1
})

local InfoLabel = LabelSection:Label({
    Name = "Status: Ready"
})

LabelSection:Label({Name = "Mode: Normal"}):Keybind({
    Flag = "ModeKeybind",
    Mode = "Toggle",
    Default = Enum.KeyCode.F,
    Callback = function(Value)
        print("Mode Keybind pressed:", Value)
    end
})

local KeybindLabel = LabelSection:Label({
    Name = "Press any key"
})

KeybindLabel:Keybind({
    Flag = "CustomKeybind",
    Mode = "Toggle",
    Default = Enum.KeyCode.G,
    Callback = function(Value)
        print("Custom Keybind:", Value)
    end
})

LabelSection:Button({
    Name = "Update Status",
    Callback = function()
        InfoLabel:SetText("Status: Active")
    end
})

local ConfigSection = MiscPage:Section({
    Name = "Configuration",
    Description = "Save and load configurations",
    Side = 2
})

ConfigSection:Textbox({
    Name = "Config Name",
    Flag = "ConfigName",
    Default = "",
    Placeholder = "New config...",
    Finished = true,
    Numeric = false,
    Callback = function(Value)
        print("Config Name:", Value)
    end
})

ConfigSection:Button({
    Name = "Save Config",
    Callback = function()
        local Config = Library:GetConfig()
        print("Current Config:", Config)
    end
})

ConfigSection:Button({
    Name = "Load Config",
    Callback = function()
        print("Load Config clicked")
    end
})

ConfigSection:Colorpicker({
    Name = "Accent Color",
    Flag = "AccentColor",
    Default = Color3.fromRGB(131, 48, 15),
    Alpha = 0,
    Callback = function(Color, Alpha)
        print("Accent Color:", Color)
    end
})

local SettingsPage = SettingsTab:SubPage({
    Name = "Settings",
    Description = "UI settings",
    Icon = "rbxassetid://74595432438103"
})

local UISection = SettingsPage:Section({
    Name = "UI Settings",
    Description = "Configure UI behavior",
    Side = 1
})

UISection:Label({Name = "UI Bind"}):Keybind({
    Flag = "UIBind",
    Mode = "Toggle",
    Default = Enum.KeyCode.RightShift,
    Callback = function(Value)
        Library.MenuKeybind = Value
        print("UI Bind changed to:", Value)
    end
})

UISection:Button({
    Name = "Unload UI",
    Callback = function()
        Library:Exit()
    end
})

UISection:Button({
    Name = "Toggle UI",
    Callback = function()
        print("Toggle UI")
    end
})

local InfoPage = MiscTab:SubPage({
    Name = "Information",
    Description = "Library information",
    Icon = "rbxassetid://6031068914"
})

local InfoSection = InfoPage:Section({
    Name = "About",
    Description = "Avilon UI Library information",
    Side = 1
})

InfoSection:Label({Name = "Avilon UI Library"})
InfoSection:Label({Name = "Version: 1.0.0"})
InfoSection:Label({Name = "Made by: samet"})
InfoSection:Button({
    Name = "Discord Server",
    Callback = function()
        print("Discord Server clicked")
    end
})

print("Avilon UI Example loaded successfully!")