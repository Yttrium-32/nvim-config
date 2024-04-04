require("plugins")
require("keybinds")

require("plugin-configs.treesitter")
require("plugin-configs.lsp")
require("plugin-configs.neo-tree")
require("plugin-configs.ibl")
require("plugin-configs.bufferline")
require("plugin-configs.lualine")
require("plugin-configs.trouble")

-- Set current colorscheme to onedark
vim.cmd("colorscheme onedark")

-- Make the background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

