vim.pack.add({ 'https://github.com/nvim-mini/mini.notify' })

local notify = require('mini.notify')
notify.setup()
vim.notify = notify.make_notify()
