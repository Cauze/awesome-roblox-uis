-- Redz Library Example
-- Source: https://github.com/NgotBand/HoanHoBanNhacThuDo

local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NgotBand/HoanHoBanNhacThuDo/refs/heads/main/Ui/RedzDacCau"))()

local Window = RedzLib:MakeWindow({
    Title = "Redz Demo",
    SubTitle = "Example UI",
    SaveFolder = "RedzDemo.json"
})

Window:AddMinimizeButton({
    Button = {
        Size = UDim2.fromOffset(38, 38),
        Position = UDim2.fromScale(0.1, 0.2),
        Image = "rbxassetid://10734895698",
        BackgroundTransparency = 0.05
    },
    Corner = {
        CornerRadius = UDim.new(0, 8)
    }
})

local MainTab = Window:MakeTab({
    Title = "Main",
    Icon = "home"
})

local FarmSection = MainTab:AddSection({
    Name = "Farm"
})

MainTab:AddParagraph({
    Title = "Status",
    Text = "Ready to farm."
})

MainTab:AddToggle({
    Title = "Fast Attack",
    Desc = "Enable fast attack mode",
    Default = false,
    Flag = "fast_attack",
    Callback = function(state)
        print("Fast Attack:", state)
    end
})

MainTab:AddSlider({
    Title = "Tween Speed",
    Desc = "Movement speed",
    Min = 100,
    Max = 500,
    Increase = 10,
    Default = 250,
    Flag = "tween_speed",
    Callback = function(value)
        print("Tween Speed:", value)
    end
})

MainTab:AddDropdown({
    Title = "Select Weapon",
    Desc = "Choose your weapon",
    Options = {"Melee", "Sword", "Blox Fruit"},
    Default = "Melee",
    Flag = "weapon_select",
    Callback = function(selected)
        print("Weapon:", selected)
    end
})

MainTab:AddTextBox({
    Title = "Player Name",
    Desc = "Enter player name",
    PlaceholderText = "Type here...",
    ClearText = false,
    Callback = function(text)
        print("TextBox:", text)
    end
})

MainTab:AddButton({
    Title = "Auto Farm",
    Desc = "Start farming",
    Callback = function()
        print("Auto Farm clicked")
    end
})

MainTab:AddButton({
    Title = "Teleport First Sea",
    Callback = function()
        print("Teleport First Sea")
    end
})

MainTab:AddButton({
    Title = "Teleport Second Sea",
    Callback = function()
        print("Teleport Second Sea")
    end
})

MainTab:AddButton({
    Title = "Teleport Third Sea",
    Callback = function()
        print("Teleport Third Sea")
    end
})

local InfoTab = Window:MakeTab({
    Title = "Info",
    Icon = "info"
})

InfoTab:AddSection({
    Name = "Info Section"
})

InfoTab:AddDiscordInvite({
    Title = "Join Discord",
    Desc = "Click to copy invite link",
    Logo = "rbxassetid://10709790948",
    Invite = "https://discord.gg/example"
})

local SettingsTab = Window:MakeTab({
    Title = "Settings",
    Icon = "settings"
})

SettingsTab:AddToggle({
    Title = "Save Config",
    Default = true,
    Flag = "save_config"
})

SettingsTab:AddDropdown({
    Title = "Theme",
    Options = {"Darker", "Dark", "Purple"},
    Default = "Darker",
    Flag = "theme"
})

Window:SelectTab(1)

RedzLib:MakeNotification({
    Title = "Loaded",
    Text = "Redz UI loaded successfully!",
    Time = 5
})