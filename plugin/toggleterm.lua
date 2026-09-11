vim.pack.add({
  { src = 'https://github.com/akinsho/toggleterm.nvim' },
})

require('toggleterm').setup({
  open_mapping = [[<C-\>]],
  direction = 'float',
  start_in_insert = true,
  persist_size = true,
  close_on_exit = true,
  shade_terminals = true,
  float_opts = { border = 'curved' },
})

local Terminal = require('toggleterm.terminal').Terminal

local terminals = {
  float = Terminal:new({ direction = 'float', hidden = true }),
  horizontal = Terminal:new({ direction = 'horizontal', hidden = true }),
  vertical = Terminal:new({ direction = 'vertical', hidden = true }),
}

local map = vim.keymap.set

map('n', '<leader>tt', function()
  terminals.float:toggle()
end, { desc = '切换浮动终端' })
map('n', '<leader>th', function()
  terminals.horizontal:toggle()
end, { desc = '水平终端' })
map('n', '<leader>tv', function()
  terminals.vertical:toggle()
end, { desc = '垂直终端' })
