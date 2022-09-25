local screen = screen

local M = {}

local wallpapers = {}
local w_len = 0
local w_index = 1
local path = '/run/media/scj/Storage/wallpapers'
local command = 'fd -tf . ' .. path

local awful = require 'awful'
local gears = require 'gears'

local timer = gears.timer {
  timeout = 600,
  callback = function()
    w_index = math.random(1, w_len)
    gears.wallpaper.maximized(wallpapers[w_index], awful.screen.focused())
  end,
}

awful.spawn.with_line_callback(command, {
  stdout = function(w)
    table.insert(wallpapers, w)
  end,
  output_done = function()
    w_len = #wallpapers
    timer:start()
    screen.connect_signal('request::wallpaper', function(s)
      gears.wallpaper.maximized(wallpapers[w_index], s)
    end)
  end,
})

M.next_random = function()
  w_index = math.random(1, w_len)
  gears.wallpaper.maximized(wallpapers[w_index], awful.screen.focused())
end

return M
