local repo = 'https://raw.githubusercontent.com/Itzzavi335/Kairo-Ui-Library/refs/heads/main/source.luau'

local Kairo = loadstring(game:HttpGet(repo))()

local Window = Kairo:CreateWindow({
    Title = 'Kairo Example',
    Theme = 'Default',
    Size = UDim2.fromOffset(520, 420),
})

local MainTab = Window:AddTab('Main')

MainTab:AddParagraph('Welcome', 'This is the Kairo UI library example.')

MainTab:AddToggle('ExampleToggle', {
    Title = 'Example Toggle',
    Description = 'A toggle with callback support',
    Callback = function(Value)
        print('Toggle:', Value)
    end
})

MainTab:AddSlider('ExampleSlider', {
    Title = 'Example Slider',
    Description = 'A slider with min/max values',
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(Value)
        print('Slider:', Value)
    end
})

MainTab:AddInput('ExampleInput', {
    Title = 'Example Input',
    Description = 'An input field',
    Default = 'Hello',
    Callback = function(Value)
        print('Input:', Value)
    end
})

MainTab:AddDropdown('ExampleDropdown', {
    Title = 'Example Dropdown',
    Description = 'A dropdown selection',
    Options = {'Option 1', 'Option 2', 'Option 3'},
    Default = 1,
    Callback = function(Value)
        print('Dropdown:', Value)
    end
})

MainTab:AddColorPicker('ExampleColorPicker', {
    Title = 'Example Color',
    Description = 'A color picker',
    Default = Color3.fromRGB(255, 0, 255),
    Callback = function(Value)
        print('Color:', Value)
    end
})

MainTab:AddButton('Example Button', function()
    print('Button clicked')
end)

MainTab:AddDivider()

MainTab:AddLabel('Example Label')

local SettingsTab = Window:AddTab('Settings')

SettingsTab:AddSection('Config').AddButton('Save Config', function()
    print('Save clicked')
end)

SettingsTab:AddSection('Theme').AddButton('Change Theme', function()
    print('Theme change requested')
end)