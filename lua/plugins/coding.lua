return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            {
                "<leader>aa",
                "<cmd>CodeCompanionChat Toggle<cr>",
                desc = "toggle codecompanion",
                mode = { "n", "o", "x" },
            },
            {
                "<leader>ac",
                "<cmd>CodeCompanionActions<cr>",
                desc = "toggle codecompanion",
            },
        },
        opts = {
            opts = {
                languages = "chinese",
            },
            strategies = {
                chat = {
                    adapter = "deepseek",
                },
                inline = {
                    adapter = "openai",
                },
            },
            adapters = {
                openai = function()
                    return require("codecompanion.adapters").extend("openai", {})
                end,

                deepseek = function()
                    return require("codecompanion.adapters").extend("deepseek", {})
                end,
            },
        },
    },

    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        opts = {
            arg = "lt",
            lang = "python3",
            injector = {
                ["python3"] = { before = { "from math import inf", "from typing import List" } },
            },
            cn = {
                enabled = true,
            },
        },
    },
    {
        "luozhiya/fittencode.nvim",
        config = function()
            require("fittencode").setup({
                completion_mode = "source",
                inline_completion = {
                    enabled = false,
                },
            })
        end,
    },
    {
        "abecodes/tabout.nvim",
        event = "VeryLazy",
        config = function()
            require("tabout").setup({
                tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = "<C-d>", -- reverse shift default action,
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = "`", close = "`" },
                    { open = "(", close = ")" },
                    { open = "[", close = "]" },
                    { open = "{", close = "}" },
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {}, -- tabout will ignore these filetypes
            })
        end,
    },
    { "max397574/better-escape.nvim", opts = {} },
    { "spin6lock/vim_sproto", ft = "sproto" },
    { "echasnovski/mini.align", version = false, opts = {} },
    --窗口预览goto
    {
        "rmagatti/goto-preview",
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require("goto-preview").setup({
                default_mappings = true,
                post_open_hook = function(_, win)
                    -- Close the current preview window with <Esc>
                    vim.keymap.set("n", "<Esc>", function()
                        vim.api.nvim_win_close(win, true)
                    end, { buffer = true })
                    vim.keymap.set("n", "q", function()
                        vim.api.nvim_win_close(win, true)
                    end, { buffer = true })
                end,
            })
        end,
    },
    {
        "chrisgrieser/nvim-spider",
        lazy = "true",
        keys = {
            { "w", "<cmd>lua require('spider').motion('w')<CR>", desc = "Spider-w", mode = { "n", "o", "x" } },
            { "e", "<cmd>lua require('spider').motion('e')<CR>", desc = "Spider-e", mode = { "n", "o", "x" } },
            { "b", "<cmd>lua require('spider').motion('b')<CR>", desc = "Spider-b", mode = { "n", "o", "x" } },
        },
    },
    {
        "chrisgrieser/nvim-various-textobjs",
        lazy = false,
        opts = { keymaps = { useDefaults = true } },
    },
    {
        "johmsalas/text-case.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("textcase").setup({})
            require("telescope").load_extension("textcase")
        end,
        keys = {
            { "<leader>tr", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Text Case" },
        },
        cmd = {
            -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
            "Subs",
            "TextCaseOpenTelescope",
            "TextCaseOpenTelescopeQuickChange",
            "TextCaseOpenTelescopeLSPChange",
            "TextCaseStartReplacingCommand",
        },
        -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
        -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
        -- available after the first executing of it or after a keymap of text-case.nvim has been used.
        lazy = false,
    },
    {
        "michaelb/sniprun",
        enabled = true,
        branch = "master",

        build = "sh install.sh",
        -- do 'sh install.sh 1' if you want to force compile locally
        -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

        config = function()
            require("sniprun").setup({
                -- your options
            })
        end,
        keys = {
            { "<Leader>rf", "<cmd>%SnipRun<cr>", desc = "run file" },
            { "<Leader>rr", "<Plug>SnipRun", desc = "run snip" },
            { "<Leader>rc", "<Plug>SnipClose", desc = "close" },
            { "<Leader>rR", "<Plug>SnipReset", desc = "reset" },
            { "<Leader>r", "<Plug>SnipRun", desc = "run", mode = "v" },
        },
    },
}
