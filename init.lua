require("keybinds")
require("plugins")

-- Set current colorscheme to onedark
vim.cmd("colorscheme onedark")

-- Make the background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })                                                                                                                                              
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


