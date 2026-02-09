return {
    "saghen/blink.cmp",
    dependencies = {
        {
            "luozhiya/fittencode.nvim",
            "Kaiser-Yang/blink-cmp-avante",
            "mikavilpas/blink-ripgrep.nvim",
        },
    },
    opts = {
        keymap = {
            -- preset = "enter",
            -- ["<Tab>"] = {
            --     LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
            --     "fallback",
            -- },

            -- ["<A-y>"] = require("minuet").make_blink_map(),
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
        },
        sources = {
            -- default = { "minuet", "avante", "lsp", "ripgrep", "path", "snippets", "buffer", "fittencode" },
            default = { "minuet", "avante", "lsp", "ripgrep", "path", "snippets", "buffer" },
            -- completion = { trigger = { prefetch_on_insert = false } },
            -- set custom providers with fittencode
            providers = {
                minuet = {
                    name = "minuet",
                    module = "minuet.blink",
                    async = true,
                    -- Should match minuet.config.request_timeout * 1000,
                    -- since minuet.config.request_timeout is in seconds
                    timeout_ms = 3000,
                    score_offset = 50, -- Gives minuet higher priority among suggestions

                    transform_items = function(_, items)
                        for _, item in ipairs(items) do
                            -- example: append a description to easily distinguish rg results
                            item.labelDetails = {
                                description = "(🤖minuet)",
                            }
                        end
                        return items
                    end,
                },
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    opts = {
                        prefix_min_len = 5,
                        toggles = {
                            -- The keymap to toggle the plugin on and off from blink
                            -- completion results. Example: "<leader>tg"
                            on_off = "<leader>tg",
                        },
                    },
                    max_items = 3,
                    transform_items = function(_, items)
                        for _, item in ipairs(items) do
                            -- example: append a description to easily distinguish rg results
                            item.labelDetails = {
                                description = "(🔍rg)",
                            }
                        end
                        return items
                    end,
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
                    score_offset = 10,
                    transform_items = function(_, items)
                        for _, item in ipairs(items) do
                            -- example: append a description to easily distinguish rg results
                            item.labelDetails = {
                                description = "(🔥fittencode)",
                            }
                        end
                        return items
                    end,
                },
            },
        },
        completion = { trigger = { prefetch_on_insert = false } },
    },
}
