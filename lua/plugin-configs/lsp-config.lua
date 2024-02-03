-- Configuration for lsp
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lsp_zero.set_sign_icons({
  error = " ",
  warn = " ",
  hint = "",
  info = " "
})

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

-- Mason config
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "pyright", "marksman", "clangd", "tailwindcss"},
  handlers = {
    default_setup,

    -- Add configurations for each lsp here
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "use" }
            }
          }
        }
      })
    end,

    pyright = function ()
      require('lspconfig').pyright.setup({
        filetypes = { 'python' },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off"
            }
          }
        }
      })
    end,

    tailwindcss = function ()
      require('lspconfig').tailwindcss.setup({
        filetypes = { "html", "htmldjango" }
      })
    end,

    html = function ()
      require('lspconfig').html.setup({
        filetypes = { "html", "htmldjango" }
      })
    end,

  },
})

