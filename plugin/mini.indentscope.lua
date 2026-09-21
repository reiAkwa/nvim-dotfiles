vim.pack.add({ 'https://github.com/nvim-mini/mini.indentscope' })

local indentscope = require('mini.indentscope')

indentscope.setup({
  symbol = '╎',
  options = { try_as_border = true },
  draw = {
    animation = indentscope.gen_animation.none(),
    priority = 2,
  },
})
