local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/main/Librarys/Keylime/Example"))()

local Main = Library.new("Keylime Demo")

local Window = Main.WindowTab("Demo Window")

local Tab = Window.SideTab("Features")

local Section = Tab.Section("Combat")

Section.Toggle("Aimbot", function(state)
    print("Aimbot:", state)
end)

Section.Toggle("Triggerbot", function(state)
    print("Triggerbot:", state)
end)

Section.Slider("Smoothness", 1, 10, 5, function(value)
    print("Smoothness:", value)
end)

Section.Dropdown("Target Part", {"Head", "Torso", "Random"}, function(value)
    print("Target Part:", value)
end)

local Tab2 = Window.SideTab("Visuals")

local Section2 = Tab2.Section("ESP")

Section2.Toggle("Box ESP", function(state)
    print("Box ESP:", state)
end)

Section2.Toggle("Name ESP", function(state)
    print("Name ESP:", state)
end)