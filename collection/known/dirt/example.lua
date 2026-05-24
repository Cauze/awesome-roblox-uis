local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/dirt", true))()

local Config = {}

local Window = Lib:CreateWindow("Dirt UI Demo")

Window:Section("Widgets")

Window:Button("Click Me", function()
    print("Button clicked!")
end)

Window:Toggle("Toggle Option", { location = Config, flag = "Toggle", default = true }, function(value)
    print("Toggle:", value)
end)

Window:Slider("Slider", { location = Config, flag = "Slider", min = 0, max = 100, default = 50, precise = true }, function(value)
    print("Slider:", value)
end)

Window:Dropdown("Dropdown", {
    location = Config,
    flag = "Dropdown",
    search = true,
    list = { "Option 1", "Option 2", "Option 3", "Option 4", "Option 5" }
}, function(value)
    print("Dropdown:", value)
end)

Window:Dropdown("Player List", {
    location = Config,
    flag = "PlayerList",
    PlayerList = true
}, function(value)
    print("Selected Player:", value)
end)

Window:Bind("KeyBind", { location = Config, flag = "KeyBind", default = Enum.KeyCode.B }, function()
    print("KeyBind pressed!")
end)

Window:Box("Box Input", { location = Config, flag = "Box", type = "number", hold = "Enter text" }, function(value)
    print("Box:", value)
end)

Window:Search(Color3.fromRGB(255, 0, 255))

Window:Label("This is a label")

Window:Section("Collapsible Section")

Window:Button("Section Button 1", function()
    print("Section button 1")
end)

Window:Button("Section Button 2", function()
    print("Section button 2")
end)