-- Prettier diagnostics
return {
    'folke/trouble.nvim',
    cmd = 'Trouble',
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
