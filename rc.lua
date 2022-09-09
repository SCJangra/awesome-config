local awful = require("awful")
local naughty = require("naughty")

local terminal = "kitty"
local editor = "neovide"
local modkey = "Mod4"

awful.spawn.once("xrandr --output eDP-1 --mode 1920x1080 --rate 60")
awful.spawn.once("xrandr --output eDP-1 --off")
awful.spawn.once("xrandr --output HDMI-2 --mode 1920x1080 --rate 60")
awful.spawn.once("xset r rate 500 60")

naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)
