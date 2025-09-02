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

-- Prevent n and N from inverting when searching with # or ?
keymap('n', 'n', function()
    if vim.v.searchforward == 1 then return 'n' else return 'N' end
end, { expr = true, noremap = true })
keymap('n', 'N', function()
    if vim.v.searchforward == 1 then return 'N' else return 'n' end
end, { expr = true, noremap = true })

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
        keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
        keymap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        keymap("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        keymap("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        keymap("n", "]d", function()
            vim.diagnostic.jump({
                count = 1,
            })
        end, opts)
        keymap("n", "[d", function()
            vim.diagnostic.jump({
                count = -1,
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
