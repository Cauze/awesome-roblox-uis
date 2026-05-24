--[[
    		Fatality-Dark Interface

    Author: 4lpaca
    License: MIT
    Github: https://github.com/4lpaca-pin/Fatality
--]]

-- Export Types --
export type Window = {
	Name: string,
	Keybind: string | Enum.KeyCode,
	Scale: UDim2,
	Expire: string
}

export type Loader = {
	Name: string,
	Duration: number,
	Scale: number
}

export type Menu = {
	Name: string,
	Icon: string,
	AutoFill: boolean
}

export type Section = {
	Name: string,
	Position: string,
	Height: number,
}

export type Listbox = {
	Name: string,
	Option: boolean,
	Multi: boolean,
	Position: string,
	Flag: string | nil,
	Height: number,
	Default: ValueBase,
	Values: {ValueBase},
	Callback: (values: {ValueBase}) -> any
}

export type Elements = {
	AddToggle: (self,Config: Toggle) -> {
		Option: Elements	
	},
	AddSlider: (self,Config: Slider) -> {
		Option: Elements	
	},
	AddButton: (self,Config: Button) -> {},
	AddColorPicker: (self,Config: ColorPicker) -> {
		Option: Elements	
	},
	AddDropdown: (self,Config: Dropdown) -> {
		Option: Elements	
	},
	AddKeybind: (self,Config: Keybind) -> {
		Option: Elements	
	},
}

export type Preview = {
	Position: string,
	Height: number
}

export type Toggle = {
	Name: string,
	Default: boolean,
	Callback: (boolean) -> any,
	Risky: boolean,
	Option: boolean,
	Flag: string | nil,
}

export type Slider = {
	Name: string,
	Default: number,
	Min: number,
	Max: number,
	Round: number,
	Type: string,
	Callback: (number) -> any,
	Risky: boolean,
	Flag: string | nil,
	Option: boolean
}

export type Button = {
	Name: string,
	Callback: (number) -> any,
	Risky: boolean,
}

export type ColorPicker = {
	Name: string,
	Default: Color3,
	Transparency: number,
	Callback: (number) -> any,
	Flag: string | nil,
	Option: boolean
}

export type Dropdown = {
	Name: string,
	Default: string | {string},
	Values: {string},
	Callback: (string | {string}) -> any,
	Option: boolean,
	Multi: boolean,
	Flag: string | nil,
	AutoUpdate: boolean
}

export type Keybind = {
	Name: string,
	Default: string | Enum.KeyCode,
	Callback: (string) -> any,
	Flag: string | nil,
	Option: boolean,
}

export type Notify = {
	Title: string,
	Content: string,
	Duration: number,
	Flag: string | nil,
	Icon: string
}

export type Notifier = {
	Notify: (self, Config: Notify) -> nil
}

-- Exploit Environments --
cloneref = cloneref or function(i) return i; end;
clonefunction = clonefunction or function(...) return ...; end;
hookfunction = hookfunction or function(a,b) return a; end;
getgenv = getgenv or getfenv;
protect_gui = protect_gui or protectgui or (syn and syn.protect_gui) or function() end;
getgenv().LPH_NO_VIRTUALIZE = LPH_NO_VIRTUALIZE or function(f) return f end;

-- Services --
local TextService = cloneref(game:GetService('TextService'));
local TweenService = cloneref(game:GetService('TweenService'));
local RunService = cloneref(game:GetService('RunService'));
local Players = cloneref(game:GetService('Players'));
local UserInputService = cloneref(game:GetService('UserInputService'));
local Client = Players.LocalPlayer;
local Mouse = Client:GetMouse();
local CurrentCamera = workspace.CurrentCamera;
local _,CoreGui = xpcall(function()
	return (gethui and gethui()) or game:GetService("CoreGui"):FindFirstChild("RobloxGui");
end,function()
	return Client.PlayerGui;
end);

-- Fatality --
local Fatality = {};

Fatality.Ascii = "qwertyuiopasdfghjklzxcvbnmQWRTYUIOPASDFGHJKLZXCVBNM";
Fatality.GLOBAL_ENVIRONMENT = {};
Fatality.Windows = {};
Fatality.FontSemiBold = Font.new('rbxasset://fonts/families/GothamSSm.json',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal);
Fatality.Flags = {};
Fatality.Colors = {
	Black = Color3.fromRGB(16, 16, 16),
	Main = Color3.fromRGB(255, 106, 133)
};
Fatality.DragBlacklist = {};
Fatality.Version = '1.6';

return Fatality