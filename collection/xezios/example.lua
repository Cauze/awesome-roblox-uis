local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/i77lhm/Libraries/refs/heads/main/Xezios/Library.lua"))()

local Window = Library:Window({
    name = "Xezios",
    Prefix = "XEZIOS",
    Suffix = "PRIME",
    Size = UDim2.new(0, 620, 0, 471)
})

local Tabs = {
    Combat = Window:Tab({Name = "Combat", Icon = "rbxassetid://132776928710277"}),
    Visuals = Window:Tab({Name = "Visuals"}),
    Players = Window:Tab({Name = "Players"}),
    Misc = Window:Tab({Name = "Misc"})
}

local CombatSection = Tabs.Combat:Section({Name = "Aimbot", Side = "Left"})
local CombatSection2 = Tabs.Combat:Section({Name = "Combat Mods", Side = "Right"})

local Toggle = CombatSection:Toggle({
    Name = "Enabled",
    Flag = "aimbot_enabled",
    Default = false,
    Callback = function(state)
        print("Aimbot Enabled:", state)
    end
})

Toggle:Colorpicker({
    Name = "Hello!",
    Flag = "This is a flag"
})

Toggle:Keybind({
    Name = "hello!",
    Callback = function(bool)
        print("Keybind Toggled:", bool)
    end
})

CombatSection:Slider({
    Name = "FOV",
    Suffix = "",
    Flag = "aimbot_fov",
    Callback = function(value)
        print("FOV:", value)
    end,
    Min = 10,
    Max = 360,
    Decimal = 1,
    Default = 90
})

CombatSection:Slider({
    Name = "Smoothness",
    Suffix = "%",
    Flag = "aimbot_smooth",
    Callback = function(value)
        print("Smoothness:", value)
    end,
    Min = 0,
    Max = 100,
    Decimal = 1,
    Default = 50
})

CombatSection:Dropdown({
    Name = "Target Part",
    Flag = "aimbot_target",
    Options = {"Head", "Torso", "HumanoidRootPart"},
    Multi = false,
    Default = "Head",
    Callback = function(option)
        print("Target Part:", option)
    end
})

CombatSection:Button({
    Name = "Silent Aim",
    Callback = function()
        print("Silent Aim clicked")
    end
})

CombatSection:Button({
    Name = "Force Target",
    Callback = function()
        print("Force Target clicked")
    end
})

CombatSection:Textbox({
    Name = "Custom Delay:",
    PlaceHolder = "Enter delay in ms...",
    Default = "",
    Flag = "custom_delay",
    Callback = function(text)
        print("Custom Delay:", text)
    end
})

CombatSection:Label({
    Name = "Combat Section"
})

local Toggle2 = CombatSection2:Toggle({
    Name = "Auto Attack",
    Flag = "auto_attack",
    Default = true,
    Callback = function(state)
        print("Auto Attack:", state)
    end
})

Toggle2:Colorpicker({
    Name = "Hit Color",
    Flag = "hit_color",
    Color = Color3.fromRGB(255, 100, 100),
    Alpha = 0,
    Callback = function(color, alpha)
        print("Hit Color:", color, "Alpha:", alpha)
    end
})

Toggle2:Keybind({
    Name = "Kill All",
    Callback = function(bool)
        print("Kill All:", bool)
    end
})

CombatSection2:Slider({
    Name = "Attack Speed",
    Suffix = "x",
    Flag = "attack_speed",
    Callback = function(value)
        print("Attack Speed:", value)
    end,
    Min = 1,
    Max = 10,
    Decimal = 1,
    Default = 1
})

CombatSection2:Dropdown({
    Name = "Weapon Type",
    Flag = "weapon_type",
    Options = {"Melee", "Gun", "Explosive"},
    Multi = false,
    Callback = function(option)
        print("Weapon Type:", option)
    end
})

CombatSection2:Dropdown({
    Name = "Multi Select",
    Flag = "multi_select",
    Options = {"Option 1", "Option 2", "Option 3", "Option 4"},
    Multi = true,
    Callback = function(options)
        print("Multi Select:", table.concat(options, ", "))
    end
})

