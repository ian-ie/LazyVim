return {
    {
        "gen740/SmoothCursor.nvim",
        config = function()
            require("smoothcursor").setup({
                fancy = { enable = true },
                disable_float_win = true,
                disabled_filetypes = { "TelescopePrompt", "NvimTree" },
            })
        end,
    },
    {
        "mvllow/modes.nvim",
        config = function()
            require("modes").setup()
        end,
    },
}
