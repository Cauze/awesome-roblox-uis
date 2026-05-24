local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/main/Venus/source.lua", true))()

local main = library:Load({
    Name = "Venus Library",
    Theme = "Dark",
    SizeX = 440,
    SizeY = 520,
    ColorOverrides = {}
})

local aimbotTab = main:Tab("Aimbot")
local visualsTab = main:Tab("Visuals")
local settingsTab = main:Tab("Settings")

local aimbotSection = aimbotTab:Section({Name = "Aimbot Settings", Column = 1})
local targetSection = aimbotTab:Section({Name = "Targeting", Column = 2})

local visualsSection1 = visualsTab:Section({Name = "ESP", Column = 1})
local visualsSection2 = visualsTab:Section({Name = "Chams", Column = 2})

local settingsSection = settingsTab:Section({Name = "General", Column = 1})

local label = aimbotSection:Label("Welcome to Venus UI")

local enabledToggle = aimbotSection:Toggle({
    Name = "Enable Aimbot",
    Flag = "AimbotEnabled",
    Callback = function(bool)
        print("Aimbot enabled:", bool)
    end
})

local silentToggle = aimbotSection:Toggle({
    Name = "Silent Aim",
    Flag = "SilentAim",
    Callback = function(bool)
        print("Silent aim enabled:", bool)
    end
})

local fovSlider = aimbotSection:Slider({
    Name = "FOV",
    Min = 10,
    Max = 500,
    Default = 100,
    Decimals = 1,
    Flag = "AimbotFOV",
    Callback = function(value)
        print("FOV changed to:", value)
    end
})

local smoothingSlider = aimbotSection:Slider({
    Name = "Smoothing",
    Min = 0,
    Max = 100,
    Default = 50,
    Decimals = 0,
    ValueType = "%",
    Flag = "AimbotSmoothing",
    Callback = function(value)
        print("Smoothing changed to:", value)
    end
})

local targetDropdown = aimbotSection:Dropdown({
    Name = "Target Part",
    Default = "Head",
    Content = {"Head", "Torso", "Closest"},
    Flag = "TargetPart",
    Callback = function(opt)
        print("Target part changed to:", opt)
    end
})

local hitChanceBox = aimbotSection:Box({
    Name = "Hit Chance",
    Default = "80",
    Flag = "HitChance",
    Callback = function(text)
        print("Hit chance changed to:", text)
    end
})

local resolverButton = aimbotSection:Button({
    Name = "Resolve All",
    Callback = function()
        print("Resolving all targets...")
    end
})

local targetTeamToggle = targetSection:Toggle({
    Name = "Ignore Team",
    Flag = "IgnoreTeam",
    Callback = function(bool)
        print("Ignore team:", bool)
    end
})

local wallbangToggle = targetSection:Toggle({
    Name = "Wallbang",
    Flag = "Wallbang",
    Callback = function(bool)
        print("Wallbang enabled:", bool)
    end
})

local visibleCheckToggle = targetSection:Toggle({
    Name = "Visible Only",
    Flag = "VisibleOnly",
    Callback = function(bool)
        print("Visible only:", bool)
    end
})

local predictionSlider = targetSection:Slider({
    Name = "Prediction",
    Min = 0,
    Max = 100,
    Default = 20,
    Decimals = 0,
    ValueType = "%",
    Flag = "Prediction",
    Callback = function(value)
        print("Prediction changed to:", value)
    end
})

local resolverMode = targetSection:Dropdown({
    Name = "Resolver Mode",
    Default = "Off",
    Content = {"Off", "Delta", "Velocity", "Bruteforce"},
    MultiChoice = false,
    Flag = "ResolverMode",
    Callback = function(opt)
        print("Resolver mode changed to:", opt)
    end
})

local boxToggle = visualsSection1:Toggle({
    Name = "Box ESP",
    Flag = "BoxESP",
    Callback = function(bool)
        print("Box ESP enabled:", bool)
    end
})

local nameToggle = visualsSection1:Toggle({
    Name = "Name ESP",
    Flag = "NameESP",
    Callback = function(bool)
        print("Name ESP enabled:", bool)
    end
})

