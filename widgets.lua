local client = client

local awful = require 'awful'
local wibox = require 'wibox'

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

M.dashboard = function(s)
  local margin = 200
  wibox {
    width = s.geometry.width - (margin * 2),
    height = s.geometry.height - (margin * 2),
    x = margin,
    y = margin,
    screen = s,
    visible = true,
    bg = '#00000000',
    widget = {
      layout = wibox.layout.align.horizontal,
      M.taglist(s),
    },
  }
end

return M
