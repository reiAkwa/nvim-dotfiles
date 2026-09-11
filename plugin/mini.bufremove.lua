vim.pack.add({ 'https://github.com/nvim-mini/mini.bufremove' })

local bufremove = require('mini.bufremove')

vim.keymap.set('n', '<leader>bd', function()
  bufremove.delete()
end, { desc = '关闭当前缓冲区' })
vim.keymap.set('n', '<leader>bw', function()
  bufremove.wipeout()
end, { desc = '彻底关闭当前缓冲区' })
