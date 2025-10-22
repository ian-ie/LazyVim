return {
    "rmagatti/goto-preview",
    enabled = true,
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
}
