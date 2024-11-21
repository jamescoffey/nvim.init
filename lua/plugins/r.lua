local plugins = {
  {
    "R-nvim/R.nvim",
    lazy = false,
    filetypes = {"r", "rmd", "quarto"},
    config = function ()
      local opts = {
        min_editor_width = 72,
        rconsole_width = 78,
      }
      require("r").setup(opts)
    end,
  },
  {
    "R-nvim/cmp-r",
    {
      "hrsh7th/nvim-cmp",
      config = function()
            require("cmp").setup({ sources = {{ name = "cmp_r" }}})
            require("cmp_r").setup({})
        end,
    },
  },
}
return(plugins)
