return {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    opts = {
        selection = {
            hint_display = "none",
        },

        web_search_engine = {
            provider = "tavily", -- tavily, serpapi, google, kagi, brave 或 searxng
            proxy = "http://127.0.0.1:7890", -- proxy support, e.g., http://127.0.0.1:7890
        },
        behaviour = {
            enable_claude_text_editor_tool_mode = true,
        },
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
                endpoint = "https://ark.cn-beijing.volces.com/api/v3/",
                model = "deepseek-v3-1-250821",
                -- model = "deepseek-v3-2-251201",
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
