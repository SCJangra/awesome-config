local awesome = awesome

local awful = require 'awful'
local spawn = awful.spawn
local map = awful.key
local opts = require 'opts'
local groups = opts.groups
local utils = require 'utils'
local cg = utils.concat_groups

local group = 'GLOBAL'

return {
  map({ opts.modkey }, 'Return', function()
    spawn(opts.terminal)
  end, { description = 'launch terminal', group = cg(group, opts.groups.launcher) }),

  map({ opts.modkey }, 'j', function()
    awful.client.focus.byidx(1)
  end, { description = 'focus next by index', group = cg(group, groups.client) }),

  map({ opts.modkey }, 'k', function()
    awful.client.focus.byidx(-1)
  end, { description = 'focus previous by index', group = cg(group, groups.client) }),

  map(
    { opts.modkey, 'Control' },
    'r',
    awesome.restart,
    { description = 'reload awesome', group = cg(group, groups.awesome) }
  ),
}
