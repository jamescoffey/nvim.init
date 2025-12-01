local plugins = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		triggers = { "<leader>/" }, -- Define the trigger for which-key
	},
	keys = {
		{
			"<leader>/",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
return plugins
