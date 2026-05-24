local Hattori = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/Ui-Librarys/main/Hattori/V4/source.lua"))()

local Window = Hattori:window("Hattori UI")

local Tab1 = Window:newTab("Widgets")
local Tab2 = Window:newTab("Settings")

Tab1:label("infoLabel", "Hattori UI Library - All Widgets Demo")

Tab1:button("Click Me", function()
    print("Button clicked!")
end)

Tab1:toggle("Enable Feature", {flag = "featureEnabled", default = false}, false, {}, function(state)
    print("Toggle state:", state)
end)

Tab1:slider("Volume", {flag = "volume", default = 50, min = 0, max = 100}, function(value)
    print("Volume:", value)
end, false, {})

Tab1:textbox("Username", {flag = "username", default = "Player"}, function(value)
    print("Username:", value)
end)

Tab1:colorSelector("Theme Color", {flag = "themeColor", default = Color3.fromRGB(255, 100, 100)}, function(color)
    print("Color selected:", color)
end)

Tab1:dropdown("Game Mode", false, {flag = "gameMode", list = {
    {Name = "Free for All"},
    {Name = "Team Deathmatch"},
    {Name = "Capture the Flag"}
}}, function(selected)
    print("Selected:", selected)
end)

Tab2:label("settingsLabel", "Settings Panel")

Tab2:toggle("Dark Mode", {flag = "darkMode", default = true}, false, {}, function(state)
    print("Dark mode:", state)
end)

Tab2:slider("Sensitivity", {flag = "sensitivity", default = 50, min = 1, max = 100}, function(value)
    print("Sensitivity:", value)
end, false, {})