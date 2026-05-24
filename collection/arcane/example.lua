if getgenv().Library then
    getgenv().Library:Unload()
end

local Library do
    local Workspace = game:GetService("Workspace")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local RunService = game:GetService("RunService")
    local CoreGui = cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")
    local TweenService = game:GetService("TweenService")

    gethui = gethui or function()
        return CoreGui
    end

    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()

    local FromRGB = Color3.fromRGB
    local FromHSV = Color3.fromHSV
    local FromHex = Color3.fromHex

    local RGBSequence = ColorSequence.new
    local RGBSequenceKeypoint = ColorSequenceKeypoint.new

    local UDim2New = UDim2.new
    local UDimNew = UDim.new
    local Vector2New = Vector2.new

    local MathClamp = math.clamp
    local MathFloor = math.floor

    local TableInsert = table.insert
    local TableFind = table.find
    local TableRemove = table.remove
    local TableConcat = table.concat
    local TableClone = table.clone
    local TableUnpack = table.unpack

    local StringFormat = string.format
    local StringFind = string.find
    local StringGSub = string.gsub
    local StringLen = string.len
    local StringSub = string.sub

    local InstanceNew = Instance.new

    Library = {
        Theme =  { },
        MenuKeybind = tostring(Enum.KeyCode.Z),
        Flags = { },
        Tween = {
            Time = 0.4,
            Style = Enum.EasingStyle.Quint,
            Direction = Enum.EasingDirection.Out
        },
        FadeSpeed = 0.2,
        Folders = {
            Directory = "esdeeeeee",
            Configs = "esdeeeeee/Configs",
            Assets = "esdeeeeee/Assets",
        },
        Pages = { },
        Sections = { },
        Connections = { },
        Threads = { },
        ThemeMap = { },
        ThemeItems = { },
        OpenFrames = { },
        SetFlags = { },
        UnnamedConnections = 0,
        UnnamedFlags = 0,
        Holder = nil,
        NotifHolder = nil,
        UnusedHolder = nil,
        Font = nil
    }

    local Keys = {
        ["Unknown"]           = "Unknown",
        ["Backspace"]         = "Back",
        ["Tab"]               = "Tab",
        ["Clear"]             = "Clear",
        ["Return"]            = "Return",
        ["Pause"]             = "Pause",
        ["Escape"]            = "Escape",
        ["Space"]             = "Space",
        ["QuotedDouble"]      = '"',
        ["Hash"]              = "#",
        ["Dollar"]            = "$",
        ["Percent"]           = "%",
        ["Ampersand"]         = "&",
        ["Quote"]             = "'",
        ["LeftParenthesis"]   = "(",
        ["RightParenthesis"]  = " )",
        ["Asterisk"]          = "*",
        ["Plus"]              = "+",
        ["Comma"]             = ",",
        ["Minus"]             = "-",
        ["Period"]            = ".",
        ["Slash"]             = "`",
        ["Three"]             = "3",
        ["Seven"]             = "7",
        ["Eight"]             = "8",
        ["Colon"]             = ":",
        ["Semicolon"]         = ";",
        ["LessThan"]          = "<",
        ["GreaterThan"]       = ">",
        ["Question"]          = "?",
        ["Equals"]            = "=",
        ["At"]                = "@",
        ["LeftBracket"]       = "LeftBracket",
        ["RightBracket"]      = "RightBracked",
        ["BackSlash"]         = "BackSlash",
        ["Caret"]             = "^",
        ["Underscore"]        = "_",
        ["Backquote"]         = "`",
        ["LeftCurly"]         = "{",
        ["Pipe"]              = "|",
        ["RightCurly"]        = "}",
        ["Tilde"]             = "~",
        ["Delete"]            = "Delete",
        ["End"]               = "End",
        ["KeypadZero"]        = "Keypad0",
        ["KeypadOne"]         = "Keypad1",
        ["KeypadTwo"]         = "Keypad2",
        ["KeypadThree"]       = "Keypad3",
        ["KeypadFour"]        = "Keypad4",
        ["KeypadFive"]        = "Keypad5",
        ["KeypadSix"]         = "Keypad6",
        ["KeypadSeven"]       = "Keypad7",
        ["KeypadEight"]       = "Keypad8",
        ["KeypadNine"]        = "Keypad9",
        ["KeypadPeriod"]      = "KeypadP",
        ["KeypadDivide"]      = "KeypadD",
        ["KeypadMultiply"]    = "KeypadM",
        ["KeypadMinus"]       = "KeypadM",
        ["KeypadPlus"]        = "KeypadP",
        ["KeypadEnter"]       = "KeypadE",
        ["KeypadEquals"]      = "KeypadE",
        ["Insert"]            = "Insert",
        ["Home"]              = "Home",
        ["PageUp"]            = "PageUp",
        ["PageDown"]          = "PageDown",
        ["RightShift"]        = "RightShift",
        ["LeftShift"]         = "LeftShift",
        ["RightControl"]      = "RightControl",
        ["LeftControl"]       = "LeftControl",
        ["LeftAlt"]           = "LeftAlt",
        ["RightAlt"]          = "RightAlt"
    }

    local Themes = {
        ["Preset"] = {
            ["Background"] = FromRGB(16, 18, 18),
            ["Inline"] = FromRGB(21, 24, 24),
            ["Element"] = FromRGB(30, 34, 34),
            ["Accent"] = FromRGB(255, 255, 255),
            ["Border"] = FromRGB(30, 34, 34),
            ["Border 2"] = FromRGB(56, 62, 62)
        }
    }

    Library.__index = Library
    Library.Sections.__index = Library.Sections
    Library.Pages.__index = Library.Pages

    Library.Theme = TableClone(Themes["Preset"])

    for Index, Value in Library.Folders do
        if not isfolder(Value) then
            makefolder(Value)
        end
    end

    local Tween = { } do
        Tween.__index = Tween

        Tween.Create = function(self, Item, Info, Goal, IsRawItem)
            Item = IsRawItem and Item or Item.Instance
            Info = Info or TweenInfo.new(Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction)

            local NewTween = {
                Tween = TweenService:Create(Item, Info, Goal),
                Info = Info,
                Goal = Goal,
                Item = Item
            }

            NewTween.Tween:Play()
            setmetatable(NewTween, Tween)
            return NewTween
        end

        Tween.GetProperty = function(self, Item)
            Item = Item or self.Item

            if Item:IsA("Frame") then
                return { "BackgroundTransparency" }
            elseif Item:IsA("TextLabel") or Item:IsA("TextButton") then
                return { "TextTransparency", "BackgroundTransparency" }
            elseif Item:IsA("ImageLabel") or Item:IsA("ImageButton") then
                return { "BackgroundTransparency", "ImageTransparency" }
            elseif Item:IsA("ScrollingFrame") then
                return { "BackgroundTransparency", "ScrollBarImageTransparency" }
            elseif Item:IsA("TextBox") then
                return { "TextTransparency", "BackgroundTransparency" }
            elseif Item:IsA("UIStroke") then
                return { "Transparency" }
            end
        end

        Tween.FadeItem = function(self, Item, Property, Visibility, Speed)
            local Item = Item or self.Item
            local OldTransparency = Item[Property]
            Item[Property] = Visibility and 1 or OldTransparency

            local NewTween = Tween:Create(Item, TweenInfo.new(Speed or Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction), {
                [Property] = Visibility and OldTransparency or 1
            }, true)

            Library:Connect(NewTween.Tween.Completed, function()
                if not Visibility then
                    task.wait()
                    Item[Property] = OldTransparency
                end
            end)

            return NewTween
        end

        Tween.Get = function(self)
            if not self.Tween then
                return
            end
            return self.Tween, self.Info, self.Goal
        end

        Tween.Pause = function(self)
            if not self.Tween then
                return
            end
            self.Tween:Pause()
        end

        Tween.Play = function(self)
            if not self.Tween then
                return
            end
            self.Tween:Play()
        end

        Tween.Clean = function(self)
            if not self.Tween then
                return
            end
            Tween:Pause()
            self = nil
        end
    end

    local Instances = { } do
        Instances.__index = Instances

        Instances.Create = function(self, Class, Properties)
            local NewItem = {
                Instance = InstanceNew(Class),
                Properties = Properties,
                Class = Class
            }

            setmetatable(NewItem, Instances)

            for Property, Value in NewItem.Properties do
                NewItem.Instance[Property] = Value
            end

            return NewItem
        end

        Instances.AddToTheme = function(self, Properties)
            if not self.Instance then
                return
            end
            Library:AddToTheme(self, Properties)
        end

        Instances.ChangeItemTheme = function(self, Properties)
            if not self.Instance then
                return
            end
            Library:ChangeItemTheme(self, Properties)
        end

        Instances.Connect = function(self, Event, Callback, Name)
            if not self.Instance then
                return
            end
            if not self.Instance[Event] then
                return
            end
            return Library:Connect(self.Instance[Event], Callback, Name)
        end

        Instances.Tween = function(self, Info, Goal)
            if not self.Instance then
                return
            end
            return Tween:Create(self, Info, Goal)
        end

        Instances.Disconnect = function(self, Name)
            if not self.Instance then
                return
            end
            return Library:Disconnect(Name)
        end

        Instances.Clean = function(self)
            if not self.Instance then
                return
            end
            self.Instance:Destroy()
            self = nil
        end

        Instances.MakeDraggable = function(self)
            if not self.Instance then
                return
            end

            local Gui = self.Instance
            local Dragging = false
            local DragStart
            local StartPosition

            local Set = function(Input)
                local DragDelta = Input.Position - DragStart
                self:Tween(TweenInfo.new(0.16, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = UDim2New(StartPosition.X.Scale, StartPosition.X.Offset + DragDelta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + DragDelta.Y)
                })
            end

            local InputChanged

            self:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = Input.Position
                    StartPosition = Gui.Position

                    if InputChanged then
                        return
                    end

                    InputChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                            InputChanged:Disconnect()
                            InputChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if Dragging then
                        Set(Input)
                    end
                end
            end)

            return Dragging
        end

        Instances.MakeResizeable = function(self, Minimum, Maximum)
            if not self.Instance then
                return
            end

            local Gui = self.Instance
            local Resizing = false
            local Start = UDim2New()
            local Delta = UDim2New()
            local ResizeMax = Gui.Parent.AbsoluteSize - Gui.AbsoluteSize

            local ResizeButton = Instances:Create("ImageButton", {
                Parent = Gui,
                Image = "rbxassetid://",
                AnchorPoint = Vector2New(1, 1),
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(0, 8, 0, 8),
                Position = UDim2New(1, -4, 1, -4),
                Name = "\0",
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                ZIndex = 5,
                AutoButtonColor = false,
                Visible = true,
            })
            ResizeButton:AddToTheme({ImageColor3 = "Accent"})

            local InputChanged

            ResizeButton:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Resizing = true
                    Start = Gui.Size - UDim2New(0, Input.Position.X, 0, Input.Position.Y)

                    if InputChanged then
                        return
                    end

                    InputChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Resizing = false
                            InputChanged:Disconnect()
                            InputChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if Resizing then
                        ResizeMax = Maximum or Gui.Parent.AbsoluteSize - Gui.AbsoluteSize
                        Delta = Start + UDim2New(0, Input.Position.X, 0, Input.Position.Y)
                        Delta = UDim2New(0, math.clamp(Delta.X.Offset, Minimum.X, ResizeMax.X), 0, math.clamp(Delta.Y.Offset, Minimum.Y, ResizeMax.Y))
                        Tween:Create(Gui, TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = Delta}, true)
                    end
                end
            end)

            return Resizing
        end

        Instances.OnHover = function(self, Function)
            if not self.Instance then
                return
            end
            return Library:Connect(self.Instance.MouseEnter, Function)
        end

        Instances.OnHoverLeave = function(self, Function)
            if not self.Instance then
                return
            end
            return Library:Connect(self.Instance.MouseLeave, Function)
        end
    end

    local CustomFont = { } do
        function CustomFont:New(Name, Weight, Style, Data)
            if not isfile(Data.Id) then
                writefile(Data.Id, game:HttpGet(Data.Url))
            end

            local Data = {
                name = Name,
                faces = {
                    {
                        name = Name,
                        weight = Weight,
                        style = Style,
                        assetId = getcustomasset(Data.Id)
                    }
                }
            }

            writefile(`{Library.Folders.Fonts}/{Name}.font`, HttpService:JSONEncode(Data))
            return Font.new(getcustomasset(`{Library.Folders.Fonts}/{Name}.font`), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        end

        Library.Font = CustomFont:New("InterSemiBold", "Regular", "Normal", {
            Id = "Inter",
            Url = "https://github.com/sametexe001/luas/raw/refs/heads/main/fonts/InterSemibold.ttf"
        })
    end

    Library.Holder = Instances:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\0",
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        DisplayOrder = 2,
        ResetOnSpawn = false
    })

    Library.UnusedHolder = Instances:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\0",
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Enabled = false,
        ResetOnSpawn = false
    })

    Library.NotifHolder = Instances:Create("Frame", {
        Parent = Library.Holder.Instance,
        Name = "\0",
        BackgroundTransparency = 1,
        Size = UDim2New(0, 0, 1, 0),
        BorderColor3 = FromRGB(0, 0, 0),
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = FromRGB(255, 255, 255)
    })

    Instances:Create("UIListLayout", {
        Parent = Library.NotifHolder.Instance,
        Name = "\0",
        Padding = UDimNew(0, 12),
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    Instances:Create("UIPadding", {
        Parent = Library.NotifHolder.Instance,
        Name = "\0",
        PaddingTop = UDimNew(0, 12),
        PaddingBottom = UDimNew(0, 12),
        PaddingRight = UDimNew(0, 12),
        PaddingLeft = UDimNew(0, 12)
    })

    Library.Unload = function(self)
        for Index, Value in self.Connections do
            Value.Connection:Disconnect()
        end

        for Index, Value in self.Threads do
            coroutine.close(Value)
        end

        if self.Holder then
            self.Holder:Clean()
        end

        Library = nil
        getgenv().Library = nil
    end

    Library.GetImage = function(self, Image)
        local ImageData = self.Images[Image]
        if not ImageData then
            return
        end
        return getcustomasset(self.Folders.Assets .. "/" .. ImageData[1])
    end

    Library.Round = function(self, Number, Float)
        local Multiplier = 1 / (Float or 1)
        return MathFloor(Number * Multiplier) / Multiplier
    end

    Library.Thread = function(self, Function)
        local NewThread = coroutine.create(Function)
        coroutine.wrap(function()
            coroutine.resume(NewThread)
        end)()
        TableInsert(self.Threads, NewThread)
        return NewThread
    end

    Library.SafeCall = function(self, Function, ...)
        local Arguements = { ... }
        local Success, Result = pcall(Function, TableUnpack(Arguements))
        if not Success then
            warn(Result)
            return false
        end
        return Success
    end

    Library.Connect = function(self, Event, Callback, Name)
        Name = Name or StringFormat("connection_number_%s_%s", self.UnnamedConnections + 1, HttpService:GenerateGUID(false))

        local NewConnection = {
            Event = Event,
            Callback = Callback,
            Name = Name,
            Connection = nil
        }

        Library:Thread(function()
            NewConnection.Connection = Event:Connect(Callback)
        end)

        TableInsert(self.Connections, NewConnection)
        return NewConnection
    end

    Library.Disconnect = function(self, Name)
        for _, Connection in self.Connections do
            if Connection.Name == Name then
                Connection.Connection:Disconnect()
                break
            end
        end
    end

    Library.NextFlag = function(self)
        local FlagNumber = self.UnnamedFlags + 1
        return StringFormat("flag_number_%s_%s", FlagNumber, HttpService:GenerateGUID(false))
    end

    Library.AddToTheme = function(self, Item, Properties)
        Item = Item.Instance or Item

        local ThemeData = {
            Item = Item,
            Properties = Properties,
        }

        for Property, Value in ThemeData.Properties do
            if type(Value) == "string" then
                Item[Property] = self.Theme[Value]
            else
                Item[Property] = Value()
            end
        end

        TableInsert(self.ThemeItems, ThemeData)
        self.ThemeMap[Item] = ThemeData
    end

    Library.ToRich = function(self, Text, Color)
        return `<font color="rgb({MathFloor(Color.R * 255)}, {MathFloor(Color.G * 255)}, {MathFloor(Color.B * 255)})">{Text}</font>`
    end

    Library.GetConfig = function(self)
        local Config = { }

        local Success, Result = Library:SafeCall(function()
            for Index, Value in Library.Flags do
                if type(Value) == "table" and Value.Key then
                    Config[Index] = {Key = tostring(Value.Key), Mode = Value.Mode}
                elseif type(Value) == "table" and Value.Color then
                    Config[Index] = {Color = "#" .. Value.HexValue, Alpha = Value.Alpha}
                else
                    Config[Index] = Value
                end
            end
        end)

        return HttpService:JSONEncode(Config)
    end

    Library.LoadConfig = function(self, Config)
        local Decoded = HttpService:JSONDecode(Config)

        local Success, Result = Library:SafeCall(function()
            for Index, Value in Decoded do
                local SetFunction = Library.SetFlags[Index]

                if not SetFunction then
                    continue
                end

                if type(Value) == "table" and Value.Key then
                    SetFunction(Value)
                elseif type(Value) == "table" and Value.Color then
                    SetFunction(Value.Color, Value.Alpha)
                else
                    SetFunction(Value)
                end
            end
        end)

        return Success, Result
    end

    Library.DeleteConfig = function(self, Config)
        if isfile(Library.Folders.Configs .. "/" .. Config) then
            delfile(Library.Folders.Configs .. "/" .. Config)
        end
    end

    Library.RefreshConfigsList = function(self, Element)
        local CurrentList = { }
        local List = { }

        local ConfigFolderName = StringGSub(Library.Folders.Configs, Library.Folders.Directory .. "/", "")

        for Index, Value in listfiles(Library.Folders.Configs) do
            local FileName = StringGSub(Value, Library.Folders.Directory .. "\\" .. ConfigFolderName .. "\\", "")
            List[Index] = FileName
        end

        local IsNew = #List ~= CurrentList

        if not IsNew then
            for Index = 1, #List do
                if List[Index] ~= CurrentList[Index] then
                    IsNew = true
                    break
                end
            end
        else
            CurrentList = List
            Element:Refresh(CurrentList)
        end
    end

    Library.ChangeItemTheme = function(self, Item, Properties)
        Item = Item.Instance or Item

        if not self.ThemeMap[Item] then
            return
        end

        self.ThemeMap[Item].Properties = Properties
        self.ThemeMap[Item] = self.ThemeMap[Item]
    end

    Library.ChangeTheme = function(self, Theme, Color)
        self.Theme[Theme] = Color

        for _, Item in self.ThemeItems do
            for Property, Value in Item.Properties do
                if type(Value) == "string" and Value == Theme then
                    Item.Item[Property] = Color
                elseif type(Value) == "function" then
                    Item.Item[Property] = Value()
                end
            end
        end
    end

    Library.IsMouseOverFrame = function(self, Frame)
        Frame = Frame.Instance

        local MousePosition = Vector2New(Mouse.X, Mouse.Y)

        return MousePosition.X >= Frame.AbsolutePosition.X and MousePosition.X <= Frame.AbsolutePosition.X + Frame.AbsoluteSize.X
        and MousePosition.Y >= Frame.AbsolutePosition.Y and MousePosition.Y <= Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y
    end

    Library.Lerp = function(self, Start, Finish, Time)
        return Start + (Finish - Start) * Time
    end

    Library.CompareVectors = function(self, PointA, PointB)
        return (PointA.X < PointB.X) or (PointA.Y < PointB.Y)
    end

    Library.IsClipped = function(self, Object, Column)
        local Parent = Column

        local BoundryTop = Parent.AbsolutePosition
        local BoundryBottom = BoundryTop + Parent.AbsoluteSize

        local Top = Object.AbsolutePosition
        local Bottom = Top + Object.AbsoluteSize

        return Library:CompareVectors(Top, BoundryTop) or Library:CompareVectors(BoundryBottom, Bottom)
    end

    do
        Library.CreateColorpicker = function(self, Data)
            local Colorpicker = {
                Hue = 0,
                Saturation = 0,
                Value = 0,
                Color = FromRGB(0, 0, 0),
                HexValue = "000000",
                Flag = Data.Flag,
                IsOpen = false
            }

            local Items = { } do
                Items["ColorpickerButton"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2New(0, 14, 0, 14),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(164, 229, 255)
                })

                Instances:Create("UIStroke", {
                    Parent = Items["ColorpickerButton"].Instance,
                    Name = "\0",
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Color = FromRGB(56, 62, 62),
                    Thickness = 1.5
                }):AddToTheme({Color = "Border 2"})

                Instances:Create("UICorner", {
                    Parent = Items["ColorpickerButton"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 4)
                })

                Items["ColorpickerWindow"] = Instances:Create("Frame", {
                    Parent = Library.UnusedHolder.Instance,
                    Name = "\0",
                    Visible = false,
                    Position = UDim2New(0, 115, 0, 102),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 183, 0, 201),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(16, 18, 18)
                })
                Items["ColorpickerWindow"]:AddToTheme({BackgroundColor3 = "Background"})

                Instances:Create("UICorner", {
                    Parent = Items["ColorpickerWindow"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 7)
                })

                Items["Inline"] = Instances:Create("Frame", {
                    Parent = Items["ColorpickerWindow"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 6, 0, 6),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, -12, 1, -12),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(21, 24, 24)
                })
                Items["Inline"]:AddToTheme({BackgroundColor3 = "Inline"})

                Instances:Create("UIStroke", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    Color = FromRGB(30, 33, 33),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Instances:Create("UICorner", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 7)
                })

                Items["Palette"] = Instances:Create("TextButton", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "-,",
                    AutoButtonColor = false,
                    Position = UDim2New(0, 6, 0, 6),
                    Size = UDim2New(1, -12, 1, -40),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(164, 229, 255)
                })

                Instances:Create("UICorner", {
                    Parent = Items["Palette"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 7)
                })

                Instances:Create("UIStroke", {
                    Parent = Items["Palette"].Instance,
                    Name = "\0",
                    Color = FromRGB(30, 33, 33),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Items["Saturation"] = Instances:Create("ImageLabel", {
                    Parent = Items["Palette"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Image = "rbxassetid://130624743341203",
                    BackgroundTransparency = 1,
                    Size = UDim2New(1, 0, 1, 0),
                    ZIndex = 2,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UICorner", {
                    Parent = Items["Saturation"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 7)
                })

                Items["Value"] = Instances:Create("ImageLabel", {
                    Parent = Items["Palette"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 2, 1, 0),
                    Image = "rbxassetid://96192970265863",
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, -1, 0, 0),
                    ZIndex = 3,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UICorner", {
                    Parent = Items["Value"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 7)
                })

                Items["PaletteDragger"] = Instances:Create("Frame", {
                    Parent = Items["Palette"].Instance,
                    Name = "\0",
                    Size = UDim2New(0, 3, 0, 3),
                    Position = UDim2New(0, 5, 0, 5),
                    BorderColor3 = FromRGB(0, 0, 0),
                    ZIndex = 3,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UICorner", {
                    Parent = Items["PaletteDragger"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(1, 0)
                })

                Instances:Create("UIStroke", {
                    Parent = Items["PaletteDragger"].Instance,
                    Name = "\0",
                    Color = FromRGB(120, 120, 120),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                })

                Items["Hue"] = Instances:Create("TextButton", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2New(0, 1),
                    Position = UDim2New(0, 6, 1, -6),
                    Size = UDim2New(1, -12, 0, 18),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UICorner", {
                    Parent = Items["Hue"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 7)
                })

                Instances:Create("UIStroke", {
                    Parent = Items["Hue"].Instance,
                    Name = "\0",
                    Color = FromRGB(30, 33, 33),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Instances:Create("UIGradient", {
                    Parent = Items["Hue"].Instance,
                    Name = "\0",
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 0, 0)), RGBSequenceKeypoint(0.17, FromRGB(255, 255, 0)), RGBSequenceKeypoint(0.33, FromRGB(0, 255, 0)), RGBSequenceKeypoint(0.5, FromRGB(0, 255, 255)), RGBSequenceKeypoint(0.67, FromRGB(0, 0, 255)), RGBSequenceKeypoint(0.83, FromRGB(255, 0, 255)), RGBSequenceKeypoint(1, FromRGB(255, 0, 0))}
                })

                Items["HueDragger"] = Instances:Create("Frame", {
                    Parent = Items["Hue"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 2, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIStroke", {
                    Parent = Items["HueDragger"].Instance,
                    Name = "\0",
                    Color = FromRGB(30, 33, 33),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})
            end

            local Debounce = false
            local RenderStepped

            function Colorpicker:Get()
                return Colorpicker.Color
            end

            function Colorpicker:SetVisibility(Bool)
                Items["ColorpickerButton"].Instance.Visible = Bool
            end

            function Colorpicker:SetOpen(Bool)
                if Debounce then
                    return
                end

                Colorpicker.IsOpen = Bool
                Debounce = true

                if Colorpicker.IsOpen then
                    Items["ColorpickerWindow"].Instance.Visible = true
                    Items["ColorpickerWindow"].Instance.Parent = Library.Holder.Instance

                    RenderStepped = RunService.RenderStepped:Connect(function()
                        Items["ColorpickerWindow"].Instance.Position = UDim2New(0, Items["ColorpickerButton"].Instance.AbsolutePosition.X + 18, 0, Items["ColorpickerButton"].Instance.AbsolutePosition.Y - 25)
                    end)

                    for Index, Value in Library.OpenFrames do
                        if not Data.Section.IsSettings then
                            Value:SetOpen(false)
                        end
                    end

                    Library.OpenFrames[Colorpicker] = Colorpicker
                else
                    if Library.OpenFrames[Colorpicker] then
                        Library.OpenFrames[Colorpicker] = nil
                    end

                    if RenderStepped then
                        RenderStepped:Disconnect()
                        RenderStepped = nil
                    end
                end

                local Descendants = Items["ColorpickerWindow"].Instance:GetDescendants()
                TableInsert(Descendants, Items["ColorpickerWindow"].Instance)

                local NewTween

                for Index, Value in Descendants do
                    local TransparencyProperty = Tween:GetProperty(Value)

                    if not TransparencyProperty then
                        continue
                    end

                    if not Value.ClassName:find("UI") then
                        Value.ZIndex = Colorpicker.IsOpen and 4 or 1
                    end

                    if type(TransparencyProperty) == "table" then
                        for _, Property in TransparencyProperty do
                            NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                        end
                    else
                        NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                    end
                end

                NewTween.Tween.Completed:Connect(function()
                    Debounce = false
                    Items["ColorpickerWindow"].Instance.Visible = Colorpicker.IsOpen
                    task.wait(0.2)
                    Items["ColorpickerWindow"].Instance.Parent = not Colorpicker.IsOpen and Library.UnusedHolder.Instance or Library.Holder.Instance
                end)
            end

            function Colorpicker:Update()
                local Hue, Saturation, Value = Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value
                Colorpicker.Color = FromHSV(Hue, Saturation, Value)
                Colorpicker.HexValue = Colorpicker.Color:ToHex()

                Library.Flags[Colorpicker.Flag] = {
                    Color = Colorpicker.Color,
                    HexValue = Colorpicker.HexValue,
                }

                Items["ColorpickerButton"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})
                Items["Palette"]:Tween(nil, {BackgroundColor3 = FromHSV(Hue, 1, 1)})

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Colorpicker.Color, Colorpicker.Alpha)
                end
            end

            local SlidingPalette = false
            local PaletteChanged

            function Colorpicker:SlidePalette(Input)
                if not Input or not SlidingPalette then
                    return
                end

                local ValueX = MathClamp(1 - (Input.Position.X - Items["Palette"].Instance.AbsolutePosition.X) / Items["Palette"].Instance.AbsoluteSize.X, 0, 1)
                local ValueY = MathClamp(1 - (Input.Position.Y - Items["Palette"].Instance.AbsolutePosition.Y) / Items["Palette"].Instance.AbsoluteSize.Y, 0, 1)

                Colorpicker.Saturation = ValueX
                Colorpicker.Value = ValueY

                local SlideX = MathClamp((Input.Position.X - Items["Palette"].Instance.AbsolutePosition.X) / Items["Palette"].Instance.AbsoluteSize.X, 0, 0.98)
                local SlideY = MathClamp((Input.Position.Y - Items["Palette"].Instance.AbsolutePosition.Y) / Items["Palette"].Instance.AbsoluteSize.Y, 0, 0.98)

                Items["PaletteDragger"]:Tween(TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(SlideX, 0, SlideY, 0)})
                Colorpicker:Update()
            end

            local SlidingHue = false
            local HueChanged

            function Colorpicker:SlideHue(Input)
                if not Input or not SlidingHue then
                    return
                end

                local ValueX = MathClamp((Input.Position.X - Items["Hue"].Instance.AbsolutePosition.X) / Items["Hue"].Instance.AbsoluteSize.X, 0, 1)

                Colorpicker.Hue = ValueX

                local SlideX = MathClamp((Input.Position.X - Items["Hue"].Instance.AbsolutePosition.X) / Items["Hue"].Instance.AbsoluteSize.X, 0, 0.995)

                Items["HueDragger"]:Tween(TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(SlideX, 0, 0, 0)})
                Colorpicker:Update()
            end

            function Colorpicker:Set(Color, Alpha)
                if type(Color) == "table" then
                    Color = FromRGB(Color[1], Color[2], Color[3])
                    Alpha = Color[4]
                elseif type(Color) == "string" then
                    Color = FromHex(Color)
                end

                Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value = Color:ToHSV()
                Colorpicker.Alpha = Alpha or 0

                local PaletteValueX = MathClamp(1 - Colorpicker.Saturation, 0, 0.98)
                local PaletteValueY = MathClamp(1 - Colorpicker.Value, 0, 0.98)

                local HuePositionX = MathClamp(Colorpicker.Hue, 0, 0.99)

                Items["PaletteDragger"]:Tween(TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(PaletteValueX, 0, PaletteValueY, 0)})
                Items["HueDragger"]:Tween(TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(HuePositionX, 0, 0, 0)})
                Colorpicker:Update()
            end

            Items["ColorpickerButton"]:Connect("MouseButton1Down", function()
                Colorpicker:SetOpen(not Colorpicker.IsOpen)
            end)

            Items["Palette"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    SlidingPalette = true

                    Colorpicker:SlidePalette(Input)

                    if PaletteChanged then
                        return
                    end

                    PaletteChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            SlidingPalette = false

                            PaletteChanged:Disconnect()
                            PaletteChanged = nil
                        end
                    end)
                end
            end)

            Items["Hue"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    SlidingHue = true

                    Colorpicker:SlideHue(Input)

                    if HueChanged then
                        return
                    end

                    HueChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            SlidingHue = false

                            HueChanged:Disconnect()
                            HueChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputBegan, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if Colorpicker.IsOpen then
                        if Library:IsMouseOverFrame(Items["ColorpickerWindow"]) then
                            return
                        end

                        Colorpicker:SetOpen(false)
                    end
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if SlidingPalette then
                        Colorpicker:SlidePalette(Input)
                    end

                    if SlidingHue then
                        Colorpicker:SlideHue(Input)
                    end
                end
            end)

            Items["ColorpickerButton"]:Connect("Changed", function(Property)
                if Property == "AbsolutePosition" and Colorpicker.IsOpen then
                    Colorpicker.IsOpen = not Library:IsClipped(Items["ColorpickerButton"].Instance, Data.Section.Items["Section"].Instance.Parent)
                    Items["ColorpickerWindow"].Instance.Visible = Colorpicker.IsOpen
                end
            end)

            if Data.Default then
                Colorpicker:Set(Data.Default)
            end

            Library.SetFlags[Colorpicker.Flag] = function(Color, Alpha)
                Colorpicker:Set(Color, Alpha)
            end

            return Colorpicker, Items
        end

        Library.CreateKeybind = function(self, Data)
            local Keybind = {
                Flag = Data.Flag,
                Key = "",
                Value = "",
                Mode = "",
                Toggled = false,
                Picking = false,
                IsOpen = false
            }

            local Items = { } do
                Items["KeyButton"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(100, 100, 100),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "-",
                    AutoButtonColor = false,
                    Size = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 12,
                    BackgroundColor3 = FromRGB(30, 34, 34)
                })
                Items["KeyButton"]:AddToTheme({BackgroundColor3 = "Element"})

                Instances:Create("UICorner", {
                    Parent = Items["KeyButton"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 4)
                })

                Instances:Create("UIPadding", {
                    Parent = Items["KeyButton"].Instance,
                    Name = "\0",
                    PaddingRight = UDimNew(0, 4),
                    PaddingLeft = UDimNew(0, 5)
                })

                Items["KeybindWindow"] = Instances:Create("Frame", {
                    Parent = Library.UnusedHolder.Instance,
                    Name = "\0",
                    Visible = false,
                    Position = UDim2New(0, 231, 0, 102),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 67, 0, 92),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(16, 18, 18)
                })
                Items["KeybindWindow"]:AddToTheme({BackgroundColor3 = "Background"})

                Instances:Create("UICorner", {
                    Parent = Items["KeybindWindow"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 7)
                })

                Items["Inline"] = Instances:Create("Frame", {
                    Parent = Items["KeybindWindow"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 6, 0, 6),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, -12, 1, -12),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(21, 24, 24)
                })
                Items["Inline"]:AddToTheme({BackgroundColor3 = "Inline"})

                Instances:Create("UIStroke", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    Color = FromRGB(30, 33, 33),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Instances:Create("UICorner", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 7)
                })

                Items["Toggle"] = Instances:Create("TextButton", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(255, 255, 255),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "Toggle",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2New(1, 0, 0, 20),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIListLayout", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    Padding = UDimNew(0, 5),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Instances:Create("UIPadding", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    PaddingTop = UDimNew(0, 4)
                })

                Items["Hold"] = Instances:Create("TextButton", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(100, 100, 100),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "Hold",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2New(1, 0, 0, 20),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["Always"] = Instances:Create("TextButton", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(100, 100, 100),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "Always",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2New(1, 0, 0, 20),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })
            end

            local Modes = {
                ["Always"] = Items["Always"],
                ["Hold"] = Items["Hold"],
                ["Toggle"] = Items["Toggle"]
            }

            local Debounce = false

            function Keybind:Get()
                return Keybind.Value
            end

            function Keybind:SetVisibility(Bool)
                Items["KeyButton"].Instance.Visible = Bool
            end

            function Keybind:SetOpen(Bool)
                if Debounce then
                    return
                end

                Keybind.IsOpen = Bool
                Debounce = true

                if Keybind.IsOpen then
                    Items["KeybindWindow"].Instance.Visible = true
                    Items["KeybindWindow"].Instance.Parent = Library.Holder.Instance

                    for Index, Value in Library.OpenFrames do
                        if not Data.Section.IsSettings then
                            Value:SetOpen(false)
                        end
                    end

                    Library.OpenFrames[Keybind] = Keybind
                else
                    if Library.OpenFrames[Keybind] then
                        Library.OpenFrames[Keybind] = nil
                    end
                end

                local Descendants = Items["KeybindWindow"].Instance:GetDescendants()
                TableInsert(Descendants, Items["KeybindWindow"].Instance)

                local NewTween

                for Index, Value in Descendants do
                    local TransparencyProperty = Tween:GetProperty(Value)

                    if not TransparencyProperty then
                        continue
                    end

                    if not Value.ClassName:find("UI") then
                        Value.ZIndex = Keybind.IsOpen and 4 or 1
                    end

                    if type(TransparencyProperty) == "table" then
                        for _, Property in TransparencyProperty do
                            NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                        end
                    else
                        NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                    end
                end

                NewTween.Tween.Completed:Connect(function()
                    Debounce = false
                    Items["KeybindWindow"].Instance.Visible = Keybind.IsOpen
                    task.wait(0.2)
                    Items["KeybindWindow"].Instance.Parent = not Keybind.IsOpen and Library.UnusedHolder.Instance or Library.Holder.Instance
                end)
            end

            function Keybind:Update()
                if Keybind.Value then
                    Items["KeyButton"].Instance.Text = Keys[StringSub(tostring(Keybind.Value), StringFind(tostring(Keybind.Value), ".") + 1)] or StringSub(tostring(Keybind.Value), StringFind(tostring(Keybind.Value), ".") + 1)
                    Items["KeyButton"].Instance.TextColor3 = FromRGB(255, 255, 255)
                else
                    Items["KeyButton"].Instance.Text = "-"
                    Items["KeyButton"].Instance.TextColor3 = FromRGB(100, 100, 100)
                end

                Library.Flags[Keybind.Flag] = {
                    Key = Keybind.Value,
                    Mode = Keybind.Mode
                }
            end

            function Keybind:Set(Key, Mode)
                Keybind.Value = Key
                Keybind.Mode = Mode or "Toggle"

                for Index, Value in Modes do
                    Value.TextColor3 = Index == Keybind.Mode and FromRGB(255, 255, 255) or FromRGB(100, 100, 100)
                end

                Keybind:Update()

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Keybind.Value, Keybind.Mode)
                end
            end

            local function HandleKeybindInput(Input)
                if Keybind.Picking then
                    Keybind.Value = Input.KeyCode
                    Keybind:SetOpen(false)
                    Keybind.Picking = false
                end
            end

            Items["KeyButton"]:Connect("MouseButton1Down", function()
                if Keybind.Picking then
                    Keybind.Picking = false
                    Items["KeyButton"].Instance.Text = "-"
                    Items["KeyButton"].Instance.TextColor3 = FromRGB(100, 100, 100)
                    return
                end

                Keybind.Picking = true
                Keybind:SetOpen(true)
            end)

            for Index, Value in Modes do
                local ModeConnection

                local function HandleModeSelection(ModeName)
                    Keybind.Mode = ModeName

                    for ModeKey, ModeButton in Modes do
                        ModeButton.TextColor3 = ModeKey == ModeName and FromRGB(255, 255, 255) or FromRGB(100, 100, 100)
                    end

                    Library.Flags[Keybind.Flag] = {
                        Key = Keybind.Value,
                        Mode = Keybind.Mode
                    }

                    if Data.Callback then
                        Library:SafeCall(Data.Callback, Keybind.Value, Keybind.Mode)
                    end
                end

                Value:Connect("MouseButton1Down", function()
                    HandleModeSelection(Index)
                end)
            end

            Library:Connect(UserInputService.InputBegan, function(Input)
                if Keybind.Picking and Input.UserInputType == Enum.UserInputType.Keyboard then
                    HandleKeybindInput(Input)
                    return
                end

                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if Keybind.IsOpen then
                        if Library:IsMouseOverFrame(Items["KeybindWindow"]) or Library:IsMouseOverFrame(Items["KeyButton"]) then
                            return
                        end

                        Keybind:SetOpen(false)
                    end
                end
            end)

            if Data.Default then
                Keybind:Set(Data.Default, Data.Mode or "Toggle")
            end

            Library.SetFlags[Keybind.Flag] = function(Value, Mode)
                if type(Value) == "table" then
                    Keybind:Set(Value.Key, Value.Mode)
                else
                    Keybind:Set(Value, Mode)
                end
            end

            return Keybind, Items
        end

        Library.CreateToggle = function(self, Data)
            local Toggle = {
                Flag = Data.Flag,
                State = false,
                Toggled = false,
                IsOpen = false
            }

            local Items = { } do
                Items["ToggleButton"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2New(0, 14, 0, 14),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(164, 229, 255)
                })

                Instances:Create("UIStroke", {
                    Parent = Items["ToggleButton"].Instance,
                    Name = "\0",
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Color = FromRGB(56, 62, 62),
                    Thickness = 1.5
                }):AddToTheme({Color = "Border 2"})

                Instances:Create("UICorner", {
                    Parent = Items["ToggleButton"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 4)
                })

                Items["ToggleCheckmark"] = Instances:Create("ImageLabel", {
                    Parent = Items["ToggleButton"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Image = "rbxassetid://15400928",
                    BackgroundTransparency = 1,
                    Size = UDim2New(1, 0, 1, 0),
                    ZIndex = 2,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })
            end

            local Debounce = false

            function Toggle:Get()
                return Toggle.State
            end

            function Toggle:SetVisibility(Bool)
                Items["ToggleButton"].Instance.Visible = Bool
            end

            function Toggle:SetState(Bool)
                if Debounce then
                    return
                end

                Toggle.State = Bool

                local Color = Bool and FromRGB(85, 255, 127) or FromRGB(255, 85, 85)
                Items["ToggleButton"]:Tween(nil, {BackgroundColor3 = Color})
            end

            function Toggle:Update()
                Toggle:SetState(not Toggle.State)

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Toggle.State)
                end
            end

            function Toggle:Set(ToggleState)
                Toggle:SetState(ToggleState or false)

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Toggle.State)
                end
            end

            Items["ToggleButton"]:Connect("MouseButton1Down", function()
                Toggle:Update()
            end)

            if Data.Default then
                Toggle:Set(Data.Default)
            end

            Library.Flags[Toggle.Flag] = Toggle.State

            Library.SetFlags[Toggle.Flag] = function(Value)
                Toggle:Set(Value)
            end

            return Toggle, Items
        end

        Library.CreateSlider = function(self, Data)
            local Slider = {
                Flag = Data.Flag,
                Min = Data.Min or 0,
                Max = Data.Max or 100,
                Default = Data.Default or (Data.Min or 0),
                Decimals = Data.Decimals or 0,
                Value = Data.Default or (Data.Min or 0),
                IsOpen = false,
                Dragging = false
            }

            local Items = { } do
                Items["SliderBox"] = Instances:Create("Frame", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 0, 0, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(30, 34, 34)
                })
                Items["SliderBox"]:AddToTheme({BackgroundColor3 = "Element"})

                Instances:Create("UICorner", {
                    Parent = Items["SliderBox"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 4)
                })

                Instances:Create("UIPadding", {
                    Parent = Items["SliderBox"].Instance,
                    Name = "\0",
                    PaddingRight = UDimNew(0, 4),
                    PaddingLeft = UDimNew(0, 5)
                })

                Items["SliderText"] = Instances:Create("TextLabel", {
                    Parent = Items["SliderBox"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(100, 100, 100),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = tostring(Slider.Value),
                    TextXAlignment = Enum.TextXAlignment.Right,
                    Size = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 12,
                    BackgroundColor3 = FromRGB(30, 34, 34),
                    BackgroundTransparency = 1
                })

                Items["SliderButton"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2New(1, 0, 0, 8),
                    Position = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(40, 44, 44)
                })

                Instances:Create("UICorner", {
                    Parent = Items["SliderButton"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 4)
                })

                Items["SliderFill"] = Instances:Create("Frame", {
                    Parent = Items["SliderButton"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UICorner", {
                    Parent = Items["SliderFill"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 4)
                })

                Items["SliderDragger"] = Instances:Create("Frame", {
                    Parent = Items["SliderFill"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 3, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UICorner", {
                    Parent = Items["SliderDragger"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(1, 0)
                })

                Items["SliderBox"].Instance.AutomaticSize = Enum.AutomaticSize.X

                local SliderInput
                local DragStart
                local StartWidth

                local function UpdateSlider(Input)
                    local SliderBounds = Items["SliderButton"].Instance.AbsoluteSize.X
                    local Position = Input.Position.X - Items["SliderButton"].Instance.AbsolutePosition.X

                    local NewWidth = MathClamp(Position / SliderBounds, 0, 1)
                    local NewValue = Library:Round(Library:Lerp(Slider.Min, Slider.Max, NewWidth), Slider.Decimals)

                    Slider.Value = NewValue

                    if Data.Suffix then
                        Items["SliderText"].Instance.Text = tostring(NewValue) .. Data.Suffix
                    else
                        Items["SliderText"].Instance.Text = tostring(NewValue)
                    end

                    Items["SliderFill"]:Tween(TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2New(NewWidth, 0, 1, 0)
                    })
                end

                Items["SliderButton"]:Connect("InputBegan", function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        Slider.Dragging = true

                        UpdateSlider(Input)

                        if SliderInput then
                            return
                        end

                        SliderInput = Input.Changed:Connect(function()
                            if Input.UserInputState == Enum.UserInputState.End then
                                Slider.Dragging = false
                                SliderInput:Disconnect()
                                SliderInput = nil
                            end
                        end)
                    end
                end)

                Library:Connect(UserInputService.InputChanged, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                        if Slider.Dragging then
                            UpdateSlider(Input)
                        end
                    end
                end)

                local SliderChanged
                Items["SliderButton"]:Connect("MouseButton1Down", function()
                    if SliderChanged then
                        return
                    end

                    SliderChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            SliderChanged:Disconnect()
                            SliderChanged = nil
                        end
                    end)
                end)
            end

            function Slider:Get()
                return Slider.Value
            end

            function Slider:SetVisibility(Bool)
                Items["SliderButton"].Instance.Visible = Bool
                Items["SliderBox"].Instance.Visible = Bool
            end

            function Slider:Update()
                local Value = Slider.Value

                if Data.Suffix then
                    Items["SliderText"].Instance.Text = tostring(Value) .. Data.Suffix
                else
                    Items["SliderText"].Instance.Text = tostring(Value)
                end

                local Percentage = (Value - Slider.Min) / (Slider.Max - Slider.Min)
                Items["SliderFill"]:Tween(TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2New(Percentage, 0, 1, 0)
                })

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Value)
                end
            end

            function Slider:Set(Value)
                Value = MathClamp(Value, Slider.Min, Slider.Max)
                Slider.Value = Library:Round(Value, Slider.Decimals)

                local Percentage = (Slider.Value - Slider.Min) / (Slider.Max - Slider.Min)
                Items["SliderFill"]:Tween(TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2New(Percentage, 0, 1, 0)
                })

                if Data.Suffix then
                    Items["SliderText"].Instance.Text = tostring(Slider.Value) .. Data.Suffix
                else
                    Items["SliderText"].Instance.Text = tostring(Slider.Value)
                end

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Slider.Value)
                end
            end

            local InitialValue = Data.Default or Slider.Min
            Slider.Value = Library:Round(InitialValue, Slider.Decimals)

            local Percentage = (Slider.Value - Slider.Min) / (Slider.Max - Slider.Min)
            Items["SliderFill"].Instance.Size = UDim2New(Percentage, 0, 1, 0)

            if Data.Suffix then
                Items["SliderText"].Instance.Text = tostring(Slider.Value) .. Data.Suffix
            else
                Items["SliderText"].Instance.Text = tostring(Slider.Value)
            end

            if Data.Callback then
                Library:SafeCall(Data.Callback, Slider.Value)
            end

            Library.Flags[Slider.Flag] = Slider.Value

            Library.SetFlags[Slider.Flag] = function(Value)
                Slider:Set(Value)
            end

            return Slider, Items
        end

        Library.CreateDropdown = function(self, Data)
            local Dropdown = {
                Flag = Data.Flag,
                Items = Data.Items or {},
                Default = Data.Default,
                Selected = nil,
                Multi = Data.Multi or false,
                Open = false,
                IsOpen = false
            }

            local Items = { } do
                Items["DropdownBox"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(100, 100, 100),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "-",
                    AutoButtonColor = false,
                    Size = UDim2New(1, 0, 0, 18),
                    Position = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    TextSize = 12,
                    BackgroundColor3 = FromRGB(30, 34, 34),
                    TextXAlignment = Enum.TextXAlignment.Left
                })
                Items["DropdownBox"]:AddToTheme({BackgroundColor3 = "Element"})

                Instances:Create("UICorner", {
                    Parent = Items["DropdownBox"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 4)
                })

                Instances:Create("UIPadding", {
                    Parent = Items["DropdownBox"].Instance,
                    Name = "\0",
                    PaddingLeft = UDimNew(0, 5)
                })

                Items["DropdownArrow"] = Instances:Create("ImageLabel", {
                    Parent = Items["DropdownBox"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Image = "rbxassetid://15400907",
                    BackgroundTransparency = 1,
                    Size = UDim2New(0, 14, 0, 14),
                    AnchorPoint = Vector2New(0, 0.5),
                    Position = UDim2New(1, -4, 0.5, 0),
                    ZIndex = 2,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["DropdownWindow"] = Instances:Create("Frame", {
                    Parent = Library.UnusedHolder.Instance,
                    Name = "\0",
                    Visible = false,
                    Position = UDim2New(0, 0, 0, 20),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 0, 0),
                    ClipsDescendants = true,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(21, 24, 24)
                })
                Items["DropdownWindow"]:AddToTheme({BackgroundColor3 = "Inline"})

                Instances:Create("UIStroke", {
                    Parent = Items["DropdownWindow"].Instance,
                    Name = "\0",
                    Color = FromRGB(30, 33, 33),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Instances:Create("UICorner", {
                    Parent = Items["DropdownWindow"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 7)
                })

                Items["DropdownList"] = Instances:Create("ScrollingFrame", {
                    Parent = Items["DropdownWindow"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ScrollBarImageColor3 = FromRGB(255, 255, 255),
                    ScrollBarImageTransparency = 1,
                    ScrollBarThickness = 0,
                    ZIndex = 2,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    CanvasSize = UDim2New(0, 0, 0, 0)
                })

                Instances:Create("UIListLayout", {
                    Parent = Items["DropdownList"].Instance,
                    Name = "\0",
                    Padding = UDimNew(0, 2),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Instances:Create("UIPadding", {
                    Parent = Items["DropdownList"].Instance,
                    Name = "\0",
                    PaddingTop = UDimNew(0, 6),
                    PaddingBottom = UDimNew(0, 6),
                    PaddingRight = UDimNew(0, 4),
                    PaddingLeft = UDimNew(0, 4)
                })
            end

            function Dropdown:Refresh(NewItems)
                if not NewItems then
                    return
                end

                Dropdown.Items = NewItems

                for _, Child in Items["DropdownList"].Instance:GetChildren() do
                    if Child:IsA("TextButton") then
                        Child:Destroy()
                    end
                end

                for Index, Item in Dropdown.Items do
                    local DropdownItem = Instances:Create("TextButton", {
                        Parent = Items["DropdownList"].Instance,
                        Name = Index,
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(100, 100, 100),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Item,
                        AutoButtonColor = false,
                        Size = UDim2New(1, 0, 0, 20),
                        BorderSizePixel = 0,
                        TextSize = 12,
                        BackgroundTransparency = 1,
                        BackgroundColor3 = FromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left
                    })

                    Instances:Create("UIPadding", {
                        Parent = DropdownItem.Instance,
                        Name = "\0",
                        PaddingLeft = UDimNew(0, 5)
                    })

                    local ItemToggle = false

                    local function UpdateItemState()
                        if Dropdown.Multi then
                            ItemToggle = not ItemToggle
                            DropdownItem.TextColor3 = ItemToggle and FromRGB(255, 255, 255) or FromRGB(100, 100, 100)
                        else
                            Dropdown.Selected = Item
                            Items["DropdownBox"].Instance.Text = Item
                            Items["DropdownBox"].Instance.TextColor3 = FromRGB(255, 255, 255)
                            Dropdown:SetOpen(false)
                        end

                        if Data.Callback then
                            if Dropdown.Multi then
                                local Selected = {}
                                for _, child in Items["DropdownList"].Instance:GetChildren() do
                                    if child:IsA("TextButton") and child.TextColor3 == FromRGB(255, 255, 255) then
                                        TableInsert(Selected, child.Text)
                                    end
                                end
                                Library:SafeCall(Data.Callback, Selected)
                            else
                                Library:SafeCall(Data.Callback, Item)
                            end
                        end
                    end

                    DropdownItem:Connect("MouseButton1Down", UpdateItemState)
                end
            end

            function Dropdown:Get()
                return Dropdown.Selected
            end

            function Dropdown:SetVisibility(Bool)
                Items["DropdownBox"].Instance.Visible = Bool
            end

            function Dropdown:SetOpen(Bool)
                if Bool then
                    Items["DropdownWindow"].Instance.Visible = true
                    Items["DropdownWindow"].Instance.Parent = Library.Holder.Instance
                    Items["DropdownArrow"]:Tween(TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 180})

                    for Index, Value in Library.OpenFrames do
                        if not Data.Section.IsSettings then
                            Value:SetOpen(false)
                        end
                    end

                    Library.OpenFrames[Dropdown] = Dropdown
                    Dropdown.Open = true
                    Dropdown.IsOpen = true
                else
                    Items["DropdownWindow"].Instance.Visible = false
                    Items["DropdownArrow"]:Tween(TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0})

                    if Library.OpenFrames[Dropdown] then
                        Library.OpenFrames[Dropdown] = nil
                    end

                    task.wait(0.2)
                    Items["DropdownWindow"].Instance.Parent = Library.UnusedHolder.Instance
                    Dropdown.Open = false
                    Dropdown.IsOpen = false
                end
            end

            function Dropdown:Update()
                if Data.Callback then
                    Library:SafeCall(Data.Callback, Dropdown.Selected)
                end
            end

            function Dropdown:Select(Item)
                Dropdown.Selected = Item
                Items["DropdownBox"].Instance.Text = Item
                Items["DropdownBox"].Instance.TextColor3 = FromRGB(255, 255, 255)
                Dropdown:Update()
            end

            Items["DropdownBox"]:Connect("MouseButton1Down", function()
                Dropdown:SetOpen(not Dropdown.Open)
            end)

            Library:Connect(UserInputService.InputBegan, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if Dropdown.IsOpen then
                        if Library:IsMouseOverFrame(Items["DropdownWindow"]) or Library:IsMouseOverFrame(Items["DropdownBox"]) then
                            return
                        end

                        Dropdown:SetOpen(false)
                    end
                end
            end)

            if Data.Default then
                Dropdown.Selected = Data.Default
                Items["DropdownBox"].Instance.Text = Data.Default
                Items["DropdownBox"].Instance.TextColor3 = FromRGB(255, 255, 255)
            end

            Dropdown:Refresh(Dropdown.Items)

            Library.Flags[Dropdown.Flag] = Dropdown.Selected

            Library.SetFlags[Dropdown.Flag] = function(Value)
                Dropdown:Select(Value)
            end

            return Dropdown, Items
        end

        Library.CreateTextbox = function(self, Data)
            local Textbox = {
                Flag = Data.Flag,
                Value = Data.Default or "",
                Focused = false,
                IsOpen = false
            }

            local Items = { } do
                Items["TextboxButton"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(100, 100, 100),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Placeholder or "...",
                    AutoButtonColor = false,
                    Size = UDim2New(1, 0, 0, 18),
                    Position = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    TextSize = 12,
                    BackgroundColor3 = FromRGB(30, 34, 34),
                    TextXAlignment = Enum.TextXAlignment.Left
                })
                Items["TextboxButton"]:AddToTheme({BackgroundColor3 = "Element"})

                Instances:Create("UICorner", {
                    Parent = Items["TextboxButton"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 4)
                })

                Instances:Create("UIPadding", {
                    Parent = Items["TextboxButton"].Instance,
                    Name = "\0",
                    PaddingLeft = UDimNew(0, 5)
                })

                Items["TextboxInput"] = Instances:Create("TextBox", {
                    Parent = Items["TextboxButton"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(255, 255, 255),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Default or "",
                    Size = UDim2New(1, -10, 1, 0),
                    Position = UDim2New(0, 5, 0, 0),
                    BorderSizePixel = 0,
                    TextSize = 12,
                    BackgroundTransparency = 1,
                    ClearTextOnFocus = false
                })
            end

            function Textbox:Get()
                return Textbox.Value
            end

            function Textbox:SetVisibility(Bool)
                Items["TextboxButton"].Instance.Visible = Bool
            end

            function Textbox:Update()
                local Text = Items["TextboxInput"].Instance.Text

                if Data.Numeric then
                    Text = Text:gsub("%D", "")
                end

                Textbox.Value = Text
                Library.Flags[Textbox.Flag] = Textbox.Value

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Textbox.Value)
                end
            end

            Items["TextboxInput"]:Connect("Focused", function()
                Textbox.Focused = true
            end)

            Items["TextboxInput"]:Connect("FocusLost", function(Entered)
                Textbox.Focused = false

                if Items["TextboxInput"].Instance.Text == "" and Data.Placeholder then
                    Items["TextboxInput"].Instance.Text = ""
                    Items["TextboxButton"].Instance.Text = Data.Placeholder
                    Items["TextboxButton"].Instance.TextColor3 = FromRGB(100, 100, 100)
                end

                if Data.Callback and Data.Finished then
                    Library:SafeCall(Data.Callback, Textbox.Value)
                end
            end)

            Items["TextboxInput"]:Connect("Changed", function(Property)
                if Property == "Text" and not Textbox.Focused then
                    return
                end

                if Data.Numeric then
                    local CursorPosition = Items["TextboxInput"].Instance.CursorPosition
                    Items["TextboxInput"].Instance.Text = Items["TextboxInput"].Instance.Text:gsub("%D", "")

                    if Items["TextboxInput"].Instance.Text == "" then
                        Textbox.Value = ""
                    else
                        Textbox.Value = tonumber(Items["TextboxInput"].Instance.Text) or ""
                    end

                    Library.Flags[Textbox.Flag] = Textbox.Value

                    if CursorPosition then
                        Items["TextboxInput"].Instance.CursorPosition = math.min(CursorPosition, #Items["TextboxInput"].Instance.Text + 1)
                    end
                end

                if not Data.Finished and Data.Callback then
                    Textbox:Update()
                end

                Items["TextboxButton"].Instance.Text = ""
                Items["TextboxButton"].Instance.TextColor3 = FromRGB(255, 255, 255)
            end)

            if Data.Default then
                Textbox.Value = Data.Default
                Items["TextboxInput"].Instance.Text = Data.Default
                Items["TextboxButton"].Instance.Text = ""
                Items["TextboxButton"].Instance.TextColor3 = FromRGB(255, 255, 255)
            end

            Library.Flags[Textbox.Flag] = Textbox.Value

            Library.SetFlags[Textbox.Flag] = function(Value)
                Textbox.Value = Value
                Items["TextboxInput"].Instance.Text = Value
                Items["TextboxButton"].Instance.Text = ""
                Items["TextboxButton"].Instance.TextColor3 = FromRGB(255, 255, 255)
            end

            return Textbox, Items
        end

        Library.CreateLabel = function(self, Data)
            local Items = { } do
                Items["Label"] = Instances:Create("TextLabel", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(255, 255, 255),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Name or "",
                    AutoButtonColor = false,
                    Size = UDim2New(0, 0, 0, 18),
                    Position = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    TextSize = 12,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = FromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.X
                })
            end

            function Items["Label"]:SetVisibility(Bool)
                Items["Label"].Instance.Visible = Bool
            end

            return Items, Items["Label"]
        end

        Library.CreateButton = function(self, Data)
            local Items = { } do
                Items["Button"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(255, 255, 255),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Name or "",
                    AutoButtonColor = false,
                    Size = UDim2New(1, 0, 0, 18),
                    Position = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    TextSize = 12,
                    BackgroundColor3 = FromRGB(30, 34, 34)
                })
                Items["Button"]:AddToTheme({BackgroundColor3 = "Element"})

                Instances:Create("UICorner", {
                    Parent = Items["Button"].Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 4)
                })

                Instances:Create("UIPadding", {
                    Parent = Items["Button"].Instance,
                    Name = "\0",
                    PaddingLeft = UDimNew(0, 5)
                })
            end

            function Items["Button"]:SetVisibility(Bool)
                Items["Button"].Instance.Visible = Bool
            end

            if Data.Callback then
                Items["Button"]:Connect("MouseButton1Down", Data.Callback)
            end

            return Items, Items["Button"]
        end

        local ItemHandlers = {
            ["Toggle"] = Library.CreateToggle,
            ["Slider"] = Library.CreateSlider,
            ["Dropdown"] = Library.CreateDropdown,
            ["Textbox"] = Library.CreateTextbox,
            ["Label"] = Library.CreateLabel,
            ["Button"] = Library.CreateButton,
            ["Keybind"] = Library.CreateKeybind,
            ["Colorpicker"] = Library.CreateColorpicker
        }

        ItemHandlers["Toggle"].__index = ItemHandlers["Toggle"]
        ItemHandlers["Slider"].__index = ItemHandlers["Slider"]
        ItemHandlers["Dropdown"].__index = ItemHandlers["Dropdown"]
        ItemHandlers["Textbox"].__index = ItemHandlers["Textbox"]
        ItemHandlers["Label"].__index = ItemHandlers["Label"]
        ItemHandlers["Button"].__index = ItemHandlers["Button"]
        ItemHandlers["Keybind"].__index = ItemHandlers["Keybind"]
        ItemHandlers["Colorpicker"].__index = ItemHandlers["Colorpicker"]

        do
            local Section = { } do
                Section.__index = Section

                function Section:Section(Data)
                    local Items = { }

                    local SectionFrame = Instances:Create("Frame", {
                        Parent = self.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 0),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        AutomaticSize = Enum.AutomaticSize.Y
                    })

                    Items["Section"] = SectionFrame

                    Instances:Create("UIListLayout", {
                        Parent = SectionFrame.Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 6),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Instances:Create("UIPadding", {
                        Parent = SectionFrame.Instance,
                        Name = "\0",
                        PaddingTop = UDimNew(0, 6),
                        PaddingBottom = UDimNew(0, 6),
                        PaddingRight = UDimNew(0, 6),
                        PaddingLeft = UDimNew(0, 6)
                    })

                    local SectionItems = {
                        Items = Items,
                        Name = Data.Name,
                        Parent = self,
                        IsSettings = Data.IsSettings or false
                    }

                    setmetatable(SectionItems, Section)
                    TableInsert(Library.Sections, SectionItems)

                    return SectionItems
                end

                for Name, Handler in ItemHandlers do
                    Section[Name] = function(self, Data)
                        Data = Data or {}
                        Data.Parent = self
                        Data.Section = self

                        local Item, ItemItems = Handler(self, Data)
                        self.Items[Name] = Item
                        return Item, ItemItems
                    end
                end
            end

            Library.Sections = Section
            Library.Sections.__index = Library.Sections
        end

        do
            local Page = { } do
                Page.__index = Page

                function Page:Page(Data)
                    local Items = { }

                    local PageButton = Instances:Create("TextButton", {
                        Parent = self.Elements["PageList"].Instance,
                        Name = Data.Name,
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(150, 150, 150),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2New(0, 0, 0, 38),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundColor3 = FromRGB(30, 34, 34)
                    })
                    PageButton:AddToTheme({BackgroundColor3 = "Element"})

                    Instances:Create("UICorner", {
                        Parent = PageButton.Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 7)
                    })

                    if Data.Icon then
                        local PageIcon = Instances:Create("ImageLabel", {
                            Parent = PageButton.Instance,
                            Name = "\0",
                            BorderColor3 = FromRGB(0, 0, 0),
                            Image = `rbxassetid://{Data.Icon}`,
                            BackgroundTransparency = 1,
                            Size = UDim2New(0, 20, 0, 20),
                            ZIndex = 2,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })

                        Instances:Create("UIGradient", {
                            Parent = PageIcon.Instance,
                            Name = "\0",
                            Transparency = RGBSequence{RGBSequenceKeypoint(0, 1), RGBSequenceKeypoint(0.5, 0), RGBSequenceKeypoint(1, 1)}
                        })

                        local PageIconList = Instances:Create("UIListLayout", {
                            Parent = PageButton.Instance,
                            Name = "\0",
                            Padding = UDimNew(0, 8),
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        })
                    end

                    local PageIconPadding = Instances:Create("UIPadding", {
                        Parent = PageButton.Instance,
                        Name = "\0",
                        PaddingTop = UDimNew(0, 9)
                    })

                    local PageContent = Instances:Create("Frame", {
                        Parent = self.Elements["PageContent"].Instance,
                        Name = Data.Name,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        Visible = false
                    })

                    Instances:Create("UIListLayout", {
                        Parent = PageContent.Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 6),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Instances:Create("UIPadding", {
                        Parent = PageContent.Instance,
                        Name = "\0",
                        PaddingTop = UDim2New(0, 6, 0, 0)
                    })

                    local PageItems = {
                        Items = Items,
                        Name = Data.Name,
                        Parent = self,
                        Button = PageButton,
                        Content = PageContent
                    }

                    setmetatable(PageItems, Page)
                    TableInsert(Library.Pages, PageItems)

                    local function SelectPage()
                        for _, PageData in Library.Pages do
                            PageData.Content.Instance.Visible = false
                            PageData.Button.Instance.TextColor3 = FromRGB(150, 150, 150)
                        end

                        PageContent.Instance.Visible = true
                        PageButton.Instance.TextColor3 = FromRGB(255, 255, 255)
                    end

                    PageButton:Connect("MouseButton1Down", SelectPage)

                    if #Library.Pages == 1 then
                        SelectPage()
                    end

                    return PageItems
                end

                function Page:SubPage(Data)
                    local Items = { }

                    local SubPageButton = Instances:Create("TextButton", {
                        Parent = self.Elements["SubPageList"].Instance,
                        Name = Data.Name,
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(150, 150, 150),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Data.Name,
                        AutoButtonColor = false,
                        Size = UDim2New(1, 0, 0, 26),
                        Position = UDim2New(0, 0, 0, 0),
                        BorderSizePixel = 0,
                        TextSize = 12,
                        BackgroundTransparency = 1,
                        BackgroundColor3 = FromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left
                    })

                    Instances:Create("UIPadding", {
                        Parent = SubPageButton.Instance,
                        Name = "\0",
                        PaddingLeft = UDimNew(0, 8)
                    })

                    local SubPageContent = Instances:Create("Frame", {
                        Parent = self.Elements["SubPageContent"].Instance,
                        Name = Data.Name,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        Visible = false
                    })

                    Instances:Create("UIListLayout", {
                        Parent = SubPageContent.Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 6),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Instances:Create("UIPadding", {
                        Parent = SubPageContent.Instance,
                        Name = "\0",
                        PaddingTop = UDim2New(0, 6, 0, 0)
                    })

                    local SubPageItems = {
                        Items = Items,
                        Name = Data.Name,
                        Parent = self,
                        Button = SubPageButton,
                        Content = SubPageContent
                    }

                    setmetatable(SubPageItems, Page)
                    TableInsert(Library.Pages, SubPageItems)

                    local function SelectSubPage()
                        if self.SelectedSubPage and self.SelectedSubPage == SubPageItems then
                            return
                        end

                        for _, PageData in Library.Pages do
                            if PageData.Parent == self then
                                PageData.Content.Instance.Visible = false
                                PageData.Button.Instance.TextColor3 = FromRGB(150, 150, 150)
                            end
                        end

                        SubPageContent.Instance.Visible = true
                        SubPageButton.Instance.TextColor3 = FromRGB(255, 255, 255)
                        self.SelectedSubPage = SubPageItems
                    end

                    SubPageButton:Connect("MouseButton1Down", SelectSubPage)

                    if not self.SelectedSubPage then
                        SelectSubPage()
                    end

                    return SubPageItems
                end

                for Name, Handler in ItemHandlers do
                    Page[Name] = function(self, Data)
                        Data = Data or {}
                        Data.Parent = self
                        Data.Section = self

                        local Item, ItemItems = Handler(self, Data)
                        self.Items[Name] = Item
                        return Item, ItemItems
                    end
                end
            end

            Library.Pages = Page
            Library.Pages.__index = Library.Pages
        end

        do
            local SubPage = { } do
                SubPage.__index = SubPage

                for Name, Handler in ItemHandlers do
                    SubPage[Name] = function(self, Data)
                        Data = Data or {}
                        Data.Parent = self
                        Data.Section = self

                        local Item, ItemItems = Handler(self, Data)
                        self.Items[Name] = Item
                        return Item, ItemItems
                    end
                end
            end

            Library.SubPage = SubPage
            Library.SubPage.__index = Library.SubPage
        end

        do
            Library.CreateSettingsPage = function(self, Window)
                local SettingsPage = Window:Page({Name = "Settings", Icon = "72732892493295"})

                local ConfigsSubPage = SettingsPage:SubPage({Name = "Configs"})
                local ThemingSubPage = SettingsPage:SubPage({Name = "Theming"})
                local SettingsSubPage = SettingsPage:SubPage({Name = "Settings"})

                local ConfigsSection = ConfigsSubPage:Section({Name = "Configs", Side = 1, Icon = "97491613646216"})

                local ConfigSelected
                local ConfigsList = ConfigsSection:Dropdown({
                    Name = "Configs",
                    Flag = "SelectedConfig",
                    Items = {},
                    Default = nil,
                    Callback = function(Value)
                        ConfigSelected = Value
                    end
                })

                local ConfigName
                ConfigsSection:Textbox({
                    Flag = "ConfigName",
                    Placeholder = "Config Name",
                    Default = "",
                    Finished = true,
                    Callback = function(Value)
                        ConfigName = Value
                    end
                })

                ConfigsSection:Button({
                    Name = "Delete",
                    Callback = function()
                        if ConfigSelected then
                            Library:DeleteConfig(ConfigSelected)
                            Library:RefreshConfigsList(ConfigsList)
                        end
                    end
                })

                ConfigsSection:Button({
                    Name = "Load",
                    Callback = function()
                        if ConfigSelected then
                            Library:LoadConfig(readfile(Library.Folders.Configs .. "/" .. ConfigSelected))
                        end
                    end
                })

                ConfigsSection:Button({
                    Name = "Save",
                    Callback = function()
                        if ConfigName and ConfigName ~= "" then
                            writefile(Library.Folders.Configs .. "/" .. ConfigName .. ".json", Library:GetConfig())
                            Library:RefreshConfigsList(ConfigsList)
                        end
                    end
                })

                ConfigsSection:Button({
                    Name = "Refresh",
                    Callback = function()
                        Library:RefreshConfigsList(ConfigsList)
                    end
                })

                Library:RefreshConfigsList(ConfigsList)

                do
                    local ThemingSection = ThemingSubPage:Section({Name = "Theming", Icon = "131595494666590", Side = 1})
                    for Index, Value in Library.Theme do
                        ThemingSection:Label(Index):Colorpicker({
                            Flag = Index.."Theme",
                            Default = Value,
                            Callback = function(Value)
                                Library.Theme[Index] = Value
                                Library:ChangeTheme(Index, Value)
                            end
                        })
                    end
                end

                do
                    local SettingsSection = SettingsSubPage:Section({Name = "Settings", Icon = "72732892493295", Side = 1})

                    SettingsSection:Button({
                        Name = "Unload",
                        Callback = function()
                            Library:Unload()
                        end
                    })

                    SettingsSection:Label("Menu Keybind"):Keybind({
                        Name = "Menu Keybind",
                        Flag = "MenuKeybind",
                        Default = Library.MenuKeybind,
                        Mode = "Toggle",
                        Callback = function()
                            Library.MenuKeybind = Library.Flags["MenuKeybind"].Key
                        end
                    })

                    SettingsSection:Slider({
                        Name = "Tween Speed",
                        Default = 0.3,
                        Flag = "Tween Speed",
                        Decimals = 0.01,
                        Suffix = "s",
                        Max = 10,
                        Min = 0,
                        Callback = function(Value)
                            Library.Tween.Time = Value
                        end
                    })

                    SettingsSection:Dropdown({
                        Name = "Tween Style",
                        Flag = "Tween style",
                        Items = { "Linear", "Quad", "Quart", "Back", "Bounce", "Circular", "Cubic", "Elastic", "Exponential", "Sine", "Quint" },
                        Default = "Quart",
                        Callback = function(Value)
                            if not Value then Value = "Quint" end
                            Library.Tween.Style = Enum.EasingStyle[Value]
                        end
                    })

                    SettingsSection:Dropdown({
                        Name = "Tween Direction",
                        Flag = "Tween direction",
                        Items = { "In", "Out", "InOut" },
                        Default = "Out",
                        Callback = function(Value)
                            if not Value then Value = "Out" end
                            Library.Tween.Direction = Enum.EasingDirection[Value]
                        end
                    })
                end

                return SettingsPage
            end
        end

        do
            local Window = { } do
                Window.__index = Window

                function Library:Window(Data)
                    local Elements = { }

                    local WindowMain = Instances:Create("Frame", {
                        Parent = Library.Holder.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 520, 0, 326),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(16, 18, 18)
                    })
                    WindowMain:AddToTheme({BackgroundColor3 = "Background"})

                    WindowMain:MakeDraggable()
                    WindowMain:MakeResizeable(Vector2New(0, 400, 0, 200), Vector2New(math.huge, math.huge))

                    Instances:Create("UICorner", {
                        Parent = WindowMain.Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 10)
                    })

                    Instances:Create("UIStroke", {
                        Parent = WindowMain.Instance,
                        Name = "\0",
                        Color = FromRGB(56, 62, 62),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = "Border 2"})

                    local WindowTopbar = Instances:Create("Frame", {
                        Parent = WindowMain.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 42),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1
                    })

                    Instances:Create("UIListLayout", {
                        Parent = WindowTopbar.Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    local WindowTitle = Instances:Create("TextLabel", {
                        Parent = WindowTopbar.Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(255, 255, 255),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Data.Name or "Arcane",
                        Size = UDim2New(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundTransparency = 1,
                        BackgroundColor3 = FromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left
                    })

                    Instances:Create("UIPadding", {
                        Parent = WindowTopbar.Instance,
                        Name = "\0",
                        PaddingLeft = UDimNew(0, 12)
                    })

                    local WindowPageLayout = Instances:Create("Frame", {
                        Parent = WindowMain.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, -42),
                        Position = UDim2New(0, 0, 0, 42),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1
                    })

                    Instances:Create("UIListLayout", {
                        Parent = WindowPageLayout.Instance,
                        Name = "\0",
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    local WindowPageList = Instances:Create("ScrollingFrame", {
                        Parent = WindowPageLayout.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 115, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        ScrollBarImageColor3 = FromRGB(255, 255, 255),
                        ScrollBarImageTransparency = 1,
                        ScrollBarThickness = 0,
                        AutomaticCanvasSize = Enum.AutomaticSize.Y
                    })

                    Instances:Create("UIListLayout", {
                        Parent = WindowPageList.Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 4),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Instances:Create("UIPadding", {
                        Parent = WindowPageList.Instance,
                        Name = "\0",
                        PaddingTop = UDimNew(0, 6),
                        PaddingBottom = UDimNew(0, 6),
                        PaddingRight = UDimNew(0, 8),
                        PaddingLeft = UDimNew(0, 6)
                    })

                    local WindowPageContent = Instances:Create("Frame", {
                        Parent = WindowPageLayout.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -115, 1, 0),
                        Position = UDim2New(0, 115, 0, 0),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1
                    })

                    local WindowSubPageLayout = Instances:Create("Frame", {
                        Parent = WindowPageContent.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 26),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1
                    })

                    local WindowSubPageList = Instances:Create("ScrollingFrame", {
                        Parent = WindowSubPageLayout.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -76, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        ScrollBarImageColor3 = FromRGB(255, 255, 255),
                        ScrollBarImageTransparency = 1,
                        ScrollBarThickness = 0,
                        AutomaticCanvasSize = Enum.AutomaticSize.X
                    })

                    Instances:Create("UIListLayout", {
                        Parent = WindowSubPageList.Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 6),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    })

                    Instances:Create("UIPadding", {
                        Parent = WindowSubPageList.Instance,
                        Name = "\0",
                        PaddingLeft = UDimNew(0, 6)
                    })

                    local WindowSubPageContent = Instances:Create("Frame", {
                        Parent = WindowSubPageLayout.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 70, 1, 0),
                        Position = UDim2New(1, 0, 0, 0),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1
                    })

                    local WindowSubPageIndicator = Instances:Create("Frame", {
                        Parent = WindowSubPageContent.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 60, 0, 4),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(255, 255, 255)
                    })

                    Instances:Create("UICorner", {
                        Parent = WindowSubPageIndicator.Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 2)
                    })

                    local WindowContent = Instances:Create("Frame", {
                        Parent = WindowPageContent.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, -26),
                        Position = UDim2New(0, 0, 0, 26),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        ClipsDescendants = false
                    })

                    Elements["Window"] = WindowMain
                    Elements["Title"] = WindowTitle
                    Elements["PageList"] = WindowPageList
                    Elements["PageContent"] = WindowPageContent
                    Elements["SubPageList"] = WindowSubPageList
                    Elements["SubPageContent"] = WindowSubPageContent
                    Elements["SubPageIndicator"] = WindowSubPageIndicator
                    Elements["Content"] = WindowContent

                    local WindowData = {
                        Name = Data.Name,
                        Elements = Elements,
                        IsOpen = true,
                        SelectedSubPage = nil
                    }

                    setmetatable(WindowData, Window)

                    function Window:SetCenter()
                        WindowMain:Tween(TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            Position = UDim2New(0.5, -260, 0.5, -163)
                        })
                    end

                    function Window:SetOpen(Bool)
                        Window.IsOpen = Bool

                        if Window.IsOpen then
                            WindowMain.Visible = true
                        else
                            WindowMain.Visible = false
                        end
                    end

                    function Window:Category(Name)
                        local CategoryLabel = Instances:Create("TextLabel", {
                            Parent = WindowPageList.Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            TextColor3 = FromRGB(150, 150, 150),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Text = Name,
                            AutoButtonColor = false,
                            Size = UDim2New(1, 0, 0, 18),
                            BorderSizePixel = 0,
                            TextSize = 11,
                            BackgroundTransparency = 1,
                            BackgroundColor3 = FromRGB(255, 255, 255),
                            TextXAlignment = Enum.TextXAlignment.Left
                        })

                        Instances:Create("UIPadding", {
                            Parent = CategoryLabel.Instance,
                            Name = "\0",
                            PaddingLeft = UDimNew(0, 4),
                            PaddingTop = UDimNew(0, 8)
                        })
                    end

                    function Window:Page(Data)
                        local Items = { }

                        local PageButton = Instances:Create("TextButton", {
                            Parent = WindowPageList.Instance,
                            Name = Data.Name,
                            FontFace = Library.Font,
                            TextColor3 = FromRGB(150, 150, 150),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Text = "",
                            AutoButtonColor = false,
                            Size = UDim2New(0, 0, 0, 38),
                            BorderSizePixel = 0,
                            TextSize = 14,
                            BackgroundColor3 = FromRGB(30, 34, 34)
                        })
                        PageButton:AddToTheme({BackgroundColor3 = "Element"})

                        Instances:Create("UICorner", {
                            Parent = PageButton.Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 7)
                        })

                        if Data.Icon then
                            local PageIcon = Instances:Create("ImageLabel", {
                                Parent = PageButton.Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Image = `rbxassetid://{Data.Icon}`,
                                BackgroundTransparency = 1,
                                Size = UDim2New(0, 20, 0, 20),
                                ZIndex = 2,
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255)
                            })

                            Instances:Create("UIGradient", {
                                Parent = PageIcon.Instance,
                                Name = "\0",
                                Transparency = RGBSequence{RGBSequenceKeypoint(0, 1), RGBSequenceKeypoint(0.5, 0), RGBSequenceKeypoint(1, 1)}
                            })

                            local PageIconList = Instances:Create("UIListLayout", {
                                Parent = PageButton.Instance,
                                Name = "\0",
                                Padding = UDimNew(0, 8),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                                VerticalAlignment = Enum.VerticalAlignment.Center
                            })
                        end

                        local PageIconPadding = Instances:Create("UIPadding", {
                            Parent = PageButton.Instance,
                            Name = "\0",
                            PaddingTop = UDimNew(0, 9)
                        })

                        local PageContent = Instances:Create("Frame", {
                            Parent = WindowContent.Instance,
                            Name = Data.Name,
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 0, 1, 0),
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            Visible = false
                        })

                        Instances:Create("UIListLayout", {
                            Parent = PageContent.Instance,
                            Name = "\0",
                            Padding = UDimNew(0, 6),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })

                        Instances:Create("UIPadding", {
                            Parent = PageContent.Instance,
                            Name = "\0",
                            PaddingTop = UDim2New(0, 6, 0, 0)
                        })

                        local PageItems = {
                            Items = Items,
                            Name = Data.Name,
                            Parent = Window,
                            Button = PageButton,
                            Content = PageContent,
                            Elements = Elements,
                            SelectedSubPage = nil
                        }

                        setmetatable(PageItems, Library.Pages)
                        TableInsert(Library.Pages, PageItems)

                        local function SelectPage()
                            for _, PageData in Library.Pages do
                                if PageData.Parent == Window then
                                    PageData.Content.Instance.Visible = false
                                    PageData.Button.Instance.TextColor3 = FromRGB(150, 150, 150)
                                end
                            end

                            PageContent.Instance.Visible = true
                            PageButton.Instance.TextColor3 = FromRGB(255, 255, 255)
                        end

                        PageButton:Connect("MouseButton1Down", SelectPage)

                        if #Library.Pages == 1 then
                            SelectPage()
                        end

                        return PageItems
                    end

                    Library:Connect(UserInputService.InputBegan, function(Input)
                        if Input.KeyCode == Enum.KeyCode[Library.MenuKeybind] then
                            Window:SetOpen(not Window.IsOpen)
                        end
                    end)

                    Window:SetCenter()
                    Window:SetOpen(true)

                    return WindowData
                end
            end

            Library.Window = Window
            Library.Window.__index = Library.Window
        end

        do
            Library.Notification = function(self, Text, Duration, Icon)
                Duration = Duration or 5

                local NotificationFrame = Instances:Create("Frame", {
                    Parent = Library.NotifHolder.Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 0, 0, 36),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(16, 18, 18)
                })
                NotificationFrame:AddToTheme({BackgroundColor3 = "Background"})

                Instances:Create("UICorner", {
                    Parent = NotificationFrame.Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 10)
                })

                Instances:Create("UIStroke", {
                    Parent = NotificationFrame.Instance,
                    Name = "\0",
                    Color = FromRGB(56, 62, 62),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border 2"})

                if Icon then
                    local NotificationIcon = Instances:Create("ImageLabel", {
                        Parent = NotificationFrame.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Image = `rbxassetid://{Icon}`,
                        Size = UDim2New(0, 20, 0, 20),
                        Position = UDim2New(0, 8, 0.5, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        BackgroundColor3 = FromRGB(255, 255, 255)
                    })
                end

                local NotificationText = Instances:Create("TextLabel", {
                    Parent = NotificationFrame.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(255, 255, 255),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Text,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Size = UDim2New(0, 0, 1, 0),
                    Position = UDim2New(0, Icon and 36 or 12, 0, 0),
                    BorderSizePixel = 0,
                    TextSize = 12,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = FromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.X
                })

                Instances:Create("UIPadding", {
                    Parent = NotificationFrame.Instance,
                    Name = "\0",
                    PaddingRight = UDimNew(0, 12)
                })

                local NotificationIndicator = Instances:Create("Frame", {
                    Parent = NotificationFrame.Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 3, 1, -12),
                    Position = UDim2New(1, 0, 0, 6),
                    AnchorPoint = Vector2New(1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UICorner", {
                    Parent = NotificationIndicator.Instance,
                    Name = "\0",
                    CornerRadius = UDimNew(0, 2)
                })

                task.spawn(function()
                    NotificationFrame:Tween(TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2New(0, 220, 0, 36)})
                    task.wait(0.35)

                    NotificationIndicator:Tween(TweenInfo.new(Duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2New(0, 0, 1, -12)})
                    task.wait(Duration)

                    NotificationFrame:Tween(TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2New(0, 0, 0, 36)})
                    task.wait(0.35)
                    NotificationFrame:Clean()
                end)
            end
        end
    end
end

local Window = Library:Window({Name = "Arcane Example"})

Window:Category("Combat")
local CombatPage = Window:Page({Name = "Aimbot", Icon = "136879043989014"})
Window:Page({Name = "Visuals", Icon = "136879043989014"})

Window:Category("Misc")
Window:Page({Name = "Settings", Icon = "136879043989014"})

local CombatSubPage = CombatPage:SubPage({Name = "Main"})
CombatPage:SubPage({Name = "Prediction"})
CombatPage:SubPage({Name = "Filters"})

local MainSection = CombatSubPage:Section({Name = "Aimbot Settings", Side = 1})

MainSection:Toggle({
    Name = "Enable Aimbot",
    Flag = "aimbot_enabled",
    Default = false,
    Callback = function(Value)
        print("Aimbot enabled:", Value)
    end
})

MainSection:Slider({
    Name = "FOV",
    Flag = "aimbot_fov",
    Min = 0,
    Max = 360,
    Default = 50,
    Suffix = "°",
    Decimals = 0,
    Callback = function(Value)
        print("FOV:", Value)
    end
})

MainSection:Slider({
    Name = "Smoothness",
    Flag = "aimbot_smooth",
    Min = 0,
    Max = 100,
    Default = 10,
    Suffix = "%",
    Decimals = 1,
    Callback = function(Value)
        print("Smoothness:", Value)
    end
})

MainSection:Dropdown({
    Name = "Target Part",
    Flag = "aimbot_target",
    Items = {"Head", "Torso", "HumanoidRootPart"},
    Default = "Head",
    Callback = function(Value)
        print("Target part:", Value)
    end
})

MainSection:Dropdown({
    Name = "Lock Type",
    Flag = "aimbot_lock",
    Items = {"Toggle", "Hold"},
    Default = "Toggle",
    Callback = function(Value)
        print("Lock type:", Value)
    end
})

MainSection:Label("Aimbot Key"):Keybind({
    Name = "Key",
    Flag = "aimbot_key",
    Default = Enum.KeyCode.E,
    Mode = "Toggle",
    Callback = function(Key, Mode)
        print("Key:", Key, "Mode:", Mode)
    end
})

local SecondSection = CombatSubPage:Section({Name = "Extra Options", Side = 2})

SecondSection:Toggle({
    Name = "Show FOV Circle",
    Flag = "aimbot_fov_visible",
    Default = true,
    Callback = function(Value)
        print("Show FOV:", Value)
    end
})

SecondSection:Toggle({
    Name = "Silent Aim",
    Flag = "aimbot_silent",
    Default = false,
    Callback = function(Value)
        print("Silent aim:", Value)
    end
})

SecondSection:Toggle({
    Name = "Ignore Walls",
    Flag = "aimbot_walls",
    Default = true,
    Callback = function(Value)
        print("Ignore walls:", Value)
    end
})

SecondSection:Textbox({
    Flag = "aimbot_notifies",
    Placeholder = "Notification text...",
    Default = "",
    Finished = true,
    Callback = function(Value)
        print("Notify text:", Value)
    end
})

local VisualsPage = Window:Page({Name = "Visuals", Icon = "136879043989014"})
local VisualsSubPage = VisualsPage:SubPage({Name = "ESP"})

local ESPSection = VisualsSubPage:Section({Name = "ESP Settings", Side = 1})

ESPSection:Toggle({
    Name = "Enable ESP",
    Flag = "esp_enabled",
    Default = false,
    Callback = function(Value)
        print("ESP enabled:", Value)
    end
})

ESPSection:Slider({
    Name = "ESP Range",
    Flag = "esp_range",
    Min = 50,
    Max = 1000,
    Default = 200,
    Suffix = " studs",
    Decimals = 0,
    Callback = function(Value)
        print("ESP range:", Value)
    end
})

ESPSection:Label("Box Color"):Colorpicker({
    Flag = "esp_box_color",
    Default = Color3.fromRGB(255, 100, 100),
    Callback = function(Value)
        print("Box color:", Value)
    end
})

ESPSection:Label("Name Color"):Colorpicker({
    Flag = "esp_name_color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        print("Name color:", Value)
    end
})

ESPSection:Dropdown({
    Name = "Box Style",
    Flag = "esp_style",
    Items = {"Box", "Corner Box", "Circle"},
    Default = "Box",
    Callback = function(Value)
        print("Box style:", Value)
    end
})

ESPSection:Button({
    Name = "Refresh Players",
    Callback = function()
        print("Refreshing player list...")
    end
})

local SettingsPage = Library:CreateSettingsPage(Window)

Library:Notification("Welcome to Arcane!", 5, nil)
Library:Notification("All features demonstrated", 3, nil)

getgenv().Library = Library
return Library