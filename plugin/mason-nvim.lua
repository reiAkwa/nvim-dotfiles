vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim", name = "mason" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim", name = "mason-lspconfig" },
})
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})
require("mason-lspconfig").setup({
    ensure_installed = {
      'vtsls',
      'rust_analyzer',
      'clangd',
      'lua_ls',
      'ty',
      'vue_ls',
      'tailwindcss',
    },
    automatic_installation = true,
    automatic_enable = {
      exclude = { "rust_analyzer" },
    },
})
