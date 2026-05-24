-- AtherHub Library Example
-- Source: https://github.com/NIcoGabrielRealYtr/Ather-Hub-Library

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NIcoGabrielRealYtr/Ather-Hub-Library/refs/heads/main/Source"))()

local Window = Library:Window({
    Name = '<font color="rgb(175, 102, 126)">ather.</font>hub',
    Logo = "rbxassetid://133425623304338"
})

local Combat = Window:Page({
    Name = "Combat",
    Description = "Combat features",
    Icon = "lucide:sword",
    Search = true
})

local Visuals = Window:Page({
    Name = "Visuals",
    Description = "Visual enhancements",
    Icon = "lucide:eye"
})

local Movement = Window:Page({
    Name = "Movement",
    Description = "Movement features",
    Icon = "lucide:footprints"
})

local AimbotSub = Combat:SubPage({
    Name = "Aimbot",
    Icon = "lucide:target",
    DisplayName = true
})

local TriggerbotSub = Combat:SubPage({
    Name = "Triggerbot",
    Icon = "lucide:crosshair",
    DisplayName = true
})

local ESPSub = Visuals:SubPage({
    Name = "ESP",
    Icon = "lucide:eye",
    DisplayName = true
})

local ChamsSub = Visuals:SubPage({
    Name = "Chams",
    Icon = "lucide:palette",
    DisplayName = true
})

local MainSection = AimbotSub:Section({
    Name = "Main Settings",
    Side = 1
})

local aimbotToggle = MainSection:Toggle({
    Name = "Enable Aimbot",
    Flag = "AimbotEnabled",
    Default = false,
    Callback = function(Value)
        print("Aimbot:", Value)
    end
})

aimbotToggle:Keybind({
    Flag = "AimbotKeybind",
    Default = Enum.KeyCode.RightShift,
    Mode = "Toggle",
    Callback = function()
        print("Keybind pressed")
    end
})

aimbotToggle:Colorpicker({
    Flag = "AimbotColor",
    Default = Color3.fromRGB(255, 0, 0),
    Alpha = 0.5,
    Callback = function(Color, Alpha)
        print("Color:", Color, "Alpha:", Alpha)
    end
})

MainSection:Button({
    Name = "Test Notification",
    Callback = function()
        Window:Notify({
            Title = "Test",
            Description = "Button clicked!",
            Duration = 3
        })
    end
})

MainSection:Slider({
    Name = "Aimbot FOV",
    Flag = "AimbotFOV",
    Default = 50,
    Min = 0,
    Max = 360,
    Decimals = 0,
    Suffix = "°",
    Callback = function(Value)
        print("FOV:", Value)
    end
})

MainSection:Slider({
    Name = "Smoothness",
    Flag = "AimbotSmoothness",
    Default = 5,
    Min = 1,
    Max = 20,
    Decimals = 0,
    Callback = function(Value)
        print("Smoothness:", Value)
    end
})

MainSection:Dropdown({
    Name = "Target Priority",
    Flag = "TargetPriority",
    Items = {"Closest", "Lowest HP", "Highest HP", "Distance"},
    Default = "Closest",
    Multi = false,
    Callback = function(Value)
        print("Priority:", Value)
    end
})

MainSection:Dropdown({
    Name = "Filters",
    Flag = "Filters",
    Items = {"Players", "NPCs", "Vehicles"},
    Default = {"Players", "NPCs"},
    Multi = true,
    Callback = function(Value)
        print("Filters:", table.concat(Value, ", "))
    end
})

MainSection:Label({
    Name = "Label"
})

MainSection:Label({
    Name = "Highlight Color"
}):Colorpicker({
    Flag = "HighlightColor",
    Default = Color3.fromRGB(0, 255, 0),
    Callback = function(Color)
        print("Color:", Color)
    end
})

MainSection:Label({
    Name = "ESP Shortcut"
}):Keybind({
    Flag = "ESPShortcut",
    Default = Enum.KeyCode.F,
    Mode = "Hold",
    Callback = function()
        print("Shortcut pressed")
    end
})

MainSection:Textbox({
    Name = "Username Filter",
    Flag = "UsernameFilter",
    Default = "",
    Placeholder = "Enter username...",
    Finished = true,
    Callback = function(Value)
        print("Filter:", Value)
    end
})

