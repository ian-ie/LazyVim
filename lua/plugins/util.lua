return {
    {
        "voldikss/vim-translator",
        lazy = true,
        keys = {
            { "gt", "<cmd>TranslateW<cr>", desc = "to cn", mode = { "n", "v" } },
            { "gT", "<cmd>TranslateW --target_lang=en<cr>", desc = "to en", mode = { "v", "n" } },
        },
    },
}
