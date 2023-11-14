return {
    {
        "voldikss/vim-translator",
        lazy = true,
        keys = {
            { "gt", "<cmd>TranslateW<cr>", desc = "to cn", mode = { "n", "v" } },
            { "gT", "<cmd>TranslateW --target_lang=en<cr>", desc = "to en", mode = { "v", "n" } },
        },
    },
    {
        "meeehdi-dev/win-picker.nvim",
        opts = {
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
            filter = function(id)
                local bufid = vim.api.nvim_win_get_buf(id)
                local ft = vim.api.nvim_buf_get_option(bufid, "filetype")
                return not vim.tbl_contains({ "noice", "notify" }, ft)
            end,
            hl_group = "WinPicker",
        },
        config = function(_, opts)
            vim.api.nvim_command("hi def WinPicker gui=bold guifg=#1d202f guibg=#7aa2f7")
            require("win-picker").setup(opts)
        end,
        keys = {
            {
                "<leader>wp",
                function()
                    local win_id = require("win-picker").pick_win()
                    if win_id then
                        vim.api.nvim_set_current_win(win_id)
                    end
                end,
                desc = "Windows pick",
            },
        },
    },
}
