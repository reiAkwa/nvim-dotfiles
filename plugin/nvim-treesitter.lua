vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
})

local ts = require('nvim-treesitter')
ts.setup()

-- 上游只调用裸命令名 tree-sitter，这里先确认 PATH 里那份在当前平台可用
local function find_ts_cli()
  if vim.fn.executable('tree-sitter') == 0 then
    return nil
  end
  local exe = vim.fn.exepath('tree-sitter')
  if not vim.fn.has('win32') and exe:match('^/mnt/') then
    return nil, ('解析到的是 Windows 侧的 %s，在 Linux 下无法用于编译'):format(exe)
  end
  return exe
end

local ts_languages = {
  'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query',
  'javascript', 'typescript', 'tsx', 'rust',
}

local cli, reason = find_ts_cli()
if cli then
  ts.install(ts_languages)
elseif reason then
  vim.schedule(function()
    vim.notify(
      ('[nvim-treesitter] %s，已跳过解析器安装\n%s\n%s\n%s'):format(
        reason,
        '在 WSL/Linux 内安装原生 CLI：',
        '  Arch: sudo pacman -S tree-sitter-cli',
        '  其他: npm i -g tree-sitter-cli 或 cargo install tree-sitter-cli'
      ),
      vim.log.levels.WARN
    )
  end)
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
