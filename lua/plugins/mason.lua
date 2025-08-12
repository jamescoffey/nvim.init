local plugin = {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "debugpy",
        "pynvim",
--        "air",
        "prettier",
        "prettierd",
      },
    },
  }
return plugin

