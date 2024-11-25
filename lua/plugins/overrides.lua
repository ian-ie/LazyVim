return {
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "catppuccin-macchiato",
        },
    },
    {
        "catppuccin/nvim",
        opts = {
            flavor = "macchiato",
            term_colors = true,
            dim_inactive = {
                enabled = true, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
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
        },
    },
}
