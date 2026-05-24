local Window = Library:CreateWindow({Title = "Atlanta", Size = UDim2.new(0, 559, 0, 668),  Position = UDim2.fromScale(0.5, 0), AnchorPoint = Vector2.new(0.5, 0)})

local Combat = Window:AddTab({Title = "Combat", Columns = 2});
local Visuals = Window:AddTab({Title = "Visuals", Columns = 2});
local Misc = Window:AddTab({Title = "Misc", Columns = 2});

local Section = Combat:AddSection({Title = "Section", Side = 1})
local Toggle = Section:AddToggle({ Text = "Toggle", Default = false, Callback = print })
Section:AddToggle({Text = "Enabled Toggle", Default = true, print })

local DescriptionSection = Combat:AddSection({Title = "Section", Side = 1, Description = "This is a really long description, honestly what do I put here its just for scaling ig."})
local Toggle = DescriptionSection:AddToggle({ Text = "Toggle", Default = false, Callback = print })
DescriptionSection:AddToggle({Text = "Enabled Toggle", Default = true, print }):Tooltip({Name = "One lined tooltip which can have loads of text"})
DescriptionSection:AddToggle({Text = "Tooltip Multiline Toggle", Default = true, print }):Tooltip({Name = "One \nlined tooltip which \ncan have loads of \ntext", MultiLine = true})

Section:AddSlider({Text = "Slider", Min = 0, Max = 100, Rounding = 5, Default = 50, Suffix ="%", Flag = "NewSlider2", Callback = print })
Section:AddSlider({Text = "Slider", Min = 0, Max = 100, Rounding = 5, Default = 50, Suffix ="%", Flag = "New Slider1", Callback = print })
Section:AddSlider({Text = "Slider", Min = 0, Max = 1000, Rounding = 0.1, Default = 1, Suffix ="m/s", Flag = "NewSLide43", print })
Section:AddRangeSlider({Text = "Range Slider", Min = 0, Max = 1000, Rounding = 0.1, Default = {0, 1000}, Flag = "NewSliderRange", Callback = print})

Section:AddInput({Text = "Input", Placeholder = "Placeholder here...", FocusLost = true, ClearTextOnFocus = false, Callback = print})
Section:AddDropdown({ Text = "Dropdown", Values = { "Option 1", "Option 2", "Option 3", "Option 4" }, Default ="Option 1", Multi = false, Callback = print })
Section:AddDropdown({ Text = "Dropdown", Values = { "Option 1", "Option 2", "Option 3", "Option 4" }, Default ="Option 1", Multi = true, Callback = print })
Section:AddDropdown({ Text = "Scrolling", Values = { "Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10", "Option 11", "Option 12", "Option 13" }, Default ="Option 1", Multi = false, Callback = print })
Section:AddDropdown({ Text = "Scrolling w search", Values = { "Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10", "Option 11", "Option 12", "Option 13" }, Default ="Option 1", Multi = false, Search = true, Callback = print })

Section:AddButton({Text = "Button1", Confirmation = true, print})
Section:AddButton({Text = "Button1", print}):AddButton({Text = "Button2", print})
Section:AddButton({Text = "Button1", print}):AddButton({Text = "Button2", print}):AddButton({Text = "Button3", print})

Section:AddKeyPicker({Text = "Keypicker with a longer name", Key = Enum.KeyCode.E, Mode = "Toggle", Active = false, Callback = print})
Section:AddKeyPicker({Text = "Short Name", Key = Enum.KeyCode.E, Mode = "Toggle", Active = false, Callback = print})
Section:AddKeyPicker({Text = "Aimbot xyz", Key = Enum.KeyCode.E, Mode = "Toggle", Active = false, Callback = print})

Section:AddColorPicker({Text = "Colorpicker", Default = Color3.fromRGB(255, 0, 0), Transparency = 0.5, Callback = print})

