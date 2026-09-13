vim.pack.add({
  { src = 'https://github.com/akinsho/toggleterm.nvim' },
})

require('toggleterm').setup({
  open_mapping = [[<C-t>]],
  direction = 'float',
  start_in_insert = true,
  persist_size = true,
  close_on_exit = true,
  shade_terminals = true,
  float_opts = { border = 'curved' },
  shell = 'pwsh', -- [TODO] add cross platform support
})

local Terminal = require('toggleterm.terminal').Terminal

local terminals = {
  float = Terminal:new({ direction = 'float', hidden = true }),
  horizontal = Terminal:new({ direction = 'horizontal', hidden = true }),
  vertical = Terminal:new({ direction = 'vertical', hidden = true }),
}

local map = vim.keymap.set

map('n', '<leader>th', function()
  terminals.horizontal:toggle()
end, { desc = '水平终端' })
map('n', '<leader>tv', function()
  terminals.vertical:toggle()
end, { desc = '垂直终端' })
map('n', '<leader>tb', '<cmd>terminal<CR>', { desc = '在新缓冲区打开终端' })
