return {
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
                                default = "deepseek-v3-1-250821",
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
}
