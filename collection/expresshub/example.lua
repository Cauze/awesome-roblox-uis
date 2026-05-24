-- ExpressHub Library Example
-- Source: https://github.com/NIcoGabrielRealYtr/Express-Hub-Library

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NIcoGabrielRealYtr/Express-Hub-Library/refs/heads/main/Source"))()

local Window = Library:MakeWindow({
    Name = "Express Hub",
    HomeTab = false,
    DiscordLink = "discord.gg/example"
})

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://10723407389"
})

local CombatSubTab = MainTab:AddSubTab({
    Name = "Combat",
    Columns = 1
})

local VisualSubTab = MainTab:AddSubTab({
    Name = "Visuals",
    Columns = 1
})

local CombatSection = MainTab:AddSection({
    Name = "Combat Settings",
    Side = 1
})

local aimbotToggle = CombatSection:AddToggle({
    Name = "Aimbot",
    Flag = "AimbotEnabled",
    Default = false,
    Tooltip = "Automatically aims at enemies",
    Callback = function(Value)
        print("Aimbot:", Value)
    end
})

aimbotToggle:Keybind({
    Flag = "AimbotKeybind",
    Default = Enum.KeyCode.Q,
    Mode = "Hold",
    Callback = function()
        print("Keybind pressed")
    end
})

aimbotToggle:Colorpicker({
    Flag = "AimbotColor",
    Default = Color3.fromRGB(255, 0, 0),
    Alpha = 1,
    Callback = function(Color)
        print("Aimbot Color:", Color)
    end
})

CombatSection:AddSlider({
    Name = "Smoothness",
    Flag = "AimbotSmoothness",
    Default = 5,
    Min = 1,
    Max = 20,
    Increment = 1,
    ValueName = "smooth",
    Callback = function(Value)
        print("Smoothness:", Value)
    end
})

CombatSection:AddDropdown({
    Name = "Aim Part",
    Flag = "AimPart",
    Options = {"Head", "Torso", "HumanoidRootPart"},
    Default = "Head",
    Multi = false,
    Callback = function(Value)
        print("Aim Part:", Value)
    end
})

CombatSection:AddToggle({
    Name = "Triggerbot",
    Default = false,
    Flag = "Triggerbot",
    Callback = function(Value)
        print("Triggerbot:", Value)
    end
})

local VisualSection = MainTab:AddSection({
    Name = "Visual Settings",
    Side = 2
})

local espColor = VisualSection:AddColorpicker({
    Name = "ESP Color",
    Flag = "ESPColor",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Color)
        print("ESP Color:", Color)
    end
})

local espToggle, espColorPicker = VisualSection:AddToggleColorPicker({
    Name = "Box ESP",
    Flag = "BoxESP",
    Default = false,
    ColorPickerDefault = Color3.fromRGB(0, 255, 0),
    Callback = function(Color, Enabled)
        print("Box ESP:", Enabled, "Color:", Color)
    end
})

VisualSection:AddSlider({
    Name = "ESP Distance",
    Flag = "ESPDistance",
    Default = 100,
    Min = 0,
    Max = 500,
    Increment = 10,
    ValueName = "studs",
    Callback = function(Value)
        print("ESP Distance:", Value)
    end
})

VisualSection:AddDropdown({
    Name = "ESP Type",
    Flag = "ESPType",
    Options = {"Box", "Glow", "Chams"},
    Default = "Box",
    Multi = false,
    Callback = function(Value)
        print("ESP Type:", Value)
    end
})

VisualSection:AddLabel("ESP Preview")

VisualSection:AddToggle({
    Name = "Name ESP",
    Default = false,
    Flag = "NameESP",
    Callback = function(Value)
        print("Name ESP:", Value)
    end
})

VisualSection:AddToggle({
    Name = "Distance ESP",
    Default = false,
    Flag = "DistanceESP",
    Callback = function(Value)
        print("Distance ESP:", Value)
    end
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://10723407563"
})

local MiscSection = MiscTab:AddSection({
    Name = "General",
    Side = 1
})

MiscSection:AddToggle({
    Name = "Anti-AFK",
    Default = false,
    Flag = "AntiAFK",
    Callback = function(Value)
        print("Anti-AFK:", Value)
    end
})

MiscSection:AddSlider({
    Name = "Walk Speed",
    Flag = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 200,
    Increment = 1,
    ValueName = "",
    Callback = function(Value)
        print("Walk Speed:", Value)
    end
})

MiscSection:AddSlider({
    Name = "Jump Power",
    Flag = "JumpPower",
    Default = 50,
    Min = 50,
    Max = 200,
    Increment = 1,
    ValueName = "",
    Callback = function(Value)
        print("Jump Power:", Value)
    end
})

MiscSection:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        print("Rejoin clicked")
    end
})

MiscSection:AddButton({
    Name = "Server Region",
    Callback = function()
        print("Server Region clicked")
    end
})

local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://10734950309"
})

local SettingsSection = SettingsTab:AddSection({
    Name = "Configuration",
    Side = 1
})

SettingsSection:AddToggle({
    Name = "Save Config",
    Default = true,
    Flag = "SaveConfig"
})

SettingsSection:AddToggle({
    Name = "Auto Load",
    Default = false,
    Flag = "AutoLoad"
})

SettingsSection:AddDropdown({
    Name = "Theme",
    Flag = "Theme",
    Options = {"Dark", "Light"},
    Default = "Dark",
    Multi = false,
    Callback = function(Value)
        print("Theme:", Value)
    end
})

SettingsSection:AddButton({
    Name = "Destroy UI",
    Callback = function()
        Window:Destroy()
    end
})