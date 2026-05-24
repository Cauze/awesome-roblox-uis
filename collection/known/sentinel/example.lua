local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/astraln/SentinelUILIB/main/UI.lua', true))()

local window = Library:Window('Sentinel')

local homeTab = window:Tab('Home')
local combatTab = window:Tab('Combat')
local visualsTab = window:Tab('Visuals')
local settingsTab = window:Tab('Settings')

homeTab:Button('Button', function()
    print('Button clicked!')
end)

homeTab:Toggle('Toggle', false, function(state)
    print('Toggle:', state)
end)

homeTab:Label("Label")

homeTab:Keybind("Keybind", Enum.KeyCode.E, function(key)
    print('Keybind pressed:', key)
end)

homeTab:Slider("Slider", 16, 1000, 16, function(value)
    print('Slider value:', value)
end)

local dropdown = homeTab:Dropdown("Dropdown", {"Option 1", "Option 2", "Option 3", "Option 4"}, function(item)
    print('Selected:', item)
end)

homeTab:Button('Refresh Dropdown', function()
    dropdown:RefreshDropdown({'New 1', 'New 2', 'New 3'})
end)

combatTab:Button('Aimbot', function()
    print('Aimbot enabled')
end)

combatTab:Toggle('Silent Aim', false, function(state)
    print('Silent Aim:', state)
end)

combatTab:Slider('FOV Radius', 0, 360, 50, function(value)
    print('FOV:', value)
end)

visualsTab:Button('ESP', function()
    print('ESP enabled')
end)

visualsTab:Toggle('Box ESP', true, function(state)
    print('Box ESP:', state)
end)

visualsTab:Toggle('Name ESP', true, function(state)
    print('Name ESP:', state)
end)

settingsTab:Label("Sentinel UI")
settingsTab:Label("Created by astraln")
settingsTab:Button('Save Config', function()
    print('Config saved!')
end)

settingsTab:Button('Load Config', function()
    print('Config loaded!')
end)