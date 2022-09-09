local awesome = awesome

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
}

return {
  global = global,
}
