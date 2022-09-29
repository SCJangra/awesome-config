local mouse = mouse

local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'

local wutils = require 'widgets.utils'

local props = {
  focus = {
    bg = beautiful.bg_focus,
    markup = function(t)
      return '<b>' .. t .. '</b>'
    end,
    margins = beautiful.margin,
  },

  header = {
    bg = beautiful.bg_focus,
    markup = function(t)
      return '<b>' .. t .. '</b>'
    end,
  },

  normal = {
    margins = beautiful.margin,
  },

  weekday = {
    margins = beautiful.margin,
    markup = function(t)
      return '<b>' .. t .. '</b>'
    end,
  },

  weeknumber = {
    margins = beautiful.margin,
    bg = beautiful.base0F .. beautiful.alpha,
    markup = function(t)
      return '<b>' .. t .. '</b>'
    end,
  },
}

local calendar_popup = awful.popup {
  ontop = true,
  visible = false,
  x = 0,
  y = 0,
  widget = {
    date = os.date '*t',
    spacing = 0,
    week_numbers = true,
    widget = wibox.widget.calendar.month,
    fn_embed = function(widget, flag, _)
      local p = props[flag]

      if not p then
        return widget
      end

      if p.markup and widget.get_text and widget.set_markup then
        widget:set_markup(p.markup(widget:get_text()))
      end

      if p.margins then
        widget = wibox.container.margin(widget, p.margins, p.margins, p.margins, p.margins)
      end

      return wibox.widget {
        widget = wibox.container.background,
        bg = p.bg or nil,
        widget,
      }
    end,
  },
}

local textclock = function()
  local clock = wibox.widget.textclock '%H : %M'
  clock.c = calendar_popup

  clock:connect_signal('mouse::enter', function()
    clock.c.widget.date = os.date '*t'

    awful.placement.next_to(clock.c, {
      mode = 'geometry',
      preferred_positions = { 'top' },
      preferred_anchors = { 'middle' },
      geometry = mouse.current_widget_geometry,
    })
    clock.c.visible = true
  end)

  clock:connect_signal('mouse::leave', function()
    clock.c.visible = false
  end)

  return wutils.style_wibar_widget(clock)
end

return textclock
