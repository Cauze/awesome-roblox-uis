local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/i77lhm/Libraries/refs/heads/main/Millenium/Library.lua"))()

local window = library:window({
    name = "Millennium",
    suffix = "UI",
    gameInfo = "Millennium UI Library Demo"
})

window:seperator({name = "Combat"})

local combat_tab = window:tab({name = "Combat", tabs = {"Aimbot", "Weapon", "Settings"}})

for _, tab in {combat_tab.enemies, combat_tab.weapon, combat_tab.settings} do
    local column = tab:column({})
    local section = column:section({name = "Main", default = true})

    section:toggle({name = "Enable Aimbot", seperator = true, callback = function(bool)
        print("Aimbot:", bool)
    end})

    section:toggle({name = "Silent Aim", seperator = true, callback = function(bool)
        print("Silent Aim:", bool)
    end})

    section:slider({
        name = "FOV Radius",
        min = 0,
        max = 360,
        interval = 1,
        callback = function(int)
            print("FOV:", int)
        end
    })

    section:dropdown({
        name = "Target Part",
        items = {"Head", "Torso", "HumanoidRootPart"},
        default = "Head",
        seperator = true
    })

    section:keybind({
        name = "Aim Key",
        callback = function(bool)
            print("Aim Key:", bool)
        end
    })
end

window:seperator({name = "Visuals"})

local visuals_tab = window:tab({name = "Visuals", tabs = {"ESP", "Chams", "Other"}})

for _, tab in {visuals_tab.esp, visuals_tab.chams, visuals_tab.other} do
    local column = tab:column({})
    local section = column:section({name = "Player ESP", default = true})

    section:toggle({name = "Enable ESP", seperator = true, callback = function(bool)
        print("ESP:", bool)
    end})

    local name_toggle = section:toggle({name = "Name", seperator = true})
    name_toggle:colorpicker({})

    local sub_section = name_toggle:settings({})
    sub_section:toggle({name = "Show Display Names", seperator = true})
    sub_section:dropdown({
        name = "Font",
        items = {"ProggyTiny", "MonoSpace", "Tahoma"},
        default = "MonoSpace",
        seperator = true
    })
    sub_section:colorpicker({name = "Name Color", seperator = true})

    section:toggle({name = "Box", seperator = true}):colorpicker({})

    section:toggle({name = "Health Bar", seperator = true}):colorpicker({})

    section:toggle({name = "Tracers", seperator = false}):colorpicker({})
end

for _, tab in {visuals_tab.esp, visuals_tab.chams, visuals_tab.other} do
    local column = tab:column({})
    local section = column:section({name = "World ESP", default = true})

    section:dropdown({
        name = "Item ESP",
        items = {"Weapon", "Ammo", "Health", "Armor"},
        default = {"Weapon", "Ammo"},
        multi = true,
        seperator = true
    })

    section:toggle({name = "Dropped Items", seperator = true}):colorpicker({})

    section:label({name = "Chams Section", info = "Configure cham settings here..."})

    section:toggle({name = "Use Chams", seperator = true, callback = function(bool)
        print("Chams:", bool)
    end}):colorpicker({})

    section:dropdown({
        name = "Cham Material",
        items = {"ForceField", "Neon", "Plastic", "Glass"},
        default = "Neon",
        seperator = true
    })

    section:slider({
        name = "Cham Transparency",
        min = 0,
        max = 1,
        interval = 0.05,
        callback = function(int)
            print("Transparency:", int)
        end
    })
end

window:seperator({name = "Miscellaneous"})

local misc_tab = window:tab({name = "Miscellaneous", tabs = {"Movement", "Player", "Other"}})

