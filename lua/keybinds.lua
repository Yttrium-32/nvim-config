-- Bind leader key to spacebar
vim.g.mapleader = " "

-- Open filetree with F2
vim.keymap.set("n", "<F2>", vim.cmd.Ex)

-- Telescope keybinds
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Open undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
