local opts = {
  remap = false,
}

vim.g.mapleader = ' '

vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', 'gn', ':bnext<CR>')
vim.keymap.set('n', 'gp', ':bprevious<CR>')


vim.keymap.set('n', '<leader>e', function()
  local files = require('mini.files')
  if not files.close() then
    local bufname = vim.api.nvim_buf_get_name(0)
    local path = vim.fn.filereadable(bufname) == 1 and bufname or vim.fn.getcwd()
    files.open(path)
  end
end, { desc = '打开 / 关闭文件树' })

vim.keymap.set('n', '<leader>m', '<Cmd>lua require("neominimap.api").toggle()<CR>', { desc = '打开 / 关闭 minimap' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf

    -- 可以在这里根据 client 做出不同处理，你懂吧？
    -- if client.name == 'pyright' then ... end

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)

    -- 让 mini.clue 的触发器保持最新（LSP 会新建 g 开头的 buffer-local 映射）
    if _G.MiniClue ~= nil then pcall(MiniClue.ensure_buf_triggers, bufnr) end
  end,
})


