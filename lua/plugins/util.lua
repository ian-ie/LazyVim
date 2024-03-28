return {
    { "arnamak/stay-centered.nvim", opts = {} },
    {
        "ghillb/cybu.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
        config = function()
            require("cybu").setup({
                position = {
                    anchor = "centerleft",
                },
                style = {
                    path = "tail",
                },
            })
        end,
        keys = {
            { "<s-tab>", "<Plug>(CybuPrev)", desc = "CybuPrev" },
            { "<tab>", "<Plug>(CybuNext)", desc = "CybuNext" },
            -- { "<tab>", "<Plug>(CybuLastusedPrev)", desc = "CybuPrev" },
            -- { "<s-tab>", "<Plug>(CybuLastusedNext)", desc = "CybuPrev" },
        },
    },

    {
        "JuanZoran/Trans.nvim",
        build = function()
            require("Trans").install()
        end,
        keys = {
            -- 可以换成其他你想映射的键
            { "<leader>tm", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = "Translate" },
            -- { "<leader>tk", mode = { "n", "x" }, "<Cmd>TransPlay<CR>", desc = "Auto Play" },
            -- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
            { "<leader>ti", "<Cmd>TranslateInput<CR>", desc = "Translate From Input" },
        },
        dependencies = { "kkharji/sqlite.lua" },
        opts = {
            -- your configuration there
        },
    },
    {
        "glepnir/template.nvim",
        cmd = "Template",
        config = function()
            require("template").setup({
                temp_dir = "~/.config/nvim/lua/templates",
            })
        end,
        keys = {
            { "<leader>tt", ":Template ", desc = "template" },
        },
    },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- telescope 所需
            "MunifTanjim/nui.nvim",

            -- 可选
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- 配置放在这里
            cn = {
                enabled = true,
            },
            lang = "python3",
        },
    },

    {
        "folke/zen-mode.nvim",
        opts = {},
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode" },
        },
    },
    {
        "sindrets/winshift.nvim",
        config = function()
            -- Lua
            require("winshift").setup({
                window_picker = function()
                    return require("win-picker").pick_win()
                end,
            })
        end,
        keys = {
            { "<leader>wm", "<cmd>WinShift<cr>", desc = "Window Move" },
            { "<leader>ws", "<cmd>WinShift swap<cr>", desc = "Window Swap" },
        },
    },
    {
        "meeehdi-dev/win-picker.nvim",
        opts = {
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
            filter = function(id)
                local bufid = vim.api.nvim_win_get_buf(id)
                local ft = vim.api.nvim_buf_get_option(bufid, "filetype")
                return not vim.tbl_contains({ "noice", "notify" }, ft)
            end,
            hl_group = "WinPicker",
        },
        config = function(_, opts)
            vim.api.nvim_command("hi def WinPicker gui=bold guifg=#1d202f guibg=#7aa2f7")
            require("win-picker").setup(opts)
        end,
        -- stylua: ignore
        keys = {
            { "<leader>wp", function() local win_id = require("win-picker").pick_win() if win_id then vim.api.nvim_set_current_win(win_id) end end, desc = "Windows Pick", },
            { "<leader>wx", function() local win_id = require("win-picker").pick_win() if win_id then vim.api.nvim_win_close(win_id, false) end end, desc = "Windows Close", },
            { "<leader>wO", function() local win_id = require("win-picker").pick_win() if win_id then vim.api.nvim_set_current_win(win_id) vim.api.nvim_command("only") end end, desc = "Windows Pcik Only", },
        },
    },
    {
        "nvim-zh/colorful-winsep.nvim",
        config = true,
        event = { "WinNew" },
    },
}
