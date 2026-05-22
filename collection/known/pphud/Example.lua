local Library = require("./source.lua")

local Window = Library:Window({
    Text = "PPHUD Demo"
})

local Flags = Library.Flags

local CombatTab = Window:Tab({
    Text = "Combat"
})

local VisualsTab = Window:Tab({
    Text = "Visuals"
})

local MiscTab = Window:Tab({
    Text = "Misc"
})

local AimingSection = CombatTab:Section({
    Text = "Aiming",
    Side = "Left"
})

local SilentAimSection = CombatTab:Section({
    Text = "Silent Aim",
    Side = "Left"
})

local RageSection = CombatTab:Section({
    Text = "Ragebot",
    Side = "Right"
})

local ESP1Section = VisualsTab:Section({
    Text = "Player ESP",
    Side = "Left"
})

local ESP2Section = VisualsTab:Section({
    Text = "World ESP",
    Side = "Right"
})

local Misc1Section = MiscTab:Section({
    Text = "Player Mods",
    Side = "Left"
})

local Misc2Section = MiscTab:Section({
    Text = "Config",
    Side = "Right"
})

AimingSection:Check({
    Text = "Enable Aimbot",
    Flag = "AimbotEnabled",
    Default = false,
    Callback = function(State)
        print("Aimbot:", State)
    end
})

AimingSection:Check({
    Text = "Silent Aim",
    Callback = function(State)
        print("Silent Aim:", State)
    end
})

AimingSection:Check({
    Text = "Predict Movement",
    Default = true,
    Callback = function(State)
        print("Predict:", State)
    end
})

AimingSection:Dropdown({
    Text = "Target Part",
    List = {"Head", "Torso", "HumanoidRootPart", "Random"},
    Default = "Head",
    Callback = function(opt)
        print("Target Part:", opt)
    end
})

AimingSection:Slider({
    Text = "Hit Chance",
    Flag = "HitChance",
    Minimum = 0,
    Default = 60,
    Maximum = 100,
    Postfix = "%",
    Callback = function(n)
        print("Hit Chance:", n)
    end
})

AimingSection:Slider({
    Text = "FOV Size",
    Flag = "FOVSize",
    Minimum = 50,
    Default = 120,
    Maximum = 500,
    Postfix = "",
    Callback = function(n)
        print("FOV Size:", n)
    end
})

AimingSection:Button({
    Text = "Lock Target",
    Callback = function()
        print("Target locked!")
    end
})

AimingSection:Button({
    Text = "Unlock Target",
    Callback = function()
        print("Target unlocked!")
    end
})

local hitboxDropdown = SilentAimSection:Dropdown({
    Text = "Hitbox",
    List = {"Head", "Torso", "HumanoidRootPart"},
    Default = "Torso",
    Callback = function(opt)
        print("Hitbox:", opt)
    end
})

SilentAimSection:Slider({
    Text = "Smoothness",
    Flag = "AimSmooth",
    Minimum = 1,
    Default = 10,
    Maximum = 100,
    Postfix = "%",
    Callback = function(n)
        print("Smoothness:", n)
    end
})

SilentAimSection:Check({
    Text = "Show FOV Circle",
    Default = true,
    Callback = function(State)
        print("FOV Circle:", State)
    end
})

SilentAimSection:Button({
    Text = "Scan Players",
    Callback = function()
        print("Scanning players...")
    end
})

local statusLabel = RageSection:Label({
    Text = "Status: Ready",
    Color = Color3.fromRGB(100, 190, 31)
})

RageSection:Check({
    Text = "Auto-Wall",
    Callback = function(bool)
        print("Auto-Wall:", bool)
    end
})

RageSection:Check({
    Text = "Trigger Bot",
    Default = false,
    Callback = function(State)
        print("Trigger Bot:", State)
    end
})

RageSection:Check({
    Text = "Insta-Kill",
    Callback = function(State)
        print("Insta-Kill:", State)
    end
})

