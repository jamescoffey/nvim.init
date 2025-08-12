local plugins = {
	{
		"L3MON4D3/LuaSnip",
		build = "pwsh " .. vim.fn.stdpath("config") .. "/luasnip_jsregexp_build.ps1",
		config = function()
			require("luasnip.loaders.from_snipmate").lazy_load()
			--          local ls = require("luasnip")
			--          vim.keymap.set({"i"}, "<C-k>", function() ls.expand() end, {silent = true})
			--          vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump( 1) end, {silent = true})
			--          vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump(-1) end, {silent = true})
			--          vim.keymap.set({"i", "s"}, "<C-e>", function()
			--            if ls.choice_active() then
			--              ls.change_choice(1)
			--            end
			--          end, {silent = true})
			require("luasnip").filetype_extend("r", { "r_doc" })
		end,
	},
	"rafamadriz/friendly-snippets",
	"saadparwaiz1/cmp_luasnip",
}
return plugins
