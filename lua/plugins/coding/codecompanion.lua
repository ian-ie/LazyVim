return {
    "olimorris/codecompanion.nvim",
    enable = false,
    config = function()
        require("codecompanion").setup({
            providers = {
                gemini = {
                    model = " gemini-3-pro-preview",
                },
            },
            interactions = {
                chat = {
                    adapter = "qwen",
                },
                inline = {
                    adapter = "qwen",
                },
            },
            adapters = {
                http = {
                    ["deepseek"] = function()
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
                    ["qwen"] = function()
                        return require("codecompanion.adapters").extend("openai_compatible", {
                            env = {
                                api_key = "YOUR_DASHSCOPE_API_KEY", -- 建议直接写 Key 或使用环境变量
                                url = "https://dashscope.aliyuncs.com/compatible-mode/v1",
                                chat_url = "/chat/completions",
                            },
                            schema = {
                                model = {
                                    default = "qwen3-max",
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
