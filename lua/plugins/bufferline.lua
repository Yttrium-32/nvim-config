-- Setup Buffer line
return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
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
}
