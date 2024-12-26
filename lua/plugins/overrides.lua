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
                        cmd = "cat " .. vim.fn.stdpath("config") .. "/lua/config/header.cat",
                        height = 11,
                        width = 72,
                        padding = 1,
                    },
                    {
                        align = "center",
                        padding = 1,
                        text = {
                            { "  Update ", hl = "Label" },
                            { "  Sessions ", hl = "@property" },
                            { "  Projects ", hl = "Number" },
                            { "  Files ", hl = "DiagnosticInfo" },
                            { "  Recent ", hl = "@string" },
                            { "  Config ", hl = "@property" },
                        },
                    },
                    { section = "startup", padding = 1 },
                    { icon = "", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    { icon = "", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { text = "", key = "f", action = ":lua Snacks.dashboard.pick('files')" },
                    { text = "", key = "p", action = "<leader>fp" },
                    { text = "", key = "r", action = "<leader>fr" },
                    { text = "", key = "c", action = "<leader>fc" },
                    { text = "", key = "s", action = "<leader>qS" },
                    { text = "", key = "q", action = ":qa" },
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
