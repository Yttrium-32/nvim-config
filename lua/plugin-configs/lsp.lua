local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

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

local cmp = require('cmp')
local cmp_lsp = require('cmp_nvim_lsp')
local luasnip = require('luasnip')

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

require('mason').setup {
    opts = {
        ui = {
            border = 'single'
        }
    }
}

require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'pyright',
        'clangd'
    },
})

-- Add snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- If you want to insert `(` after select function or method item
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    -- autocomplete to first option on enter
    cmp.mapping.confirm({ select = true }),

    mapping = cmp.mapping.preset.insert({
        -- Autocompletion using tab
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
        { name = 'path' },
    })
})
