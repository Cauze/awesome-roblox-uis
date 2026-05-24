local library = (syn and loadstring(game:HttpGet("https://github.com/GhostDuckyy/UI-Libraries/blob/main/DEADCELL%20REMAKE/source.lua?raw=true"))()) or loadstring(game:HttpGet("https://github.com/GhostDuckyy/UI-Libraries/blob/main/DEADCELL%20REMAKE/Modified/source.lua?raw=true"))();

local theme = {
    ["Default"] = {
        ["Accent"] = Color3.fromRGB(61, 100, 227),
        ["Window Outline Background"] = Color3.fromRGB(39,39,47),
        ["Window Inline Background"] = Color3.fromRGB(23,23,30),
        ["Window Holder Background"] = Color3.fromRGB(32,32,38),
        ["Page Unselected"] = Color3.fromRGB(32,32,38),
        ["Page Selected"] = Color3.fromRGB(55,55,64),
        ["Section Background"] = Color3.fromRGB(27,27,34),
        ["Section Inner Border"] = Color3.fromRGB(50,50,58),
        ["Section Outer Border"] = Color3.fromRGB(19,19,27),
        ["Window Border"] = Color3.fromRGB(58,58,67),
        ["Text"] = Color3.fromRGB(245, 245, 245),
        ["Risky Text"] = Color3.fromRGB(245, 239, 120),
        ["Object Background"] = Color3.fromRGB(41,41,50)
    };    
}

local window = library:new_window({size = Vector2.new(650, 500)})

local homePage = window:new_page({name = "Home"})
local demoSection = homePage:new_section({
    name = "Widget Demo",
    size = "Fill"
})

demoSection:new_seperator({name = "--- Buttons ---"})
demoSection:new_button({
    name = "Regular Button",
    callback = function()
        library:notify("Regular button clicked!", 3)
    end
})
demoSection:new_button({
    name = "Confirmed Button",
    confirm = true,
    callback = function()
        library:notify("Confirmed button activated!", 4)
    end
})

demoSection:new_seperator({name = "--- Toggle ---"})
demoSection:new_toggle({
    name = "Enable Feature",
    flag = "feature_toggle",
    callback = function(state)
        library:notify("Feature " .. (state and "enabled" or "disabled"), 2)
    end
})

demoSection:new_seperator({name = "--- Slider ---"})
demoSection:new_slider({
    flag = "slider_value",
    name = "WalkSpeed",
    min = 16,
    max = 500,
    default = 16,
    float = 0
})

demoSection:new_seperator({name = "--- Keybind ---"})
demoSection:new_keybind({
    name = "Toggle UI",
    flag = "menu_toggle",
    default = Enum.KeyCode.End,
    mode = "Toggle",
    ignore = true,
    callback = function()
        library:Close()
    end
})

local themePage = window:new_page({name = "Theme"})
local accentSection = themePage:new_section({
    name = "Accent Colors",
    size = "Fill"
})

local theme_pickers = {};
theme_pickers.Accent = accentSection:new_colorpicker({
    name = "accent",
    flag = "theme_accent",
    default = theme["Default"].Accent,
    callback = function(state)
        library:ChangeThemeOption("Accent", state);
    end
});
theme_pickers["Window Outline Background"] = accentSection:new_colorpicker({
    name = "window outline",
    flag = "theme_outline",
    default = theme["Default"]["Window Outline Background"],
    callback = function(state)
        library:ChangeThemeOption("Window Outline Background", state);
    end
});
theme_pickers["Window Inline Background"] = accentSection:new_colorpicker({
    name = "window inline",
    flag = "theme_inline",
    default = theme["Default"]["Window Inline Background"],
    callback = function(state)
        library:ChangeThemeOption("Window Inline Background", state);
    end
});
theme_pickers["Window Holder Background"] = accentSection:new_colorpicker({
    name = "window holder",
    flag = "theme_holder",
    default = theme["Default"]["Window Holder Background"],
    callback = function(state)
        library:ChangeThemeOption("Window Holder Background", state);
    end
});

local otherSection = themePage:new_section({
    name = "Effects",
    size = "Fill",
    side = "right"
});

otherSection:new_dropdown({
    flag = "settings/menu/effects",
    name = "accent effects",
    options = {"None", "rainbow", "shift", "reverse shift"},
    default = "none"
});
otherSection:new_slider({
    flag = "settings/menu/effect_speed",
    name = "effect speed",
    min = 0,
    max = 2,
    default = 1,
    float = 0
});

game:GetService("RunService").Heartbeat:Connect(function()
    local AccentEffect = library.flags["settings/menu/effects"];
    local EffectSpeed = library.flags["settings/menu/effect_speed"];
    if AccentEffect == "rainbow" then
        local Clock = os.clock() * EffectSpeed;
        local Color = Color3.fromHSV(math.abs(math.sin(Clock)), 1, 1);
        library:ChangeThemeOption("Accent", Color);
    elseif AccentEffect == "shift" then
        local ShiftOffset = 0;
        local Clock = os.clock() * EffectSpeed + ShiftOffset;
        ShiftOffset = ShiftOffset + 0;
        local Color = Color3.fromHSV(math.abs(math.sin(Clock)), 1, 1);
        library.flags.theme_accent = Color;
        library:ChangeThemeOption("Accent", Color);
    elseif AccentEffect == "reverse shift" then
        local ShiftOffset = 0;
        local Clock = os.clock() * EffectSpeed + ShiftOffset;
        ShiftOffset = ShiftOffset - 0;
        local Color = Color3.fromHSV(math.abs(math.sin(Clock)), 1, 1);
        library.flags.theme_accent = Color;
        library:ChangeThemeOption("Accent", Color);
    end;
end);

local settingsPage = window:new_page({name = "Settings"})
local settingsSection = settingsPage:new_section({
    name = "Configuration",
    size = "Fill"
})

settingsSection:new_seperator({name = "--- Risky Actions ---"})
settingsSection:new_button({
    name = "rejoin server",
    confirm = true,
    callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId);
    end
})
settingsSection:new_button({
    name = "copy join script",
    callback = function()
        setclipboard(("game:GetService(\"TeleportService\"):TeleportToPlaceInstance(%s, \"%s\")"):format(game.PlaceId, game.JobId));
        library:notify("Join script copied!", 2)
    end
});

settingsSection:new_seperator({name = "--- Theme Presets ---"})
local theme_tbl = {};
for i, v in next, theme do
    table.insert(theme_tbl, i);
end;
settingsSection:new_dropdown({
    name = "select theme:",
    flag = "theme_list",
    options = theme_tbl
});
settingsSection:new_button({
    name = "load theme",
    callback = function()
        library:SetTheme(theme[library.flags.theme_list]);
        for option, picker in next, theme_pickers do
            if theme[library.flags.theme_list][option] then
                picker:set(theme[library.flags.theme_list][option]);
            end
        end;
    end
});

library:Close();
