vim.pack.add {{
  src = 'https://github.com/mrcjkb/rustaceanvim',
  -- To avoid being surprised by breaking changes,
  -- I recommend you set a version range
  version = vim.version.range('^9')
}}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client or client.name ~= 'rust_analyzer' then
      return
    end

    local bufopts = { silent = true, buffer = ev.buf }
    vim.keymap.set(
      "n",
      "<leader>a",
      function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
      end,
      bufopts
    )
    vim.keymap.set(
      "n",
      "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
      function()
        vim.cmd.RustLsp({'hover', 'actions'})
      end,
      bufopts
    )
  end,
})
