local theme_assets = require 'beautiful.theme_assets'
local xresources = require 'beautiful.xresources'
local dpi = xresources.apply_dpi

local theme = {}
theme.base00 = '#1e222a'
theme.base01 = '#353b45'
theme.base02 = '#3e4451'
theme.base03 = '#545862'
theme.base04 = '#565c64'
theme.base05 = '#abb2bf'
theme.base06 = '#b6bdca'
theme.base07 = '#c8ccd4'
theme.base08 = '#e06c75'
theme.base09 = '#d19a66'
theme.base0A = '#e5c07b'
theme.base0B = '#98c379'
theme.base0C = '#56b6c2'
theme.base0D = '#61afef'
theme.base0E = '#c678dd'
theme.base0F = '#be5046'

theme.alpha = 'AF'
theme.margin = 4

-- General
theme.font = 'IosevkaSCJ Nerd Font 12'
theme.bg_normal = theme.base01 .. theme.alpha
theme.bg_focus = theme.base00 .. theme.alpha
theme.fg_normal = theme.base07

-- Systray
theme.bg_systray = theme.base00

-- Taglist
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Calendar
theme.calendar_font = theme.font

return theme
