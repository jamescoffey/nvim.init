return {
	--    "neovim/nvim-lspconfig",
	--    dependencies = {'williamboman/mason-lspconfig.nvim'},
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"pyright",
			-- "r_language_server",
			--          "mypy", "ruff",IIII
			--
			"taplo",
		},
	},
	dependencies = {
		--   { "mason-org/mason.nvim",
		--      opts = {
		--      ensure_installed = {
		--        "stylua",
		--        "debugpy",
		--        "pynvim",
		--        "air",
		--        "prettier",
		--        "prettierd",
		--      },
		--    }
		--    },
		"neovim/nvim-lspconfig",
	},
	config = function()
		local r_executable = vim.fn.exepath("R")
		if r_executable == "" then
			r_executable = "C:\\Users\\james\\scoop\\apps\\r\\current\\bin\\x64\\R.exe"
		end

		local function r_root_dir(bufnr, on_dir)
			local name = vim.api.nvim_buf_get_name(bufnr)
			local root = vim.fs.root(bufnr, { ".git", "DESCRIPTION", "renv.lock", ".Rprofile" })
				or (name ~= "" and vim.fs.dirname(name))
				or vim.uv.os_homedir()

			on_dir(root)
		end

		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = { "r_language_server" },
			},
		})

		vim.lsp.config("r_language_server", {
			cmd = { r_executable, "--no-echo", "-e", "languageserver::run()" },
			root_dir = r_root_dir,
		})
		vim.lsp.enable("r_language_server")
	end,
}
