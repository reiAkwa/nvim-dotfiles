vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
})

require('telescope').setup({
  defaults = {
    prompt_prefix = '  ',
    selection_caret = ' ',
    path_display = { 'smart' },
  },
})

local builtin = require('telescope.builtin')
local map = vim.keymap.set

map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope 查找文件' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope 实时搜索' })
map('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope 搜索当前词' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope 缓冲区' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope 帮助' })
map('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope 最近文件' })
map('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope 诊断' })
