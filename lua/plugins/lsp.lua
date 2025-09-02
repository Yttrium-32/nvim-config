return {
    -- Plugin for LSP configuration
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
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

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup(
                    'LspSetupGroup', { clear = true }
                ),
                callback = function ()
                    vim.diagnostic.config({
                        virtual_lines = {
                            current_line = true,
                            prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 

                        },
                        severity_sort = true,
                        signs = {
                            text = {
                                [vim.diagnostic.severity.ERROR] = ' ',
                                [vim.diagnostic.severity.WARN] = ' ',
                                [vim.diagnostic.severity.INFO] = ' ',
                                [vim.diagnostic.severity.HINT] = ' ',
                            }
                        },
                    })

                end
            })
        end
    },

    -- Code snippets
    {
        'L3MON4D3/LuaSnip',
        -- follow latest release.
        version = 'v2.*',
        -- install jsregexp (optional!).
        build = 'make install_jsregexp',
        -- Code snippet source
        dependencies = { 'rafamadriz/friendly-snippets' }
    },

    -- Auto completion engine
    {
        'saghen/blink.cmp',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',

        opts = {
            keymap = {
                preset = 'enter',
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
            },
            appearance = { nerd_font_variant = 'normal' },
            completion = { documentation = { auto_show = true } },
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
}
