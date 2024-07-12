local wezterm = require 'wezterm'
local config  = wezterm.config_builder()

--config.color_scheme = 'Snazzy'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16.0
config.colors = {
    foreground = 'silver',
    background = 'black',
    cursor_bg = '#f74d1e',
    cursor_fg = 'white',
    -- selection_fg = '',
    -- selection_bg = '',
    compose_cursor = 'green',
    tab_bar = {
        active_tab = {
            bg_color = '#f74d1e',
            fg_color = '#ffffff'
        }
    }
}
config.use_fancy_tab_bar = true
--config.window_background_image = '/Users/matthewnorth/Pictures/Backgrounds/Matrix Computer Illustration.jpg'
config.window_background_image_hsb ={
    brightness = 0.2,
    hue = 1.0,
    saturation = 1.0
}
config.window_background_opacity = 0.85
config.text_background_opacity = 1.0
config.window_decorations = "RESIZE"

config.window_frame = {
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },
    font_size = 15,
    active_titlebar_bg = '#333333',
    active_titlebar_fg = '#f74d1e',
    active_titlebar_border_bottom = '#f74d1e',
    --inactive_titlebar_bg = '#333333',
    --inactive_titlebar_fg = '#ffffff',
    --inactive_titlebar_border_bottom = '#ffffff',
    --button_fg = '#f74d1e',
    --button_bg = '#f74d1e',
}

--wezterm.on(
--    'format-tab-title',
--    function(tab, tabs, panes, config, hover, max_width)
--            return {
--                { Backgound = { Color = '#f74d1e' } },
--                { Forground = { Color = '#ffffff' } },
--                { Text = tab.tab_title },
--                { Backgound = { Color = '#f74d1e' } },
--                { Forground = { Color = '#ffffff' } },
--                { Text = tab.tab_title },
--                { Backgound = { Color = '#f74d1e' } },
--                { Forground = { Color = '#ffffff' } },
--                { Text = tab.tab_title },
--            }
--    end
--    )

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true


return config