local VisualsSection = Tabs.Visuals:Section({Name = "ESP", Side = "Left"})
local VisualsSection2 = Tabs.Visuals:Section({Name = "Chams", Side = "Right"})

local ESPToggle = VisualsSection:Toggle({
    Name = "Player ESP",
    Flag = "esp_enabled",
    Default = false,
    Callback = function(state)
        print("ESP Enabled:", state)
    end
})

ESPToggle:Colorpicker({
    Name = "ESP Color",
    Flag = "esp_color",
    Color = Color3.fromRGB(100, 255, 100),
    Alpha = 0,
    Callback = function(color, alpha)
        print("ESP Color:", color, "Alpha:", alpha)
    end
})

VisualsSection:Toggle({
    Name = "Box ESP",
    Flag = "esp_box",
    Default = true,
    Callback = function(state)
        print("Box ESP:", state)
    end
})

VisualsSection:Toggle({
    Name = "Tracers",
    Flag = "esp_tracers",
    Default = false,
    Callback = function(state)
        print("Tracers:", state)
    end
})

VisualsSection:Toggle({
    Name = "Name ESP",
    Flag = "esp_names",
    Default = true,
    Callback = function(state)
        print("Name ESP:", state)
    end
})

VisualsSection:Slider({
    Name = "ESP Distance",
    Suffix = " studs",
    Flag = "esp_distance",
    Callback = function(value)
        print("ESP Distance:", value)
    end,
    Min = 0,
    Max = 1000,
    Decimal = 1,
    Default = 500
})

VisualsSection:Dropdown({
    Name = "ESP Style",
    Flag = "esp_style",
    Options = {"Corner Box", "Box", "Triangle"},
    Multi = false,
    Default = "Corner Box",
    Callback = function(option)
        print("ESP Style:", option)
    end
})

local ChamsToggle = VisualsSection2:Toggle({
    Name = "Player Chams",
    Flag = "chams_enabled",
    Default = false,
    Callback = function(state)
        print("Chams Enabled:", state)
    end
})

ChamsToggle:Colorpicker({
    Name = "Chams Color",
    Flag = "chams_color",
    Color = Color3.fromRGB(100, 100, 255),
    Alpha = 0,
    Callback = function(color, alpha)
        print("Chams Color:", color)
    end
})

ChamsToggle:Keybind({
    Name = "Chams Toggle",
    Callback = function(bool)
        print("Chams Keybind:", bool)
    end
})

VisualsSection2:Toggle({
    Name = "Outline Chams",
    Flag = "chams_outline",
    Default = true,
    Callback = function(state)
        print("Outline Chams:", state)
    end
})

VisualsSection2:Slider({
    Name = "Chams Transparency",
    Suffix = "",
    Flag = "chams_transparency",
    Callback = function(value)
        print("Chams Transparency:", value)
    end,
    Min = 0,
    Max = 100,
    Decimal = 1,
    Default = 0
})

VisualsSection2:Textbox({
    Name = "Chams Texture URL:",
    PlaceHolder = "Paste texture ID...",
    Default = "",
    Flag = "chams_texture",
    Callback = function(text)
        print("Chams Texture:", text)
    end
})

VisualsSection2:Button({
    Name = "Apply Chams",
    Callback = function()
        print("Apply Chams clicked")
    end
})

local PlayersSection = Tabs.Players:Section({Name = "Movement", Side = "Left"})
local PlayersSection2 = Tabs.Players:Section({Name = "Character", Side = "Right"})

PlayersSection:Toggle({
    Name = "Speed Hack",
    Flag = "speed_hack",
    Default = false,
    Callback = function(state)
        print("Speed Hack:", state)
    end
})

PlayersSection:Slider({
    Name = "Walk Speed",
    Suffix = "",
    Flag = "walk_speed",
    Callback = function(value)
        print("Walk Speed:", value)
    end,
    Min = 16,
    Max = 200,
    Decimal = 1,
    Default = 16
})

