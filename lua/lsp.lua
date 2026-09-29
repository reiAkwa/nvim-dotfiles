-- 语言服务清单：mason 的自动安装清单也取自这里；Rust 由 rustaceanvim 接管
local servers = {
  'vtsls',
  'clangd',
  'lua_ls',
  'ty',
  'vue_ls',
  'tailwindcss',
}

-- 此时 nvim-lspconfig 尚未进入 runtimepath，vim.lsp.config 会延迟解析，安全
vim.lsp.enable(servers)

return servers
