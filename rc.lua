package.path = '/home/scj/.config/awesome/?.lua;/home/scj/.config/awesome/?/init.lua;' .. package.path

local screen = screen
local tag = tag
local client = client

require 'awful.autofocus'

local awful = require 'awful'
local naughty = require 'naughty'
local ruled = require 'ruled'
local beautiful = require 'beautiful'
local gears = require 'gears'

local maps = require 'maps'
local widgets = require 'widgets'
local rules = require 'rules'

awful.spawn.once 'xrandr --output eDP-1 --off'
awful.spawn.once 'xrandr --output HDMI-2 --mode 1920x1080 --rate 60'
awful.spawn.once 'xset r rate 500 60'
awful.spawn.once 'picom --experimental-backend'
awful.spawn.once 'lxqt-policykit-agent'

-- Theme
beautiful.init(gears.filesystem.get_configuration_dir() .. 'theme.lua')

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

  s.bar = widgets.bar(s)
end)

-- Bindings
awful.keyboard.append_global_keybindings(maps.key.global)
client.connect_signal('request::default_keybindings', function()
  awful.keyboard.append_client_keybindings(maps.key.client)
end)
client.connect_signal('request::default_mousebindings', function()
  awful.mouse.append_client_mousebindings(maps.mouse.client)
end)

-- Rules
ruled.client.connect_signal('request::rules', function()
  ruled.client.append_rules {
    rules.all,
  }
end)