PlayersSection:Slider({
    Name = "Jump Power",
    Suffix = "",
    Flag = "jump_power",
    Callback = function(value)
        print("Jump Power:", value)
    end,
    Min = 50,
    Max = 500,
    Decimal = 1,
    Default = 50
})

PlayersSection:Button({
    Name = "Restore Defaults",
    Callback = function()
        print("Restore Defaults clicked")
    end
})

PlayersSection:Dropdown({
    Name = "Fly Mode",
    Flag = "fly_mode",
    Options = {"Normal", "Hold Space", "Toggle"},
    Multi = false,
    Default = "Normal",
    Callback = function(option)
        print("Fly Mode:", option)
    end
})

PlayersSection:Keybind({
    Name = "Fly Keybind",
    Callback = function(bool)
        print("Fly Keybind:", bool)
    end
})

local CharToggle = PlayersSection2:Toggle({
    Name = "Infinite Jump",
    Flag = "infinite_jump",
    Default = false,
    Callback = function(state)
        print("Infinite Jump:", state)
    end
})

CharToggle:Keybind({
    Name = "Reset Key",
    Callback = function(bool)
        print("Reset Key:", bool)
    end
})

PlayersSection2:Toggle({
    Name = "Noclip",
    Flag = "noclip",
    Default = false,
    Callback = function(state)
        print("Noclip:", state)
    end
})

PlayersSection2:Toggle({
    Name = "Invisible",
    Flag = "invisible",
    Default = false,
    Callback = function(state)
        print("Invisible:", state)
    end
})

PlayersSection2:Textbox({
    Name = "Player Name:",
    PlaceHolder = "Enter player name...",
    Default = "",
    Flag = "player_name",
    Callback = function(text)
        print("Player Name:", text)
    end
})

PlayersSection2:Button({
    Name = "Teleport To Player",
    Callback = function()
        print("Teleport clicked")
    end
})

PlayersSection2:Label({
    Name = "Character Modifications"
})

local MiscSection = Tabs.Misc:Section({Name = "General", Side = "Left"})
local MiscSection2 = Tabs.Misc:Section({Name = "UI Settings", Side = "Right"})

MiscSection:Button({
    Name = "Rejoin",
    Callback = function()
        print("Rejoin clicked")
    end
})

MiscSection:Button({
    Name = "Copy Discord",
    Callback = function()
        print("Copy Discord clicked")
    end
})

MiscSection:Button({
    Name = "Execute Script",
    Callback = function()
        print("Execute Script clicked")
    end
})

MiscSection:Textbox({
    Name = "Script URL:",
    PlaceHolder = "Paste script URL...",
    Default = "",
    Flag = "script_url",
    Callback = function(text)
        print("Script URL:", text)
    end
})

MiscSection:Dropdown({
    Name = "Server Region",
    Flag = "server_region",
    Options = {"US East", "US West", "Europe", "Asia"},
    Multi = false,
    Default = "US East",
    Callback = function(option)
        print("Server Region:", option)
    end
})

local UIKeybind = MiscSection2:Keybind({
    Name = "UI Toggle",
    Key = Enum.KeyCode.RightShift,
    Mode = "Toggle",
    Default = true,
    Callback = function(bool)
        print("UI Toggle:", bool)
    end
})

UIKeybind:Colorpicker({
    Name = "Accent Color",
    Flag = "accent_color",
    Color = Color3.fromRGB(108, 109, 152),
    Alpha = 0,
    Callback = function(color, alpha)
        Library:RefreshTheme("accent", color)
    end
})

MiscSection2:Label({
    Name = "UI Settings"
})

MiscSection2:Button({
    Name = "Destroy UI",
    Callback = function()
        Library:Unload()
    end
})

Library:Configs(Window)

task.wait(0.5)
Notifications:Create({
    Name = "Xezios UI Loaded Successfully!",
    Lifetime = 5
})