local healthToggle = visualsSection1:Toggle({
    Name = "Health Bar",
    Flag = "HealthBar",
    Callback = function(bool)
        print("Health bar enabled:", bool)
    end
})

local distanceToggle = visualsSection1:Toggle({
    Name = "Distance",
    Flag = "DistanceESP",
    Callback = function(bool)
        print("Distance ESP enabled:", bool)
    end
})

local skeletonToggle = visualsSection1:Toggle({
    Name = "Skeleton",
    Flag = "SkeletonESP",
    Callback = function(bool)
        print("Skeleton ESP enabled:", bool)
    end
})

local tracerToggle = visualsSection1:Toggle({
    Name = "Tracers",
    Flag = "Tracers",
    Callback = function(bool)
        print("Tracers enabled:", bool)
    end
})

local filledBoxToggle = visualsSection2:Toggle({
    Name = "Filled Box",
    Flag = "FilledBox",
    Callback = function(bool)
        print("Filled box enabled:", bool)
    end
})

local cornerBoxToggle = visualsSection2:Toggle({
    Name = "Corner Box",
    Flag = "CornerBox",
    Callback = function(bool)
        print("Corner box enabled:", bool)
    end
})

local outlineToggle = visualsSection2:Toggle({
    Name = "Outline",
    Flag = "OutlineESP",
    Callback = function(bool)
        print("Outline enabled:", bool)
    end
})

local textOutlineToggle = visualsSection2:Toggle({
    Name = "Text Outline",
    Flag = "TextOutline",
    Callback = function(bool)
        print("Text outline enabled:", bool)
    end
})

local chamDropdown = visualsSection2:Dropdown({
    Name = "Cham Color",
    Default = "Red",
    Content = {"Red", "Blue", "Green", "White", "Black", "Yellow", "Purple"},
    Flag = "ChamColor",
    Callback = function(opt)
        print("Cham color changed to:", opt)
    end
})

local colorPicker = settingsSection:ColorPicker({
    Name = "ESP Color",
    Default = Color3.fromRGB(255, 0, 0),
    Flag = "ESPColor",
    Callback = function(color)
        print("ESP color changed to:", color)
    end
})

local toggleColorPicker = settingsSection:ToggleColorPicker({
    Name = "Rainbow ESP",
    Default = Color3.fromRGB(255, 0, 0),
    ToggleFlag = "RainbowESPToggle",
    ColorPickerFlag = "RainbowESPColor",
    ToggleCallback = function(bool)
        print("Rainbow ESP enabled:", bool)
    end,
    ColorPickerCallback = function(color)
        print("Rainbow ESP color changed to:", color)
    end
})

local menuKeybind = settingsSection:Keybind({
    Name = "Menu Keybind",
    Default = Enum.KeyCode.RightShift,
    Flag = "MenuKeybind",
    Callback = function(key)
        print("Menu keybind pressed:", key)
    end
})

local uiKeybind = settingsSection:ToggleKeybind({
    Name = "UI Toggle",
    Default = Enum.KeyCode.F,
    KeybindFlag = "UIToggleKeybind",
    ToggleFlag = "UIToggle",
    ToggleCallback = function(bool)
        print("UI toggled:", bool)
    end,
    KeybindCallback = function(key)
        print("UI toggle key pressed:", key)
    end
})

local configBox = settingsSection:Box({
    Name = "Config Name",
    Default = "default",
    Flag = "ConfigName",
    Callback = function(text)
        print("Config name changed to:", text)
    end
})

local saveButton = settingsSection:Button({
    Name = "Save Config",
    Callback = function()
        print("Config saved!")
    end
})

local loadButton = settingsSection:Button({
    Name = "Load Config",
    Callback = function()
        print("Config loaded!")
    end
})

local resetButton = settingsSection:Button({
    Name = "Reset Config",
    Callback = function()
        print("Config reset!")
    end
})

print("Venus UI loaded successfully!")
print("Flags:", library.flags)