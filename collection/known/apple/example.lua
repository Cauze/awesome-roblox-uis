local library = loadstring(game:HttpGet("https://github.com/GoHamza/AppleLibrary/blob/main/main.lua?raw=true"))()

local window = library:init("Apple UI Library", true, Enum.KeyCode.RightShift, true)

window:Divider("Welcome to Apple UI Library")

local sectionBasics = window:Section("Basic Widgets")

sectionBasics:Divider("Divider inside section")

sectionBasics:Label("This is a label widget - displays static text information.")

sectionBasics:Button("Click me!", function()
    print("Button clicked!")
    window:TempNotify("Success!", "You clicked the button!", "rbxassetid://12608259004")
end)

sectionBasics:Button("Another Button", function()
    print("Second button pressed")
end)

sectionBasics:Switch("Toggle Switch", false, function(state)
    print("Switch toggled:", state)
end)

sectionBasics:Switch("Toggle On by Default", true, function(state)
    print("Second switch toggled:", state)
end)

sectionBasics:TextField("Text Field", "Enter some text...", function(text)
    print("Text submitted:", text)
end)

local sectionNotifications = window:Section("Notifications")

sectionNotifications:Divider("Notification demos")

sectionNotifications:Button("Temporary Notification", function()
    window:TempNotify("Warning!", "This notification will disappear in 5 seconds.", "rbxassetid://12608259004")
end)

sectionNotifications:Button("Single Button Notification", function()
    window:Notify("Hello!", "This is a single button notification. Click the button to dismiss.", "Got it!", "rbxassetid://12608259004", function()
        print("Single button notification dismissed")
    end)
end)

sectionNotifications:Button("Dual Button Notification", function()
    window:Notify2("Confirm Action", "Are you sure you want to proceed?", "Yes", "No", "rbxassetid://12608259004", function()
        print("User clicked Yes")
    end, function()
        print("User clicked No")
    end)
end)

local sectionAdvanced = window:Section("Advanced Features")

sectionAdvanced:Divider("More widgets coming soon...")

sectionAdvanced:Label("Additional widgets can be added to demonstrate more functionality.")

window:GreenButton(function()
    print("Green button (resize) clicked!")
end)

local sectionSelect = window:Section("Selection Demo")
sectionSelect:Divider("Click another section to switch")

sectionSelect:Select()