local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/cerberus.lua"))()

local window = Library.new("Cerberus UI", true)

window:LockScreenBoundaries(true)

local tab = window:Tab("Home")

local section1 = tab:Section("Basic Widgets")

section1:Title("Welcome to Cerberus")

section1:Label("Cerberus is a modern UI library for Roblox with a sleek dark theme.")

section1:Button("Click Me!", function()
    print("Button pressed!")
end)

local toggle1
toggle1 = section1:Toggle("Enable Feature", function(bool)
    print("Toggle is: " .. tostring(bool))
    if toggle1 then
        toggle1:Set(bool)
    end
end)

section1:TextBox("Enter Name", function(txt)
    print("Textbox: " .. txt)
end)

section1:Keybind("Press Key", function()
    print("Keybind pressed!")
end, "E")

local section2 = tab:Section("Value Widgets")

local sliderVal = 50
section2:Slider("Sensitivity", function(val)
    sliderVal = val
    print("Slider Value: " .. val)
end, 100, 0)

local selectedColor = Color3.new()
section2:ColorWheel("Body Color", function(color)
    selectedColor = color
    print("Color: " .. tostring(color))
end)

local section3 = tab:Section("Container Widgets")

local dropdown = section3:Dropdown("Weapon Selection")
dropdown:ChangeText("Weapons")

dropdown:Toggle("Sword")
dropdown:Toggle("Gun")
dropdown:Toggle("Bomb")
dropdown:Toggle("Magic Staff")

local searchBar = section3:SearchBar("Search items...")
searchBar:Toggle("Item 1")
searchBar:Toggle("Item 2")
searchBar:Toggle("Item 3")

local section4 = tab:Section("Mutable Widgets")

local mutableLabel = section4:Label("Watch me change!")
mutableLabel:ChangeText("I just changed!", true)

local tab2 = window:Tab("Settings")

local sec1 = tab2:Section("Toggles")

local t1 = sec1:Toggle("Silent Aim", function(bool)
    print("Silent Aim: " .. tostring(bool))
end)
t1:Set(true)

sec1:Toggle("Aimbot", function(bool)
    print("Aimbot: " .. tostring(bool))
end)

sec1:Toggle("ESP", function(bool)
    print("ESP: " .. tostring(bool))
end)

local sec2 = tab2:Section("Values")

sec2:Slider("FOV", function(val)
    print("FOV: " .. val)
end, 90, 0)

sec2:Slider("Hitbox Size", function(val)
    print("Hitbox: " .. val)
end, 10, 1)

local sec3 = tab2:Section("Credits")

sec3:Label("Cerberus UI Library", 14)
sec3:Label("Made by Jxereas", 12)