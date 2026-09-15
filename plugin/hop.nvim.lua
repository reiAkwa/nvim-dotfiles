vim.pack.add({
  { src = 'https://github.com/smoka7/hop.nvim' },
})

require('hop').setup()

local hop = require('hop')
local map = vim.keymap.set

map('', '<leader>hw', hop.hint_words, { desc = 'Hop 跳转到单词' })
map('', '<leader>hl', hop.hint_lines, { desc = 'Hop 跳转到行' })
map('', '<leader>hc', hop.hint_char1, { desc = 'Hop 跳转到字符' })
map('', '<leader>hj', hop.hint_lines_skip_whitespace, { desc = 'Hop 跳转到行首' })
