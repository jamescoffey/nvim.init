local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
--local capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup {
  sources = {
      { name = 'nvim_lsp'},
      { name = 'cmp_r' },
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
}


