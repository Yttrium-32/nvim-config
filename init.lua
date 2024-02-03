--                                    __
--    ___       __     ___    __  __ /\_\     ___ ___
--  /' _ `\   /'__`\  / __`\ /\ \/\ \\/\ \  /' __` __`\
--  /\ \/\ \ /\  __/ /\ \L\ \\ \ \_/ |\ \ \ /\ \/\ \/\ \
--  \ \_\ \_\\ \____\\ \____/ \ \___/  \ \_\\ \_\ \_\ \_\
--   \/_/\/_/ \/____/ \/___/   \/__/    \/_/ \/_/\/_/\/_/ config


----> Imports from other files <----
-- plugins manager
require('plugins')
-- Configuration for various plugins
require('plugin-configs.bufferline')
require('plugin-configs.ibl')
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


----> Random other configuration <----
-- set maximum amount of colums for synatax higlighting
vim.bo.synmaxcol = 300

vim.opt.scrolloff = 7
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable system clipboard
vim.opt.clipboard:append("unnamedplus")

vim.opt.list = true

-- Expand tab
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Display signs in number column
vim.opt.signcolumn = 'number'

-- Change color scheme to onedark
vim.cmd 'colorscheme onedark'

-- Enable spell checking for markdown files
vim.cmd 'au BufNewFile,BufRead *.md setlocal spell spelllang'

-- Disable continuation of comments to the next line
vim.cmd 'au FileType * set fo-=c fo-=r fo-=o'

 -- Set filetype dosini to .conf file to treesitter highlight
vim.cmd 'au BufNewFile,BufRead *.conf setf dosini'
-- Set filetype of html files to htmldjango for autocompletion
vim.cmd 'au BufNewFile,BufRead *.html setf htmldjango'


----> Smaller configuration for plugins <----
-- Larger configs go in their own file in lua/plugin-configs

-- Setup trouble.nvim
require('trouble').setup {
  opts = {
    icons = true,
    use_diagnostic_signs = true
  }
}

-- Setup Markdown flow
require('mkdnflow').setup {
  mappings = {
    MkdnEnter = {{'i', 'n', 'v'}, '<CR>'}
  }
}
local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Use html snippets in htmldjango and vice versa
require('luasnip').filetype_extend("htmldjango", {"html"})
require('luasnip').filetype_extend("html", {"htmldjango"})

