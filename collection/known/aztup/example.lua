local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/aztup/src.lua"))()

local Settings = library:CreateSection("Settings")
local Aimbot = library:CreateSection("Aimbot")
local Visuals = library:CreateSection("Visuals")
local Misc = library:CreateSection("Misc")

Settings:Label("Aztup UI Demo")
Settings:Box("Config Name", function(text)
    print("Config name:", text)
end)

local menuKey = Settings:Bind("Menu Key", Enum.KeyCode.RightShift, function()
    print("Menu key pressed")
end)

local enabledToggle = Settings:Toggle("Enable Script", function(state)
    print("Script enabled:", state)
end)

local silentToggle = Settings:Toggle("Silent Aim", function(state)
    print("Silent aim:", state)
end)

Aimbot:Label("Aimbot Settings")

local fovSlider = Aimbot:Slider("FOV", {
    min = 10,
    max = 500,
    default = 100
}, function(value)
    print("FOV:", value)
end)

local smoothingSlider = Aimbot:Slider("Smoothing", {
    min = 0,
    max = 100,
    default = 50
}, function(value)
    print("Smoothing:", value)
end)

local predictionSlider = Aimbot:Slider("Prediction", {
    min = 0,
    max = 100,
    default = 20,
    precise = true
}, function(value)
    print("Prediction:", value)
end)

local targetPart = Aimbot:Dropdown("Target Part", {"Head", "Torso", "Closest"}, function(option)
    print("Target part:", option)
end)

local resolverMode = Aimbot:Dropdown("Resolver Mode", {"Off", "Delta", "Velocity", "Bruteforce"}, function(option)
    print("Resolver mode:", option)
end)

Visuals:Label("Visual Settings")

local espColor = Visuals:ColorPicker("ESP Color", Color3.fromRGB(102, 41, 255), function(color)
    print("ESP Color:", color)
end)

local chamsColor = Visuals:ColorPicker("Chams Color", Color3.fromRGB(255, 100, 100), function(color)
    print("Chams Color:", color)
end)

local boxToggle = Visuals:Toggle("Box ESP", function(state)
    print("Box ESP:", state)
end)

local nameToggle = Visuals:Toggle("Name ESP", function(state)
    print("Name ESP:", state)
end)

local healthToggle = Visuals:Toggle("Health Bar", function(state)
    print("Health Bar:", state)
end)

local tracerToggle = Visuals:Toggle("Tracers", function(state)
    print("Tracers:", state)
end)

Misc:Label("Miscellaneous")

local killSayBox = Misc:Box("Kill Say Message", function(text)
    print("Kill say:", text)
end)

local chatSpamToggle = Misc:Toggle("Chat Spam", function(state)
    print("Chat spam:", state)
end)

local flyToggle = Misc:Toggle("Fly", function(state)
    print("Fly:", state)
end)

local speedSlider = Misc:Slider("Walk Speed", {
    min = 16,
    max = 200,
    default = 16
}, function(value)
    print("Walk speed:", value)
end)

local teleportButton = Misc:Button("Teleport to Server", function()
    print("Teleporting...")
end)

local logoutButton = Misc:Button("Rejoin Server", function()
    print("Rejoining...")
end)

library:Ready()