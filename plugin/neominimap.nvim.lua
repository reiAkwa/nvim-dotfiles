vim.pack.add({
    { src = "https://github.com/Isrothy/neominimap.nvim" },
})

vim.opt.wrap = false
vim.opt.sidescrolloff = 36 -- Set a large value

---@type Neominimap.UserConfig
vim.g.neominimap = {
    auto_enable = true,

    click = {
      enabled = true,
    },
}
