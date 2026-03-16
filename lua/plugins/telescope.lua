return {
	"nvim-telescope/telescope.nvim",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "find files",
			mode = "n",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "live grep",
			mode = "n",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "search buffers",
			mode = "n",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "search help",
			mode = "n",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "search for string under cursor or selection",
			mode = { "n", "v" },
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").commands()
			end,
			desc = "Lists available pluggin/user commands",
			mode = "n",
		},
	},
}
