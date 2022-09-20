local client = client

local awful = require 'awful'
local wibox = require 'wibox'

local opts = require 'opts'
local modkey = opts.modkey

local taglist = function(s)
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

local dashboard = function(s)
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
      taglist(s),
    },
  }
end

return {
  taglist = taglist,
  dashboard = dashboard,
}
