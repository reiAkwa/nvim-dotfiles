vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim", name = "mason" },
})
require("mason").setup({
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

    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

