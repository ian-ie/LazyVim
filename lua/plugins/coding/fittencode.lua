return {
    "luozhiya/fittencode.nvim",
    config = function()
        require("fittencode").setup({
            completion_mode = "source",
            inline_completion = {
                enabled = true,
            },
        })
    end,
}
