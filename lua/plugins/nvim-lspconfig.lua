return {
  --    "neovim/nvim-lspconfig",
  --    dependencies = {'williamboman/mason-lspconfig.nvim'},
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "pyright",
      "r_language_server",
      --          "mypy", "ruff",IIII
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
    require("mason-lspconfig").setup({
      automatic_enable = true,
    })
  end
}
