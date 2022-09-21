local awesome = awesome
local client = client

local awful = require 'awful'
local spawn = awful.spawn
local map = awful.key

local opts = require 'opts'
local modkey = opts.modkey

local M = {}

local g = {
  launcher = 'LAUNCHER',
  client = 'CLIENT',
  awesome = 'AWESOME',
}

M.key = {}
M.key.global = {
  map({ modkey }, 'Return', function()
    spawn(opts.terminal)
  end, { description = 'launch terminal', group = g.launcher }),

  map({ modkey, 'Shift' }, 'Return', function()
    spawn 'neovide'
  end, { description = 'launch neovide', group = g.launcher }),

  map({ modkey }, 'j', function()
    awful.client.focus.byidx(1)
  end, { description = 'focus next by index', group = g.client }),

  map({ modkey }, 'k', function()
    awful.client.focus.byidx(-1)
  end, { description = 'focus previous by index', group = g.client }),

  map({ modkey }, 'r', awesome.restart, { description = 'reload awesome', group = g.awesome }),

  map({ modkey }, 'q', awesome.quit, { description = 'quit awesome', group = g.awesome }),

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

  map({ modkey }, 'p', function()
    spawn 'rofi -show drun -modi drun -theme /home/scj/.config/rofi/blurry.rasi'
  end, {
    description = 'show launcher',
    group = g.launcher,
  }),

  map({ modkey }, 'z', function()
    spawn 'rofi-pass'
  end, { description = 'show passwords' }),

  map({ modkey, 'Shift' }, 'z', function()
    spawn 'rofi-pass --insert'
  end, {
    description = 'show passwords',
  }),
}
M.key.client = {
  map({ modkey, 'Shift' }, 'c', function(c)
    c:kill()
  end, { description = 'close', group = g.client }),

  map({ modkey }, 'm', function(c)
    c.floating = not c.floating
    c.maximized = not c.maximized
  end, { description = '(un)maximize', group = g.client }),
}

M.mouse = {}
M.mouse.client = {
  awful.button({}, 1, function(c)
    c:activate { context = 'mouse_click' }
  end),

  awful.button({ modkey }, 1, function(c)
    c:activate { context = 'mouse_click', action = 'mouse_move' }
  end),

  awful.button({ modkey }, 3, function(c)
    c:activate { context = 'mouse_click', action = 'mouse_resize' }
  end),
}

return M
