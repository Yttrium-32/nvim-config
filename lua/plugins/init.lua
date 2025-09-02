return {
    -- One dark color scheme
    {
        'olimorris/onedarkpro.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd('colorscheme onedark')
        end,
    },

    -- Disable a bunch of stuff when opening massive files
    {
        'ouuan/nvim-bigfile',
        opts = {},
    },

    -- Tree view for undo
    { 'mbbill/undotree' },

    -- Auto pair some symbols
    { 'jiangmiao/auto-pairs' },

    -- Plugin for commenting and uncommenting text
    { 'preservim/nerdcommenter' },

    -- Better rust experience
    {
        'mrcjkb/rustaceanvim',
        version = '^6',
        lazy = false
    },
}
