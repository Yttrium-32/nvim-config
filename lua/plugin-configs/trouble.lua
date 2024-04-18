-- Setup trouble.nvim
require('trouble').setup {
  opts = {
    icons = true,
    height = 5,
    signs = {
        error = " ",
        warn = " ",
        hint = "",
        info = " "
    },
  }
}