local Section1, Section2, Section3 = Combat:AddMultiSection({Names = {"1", "2", "3"}, Side = 2})
Section1:AddToggle({Text = "Enabled Toggle", Default = true, print })
Section1:AddList({Options = {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10", "Option 11", "Option 12", "Option 13"}})
Section1:AddButton({Text = "Test Notification", Callback = function()
    Library:Notify({Text = "oxy got raped by his boyfriend damage 100", Lifetime = math.random(1, 10)})
end})

do -- Preview Example
    local Preview; 
    local UpdatePreview = function()
        if not Preview then 
            return 
        end 

        Preview.Update()    
    end; 
    
    local Section = Visuals:AddSection({Title = "Features", Side = 1}) do 
        Section:AddToggle({Text = "Enabled", Flag = "Esp Enabled", Default = false, Callback = UpdatePreview })
        local Toggle = Section:AddToggle({Text = "Box", Default = false, Callback = UpdatePreview })
        :AddColorPicker({Text = "High Contrast Box", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})
        :AddColorPicker({Text = "Low Contrast Box", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})

        Section:AddToggle({Text = "Box Fill", Default = false, Callback = UpdatePreview })
        :AddColorPicker({Flag = "High Contrast Fill", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})
        :AddColorPicker({Text = "Low Contrast Fill", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})
        
        Section:AddToggle({Text = "Box Glow", Default = false, Callback = UpdatePreview })
        :AddColorPicker({Text = "High Contrast Glow", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})
        :AddColorPicker({Text = "Low Contrast Glow", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})

        Section:AddToggle({Text = "Healthbar", Default = false, Callback = UpdatePreview })
        :AddColorPicker({Text = "High Health", Default = Color3.fromRGB(0, 255, 0), Alpha = 0.5, Callback = UpdatePreview})
        :AddColorPicker({Text = "Mid Health", Default = Color3.fromRGB(255, 165, 0), Alpha = 0.5, Callback = UpdatePreview})
        :AddColorPicker({Text = "Low Health", Default = Color3.fromRGB(255, 0, 0), Alpha = 0.5, Callback = UpdatePreview})

        Section:AddToggle({Text = "Healthbar Text", Default = false, Callback = UpdatePreview })
        
        Section:AddToggle({Text = "Names", Default = false, Callback = UpdatePreview })
        :AddColorPicker({Text = "Names Text Color", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})
        
        Section:AddToggle({Text = "Distance Text", Default = false, Callback = UpdatePreview })
        :AddColorPicker({Text = "Distance Text Color", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})

        Section:AddToggle({Text = "Weapon Text", Default = false, Callback = UpdatePreview })
        :AddColorPicker({Text = "Weapon Text Color", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})

        Section:AddToggle({Text = "Flags", Default = false, Callback = UpdatePreview })
        :AddColorPicker({Text = "Flags Text Color", Default = Color3.fromRGB(255, 255, 255), Alpha = 0.5, Callback = UpdatePreview})
    end

    local Section = Visuals:AddSection({Title = "Other", Icon = "rbxassetid://74577789385708", Side = 1}) do 
        Section:AddSlider({Text = "Box Gradient Rotation", Min = -180, Max = 180, Rounding = 1, Default = 0, Suffix ="°", Callback = UpdatePreview })
        Section:AddSlider({Text = "Box Fill Rotation", Min = -180, Max = 180, Rounding = 1, Default = 0, Suffix ="°", Callback = UpdatePreview })
        Section:AddSlider({Text = "Box Glow Rotation", Min = -180, Max = 180, Rounding = 1, Default = 0, Suffix ="°", Callback = UpdatePreview })
    end

    local Section = Visuals:AddSection({Title = "Preview", Side = 2})
    Preview = Section:AddPreview({Height = 300})
    UpdatePreview()
end 

Window:InitPanels()

task.wait(Library.TweeningSpeed)

for Name,Value in Library.Themes.Preset do 
    Library:Refresh(Name, Value)
end

Library:AutoLoad()
