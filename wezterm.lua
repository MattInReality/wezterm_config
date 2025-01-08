require("tabs")
local wezterm = require 'wezterm'
local config  = wezterm.config_builder()

local bg_opacity = 0.90

local CIRCLE_CHAR = wezterm.nerdfonts.cod_circle_filled


config.color_scheme = 'Catppuccin Macchiato'
config.font_dirs = {'~/Library/Fonts', 'fonts'}
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16.0
config.window_background_image_hsb ={
    brightness = 0.2,
    hue = 1.0,
    saturation = 1.0
}

--[[
the tab_bar settings below still work with fancy bar. The window frame settings
are fancybar specific.
]]--
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
        --[[
        active_tab = {
            bg_color = 'rgba(138,173,244,1)',
            fg_color = 'rgba(255,255,255,0.6)',
            intensity = 'Normal',
        },
        inactive_tab = {
            bg_color = 'rgba(180, 190, 254, 1)',
            fg_color = '#ffffff',
            intensity = 'Half',
        },
        ]]--
    },
}


config.window_frame = {
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },
    font_size = 16,
    --[[
    active_titlebar_bg = 'rgba(36,39,58,0.9)',
    active_titlebar_fg = 'rgba(36,39,58,0.9)',
    --active_titlebar_border_bottom = '#f74d1e',
    inactive_titlebar_bg = 'rgba(36,39,58,0.9)',
    inactive_titlebar_fg = 'rgba(36,39,58,0.9)',
    --inactive_titlebar_border_bottom = '#ffffff',
    button_fg = 'rgba(36,39,58,0.9)',
    --button_bg = '#f74d1e',
    ]] --
}


config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.window_decorations = "RESIZE"

return config
