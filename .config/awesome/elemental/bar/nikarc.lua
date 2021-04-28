local awful 		= require("awful")
local wibox 		= require("wibox")
local gears 		= require("gears")
local keys  		= require("keys")
local beautiful     = require("beautiful")

local bar_font = "Agave Bold 12"
local bar_height = 30
local bar_margins = 20
local bar_opacity = 0.85
local bar_client_type = "dock"
local focused_color = x.color1
local blurred_color = x.color8
local arch_icon = ""

local update_taglist = function (item, tag, index)
    if tag.selected then
        item.fg = focused_color
    else
        item.fg = blurred_color
        -- item.bg = beautiful.taglist_text_color_focused[index]
    -- elseif tag.urgent then
    --     item.bg = beautiful.taglist_text_color_urgent[index]
    -- elseif #tag:clients() > 0 then
    --     item.bg = beautiful.taglist_text_color_occupied[index]
    -- else
    --     item.bg = beautiful.taglist_text_color_empty[index]
    end
end

awful.screen.connect_for_each_screen(function(s)
    s.padding = { top = 35 }

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = keys.taglist_buttons,
        layout = {
            spacing = 5,
            spacing_widget = {
                color  = '#00ff00',
                shape  = gears.shape.circle,
                widget = wibox.widget.separator,
            },
            content_fill_horizontal = false,
            layout = wibox.layout.flex.horizontal,
        },
        widget_template = {
            {
                {
                    id = "text_role",
                    widget = wibox.widget.textbox,
                    font = "Font Awesome Brands 12",
                    fg = focused_color,
                },
                widget = wibox.container.margin,
                forced_width = dpi(30),
                left = 5,
                right = 5,
            },
            id = "background_role",
            widget = wibox.container.background,
            -- create_callback = function(self, tag, index, _)
            --     update_taglist(self, tag, index)
            -- end,
            -- update_callback = function(self, tag, index, _)
            --     update_taglist(self, tag, index)
            -- end,
        }
    }

    local screen_width = s.geometry.width

    -- Containing box
    local mybar = wibox {
        visible = true,
        fg = x.color15,
        bg = "#0000",
        ontop = true,
        height = bar_height,
        width = screen_width - 20,
        opacity = 1,
        type = bar_client_type,
    }

    local clock = wibox.widget {
        -- text = os.date("%I:%M %p"),
        format = user.clock_format,
        font = bar_font,
        color = x.foreground,
        widget = wibox.widget.textclock
    }

    local tag_list_wrap = wibox.widget {
        s.mytaglist,
        widget = wibox.container.background,
        shape = gears.shape.rounded_bar,
        bg = x.color11
    }

    local left_wrap = wibox.widget {
        {
            {
                text = arch_icon,
                widget = wibox.widget.textbox,
                fg = x.color1, 
                forced_width = 16,
            },
            {
                right = 24,
                widget = wibox.container.margin,
            },
            layout = wibox.layout.fixed.horizontal,
        },
        tag_list_wrap,
        layout = wibox.layout.align.horizontal
    }

    local alignment_box = wibox.widget {
        left = left_wrap,
        right = clock,
        layout = wibox.layout.align.horizontal,
        widget = wibox.container.place
    }

    mybar:setup {
        {
            {
                alignment_box,
                top = bar_margins * 0.45,
                bottom = bar_margins * 0.45,
                left = bar_margins,
                right = bar_margins,
                widget= wibox.container.margin,
            },
            widget = wibox.container.background,
            shape = gears.shape.rounded_bar,
            bg = x.background,
            opacity = bar_opacity,
        },
        -- widget = wibox.container.background,
        valign = 'center',
        content_fill_horizontal = true,
        layout = wibox.container.place,
    }

    awful.placement.top(mybar, { margins = {top = 10}, parent = s})

end)
