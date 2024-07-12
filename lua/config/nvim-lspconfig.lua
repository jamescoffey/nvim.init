require("mason").setup({
    ensure_installed = {
        "pyright",
        --            "debugpy",
        "lua_ls",
        "r_language_server",
        --            "mypy",
        --            "ruff",
        "stylua",
        "black",
        -- 			"html-lsp", "css-lsp" , "prettier"
    },
})
require("mason-lspconfig").setup {
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
}


require("lspconfig").pyright.setup {}
require("lspconfig").lua_ls.setup {}
require("lspconfig").r_language_server.setup {
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
}
--require("lspconfig").rust_analyzer.setup {}
