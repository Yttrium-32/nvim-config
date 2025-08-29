-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out,                            'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup {
    spec = {
        -- One dark color scheme
        {
            'olimorris/onedarkpro.nvim',
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd('colorscheme onedark')
            end,
        },

        -- Surround text with stuff
        { 'tpope/vim-surround' },

        -- Treesitter for highlights
        {
            'nvim-treesitter/nvim-treesitter',
            build = function()
                require('nvim-treesitter.install').update({ with_sync = true })
            end,
        },

        -- Tree view for undo
        { 'mbbill/undotree' },

        -- Plugin for LSP configuration
        {
            'neovim/nvim-lspconfig',
        },

        {
            "williamboman/mason-lspconfig.nvim",
            event = "VeryLazy",
            opts = {
                ensure_installed = { "lua_ls", "pyright", "clangd" },
            }
        },

        -- LSP manager
        {
            'williamboman/mason.nvim',
            opts = {}
        },

        -- Auto completion engine
        {
            'saghen/blink.cmp',
            dependencies = { 'rafamadriz/friendly-snippets' },
            version = '1.*',
            opts_extend = { "sources.default" }
        },

        -- Code snippets
        {
            'L3MON4D3/LuaSnip',
            -- follow latest release.
            version = 'v2.*',
            -- install jsregexp (optional!).
            build = 'make install_jsregexp',
            -- Code snippet source
            dependencies = { 'rafamadriz/friendly-snippets' }
        },

        -- Notification library for various things
        {
            'j-hui/fidget.nvim',
            tags = "v1.4.5"
        },

        -- Auto pair some symbols
        { 'jiangmiao/auto-pairs' },

        -- A sane file tree
        {
            'nvim-neo-tree/neo-tree.nvim',
            branch = "v3.x",
            dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons',
                'MunifTanjim/nui.nvim',
            },
        },

        -- Status line
        {
            'nvim-lualine/lualine.nvim',
            dependencies = 'nvim-tree/nvim-web-devicons',
        },

        -- Buffer line
        {
            'akinsho/bufferline.nvim',
            version = "*",
            dependencies = 'nvim-tree/nvim-web-devicons'
        },

        -- Plugin for commenting and uncommenting text
        { 'preservim/nerdcommenter' },

        -- Indentation guide for all line
        {
            'lukas-reineke/indent-blankline.nvim',
            main = 'ibl',
            --@module = 'ibl'
            --@type = ibl.config
        },

        -- Prettier diagnostics
        {
            'folke/trouble.nvim',
            opts = {}, -- for default options
            cmd = 'Trouble',
        },

        -- For better git integration
        { 'lewis6991/gitsigns.nvim' },

        -- Better rust experience
        {
            'mrcjkb/rustaceanvim',
            version = '^6',
            lazy = false
        },

        -- Simple universal picker
        { 'echasnovski/mini.pick',  version = '*' },
    },
    rocks = { enabled = false },
    -- Configure any other settings here. See the documentation for more details.
    -- color scheme that will be used when installing plugins.
    install = { colorscheme = { 'onedark' } },
    -- automatically check for plugin updates
    checker = { enabled = true },
    ui = {
        border = 'single',
    }
}
