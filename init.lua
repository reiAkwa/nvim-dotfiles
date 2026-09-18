require('options')
require('keymaps')
require('lspconfig')
require('neovide')

vim.cmd("colorscheme alice-sunny")

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
