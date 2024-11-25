return {
    -- 加速j k
    {
        "rainbowhxch/accelerated-jk.nvim",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)", mode = "n" },
            { "k", "<Plug>(accelerated_jk_gk)", mode = "n" },
        },
    },
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({ use_default_keymaps = false, max_join_length = 500 })
        end,
        keys = { { "<leader>ts", "<cmd>TSJToggle<cr>", desc = "Splitting/Joining Blocks" } },
        cmd = "TSJToggle",
    },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "smoka7/hydra.nvim",
        },
        opts = {},
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        keys = {
            {
                "<Leader>m",
                "<cmd>MCstart<cr>",
                mode = { "v", "n" },
                desc = "Create a selection for selected text or word under the cursor",
            },
        },
    },
}
