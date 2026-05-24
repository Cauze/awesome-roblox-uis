-- Vision UI Lib v2 Example
-- Source: https://github.com/Loco-CTO/UI-Library (VisionLibV2)

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()

Window = Library:Create({
	Name = "Vision UI Lib v2",
	Footer = "By Loco_CTO, Sius and BruhOOFBoi",
	ToggleKey = Enum.KeyCode.RightShift,
	LoadedCallback = function()
		Window:TaskBarOnly(false)
	end,
	KeySystem = false,
	Key = "123456",
	MaxAttempts = 5,
	DiscordLink = nil,
})

Window:ChangeTogglekey(Enum.KeyCode.RightShift)

local Tab1 = Window:Tab({
	Name = "Main",
	Icon = "rbxassetid://11396131982",
	Color = Color3.new(1, 0, 0)
})

local Section1 = Tab1:Section({
	Name = "Basic controls"
})

local Label1 = Section1:Label({
	Name = "Welcome to Vision UI!"
})

Label1:SetName("Vision UI Lib v2\nA modern Roblox UI library")

local Button1 = Section1:Button({
	Name = "Click Me",
	Callback = function()
		Library:Notify({
			Name = "Button Clicked",
			Text = "You clicked the button!",
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

local Toggle1 = Section1:Toggle({
	Name = "Example Toggle",
	Default = false,
	Callback = function(Bool)
		Library:Notify({
			Name = "Toggle",
			Text = "Value: " .. tostring(Bool),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

local Section2 = Tab1:Section({
	Name = "Advanced controls"
})

local Slider1 = Section2:Slider({
	Name = "Example Slider",
	Max = 100,
	Min = 0,
	Default = 50,
	Callback = function(Number)
		Library:Notify({
			Name = "Slider",
			Text = "Value: " .. tostring(Number),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

local Keybind1 = Section2:Keybind({
	Name = "Example Keybind",
	Default = Enum.KeyCode.F,
	Callback = function()
		Library:Notify({
			Name = "Keybind",
			Text = "Keybind pressed!",
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end,
	UpdateKeyCallback = function(Key)
		Library:Notify({
			Name = "Keybind Updated",
			Text = "New key: " .. tostring(Key),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

local Textbox1 = Section2:SmallTextbox({
	Name = "Small Textbox",
	Default = "Enter text...",
	Callback = function(Text)
		Library:Notify({
			Name = "Textbox",
			Text = "Text: " .. Text,
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

local Dropdown1 = Section2:Dropdown({
	Name = "Example Dropdown",
	Items = {"Option 1", "Option 2", "Option 3", "Option 4"},
	Callback = function(item)
		Library:Notify({
			Name = "Dropdown",
			Text = "Selected: " .. tostring(item),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

local Button2 = Section2:Button({
	Name = "Clear Dropdown",
	Callback = function()
		Dropdown1:Clear()
	end
})

local Button3 = Section2:Button({
	Name = "Update Dropdown",
	Callback = function()
		Dropdown1:UpdateList({
			Items = {"New Item 1", "New Item 2", "New Item 3"},
			Replace = true
		})
	end
})

local Button4 = Section2:Button({
	Name = "Add Item",
	Callback = function()
		Dropdown1:AddItem("Added Item")
	end
})

local Colorpicker1 = Section2:Colorpicker({
	Name = "Example Colorpicker",
	DefaultColor = Color3.new(0.5, 0, 1),
	Callback = function(Color)
		Library:Notify({
			Name = "Colorpicker",
			Text = "Color: " .. tostring(Color),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

local Button5 = Section2:Button({
	Name = "Random Color",
	Callback = function()
		Colorpicker1:SetColor(Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255)))
	end
})

local Tab2 = Window:Tab({
	Name = "Others",
	Icon = "rbxassetid://11476626403",
	Color = Color3.new(0.474509, 0.474509, 0.474509)
})

local Section3 = Tab2:Section({
	Name = "UI Controls"
})

local Button6 = Section3:Button({
	Name = "Destroy UI",
	Callback = function()
		Library:Destroy()
	end
})

local Button7 = Section3:Button({
	Name = "Hide UI",
	Callback = function()
		Window:Toggled(false)
		task.wait(3)
		Window:Toggled(true)
	end
})

local Button8 = Section3:Button({
	Name = "Task Bar Only",
	Callback = function()
		Window:TaskBarOnly(true)
		task.wait(3)
		Window:TaskBarOnly(false)
	end
})

local Button9 = Section3:Button({
	Name = "Show Notification",
	Callback = function()
		Library:Notify({
			Name = "Test Notification",
			Text = "This is a test notification with callback!",
			Icon = "rbxassetid://11401835376",
			Duration = 5,
			Callback = function()
				Library:Notify({
					Name = "Callback",
					Text = "Notification callback executed!",
					Icon = "rbxassetid://11401835376",
					Duration = 3
				})
			end
		})
	end
})

local Section4 = Tab2:Section({
	Name = "Theme Customization"
})

Library:Notify({
	Name = "Welcome",
	Text = "Vision UI Lib v2 loaded successfully!",
	Icon = "rbxassetid://11401835376",
	Duration = 3
})