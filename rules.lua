local awful = require 'awful'

local rules = {}

rules.all = {
  properties = {
    focus = awful.client.focus.filter,
    raise = true,
    screen = awful.screen.preferred,
    placement = awful.placement.no_overlap + awful.placement.no_offscreen,
  },
}

return rules
