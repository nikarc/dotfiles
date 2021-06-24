local awful 		= require("awful")
local wibox 		= require("wibox")
local gears 		= require("gears")
local keys  		= require("keys")
local beautiful     = require("beautiful")

local font_awesome_brands = "Font Awesome Brands 10"
local bar_font = "Agave Bold 8"
local bar_font_size = "smaller"
local bar_font_weight = "bold"
local bar_height = 30
local bar_margins = 20
local bar_opacity = 0.85
local bar_client_type = "dock"
local focused_color = x.color1
local blurred_color = x.color8
local arch_icon = ""
local temp_timer = 2

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
                    font = font_awesome_brands,
                    fg = focused_color,
                },
                widget = wibox.container.margin,
                forced_width = dpi(20),
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
    s.mybar = wibox {
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
        markup = "<span size=\""..bar_font_size.."\" weight=\""..bar_font_weight.."\">"..os.date(user.clock_format).."</span>",
        -- text = os.date("%I:%M %p"),
        -- format = user.clock_format,
        -- font = bar_font,
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
                markup = "<span foreground=\"#6EC1D6\">"..arch_icon.."</span>",
                widget = wibox.widget.textbox,
                font = font_awesome_brands,
                fg = x.color9,
                forced_width = 30,
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

    local temp_widget = awful.widget.watch(
        [[ bash -c "cat /sys/bus/platform/devices/coretemp.0/hwmon/hwmon4/temp1_input /sys/bus/platform/devices/coretemp.0/hwmon/hwmon4/temp2_input /sys/bus/platform/devices/coretemp.0/hwmon/hwmon4/temp3_input /sys/bus/platform/devices/coretemp.0/hwmon/hwmon4/temp4_input | awk '{print $1/1000}'" ]],
        temp_timer,
        function (widget, stdout)
            local output = ""
            local span_prefix = "<span size=\""..bar_font_size.."\" weight=\""..bar_font_weight.."\" foreground="

            for t in stdout:gmatch("[^\r\n]+") do
                local temp = tonumber(t)

                if temp > 65 then
                    output = output..span_prefix.."\"yellow\">"
                elseif temp > 80 then
                    output = output..span_prefix.."\""..x.color9.."\">"
                else
                    output = output..span_prefix.."\""..x.color12.."\">"
                end

                output = output..tostring(temp)
                output = output.."°C </span>"
            end

            widget:set_markup(output)
        end
    )

    local right_wrap = wibox.widget {
        -- widget 1
        temp_widget,
        -- widget 2
        wibox.widget.textbox(' | '),
        -- widget 3
        clock,
        -- layout for both
        layout = wibox.layout.align.horizontal
    }

    local alignment_box = wibox.widget {
        left = left_wrap,
        right = right_wrap,
        layout = wibox.layout.align.horizontal,
        widget = wibox.container.place
    }

    s.mybar:setup {
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

    awful.placement.top(s.mybar, { margins = {top = 10}, parent = s})

end)

client.connect_signal("property::fullscreen", function (c)
    c.screen.mybar.ontop = false
    -- c.raise()
end)
