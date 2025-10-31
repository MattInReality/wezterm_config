require("tabs")
local wezterm = require("wezterm")
local config = wezterm.config_builder()

local bg_opacity = 1
local base = "rgb(30,30,46)"

config.color_scheme = "Catppuccin Mocha"
config.font_dirs = { "~/Library/Fonts", "fonts" }
config.font = wezterm.font("JetBrains Mono")
config.font_size = 14
config.window_background_image_hsb = {
	brightness = 0.2,
	hue = 1.0,
	saturation = 1.0,
}
config.max_fps = 120

config.unix_domains = {
	{
		name = "unix",
	},
}

config.default_gui_startup_args = { "connect", "unix" }

config.keys = {
	{
		key = "d",
		mods = "SUPER|CMD|WIN",
		action = wezterm.action.SplitHorizontal,
	},
	{
		key = "D",
		mods = "SUPER|CMD|WIN",
		action = wezterm.action.SplitVertical,
	},
	{
		key = "]",
		mods = "SUPER|CMD|WIN",
		action = wezterm.action.ActivatePaneDirection("Next"),
	},
	{
		key = "[",
		mods = "SUPER|CMD|WIN",
		action = wezterm.action.ActivatePaneDirection("Prev"),
	},
	{
		key = "w",
		mods = "SUPER|CMD|WIN",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "Enter",
		mods = "SUPER|CMD|WIN",
		action = wezterm.action.TogglePaneZoomState,
	},
}

config.window_background_opacity = bg_opacity
config.text_background_opacity = 1.0
config.use_fancy_tab_bar = false
config.colors = {
	tab_bar = {
		background = base,
		inactive_tab_edge = "rgba(36,39,58,0.9)",
		new_tab = {
			bg_color = base,
			fg_color = "#eeeeee",
		},
	},
}

config.window_frame = {
	font = wezterm.font({ family = "Inter", weight = "Light" }),
	font_size = 16,
}

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "1.35cell",
	bottom = "1cell",
}

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.tab_max_width = 20
config.tab_bar_at_bottom = true

return config
