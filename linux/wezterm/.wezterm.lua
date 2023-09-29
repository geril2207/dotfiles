local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = 500 })
config.font_size = 15.0
config.window_background_opacity = 0.9
config.bold_brightens_ansi_colors = false
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.color_scheme = "Tango (terminal.sexy)"

config.window_background_gradient = {
	colors = {
		"#181825",
		-- "#1e2030",
	},
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.keys = {
	{
		key = "c",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local sel = window:get_selection_text_for_pane(pane)
			if not sel or sel == "" then
				window:perform_action(wezterm.action.SendKey({ key = "c", mods = "CTRL" }), pane)
			else
				window:perform_action(wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }), pane)
			end
		end),
	},
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
}

config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

return config
