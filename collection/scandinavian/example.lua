local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/MarkDEV9/UI-Libraries/refs/heads/main/Scandinavian/main.lua"))()

local Window = Library.CreateLib("Scandinavian UI", Enum.KeyCode.RightControl)

local MainTab = Window:NewTab("Main Features")

local PlayerSection = MainTab:NewSection("Player Setup")
PlayerSection:NewLabel("Current Status: Idle")

local WalkSlider = PlayerSection:NewSlider("Walk Speed", 16, 100, 16, false, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

PlayerSection:NewButton("Reset Speed", function()
    WalkSlider:Set(16)
end)

PlayerSection:NewToggle("Speed Hack", false, function(state)
    print("Speed Hack:", state)
end)

PlayerSection:NewKeybind("Fly Key", Enum.KeyCode.F, function()
    print("Fly toggled!")
end)

PlayerSection:NewTextbox("Target Name", "Enter name...", function(text)
    print("Target:", text)
end)

local CombatSection = MainTab:NewSection("Combat Options")

CombatSection:NewToggle("Aimbot", false, function(state)
    print("Aimbot:", state)
end)

CombatSection:NewSlider("Aimbot FOV", 50, 500, 100, false, function(value)
    print("Aimbot FOV:", value)
end)

CombatSection:NewDropdown("Target Part", {"Head", "Torso", "HumanoidRootPart"}, "Head", function(selected)
    print("Target Part:", selected)
end)

CombatSection:NewColorPicker("ESP Color", Color3.fromRGB(255, 95, 95), function(color)
    print("ESP Color:", color)
end)

local VisualsTab = Window:NewTab("Visuals")

local ESPSection = VisualsTab:NewSection("ESP Settings")

ESPSection:NewToggle("Player ESP", false, function(state)
    print("Player ESP:", state)
end)

ESPSection:NewToggle("Box ESP", false, function(state)
    print("Box ESP:", state)
end)

ESPSection:NewToggle("Tracers", false, function(state)
    print("Tracers:", state)
end)

ESPSection:NewColorPicker("ESP Outline", Color3.fromRGB(255, 255, 255), function(color)
    print("ESP Outline Color:", color)
end)

ESPSection:NewLabel("All ESP features are ready")

local MiscTab = Window:NewTab("Miscellaneous")

local MiscSection = MiscTab:NewSection("Other Features")

MiscSection:NewButton("Execute Script", function()
    print("Script executed!")
end)

MiscSection:NewLabel("Status: Ready")

print("Scandinavian Example loaded!")