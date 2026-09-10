vim.pack.add({
    { src = 'https://github.com/akinsho/bufferline.nvim' }
})

require('bufferline').setup({
  options = {
    show_buffer_close_icons = false,
    
    offsets = {
        {
          filetype = "NvimTree",
          text = "",
          padding = 1,
        },
    },
  },
})
