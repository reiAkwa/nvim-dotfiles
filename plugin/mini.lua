vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.ai' },
  { src = 'https://github.com/nvim-mini/mini.bracketed' },
  { src = 'https://github.com/nvim-mini/mini.bufremove' },
  { src = 'https://github.com/nvim-mini/mini.clue' },
  { src = 'https://github.com/nvim-mini/mini.comment' },
  { src = 'https://github.com/nvim-mini/mini.diff' },
  { src = 'https://github.com/nvim-mini/mini.files' },
  { src = 'https://github.com/nvim-mini/mini.icons' },
  { src = 'https://github.com/nvim-mini/mini.indentscope' },
  { src = 'https://github.com/nvim-mini/mini.jump2d' },
  { src = 'https://github.com/nvim-mini/mini.move' },
  { src = 'https://github.com/nvim-mini/mini.notify' },
  { src = 'https://github.com/nvim-mini/mini.operators' },
  { src = 'https://github.com/nvim-mini/mini.pairs' },
  { src = 'https://github.com/nvim-mini/mini.pick' },
  { src = 'https://github.com/nvim-mini/mini.sessions' },
  { src = 'https://github.com/nvim-mini/mini.statusline' },
  { src = 'https://github.com/nvim-mini/mini.surround' },
  { src = 'https://github.com/nvim-mini/mini.tabline' },
})

require('mini.ai').setup()
require('mini.bracketed').setup()
require('mini.comment').setup()
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require('mini.pairs').setup()
require('mini.surround').setup()

require('mini.operators').setup({
  replace = { prefix = 'gR' },
})

local indentscope = require('mini.indentscope')
indentscope.setup({
  symbol = '|',
  options = { try_as_border = true },
  draw = {
    animation = indentscope.gen_animation.none(),
    priority = 2,
  },
})

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

local notify = require('mini.notify')
notify.setup()
vim.notify = notify.make_notify()

local bufremove = require('mini.bufremove')
vim.keymap.set('n', '<leader>bd', function()
  bufremove.delete()
end, { desc = '关闭当前缓冲区' })
vim.keymap.set('n', '<leader>bw', function()
  bufremove.wipeout()
end, { desc = '彻底关闭当前缓冲区' })

require('mini.sessions').setup()
vim.keymap.set('n', '<leader>ss', function()
  MiniSessions.select('write')
end, { desc = '保存会话' })
vim.keymap.set('n', '<leader>sl', function()
  MiniSessions.select('read')
end, { desc = '加载会话' })
vim.keymap.set('n', '<leader>sd', function()
  MiniSessions.select('delete')
end, { desc = '删除会话' })

local files = require('mini.files')
files.setup({
  windows = { width_focus = 32, width_nofocus = 12, width_preview = 32, preview = true },
  options = { use_as_default_explorer = true },
})

local jump2d = require('mini.jump2d')
jump2d.setup({ mappings = { start_jumping = '' } })
vim.keymap.set({ 'n', 'x' }, '<leader>hw', function()
  jump2d.start(jump2d.builtin_opts.word_start)
end, { desc = '跳转到单词' })
vim.keymap.set({ 'n', 'x' }, '<leader>hl', function()
  jump2d.start({ spotter = function() return { 1 } end })
end, { desc = '跳转到行首' })
vim.keymap.set({ 'n', 'x' }, '<leader>hc', function()
  jump2d.start(jump2d.builtin_opts.single_character)
end, { desc = '跳转到字符' })
vim.keymap.set({ 'n', 'x' }, '<leader>hj', function()
  jump2d.start(jump2d.builtin_opts.line_start)
end, { desc = '跳到首个非空白字符' })

local pick = require('mini.pick')
pick.setup()
local picker = pick.builtin
vim.keymap.set('n', '<leader>ff', picker.files, { desc = '查找文件' })
vim.keymap.set('n', '<leader>fg', picker.grep_live, { desc = '实时搜索' })
vim.keymap.set('n', '<leader>fw', function()
  picker.grep({ pattern = vim.fn.expand('<cword>') })
end, { desc = '搜索当前词' })
vim.keymap.set('n', '<leader>fb', picker.buffers, { desc = '缓冲区' })
vim.keymap.set('n', '<leader>fh', picker.help, { desc = '帮助' })
vim.keymap.set('n', '<leader>fr', function()
  local items = vim.tbl_filter(function(f)
    return vim.fn.filereadable(f) == 1
  end, vim.v.oldfiles)
  pick.start({ source = { name = 'Oldfiles', items = items } })
end, { desc = '最近文件' })
vim.keymap.set('n', '<leader>fd', function()
  local items = vim.tbl_map(function(d)
    local bufname = vim.api.nvim_buf_get_name(d.bufnr)
    return {
      text = ('%s:%d: %s'):format(vim.fn.fnamemodify(bufname, ':.'), d.lnum + 1, d.message),
      path = bufname,
      lnum = d.lnum + 1,
      col = d.col + 1,
    }
  end, vim.diagnostic.get())
  pick.start({ source = { name = 'Diagnostics', items = items } })
end, { desc = '诊断' })

require('mini.diff').setup({ view = { style = 'sign' } })

require('mini.statusline').setup()

require('mini.tabline').setup()

local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    { mode = { 'n', 'x' }, keys = '<Leader>' },
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
    { mode = { 'n', 'x' }, keys = 'g' },
    { mode = { 'n', 'x' }, keys = 'z' },
  },
  clues = {
    { mode = 'n', keys = '<Leader>b', desc = '+缓冲区' },
    { mode = 'n', keys = '<Leader>d', desc = '+调试' },
    { mode = 'n', keys = '<Leader>f', desc = '+查找' },
    { mode = 'n', keys = '<Leader>h', desc = '+跳转' },
    { mode = 'n', keys = '<Leader>s', desc = '+会话' },
    { mode = 'n', keys = '<Leader>t', desc = '+终端' },
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.z(),
  },
  window = { delay = 300 },
})

vim.api.nvim_create_autocmd('UIEnter', {
  once = true,
  callback = function() MiniClue.ensure_all_triggers() end,
})
