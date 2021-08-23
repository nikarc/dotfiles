local awful 		            = require("awful")
local wibox 		            = require("wibox")
local gears 		            = require("gears")
local keys  		            = require("keys")
local beautiful                 = require("beautiful")
local setup_text_weather        = require("noodle/text_weather")

local font_awesome_brands = "Font Awesome Brands 12"
local bar_font = "Agave Bold 6"
local bar_font_size = "smaller"
local bar_font_weight = "bold"
local bar_height = 30
local bar_margins = 18
local bar_opacity = 0.85
local bar_client_type = "dock"
local focused_color = x.color1
local blurred_color = x.color8
local arch_icon = ""
local temp_timer = 2
local temp_format = 'average' -- average | all
local cpu_core_count = 4

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
        font = bar_font,
        ontop = true,
        height = bar_height,
        width = screen_width - 20,
        opacity = 1,
        type = bar_client_type,
    }

    local clock = wibox.widget {
        -- markup = "<span size=\""..bar_font_size.."\" weight=\""..bar_font_weight.."\">"..os.date("%I:%M %p").."</span>",
        -- text = os.date("%I:%M %p"),
        format = "%b %d - %I:%M %p",
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

    function temp_color_mapper(temp)
        if temp > 65 then
            return "yellow"
        elseif temp > 80 then
            return x.color9
        else
            return x.color12
        end
    end

    local temp_widget = awful.widget.watch(
        -- [[ bash -c "sensors | awk '/Package id 0/' | sed -e 's/^Package id 0:\\s*+\\(.*\\)(.*)/\1/g'" ]],
        [[ bash -c "sensors | awk '/Tdie/' | sed -e 's/^Tdie:\\s*+\\(.*\\)(.*)/\1/g'" ]],
        temp_timer,
        function (widget, stdout)
            -- widget:set_text(stdout)
            local temp_digits = stdout:gsub('[^0-9\\.]', '')
            local temp_number = tonumber(temp_digits)
            local temp_color = x.color12

            if temp_number > 65 then
                temp_color = "yellow"
            elseif temp_number > 80 then
                temp_color = x.color9
            end

            local icon = string.format("<span font='icomoon 6' foreground='%s'> </span>", temp_color)
            local text = '<span size="x-small" weight="'..bar_font_weight..'" foreground="'..temp_color..'">'..icon..stdout..'</span>'

            widget:set_markup(text)

            -- widget:set_markup(
            --     string.format(
            --         '<span size="x-small" weight="%s" foreground="%s">%s%s</span>',
            --         bar_font_weight,
            --         temp_color,
            --         icon,
            --         stdout
            --     )
            -- )
        end
    )

    -- Toggle between temp average and all cores on widget mouse click
    temp_widget:connect_signal("button::press", function(c)
        if temp_format == "all" then
            temp_format = "average"
        else
            temp_format = "all"
        end
    end)


    local weather = setup_text_weather('typicons 8')
    local temp_wrap = wibox.widget {
        {
            temp_widget,
            wibox.widget.textbox(' | '),
            weather,
            layout = wibox.layout.align.horizontal,
        },
        widget = wibox.container.place,
    }

    local right_wrap = wibox.widget {
        -- widget 1
        temp_wrap,
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
                top = bar_margins * 0.25,
                bottom = bar_margins * 0.25,
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
