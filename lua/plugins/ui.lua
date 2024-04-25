return {
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require("hlchunk").setup({
                chunk = { style = { { fg = "#91bef0" } } },
                blank = { enable = false },
                line_num = { use_treesitter = true, style = "#91bef0" },
            })
        end,
    },
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
    {
        "eandrju/cellular-automaton.nvim",
    },
}
