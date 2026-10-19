-- 语言服务清单：mason 的自动安装清单也取自这里；Rust 由 rustaceanvim 接管
-- 个人清单放在不被 git 跟踪的 lua/local.lua，缺失时只启用 lua_ls
local ok, user = pcall(require, 'local')
user = ok and user or {}

local servers = (user.lsp and user.lsp.servers) or { 'lua_ls' }

-- 单个服务的覆盖配置，例如 Fedora 系统自带的 qmlls：
--   configs = { qmlls = { cmd = { '/usr/bin/qmlls' } } }
for name, config in pairs((user.lsp and user.lsp.configs) or {}) do
  vim.lsp.config(name, config)
end

-- 此时 nvim-lspconfig 尚未进入 runtimepath，vim.lsp.config 会延迟解析，安全
vim.lsp.enable(servers)

return servers
