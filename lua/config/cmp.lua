local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup {
  sources = {
      { name = 'nvim_lsp'},
      { name = 'cmp_r' },
      { name = 'luasnip' },
      { name = 'treesitter'},
      { name = 'buffer' },
      { name = 'path'},
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),
  require("cmp_r").setup({}),
}

