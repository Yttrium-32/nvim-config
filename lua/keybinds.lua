-- Some local variables for ease of use
local augroup = vim.api.nvim_create_augroup
local LspBindGroup = augroup('LspBindGroup', {})
local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set

-- Bind leader key to spacebar and local leader o \\
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Move line up and down in normal mode using Alt + j/k
keymap('n', '<A-k>', ':m .-2<CR>==', { silent = true })
keymap('n', '<A-j>', ':m .+1<CR>==', { silent = true })

-- Quickly insert new line
keymap('n', '<Leader>o', 'o<Esc>k', {})
keymap('n', '<Leader>O', 'O<Esc>j', {})

-- Open filetree with F2
keymap("n", "<F2>", ':Neotree toggle right reveal<CR>', { silent = true })

-- Navigation of bufferline
keymap('n', '<S-w>l', ':BufferLineCycleNext<CR>', { noremap = true })
keymap('n', '<S-w>h', ':BufferLineCyclePrev<CR>', { noremap = true })
keymap('n', '<S-w>f', ':BufferLinePick<CR>', { noremap = true })

-- Open undotree
keymap('n', '<leader>u', vim.cmd.UndotreeToggle)

-- LSP specific key binds
autocmd('LspAttach', {
    group = LspBindGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
        keymap("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        keymap("n", "K", function()
            vim.lsp.buf.hover({
                border = _Border
            })
        end, opts)
        keymap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        keymap("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        keymap("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        keymap("n", "]d", function()
            vim.diagnostic.jump({
                count = 1,
                float = {
                    border = _Border
                }
            })
        end, opts)
        keymap("n", "[d", function()
            vim.diagnostic.jump({
                count = -1,
                float = {
                    border = _Border
                }
            })
        end, opts)
    end
})

-- trouble.nvim default key binds
vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle focus=true<CR>", { silent = true })
vim.keymap.set("n", "<leader>xX", ":Trouble diagnostics toggle filter.buf=0 focus=true<CR>", { silent = true })
vim.keymap.set("n", "<leader>cs", ":Trouble symbols toggle focus=false<CR>")
vim.keymap.set("n", "<leader>cl", ":Trouble lsp toggle focus=false win.position=right<CR>")
vim.keymap.set("n", "<leader>xl", ":Trouble loclist toggle<cr>")
vim.keymap.set("n", "<leader>xq", ":Trouble qflist toggle<CR>")

-- Suggested key binds for gitsigns
local gitsigns = require('gitsigns')
-- Navigation
local nxt_hck_key = ']h'
local prv_hck_key = '[h'
vim.keymap.set('n', nxt_hck_key, function()
    if vim.wo.diff then
        vim.cmd.normal({ nxt_hck_key, bang = true })
    else
        gitsigns.nav_hunk('next')
    end
end)

vim.keymap.set('n', prv_hck_key, function()
    if vim.wo.diff then
        vim.cmd.normal({ prv_hck_key, bang = true })
    else
        gitsigns.nav_hunk('prev')
    end
end)
-- Actions
vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
vim.keymap.set('v', '<leader>hs', function()
    gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
end)
vim.keymap.set('v', '<leader>hr', function()
    gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
end)
vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer)
vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk)
vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer)
vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
vim.keymap.set('n', '<leader>hb', function()
    gitsigns.blame_line { full = true }
end)
vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame)
vim.keymap.set('n', '<leader>hd', gitsigns.diffthis)
vim.keymap.set('n', '<leader>hD', function() gitsigns.diffthis('~') end)
vim.keymap.set('n', '<leader>td', gitsigns.toggle_deleted)
-- Text object
vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
