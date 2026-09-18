vim.pack.add({ 'https://github.com/nvim-mini/mini.sessions' })

require('mini.sessions').setup()

vim.keymap.set('n', '<leader>ss', function()
  MiniSessions.select('write')
end, { desc = '保存会话' })
vim.keymap.set('n', '<leader>sl', function()
  MiniSessions.select('read')
end, { desc = '加载会话' })
vim.keymap.set('n', '<leader>sd', function()
  MiniSessions.select('delete')
end, { desc = '删除会话' })
