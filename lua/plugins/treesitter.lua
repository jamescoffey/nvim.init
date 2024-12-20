local plugins = {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function ()
      require'nvim-treesitter.configs'.setup({
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "r", "rnoweb", "yaml" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
}
return(plugins)
