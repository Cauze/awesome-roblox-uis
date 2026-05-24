local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/coastified/src.lua"))()

local Window = Lib:Window("Coastified UI", "pro haxxx", Enum.KeyCode.RightShift)

local basicTab = Window:Tab("Basic Widgets")

basicTab:Label("Welcome to Coastified UI!")
basicTab:Button("Click Me!", function()
    print("Button clicked!")
end)
basicTab:Toggle("Enable Feature", function(state)
    print("Toggle:", state)
end)
basicTab:Slider("WalkSpeed", 16, 200, 100, function(value)
    print("WalkSpeed:", value)
end)

basicTab:Line()

basicTab:Label("Separator with Line widget")

local visualsTab = Window:Tab("Visuals")

visualsTab:Colorpicker("Target Color", Color3.fromRGB(255, 128, 0), function(color)
    print("Color changed to:", color)
end)

visualsTab:Dropdown("Select Part", {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}, function(selected)
    print("Selected:", selected)
end)

local settingsTab = Window:Tab("Settings")

settingsTab:Button("Reset WalkSpeed", function()
    print("Reset WalkSpeed to 16")
end)
settingsTab:Toggle("Infinite Jump", function(state)
    print("Infinite Jump:", state)
end)
settingsTab:Slider("JumpPower", 50, 300, 50, function(value)
    print("JumpPower:", value)
end)