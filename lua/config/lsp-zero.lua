local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup({ 
    ensure_installed = {
        "stylua",
        "black",
        --          "debugpy", "mypy", "ruff",
        -- 			"html-lsp", "css-lsp" , "prettier"
    },
})

require("mason-lspconfig").setup {
    ensure_installed = {
        "pyright",
        "lua_ls",
        "r_language_server",
        --          "debugpy", "mypy", "ruff",
        -- 			"html-lsp", "css-lsp" , "prettier"
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        pyright = function()
            require("lspconfig").pyright.setup {}
        end,
        lua_ls = function()
            require("lspconfig").lua_ls.setup {}
        end,
        r_language_server = function()
            require("lspconfig").r_language_server.setup {
                cmd = { "r", "--slave", "-e", "languageserver::run()" },
            }
        end,
    },
}

--    require("lspconfig").pyright.setup {}
--    require("lspconfig").lua_ls.setup {}
--require("lspconfig").r_language_server.setup {
--    cmd = { "r", "--slave", "-e", "languageserver::run()" },
--}
--require("lspconfig").rust_analyzer.setup {}
