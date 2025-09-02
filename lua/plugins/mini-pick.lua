-- Simple universal picker

-- Function to center win on screen
local win_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
        anchor = 'NW', height = height, width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end

return {
    'echasnovski/mini.pick',
    version = '*',
    opts = {
        window = {
            config = win_config
        },
        mappings = {
            move_down = '<A-j>',
            move_up = '<A-k>',
        }
    },
    keys = {
        { '<leader>f', '<cmd>Pick files<CR>' },
        { '<leader>b', '<cmd>Pick buffers<CR>' }
    }
}
