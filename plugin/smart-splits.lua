vim.pack.add({
  { src = 'https://github.com/mrjones2014/smart-splits.nvim' },
})

require('smart-splits').setup()

local splits = require('smart-splits')
local map = vim.keymap.set

map('n', '<C-h>', splits.move_cursor_left, { desc = '移动到左侧分屏' })
map('n', '<C-j>', splits.move_cursor_down, { desc = '移动到下方分屏' })
map('n', '<C-k>', splits.move_cursor_up, { desc = '移动到上方分屏' })
map('n', '<C-l>', splits.move_cursor_right, { desc = '移动到右侧分屏' })

map('n', '<M-h>', splits.resize_left, { desc = '调整左侧分屏宽度' })
map('n', '<M-j>', splits.resize_down, { desc = '调整下方分屏高度' })
map('n', '<M-k>', splits.resize_up, { desc = '调整上方分屏高度' })
map('n', '<M-l>', splits.resize_right, { desc = '调整右侧分屏宽度' })
