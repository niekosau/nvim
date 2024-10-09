vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.g.tmux_navigator_no_mappings = 1

vim.opt.nu = true
vim.opt.history = 10000
vim.opt.encoding = "utf-8"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.listchars = {
	tab = "  ",
	trail = "·",
}
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.g.python3_host_prog = "/opt/homebrew/bin/python3.9"
vim.keymap.set("n", "-", ":Neotree filesystem reveal left<CR>")
