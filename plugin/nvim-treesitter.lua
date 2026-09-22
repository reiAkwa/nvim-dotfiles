vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
})

require('nvim-treesitter').setup()

if vim.fn.executable('tree-sitter') == 1 then
  require('nvim-treesitter').install({
    'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query',
    'javascript', 'typescript', 'tsx', 'rust',
  })
end

vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

require('nvim-treesitter-textobjects').setup({
  select = { lookahead = true },
  move = { set_jumps = true },
})

local ts_select = require('nvim-treesitter-textobjects.select')
local ts_move = require('nvim-treesitter-textobjects.move')
local ts_map = vim.keymap.set

ts_map({ 'x', 'o' }, 'am', function()
  ts_select.select_textobject('@function.outer', 'textobjects')
end, { desc = '选择函数（外）' })
ts_map({ 'x', 'o' }, 'im', function()
  ts_select.select_textobject('@function.inner', 'textobjects')
end, { desc = '选择函数（内）' })
ts_map({ 'x', 'o' }, 'ac', function()
  ts_select.select_textobject('@class.outer', 'textobjects')
end, { desc = '选择类（外）' })
ts_map({ 'x', 'o' }, 'ic', function()
  ts_select.select_textobject('@class.inner', 'textobjects')
end, { desc = '选择类（内）' })

ts_map({ 'n', 'x', 'o' }, ']m', function()
  ts_move.goto_next_start('@function.outer', 'textobjects')
end, { desc = '下一个函数开头' })
ts_map({ 'n', 'x', 'o' }, '[m', function()
  ts_move.goto_previous_start('@function.outer', 'textobjects')
end, { desc = '上一个函数开头' })
ts_map({ 'n', 'x', 'o' }, ']M', function()
  ts_move.goto_next_end('@function.outer', 'textobjects')
end, { desc = '下一个函数结尾' })
ts_map({ 'n', 'x', 'o' }, '[M', function()
  ts_move.goto_previous_end('@function.outer', 'textobjects')
end, { desc = '上一个函数结尾' })

require('treesitter-context').setup()
