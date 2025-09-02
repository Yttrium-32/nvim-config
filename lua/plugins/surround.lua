-- Surround text with stuff
return {
    'tpope/vim-surround',
    event = { "BufReadPost", "BufNewFile" },
    keys = {
        -- Work around for <CR> spitting out <SNR>17_AutoPairsReturn
        { "<CR>", "<CR><Plug>AutoPairsReturn", "i", { silent = true } }
    }
}
