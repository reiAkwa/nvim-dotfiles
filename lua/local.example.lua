-- 个人配置模板：复制为 lua/local.lua 后按需修改。
-- lua/local.lua 已被 .gitignore 忽略，不会被提交。
return {
  -- Neovide 字体；不设置则沿用 Neovide 默认值
  neovide = {
    guifont = 'IosevkaTerm Nerd Font,Sarasa Term SC:h13:h13',
  },

  lsp = {
    -- 要启用的语言服务；同时也是 mason 的自动安装清单
    -- 默认（lua/local.lua 不存在时）：{ 'lua_ls' }
    servers = { 'lua_ls' },

    -- 单个服务的覆盖配置，会与 nvim-lspconfig 自带的配置合并
    -- 例如使用系统自带的 qmlls：
    -- configs = {
    --   qmlls = { cmd = { '/usr/bin/qmlls' } },
    -- },
  },

  treesitter = {
    -- 要安装的解析器
    -- 默认（lua/local.lua 不存在时）：{ 'c', 'lua', 'vim', 'vimdoc', 'query' }
    languages = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
  },
}
