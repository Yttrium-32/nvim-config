-- Configuration file for neovim

-- plugins manager
require('plugins')
-- Configuration for various plugins
require('plugin-configs.bufferline')
require('plugin-configs.neo-tree')
require('plugin-configs.nvim-treesitter')
require('plugin-configs.nvim-cmp')
require('plugin-configs.lsp-config')

-- import key bindings
require('keybindings')

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

vim.opt.list = true

-- Indent guide config
require("ibl").setup()

-- Setup nvim-colorizer
require("colorizer").setup()

-- Setup Lua line
require('lualine').setup {
  options = {
    icons_enabled = true
  }
}

--require("zk").setup()

