local wezterm = require 'wezterm'

local LEFT_TRIANGLE = wezterm.nerdfonts.ple_lower_left_triangle
local RIGHT_TRIANGLE = wezterm.nerdfonts.ple_upper_right_triangle

local function tab_title(tab_info)
    local title = tab_info.tab_title
    if title and #title > 0 then
        return title
    end
    return tab_info.active_pane.title
end

local function active_tab_index(tabs)
    for i, tab in ipairs(tabs) do
        if tab.is_active then
            return tab.tab_index
        end
    end
    return -1
end


wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local function other_color(color_one, color_two)
            return function(color)
                if color == color_one then
                    return color_two
                else return color_one
                end
            end
        end

        local ati = active_tab_index(tabs)
        local lavender = 'rgb(180, 190, 254)'
        local rosewater = 'rbg(245,244,220)'
        local flamingo = 'rbg(242,205,205)'
        local green = 'rgb(166,227,161)'
        local saphire = 'rgb(116,199,236)'
        local blue = 'rgb(137, 180, 250)'
        local text = 'rgb(205,214,244)'
        local subtext1 = 'rgb(186,194,222)'
        local subtext0 = 'rgb(166,173,200)'
        local surface2 = 'rgb(91, 96, 120)'
        local surface0 = 'rgb(49,50,68)'
        local base = 'rgb(30,30,46,0.9)'
        local bar_color = base
        local title = tab_title(tab)
        local active_color = lavender
        local inactive_color = surface2
        local tab_color = inactive_color
        local text_color = subtext1
        local left = LEFT_TRIANGLE
        local right = RIGHT_TRIANGLE
        local head_text = right
        local tail_text = left
        local other = other_color(active_color, inactive_color)
        local head_bg_color = tab_color
        local head_fg_color = tab_color
        local tail_bg_color = tab_color
        local tail_fg_color = tab_color
        title = wezterm.truncate_right(title, max_width -2)
        if tab.tab_index - ati  == 1 then
            head_bg_color = tab_color
        elseif tab.tab_index - ati == -1 then
            tail_bg_color = other(tab_color)
        end
        if tab.is_active then
            tab_color = active_color
            tail_fg_color = tab_color
            head_bg_color = tab_color
            head_fg_color = tab_color
            text_color = surface0
        end
        if tab.tab_index == 0 then
            head_text = "  "
            head_bg_color = tab_color
            head_fg_color = tab_color
        end
        if tab.tab_index == #tabs-1 then
            tail_bg_color = bar_color
        end
        return {
                {Background = { Color = head_bg_color }},
                {Foreground = { Color = head_fg_color }},
                {Text = head_text},
                {Background = { Color = tab_color }},
                {Foreground = { Color = text_color }},
                {Text = " " .. title .. "  "},
                {Background = { Color = tail_bg_color}},
                {Foreground = { Color = tail_fg_color}},
                {Text = tail_text },
            }
        end
)

return {}
