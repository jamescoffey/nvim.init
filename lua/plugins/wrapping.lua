local plugin = {
	"andrewferrier/wrapping.nvim",
	config = function()
		require("wrapping").setup({
			auto_set_mode_filetype_allowlist = {
				"asciidoc",
				"gitcommit",
				"latex",
				"mail",
				"markdown",
				"rst",
				"tex",
				"text",
			},
			softener = {
				latex = 5,
				tex = 5,
			},
		})
		require("wrapping").set_mode_heuristically()
	end,
}
return plugin
