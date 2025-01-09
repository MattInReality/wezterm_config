require("tabs")
local wezterm = require 'wezterm'
local config  = wezterm.config_builder()

local bg_opacity = 0.90

config.color_scheme = 'Catppuccin Macchiato'
config.font_dirs = {'~/Library/Fonts', 'fonts'}
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16.0
config.window_background_image_hsb ={
    brightness = 0.2,
    hue = 1.0,
    saturation = 1.0
}

config.window_background_opacity = bg_opacity
config.text_background_opacity = 1.0
config.use_fancy_tab_bar = false
config.colors = {
    tab_bar = {
        background = 'rgba(36,39,58,0.9)',
        inactive_tab_edge = 'rgba(36,39,58,0.9)',
        new_tab = {
            bg_color = 'rgba(36,39,58,0.9)',
            fg_color = '#eeeeee',
        },
    },
}


config.window_frame = {
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },
    font_size = 16,
}

config.window_padding = {
    left = 0,
    right = 0,
    top = 25,
    bottom = 0,
}


config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.tab_max_width = 20
config.tab_bar_at_bottom = true

return config
