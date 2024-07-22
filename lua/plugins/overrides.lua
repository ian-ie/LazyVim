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
            local cursor_after_pairs = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                local line_text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
                if col == #line_text then
                    return false
                end
                local char_after_cursor = line_text:sub(col + 1, col + 1)
                return char_after_cursor:match("[)}%]'\"]>") ~= nil
            end

            local cmp = require("cmp")
            local neotab = require("neotab")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
                        cmp.select_next_item()
                    elseif vim.snippet.active({ direction = 1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(1)
                        end)
                    else
                        neotab.tabout()
                        -- else
                        --     fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif vim.snippet.active({ direction = -1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(-1)
                        end)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
        end,
    },
}
