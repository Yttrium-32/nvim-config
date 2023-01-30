vim.g.mapleader = " "
local keymap = vim.api.nvim_set_keymap

function setup_make_file ()
  print("hello")
end

local function build_and_run ()
  print("hello")
end

keymap('n', '<F2>', ':NvimTreeToggle<CR>', {silent=true})
keymap('n', '<C-e>', '$', {})
keymap('n', '<C-a>', '0', {})

-- Move line up and down in normal mode using Alt + j/k
keymap('n', '<A-k>', ':m .-2<CR>==', {silent=true})
keymap('n', '<A-j>', ':m .+1<CR>==', {silent=true})

-- Quickly insert new line
keymap('n', '<Leader>o', 'o<Esc>k', {})
keymap('n', '<Leader>O', 'O<Esc>j', {})

-- Better split navigation
keymap('n', '<C-j>', '<C-w><C-j>', {noremap=true})
keymap('n', '<C-k>', '<C-w><C-k>', {noremap=true})
keymap('n', '<C-h>', '<C-w><C-h>', {noremap=true})
keymap('n', '<C-l>', '<C-w><C-l>', {noremap=true})

-- Navigation of bufferline
keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', {noremap=true, silent=true})
keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', {noremap=true, silent=true})

-- Close current buffer WITHOUT SAVING
keymap('n', '<C-w>', ':bd<CR>', {})

-- Pick buffer to navigate to
keymap('n', 'f', ':BufferLinePick<CR>', {})

-- Save all open buffers
keymap('n', '<C-s>', ':wa<CR>', {})
keymap('i', '<C-s>', ':wa<CR>', {})

-- Easy C execution and setup
keymap('n', '<F9>', '<cmd>lua build_and_run<CR>', {})
keymap('n', '<F12>', '<cmd>lua setup_make_file<CR>', {})



