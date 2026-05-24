local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/panduh16/juju/main/ui.lua"))()

local Window = Library:Window("Juju UI", "juju")

local main = Window:Tab("Main")

main:Section("Combat")

main:Toggle("Aimbot", false, function(state)
    print("Aimbot:", state)
end)

main:Slider("Aimbot FOV", 1, 500, 100, function(value)
    print("FOV:", value)
end)

main:Dropdown("Target Part", {"Head", "Torso", "HumanoidRootPart"}, "Head", function(selected)
    print("Target:", selected)
end)

main:Colorpicker("ESP Color", Color3.fromRGB(255, 95, 95), function(color)
    print("ESP Color:", color)
end)

main:Section("Player")

main:Toggle("Speed Hack", false, function(state)
    print("Speed Hack:", state)
end)

main:Slider("Walk Speed", 16, 200, 16, function(value)
    print("Walk Speed:", value)
end)

main:Keybind("Fly Key", Enum.KeyCode.F, function()
    print("Fly toggled!")
end)

main:Textbox("Player Name", function(text)
    print("Player:", text)
end)

local visuals = Window:Tab("Visuals")

visuals:Section("ESP")

visuals:Toggle("Player ESP", false, function(state)
    print("Player ESP:", state)
end)

visuals:Toggle("Box ESP", false, function(state)
    print("Box ESP:", state)
end)

visuals:Toggle("Tracers", false, function(state)
    print("Tracers:", state)
end)

visuals:Colorpicker("ESP Color", Color3.fromRGB(255, 0, 0), function(color)
    print("ESP Color:", color)
end)

Window:Notification("Juju UI loaded!", 3)

print("Juju Example loaded!")