vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.clipboard:append('unnamedplus')
vim.opt.mouse:append('a')
vim.opt.fillchars = { eob = " " } -- hide ~'s

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- show diagnostic in insert mode
vim.diagnostic.config({ update_in_insert = true })
