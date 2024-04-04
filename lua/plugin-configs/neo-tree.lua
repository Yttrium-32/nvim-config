-- Setup NeoTree
require("neo-tree").setup({
  filesystem = {
    hijack_netrw_behavior = "open_default",
  },
  window = {
    position = "current"
  }
})

