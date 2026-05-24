local Finity = loadstring(game:HttpGet("http://finity.vip/scripts/finity_lib.lua"))()

local FinityWindow = Finity.new("Finity Demo", true, false, "Example")
FinityWindow.ChangeToggleKey("Semicolon")

local MainCategory = FinityWindow:Category("Main")
local SettingsCategory = FinityWindow:Category("Settings")

local MainESP = MainCategory:Sector("ESP")
local MainAimbot = MainCategory:Sector("Aimbot")
local MainPlayer = MainCategory:Sector("Player")
local SettingsConfig = SettingsCategory:Sector("Configuration")
local SettingsCredits = SettingsCategory:Sector("Credits")

MainESP:Cheat("Checkbox", "ESP Enabled", function(State)
    print("ESP Enabled:", State)
end)

MainESP:Cheat("Slider", "Render Distance", function(Value)
    print("Render Distance:", Value)
end, {min = 0, max = 1500, suffix = " studs"})

MainESP:Cheat("Dropdown", "ESP Color", function(Option)
    print("ESP Color:", Option)
end, {
    options = {"Red", "White", "Green", "Pink", "Blue"},
    default = "Red"
})

MainESP:Cheat("Textbox", "Player To Whitelist", function(Value)
    print("Whitelisted Player:", Value)
end, {placeholder = "Player Name"})

MainAimbot:Cheat("Checkbox", "Aimbot Enabled", function(State)
    print("Aimbot Enabled:", State)
end)

MainAimbot:Cheat("Slider", "Aimbot FOV", function(Value)
    print("Aimbot FOV:", Value)
end, {min = 0, max = 120, suffix = "°"})

MainAimbot:Cheat("Dropdown", "Aimbot Mode", function(Option)
    print("Aimbot Mode:", Option)
end, {
    options = {"FOV", "Distance", "Visibility"}
})

MainAimbot:Cheat("Textbox", "Target Player", function(Value)
    print("Target Player:", Value)
end, {placeholder = "Player Name"})

MainPlayer:Cheat("Checkbox", "Infinite Jump", function(State)
    print("Infinite Jump:", State)
end)

MainPlayer:Cheat("Slider", "Walk Speed", function(Value)
    print("Walk Speed:", Value)
end, {min = 16, max = 200, suffix = ""})

MainPlayer:Cheat("Slider", "Jump Power", function(Value)
    print("Jump Power:", Value)
end, {min = 50, max = 200, suffix = ""})

MainPlayer:Cheat("Button", "Reset Stats", function()
    print("Stats Reset!")
end)

SettingsConfig:Cheat("Button", "Save Configuration", function()
    print("Configuration Saved!")
end)

SettingsConfig:Cheat("Button", "Load Configuration", function()
    print("Configuration Loaded!")
end)

SettingsConfig:Cheat("Button", "Reset to Default", function()
    print("Reset to Default!")
end)

SettingsCredits:Cheat("Label", "Finity UI Library")
SettingsCredits:Cheat("Label", "Created by detourious")
SettingsCredits:Cheat("Label", "v3rmillion.net/showthread.php?tid=922755")
SettingsCredits:Cheat("Label", "")
SettingsCredits:Cheat("Label", "Free to use for everyone")
SettingsCredits:Cheat("Label", "Do not claim as your own")