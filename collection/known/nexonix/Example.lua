local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/sametexe001/sametlibs/main/nexonix/Library.lua"))()

local Window = Library:Create("Nexonix", "Example Script", Color3.fromRGB(85, 170, 255))

local CombatTab = Window:Tab("Combat", "rbxassetid://129245697782918")
local VisualsTab = Window:Tab("Visuals", "rbxassetid://129245697782918")
local MiscTab = Window:Tab("Misc", "rbxassetid://129245697782918")
local SettingsTab = Window:Tab("Settings", "rbxassetid://129245697782918")

-- COMBAT TAB --
local CombatMain = CombatTab:Section("Main", 1)
local CombatExtra = CombatTab:Section("Extra Options", 2)

CombatMain:Toggle({
    Name = "Aimbot",
    Flag = "Aimbot",
    Default = false,
    Tooltip = "Automatically aim at nearest target",
    Callback = function(State)
        print("Aimbot:", State)
    end
})

CombatMain:Slider({
    Name = "FOV",
    Flag = "FOV",
    Min = 10,
    Max = 360,
    Default = 90,
    Decimals = 0,
    Suffix = "",
    Tooltip = "Aimbot field of view",
    Callback = function(Value)
        print("FOV:", Value)
    end
})

CombatMain:RangeSlider({
    Name = "Hit Chance",
    Flag = "HitChance",
    Min = 0,
    Max = 100,
    Default = {20, 80},
    Decimals = 0,
    Suffix = "%",
    Callback = function(Value)
        print("Hit Chance:", Value[1], "-", Value[2])
    end
})

CombatExtra:Toggle({
    Name = "Silent Aim",
    Flag = "SilentAim",
    Default = false
}):Colorpicker({
    Name = "Hit Color",
    Flag = "SilentAimColor",
    Default = Color3.fromRGB(255, 100, 100)
})

CombatExtra:Dropdown({
    Name = "Target Part",
    Flag = "TargetPart",
    Items = {"Head", "Torso", "HumanoidRootPart"},
    Default = "Head",
    Callback = function(Value)
        print("Target Part:", Value)
    end
})

CombatExtra:Button({
    Name = "Kill All",
    Tooltip = "Kill everyone in the server",
    Callback = function()
        print("Killing all...")
    end
})

-- VISUALS TAB --
local VisualsESP = VisualsTab:Section("ESP", 1)
local VisualsWorld = VisualsTab:Section("World", 2)

VisualsESP:Toggle({
    Name = "Player ESP",
    Flag = "PlayerESP",
    Default = false,
    Callback = function(State)
        print("Player ESP:", State)
    end
})

VisualsESP:Label("ESP Color"):Colorpicker({
    Flag = "ESPColor",
    Default = Color3.fromRGB(85, 170, 255)
})

VisualsESP:Toggle({
    Name = "Tracers",
    Flag = "Tracers",
    Default = false
})

VisualsWorld:Slider({
    Name = "ESP Distance",
    Flag = "ESPDistance",
    Min = 50,
    Max = 1000,
    Default = 500,
    Suffix = "studs"
})

VisualsWorld:Dropdown({
    Name = "Box Style",
    Flag = "BoxStyle",
    Items = {"Box", "Corner Box", "Circle"},
    Default = "Box"
})

VisualsWorld:Toggle({
    Name = "Chams",
    Flag = "Chams",
    Default = false
}):Colorpicker({
    Flag = "ChamColor",
    Default = Color3.fromRGB(255, 255, 255)
})

-- MISC TAB --
local MiscMain = MiscTab:Section("General", 1)
local MiscOther = MiscTab:Section("Other", 2)

MiscMain:Textbox({
    Name = "Player Name",
    Flag = "PlayerName",
    Placeholder = "Enter player name...",
    Callback = function(Value)
        print("Player Name:", Value)
    end
})

MiscMain:Toggle({
    Name = "Anti-AFK",
    Flag = "AntiAFK",
    Default = true
})

MiscMain:Toggle({
    Name = "Speed Hack",
    Flag = "SpeedHack",
    Default = false
}):Keybind({
    Flag = "SpeedHackKey",
    Default = Enum.KeyCode.V,
    Mode = "Toggle"
})

MiscOther:Slider({
    Name = "Walk Speed",
    Flag = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 16,
    Suffix = ""
})

MiscOther:Slider({
    Name = "Jump Power",
    Flag = "JumpPower",
    Min = 50,
    Max = 200,
    Default = 50,
    Suffix = ""
})

MiscOther:Button({
    Name = "Rejoin Server",
    Callback = function()
        print("Rejoining...")
    end
})

MiscOther:Button({
    Name = "Copy Discord",
    Callback = function()
        setclipboard("https://discord.gg/example")
        Library:Notification("Copied!", 2, Color3.fromRGB(0, 255, 0))
    end
})

-- SETTINGS TAB --
local SettingsUI = SettingsTab:Section("UI Settings", 1)

SettingsUI:Label("UI Bind"):Keybind({
    Flag = "UIBind",
    Mode = "Toggle",
    Default = Enum.KeyCode.RightShift
})

SettingsUI:Dropdown({
    Name = "Animation Style",
    Flag = "AnimStyle",
    Items = {"Linear", "Quad", "Quart", "Back", "Bounce", "Circular", "Cubic", "Elastic", "Exponential", "Sine", "Quint"},
    Default = "Cubic"
})

SettingsUI:Dropdown({
    Name = "Animation Direction",
    Flag = "AnimDirection",
    Items = {"In", "Out", "InOut"},
    Default = "Out"
})

SettingsUI:Slider({
    Name = "Animation Time",
    Flag = "AnimTime",
    Min = 0,
    Max = 1,
    Default = 0.25,
    Decimals = 0.01,
    Suffix = "s"
})

local SettingsTheme = SettingsTab:Section("Theme", 2)

SettingsTheme:Label("Background"):Colorpicker({
    Flag = "ThemeBackground",
    Default = Color3.fromRGB(24, 26, 30),
    Alpha = 0
})

SettingsTheme:Label("Accent"):Colorpicker({
    Flag = "ThemeAccent",
    Default = Color3.fromRGB(78, 95, 255),
    Alpha = 0
})

SettingsTheme:Label("Element"):Colorpicker({
    Flag = "ThemeElement",
    Default = Color3.fromRGB(38, 38, 50),
    Alpha = 0
})

local Watermark = Library:Watermark({
    Name = "Nexonix",
    Logo = "rbxassetid://77749228793011"
})

local KeybindList = Library:KeybindList({
    Name = "Active Keybinds"
})

local MyKeybind = KeybindList:Add("Speed Hack")
MyKeybind:SetStatus(true)
MyKeybind:SetMode("Toggled")

Library:Notification("Loaded!", 3, Color3.fromRGB(0, 255, 0))