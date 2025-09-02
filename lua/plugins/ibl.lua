return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "┊" },
            scope  = { enabled = true, highlight = "RainbowViolet" },
        },
        config = function(_, opts)
            vim.opt.termguicolors = true

            local hooks = require("ibl.hooks")

            -- reset highlight group on color scheme change
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            end)

            vim.g.rainbow_delimiters = { highlight = "RainbowViolet" }

            require('ibl').setup(opts)

            hooks.register(
                hooks.type.SCOPE_HIGHLIGHT,
                hooks.builtin.scope_highlight_from_extmark
            )
        end,
    },
}

