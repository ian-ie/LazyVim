return {
    {
        "OscarCreator/rsync.nvim",
        build = "make",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("rsync").setup()
        end,
    },

    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        keys = { { "<leader>z", "<cmd>NoNeckPain<cr>", desc = "Zen Mode" } },
    },

    {
        "cshuaimin/ssr.nvim",
        keys = {
            {
                "<leader>fS",
                function()
                    require("ssr").open()
                end,
                desc = "ssr",
                mode = { "n", "x" },
            },
        },

        config = function()
            require("ssr").setup({
                border = "rounded",
                min_width = 50,
                min_height = 5,
                max_width = 120,
                max_height = 25,
                adjust_window = true,
                keymaps = {
                    close = "q",
                    next_match = "n",
                    prev_match = "N",
                    replace_confirm = "<cr>",
                    replace_all = "<leader><cr>",
                },
            })
        end,
    },
    {
        "chrisgrieser/nvim-rip-substitute",
        cmd = "RipSubstitute",
        keys = {
            {
                "<leader>fs",
                function()
                    require("rip-substitute").sub()
                end,
                mode = { "n", "x" },
                desc = " rip substitute",
            },
        },
    },
    {
        "LintaoAmons/bookmarks.nvim",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
            { "stevearc/dressing.nvim" }, -- optional: to have the same UI shown in the GIF
        },
        opts = {
            signs = { mark = { icon = "🚩", color = "#86e1fc" } },
        },
        keys = {
            {
                "mm",
                "<cmd>BookmarksMark<cr>",
                desc = "Mark current line into active BookmarkList.",
                mode = { "n", "v" },
            },
            {
                "mo",
                "<cmd>BookmarksGoto<cr>",
                desc = "Go to bookmark at current active BookmarkList",
                mode = { "n", "v" },
            },
            { "ma", "<cmd>BookmarksCommands<cr>", desc = "Find and trigger a bookmark command.", mode = { "n", "v" } },
            {
                "mg",
                "<cmd>BookmarksGotoRecent<cr>",
                desc = "Go to latest visited/created Bookmark",
                mode = { "n", "v" },
            },
        },
    },

    { "toppair/reach.nvim", lazy = false, opts = { show_current = true } },
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        keys = {
            { "<LocalLeader>n", "<cmd>Neorg index<cr>", desc = "Neorg Index" },
            { "<LocalLeader>r", "<cmd>Neorg return<cr>", desc = "Neorg Return" },
            { "<LocalLeader>N", "<Plug>(neorg.dirman.new-note)", desc = "New Note" },
            { "<LocalLeader><space>", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", desc = "Task Cycle" },
        },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                },
            })
        end,
    },
    {
        "arnamak/stay-centered.nvim",
        opts = { skip_filetypes = { "snacks_dashboard" } },
        enabled = true,
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
            { "<leader>wM", "<cmd>WinShift<cr>", desc = "Window Move" },
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
