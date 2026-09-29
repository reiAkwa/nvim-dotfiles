vim.pack.add({
  { src = 'https://github.com/folke/which-key.nvim' },
})

require('which-key').setup()

require('which-key').add({
  { '<leader>b', group = '缓冲区' },
  { '<leader>d', group = '调试' },
  { '<leader>f', group = '查找' },
  { '<leader>h', group = '跳转' },
  { '<leader>s', group = '会话' },
  { '<leader>t', group = '终端' },
})
