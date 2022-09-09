package.path = '/home/scj/.config/awesome/?.lua;/home/scj/.config/awesome/?/init.lua;' .. package.path

local screen = screen
local tag = tag
local client = client

require 'awful.autofocus'
require 'awful.hotkeys_popup.keys'

local awful = require 'awful'
local naughty = require 'naughty'
local keymaps = require 'keymaps'

awful.spawn.once 'xrandr --output eDP-1 --mode 1920x1080 --rate 60'
awful.spawn.once 'xrandr --output eDP-1 --off'
awful.spawn.once 'xrandr --output HDMI-2 --mode 1920x1080 --rate 60'
awful.spawn.once 'xset r rate 500 60'

tag.connect_signal('request::default_layouts', function()
  awful.layout.append_default_layouts {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
  }
end)

naughty.connect_signal('request::display_error', function(message, startup)
  naughty.notification {
    urgency = 'critical',
    title = 'Oops, an error happened' .. (startup and ' during startup!' or '!'),
    message = message,
  }
end)

screen.connect_signal('request::desktop_decoration', function(s)
  -- Each screen has its own tag table.
  awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, s, awful.layout.layouts[1])

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
  }
end)

awful.keyboard.append_global_keybindings(keymaps.global)
