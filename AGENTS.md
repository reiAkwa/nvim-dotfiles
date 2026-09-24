## Brief
一个简约的 neovim 配置仓库

## Structure

### assets/
存放图片等静态资源

### colors/
存放自定义的主题，目前已有三个主题，分别是 alice-sunny，alice-rainy，alice-nightly

### lsp/
存放特定的 lsp 配置（目前为空）

### lua/lualine
为 lualine 适配自定义主题

### lua/keymaps.lua
键位设置

### lua/lspconfig.lua
启用 LSP（注意：Rust 已被 Rustaceanvim 插件接管，请勿在此添加 Rust 的语言服务配置）

### lua/neovide.lua
目前仅为 neovide 设置字体

### lua/options.lua
部分编辑器设置

### plugin/
所有的插件配置都应集中于此

### install.{ps1,sh}
安装脚本
