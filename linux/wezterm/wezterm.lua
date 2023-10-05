local wezterm = require("wezterm")

return {
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = 400 }),
	font_size = 15.0,
	window_background_opacity = 0.8,
	bold_brightens_ansi_colors = false,
	enable_tab_bar = false,
	window_decorations = "NONE",
	color_scheme = "Tango (terminal.sexy)",
	-- adjust_window_size_when_changing_font_size = false,

	colors = {
		cursor_bg = "white",
		cursor_border = "white",
	},

	-- window_background_gradient = {
	-- 	colors = {
	-- 		"#181825",
	-- 		-- "#1e2030",
	-- 	},
	-- },

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	keys = {
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
	},
}
