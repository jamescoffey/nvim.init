local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local luasnip = require("luasnip")

cmp.setup {
  sources = {
    { name = 'nvim_lsp', 'cmp_r' },
  }
}


require('lspconfig').clangd.setup {
  capabilities = capabilities,
  snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, 
    {
      { name = 'buffer' },
    }),
--    mapping = {
--      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--      ['<C-f>'] = cmp.mapping.scroll_docs(4),
--      ['<C-Space>'] = cmp.mapping.complete(),
--      ['<C-e>'] = cmp.mapping.abort(),
--      ['<CR>'] = cmp.mapping(function(fallback)
--        if cmp.visible() then
--            if luasnip.expandable() then
--                luasnip.expand()
--            else
--                cmp.confirm({
--                    select = true,
--                })
--            end
--        else
--            fallback()
--        end
--    end),
--
--    ["<Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif luasnip.locally_jumpable(1) then
--        luasnip.jump(1)
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--
--    ["<S-Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif luasnip.locally_jumpable(-1) then
--        luasnip.jump(-1)
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--
--    -- ... Your other mappings ...
--  },
}
