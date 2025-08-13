return {
    {
        "olimorris/codecompanion.nvim",
        config = function()
            require("codecompanion").setup({
                strategies = {
                    chat = {
                        adapter = "momoca",
                    },
                    inline = {
                        adapter = "momoca",
                    },
                },
                adapters = {
                    momoca = function()
                        return require("codecompanion.adapters").extend("openai_compatible", {
                            env = {
                                api_key = "MOMOCA_DEEP_SEEK_KEY",
                                url = "https://ark.cn-beijing.volces.com/api",
                                chat_url = "/v3/chat/completions",
                            },
                            schema = {
                                model = {
                                    default = "ep-20250214154028-jkrtk",
                                },
                            },
                        })
                    end,
                },
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "yetone/avante.nvim",
        enable = false,
        event = "VeryLazy",
        version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
        opts = {
            -- add any opts here
            -- for example
            provider = "momoca",
            windows = {
                width = 50,
            },
            providers = {
                momoca = {
                    __inherited_from = "openai",
                    api_key_name = "MOMOCA_DEEP_SEEK_KEY",
                    endpoint = "https://ark.cn-beijing.volces.com/api/v3",
                    model = "ep-20250214154028-jkrtk",
                },
                openai = {
                    endpoint = "https://api.openai.com/v1",
                    model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
                    timeout = 30000, -- timeout in milliseconds
                    -- temperature = 0, -- adjust if needed
                    max_tokens = 4096,
                    api_key_name = "OPENAI_API_KEY",
                },
            },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
            -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "echasnovski/mini.icons", -- or echasnovski/mini.icons
            -- "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- Make sure to set this up properly if you have lazy=true
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    {
        "luozhiya/fittencode.nvim",
        config = function()
            require("fittencode").setup({
                completion_mode = "source",
                inline_completion = {
                    enabled = true,
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
    {
        "mizlan/iswap.nvim",
        event = "VeryLazy",
    },
    -- {
    --     "gbprod/substitute.nvim",
    --     opts = {
    --         -- your configuration comes here
    --         -- or leave it empty to use the default settings
    --         -- refer to the configuration section below
    --     },
    -- },
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
