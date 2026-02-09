return {
    "milanglacier/minuet-ai.nvim",
    config = function()
        require("minuet").setup({
            provider = "openai_compatible",
            provider_options = {
                openai_compatible = {
                    end_point = "https://ark.cn-beijing.volces.com/api/v3/chat/completions",
                    model = "deepseek-v3-2-251201",
                    api_key = "MOMOCA_DEEP_SEEK_KEY",
                    name = "deepseek",
                    optional = {
                        max_tokens = 256,
                        top_p = 0.9,
                    },
                },
            },
            virtualtext = {
                auto_trigger_ft = { "lua" },
                keymap = {
                    -- accept whole completion
                    accept = "<A-A>",
                    -- accept one line
                    accept_line = "<A-a>",
                    -- accept n lines (prompts for number)
                    -- e.g. "A-z 2 CR" will accept 2 lines
                    accept_n_lines = "<A-z>",
                    -- Cycle to prev completion item, or manually invoke completion
                    prev = "<A-[>",
                    -- Cycle to next completion item, or manually invoke completion
                    next = "<A-]>",
                    dismiss = "<A-e>",
                },
            },
        })
    end,
}
