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

-- Change color scheme to onedark
vim.cmd 'colorscheme onedark'

-- Disable continuation of comments to the next line
vim.cmd 'au FileType * set fo-=c fo-=r fo-=o'

 -- Set filetype dosini to .conf file to treesitter highlight
vim.cmd 'au BufNewFile,BufRead *.conf setf dosini'


----> Smaller configuration for plugins <----
-- Larger configs go in their own file in lua/plugin-configs

-- Indent guide config
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup {
  indent = {
    char = '┊',
  },
  scope = {
    enabled = true,
    highlight = highlight
  }
}
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

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

