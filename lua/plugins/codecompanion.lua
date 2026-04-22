local plugin = {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion" },
		{ "<leader>ca", "<cmd>CodeCompanion<cr>", desc = "Ask CodeCompanion", mode = { "n", "v" } },
	},
	opts = {
		adapters = {
			gemini = function()
				return require("codecompanion.adapters").extend("gemini", {
					env = { api_key = "GEMINI_API_KEY" },
				})
			end,
		},
		interactions = {
			chat = { adapter = "gemini" },
			inline = { adapter = "gemini" },
			cli = {
				agent = "gemini_cli",
				agents = {
					gemini_cli = {
						cmd = "gemini",
						args = {},
						description = "Gemini CLI",
						provoder = "terminal",
					},
				},
			},
		},
		opts = {
			log_level = "DEBUG",
		},
	},
}
return plugin