for _, tab in {misc_tab.movement, misc_tab.player, misc_tab.other} do
    local column = tab:column({})
    local section = column:section({name = "Movement", default = true})

    section:toggle({name = "Speed Hack", seperator = true, callback = function(bool)
        print("Speed Hack:", bool)
    end})

    section:slider({
        name = "Walk Speed",
        min = 16,
        max = 100,
        interval = 1,
        callback = function(int)
            print("Walk Speed:", int)
        end
    })

    section:slider({
        name = "Jump Power",
        min = 50,
        max = 200,
        interval = 5,
        callback = function(int)
            print("Jump Power:", int)
        end
    })

    section:keybind({
        name = "Fly Key",
        callback = function(bool)
            print("Fly Key:", bool)
        end
    })

    section:toggle({name = "Fly Speed", seperator = true}):colorpicker({})

    section:slider({
        name = "Fly Speed Value",
        min = 1,
        max = 50,
        interval = 1,
        callback = function(int)
            print("Fly Speed:", int)
        end
    })
end

for _, tab in {misc_tab.movement, misc_tab.player, misc_tab.other} do
    local column = tab:column({})
    local section = column:section({name = "Player Modifications", default = true})

    section:toggle({name = "Infinite Jump", seperator = true, callback = function(bool)
        print("Infinite Jump:", bool)
    end})

    section:toggle({name = "No Clip", seperator = true, callback = function(bool)
        print("No Clip:", bool)
    end})

    section:dropdown({
        name = "Gravity",
        items = {"Normal", "Low", "Zero", "Moon"},
        default = "Normal",
        seperator = true
    })

    section:colorpicker({
        name = "Player Color",
        seperator = true
    })

    section:keybind({
        name = "Teleport Key",
        callback = function(bool)
            print("Teleport Key:", bool)
        end
    })

    section:label({name = "Info Label", info = "This is some info text that describes what these settings do..."})
end

for _, tab in {misc_tab.movement, misc_tab.player, misc_tab.other} do
    local column = tab:column({})
    local section = column:section({name = "Other Settings", default = true})

    section:dropdown({
        name = "Server Region",
        items = {"US-East", "US-West", "EU", "Asia", "Australia"},
        default = "US-East",
        seperator = true
    })

    section:toggle({name = "Rejoin on Crash", seperator = true, callback = function(bool)
        print("Rejoin on Crash:", bool)
    end})

    section:toggle({name = "Auto Retry", seperator = true, callback = function(bool)
        print("Auto Retry:", bool)
    end})

    section:keybind({
        name = "Leave Key",
        callback = function(bool)
            print("Leave Key:", bool)
        end
    })

    section:slider({
        name = "FPS Cap",
        min = 30,
        max = 144,
        interval = 1,
        callback = function(int)
            print("FPS Cap:", int)
        end
    })

    section:button({
        name = "Copy Discord",
        callback = function()
            print("Discord link copied!")
        end
    })

    section:button({
        name = "Join Discord",
        callback = function()
            print("Opening Discord...")
        end
    })
end

window:seperator({name = "Config"})

local config_tab = window:tab({name = "Config", tabs = {"Save", "Load", "Settings"}})

for _, tab in {config_tab.save, config_tab.load, config_tab.settings} do
    local column = tab:column({})
    local section = column:section({name = "Configuration", default = true})

    section:label({name = "Configuration Panel", info = "Save and load your settings here..."})

    section:dropdown({
        name = "Config List",
        items = {"Default", "Legit", "Rage", "Custom"},
        default = "Default",
        seperator = true
    })

    section:button({
        name = "Save Config",
        callback = function()
            print("Config saved!")
        end
    })

    section:button({
        name = "Load Config",
        callback = function()
            print("Config loaded!")
        end
    })

    section:button({
        name = "Reset to Default",
        callback = function()
            print("Reset to default!")
        end
    })

    section:toggle({name = "Auto Load", seperator = true, callback = function(bool)
        print("Auto Load:", bool)
    end})

    section:toggle({name = "Auto Save", seperator = false, callback = function(bool)
        print("Auto Save:", bool)
    end})
end

library:init_config(window)