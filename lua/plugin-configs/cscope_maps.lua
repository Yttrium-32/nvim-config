-- Setup Cscope
require("cscope_maps").setup {
    prefix = "<C-c>",
    cscope = {
        picker = "telescope"
    }
}

-- Autocmd to rebuild database if the current dir is a C project
local group = vim.api.nvim_create_augroup("CscopeBuild", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.c", "*.h" },
  callback = function ()
    vim.cmd("Cscope build")
  end,
  group = group,
})

