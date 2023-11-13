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

-- Display signs in number column
vim.opt.signcolumn = 'number'

vim.opt.foldmethod = 'expr'
vim.opt.nofoldenable = true
vim.cmd('set foldexpr = nvim_treesitter#foldexpr()')

----> Smaller configuration for plugins <----
-- Larger configs go in their own file in lua/plugin-configs

-- Indent guide config
require("ibl").setup()

-- Setup nvim-colorizer
require("colorizer").setup()

-- Setup Lua line
require('lualine').setup {
  opt = {
    icons_enabled = true
  }
}

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

