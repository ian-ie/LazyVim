return {
    {
        "tadaa/vimade",
        opts = {},
        keys = { { "<leader>uv", "<cmd>VimadeToggle<cr>", desc = "Toggle Vimade" } },
    },

    {
        "gen740/SmoothCursor.nvim",
        config = function()
            require("smoothcursor").setup({
                fancy = { enable = true },
                disable_float_win = true,
                disabled_filetypes = { "TelescopePrompt", "NvimTree", "json", "codecompanion" },
            })
        end,
    },
    {
        "mvllow/modes.nvim",
        config = function()
            require("modes").setup()
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",

        config = function()
            require("rainbow-delimiters.setup").setup({
                highlight = {
                    "SnacksIndent1",
                    "SnacksIndent2",
                    "SnacksIndent3",
                    "SnacksIndent4",
                    "SnacksIndent5",
                    "SnacksIndent6",
                    "SnacksIndent7",
                    "SnacksIndent8",
                },
            })
        end,
    },
}
