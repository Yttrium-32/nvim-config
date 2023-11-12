-- Using packer for plugin manager

require('packer').startup(function()
	-- Manager packer using packer
	use 'wbthomason/packer.nvim'

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	-- Lsp config
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig'
	}

	-- Autocompletion engine
	use {
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp'
	}

	-- Code snippets
	use 'L3MON4D3/LuaSnip'

	-- Surround text with stuff
	use 'tpope/vim-surround'

	-- Better syntax support
	use 'sheerun/vim-polyglot'

	-- Auto pairing for '(' '[' and '{'
	use 'jiangmiao/auto-pairs'

	-- One dark color scheme
	use 'joshdick/onedark.vim'

	-- Comment out lines
	use 'scrooloose/nerdcommenter'

	-- Indentation guide for all line
	use 'lukas-reineke/indent-blankline.nvim'

	-- Nvim Web devicons
	use 'kyazdani42/nvim-web-devicons'

	-- One dark theme
	use 'olimorris/onedarkpro.nvim'

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	}

	-- Buffer line
	use {
		'akinsho/bufferline.nvim',
		tag = "*",
		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- File viewer
	use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

	-- Color highlighter
	use 'norcalli/nvim-colorizer.lua'

	---- Notes using the Zettlekasten method
	--use 'mickael-menu/zk-nvim'

	---- Fuzzy finder
	--use 'junegunn/fzf'

end)

