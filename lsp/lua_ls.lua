---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      -- mini.nvim 的 API 挂在全局上
      diagnostics = { globals = { 'vim', 'MiniNotify', 'MiniSessions', 'MiniIcons' } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}
