local plugin = {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	keys = {
		{
			"<leader>qs",
			function()
				require("persistence").load()
			end,
			desc = "Load session",
		},
		{
			"<leader>qS",
			function()
				require("persistence").select()
			end,
			desc = "select session",
		},
		{
			"<leader>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Load last session",
		},
		{
			"<leader>qd",
			function()
				require("persistence").stop()
			end,
			desc = "stop persistence",
		},
	},
	opts = {
		-- add any custom options here
	},
}
return plugin
