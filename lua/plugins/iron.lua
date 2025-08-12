local plugins = {
	"Vigemus/iron.nvim",
	config = function()
		local iron = require("iron.core")
		iron.setup({
			config = {
				scratch_repl = true,
				repl_definition = {
					sh = {
						command = { "zsh" },
					},
					python = {
						command = { "ipython" }, -- or { "ipython", "--no-autoindent" }
						format = require("iron.fts.common").bracketed_paste_python,
					},
				},
				repl_open_cmd = require("iron.view").split.botright("40%"),
			},
			keymaps = {
				send_motion = "<LocalLeader>sc",
				visual_send = "<LocalLeader>sc",
				send_file = "<LocalLeader>sf",
				send_line = "<LocalLeader>sl",
				send_paragraph = "<LocalLeader>sp",
				send_until_cursor = "<LocalLeader>su",
				send_mark = "<LocalLeader>sm",
				mark_motion = "<LocalLeader>mc",
				mark_visual = "<LocalLeader>mc",
				remove_mark = "<LocalLeader>md",
				cr = "<LocalLeader>s<cr>",
				interrupt = "<LocalLeader>s<space>",
				exit = "<LocalLeader>sq",
				clear = "<LocalLeader>cl",
			},
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true,
		})

		-- iron also has a list of commands, see :h iron-commands for all available commands
		vim.keymap.set("n", "<LocalLeader>rs", "<cmd>IronRepl<cr>")
		vim.keymap.set("n", "<LocalLeader>rr", "<cmd>IronRestart<cr>")
		vim.keymap.set("n", "<LocalLeader>rf", "<cmd>IronFocus<cr>")
		vim.keymap.set("n", "<LocalLeader>rh", "<cmd>IronHide<cr>")
	end,
}
return plugins
