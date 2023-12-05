return {
    { "max397574/better-escape.nvim", opts = {} },
    { "spin6lock/vim_sproto", ft = "sproto" },
    {
        "junegunn/vim-easy-align",
        keys = {
            { "ga", "<plug>(EasyAlign)", desc = "align", mode = "x" },
            { "ga", "<plug>(EasyAlign)", desc = "align", mode = "n" },
        },
        config = function()
            vim.cmd([[
                let g:easy_align_delimiters = {
                    \ 'l': { 'pattern': '--\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] }
                    \ }
                ]])
        end,
    },
    --窗口预览goto
    {
        "rmagatti/goto-preview",
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require("goto-preview").setup({
                default_mappings = true,
                post_open_hook = function(_, win)
                    -- Close the current preview window with <Esc>
                    vim.keymap.set("n", "<Esc>", function()
                        vim.api.nvim_win_close(win, true)
                    end, { buffer = true })
                    vim.keymap.set("n", "q", function()
                        vim.api.nvim_win_close(win, true)
                    end, { buffer = true })
                end,
            })
        end,
    },
    {
        "chrisgrieser/nvim-various-textobjs",
        lazy = false,
        opts = { useDefaultKeymaps = true, disableKeymaps = {} },
    },
}
