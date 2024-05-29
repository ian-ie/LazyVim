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
        tag = "v0.2.0",
        config = function()
            require("modes").setup()
        end,
    },
}
