--                                    __
--    ___       __     ___    __  __ /\_\     ___ ___
--  /' _ `\   /'__`\  / __`\ /\ \/\ \\/\ \  /' __` __`\
--  /\ \/\ \ /\  __/ /\ \L\ \\ \ \_/ |\ \ \ /\ \/\ \/\ \
--  \ \_\ \_\\ \____\\ \____/ \ \___/  \ \_\\ \_\ \_\ \_\
--   \/_/\/_/ \/____/ \/___/   \/__/    \/_/ \/_/\/_/\/_/ config

----> Imports from other files <----
-- Plugin Manager
require('plugins')

-- Various keybinds
require('keybinds')

-- Configuration for various plugins
require('plugin-configs.treesitter')
require('plugin-configs.lsp')
require('plugin-configs.neo-tree')
require('plugin-configs.ibl')
require('plugin-configs.bufferline')
require('plugin-configs.lualine')
require('plugin-configs.trouble')
require('plugin-configs.fidget')
require('plugin-configs.gitsigns')

-- Custom format command
vim.api.nvim_create_user_command('Format', function ()
    vim.lsp.buf.format()
end, { desc = 'Run formater if one exists' })

----> Random other configuration <----
-- set maximum amount of colums for synatax higlighting
vim.bo.synmaxcol = 300

vim.opt.scrolloff = 7
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable system clipboard
vim.opt.clipboard:append('unnamedplus')

vim.opt.list = true

-- Expand tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Disable line wrap
vim.opt.wrap = false

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Enable long term undos
vim.opt.undodir = os.getenv('HOME') .. '/.local/share/undodir'
vim.opt.undofile = true

vim.opt.incsearch = true

-- Display signs in number column
vim.opt.signcolumn = 'number'

-- highlight column 80
vim.opt.colorcolumn = '80'

-- Fast update time
vim.opt.updatetime = 50

-- Make the background transparent
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })

-- Disable continuation of comments to the next line
vim.cmd 'au FileType * set fo-=c fo-=r fo-=o'

-- Set filetype dosini to .conf file to treesitter highlight
vim.cmd 'au BufNewFile,BufRead *.conf setf dosini'

-- Disable winbar for nofile buffers
vim.cmd 'au VimEnter,BufWinEnter * if &filetype == "neo-tree" | setlocal winbar=%f | endif'

-- Kernel specific configuration
local kernel_au = 'au BufNewFile,BufRead ' .. os.getenv('HOME') .. '/dev/linux_work/ set cc=81 noet ts=8'
vim.cmd(kernel_au)

_BORDER = 'single'
