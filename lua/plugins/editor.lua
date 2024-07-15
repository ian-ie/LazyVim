return {
    -- 加速j k
    {
        "rainbowhxch/accelerated-jk.nvim",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)", mode = "n" },
            { "k", "<Plug>(accelerated_jk_gk)", mode = "n" },
        },
    },
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({ use_default_keymaps = false, max_join_length = 500 })
        end,
        keys = { { "<leader>ts", "<cmd>TSJToggle<cr>", desc = "Splitting/Joining Blocks" } },
        cmd = "TSJToggle",
    },
    {
        "rareitems/printer.nvim",
        config = function()
            require("printer").setup({
                keymap = "<leader>tp", -- Plugin doesn't have any keymaps by default
                behavior = "insert_below", -- how operator should behave
                -- "insert_below" will insert the text below the cursor
                --  "yank" will not insert but instead put text into the default '"' register
                formatters = {
                    lua = function(inside, variable)
                        local function trans(input)
                            local functionName, param = input:match("([^%(]+)%(([^%)]+)%)")
                            return functionName, param
                        end
                        local func, param = trans(variable)
                        vim.notify(string.format('sysLog.debug("%s,%s:", %s)', func, param, param))
                        return string.format('sysLog.debug("%s,%s:", %s)', func, param, param)
                    end,
                },
                -- function which modifies the text inside string in the print statement, by default it adds the path and line number
                add_to_inside = function(text)
                    return string.format("[%s:%s] %s", vim.fn.expand("%"), vim.fn.line("."), text)
                end,
            })
        end,
    },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "smoka7/hydra.nvim",
        },
        opts = {},
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        keys = {
            {
                "<Leader>m",
                "<cmd>MCstart<cr>",
                mode = { "v", "n" },
                desc = "Create a selection for selected text or word under the cursor",
            },
        },
    },
}
