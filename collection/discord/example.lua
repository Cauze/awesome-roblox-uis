local DiscordLib = loadstring(game:HttpGet("https://github.com/dawid-scripts/UI-Libs/raw/main/discord%20lib.txt"))()

local Window = DiscordLib:Window("Example UI - Discord Lib")

local Server = Window:Server("Main Server", "http://www.roblox.com/asset/?id=6035143564")

local Channel = Server:Channel("Features")

Channel:Label("Welcome to Discord Lib - A Discord-styled UI library")

Channel:Button("Click Me!", function()
	DiscordLib:Notification("Button Clicked!", "You clicked the demo button.", "OK")
end)

Channel:Button("Another Button", function()
	print("Second button pressed")
end)

local ToggleCallback = false
Channel:Toggle("Toggle Feature", false, function(state)
	ToggleCallback = state
	DiscordLib:Notification("Toggle Changed", "Feature is now: " .. (state and "Enabled" or "Disabled"), "OK")
end)

Channel:Slider("Volume Slider", 0, 100, 50, function(value)
	print("Volume set to: " .. value)
end)

Channel:Slider("Sensitivity", 1, 100, 50, function(value)
	print("Sensitivity set to: " .. value)
end)

local DropdownOptions = {"Option 1", "Option 2", "Option 3", "Option 4"}
Channel:Dropdown("Select Option", DropdownOptions, function(selected)
	DiscordLib:Notification("Selected", "You chose: " .. selected, "OK")
end)

Channel:Textbox("Enter Text", "Type here...", true, function(text)
	print("Text entered: " .. text)
end)

Channel:Bind("Press Key", Enum.KeyCode.F, function()
	DiscordLib:Notification("Keybind", "F key was pressed!", "OK")
end)

Channel:Label("This is a static label - useful for section headers")

local Channel2 = Server:Channel("Settings")

Channel2:Label("Configuration Section")

Channel2:Toggle("God Mode", false, function(state)
	print("God mode: " .. tostring(state))
end)

Channel2:Toggle("ESP", false, function(state)
	print("ESP: " .. tostring(state))
end)

Channel2:Slider("Walk Speed", 16, 100, 16, function(value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

Channel2:Slider("Jump Power", 50, 200, 50, function(value)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

local ColorOptions = {"Red", "Blue", "Green", "Yellow"}
Channel2:Dropdown("Theme Color", ColorOptions, function(selected)
	print("Theme color: " .. selected)
end)

Channel2:Textbox("Player Name", "Enter name...", false, function(text)
	print("Player name set to: " .. text)
end)

Channel2:Bind("Toggle Speed", Enum.KeyCode.V, function()
	local humanoid = game.Players.LocalPlayer.Character.Humanoid
	humanoid.WalkSpeed = humanoid.WalkSpeed == 16 and 50 or 16
end)

local Channel3 = Server:Channel("Info")

Channel3:Label("Library Information")

Channel3:Button("Show Credits", function()
	DiscordLib:Notification("Credits", "Made by dawid-scripts", "Thanks!")
end)

Channel3:Button("Test Notification", function()
	DiscordLib:Notification("Test Title", "This is a notification popup!", "Cool")
end)

Channel3:Toggle("Silent Mode", false, function(state)
	print("Silent mode: " .. tostring(state))
end)