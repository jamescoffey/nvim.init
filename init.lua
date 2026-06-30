require("config.lazy")

-- Work around a Neovim 0.12-dev LSP save bug where change-tracking state can be
-- missing when didSave fires for an attached buffer.
do
	local changetracking = require("vim.lsp._changetracking")
	local original_get_and_set_name = changetracking._get_and_set_name

	changetracking._get_and_set_name = function(client, bufnr, name)
		local ok, result = pcall(original_get_and_set_name, client, bufnr, name)
		if ok then
			return result
		end

		if type(result) == "string" and result:match("buf_state") then
			changetracking.init(client, bufnr)
			return original_get_and_set_name(client, bufnr, name)
		end

		error(result)
	end
end

--universal options
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.tabstop = 2 -- Number of spaces a tab represents
vim.opt.shiftwidth = 2 -- Number of spaces for each indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Automatically indent new lines
vim.opt.smarttab = true -- insert and delet tabs and the begining of a line
vim.opt.wrap = true -- emable line wrapping
vim.opt.linebreak = true -- Prevent breaking words mid-word
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
vim.keymap.set("n", "<Esc>", ":noh<CR>:NoiceDismiss<Esc>", opts) --  ""Esc and turnoff highlight and get rid of noice popup
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
