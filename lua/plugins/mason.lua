local plugin = {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "debugpy",
        "pynvim",
--        "air",
        "eslint_d",
        "prettier",
        "prettierd",
      },
    },
  }
return plugin
