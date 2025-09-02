return {
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = { "lua_ls", "pyright", "clangd" },
        }
    },

    -- LSP manager
    {
        'williamboman/mason.nvim',
        opts = {}
    },
}
