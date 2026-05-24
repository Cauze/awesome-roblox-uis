local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/jakepscripts/moonlib/main/moonlibv1.lua'))()

local main = library:CreateWindow("MoonLIB", "#19cf83", 9160626035)

main:CreateTab("Home")

main:CreateLabel("Label", "Home")

main:CreateToggle("Toggle", "Home", function(togglestate)
    print("Toggle state:", togglestate)
end)

main:CreateButton("Button", "Home", function()
    print("Button clicked")
end)

main:CreateDropdown("Dropdown", "Home", {"Oranges", "Apples", "Grapes", "Cherrys"}, function(arg)
    print("Dropdown selected:", arg)
end)

main:CreateSlider("Slider", "Home", 0, 100, function(sliderval)
    print("Slider value:", sliderval)
end)

main:CreateTab("Second Tab")

main:CreateLabel("Another Label", "Second Tab")

main:CreateToggle("Another Toggle", "Second Tab", function(state)
    print("Second toggle:", state)
end)

main:CreateButton("Another Button", "Second Tab", function()
    print("Second button clicked")
end)