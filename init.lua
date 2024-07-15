require("config.lazy")

--universal options
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.tabstop = 4 -- Number of spaces a tab represents
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Automatically indent new lines
vim.opt.smarttab = true -- insert and delet tabs and the begining of a line
vim.opt.wrap = false -- Disable line wrapping
vim.opt.cursorline = true -- Highlight the current line
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.showtabline = 2 -- always show tab line
vim.opt.shellslash = true -- forward slash is used to expand file names
vim.opt.hls = true -- highlight search
vim.opt.is = true  -- incramental search
vim.opt.showcmd = true -- show command you are typing
vim.opt.mouse = a -- enable mouse support
vim.opt.clipboard:append { unnamedplus }  -- default to windows clipboard
vim.opt.isk:append {'_','$','@','%','#','-'}          -- search keywords
vim.opt.modifiable = true

-- commands
vim.cmd.colorscheme "catppuccin"

-- universal keybindings
local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', opts) -- split navigations
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', opts)
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', opts)
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', opts)
vim.keymap.set('n', '<S-Enter>', 'O<Esc>', opts) -- ""shift CR - insert line above and not enter inserted mode
vim.keymap.set('n', '<CR>', 'o<Esc>', opts) -- "" CR - insert line below and not enter inserted mode
vim.keymap.set('n', '<Esc>', ':noh<CR><Esc>', opts) --  ""Esc and turnoff highlight
vim.keymap.set('n', '<C-J>', 'i<CR><Esc>', opts) --  "" ctl CR - insert cr at current location
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', opts) --  Ctrl Space to omnicomplete

require("config.telescope")
-- require("config.nvim-lspconfig")
require("config.lsp-zero")
require("config.cmp")
require("config.snip")
require("config.treesitter")
require("config.r")


