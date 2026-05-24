-- Orion Library Example
-- Source: https://github.com/shlexware/Orion

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
    Name = "Orion Demo",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "OrionDemo",
    IntroEnabled = true,
    IntroText = "Orion Library"
})

local Tab1 = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab2 = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab3 = Window:MakeTab({
    Name = "Visuals",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab4 = Window:MakeTab({
    Name = "Miscellaneous",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab1:AddLabel("Welcome to Orion!")

Tab1:AddButton({
    Name = "Click Me!",
    Callback = function()
        print("Button clicked!")
    end
})

Tab1:AddButton({
    Name = "Destroy UI",
    Callback = function()
        OrionLib:Destroy()
    end
})

Tab1:AddToggle({
    Name = "Example Toggle",
    Default = false,
    Callback = function(Value)
        print("Toggle:", Value)
    end
})

Tab1:AddSlider({
    Name = "Example Slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Increment = 1,
    ValueName = "units",
    Callback = function(Value)
        print("Slider:", Value)
    end
})

Tab1:AddColorpicker({
    Name = "Color Picker",
    Default = Color3.fromRGB(255, 128, 0),
    Callback = function(Value)
        print("Color:", Value)
    end
})

Tab1:AddDropdown({
    Name = "Example Dropdown",
    Default = "Option 1",
    Options = {"Option 1", "Option 2", "Option 3"},
    Callback = function(Value)
        print("Dropdown:", Value)
    end
})

Tab1:AddTextbox({
    Name = "Text Input",
    Default = "Enter text...",
    TextDisappear = true,
    Callback = function(Value)
        print("Text:", Value)
    end
})

Tab1:AddBind({
    Name = "Keybind",
    Default = Enum.KeyCode.F,
    Hold = false,
    Callback = function()
        print("Key pressed!")
    end
})

Tab1:AddLabel("This is a label")
Tab1:AddParagraph("Paragraph", "This is paragraph content")

Tab2:AddToggle({
    Name = "Kill Aura",
    Default = false,
    Callback = function(Value)
        print("Kill Aura:", Value)
    end
})

Tab2:AddToggle({
    Name = "Auto Clicker",
    Default = false,
    Callback = function(Value)
        print("Auto Clicker:", Value)
    end
})

Tab2:AddSlider({
    Name = "Reach Distance",
    Min = 1,
    Max = 20,
    Default = 3,
    Increment = 0.5,
    ValueName = "studs",
    Callback = function(Value)
        print("Reach:", Value)
    end
})

Tab2:AddDropdown({
    Name = "Target Mode",
    Default = "Nearest",
    Options = {"Nearest", "Lowest HP", "Highest HP"},
    Callback = function(Value)
        print("Target Mode:", Value)
    end
})

Tab3:AddToggle({
    Name = "ESP",
    Default = false,
    Callback = function(Value)
        print("ESP:", Value)
    end
})

Tab3:AddToggle({
    Name = "Box ESP",
    Default = false,
    Callback = function(Value)
        print("Box ESP:", Value)
    end
})

Tab3:AddToggle({
    Name = "Name ESP",
    Default = false,
    Callback = function(Value)
        print("Name ESP:", Value)
    end
})

Tab3:AddColorpicker({
    Name = "ESP Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        print("ESP Color:", Value)
    end
})

Tab3:AddSlider({
    Name = "ESP Transparency",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Increment = 0.1,
    ValueName = "",
    Callback = function(Value)
        print("ESP Transparency:", Value)
    end
})

Tab4:AddToggle({
    Name = "Anti-AFK",
    Default = false,
    Callback = function(Value)
        print("Anti-AFK:", Value)
    end
})

Tab4:AddToggle({
    Name = "Speed Hack",
    Default = false,
    Callback = function(Value)
        print("Speed Hack:", Value)
    end
})

Tab4:AddSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Increment = 1,
    ValueName = "",
    Callback = function(Value)
        print("Walk Speed:", Value)
    end
})

Tab4:AddSlider({
    Name = "Jump Power",
    Min = 50,
    Max = 200,
    Default = 50,
    Increment = 1,
    ValueName = "",
    Callback = function(Value)
        print("Jump Power:", Value)
    end
})

Tab4:AddDropdown({
    Name = "Server Region",
    Default = "Auto",
    Options = {"Auto", "US", "EU", "ASIA"},
    Callback = function(Value)
        print("Server Region:", Value)
    end
})

local SilentTab = Window:MakeTab({
    Name = "Silent Aim",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = true
})

SilentTab:AddLabel("Premium Feature")
SilentTab:AddToggle({
    Name = "Enable Silent Aim",
    Default = false,
    Callback = function(Value)
        print("Silent Aim:", Value)
    end
})

SilentTab:AddSlider({
    Name = "FOV",
    Min = 0,
    Max = 360,
    Default = 50,
    Increment = 1,
    ValueName = "degrees",
    Callback = function(Value)
        print("Silent Aim FOV:", Value)
    end
})

local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SettingsTab:AddButton({
    Name = "Reset to Default",
    Callback = function()
        print("Reset settings")
    end
})

SettingsTab:AddToggle({
    Name = "Save Config",
    Default = true,
    Callback = function(Value)
        print("Save Config:", Value)
    end
})

SettingsTab:AddDropdown({
    Name = "UI Theme",
    Default = "Dark",
    Options = {"Dark", "Light", "Synapse"},
    Callback = function(Value)
        print("UI Theme:", Value)
    end
})

SettingsTab:AddColorpicker({
    Name = "Accent Color",
    Default = Color3.fromRGB(0, 255, 127),
    Callback = function(Value)
        print("Accent Color:", Value)
    end
})

OrionLib:Init()