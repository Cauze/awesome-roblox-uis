local library = loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/0x"))()

local w1 = library:Window("0x37 UI Library")

w1:Label("Welcome to 0x37 UI Demo")

w1:Button("Print Hello", function()
    print("Hello from 0x37!")
end)

w1:Button("Print Goodbye", function()
    print("Goodbye from 0x37!")
end)

local wsSlider = w1:Slider(
    "WalkSpeed",
    "WS",
    16,
    300,
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
)

local jpSlider = w1:Slider(
    "JumpPower",
    "JP",
    50,
    300,
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end,
    100
)

w1:Toggle(
    "Freeze Player",
    "frz",
    false,
    function(toggled)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = toggled
    end
)

w1:Toggle(
    "Noclip Mode",
    "noclip",
    false,
    function(toggled)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        
        if toggled then
            for _, desc in pairs(character:GetDescendants()) do
                if desc:IsA("BasePart") then
                    desc.CanCollide = false
                end
            end
        else
            for _, desc in pairs(character:GetDescendants()) do
                if desc:IsA("BasePart") then
                    desc.CanCollide = true
                end
            end
        end
    end
)

w1:Label("0x37 UI - Simple & Clean")

w1:Button("Destroy GUI", function()
    for i, v in pairs(game.CoreGui:GetChildren()) do
        if v:FindFirstChild("Top") then
            v:Destroy()
        end
    end
end)

local w2 = library:Window("Second Window")

w2:Label("Multiple Windows Supported!")

w2:Button("Another Button", function()
    print("Button clicked!")
end)

local infiniteJumpToggle = w2:Toggle(
    "Infinite Jump",
    "infjump",
    false,
    function(toggled)
        local UserInputService = game:GetService("UserInputService")
        local player = game.Players.LocalPlayer
        local character = player.Character
        
        if toggled then
            UserInputService.JumpRequest:Connect(function()
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid:ChangeState(11)
                end
            end)
        end
    end
)

w2:Slider(
    "Gravity",
    "grav",
    0,
    100,
    function(value)
        workspace.Gravity = value
    end,
    196
)