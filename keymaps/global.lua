local awful = require 'awful'
local spawn = awful.spawn
local map = awful.key
local opts = require 'opts'

return {
  map({ opts.modkey }, 'Return', function()
    spawn(opts.terminal)
  end),
}
