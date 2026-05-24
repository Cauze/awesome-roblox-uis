local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()

local mainWindow = library:Window("Turtle UI Demo")

mainWindow:Button("Example Button", function()
    print("Button clicked!")
end)

mainWindow:Toggle("Example Toggle", false, function(bool)
    print("Toggle:", bool)
end)

mainWindow:Slider("Example Slider", 0, 100, 50, function(value)
    print("Slider:", value)
end)

mainWindow:Label("Credits to Intrer#0421", Color3.fromRGB(127, 143, 166))

mainWindow:Box("Walkspeed", function(text, focuslost)
    if focuslost then
        print("Walkspeed:", text)
    end
end)

local dropdown = mainWindow:Dropdown("Example Dropdown", {"Option 1", "Option 2", "Option 3"}, function(name)
    print("Dropdown selected:", name)
end)

dropdown:Button("Add New Option")
dropdown:Button("Another Option")

mainWindow:ColorPicker("Pick a Color", Color3.fromRGB(0, 151, 230), function(color)
    print("Color picked:", color)
end)

mainWindow:ColorPicker("Rainbow Color", true, function(color)
    print("Rainbow color:", color)
end)

library:Keybind("P")

local secondWindow = library:Window("Second Window")

secondWindow:Label("This is a second window!", Color3.fromRGB(255, 255, 255))

secondWindow:Toggle("Another Toggle", true, function(bool)
    print("Second window toggle:", bool)
end)

local sliderControl = secondWindow:Slider("Speed Control", 16, 100, 16, function(value)
    print("Speed set to:", value)
end)

secondWindow:Button("Reset Speed", function()
    sliderControl:SetValue(16)
    print("Speed reset to 16")
end)

local colorPicker = secondWindow:ColorPicker("Theme Color", Color3.fromRGB(68, 189, 50), function(color)
    print("Theme color changed:", color)
end)

secondWindow:Box("Custom Value", function(text, focuslost)
    if focuslost then
        print("Custom value input:", text)
    end
end)

local dropdown2 = secondWindow:Dropdown("Actions", {"Teleport", "Fly", "Noclip"}, function(action)
    print("Action selected:", action)
end)

dropdown2:Button("Refresh Actions")

print("Turtle UI loaded successfully!")