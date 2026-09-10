vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim", name = "mason" },
})
require("mason").setup({
    ensure_installed = {
      'ts_ls',
      'rust_analyzer',
      'clangd',
      'lua_ls'
    },
    automatic_installation = true,

    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

