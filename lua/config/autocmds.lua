-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=r formatoptions-=o ",
})

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == "n" then
            vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#8aa872" })
            vim.fn.sign_define("smoothcursor", { text = "" })
        elseif current_mode == "v" then
            vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
            vim.fn.sign_define("smoothcursor", { text = "" })
        elseif current_mode == "V" then
            vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
            vim.fn.sign_define("smoothcursor", { text = "" })
        elseif current_mode == "�" then
            vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
            vim.fn.sign_define("smoothcursor", { text = "" })
        elseif current_mode == "i" then
            vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#668aab" })
            vim.fn.sign_define("smoothcursor", { text = "" })
        end
    end,
})

vim.api.nvim_create_augroup("DashboardAutoOpen", { clear = true })
vim.api.nvim_create_autocmd({ "BufDelete" }, {
    group = "DashboardAutoOpen",
    callback = function()
        vim.schedule(function()
            local buffers = vim.tbl_filter(function(buf)
                return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and vim.api.nvim_buf_get_name(buf) ~= ""
            end, vim.api.nvim_list_bufs())

            if #buffers == 0 then
                vim.cmd("lua Snacks.dashboard()")
            end
        end)
    end,
})