MainSection:Textbox({
    Name = "Sensitivity",
    Flag = "Sensitivity",
    Default = "1.5",
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        print("Sensitivity:", Value)
    end
})

local TriggerSection = TriggerbotSub:Section({
    Name = "Triggerbot Settings",
    Side = 1
})

local triggerToggle = TriggerSection:Toggle({
    Name = "Enable Triggerbot",
    Flag = "TriggerbotEnabled",
    Default = false,
    Callback = function(Value)
        print("Triggerbot:", Value)
    end
})

triggerToggle:Keybind({
    Flag = "TriggerKeybind",
    Default = Enum.KeyCode.X,
    Mode = "Toggle"
})

TriggerSection:Slider({
    Name = "Trigger Delay",
    Flag = "TriggerDelay",
    Default = 100,
    Min = 0,
    Max = 500,
    Suffix = "ms",
    Callback = function(Value)
        print("Trigger Delay:", Value)
    end
})

local VisualSection = ESPSub:Section({
    Name = "Visual Options",
    Side = 1
})

local espToggle = VisualSection:Toggle({
    Name = "Enable ESP",
    Flag = "ESPEnabled",
    Default = false,
    Callback = function(Value)
        print("ESP:", Value)
    end
})

espToggle:Colorpicker({
    Flag = "ESPColor",
    Default = Color3.fromRGB(0, 255, 0),
    Alpha = 1,
    Callback = function(Color, Alpha)
        print("ESP Color:", Color)
    end
})

VisualSection:Slider({
    Name = "ESP Distance",
    Flag = "ESPDistance",
    Default = 200,
    Min = 0,
    Max = 1000,
    Suffix = "studs",
    Callback = function(Value)
        print("ESP Distance:", Value)
    end
})

VisualSection:Dropdown({
    Name = "ESP Type",
    Flag = "ESPType",
    Items = {"Box", "Glow", "Outline"},
    Default = "Box",
    Multi = false,
    Callback = function(Value)
        print("ESP Type:", Value)
    end
})

local statusWidget = VisualSection:Status({
    Name = "ESP Stats"
})

local playerCount = statusWidget:AddStatus("Players: 0")
local fpsCounter = statusWidget:AddStatus("FPS: 60")

task.spawn(function()
    while task.wait(1) do
        if playerCount and playerCount.Set then
            playerCount:Set("Players: " .. #game.Players:GetPlayers())
        end
    end
end)

VisualSection:List({
    Items = {
        {"Box ESP", "Enabled", "Red"},
        {"Name ESP", "Enabled", "White"},
        {"Distance", "Enabled", "Yellow"},
    },
    Callback = function(Value)
        print("List order changed")
    end
})

local MovementSection = Movement:Section({
    Name = "Speed Settings",
    Side = 1
})

MovementSection:Slider({
    Name = "Walk Speed",
    Flag = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 200,
    Callback = function(Value)
        print("Walk Speed:", Value)
    end
})

MovementSection:Slider({
    Name = "Jump Power",
    Flag = "JumpPower",
    Default = 50,
    Min = 0,
    Max = 200,
    Callback = function(Value)
        print("Jump Power:", Value)
    end
})

MovementSection:Toggle({
    Name = "Noclip",
    Default = false,
    Flag = "Noclip",
    Callback = function(Value)
        print("Noclip:", Value)
    end
})

MovementSection:Button({
    Name = "Fly",
    Callback = function()
        print("Fly clicked")
    end
})

Window:Notify({
    Title = "Welcome",
    Description = "Script loaded successfully!",
    Duration = 3
})

MainSection:Button({
    Name = "Show Dialog",
    Callback = function()
        Window:Dialog({
            Title = "Confirmation",
            Description = "Proceed with action?"
        }):AddButton("Yes", function()
            print("Confirmed")
        end):AddButton("No", function()
            print("Cancelled")
        end)
    end
})

local SettingsPage = Window:CreateSettingsPage()
SettingsPage:CreateConfigsSection()
SettingsPage:CreateThemingSection()

Library:CheckForAutoLoad()