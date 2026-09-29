vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = "v1", name = "blink.cmp" },
})

require("blink.cmp").setup({
    cmdline = {
        enabled = true,
        keymap = { preset = 'cmdline' },
        sources = { 'buffer', 'cmdline', 'path' },
        -- 默认只在 cmdwin 弹菜单，打开后输入即提示
        completion = { menu = { auto_show = true } },
    },
    keymap = {
        preset = "enter",
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
        keyword = { range = "prefix" },
        menu = {
            draw = { treesitter = { "lsp" } },
        },
        trigger = { show_on_trigger_character = true },
        documentation = { auto_show = true },
    },
    signature = { enabled = true },
})
