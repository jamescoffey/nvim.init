local plugin = {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"viespejo/cc-adapter-gemini-code-assist.nvim",
	},
	keys = {
		{ "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion" },
		{ "<leader>ca", "<cmd>CodeCompanion<cr>", desc = "Ask CodeCompanion", mode = { "n", "v" } },
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				gemini_code_assist = function()
					return require("codecompanion.adapters").extend("gemini-code-assist", {
						env = { project_id = "project-sapphiros" },
					})
				end,
			},
			interactions = {
				chat = { adapter = "gemini_code_assist" },
				inline = { adapter = "gemini_code_assist" },
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
		})
	end,
}
return plugin
