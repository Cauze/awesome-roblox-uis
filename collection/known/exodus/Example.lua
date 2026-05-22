local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WetCheezit/UI-Libs/main/Exodus.lua"))()

local Window = Library:Window({
    Title = "Exodus UI",
    Size = 200,
    Position = 50
})

local RageTab = Window:Tab({Name = "Rage"})

local AimbotSection = RageTab:Section({
    Name = "Aimbot",
    Side = "Left"
})

AimbotSection:Label({Name = "Aimbot Settings"})

AimbotSection:Toggle({
    Name = "Enable Aimbot",
    Flag = "AimbotEnabled",
    State = false,
    Callback = function(State)
        print("Aimbot Enabled:", State)
    end
})

AimbotSection:Toggle({
    Name = "Silent Aim",
    Flag = "SilentAim",
    State = false,
    Callback = function(State)
        print("Silent Aim:", State)
    end
})

AimbotSection:Slider({
    Name = "Aimbot FOV",
    Flag = "AimbotFOV",
    Value = 90,
    Min = 10,
    Max = 360,
    Float = 1,
    Callback = function(Value)
        print("Aimbot FOV:", Value)
    end
})

AimbotSection:Dropdown({
    Name = "Target Part",
    Flag = "TargetPart",
    Values = {"Head", "Torso", "HumanoidRootPart"},
    Value = "Head",
    Callback = function(Value)
        print("Target Part:", Value)
    end
})

AimbotSection:Colorpicker({
    Name = "FOV Color",
    Flag = "FOVColor",
    Color = Color3.fromRGB(255, 65, 65),
    Alpha = 1,
    Callback = function(Color)
        print("FOV Color:", Color)
    end
})

AimbotSection:Keybind({
    Name = "Aimbot Key",
    Flag = "AimbotKey",
    Key = "MouseButton1",
    Mode = "Hold",
    Callback = function(Key, Held)
        print("Aimbot Key:", Key, "Held:", Held)
    end
})

AimbotSection:Button({
    Name = "Silent Aim",
    Flag = "SilentAimBtn",
    Callback = function()
        print("Silent Aim button clicked")
    end
})

local CombatSection = RageTab:Section({
    Name = "Combat",
    Side = "Right"
})

CombatSection:Label({Name = "Combat Settings"})

CombatSection:Toggle({
    Name = "Triggerbot",
    Flag = "Triggerbot",
    State = false,
    Callback = function(State)
        print("Triggerbot:", State)
    end
})

CombatSection:Slider({
    Name = "Trigger Delay",
    Flag = "TriggerDelay",
    Value = 0,
    Min = 0,
    Max = 1000,
    Float = 50,
    Callback = function(Value)
        print("Trigger Delay:", Value)
    end
})

CombatSection:Box({
    Name = "Custom Value",
    Flag = "CustomValue",
    Value = "",
    Callback = function(Value)
        print("Custom Value:", Value)
    end
})

local VisualsTab = Window:Tab({Name = "Visuals"})

local ESPTab = VisualsTab:Tab({
    Name = "ESP"
})

local PlayerESPSection = ESPTab:Section({
    Name = "Player ESP",
    Side = "Left"
})

PlayerESPSection:Label({Name = "Player Visibility"})

PlayerESPSection:Toggle({
    Name = "Box ESP",
    Flag = "BoxESP",
    State = false,
    Callback = function(State)
        print("Box ESP:", State)
    end
})

PlayerESPSection:Toggle({
    Name = "Tracers",
    Flag = "Tracers",
    State = false,
    Callback = function(State)
        print("Tracers:", State)
    end
})

PlayerESPSection:Toggle({
    Name = "Names",
    Flag = "Names",
    State = false,
    Callback = function(State)
        print("Names:", State)
    end
})

PlayerESPSection:Toggle({
    Name = "Health Bar",
    Flag = "HealthBar",
    State = false,
    Callback = function(State)
        print("Health Bar:", State)
    end
})

local WorldESPSection = ESPTab:Section({
    Name = "World ESP",
    Side = "Right"
})

WorldESPSection:Label({Name = "World Visibility"})

WorldESPSection:Toggle({
    Name = "Object ESP",
    Flag = "ObjectESP",
    State = false,
    Callback = function(State)
        print("Object ESP:", State)
    end
})

WorldESPSection:Dropdown({
    Name = "ESP Style",
    Flag = "ESPStyle",
    Values = {"Box", "Corner", "Outline"},
    Value = "Box",
    Callback = function(Value)
        print("ESP Style:", Value)
    end
})

WorldESPSection:Slider({
    Name = "ESP Range",
    Flag = "ESPRange",
    Value = 500,
    Min = 50,
    Max = 2000,
    Float = 50,
    Callback = function(Value)
        print("ESP Range:", Value)
    end
})

WorldESPSection:Colorpicker({
    Name = "ESP Color",
    Flag = "ESPColor",
    Color = Color3.fromRGB(255, 0, 0),
    Alpha = 1,
    Callback = function(Color)
        print("ESP Color:", Color)
    end
})

local MiscTab = Window:Tab({Name = "Misc"})

local MovementSection = MiscTab:Section({
    Name = "Movement",
    Side = "Left"
})

MovementSection:Label({Name = "Player Modifications"})

MovementSection:Toggle({
    Name = "Speed Hack",
    Flag = "SpeedHack",
    State = false,
    Callback = function(State)
        print("Speed Hack:", State)
    end
})

MovementSection:Slider({
    Name = "Walk Speed",
    Flag = "WalkSpeed",
    Value = 16,
    Min = 16,
    Max = 200,
    Float = 1,
    Callback = function(Value)
        print("Walk Speed:", Value)
    end
})

