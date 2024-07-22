return {
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
        "kawre/neotab.nvim",
        event = "InsertEnter",
        opts = {},
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
        opts = { useDefaultKeymaps = true, disableKeymaps = {} },
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
            { "<leader>rf", "<cmd>%SnipRun<cr>", desc = "run file" },
            { "<leader>rs", "<Plug>SnipRun", desc = "run snip" },
            { "<leader>rc", "<Plug>SnipClose", desc = "close" },
            { "<leader>cr", "<Plug>SnipReset", desc = "reset" },
            { "<leader>r", "<Plug>SnipRun", desc = "run", mode = "v" },
        },
    },
}
