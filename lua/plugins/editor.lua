return {
    -- 加速j k
    {
        "rainbowhxch/accelerated-jk.nvim",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)", mode = "n" },
            { "k", "<Plug>(accelerated_jk_gk)", mode = "n" },
        },
    },
    -- C-a 增强
    {
        "monaqa/dial.nvim",
        keys = {
            { "<C-a>", "<Plug>(dial-increment)", desc = "dial-increment" },
            { "<C-x>", "<Plug>(dial-decrement)", desc = "dial-decrement" },
        },
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group({
                default = {
                    augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
                    augend.constant.alias.bool, -- boolean value (true <-> false)
                    augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
                    augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
                },
            })
        end,
    },
    -- 多光标
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        branch = "master",
        enable = false,
        init = function()
            vim.g.VM_maps = {
                ["Find Under"] = "<C-n>",
                -- ["Find Subword Under"] = "<C-u>",
                -- ["Select All"] = "<C-a>",
                -- ["Select h"] = "<C-h>",
                -- ["Select l"] = "<C-l>",
                ["Add Cursor Up"] = "<C-k>",
                ["Add Cursor Down"] = "<C-j>",
                ["Add Cursor At Pos"] = "<C-c>",
                -- ["Add Cursor At Word"] = "<C-w>",
                ["Remove Region"] = "q",
            }
        end,
    },
}
