require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "python",
    "json",
    "html",
    "css",
    "markdown",
    "bash",
  },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "html", "css", "htmldjango" }
  },

  indent = { enable = true },
  autopairs = { enable = true },
  autotag = { enable = true },
  markid = { enable = false }
}
