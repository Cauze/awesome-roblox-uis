--[[
    		Compkiller Interface

    Author: 4lpaca
    License: MIT
    Github: https://github.com/4lpaca-pin/CompKiller
    Original: compkiller.net

        Version: 2.6
    - Improved Performance Mode
    	Compkiller:OptimizeMode(< boolean >)
  	- Added Auto Color Logo
		Compkiller:CustomIconHighlight()
--]]

--- Export Types ---

export type cloneref = (target: Instance) -> Instance;

export type Window = {
	Name: string,
	Keybind: string | Enum.KeyCode,
	Logo: string,
	Scale: UDim2,
	TextSize: number
};

export type ConfigManager = {
	Directory: string,
	Config: string,
};

export type WriteConfig = {
	Name: string,
	Author: string,
};

export type WindowUpdate = {
	Username: string,
	ExpireDate: string,
	Logo: string,
	WindowName: string,
	UserProfile: string
};

export type ConfigFunctions = {
	Directory: string,
	WriteConfig: (self: ConfigFunctions , Config: WriteConfig) -> any?,
	ReadInfo: (self: ConfigFunctions , ConfigName: string) -> any?,
	DeleteConfig: (self: ConfigFunctions , ConfigName: string) -> any?,
	LoadConfig: (self: ConfigFunctions , ConfigName: string) -> any?,
	GetConfigs: (self: ConfigFunctions , ConfigName: string) -> {string},
	GetConfigCount: (self: ConfigFunctions) -> number,
	GetFullConfigs: (self: ConfigFunctions , ConfigName: string) -> {
		{
			Name: string,
			Info: {
				Type: string,
				Author: string,
				Name: string,
				CreatedDate: string,
			}
		}	
	},
};

export type KeybindSettings = {
	Key : string,
	On : boolean | number,
	Off : boolean | number,
	Mode : number,
	Name : string,
}

export type SecurityConfig = {
	BlurEnabled : boolean,
	ImageScale: number,
};

export type Notify = {
	Icon: string,
	Title: string,
	Content: string,
	Duration: number
};

export type NotifyPayback = {
	SetProgress: (self: Notify , time: number) -> any?,
	Content: (self: Notify , str: string) -> any?,
	Title: (self: Notify , str: string) -> any?,
	Close: () -> any?,
}

export type Watermark = {
	Icon: string,
	Text: string
};

export type TabConfig = {
	Name: string,
	Icon: string,
	Type: string,
	EnableScrolling: boolean
};

export type TabConfigManager = {
	Name: string,
	Icon: string,
	Config: ConfigFunctions
}

export type ContainerTab = {
	Name: string,
	Icon: string,
	EnableScrolling: boolean
};

export type Category = {
	Name: string
};

export type Section = {
	Name: string,
	Position: string
};

export type Toggle = {
	Name: string,
	Default: boolean,
	Flag: string | nil,
	Risky: boolean,
	Callback: (Value: boolean) -> any?
};

export type MiniToggle = {
	Default: boolean,
	Flag: string | nil,
	Callback: (Value: boolean) -> any?
};

export type TextBoxConfig = {
	Name: string,
	Default: string,
	Placeholder: string,
	Flag: string | nil,
	Numeric: boolean,
	Callback: (Text: string) -> any?
};

export type ColorPicker = {
	Name: string,
	Default: Color3,
	Flag: string | nil,
	Transparency: number,
	Callback: (Value: Color3 , Trans: number) -> any?
};

export type MiniColorPicker = {
	Default: Color3,
	Transparency: number,
	Flag: string | nil,
	Callback: (Value: Color3 , Trans: number) -> any?
};

export type Slider = {
	Name: string,
	Min: number,
	Max: number,
	Default: number,
	Type: string,
	Round: number,
	Callback: (Value: number) -> any?
};

export type Dropdown = {
	Name: string,
	Default: string | {string},
	Values: {string},
	Multi: boolean,
	Callback: (Value: string | {[string]: boolean}) -> any?
};

