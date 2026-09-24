vim.pack.add({
    { src = 'https://github.com/akinsho/bufferline.nvim' }
})

require('bufferline').setup({
  options = {
    show_buffer_close_icons = false,
    
    offsets = {
        {
          filetype = "neo-tree",
          text = "",
          padding = 1,
        },
    },
  },
})
