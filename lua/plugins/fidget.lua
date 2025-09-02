-- Notification library for various things
return {
    'j-hui/fidget.nvim',
    tag = "*",
    opts = {
        notification = {
            view = {
                group_separator_hl = "NormalNC"
            },
            window = {
                normal_hl = "NormalNC",
                winblend = 0,
                relative = "editor",
                align = "bottom"
            }
        }
    }
}
