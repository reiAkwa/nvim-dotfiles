vim.pack.add({
  { src = 'https://github.com/gelguy/wilder.nvim' }
})

local wilder = require('wilder')
wilder.setup({
  modes = { ':', '/', '?' }
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
      border = 'Normal', -- 边框高亮
    },
    empty_message = wilder.popupmenu_empty_message_with_spinner(), -- 无结果时显示加载动画
  })
))
