local awful = require 'awful'
local spawn = awful.spawn
local map = awful.key
local opts = require 'opts'

return {
  map({ opts.modkey }, 'Return', function()
    spawn(opts.terminal)
  end),

  map({ opts.modkey }, 'j', function()
    awful.client.focus.byidx(1)
  end, { description = 'focus next by index', group = 'CLIENT' }),

  map({ opts.modkey }, 'k', function()
    awful.client.focus.byidx(-1)
  end, { description = 'focus previous by index', group = 'CLIENT' }),
}
