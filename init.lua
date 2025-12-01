require("config.lazy")

--universal options
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.tabstop = 2 -- Number of spaces a tab represents
vim.opt.shiftwidth = 2 -- Number of spaces for each indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Automatically indent new lines
vim.opt.smarttab = true -- insert and delet tabs and the begining of a line
-- vim.opt.wrap = false -- Disable line wrapping
vim.opt.cursorline = true -- Highlight the current line
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.showtabline = 2 -- always show tab line
vim.opt.shellslash = true -- forward slash is used to expand file names
vim.opt.hls = true -- highlight search
vim.opt.is = true -- incramental search
vim.opt.showcmd = true -- show command you are typing
vim.opt.mouse = a -- enable mouse support
vim.opt.clipboard:append({ unnamedplus }) -- default to windows clipboard
vim.opt.isk:append({ "_", "$", "@", "%", "#", "-" }) -- search keywords
vim.opt.modifiable = true
vim.opt.timeoutlen = 500
--vimtex options
--vim.g.vimtex_view_method = "zathura" -- set zathura as the default viewer for tex files

-- commands
vim.cmd.colorscheme("catppuccin")
-- autoread changed files
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = "*",
	command = "silent! checktime",
})
-- universal keybindings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "j", "gj", { remap = true, silent = true }) -- move across soft wrap
vim.keymap.set("n", "k", "gk", { remap = true, silent = true })
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", opts) -- split navigations
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", opts)
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", opts)
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", opts)
vim.keymap.set("n", "<Esc>", ":noh<CR><Esc>", opts) --  ""Esc and turnoff highlight
vim.keymap.set("n", "<CR>", "o<Esc>", opts) -- "" CR - insert line below and not enter inserted mode
vim.keymap.set("n", "]<CR>", "i<CR><Esc>", opts) --  "" ctl CR - insert cr at current location
vim.keymap.set("n", "[<CR>", "O<Esc>", opts) --  "" ctl CR - insert cr at current location
vim.keymap.set("n", "<leader>n", ":bnext<CR>", opts) -- next buffer
vim.keymap.set("n", "<leader>p", ":bprevious<CR>", opts) -- previous buffer
vim.keymap.set("n", "<leader>dd", ":bdelete<CR>", opts) -- delete buffer
vim.api.nvim_set_keymap(
	"n",
	"<leader>bd",
	":bd | bnext<CR>",
	{ noremap = true, silent = true, desc = "Close buffer and open next" }
)
