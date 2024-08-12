local wezterm = require("wezterm")
local config = {}

-- config.color_scheme = 'Batman'
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 16

-- Fix (curly) brackets on non-qwerty keyboards
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

return config
