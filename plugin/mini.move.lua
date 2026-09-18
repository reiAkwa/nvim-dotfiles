vim.pack.add({ 'https://github.com/nvim-mini/mini.move' })

require('mini.move').setup({
  mappings = {
    left = '<M-h>',
    right = '<M-l>',
    down = '<M-j>',
    up = '<M-k>',
    line_left = '<M-Left>',
    line_right = '<M-Right>',
    line_down = '<M-Down>',
    line_up = '<M-Up>',
  },
})
