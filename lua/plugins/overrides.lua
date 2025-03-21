return {
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "catppuccin",
        },
    },

    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            dashboard = {
                width = 72,
                sections = {
                    {
                        section = "terminal",
                        align = "center",
                        cmd = "cat " .. vim.fn.stdpath("config") .. "/header.cat",
                        height = 11,
                        width = 72,
                        padding = 1,
                    },
                    {
                        align = "center",
                        padding = 1,
                        text = {
                            { "  Update ", hl = "Label" },
                            { "  Projects ", hl = "Number" },
                            { "  Files ", hl = "DiagnosticInfo" },
                            { "  Recent ", hl = "@string" },
                            { "  Config ", hl = "@character" },
                            { " 󱒯 Lazy ", hl = "@property" },
                        },
                    },
                    { section = "startup", padding = 1 },
                    { icon = "", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    { icon = "", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { text = "", key = "f", action = ":lua Snacks.dashboard.pick('files')" },
                    { text = "", key = "l", action = ":Lazy sync" },
                    { text = "", key = "p", action = "<leader>fp" },
                    { text = "", key = "r", action = "<leader>fr" },
                    { text = "", key = "c", action = "<leader>fc" },
                    { text = "", key = "s", action = "<leader>qS" },
                    { text = "", key = "q", action = ":qa" },
                },
            },

            indent = {
                scope = {
                    hl = {
                        "SnacksIndent1",
                        "SnacksIndent2",
                        "SnacksIndent3",
                        "SnacksIndent4",
                        "SnacksIndent5",
                        "SnacksIndent6",
                        "SnacksIndent7",
                        "SnacksIndent8",
                    },
                },
            },
        },
    },

    {
        "hedyhli/outline.nvim",
        config = function()
            require("outline").setup({
                outline_window = {
                    position = "left",
                },
            })
        end,
    },

    { "folke/flash.nvim", opts = { modes = { search = { enabled = false } }, highlight = { backdrop = false } } },

    {
        "folke/noice.nvim",
        opts = {
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
            },
        },
    },

    {
        "saghen/blink.cmp",
        dependencies = {
            { "luozhiya/fittencode.nvim", "Kaiser-Yang/blink-cmp-avante", "mikavilpas/blink-ripgrep.nvim" },
        },
        opts = {

            keymap = {
                preset = "enter",
                ["<Tab>"] = {
                    LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
                    "fallback",
                },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<c-g>"] = {
                    function()
                        -- invoke manually, requires blink >v0.8.0
                        require("blink-cmp").show({ providers = { "ripgrep" } })
                    end,
                },
            },
            sources = {
                default = { "avante", "lsp", "ripgrep", "path", "snippets", "buffer", "fittencode" },
                -- completion = { trigger = { prefetch_on_insert = false } },
                -- set custom providers with fittencode
                providers = {
                    ripgrep = {
                        module = "blink-ripgrep",
                        name = "Ripgrep",
                    },
                    avante = {
                        module = "blink-cmp-avante",
                        name = "Avante",
                        opts = {
                            -- options for blink-cmp-avante
                        },
                    },
                    fittencode = {
                        name = "fittencode",
                        module = "fittencode.sources.blink",
                    },
                },
            },
        },
    },
}
