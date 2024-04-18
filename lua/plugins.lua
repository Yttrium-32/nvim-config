vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- One dark color scheme
    use 'joshdick/onedark.vim'

    -- Treesitter for highlights
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Tree view for undo
    use 'mbbill/undotree'

    -- all plugins for lsp configuration
    use {
        'neovim/nvim-lspconfig',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'hrsh7th/nvim-cmp'},
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
        }
    }

    -- Notification library for various things
    use 'j-hui/fidget.nvim'

    -- Auto pair some symbols
    use 'jiangmiao/auto-pairs'

    -- A sane file tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    -- Buffer line
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- Plugin for commenting and uncommenting text
    use 'preservim/nerdcommenter'

    -- Indentation guide for all line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Prettier diagnostics
    use {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }
    -- Cscope provides an easy way to navigate a large C project
    -- This plugin add keybinds and options for Cscope in nvim
    -- This was originally supported out of the box in vim but was dropped for
    -- being too bloated
    use 'dhananjaylatkar/cscope_maps.nvim'

end)

