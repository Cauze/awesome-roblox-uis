local IceHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMae17/API/refs/heads/main/IceHub"))()

local Main = IceHub.CreateMain("Example Game", "v1.0.0")

local CombatTab = Main:NewTab("Combat", "CombatTab")
local CombatSection = CombatTab:NewSection()

local MovementTab = Main:NewTab("Movement", "MovementTab")
local MovementSection = MovementTab:NewSection()

local VisualTab = Main:NewTab("Visuals", "VisualTab")
local VisualSection = VisualTab:NewSection()

local SettingsTab = Main:NewTab("Settings", "SettingsTab")
local SettingsSection = SettingsTab:NewSection()

local player = game.Players.LocalPlayer

CombatSection:NewToggle("Silent Aim", "Enable silent aim for more accurate hits", function(state)
    print("Silent Aim:", state)
end)

CombatSection:NewToggle("Auto Parry", "Automatically parry when enemy attacks", function(state)
    print("Auto Parry:", state)
end)

CombatSection:NewToggleCooldown("Trigger Bot", "Shoots when crosshair is on enemy", 3, function(state)
    print("Trigger Bot:", state)
end)

CombatSection:NewSlider("Fire Rate", 1, 20, function(value)
    print("Fire Rate:", value)
end)

CombatSection:NewDropdown("Hitbox Size", "Select hitbox size", {"Small", "Medium", "Large", "Huge"}, function(value)
    print("Hitbox Size:", value)
end)

CombatSection:NewSearchDropdown("Weapon", "Select weapon", "Search weapons...", {"Sword", "Gun", "Shotgun", "Rifle", "Pistol", "Knife", "Bat", "Axe"}, function(value)
    print("Selected Weapon:", value)
end)

CombatSection:NewButton("Forcefield", "Gives you a forcefield", function()
    print("Forcefield activated!")
end)

CombatSection:NewButtonCooldown("Kill Aura", "Kills all nearby enemies", 5, function()
    print("Kill Aura activated!")
end)

CombatSection:NewNotify("Combat module loaded!", 3)

MovementSection:NewToggle("Speed Hack", "Increases your movement speed", function(state)
    print("Speed Hack:", state)
end)

MovementSection:NewToggle("Fly", "Enables flying", function(state)
    print("Fly:", state)
end)

MovementSection:NewSlider("Walk Speed", 16, 200, function(value)
    print("Walk Speed:", value)
end)

MovementSection:NewSlider("Jump Power", 50, 400, function(value)
    print("Jump Power:", value)
end)

MovementSection:NewTextBox("Teleport To", "Enter player name", "PlayerName")

MovementSection:NewFocusTextBox("Custom Speed", "Enter custom speed", "", function(text)
    print("Custom Speed:", text)
end)

MovementSection:NewButton("Noclip", "Allows you to walk through walls", function()
    print("Noclip enabled!")
end)

MovementSection:NewButton("Un noclip", "Disables noclip", function()
    print("Noclip disabled!")
end)

local speedLabel = MovementSection:NewLabel("Current Speed: 16")

MovementSection:NewToggle("Infinite Jump", "Jump without cooldown", function(state)
    print("Infinite Jump:", state)
end)

VisualSection:NewToggle("ESP", "See players through walls", function(state)
    print("ESP:", state)
end)

VisualSection:NewToggle("Chams", "Highlight players with colors", function(state)
    print("Chams:", state)
end)

VisualSection:NewDropdown("ESP Color", "Select ESP color", {"Red", "Blue", "Green", "Yellow", "Purple", "White"}, function(value)
    print("ESP Color:", value)
end)

VisualSection:NewSlider("ESP Transparency", 0, 100, function(value)
    print("ESP Transparency:", value)
end)

VisualSection:NewLabel("Player Info:")

VisualSection:NewButton("Show Nametags", "Display player nametags", function()
    print("Nametags enabled!")
end)

VisualSection:NewButton("Hide Nametags", "Hide player nametags", function()
    print("Nametags disabled!")
end)

VisualSection:NewNotify("Visual module loaded!", 4)

SettingsSection:NewToggle("Hide Username", "Hide your username in the UI", function(state)
    print("Hide Username:", state)
end)

SettingsSection:NewToggle("Hide Avatar", "Hide your avatar in the UI", function(state)
    print("Hide Avatar:", state)
end)

SettingsSection:NewButton("Rejoin", "Rejoin the game", function()
    print("Rejoining...")
end)

SettingsSection:NewButton("Leave", "Leave the game", function()
    print("Leaving...")
end)

SettingsSection:NewButtonCooldown("Copy Discord", "Copy the discord link", 10, function()
    print("Discord link copied!")
end)

SettingsSection:NewNotify("Settings configured!", 2)