local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/sametexe001/sametlibs/main/nhack/Library.lua"))()

local Window = Library:Window({
    Title = "Nhack UI",
    ButtonName = "Nhack Demo"
})

local CombatTab = Window:Tab({
    Name = "Combat"
})

local VisualsTab = Window:Tab({
    Name = "Visuals"
})

local SettingsTab = Window:Tab({
    Name = "Settings"
})

local MiscTab = Window:Tab({
    Name = "Misc"
})

local CombatMain = CombatTab:Section({
    Name = "Aimbot",
    Side = 1
})

CombatMain:Toggle({
    Name = "Enable Aimbot",
    Default = false,
    Flag = "aimbot_enabled",
    Callback = function(state)
        print("Aimbot:", state)
    end
})

CombatMain:Slider({
    Name = "FOV",
    Min = 10,
    Max = 360,
    Default = 90,
    Flag = "aimbot_fov",
    Suffix = "",
    Callback = function(value)
        print("FOV:", value)
    end
})

CombatMain:Dropdown({
    Name = "Target Part",
    Items = {"Head", "Torso", "Random"},
    Default = "Head",
    Flag = "aimbot_target",
    Callback = function(value)
        print("Target:", value)
    end
})

CombatMain:Toggle({
    Name = "Silent Aim",
    Default = false,
    Risky = true,
    Flag = "aimbot_silent",
    Callback = function(state)
        print("Silent Aim:", state)
    end
})

local CombatExtra = CombatTab:Section({
    Name = "Other",
    Side = 2
})

CombatExtra:Button({
    Name = "Kill All",
    Callback = function()
        print("Kill All pressed")
    end
})

CombatExtra:Button({
    Name = "Teleport to Player",
    Callback = function()
        print("Teleport pressed")
    end
})

CombatExtra:Label({
    Name = "Status: Ready",
    Flag = "combat_status"
})

local VisualsESP = VisualsTab:Section({
    Name = "ESP",
    Side = 1
})

VisualsESP:Toggle({
    Name = "Player ESP",
    Default = false,
    Flag = "esp_player",
    Callback = function(state)
        print("Player ESP:", state)
    end
})

VisualsESP:Toggle({
    Name = "Box ESP",
    Default = false,
    Flag = "esp_box",
    Callback = function(state)
        print("Box ESP:", state)
    end
})

VisualsESP:Toggle({
    Name = "Name ESP",
    Default = false,
    Flag = "esp_name",
    Callback = function(state)
        print("Name ESP:", state)
    end
})

VisualsESP:Slider({
    Name = "ESP Range",
    Min = 50,
    Max = 500,
    Default = 200,
    Flag = "esp_range",
    Suffix = "studs",
    Callback = function(value)
        print("ESP Range:", value)
    end
})

local VisualsWorld = VisualsTab:Section({
    Name = "World",
    Side = 2
})

VisualsWorld:Colorpicker({
    Name = "ESP Color",
    Default = Color3.fromRGB(255, 0, 0),
    Flag = "esp_color",
    Callback = function(color, alpha)
        print("ESP Color:", color, "Alpha:", alpha)
    end
})

VisualsWorld:Toggle({
    Name = "Chams",
    Default = false,
    Flag = "esp_chams",
    Callback = function(state)
        print("Chams:", state)
    end
})

VisualsWorld:Dropdown({
    Name = "Cham Material",
    Items = {"Neon", "Plastic", "ForceField", "Glass"},
    Default = "Neon",
    Flag = "esp_cham_material",
    Callback = function(value)
        print("Cham Material:", value)
    end
})

local SettingsUI = SettingsTab:Section({
    Name = "UI Settings",
    Side = 1
})

SettingsUI:Label({Name = "UI Bind"}):Keybind({
    Flag = "ui_bind",
    Default = Enum.KeyCode.X,
    Mode = "Toggle",
    Callback = function(key, mode)
        print("UI Bind:", key, mode)
    end
})

SettingsUI:Slider({
    Name = "Animation Speed",
    Min = 0,
    Max = 100,
    Default = 30,
    Suffix = "%",
    Flag = "ui_animation_speed",
    Callback = function(value)
        print("Animation Speed:", value)
    end
})

SettingsUI:Toggle({
    Name = "Show Watermark",
    Default = true,
    Flag = "ui_watermark",
    Callback = function(state)
        print("Watermark:", state)
    end
})

SettingsUI:Toggle({
    Name = "Show Keybind List",
    Default = true,
    Flag = "ui_keybind_list",
    Callback = function(state)
        print("Keybind List:", state)
    end
})

local SettingsTheme = SettingsTab:Section({
    Name = "Theme",
    Side = 2
})

SettingsTheme:Label({Name = "Accent Color"}):Colorpicker({
    Flag = "theme_accent",
    Default = Color3.fromRGB(152, 188, 255),
    Callback = function(color, alpha)
        print("Accent Color:", color)
    end
})

SettingsTheme:Dropdown({
    Name = "Theme Preset",
    Items = {"Dark", "Light", "OLED"},
    Default = "Dark",
    Flag = "theme_preset",
    Callback = function(value)
        print("Theme:", value)
    end
})

local MiscMain = MiscTab:Section({
    Name = "Player",
    Side = 1
})

MiscMain:Textbox({
    Name = "Player Name",
    Default = "",
    Flag = "misc_player_name",
    Callback = function(value)
        print("Player Name:", value)
    end
})

MiscMain:Slider({
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Suffix = "",
    Flag = "misc_walkspeed",
    Callback = function(value)
        print("Walk Speed:", value)
    end
})

MiscMain:Slider({
    Name = "Jump Power",
    Min = 50,
    Max = 200,
    Default = 50,
    Suffix = "",
    Flag = "misc_jumppower",
    Callback = function(value)
        print("Jump Power:", value)
    end
})

local MiscOther = MiscTab:Section({
    Name = "Other",
    Side = 2
})

MiscOther:Button({
    Name = "Rejoin Game",
    Callback = function()
        print("Rejoin pressed")
    end
})

MiscOther:Button({
    Name = "Copy Server ID",
    Callback = function()
        print("Copy Server ID pressed")
    end
})

MiscOther:Toggle({
    Name = "Anti-AFK",
    Default = false,
    Flag = "misc_anti_afk",
    Callback = function(state)
        print("Anti-AFK:", state)
    end
})

local Watermark = Library:Watermark({
    Text = "Nhack UI"
})

local KeybindList = Library:KeybindList()

KeybindList:Add(Enum.KeyCode.X, "Toggle UI", "Toggle")
KeybindList:Add(Enum.KeyCode.F1, "Silent Aim", "Hold")
KeybindList:Add(Enum.KeyCode.F2, "ESP", "Toggle")