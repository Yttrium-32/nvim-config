-- config file for nvim in lua!

-- package manager
require('plugins')

-- import key bindings
require('keybindings')

-- Import coc config file
require('coc-config')


-- neovide config
if vim.g.neovide then
  require('neovide')
end

-- Change color scheme to onedark (might wanna make my own colorscheme soon)
vim.cmd('colorscheme onedark')

vim.bo.synmaxcol = 300 -- set maximum amount of colums for synatax higlighting

vim.opt.scrolloff = 7
vim.opt.number = true
vim.opt.relativenumber = true

-- Set termguicolors
vim.opt.termguicolors = true

-- Enable system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Indent guide config
vim.opt.list = true

require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
}

-- Treesitter config
require('nvim-treesitter.configs').setup {
highlight = { -- enable highlighting
  enable = true,
  },
indent = {
  enable = true, -- default is disabled anyways
  }
}

-- Setup NvimTree
require("nvim-tree").setup {
  remove_keymaps = {'f'},
  open_on_setup = true,
  renderer = {
    indent_markers = {
      enable = true
    }
  }
}

-- Setup Buffer line
require("bufferline").setup()

-- Setup Lua line
require('lualine').setup()
