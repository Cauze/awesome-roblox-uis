local repo = 'https://raw.githubusercontent.com/4lpaca-pin/NeverLose/refs/heads/main/source.luau'

local NeverLose = loadstring(game:HttpGet(repo))()

local Window = NeverLose:CreateWindow({
    Name = 'NeverLose Example',
    Scale = NeverLose.Scales.Default,
})

local Tab = Window:AddTab('Main')

local Section = Tab:AddSection('Features')

Section:AddToggle('ExampleToggle', {
    Name = 'Example Toggle',
    Default = false,
    Callback = function(Value)
        print('Toggle:', Value)
    end
})

Section:AddSlider('ExampleSlider', {
    Name = 'Example Slider',
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(Value)
        print('Slider:', Value)
    end
})

Section:AddInput('ExampleInput', {
    Name = 'Example Input',
    Placeholder = 'Enter text...',
    Callback = function(Value)
        print('Input:', Value)
    end
})

Section:AddDropdown('ExampleDropdown', {
    Name = 'Example Dropdown',
    Values = {'Option 1', 'Option 2', 'Option 3'},
    Default = 1,
    Callback = function(Value)
        print('Dropdown:', Value)
    end
})

Section:AddColorPicker('ExampleColorPicker', {
    Name = 'Example Color',
    Default = Color3.fromRGB(78, 127, 252),
    Callback = function(Value)
        print('Color:', Value)
    end
})

Section:AddKeybind('ExampleKeybind', {
    Name = 'Example Keybind',
    Default = Enum.KeyCode.F,
    Callback = function(Value)
        print('Keybind:', Value)
    end
})

Section:AddButton('Example Button', function()
    print('Button clicked')
end)

Section:AddLabel('Example Label')

Section:AddDivider()

Section:AddParagraph('Paragraph Title', 'This is a paragraph with some descriptive text.')

local Section2 = Tab:AddSection('Second Section')

Section2:AddToggle('Toggle2', { Name = 'Another Toggle' })
Section2:AddSlider('Slider2', { Name = 'Another Slider', Min = 0, Max = 50, Default = 25 })

local Tab2 = Window:AddTab('Settings')

Tab2:AddSection('Config').AddButton('Save Config', function()
    print('Save clicked')
end)

NeverLose:CreateBlurModule(Window.Handle)