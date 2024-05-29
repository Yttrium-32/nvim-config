local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local signs = {
    { name = 'DiagnosticSignError', text = ' ' },
    { name = 'DiagnosticSignWarn', text = ' ' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = ' ' },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

local cmp = require('cmp')
local cmp_lsp = require('cmp_nvim_lsp')
local luasnip = require('luasnip')

local capabilities = vim.tbl_deep_extend(
'force',
{},
vim.lsp.protocol.make_client_capabilities(),
cmp_lsp.default_capabilities())

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'lua_ls',
		'tsserver',
        'pyright'
	},
	handlers = {
		function(server_name) -- default handler (optional)

			require('lspconfig')[server_name].setup {
				capabilities = capabilities
			}
		end,

		['lua_ls'] = function()
			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' },
						}
					}
				}
			}
		end,
	}
})

-- If you want insert `(` after select function or method item

cmp.setup({
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

vim.diagnostic.config({
    signs = {
        active = signs
    },
	-- update_in_insert = true,
	float = {
		focusable = true,
		style = 'minimal',
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})

require('lspconfig').pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = 'off',
                extraPaths = '..'
            }
        }
    }
})

