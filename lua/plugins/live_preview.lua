local plugin = {

	"brianhuster/live-preview.nvim",
	dependencies = {
		-- You can choose one of the following pickers
		"nvim-telescope/telescope.nvim",
		-- 'ibhagwan/fzf-lua',
		-- 'echasnovski/mini.pick',
		"folke/snacks.nvim",
		config = function()
			require("livepreview.config").set()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
return plugin
