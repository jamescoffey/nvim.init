local plugin = {
	"smjonas/inc-rename.nvim",
	opts = {},
	keys = {
		{
			"<leader>rn",
			function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end,
			desc = "IncRename",
			expr = true,
			mode = "n",
		},
	},
}
return plugin