MovementSection:Toggle({
    Name = "Jump Hack",
    Flag = "JumpHack",
    State = false,
    Callback = function(State)
        print("Jump Hack:", State)
    end
})

MovementSection:Slider({
    Name = "Jump Power",
    Flag = "JumpPower",
    Value = 50,
    Min = 50,
    Max = 300,
    Float = 1,
    Callback = function(Value)
        print("Jump Power:", Value)
    end
})

local PlayerSection = MiscTab:Section({
    Name = "Player",
    Side = "Right"
})

PlayerSection:Label({Name = "Player Settings"})

PlayerSection:Box({
    Name = "Player Name",
    Flag = "PlayerName",
    Value = "",
    Callback = function(Value)
        print("Player Name:", Value)
    end
})

PlayerSection:Toggle({
    Name = "Noclip",
    Flag = "Noclip",
    State = false,
    Callback = function(State)
        print("Noclip:", State)
    end
})

PlayerSection:Keybind({
    Name = "Noclip Key",
    Flag = "NoclipKey",
    Key = "V",
    Mode = "Toggle",
    Callback = function(Key)
        print("Noclip Key:", Key)
    end
})

PlayerSection:Button({
    Name = "Teleport to Player",
    Flag = "TeleportBtn",
    Callback = function()
        print("Teleport button clicked")
    end
})

PlayerSection:Separator({Name = "Other"})

PlayerSection:Button({
    Name = "Rejoin",
    Flag = "RejoinBtn",
    Callback = function()
        print("Rejoin button clicked")
    end
})

local SettingsTab = Window:Tab({Name = "Settings"})

local ConfigSection = SettingsTab:Section({
    Name = "Configuration",
    Side = "Left"
})

ConfigSection:Label({Name = "Config Management"})

ConfigSection:Box({
    Name = "Config Name",
    Flag = "ConfigName",
    Value = "",
    Callback = function(Value)
        print("Config Name:", Value)
    end
})

ConfigSection:Button({
    Name = "Save Config",
    Flag = "SaveConfig",
    Callback = function()
        print("Save Config clicked")
    end
})

ConfigSection:Button({
    Name = "Load Config",
    Flag = "LoadConfig",
    Callback = function()
        print("Load Config clicked")
    end
})

ConfigSection:Button({
    Name = "Delete Config",
    Flag = "DeleteConfig",
    Callback = function()
        print("Delete Config clicked")
    end
})

local UISection = SettingsTab:Section({
    Name = "UI Settings",
    Side = "Right"
})

UISection:Label({Name = "Interface Settings"})

UISection:Keybind({
    Name = "UI Toggle",
    Flag = "UIToggle",
    Key = "RightShift",
    Mode = "Toggle",
    Callback = function(Key)
        print("UI Toggle Key:", Key)
    end
})

UISection:Toggle({
    Name = "Watermark",
    Flag = "Watermark",
    State = true,
    Callback = function(State)
        print("Watermark:", State)
    end
})

UISection:Toggle({
    Name = "Notifications",
    Flag = "Notifications",
    State = true,
    Callback = function(State)
        print("Notifications:", State)
    end
})

UISection:Button({
    Name = "Unload UI",
    Flag = "UnloadUI",
    Callback = function()
        Library:Unload()
    end
})

local LegitTab = Window:Tab({Name = "Legit"})

local AimbotSection = LegitTab:Section({
    Name = "Aimbot",
    Side = "Left"
})

AimbotSection:Label({Name = "Legit Aimbot"})

AimbotSection:Toggle({
    Name = "Enable Aimbot",
    Flag = "LegitAimbot",
    State = false,
    Callback = function(State)
        print("Legit Aimbot:", State)
    end
})

AimbotSection:Slider({
    Name = "Smoothness",
    Flag = "Smoothness",
    Value = 5,
    Min = 1,
    Max = 10,
    Float = 0.5,
    Callback = function(Value)
        print("Smoothness:", Value)
    end
})

local FilterSection = LegitTab:Section({
    Name = "Filters",
    Side = "Right"
})

FilterSection:Label({Name = "Target Filters"})

FilterSection:Toggle({
    Name = "Target Enemies",
    Flag = "TargetEnemies",
    State = true,
    Callback = function(State)
        print("Target Enemies:", State)
    end
})

FilterSection:Toggle({
    Name = "Target Friends",
    Flag = "TargetFriends",
    State = false,
    Callback = function(State)
        print("Target Friends:", State)
    end
})

FilterSection:Toggle({
    Name = "Target Team",
    Flag = "TargetTeam",
    State = false,
    Callback = function(State)
        print("Target Team:", State)
    end
})

FilterSection:Slider({
    Name = "Min Distance",
    Flag = "MinDistance",
    Value = 0,
    Min = 0,
    Max = 100,
    Float = 5,
    Callback = function(Value)
        print("Min Distance:", Value)
    end
})

FilterSection:Slider({
    Name = "Max Distance",
    Flag = "MaxDistance",
    Value = 100,
    Min = 0,
    Max = 500,
    Float = 10,
    Callback = function(Value)
        print("Max Distance:", Value)
    end
})

Library:Init()

Library:Notify({
    Title = "Exodus UI",
    Message = "Welcome to Exodus UI!",
    Duration = 3
})

print("Exodus UI Example loaded successfully!")
print("Toggle states:")
print("  AimbotEnabled:", Library.flags["AimbotEnabled"])
print("  SilentAim:", Library.flags["SilentAim"])
print("  Triggerbot:", Library.flags["Triggerbot"])