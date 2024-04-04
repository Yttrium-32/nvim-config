-- Some local variables for ease of use
local augroup = vim.api.nvim_create_augroup
local LspBindGroup = augroup('LspBindGroup', {})
local autocmd = vim.api.nvim_create_autocmd
local builtin = require('telescope.builtin')
local keymap = vim.keymap.set

-- Bind leader key to spacebar
vim.g.mapleader = " "

-- Move line up and down in normal mode using Alt + j/k
keymap('n', '<A-k>', ':m .-2<CR>==', {silent=true})
keymap('n', '<A-j>', ':m .+1<CR>==', {silent=true})

-- Quickly insert new line
keymap('n', '<Leader>o', 'o<Esc>k', {})
keymap('n', '<Leader>O', 'O<Esc>j', {})

-- Open filetree with F2
keymap("n", "<F2>", ':Neotree toggle right reveal<CR>', {silent=true})

-- Telescope keybinds
keymap('n', '<leader>pf', builtin.find_files, {})
keymap('n', '<C-p>', builtin.git_files, {})
keymap('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

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

