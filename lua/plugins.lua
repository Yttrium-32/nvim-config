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
	use 'olimorris/onedarkpro.nvim'

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	} 

	-- Buffer line
	use {
		'akinsho/bufferline.nvim', 
		tag = "v2.*", 
		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- File viewer
	--use 'preservim/nerdtree'
	use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons'
		}
	}

end)

