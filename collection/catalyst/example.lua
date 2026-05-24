local Catalyst = loadstring(game:HttpGet("https://github.com/Catalyst-Development/Catalyst/releases/latest/download/source.lua"))()

local Window = Catalyst:Window({
    Title = "Catalyst Example",
    SubTitle = "GX Edition",
    ToggleKey = Enum.KeyCode.RightAlt,
})

local CombatTab = Window:Tab("Combat", "rbxassetid://6031071054")
local VisualsTab = Window:Tab("Visuals", "rbxassetid://6031068420")
local MovementTab = Window:Tab("Movement", "rbxassetid://6031068784")
local SettingsTab = Window:Tab("Settings", "rbxassetid://6031069033")

do
    local section = CombatTab:Section("Aimbot")

    CombatTab:Toggle("Enable Aimbot", "Lock onto nearest target", true, function(state)
        print("Aimbot:", state)
    end, "aimbot_enabled")

    CombatTab:Slider("Aimbot FOV", "Field of view for target detection", 0, 360, 120, function(value)
        print("FOV:", value)
    end, "aimbot_fov", { Suffix = "°" })

    CombatTab:Dropdown("Target Part", { "Head", "Torso", "Closest" }, function(value)
        print("Target part:", value)
    end, "aimbot_part", "Head")

    CombatTab:MultiDropdown("Target Mode", { "Nearest", "Lowest HP", "Highest HP", "Under Cursor" }, function(selected)
        print("Selected modes:", table.concat(selected, ", "))
    end, "aimbot_mode", { "Nearest", "Lowest HP" })

    CombatTab:Toggle("Silent Aim", "Don't visibly lock onto target", false, function(state)
        print("Silent aim:", state)
    end, "silent_aim", { Keybind = Enum.KeyCode.LeftAlt })

    CombatTab:Slider("Smoothness", "How smooth the aim snaps", 1, 50, 15, function(value)
        print("Smoothness:", value)
    end, "aimbot_smooth", { Suffix = "%" })

    CombatTab:Line()

    local section2 = CombatTab:Section("Rage")

    CombatTab:Toggle("Auto Fire", "Automatically fire when target locked", false, function(state)
        print("Auto fire:", state)
    end, "rage_autofire")

    CombatTab:Toggle("Ignore Walls", "Target enemies through walls", false, function(state)
        print("Ignore walls:", state)
    end, "rage_ignorewalls")

    CombatTab:Colorpicker("Target Highlight", Color3.fromRGB(255, 42, 74), function(color)
        print("Highlight color:", color)
    end, "rage_highlight")
end

do
    local section = VisualsTab:Section("ESP")

    VisualsTab:Toggle("Player ESP", "Show player outlines", true, function(state)
        print("ESP:", state)
    end, "esp_enabled")

    VisualsTab:Toggle("Box ESP", "Draw boxes around players", true, function(state)
        print("Box ESP:", state)
    end, "esp_boxes")

    VisualsTab:Toggle("Health Bar", "Show health bars on players", true, function(state)
        print("Health bars:", state)
    end, "esp_healthbar")

    VisualsTab:Toggle("Name ESP", "Show player names", true, function(state)
        print("Name ESP:", state)
    end, "esp_names")

    VisualsTab:Dropdown("ESP Color", { "Red", "Green", "Blue", "White", "Accent" }, function(value)
        print("ESP color:", value)
    end, "esp_color", "Accent")

    VisualsTab:Slider("ESP Opacity", "Transparency of ESP elements", 0, 100, 80, function(value)
        print("ESP opacity:", value)
    end, "esp_opacity", { Suffix = "%" })

    VisualsTab:Line()

    local section2 = VisualsTab:Section("Chams")

    VisualsTab:Toggle("Enable Chams", "Highlight player models", false, function(state)
        print("Chams:", state)
    end, "chams_enabled")

    VisualsTab:Colorpicker("Cham Color", Color3.fromRGB(255, 255, 255), function(color)
        print("Cham color:", color)
    end, "chams_color")

    VisualsTab:Toggle("Rainbow Chams", "Cycle through colors", false, function(state)
        print("Rainbow chams:", state)
    end, "chams_rainbow")

    VisualsTab:Slider("Cham Brightness", "Glow intensity of chams", 0, 100, 50, function(value)
        print("Cham brightness:", value)
    end, "chams_brightness", { Suffix = "%" })
end

do
    local section = MovementTab:Section("Speed")

    MovementTab:Toggle("Speed Hack", "Increase movement speed", false, function(state)
        print("Speed hack:", state)
    end, "speed_enabled")

    MovementTab:Slider("Walk Speed", "Your movement speed value", 16, 200, 50, function(value)
        print("Walk speed:", value)
    end, "speed_value", { Suffix = " studs/s" })

    MovementTab:Bind("Speed Key", Enum.KeyCode.V, function()
        print("Speed toggled via keybind")
    end, "speed_key", { Mode = "Toggle" })

    MovementTab:Line()

    local section2 = MovementTab:Section("Jump")

    MovementTab:Toggle("Infinite Jump", "Jump without cooldown", false, function(state)
        print("Infinite jump:", state)
    end, "jump_infinite")

    MovementTab:Slider("Jump Power", "How high you can jump", 50, 200, 100, function(value)
        print("Jump power:", value)
    end, "jump_power", { Suffix = "%" })

    MovementTab:Line()

    local section3 = MovementTab:Section("Flight")

    MovementTab:Toggle("Fly", "Enable flight", false, function(state)
        print("Fly:", state)
    end, "fly_enabled")

    MovementTab:Slider("Fly Speed", "Speed while flying", 50, 500, 100, function(value)
        print("Fly speed:", value)
    end, "fly_speed", { Suffix = " studs/s" })

    MovementTab:Bind("Fly Key", Enum.KeyCode.F, function()
        print("Fly toggled via keybind")
    end, "fly_key", { Mode = "Hold" })

    MovementTab:Toggle("Noclip", "Pass through walls", false, function(state)
        print("Noclip:", state)
    end, "fly_noclip")
end

do
    local section = MovementTab:Section("Teleport")

    MovementTab:Button("Teleport to Cursor", "Teleport to mouse position", function()
        print("Teleporting to cursor...")
    end)

    MovementTab:Button("Teleport to Lobby", "Return to spawn area", function()
        print("Teleporting to lobby...")
    end)

    MovementTab:Button("Teleport to Random Player", "Teleport to a random player", function()
        print("Teleporting to random player...")
    end)

    MovementTab:Line()

    local section2 = MovementTab:Section("Server")

    MovementTab:Button("Rejoin Server", "Leave and rejoin the game", function()
        print("Rejoining server...")
    end)

    MovementTab:Button("Copy Server ID", "Copy current server ID", function()
        print("Copying server ID...")
    end)
end

do
    local section = SettingsTab:Section("User Interface")

    SettingsTab:Label("Configure your UI experience below")

    SettingsTab:Button("Test Notification", "Show a test notification", function()
        Window:Notify("Test Notification", "This is a notification from Catalyst!", 5)
    end)

    SettingsTab:Button("Show All Flags", "Print all current flag values", function()
        for flag, value in pairs(Catalyst.Flags) do
            print(flag, "=", typeof(value) == "table" and table.concat(value, ", ") or value)
        end
    end)

    SettingsTab:Line()

    local section2 = SettingsTab:Section("Credits")

    SettingsTab:Label("Catalyst UI Library v" .. Catalyst.Version)
    SettingsTab:Label("Developed by GX Team")
end

Window:Init()

Window:Notify("Welcome", "Catalyst has been initialized successfully!", 5)