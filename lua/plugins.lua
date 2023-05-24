-- Using packer for plugin manager

require('packer').startup(function()
	-- Manager packer using packer
	use 'wbthomason/packer.nvim'

	-- Conqueror of Completion
	use {
		'neoclide/coc.nvim', 
		branch = 'release'
	}

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

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

	-- code snippets
	use 'honza/vim-snippets'

	-- Color highlighter
	use 'norcalli/nvim-colorizer.lua'

end)

