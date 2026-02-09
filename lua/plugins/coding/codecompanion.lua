return {
    "olimorris/codecompanion.nvim",
    enable = false,
    config = function()
        require("codecompanion").setup({
            interactions = {
                chat = {
                    adapter = "momoca",
                },
                inline = {
                    adapter = "momoca",
                },
            },
            adapters = {
                http = {
                    ["momoca"] = function()
                        return require("codecompanion.adapters").extend("openai_compatible", {
                            env = {
                                api_key = "MOMOCA_DEEP_SEEK_KEY",
                                url = "https://ark.cn-beijing.volces.com/api",
                                chat_url = "/v3/chat/completions",
                            },
                            schema = {
                                model = {
                                    default = "deepseek-v3-2-251201",
                                },
                            },
                        })
                    end,
                },
            },
        })
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}
