return {
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "catppuccin",
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

    -- { "lukas-reineke/indent-blankline.nvim", enabled = true },
    -- { "echasnovski/mini.indentscope", enabled = false },
    { "folke/flash.nvim", opts = { modes = { search = { enabled = false } }, highlight = { backdrop = false } } },
    {
        "ahmedkhalf/project.nvim",
        opts = { patterns = { ".git", ".svn", ".vscode", "pyvenv.cfg", "pyproject.toml" }, manual_mode = false },
    },
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
            { "luozhiya/fittencode.nvim" },
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
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "fittencode" },
                -- set custom providers with fittencode
                providers = {
                    fittencode = {
                        name = "fittencode",
                        module = "fittencode.sources.blink",
                    },
                },
            },
        },
    },
}
