-- Setup Buffer line
require("bufferline").setup{
  options = {
    separator_style = "thick",
    offsets = {
      {
          filetype = "neo-tree",
          text = "Neo Tree",
          text_align = "left",
          highlight = "String",
          separator = "", -- use a "true" to enable the default, or set your own character
      }
    }
  }
}
