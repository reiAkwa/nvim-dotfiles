vim.pack.add({
    { src = 'https://github.com/akinsho/toggleterm.nvim' }
})

require('toggleterm').setup({
    size = 20,              -- 终端窗口大小
    open_mapping = [[<leader>tt]], -- 切换终端的快捷键
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float', -- 'float' | 'horizontal' | 'vertical' | 'tab'
    -- shell = 'C:\\Program Files\\nu\\bin\\nu.exe' -- [TODO] Add platfrom-specified setting
})

-- 打开水平/垂直终端
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = '水平终端' })
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = '垂直终端' })
