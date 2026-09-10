vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
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
