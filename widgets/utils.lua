local wibox = require 'wibox'
local beautiful = require 'beautiful'

local M = {}

function M.style_wibar_widget(widget)
  return wibox.widget {
    widget = wibox.container.margin,
    right = beautiful.margin,
    top = beautiful.margin,
    bottom = beautiful.margin,
    {
      widget = wibox.container.background,
      bg = beautiful.bg_focus,
      {
        widget = wibox.container.margin,
        left = beautiful.margin,
        right = beautiful.margin,
        widget,
      },
    },
  }
end

return M
