return {
	{
		"olimorris/codecompanion.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "gemini",
					},
					inline = {
						adapter = "gemini",
					},
					cmd = {
						adapter = "gemini",
					},
				},

				adapters = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								api_key = "cmd: cat ~/secrets/GEMINI_API_KEY",
								-- api_key = "cmd: gpg --batch --quiet --decrypt ~/secrets/GEMINI_API_KEY.gpg",
							},
						})
					end,
				},
			})

			vim.cmd([[cab ccc CodeCompanion]])
			vim.cmd([[cab cca CodeCompanionActions]])
			vim.cmd([[cab ccmd CodeCompanionChat]])
			vim.cmd([[cab cc CodeCompanionChat]])
		end,
	},
}
