--                                    __
--    ___       __     ___    __  __ /\_\     ___ ___
--  /' _ `\   /'__`\  / __`\ /\ \/\ \\/\ \  /' __` __`\
--  /\ \/\ \ /\  __/ /\ \L\ \\ \ \_/ |\ \ \ /\ \/\ \/\ \
--  \ \_\ \_\\ \____\\ \____/ \ \___/  \ \_\\ \_\ \_\ \_\
--   \/_/\/_/ \/____/ \/___/   \/__/    \/_/ \/_/\/_/\/_/ config

----> Bootstrap lazy.nvim <----
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out,                            'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)


----> Imports from other files <----
-- Various key binds
require('keybinds')

-- Configuration for lazy.nvim
require('lazy').setup({
    -- Setup plugins
    spec = {
        { import = "plugins" },
    },
    rocks = { enabled = false },
    -- Configure any other settings here. See the documentation for more details.
    -- color scheme that will be used when installing plugins.
    install = { colorscheme = { 'onedark' } },
    -- automatically check for plugin updates
    checker = { enabled = true },
    ui = {
        border = 'single',
    }
})


----> Random other configuration <----
-- set maximum amount of columns for syntax highlighting
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

-- Preserve undo after closing file
vim.opt.undodir = os.getenv('HOME') .. '/.local/share/undodir'
vim.opt.undofile = true

vim.opt.incsearch = true

-- Display signs in number column
vim.opt.signcolumn = 'number'

-- Highlight column 80
vim.opt.colorcolumn = '80'

-- Fast update time
vim.opt.updatetime = 50

-- Enable spell check
vim.opt.spell = true

vim.opt.winborder = 'single'

-- Work around for <CR> spitting out <SNR>17_AutoPairsReturn
vim.g.AutoPairsMapCR = 0

-- Custom format command
vim.api.nvim_create_user_command('Format', function()
    vim.lsp.buf.format()
end, { desc = 'Run formater if one exists' })


----> Highlight groups <----
-- Link Spell highlights to diagnostics
vim.api.nvim_set_hl(0, "SpellBad", { link = "DiagnosticUnderlineInfo" })
vim.api.nvim_set_hl(0, "SpellCap", { link = "DiagnosticUnderlineHint" })

-- Disable highlights for rare and local spell
vim.api.nvim_set_hl(0, "SpellRare", { link = "Normal" })
vim.api.nvim_set_hl(0, "SpellLocal", { link = "Normal" })

-- Always highlight #if section in C and Cpp
vim.api.nvim_set_hl(0, "@lsp.type.comment.c", { link = "Normal" })
vim.api.nvim_set_hl(0, "@lsp.type.comment.cpp", { link = "Normal" })

-- Make most backgrounds transparent
for _, group in ipairs({ 'Normal', 'NormalNC' }) do
    vim.api.nvim_set_hl(0, group, { bg = 'none', ctermbg = 'none' })
end


----> Auto commands <----
-- Disable continuation of comments to the next line
vim.cmd 'au FileType * set fo-=c fo-=r fo-=o'

-- Set file type dosini to .conf file to treesitter highlight
vim.cmd 'au BufNewFile,BufRead *.conf setf dosini'

-- Disable winbar for nofile buffers
vim.cmd 'au VimEnter,BufWinEnter * if &filetype == "neo-tree" | setlocal winbar=%f | endif'

-- Linux Kernel dev specific configuration
local kernel_au = 'au BufNewFile,BufRead ' .. os.getenv('HOME') .. '/dev/linux_work/ set cc=81 noet ts=8'
vim.cmd(kernel_au)
