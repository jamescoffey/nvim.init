local plugins = {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = false,
					auto_refresh = false,
					keymap = {
						accept = "<M-CR>",
						jump_prev = "[[",
						jump_next = "]]",
						refresh = "gr",
						open = "<M-CR>",
					},
				},
				suggestion = {
					--				enabled = false,
					auto_trigger = false,
					keymap = {
						accept = "<M-l>",
						prev = "<M-[>",
						next = "<M-]>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					tex = false,
					latex = false,
					csv = false,
					svn = false,
					gitcommit = false,
					help = false,
					gitrebase = false,
				},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
return plugins
