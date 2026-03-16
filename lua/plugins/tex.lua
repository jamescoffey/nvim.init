local plugins = {
	"lervag/vimtex",
	lazy = false,
	config = function()
		-- vim.g.vimtex_view_method = "zathura"
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "tex",
			callback = function()
				-- vim.opt_local.textwidth = 100 -- Set text wrapping at 80 characters
				vim.opt_local.colorcolumn = "101"
				vim.opt_local.formatoptions:append("t") -- Enable automatic text wrapping
				vim.opt_local.wrap = true -- Enable soft wrapping
				vim.opt_local.linebreak = true -- Prevent breaking words mid-word
				vim.opt_local.spell = true
				vim.opt_local.spelllang = "en_gb"
			end,
		})
	end,
}
return plugins
