--[[
    		Airflow Interface

    Author: 4lpaca
    License: MIT
    Github: https://github.com/4lpaca-pin/Airflow
--]]

-- Type --
export type GlobalConfig = {
	Name: string,
	Callback: (... any) -> any,
	Default : boolean & string & number & {string&any} & Enum.KeyCode,
	Min : number,
	Max : number,
	Round : number,
	Type : string,
	Content : string,
	Values : {string},
	Multi : boolean,
	Position : string,
	Numeric : boolean,
	Finished : boolean,
	Placeholder : string,
	ValueTexts : {
		[number]:string
	}
};

export type Elements = {
	AddLabel : (self, name) -> {
		Edit : (self, Value: string) -> nil,
		Visible : (self, Value: boolean) -> nil,
		Destroy : (self) -> nil,
	},
	AddButton : (self,config : GlobalConfig) -> {
		Edit : (self, Value: string) -> nil,
		Visible : (self, Value: boolean) -> nil,
		Destroy : (self) -> nil,
		Fire : (... any) -> any,
	},
	AddToggle : (self,config : GlobalConfig) -> {
		Edit : (self, Value: string) -> nil,
		Visible : (self, Value: boolean) -> nil,
		Destroy : (self) -> nil,
		SetValue : (self,Value : boolean) -> any,
		AutomaticVisible : (self , config : {
			Target : boolean ,
			Elements : {Elements}
		}) -> RBXScriptSignal,
	},
	AddSlider : (self,config : GlobalConfig) -> {
		Edit : (self, Value: string) -> nil,
		Visible : (self, Value: boolean) -> nil,
		Destroy : (self) -> nil,
		SetValue : (self,Value : number) -> any,
	},
	AddKeybind : (self,config : GlobalConfig) -> {
		Edit : (self, Value: string) -> nil,
		Visible : (self , Value: boolean) -> nil,
		Destroy : (self) -> nil,
		SetValue : (self ,Value : string & Enum.KeyCode) -> any,
	},
	AddTextbox : (self,config : GlobalConfig) -> {
		Edit : (self, Value: string) -> nil,
		Visible : (self , Value: boolean) -> nil,
		Destroy : (self) -> nil,
		SetValue : (self ,Value : string) -> any,
	},
	AddColorPicker : (self,config : GlobalConfig) -> {
		Edit : (self, Value: string) -> nil,
		SetValue : (self, Value: Color3) -> nil,
		Visible : (self , Value: boolean) -> nil,
		Destroy : (self) -> nil,
	},
	AddParagraph : (self,config : GlobalConfig) -> {
		EditName : (self, Value: string) -> nil,
		EditContent : (self, Value: string) -> nil,
		Visible : (self , Value: boolean) -> nil,
		Destroy : (self) -> nil,
	},
	AddDropdown : (self, config : GlobalConfig) -> {
		Edit : (self, Value: string) -> nil,
		SetValues : (self , Value: {string}) -> nil,
		SetDefault : (self , Value: {string} & string) -> nil,
		Visible : (self , Value: boolean) -> nil,
		Destroy : (self) -> nil,
	},
};

export type Tab = {
	Left : Elements,
	Right : Elements,
	AddSection : (self , GlobalConfig) -> Elements,
	Disabled : boolean,
	Disable : (self, Value: boolean , Reason : string & nil) -> any,
};

export type KeyValue = {
	Visible : (self , Value: boolean) -> any,
	SetKey : (self , Value: string) -> any,
	SetValue : (self , Value: string) -> any,
}

export type LoaderVersion = {
	Name : string,
	Status : string,
	LastUpdate : number | string,
	LoadScript : string | (any) -> any,
};


export type Loader = {
	Name : string,
	Icon : string,
	Hightlight : Color3,
	DrawGame : (loader_game : LoaderGame) -> {
		DrawVersion : (loader_version : LoaderVersion) -> LoaderVersion,
	},
};

export type LoaderGame = {
	Name : string,
	Logo : string,
	Description : string,
	DrawVersion : (loader_version : LoaderVersion) -> nil,
};

-- Exploit Environment --
cloneref = cloneref or function(i) return i; end;
cloenfunction = cloenfunction or function(...) return ...; end;
hookfunction = hookfunction or function(a,b) return a; end;
getgenv = getgenv or getfenv;
protect_gui = protect_gui or protectgui or (syn and syn.protect_gui) or function() end;

-- Services --
local TextService = game:GetService('TextService');
local TweenService = game:GetService('TweenService');
local RunService = game:GetService('RunService');
local Players = game:GetService('Players');
local UserInputService = game:GetService('UserInputService');
local Client = Players.LocalPlayer;
local Mouse = Client:GetMouse();
local CurrentCamera = workspace.CurrentCamera;
local AirflowUI = Instance.new("ScreenGui");
local _,CoreGui = xpcall(function()
	return (gethui and gethui()) or game:GetService("CoreGui"):FindFirstChild("RobloxGui");
end,function()
	return Client.PlayerGui;
end);

do
	AirflowUI.Name = "AirflowUI";
	AirflowUI.Parent = CoreGui;
	AirflowUI.ResetOnSpawn = false;
	AirflowUI.ZIndexBehavior = Enum.ZIndexBehavior.Global;
	AirflowUI.IgnoreGuiInset = true;

	protect_gui(AirflowUI);
end;

-- Airflow --
local Airflow = {
	Version = "1.2",
	ScreenGui = AirflowUI,
	Config = {
		Scale = UDim2.new(0.1, 515, 0.1, (UserInputService.TouchEnabled and 345) or 395),
		Hightlight = Color3.fromRGB(163, 128, 216),
		Logo = "http://www.roblox.com/asset/?id=118752982916680",
		Keybind = "Delete",
		Resizable = false,
		UnlockMouse = false,
		IconSize = 20,
	},
	FileManager = {},
	Features = {},
};

return Airflow