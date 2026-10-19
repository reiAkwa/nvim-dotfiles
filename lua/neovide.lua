if vim.g.neovide then
  -- 字体属于个人配置，放在不被 git 跟踪的 lua/local.lua
  local ok, user = pcall(require, 'local')
  local guifont = ok and user.neovide and user.neovide.guifont
  if guifont then
    vim.o.guifont = guifont
  end
end
