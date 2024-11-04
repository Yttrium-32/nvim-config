-- Setup NeoTree
require("neo-tree").setup({
  filesystem = {
    hijack_netrw_behavior = "open_default",
  },
  window = {
    position = "current"
  },
  sources = { 'filesystem', 'buffers' },
  source_selector = {
      winbar = true,
      content_layout = "center",
      sources = {
          { source = 'filesystem' },
          { source = 'buffers' },
      },
  },
})

