vim.pack.add({
  { src = 'https://github.com/akinsho/toggleterm.nvim' },
})

local function get_shell()
  if vim.fn.has('win32') == 1 then
    for _, sh in ipairs({ 'pwsh', 'powershell' }) do
      if vim.fn.executable(sh) == 1 then
        return sh
      end
    end
  end
  return vim.o.shell
end

require('toggleterm').setup({
  open_mapping = [[<C-t>]],
  direction = 'float',
  start_in_insert = true,
  persist_size = true,
  close_on_exit = true,
  shade_terminals = true,
  float_opts = { border = 'curved' },
  shell = get_shell,
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
map('n', '<leader>tb', function()
  vim.cmd('terminal ' .. vim.fn.fnameescape(get_shell()))
end, { desc = '在新缓冲区打开终端' })
