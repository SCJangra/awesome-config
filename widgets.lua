local client = client

local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'

local opts = require 'opts'
local modkey = opts.modkey

local M = {}

M.taglist = function(s)
  return awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),

      awful.button({ modkey }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),

      awful.button({}, 3, awful.tag.viewtoggle),

      awful.button({ modkey }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),

      awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
      end),

      awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
      end),
    },
  }
end

M.systray = function()
  return wibox.container.margin(wibox.widget.systray(), 0, beautiful.margin, beautiful.margin, beautiful.margin)
end

M.bar = function(s)
  return awful.wibar {
    screen = s,
    position = 'bottom',
    ontop = true,
    widget = {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        M.taglist(s),
      },
      nil,
      {
        layout = wibox.layout.fixed.horizontal,
        require 'widgets.textclock'(),
        M.systray(),
      },
    },
  }
end

return M