RageSection:Dropdown({
    Text = "Hitscan Dir",
    List = {"Left", "Right", "Up", "Down", "All"},
    Callback = function(opt)
        print("Hitscan Direction:", opt)
    end
})

RageSection:Slider({
    Text = "Damage Override",
    Minimum = 0,
    Default = 100,
    Maximum = 500,
    Postfix = "%",
    Callback = function(n)
        print("Damage Override:", n)
    end
})

RageSection:Button({
    Text = "Force BHop",
    Callback = function()
        print("BHop forced!")
    end
})

RageSection:Button({
    Text = "Update Status",
    Callback = function()
        statusLabel:Set("Status: Active", Color3.fromRGB(100, 190, 31))
    end
})

ESP1Section:Check({
    Text = "Box ESP",
    Default = false,
    Callback = function(State)
        print("Box ESP:", State)
    end
})

ESP1Section:Check({
    Text = "Name ESP",
    Default = true,
    Callback = function(State)
        print("Name ESP:", State)
    end
})

ESP1Section:Check({
    Text = "Tracers",
    Callback = function(State)
        print("Tracers:", State)
    end
})

ESP1Section:Check({
    Text = "Health Bar",
    Callback = function(State)
        print("Health Bar:", State)
    end
})

ESP1Section:Dropdown({
    Text = "ESP Color",
    List = {"Red", "Blue", "Green", "White", "Rainbow"},
    Default = "Red",
    Callback = function(opt)
        print("ESP Color:", opt)
    end
})

ESP1Section:Slider({
    Text = "ESP Range",
    Minimum = 50,
    Default = 500,
    Maximum = 2000,
    Postfix = "studs",
    Callback = function(n)
        print("ESP Range:", n)
    end
})

ESP2Section:Check({
    Text = "Object ESP",
    Callback = function(State)
        print("Object ESP:", State)
    end
})

ESP2Section:Check({
    Text = "Loot ESP",
    Callback = function(State)
        print("Loot ESP:", State)
    end
})

ESP2Section:Dropdown({
    Text = "ESP Type",
    List = {"Box", "Corner", "Outline"},
    Default = "Box",
    Callback = function(opt)
        print("ESP Type:", opt)
    end
})

ESP2Section:Slider({
    Text = "Line Thickness",
    Minimum = 1,
    Default = 2,
    Maximum = 5,
    Postfix = "px",
    Callback = function(n)
        print("Line Thickness:", n)
    end
})

Misc1Section:Check({
    Text = "Speed Hack",
    Flag = "SpeedEnabled",
    Default = false,
    Callback = function(State)
        print("Speed Hack:", State)
    end
})

Misc1Section:Slider({
    Text = "Walk Speed",
    Flag = "WalkSpeed",
    Minimum = 16,
    Default = 16,
    Maximum = 200,
    Callback = function(n)
        print("Walk Speed:", n)
    end
})

Misc1Section:Check({
    Text = "Jump Hack",
    Callback = function(State)
        print("Jump Hack:", State)
    end
})

Misc1Section:Slider({
    Text = "Jump Power",
    Minimum = 50,
    Default = 50,
    Maximum = 300,
    Callback = function(n)
        print("Jump Power:", n)
    end
})

Misc1Section:Button({
    Text = "Reset Physics",
    Callback = function()
        print("Physics reset!")
    end
})

Misc2Section:Button({
    Text = "Save Config",
    Callback = function()
        print("Config saved!")
    end
})

Misc2Section:Button({
    Text = "Load Config",
    Callback = function()
        print("Config loaded!")
    end
})

Misc2Section:Button({
    Text = "Reset Config",
    Callback = function()
        print("Config reset!")
    end
})

Misc2Section:Button({
    Text = "Unload UI",
    Callback = function()
        Window:Exit()
    end
})

Window:Message({
    Text = "PPHUD Loaded Successfully",
    Color = Color3.fromRGB(100, 190, 31)
})

CombatTab:Select()

print("PPHUD Demo loaded!")
print("Flags:", Flags)