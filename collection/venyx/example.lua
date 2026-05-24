-- Venyx UI Library Example
-- https://github.com/GreenDeno/Venyx-UI-Library

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()

local venyx = library.new("Venyx", 5013109572)

local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(255, 255, 255)
}

local page1 = venyx:addPage("Combat", 5012544693)
local page2 = venyx:addPage("Visuals", 5012544693)
local page3 = venyx:addPage("Misc", 5012544693)
local page4 = venyx:addPage("Theme", 5012544693)

local combatSection1 = page1:addSection("Aimbot")
local combatSection2 = page1:addSection("Other")

local visualsSection1 = page2:addSection("ESP")
local visualsSection2 = page2:addSection("Chams")

local miscSection1 = page3:addSection("Players")
local miscSection2 = page3:addSection("Settings")

local colors = page4:addSection("Colors")

-- Combat Page: Aimbot Section
combatSection1:addToggle("Enable Aimbot", false, function(value)
    print("Aimbot toggled:", value)
end)

combatSection1:addButton("Silent Aim", function()
    print("Silent Aim clicked")
end)

combatSection1:addSlider("FOV", 90, 10, 500, function(value)
    print("FOV changed:", value)
end)

combatSection1:addDropdown("Target Part", {"Head", "Torso", "Closest"}, function(text)
    print("Target selected:", text)
end)

combatSection1:addKeybind("Toggle Keybind", Enum.KeyCode.One, function()
    print("Keybind activated")
    venyx:toggle()
end, function()
    print("Keybind changed")
end)

-- Combat Page: Other Section
combatSection2:addToggle("Silent Aim", nil, function(value)
    print("Silent Aim toggled:", value)
end)

combatSection2:addSlider("Smoothing", 50, 0, 100, function(value)
    print("Smoothing:", value)
end)

combatSection2:addTextbox("Hit Chance", "80", function(value, focusLost)
    print("Hit chance input:", value, "Focus lost:", focusLost)
    if focusLost then
        venyx:Notify("Hit Chance", "Set to " .. value)
    end
end)

combatSection2:addColorPicker("ESP Color", Color3.fromRGB(50, 50, 50), function(color3)
    print("ESP Color changed:", color3)
end)

combatSection2:addColorPicker("Rainbow Mode", nil, function(color3)
    print("Rainbow Color:", color3)
end)

-- Visuals Page: ESP Section
visualsSection1:addToggle("Box ESP", nil, function(value)
    print("Box ESP:", value)
end)

visualsSection1:addToggle("Name ESP", nil, function(value)
    print("Name ESP:", value)
end)

visualsSection1:addToggle("Health Bar", nil, function(value)
    print("Health Bar:", value)
end)

visualsSection1:addSlider("ESP Distance", 100, 0, 1000, function(value)
    print("ESP Distance:", value)
end)

visualsSection1:addDropdown("ESP Type", {"2D Box", "3D Box", "Corner Box"}, function(text)
    print("ESP Type:", text)
end)

-- Visuals Page: Chams Section
visualsSection2:addToggle("Player Chams", nil, function(value)
    print("Player Chams:", value)
end)

visualsSection2:addColorPicker("Cham Color", Color3.fromRGB(255, 0, 0), function(color3)
    print("Cham Color:", color3)
end)

visualsSection2:addDropdown("Cham Material", {"Neon", "ForceField", "Glass", "Plastic"}, function(text)
    print("Cham Material:", text)
end)

visualsSection2:addToggle("Team Check", nil, function(value)
    print("Team Check:", value)
end)

-- Misc Page: Players Section
miscSection1:addToggle("ESP All Players", nil, function(value)
    print("ESP All Players:", value)
end)

miscSection1:addButton("Refresh Players", function()
    print("Players refreshed")
    venyx:Notify("Refreshed", "Player list updated")
end)

miscSection1:addTextbox("Player Name", "Enter name...", function(value, focusLost)
    print("Player name:", value)
end)

miscSection1:addDropdown("Select Player", {"Player1", "Player2", "Player3", "Player4"}, function(text)
    print("Selected:", text)
end)

-- Misc Page: Settings Section
miscSection2:addButton("Save Config", function()
    print("Config saved!")
    venyx:Notify("Saved", "Configuration saved successfully!")
end)

miscSection2:addButton("Load Config", function()
    print("Config loaded!")
    venyx:Notify("Loaded", "Configuration loaded successfully!")
end)

miscSection2:addToggle("Auto Save", nil, function(value)
    print("Auto Save:", value)
end)

miscSection2:addSlider("UI Scale", 100, 50, 150, function(value)
    print("UI Scale:", value)
end)

miscSection2:addKeybind("UI Toggle", Enum.KeyCode.RightControl, function()
    print("UI toggled via keybind")
    venyx:toggle()
end)

-- Theme Page
for themeName, color in pairs(themes) do
    colors:addColorPicker(themeName, color, function(color3)
        venyx:setTheme(themeName, color3)
        print("Theme", themeName, "set to:", color3)
    end)
end

venyx:SelectPage(venyx.pages[1], true)

print("Venyx UI loaded successfully!")
print("Use RightControl to toggle the UI")
print("Click on keybinds to rebind them")