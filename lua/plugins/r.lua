local plugins = {
	{
		"R-nvim/R.nvim",
		-- version = "v0.1.0",
		lazy = false,
		filetypes = { "r", "rmd", "quarto", "R" },
		-- init = function()
		-- 	vim.g.R_app = "radian"
		-- 	vim.g.R_cmd = "R"
		-- 	vim.g.R_hl_term = 0
		-- 	vim.g.R_args = {}
		-- 	vim.g.R_bracketed_paste = 1
		-- end,
		config = function()
			---@type RConfigUserOpts
			local opts = {
				R_path = "C:\\Users\\james\\scoop\\apps\\r\\current\\bin\\x64",
				-- pdfviewer = "sumatrapdf",
				-- view_df = {
				-- 	csv_sep = ",",
				-- },
			}
			require("r").setup(opts)
		end,
	},
}
return plugins
