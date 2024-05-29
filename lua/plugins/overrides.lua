return {
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
    {
        "which-key.nvim",
        opts = {
            defaults = {
                ["<localleader>"] = {
                    i = { name = "+insert", ["🚫"] = "which_key_ignore" },
                    l = { name = "+list", ["🚫"] = "which_key_ignore" },
                    m = { name = "+mode", ["🚫"] = "which_key_ignore" },
                    n = { name = "+note", ["🚫"] = "which_key_ignore" },
                    t = { name = "+mark", ["🚫"] = "which_key_ignore" },
                },
            },
        },
    },
    -- { "lukas-reineke/indent-blankline.nvim", enabled = true },
    -- { "echasnovski/mini.indentscope", enabled = false },
    { "folke/flash.nvim", opts = { modes = { search = { enabled = false } }, highlight = { backdrop = false } } },
    { "ahmedkhalf/project.nvim", opts = { patterns = { ".git", ".svn", ".vscode" }, manual_mode = false } },
    {
        "folke/noice.nvim",
        opts = {
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
            },
        },
    },
    -- Use <tab> for completion and snippets (supertab)
    -- first: disable default <tab> and <s-tab> behavior in LuaSnip
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })
        end,
    },
    -- then: setup supertab in cmp
    {
        "hrsh7th/nvim-cmp",
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- this way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
        end,
    },
}
