# nvim-dotfiles

基于 Neovim 0.12+ 原生插件管理器 `vim.pack` 的轻量配置，无 lazy.nvim 等第三方包管理器。

## 环境要求

- **Neovim >= 0.12**（`vim.pack` 从 0.12 开始提供）
- `git`（用于拉取插件）

可选（用于更完整的体验）：

- `ripgrep`（`rg`）— 快速搜索
- `tree-sitter` CLI + C 编译器 — 编译 Tree-sitter 解析器
- Nerd Font（如 Sarasa Nerd Font）— 图标与 Neovide 字体

## 安装

### 一键脚本

脚本会：检测平台 -> 定位配置目录 -> 备份已有配置 -> 软链（失败自动回退复制）-> 校验 Neovim 与依赖 -> 首次启动自动安装插件。

Linux / macOS / Windows(Git Bash)：

```sh
git clone https://github.com/reiAkwa/nvim-dotfiles.git
cd nvim-dotfiles
sh install.sh
```

Windows PowerShell：

```powershell
git clone https://github.com/reiAkwa/nvim-dotfiles.git
cd nvim-dotfiles
.\install.ps1
```

可用参数：

- `--copy` / `-Copy`：复制文件而非创建符号链接
- `--no-bootstrap` / `-NoBootstrap`：跳过首次启动自动安装插件

### 手动安装

将仓库放到 Neovim 配置目录：

- Linux / macOS：`~/.config/nvim`
- Windows：`%LOCALAPPDATA%\nvim`

```sh
git clone https://github.com/reiAkwa/nvim-dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
```

首次打开 `nvim` 时，`vim.pack` 会自动拉取插件；之后可用 `:checkhealth` 检查状态。

## 目录结构

```
.
├── init.lua                  # 入口
├── lua/
│   ├── options.lua           # 编辑器选项
│   ├── keymaps.lua           # 全局与 LSP 快捷键
│   ├── lspconfig.lua         # vim.lsp.enable 启用的语言服务
│   ├── neovide.lua           # Neovide 专用配置
│   └── lualine/themes/       # 自定义 lualine 主题
├── plugin/                   # 启动时自动加载，声明并配置各插件
├── colors/                   # alice 系列配色
├── install.sh                # Unix / Git Bash 安装脚本
├── install.ps1               # Windows PowerShell 安装脚本
└── nvim-pack-lock.json       # 插件版本锁定
```

## 插件

| 插件 | 用途 |
| --- | --- |
| [blink.cmp](https://github.com/saghen/blink.cmp) | 补全（LSP / path / snippet / buffer） |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 配置 |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP server 安装管理 |
| [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) | Rust 增强 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 语法高亮与解析器 |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 文件树 |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | 顶部标签栏 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 状态栏 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git 状态标记 |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | 快速注释 |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | 内置终端 |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | 快捷键提示 |

## 语言服务

`lua/lspconfig.lua` 通过 `vim.lsp.enable` 启用：`ts_ls`、`clangd`、`lua_ls`；Rust 由 rustaceanvim 提供。`mason` 会在启动时确保安装 `ts_ls`、`rust_analyzer`、`clangd`、`lua_ls`。

## 快捷键

Leader 键为 `空格`。

| 快捷键 | 功能 |
| --- | --- |
| `<C-Up>` / `<C-Down>` | 调整窗口高度 |
| `<C-Left>` / `<C-Right>` | 调整窗口宽度 |
| `gn` / `gp` | 下一个 / 上一个 buffer |
| `J` / `K`（可视模式） | 上下移动选中行 |
| `<leader>e` | 打开 / 关闭文件树 |
| `<leader>tt` | 切换浮动终端 |
| `<leader>th` / `<leader>tv` | 水平 / 垂直终端 |
| `<leader>a`（Rust） | 代码操作 |
| `gd` / `gD` | 跳转定义 / 声明 |
| `gi` / `go` | 实现 / 类型定义 |
| `K` | 悬停文档（Rust 下含操作） |
| `gl` | 显示诊断浮窗 |

## 配色

内置 alice 系列，默认 `alice_sunny`（在 `init.lua` 中切换）：

- `alice_sunny`
- `alice_nightly`
- `alice_rainy`

`lua/lualine/themes/` 下有对应的 lualine 主题。
