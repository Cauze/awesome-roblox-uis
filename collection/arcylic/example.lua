local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/noowtf31-ui/Arcylic/refs/heads/main/src.lua.txt"))()

local Window = Library.new("Example Hub", "ExampleHubConfigs")
Window:SetToggleKey(Enum.KeyCode.RightControl)

Window:Notify({
    Title = "Welcome!",
    Description = "Acrylic UI loaded successfully",
    Duration = 3,
    Icon = "rbxassetid://10709775704"
})

local CombatSection = Window:CreateSection("Combat")
local PlayerSection = Window:CreateSection("Player")
local MiscSection = Window:CreateSection("Miscellaneous")

local AimbotTab = CombatSection:CreateTab("Aimbot", "rbxassetid://10723407389")

AimbotTab:CreateSection("Main Settings")

AimbotTab:CreateToggle({
    Name = "Enable Aimbot",
    Default = false,
    Flag = "AimbotEnabled",
    Callback = function(enabled)
        Window:Notify({
            Title = enabled and "Aimbot Enabled" or "Aimbot Disabled",
            Description = "Aimbot " .. (enabled and "activated" or "deactivated"),
            Duration = 2
        })
    end
})

AimbotTab:CreateSlider({
    Name = "Aim Speed",
    Min = 1,
    Max = 100,
    Default = 50,
    Flag = "AimSpeed",
    Callback = function(value)
        print("Aim speed:", value)
    end
})

AimbotTab:CreateDropdown({
    Name = "Target Priority",
    Options = {"Closest", "Lowest HP", "Highest Threat"},
    Default = "Closest",
    Flag = "TargetPriority",
    Callback = function(selected)
        print("Priority:", selected)
    end
})

AimbotTab:CreateColorPicker({
    Name = "Aim FOV Color",
    Default = Color3.fromRGB(255, 0, 0),
    Flag = "AimFOVColor",
    Callback = function(color)
        print("FOV Color:", color)
    end
})

local MovementTab = PlayerSection:CreateTab("Movement", "rbxassetid://10734898355")

MovementTab:CreateSection("Speed Settings")

MovementTab:CreateToggle({
    Name = "Speed Boost",
    Default = false,
    Flag = "SpeedBoost",
    Callback = function(enabled)
        print("Speed boost:", enabled)
    end
})

MovementTab:CreateSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Flag = "WalkSpeed",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

MovementTab:CreateKeybind({
    Name = "Fly Toggle",
    Default = Enum.KeyCode.F,
    Flag = "FlyKeybind",
    Callback = function()
        Window:Notify({
            Title = "Fly Mode",
            Description = "Flight toggled",
            Duration = 1.5
        })
    end
})

local AutoTab = MiscSection:CreateTab("Automation", "rbxassetid://10734898355")

AutoTab:CreateSection("Auto Farm")

AutoTab:CreateButton({
    Name = "Start Auto Farm",
    Callback = function()
        Window:Notify({
            Title = "Auto Farm",
            Description = "Started farming",
            Duration = 2
        })
    end
})

AutoTab:CreateTextBox({
    Name = "Farm Amount",
    Default = "100",
    Placeholder = "Enter amount...",
    NumbersOnly = true,
    Flag = "FarmAmount",
    Callback = function(text)
        print("Farm amount:", tonumber(text))
    end
})

AutoTab:CreateParagraph({
    Title = "About",
    Content = "This is an example hub showcasing all AcrylicUI components."
})

local ConfigTab = MiscSection:CreateTab("Config", "rbxassetid://10723356507")
ConfigTab:CreateConfigSection()

print("Arcylic Example loaded!")