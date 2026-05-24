loadstring(game:HttpGet('https://pastebin.com/raw/xRzmhAzz'))()

local Library = initLibrary()
local Window = Library:Load({
    name = "Yun UI Library Demo",
    sizeX = 500,
    sizeY = 550,
    color = Color3.fromRGB(255, 255, 255)
})

local Tab1 = Window:Tab("Combat")
local Tab2 = Window:Tab("Visuals")
local Tab3 = Window:Tab("Settings")

local CombatSection1 = Tab1:Section({name = "Aimbot", column = 1})
local CombatSection2 = Tab1:Section({name = "Silent Aim", column = 2})

CombatSection1:Toggle({
    Name = "Enabled",
    flag = "aimbot_enabled",
    callback = function(state)
        print("Aimbot enabled:", state)
    end
})

CombatSection1:Slider({
    Name = "Smoothing",
    Default = 5,
    Min = 0,
    Max = 30,
    Decimals = 1,
    flag = "aimbot_smoothing",
    callback = function(value)
        print("Smoothing:", value)
    end
})

CombatSection1:Slider({
    Name = "FOV Radius",
    Default = 50,
    Min = 10,
    Max = 200,
    Decimals = 0,
    flag = "aimbot_fov",
    callback = function(value)
        print("FOV Radius:", value)
    end
})

CombatSection1:dropdown({
    name = "Target Part",
    content = {"Head", "Torso", "HumanoidRootPart", "Right Arm", "Left Arm", "Right Leg", "Left Leg"},
    multichoice = false,
    callback = function(value)
        print("Target part:", value)
    end
})

CombatSection1:dropdown({
    name = "Priority",
    content = {"Closest", "Look Direction", "Health"},
    multichoice = false,
    callback = function(value)
        print("Priority:", value)
    end
})

CombatSection2:Toggle({
    Name = "Silent Aim",
    flag = "silent_enabled",
    callback = function(state)
        print("Silent aim enabled:", state)
    end
})

CombatSection2:Slider({
    Name = "Silent FOV",
    Default = 100,
    Min = 20,
    Max = 300,
    Decimals = 0,
    flag = "silent_fov",
    callback = function(value)
        print("Silent FOV:", value)
    end
})

CombatSection2:dropdown({
    name = "Target",
    content = {"Head", "Torso", "Random"},
    multichoice = false,
    callback = function(value)
        print("Silent target:", value)
    end
})

local VisualsSection1 = Tab2:Section({name = "ESP", column = 1})
local VisualsSection2 = Tab2:Section({name = "Chams", column = 2})

VisualsSection1:Toggle({
    Name = "Box ESP",
    flag = "esp_box",
    callback = function(state)
        print("Box ESP:", state)
    end
})

VisualsSection1:Toggle({
    Name = "Name ESP",
    flag = "esp_name",
    callback = function(state)
        print("Name ESP:", state)
    end
})

VisualsSection1:Toggle({
    Name = "Health Bar",
    flag = "esp_health",
    callback = function(state)
        print("Health bar:", state)
    end
})

VisualsSection1:Slider({
    Name = "ESP Distance",
    Default = 500,
    Min = 100,
    Max = 2000,
    Decimals = 0,
    flag = "esp_distance",
    callback = function(value)
        print("ESP distance:", value)
    end
})

VisualsSection2:Toggle({
    Name = "Chams Enabled",
    flag = "chams_enabled",
    callback = function(state)
        print("Chams enabled:", state)
    end
})

VisualsSection2:dropdown({
    name = "Cham Color",
    content = {"Red", "Blue", "Green", "Yellow", "White"},
    multichoice = false,
    callback = function(value)
        print("Cham color:", value)
    end
})

VisualsSection2:dropdown({
    name = "Highlight",
    content = {"Visible Only", "All Players", "Team Only"},
    multichoice = false,
    callback = function(value)
        print("Highlight mode:", value)
    end
})

local SettingsSection1 = Tab3:Section({name = "General", column = 1})
local SettingsSection2 = Tab3:Section({name = "Config", column = 2})

SettingsSection1:Toggle({
    Name = "Show Menu",
    flag = "menu_visible",
    callback = function(state)
        print("Menu visible:", state)
    end
})

SettingsSection1:dropdown({
    name = "Theme",
    content = {"Light", "Dark", "System"},
    multichoice = false,
    callback = function(value)
        print("Theme:", value)
    end
})

SettingsSection1:Slider({
    Name = "Menu Opacity",
    Default = 100,
    Min = 50,
    Max = 100,
    Decimals = 0,
    flag = "menu_opacity",
    callback = function(value)
        print("Menu opacity:", value)
    end
})

SettingsSection2:Toggle({
    Name = "Auto Save",
    flag = "config_autosave",
    callback = function(state)
        print("Auto save:", state)
    end
})

SettingsSection2:dropdown({
    name = "Load Config",
    content = {"Default", "Legit", "Rage", "Custom"},
    multichoice = false,
    callback = function(value)
        print("Load config:", value)
    end
})

SettingsSection2:dropdown({
    name = "Save Config",
    content = {"Default", "Legit", "Rage", "Custom"},
    multichoice = false,
    callback = function(value)
        print("Save config:", value)
    end
})