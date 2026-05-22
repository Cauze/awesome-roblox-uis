local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "Material UI Demo",
    Style = 3,
    SizeX = 600,
    SizeY = 450,
    Theme = "Dark"
})

local CombatTab = UI.New({
    Title = "Combat",
    ImageID = 6031071053
})

local VisualsTab = UI.New({
    Title = "Visuals",
    ImageID = 6031068420
})

local SettingsTab = UI.New({
    Title = "Settings",
    ImageID = 118813823415057
})

local CombatPage = CombatTab

local ButtonWidget = CombatPage.Button({
    Text = "Kill All",
    Callback = function()
        print("Kill All clicked")
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "This function can get you banned. Use at your own risk."
            })
        end
    }
})

local ToggleWidget = CombatPage.Toggle({
    Text = "Enable Aimbot",
    Callback = function(Value)
        print("Aimbot:", Value)
    end,
    Enabled = false
})

local SliderWidget = CombatPage.Slider({
    Text = "Aimbot FOV",
    Callback = function(Value)
        print("FOV:", Value)
    end,
    Min = 10,
    Max = 360,
    Def = 90
})

local DropdownWidget = CombatPage.Dropdown({
    Text = "Target Part",
    Callback = function(Value)
        print("Target:", Value)
    end,
    Options = {
        "Head",
        "Torso",
        "HumanoidRootPart"
    },
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Select which body part to target."
            })
        end
    }
})

local ChipSetWidget = CombatPage.ChipSet({
    Callback = function(ChipSet)
        table.foreach(ChipSet, function(Option, Value)
            print(Option, ":", Value)
        end)
    end,
    Options = {
        ESP = true,
        TeamCheck = false,
        UselessBool = {
            Enabled = true,
            Menu = {
                Information = function(self)
                    UI.Banner({
                        Text = "This bool does nothing."
                    })
                end
            }
        }
    }
})

local VisualsPage = VisualsTab

local DataTableWidget = VisualsPage.DataTable({
    Callback = function(Data)
        table.foreach(Data, function(Option, Value)
            print(Option, ":", Value)
        end)
    end,
    Options = {
        BoxESP = true,
        Tracers = false,
        NameESP = {
            Enabled = true,
            Menu = {
                Information = function(self)
                    UI.Banner({
                        Text = "Shows player names above their heads."
                    })
                end
            }
        }
    }
})

local ColorPickerWidget = VisualsPage.ColorPicker({
    Text = "ESP Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        print("ESP Color:", Value.R * 255, Value.G * 255, Value.B * 255)
    end,
    Menu = {
        Reset = function(self)
            self:SetColor(Color3.fromRGB(255, 0, 0))
        end
    }
})

local TextFieldWidget = VisualsPage.TextField({
    Text = "Player Name",
    Callback = function(Value)
        print("Player Name:", Value)
    end,
    Menu = {
        Clear = function(self)
            self:SetText("")
        end
    }
})

local SettingsPage = SettingsTab

SettingsPage.Button({
    Text = "Save Config",
    Callback = function()
        UI.Banner({
            Text = "Configuration saved successfully!",
            Options = {
                OK = function()
                    print("Banner closed")
                end
            }
        })
    end
})

SettingsPage.Toggle({
    Text = "UI Theme",
    Callback = function(Value)
        print("UI Theme:", Value)
    end,
    Enabled = true
})

SettingsPage.Slider({
    Text = "UI Scale",
    Callback = function(Value)
        print("Scale:", Value)
    end,
    Min = 50,
    Max = 150,
    Def = 100
})

local ToggleStateToggle = SettingsPage.Toggle({
    Text = "Notifications",
    Callback = function(Value)
        print("Notifications:", Value)
    end,
    Enabled = true
})

SettingsPage.Button({
    Text = "Toggle State Demo",
    Callback = function()
        local currentState = ToggleStateToggle:GetState()
        ToggleStateToggle:SetState(not currentState)
        print("Toggled to:", not currentState)
    end
})

SettingsPage.Button({
    Text = "Update Button Text",
    Callback = function()
        ButtonWidget:SetText("Kill All (Active)")
        print("Button text updated")
    end
})

SettingsPage.Dropdown({
    Text = "Theme Selection",
    Callback = function(Value)
        print("Selected theme:", Value)
    end,
    Options = {"Light", "Dark", "Mocha", "Aqua", "Jester"}
})

SettingsPage.Button({
    Text = "Unload UI",
    Callback = function()
        print("Unload requested")
    end
})

print("Material UI Example loaded successfully!")