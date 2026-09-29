## Brief
一个简约的 neovim 配置仓库

## Structure

### assets/
存放图片等静态资源

### colors/
存放自定义的主题，目前已有三个主题，分别是 alice-sunny，alice-rainy，alice-nightly

### lsp/
存放单个语言服务的细粒度配置，文件名即服务名（`lsp/<server>.lua`），会与 nvim-lspconfig 自带的同名配置合并；目前只有 lua_ls.lua

### lua/lualine
为 lualine 适配自定义主题

### lua/keymaps.lua
键位设置

### lua/lsp.lua
启用 LSP 的清单（同时也是 mason 的自动安装清单，只需维护这一处）。
注意：Rust 已被 Rustaceanvim 插件接管，请勿在此添加 Rust 的语言服务配置。
也注意：不要把这个文件命名为 lspconfig.lua，那会与 nvim-lspconfig 的同名模块（`require('lspconfig')`）冲突。

### lua/neovide.lua
目前仅为 neovide 设置字体

### lua/options.lua
部分编辑器设置

### plugin/
所有的插件配置都应集中于此（一个插件一个文件）。
调试相关配置在 plugin/nvim-dap.lua，适配器 CodeLLDB 由 mason 管理。

### install.{ps1,sh}
安装脚本（复制模式下都会跳过 .git）
