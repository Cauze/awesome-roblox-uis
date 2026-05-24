local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/Libraries/main/Shaman/Library.lua'))()
local Flags = Library.Flags

local Window = Library:Window({
    Text = "Shaman UI Demo"
})

local Tab1 = Window:Tab({
    Text = "Combat"
})

local Tab2 = Window:Tab({
    Text = "Visuals"
})

local Tab3 = Window:Tab({
    Text = "Misc"
})

local Tab4 = Window:Tab({
    Text = "Settings"
})

local CombatSection1 = Tab1:Section({
    Text = "Aimbot",
    Side = "Left"
})

local CombatSection2 = Tab1:Section({
    Text = "Weapons",
    Side = "Right"
})

local VisualsSection1 = Tab2:Section({
    Text = "ESP",
    Side = "Left"
})

local VisualsSection2 = Tab2:Section({
    Text = "Chams",
    Side = "Right"
})

local MiscSection1 = Tab3:Section({
    Text = "Player",
    Side = "Left"
})

local MiscSection2 = Tab3:Section({
    Text = "Teleport",
    Side = "Right"
})

local SettingsSection = Tab4:Section({
    Text = "Configuration"
})

CombatSection1:Toggle({
    Text = "Enable Aimbot",
    Default = false,
    Callback = function(v)
        print("Aimbot enabled:", v)
    end
})

CombatSection1:Toggle({
    Text = "Wall Check",
    Default = true,
    Callback = function(v)
        print("Wall check enabled:", v)
    end
})

CombatSection1:Toggle({
    Text = "Silent Aim",
    Default = false,
    Callback = function(v)
        print("Silent aim enabled:", v)
    end
})

CombatSection1:Slider({
    Text = "Smoothness",
    Default = 5,
    Minimum = 1,
    Maximum = 20,
    Flag = "Smoothness",
    Callback = function(v)
        print("Smoothness:", v)
    end
})

CombatSection1:Dropdown({
    Text = "Target Part",
    List = {"Head", "Torso", "Random"},
    Flag = "TargetPart",
    Default = "Head",
    Callback = function(v)
        print("Target part:", v)
    end
})

CombatSection1:RadioButton({
    Text = "Aim Mode",
    Options = {"Legit", "Blatant", "Rage"},
    Callback = function(v)
        print("Aim mode:", v)
    end
})

CombatSection1:Keybind({
    Text = "Aim Key",
    Default = Enum.KeyCode.E,
    Callback = function()
        print("Aim key pressed")
    end
})

CombatSection2:Toggle({
    Text = "Infinite Ammo",
    Default = false,
    Callback = function(v)
        print("Infinite ammo:", v)
    end
})

CombatSection2:Toggle({
    Text = "No Spread",
    Default = false,
    Callback = function(v)
        print("No spread:", v)
    end
})

CombatSection2:Toggle({
    Text = "No Recoil",
    Default = false,
    Callback = function(v)
        print("No recoil:", v)
    end
})

CombatSection2:Toggle({
    Text = "Full Auto",
    Default = true,
    Callback = function(v)
        print("Full auto:", v)
    end
})

CombatSection2:Slider({
    Text = "Fire Rate",
    Default = 30,
    Minimum = 1,
    Maximum = 100,
    Flag = "FireRate",
    Callback = function(v)
        print("Fire rate:", v)
    end
})

CombatSection2:Button({
    Text = "Reset Settings",
    Tooltip = "Resets all combat settings to default",
    Callback = function()
        print("Settings reset!")
    end
})

local espEnabled = VisualsSection1:Toggle({
    Text = "ESP Enabled",
    Default = false,
    Callback = function(v)
        print("ESP enabled:", v)
    end
})

VisualsSection1:Toggle({
    Text = "Box ESP",
    Default = true,
    Callback = function(v)
        print("Box ESP:", v)
    end
})

VisualsSection1:Toggle({
    Text = "Name ESP",
    Default = true,
    Callback = function(v)
        print("Name ESP:", v)
    end
})

VisualsSection1:Toggle({
    Text = "Health Bar",
    Default = false,
    Callback = function(v)
        print("Health bar:", v)
    end
})

VisualsSection1:Toggle({
    Text = "Distance",
    Default = false,
    Callback = function(v)
        print("Distance:", v)
    end
})

VisualsSection1:Slider({
    Text = "ESP Range",
    Default = 200,
    Minimum = 50,
    Maximum = 500,
    Flag = "ESPRange",
    Callback = function(v)
        print("ESP range:", v)
    end
})

