local plugins = {
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"folke/snacks.nvim",
		},
		cmd = { "LivePreview" },
		config = function()
			require("livepreview.config").set()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	-- {
	--   "selimacerbas/markdown-preview.nvim",
	--   dependencies = { "selimacerbas/live-server.nvim" },
	--   cmd = { "MarkdownPreview", "MarkdownPreviewRefresh", "MarkdownPreviewStop" },
	--   config = function()
	--     require("markdown_preview").setup({
	--       instance_mode = "takeover",
	--       port = 0,
	--       open_browser = true,
	--       default_theme = "dark",
	--       debounce_ms = 300,
	--     })
	--   end,
	-- },
	{
		"selimacerbas/mdkite.nvim",
		-- a kitehost.nvim checkout under another dir name needs its spec to
		-- say name = "kitehost.nvim", or lazy.nvim clones upstream beside it
		dependencies = { "selimacerbas/kitehost.nvim" },
		-- kitehost.nvim v2.0.0 or newer, the first release with its Host check
		config = function()
			require("mdkite").setup({
				-- all optional; sane defaults shown
				instance_mode = "takeover", -- "takeover" (one tab) or "multi" (tab per instance)
				port = 0, -- 0 = auto (8421 for takeover, OS-assigned for multi)
				open_browser = true,
				default_theme = "dark", -- "dark" or "light"; initial preview theme
				debounce_ms = 300,
			})
		end,
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	ft = { "markdown" },
	-- 	build = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- },
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	build = "cd app && yarn install",
	-- 	init = function()
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 	end,
	-- 	ft = { "markdown" },
	-- },
}
return plugins
