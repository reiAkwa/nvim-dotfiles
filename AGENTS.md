## Brief
一个简约的 neovim 配置仓库

## Structure

### assets/
存放图片等静态资源

### colors/
存放自定义的主题，目前已有三个主题，分别是 alice-sunny，alice-rainy，alice-nightly

### lsp/
存放单个语言服务的细粒度配置，文件名即服务名（`lsp/<server>.lua`），会与 nvim-lspconfig 自带的同名配置合并；目前只有 lua_ls.lua

### lua/keymaps.lua
键位设置

### lua/lsp.lua
启用 LSP 的清单（同时也是 mason 的自动安装清单，只需维护这一处）。
清单本身来自不被 git 跟踪的 `lua/local.lua`（`lsp.servers` / `lsp.configs`），文件缺失时只启用 lua_ls。
注意：Rust 已被 Rustaceanvim 插件接管，请勿在此添加 Rust 的语言服务配置。
也注意：不要把这个文件命名为 lspconfig.lua，那会与 nvim-lspconfig 的同名模块（`require('lspconfig')`）冲突。

### lua/local.example.lua
个人配置模板，复制为 `lua/local.lua` 后使用。
`lua/local.lua` 已被 .gitignore 忽略，用于放置 Neovide 字体、LSP 服务清单与覆盖、Tree-sitter 语言列表等用户特定内容；不要把它提交进仓库。

### lua/neovide.lua
从 `lua/local.lua` 读取 Neovide 字体，未配置时不设置

### lua/options.lua
部分编辑器设置

### plugin/
所有的插件配置都应集中于此（一个插件一个文件）。
例外：所有 mini.nvim 插件统一集中在 plugin/mini.lua。
调试相关配置在 plugin/nvim-dap.lua，适配器 CodeLLDB 由 mason 管理。

### install.{ps1,sh}
安装脚本（复制模式下都会跳过 .git）
