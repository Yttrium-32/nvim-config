vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
        prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 

    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
        }
    },
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = { 'vim', 'require' },
            }
        }
    }
})

local nproc = string.gsub(vim.fn.system('nproc'), "\n", "")
vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--header-insertion=never",
        "-j", nproc,
        "--background-index",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
})

vim.lsp.config('pyright', {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = 'off',
                extraPaths = '..'
            }
        }
    }

})

vim.api.nvim_create_autocmd('BufReadPost', {
    once = true,
    callback = function ()
        require("blink.cmp").setup({
            keymap = {
                preset = 'enter',

                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
            },

            appearance = {
                nerd_font_variant = 'normal'
            },

            completion = { documentation = { auto_show = true } },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        })

    end
})