export type Button = {
	Name: string,
	Callback: () -> any?
};

export type Keybind = {
	Name: string,
	Default: string | Enum.KeyCode,
	Callback: (Value: string) -> any,
	Blacklist: {string | Enum.KeyCode}
};

export type MiniKeybind = {
	Default: string | Enum.KeyCode,
	Callback: (Value: string) -> any,
	Blacklist: {string | Enum.KeyCode}
};

export type Helper = {
	Text: string
};

export type Paragraph = {
	Title: string,
	Content: string
}

pcall(function() -- for Luraph
	local Constant = table.concat({"LP","H_NO"}).."_VI".."RTU".."AL".."IZE";
	getfenv()[Constant] = getfenv()[Constant] or function(f) return f end; 
	-- LPH_NO_VIRTUALIZE
end);

pcall(function() -- for IB1
	local Constant = "IB".."_NO_VI".."RTU".."AL".."IZE";
	getfenv()[Constant] = getfenv()[Constant] or function(f) return f end; 
	-- IB_NO_VIRTUALIZE
end);

getgenv = getgenv or getfenv;

--- Local Variables ---
local cloneref: cloneref = cloneref or function(f) return f end;
local TweenService: TweenService = cloneref(game:GetService('TweenService'));
local UserInputService: UserInputService = cloneref(game:GetService('UserInputService'));
local TextService: TextService = cloneref(game:GetService('TextService'));
local RunService: RunService = cloneref(game:GetService('RunService'));
local Players: Players = cloneref(game:GetService('Players'));
local HttpService: HttpService = cloneref(game:GetService('HttpService'));
local LocalPlayer: Player = Players.LocalPlayer;
local CoreGui: PlayerGui = (gethui and gethui()) or (get_hidden_gui and get_hidden_gui()) or cloneref(game:FindFirstChild('CoreGui')) or cloneref(LocalPlayer.PlayerGui);
local Mouse: Mouse = LocalPlayer:GetMouse();
local CurrentCamera: Camera? = cloneref(workspace.CurrentCamera);

local Compkiller = {
	Version = '2.6',
	Logo = "rbxassetid://120245531583106",
	Windows = {},
	Scale = {
		Window = UDim2.new(0, 485,0, 565),
		Mobile = UDim2.new(0, 450,0, 375),
		TabOpen = 185,
		TabClose = 85,
	},
	PerformanceMode = false,
	WindowsNil = {},
	NilFolder = Instance.new('Folder'),
	ArcylicParent = CurrentCamera,
	ProtectGui = protect_gui or protectgui or (syn and syn.protect_gui) or function(s) return s; end,
};

Compkiller.Colors = {
	Highlight = Color3.fromRGB(17, 238, 253),
	Toggle = Color3.fromRGB(14, 203, 213),
	Risky = Color3.fromRGB(251, 255, 39),
	BGDBColor = Color3.fromRGB(22, 24, 29),
	BlockColor = Color3.fromRGB(28, 29, 34),
	StrokeColor = Color3.fromRGB(37, 38, 43),
	SwitchColor = Color3.fromRGB(255, 255, 255),
	DropColor = Color3.fromRGB(33, 35, 39),
	MouseEnter = Color3.fromRGB(55, 58, 65),
	BlockBackground = Color3.fromRGB(39, 40, 47),
	LineColor = Color3.fromRGB(65, 65, 65),
	HighStrokeColor = Color3.fromRGB(55, 56, 63),
};

Compkiller.Elements = {
	Highlight = {},
	DropHighlight = {},
	Risky = {},
	BGDBColor = {},
	BlockColor = {},
	StrokeColor = {},
	SwitchColor = {},
	DropColor = {},
	BlockBackground = {},
	LineColor = {},
	HighStrokeColor = {},
};

Compkiller.DragBlacklist = {};
Compkiller.IaDrag = false;
Compkiller.LastDrag = tick();
Compkiller.Flags = {};

return Compkiller