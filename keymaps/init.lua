local awesome = awesome
local client = client

local awful = require 'awful'
local spawn = awful.spawn
local map = awful.key

local opts = require 'opts'
local modkey = opts.modkey

local g = {
  launcher = 'LAUNCHER',
  client = 'CLIENT',
  awesome = 'AWESOME',
}

local global = {
  map({ modkey }, 'Return', function()
    spawn(opts.terminal)
  end, { description = 'launch terminal', group = g.launcher }),

  map({ modkey }, 'j', function()
    awful.client.focus.byidx(1)
  end, { description = 'focus next by index', group = g.client }),

  map({ modkey }, 'k', function()
    awful.client.focus.byidx(-1)
  end, { description = 'focus previous by index', group = g.client }),

  map({ modkey, 'Control' }, 'r', awesome.restart, { description = 'reload awesome', group = g.awesome }),

  map {
    modifiers = { modkey },
    keygroup = 'numrow',
    description = 'only view tag',
    group = 'tag',
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },

  map {
    modifiers = { modkey, 'Shift' },
    keygroup = 'numrow',
    description = 'move focused client to tag',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },
}

local client = {
  map({ modkey, 'Shift' }, 'c', function(c)
    c:kill()
  end, { description = 'close', group = g.client }),
}

return {
  global = global,
  client = client,
}
