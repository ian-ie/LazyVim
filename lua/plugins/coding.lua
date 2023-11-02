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
}
