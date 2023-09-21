local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = 500 })
config.font_size = 15
config.window_background_opacity = 0.6
config.enable_tab_bar = false
config.window_decorations = "NONE"

config.colors = {
	cursor_bg = "white",
}

return config
