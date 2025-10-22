return {
    "yetone/avante.nvim",
    opts = {
        -- add any opts here
        -- for example
        provider = "momoca",
        windows = {
            width = 50,
        },
        providers = {
            momoca = {
                __inherited_from = "openai",
                api_key_name = "MOMOCA_DEEP_SEEK_KEY",
                endpoint = "https://ark.cn-beijing.volces.com/api/v3",
                model = "deepseek-v3-1-250821",
            },
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
                timeout = 30000, -- timeout in milliseconds
                -- temperature = 0, -- adjust if needed
                max_tokens = 4096,
                api_key_name = "OPENAI_API_KEY",
            },
        },
    },
}
