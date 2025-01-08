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

wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local lavender = 'rgb(180, 190, 254)'
        local blue = 'rgb(137, 180, 250)'
        local title = tab_title(tab)
        title = wezterm.truncate_right(title, max_width -2)
        if tab.is_active and tab.tab_id == tabs[1].tab_id then
            if #(tabs) == 1 then
            return {
                {Background = { Color = blue }},
                {Foreground = { Color = '#ffffff' }},
                {Text = " "},
                {Background = { Color = blue }},
                {Foreground = { Color = 'rgba(255,255,255,1)' }},
                {Text = " " .. title .. " "},
                {Background = { Color =  'rgba(36,39,58,0.9)'}},
                {Foreground = { Color = blue}},
                {Text = LEFT_TRIANGLE },
            } else  return {
                {Background = { Color = blue }},
                {Foreground = { Color = '#ffffff' }},
                {Text = " "},
                {Background = { Color = blue }},
                {Foreground = { Color = 'rgba(255,255,255,1)' }},
                {Text = " " .. title .. " "},
                {Background = { Color = lavender}},
                {Foreground = { Color = blue}},
                {Text = LEFT_TRIANGLE },
            }end
        elseif tab.is_active and tab.tab_id == tabs[#tabs].tab_id  then
            return {
                {Background = { Color = lavender }},
                {Foreground = { Color = blue }},
                {Text = RIGHT_TRIANGLE},
                {Background = { Color = blue }},
                {Foreground = { Color = 'rgba(255,255,255,1)' }},
                {Text = " " .. title .. " "},
                {Background = { Color = 'rgba(36,39,58,0.9)'}},
                {Foreground = { Color = blue}},
                {Text = LEFT_TRIANGLE },
            }
        elseif tab.is_active then
            return {
                {Background = { Color = lavender }},
                {Foreground = { Color = blue }},
                {Text = RIGHT_TRIANGLE},
                {Background = { Color = blue }},
                {Foreground = { Color = 'rgba(255,255,255,1)' }},
                {Text = " " .. title .. " "},
                {Background = { Color = lavender}},
                {Foreground = { Color = blue}},
                {Text = LEFT_TRIANGLE },
            }
        elseif not tab.is_active and tab.tab_id == tabs[#tabs].tab_id then
        return {
                {Background = { Color = blue }},
                {Foreground = { Color = lavender }},
                {Text = "" },
                {Background = { Color = lavender }},
                {Foreground = { Color = 'rgba(255,255,255,1)' }},
                {Text = " " .. title .. " "},
                {Background = { Color =  'rgba(36,39,58,0.9)'}},
                {Foreground = { Color = lavender}},
                {Text = LEFT_TRIANGLE },
            }
        elseif not tab.is_active and tab.tab_id == tabs[1].tab_id then
        return {
                {Background = { Color = lavender }},
                {Foreground = { Color = lavender }},
                {Text = " "},
                {Background = { Color = lavender }},
                {Foreground = { Color = 'rgba(255,255,255,1)' }},
                {Text = " " .. title .. " "},
                {Background = { Color =  lavender}},
                {Foreground = { Color = blue}},
                {Text = "" },
            }
        else return {
                {Background = { Color = blue }},
                {Foreground = { Color = lavender }},
                {Text = "" },
                {Background = { Color = lavender }},
                {Foreground = { Color = 'rgba(255,255,255,1)' }},
                {Text = " " .. title .. " "},
                {Background = { Color = lavender}},
                {Foreground = { Color = lavender}},
                {Text = LEFT_TRIANGLE },
            }
        end
    end
)

return {}
