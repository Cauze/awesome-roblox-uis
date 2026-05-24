-- MidnightHub Library Example
-- Source: https://github.com/NIcoGabrielRealYtr/Midnight-Hub-Library

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NIcoGabrielRealYtr/Midnight-Hub-Library/refs/heads/main/Source"))()

local Window = Library:Window({
    Name = "Midnight Hub"
})

local Watermark = Library:Watermark("Midnight Hub")

local KeyList = Library:KeybindList()

local MainPage = Window:Page({
    Name = "Main",
    Icon = "rbxassetid://106237632702124"
})

local LeftSection = MainPage:Section({
    Name = "Combat",
    Side = 1
})

local aimbotToggle = LeftSection:Toggle({
    Name = "Aimbot",
    Flag = "AimbotEnabled",
    Default = false,
    Callback = function(Value)
        print("Aimbot:", Value)
    end
})

aimbotToggle:Keybind({
    Name = "Keybind",
    Flag = "AimbotKey",
    Default = Enum.UserInputType.MouseButton2,
    Mode = "Toggle"
})

aimbotToggle:Colorpicker({
    Name = "Color",
    Flag = "AimbotColor",
    Default = Color3.fromRGB(0, 255, 0),
    Alpha = 0.5
})

LeftSection:Dropdown({
    Name = "Target Priority",
    Flag = "TargetPriority",
    Default = "Closest",
    Items = {"Closest", "Lowest HP", "Highest HP", "Random"},
    Multi = false,
    Callback = function(Value)
        print("Priority:", Value)
    end
})

LeftSection:Dropdown({
    Name = "Hitboxes",
    Flag = "Hitboxes",
    Default = {"Head"},
    Items = {"Head", "Chest", "Arms", "Legs"},
    Multi = true,
    Callback = function(Value)
        print("Hitboxes:", Value)
    end
})

LeftSection:Textbox({
    Name = "Custom Setting",
    Flag = "CustomSetting",
    Default = "Default",
    Placeholder = "Enter value...",
    Callback = function(Value)
        print("Custom:", Value)
    end
})

LeftSection:Searchbox({
    Name = "Weapon Selection",
    Flag = "WeaponList",
    Default = {"AK-47"},
    Items = {"AK-47", "M4A4", "AWP", "Deagle", "USP-S", "Glock-18"},
    Multi = true,
    Callback = function(Value)
        print("Weapons:", Value)
    end
})

local RightSection = MainPage:Section({
    Name = "Visuals",
    Side = 2
})

RightSection:Label("ESP Color"):Colorpicker({
    Flag = "ESPColor",
    Default = Color3.fromRGB(0, 255, 0),
    Alpha = 0.8,
    Callback = function(Value)
        print("ESP Color:", Value)
    end
})

RightSection:Label("Trigger Key"):Keybind({
    Flag = "TriggerKey",
    Default = Enum.KeyCode.X,
    Mode = "Hold",
    Callback = function()
        print("Trigger key pressed")
    end
})

RightSection:Slider({
    Name = "ESP Transparency",
    Flag = "ESPTransparency",
    Default = 0.5,
    Min = 0,
    Max = 1,
    Decimals = 0.01,
    Suffix = "",
    Callback = function(Value)
        print("Transparency:", Value)
    end
})

local ActionButtons = RightSection:Button()
ActionButtons:Add("Left Click", function()
    print("Left click action")
end)

ActionButtons:Add("Right Click", function()
    print("Right click action")
end)

RightSection:Dropdown({
    Name = "ESP Type",
    Flag = "ESPType",
    Default = "Box",
    Items = {"Box", "Glow", "Chams", "All"},
    Multi = false,
    Callback = function(Value)
        print("ESP Type:", Value)
    end
})

local SettingsPage = Window:Page({
    Name = "Settings",
    Icon = "rbxassetid://10734950309"
})

local SettingsSection = SettingsPage:Section({
    Name = "Configuration",
    Side = 1
})

SettingsSection:Button({
    Name = "Save Config",
    Callback = function()
        print("Config saved")
    end
})

SettingsSection:Button({
    Name = "Load Config",
    Callback = function()
        print("Config loaded")
    end
})

SettingsSection:Dropdown({
    Name = "Theme",
    Flag = "Theme",
    Default = "Dark",
    Items = {"Dark", "Light"},
    Multi = false,
    Callback = function(Value)
        print("Theme:", Value)
    end
})

Library:CreateSettingsPage(Window, Watermark, KeyList)