VisualsSection2:Toggle({
    Text = "Chams Enabled",
    Default = false,
    Callback = function(v)
        print("Chams enabled:", v)
    end
})

VisualsSection2:Toggle({
    Text = "Team Check",
    Default = true,
    Callback = function(v)
        print("Team check:", v)
    end
})

VisualsSection2:Toggle({
    Text = "Filled",
    Default = false,
    Callback = function(v)
        print("Filled:", v)
    end
})

VisualsSection2:Dropdown({
    Text = "Cham Color",
    List = {"Red", "Blue", "Green", "White"},
    Flag = "ChamColor",
    Default = "Red",
    Callback = function(v)
        print("Cham color:", v)
    end
})

VisualsSection2:Button({
    Text = "Refresh Chams",
    Tooltip = "Refreshes cham textures",
    Callback = function()
        print("Chams refreshed!")
    end
})

local label = MiscSection1:Label({
    Text = "Player Stats",
    Color = Color3.fromRGB(183, 248, 219),
    Tooltip = "Displays current player information"
})

MiscSection1:Toggle({
    Text = "Speed Hack",
    Default = false,
    Callback = function(v)
        print("Speed hack:", v)
    end
})

MiscSection1:Slider({
    Text = "Walk Speed",
    Default = 16,
    Minimum = 1,
    Maximum = 100,
    Flag = "WalkSpeed",
    Callback = function(v)
        print("Walk speed:", v)
    end
})

MiscSection1:Slider({
    Text = "Jump Power",
    Default = 50,
    Minimum = 1,
    Maximum = 100,
    Flag = "JumpPower",
    Callback = function(v)
        print("Jump power:", v)
    end
})

MiscSection1:Input({
    Placeholder = "Player Name",
    Flag = "PlayerName",
    Callback = function(v)
        print("Player name:", v)
    end
})

MiscSection1:Button({
    Text = "Copy Coords",
    Tooltip = "Copies your current coordinates",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local pos = player.Character.HumanoidRootPart.Position
            print(string.format("Position: %.2f, %.2f, %.2f", pos.X, pos.Y, pos.Z))
        end
    end
})

MiscSection2:Button({
    Text = "Teleport to Spawn",
    Callback = function()
        print("Teleporting to spawn...")
    end
})

MiscSection2:Button({
    Text = "Teleport to HQ",
    Callback = function()
        print("Teleporting to HQ...")
    end
})

MiscSection2:Dropdown({
    Text = "Quick Teleport",
    List = {"Location A", "Location B", "Location C", "Location D"},
    Flag = "QuickTeleport",
    Callback = function(v)
        print("Quick teleport:", v)
    end
})

MiscSection2:Toggle({
    Text = "Freeze Player",
    Default = false,
    Callback = function(v)
        print("Freeze player:", v)
    end
})

SettingsSection:Label({
    Text = "Configuration",
    Color = Color3.fromRGB(80, 167, 194)
})

SettingsSection:Toggle({
    Text = "Save Settings",
    Default = true,
    Callback = function(v)
        print("Save settings:", v)
    end
})

SettingsSection:Toggle({
    Text = "Auto Load",
    Default = false,
    Callback = function(v)
        print("Auto load:", v)
    end
})

SettingsSection:Keybind({
    Text = "Menu Key",
    Default = Enum.KeyCode.RightControl,
    Callback = function()
        print("Menu key pressed")
    end
})

SettingsSection:Slider({
    Text = "UI Scale",
    Default = 100,
    Minimum = 50,
    Maximum = 150,
    Postfix = "%",
    Flag = "UIScale",
    Callback = function(v)
        print("UI scale:", v)
    end
})

SettingsSection:Button({
    Text = "Reset All",
    Tooltip = "Resets all settings to default values",
    Callback = function()
        label:Set({Text = "Settings Reset!", Color = Color3.fromRGB(217, 97, 99)})
        print("All settings reset!")
        wait(2)
        label:Set({Text = "Player Stats", Color = Color3.fromRGB(183, 248, 219)})
    end
})

SettingsSection:Button({
    Text = "Export Config",
    Callback = function()
        print("Exporting configuration...")
        for flag, value in pairs(Flags) do
            print(string.format("  %s: %s", flag, tostring(value)))
        end
    end
})

wait(3)

label:Set({
    Text = "Loaded!",
    Color = Color3.fromRGB(48, 207, 106)
})