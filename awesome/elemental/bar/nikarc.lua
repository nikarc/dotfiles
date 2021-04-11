local awful 		= require("awful")
local wibox 		= require("wibox")
local gears 		= require("gears")
local keys  		= require("keys")
local beautiful     = require("beautiful")

local bar_font = "Agave Bold 12"
local bar_height = 30
local bar_margins = 20

local update_taglist = function (item, tag, index)
    if tag.selected then
        item.bg = beautiful.taglist_text_color_focused[index]
    elseif tag.urgent then
        item.bg = beautiful.taglist_text_color_urgent[index]
    elseif #tag:clients() > 0 then
        item.bg = beautiful.taglist_text_color_occupied[index]
    else
        item.bg = beautiful.taglist_text_color_empty[index]
    end
end

awful.screen.connect_for_each_screen(function(s)
    s.padding = { top = 35 }

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = keys.taglist_buttons,
        layout = {
            spacing = 10,
            spacing_widget = {
                color  = '#00ff00',
                shape  = gears.shape.circle,
                widget = wibox.widget.separator,
            },
            layout = wibox.layout.flex.horizontal,
        },
        widget_template = {
            {
                {
                    id = "icon_role",
                    widget = wibox.widget.imagebox,
                },
                margins = 2,
                widget = wibox.container.margin,
            },
            widget = wibox.container.background,
            create_callback = function(self, tag, index, _)
                update_taglist(self, tag, index)
            end,
            update_callback = function(self, tag, index, _)
                update_taglist(self, tag, index)
            end,
        }
    }

    local screen_width = s.geometry.width

    -- Containing box
    local mybar = wibox {
        visible = true,
        fg = x.color8,
        bg = "#0000",
        ontop = true,
        height = bar_height,
        width = screen_width - 20,
        opacity = 1,
        type = "dock",
    }

    -- mybar:set_bg("#0000")

    -- local button = wibox.widget{
    --     text = "I'm a button!",
    --     widget = wibox.widget.textbox
    -- }

    local clock = wibox.widget {
        text = os.date("%I:%M %p"),
        font = bar_font,
        color = x.foreground,
        widget = wibox.widget.textbox
    }

    mybar:setup {
        {
            {
                {
                    s.mytaglist,
                    clock,
                    layout = wibox.layout.align.horizontal,
                },
                top = bar_margins * 0.45,
                bottom = bar_margins * 0.45,
                left = bar_margins,
                right = bar_margins,
                widget= wibox.container.margin,
            },
            widget = wibox.container.background,
            shape = gears.shape.rounded_bar,
            bg = x.background,
        },
        -- widget = wibox.container.background,
        valign = 'center',
        content_fill_horizontal = true,
        layout = wibox.container.place,
    }

    awful.placement.top(mybar, { margins = {top = 10}, parent = s})

end)
