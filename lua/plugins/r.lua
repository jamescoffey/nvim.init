local plugins = {
	{
		"R-nvim/R.nvim",
		lazy = false,
		filetypes = { "r", "rmd", "quarto" },
		init = function()
			vim.g.R_app = "radian"
			vim.g.R_cmd = "R"
			vim.g.R_hl_term = 0
			vim.g.R_args = {}
			vim.g.R_bracketed_paste = 1
		end,
		config = function()
			local opts = {
				R_path = "C:\\Users\\james\\scoop\\shims",
				pdfviewer = "sumatrapdf",
				view_df = {
					csv_sep = ",",
					--save_fn = "function(x, x_name) {f <- paste0('/tmp/', x_name, '.csv'); readr::write_csv(x, f)}",
				},
			}
			require("r").setup(opts)
		end,
	},
}
return plugins
