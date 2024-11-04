-- Some local variables for ease of use
local augroup = vim.api.nvim_create_augroup
local LspBindGroup = augroup('LspBindGroup', {})
local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set

-- Bind leader key to spacebar and local leader o \\
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Move line up and down in normal mode using Alt + j/k
keymap('n', '<A-k>', ':m .-2<CR>==', {silent=true})
keymap('n', '<A-j>', ':m .+1<CR>==', {silent=true})

-- Quickly insert new line
keymap('n', '<Leader>o', 'o<Esc>k', {})
keymap('n', '<Leader>O', 'O<Esc>j', {})

-- Open filetree with F2
keymap("n", "<F2>", ':Neotree toggle right reveal<CR>', {silent=true})

-- Navigation of bufferline
keymap('n', '<S-w>l', ':BufferLineCycleNext<CR>', {noremap=true})
keymap('n', '<S-w>h', ':BufferLineCyclePrev<CR>', {noremap=true})
keymap('n', '<S-w>f', ':BufferLinePick<CR>', {noremap=true})

-- Open undotree
keymap('n', '<leader>u', vim.cmd.UndotreeToggle)

-- LSP specific keybinds
autocmd('LspAttach', {
    group = LspBindGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
        keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
        keymap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        keymap("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        keymap("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        keymap("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        keymap("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

-- trouble.nvim default keybinds
local trouble = require("trouble")
vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end)
vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end)
vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end)

