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

vim.api.nvim_create_user_command("OpenInDOpus", function()
    -- 获取当前文件的完整路径
    local current_file = vim.fn.expand("%:p")

    -- 将 /mnt/c/ 转换为 C:\ 并处理其余路径
    local function convert_wsl_to_windows_path(path)
        local drive = path:match("^/mnt/(%a)/")
        if drive then
            path = path:gsub("^/mnt/(%a)/", drive:upper() .. ":\\")
            path = path:gsub("/", "\\")
        end
        return path
    end

    local windows_path = convert_wsl_to_windows_path(current_file)
    local dopus_cmd = '"/mnt/e/tools/Directory Opus/dopusrt.exe" /cmd Go NEWTAB PATH="' .. windows_path .. '"'

    -- 使用 nohup 将命令放到后台执行，并避免终端相关错误
    local full_cmd = "nohup " .. dopus_cmd .. " > /dev/null 2>&1 &"
    os.execute(full_cmd)
end, {})
