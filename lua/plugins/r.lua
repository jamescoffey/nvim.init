local plugins = {
  {
    "R-nvim/R.nvim",
    lazy = false,
    filetypes = {"r", "rmd", "quarto"},
    config = function ()
      local opts = {
        R_path = "C:\\Users\\james\\scoop\\shims",
        pdfviewer = "sumatrapdf",
      }
      require("r").setup(opts)
    end,
  },
--  {
--    "R-nvim/cmp-r",
--    {
--      "hrsh7th/nvim-cmp",
--      config = function()
--            require("cmp").setup({ sources = {{ name = "cmp_r" }}})
--        end,
--    },
--  },
}
return(plugins)
