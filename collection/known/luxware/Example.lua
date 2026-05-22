local Luxt = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/main/Luxware/source.lua"))()

local MainWindow = Luxt.CreateWindow("Luxware GUI", 6105620301)

local mainTab = MainWindow:Tab("Home", 6034767608)
local generalSection = mainTab:Section("General Widgets")

generalSection:Label("Welcome to Luxware UI Library!")
generalSection:Button("Click Me!", function()
    print("Button clicked!")
end)
generalSection:Toggle("Toggle Feature", function(state)
    print("Toggle:", state)
end)
generalSection:Slider("WalkSpeed", 16, 500, function(value)
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)
generalSection:TextBox("Username", "Enter name here...", function(text)
    print("Username:", text)
end)
generalSection:KeyBind("Print Message", Enum.KeyCode.F, function()
    print("Keybind pressed!")
end)

local dropdownSection = mainTab:Section("Dropdown Example")
dropdownSection:DropDown("Select Game", {"Brookhaven", "Blox Fruits", "Arsenal", "Phantom Requiem"}, function(selected)
    print("Selected:", selected)
end)

local creditsTab = MainWindow:Tab("Credits")
local creditsSection = creditsTab:Section("Made By")
creditsSection:Credit("xHeptc - Main Developer")
creditsSection:Credit("GhostDuckyy - Repository Maintainer")