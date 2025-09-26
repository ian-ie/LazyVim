-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 在保存文件时，设置文件格式为 Unix，以移除 ^M 符号
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "setlocal fileformat=unix",
})

vim.api.nvim_create_autocmd("BufEnter", {
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
-- vim.api.nvim_create_autocmd({ "BufDelete" }, {
--     group = "DashboardAutoOpen",
--     callback = function()
--         vim.schedule(function()
--             local buffers = vim.tbl_filter(function(buf)
--                 return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and vim.api.nvim_buf_get_name(buf) ~= ""
--             end, vim.api.nvim_list_bufs())
--
--             if #buffers == 0 then
--                 vim.cmd("lua Snacks.dashboard()")
--             end
--         end)
--     end,
-- })

-- 创建一个自定义命令 :FormatJsonPaste
vim.api.nvim_create_user_command("FormatJsonPaste", function()
    -- 检查当前缓冲区是否为空
    if vim.api.nvim_buf_line_count(0) > 1 or vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] ~= "" then
        print("Error: FormatJsonPaste can only be used in an empty buffer")
        return
    end

    -- 禁用当前缓冲区的自动格式化
    vim.b.autoformat = false

    local json = nil
    if vim.g.neovide then
        json = vim.fn.getreg("+")
    else
        local handle = io.popen("powershell.exe Get-Clipboard -Raw")
        if not handle then
            print("Error: Failed to open clipboard")
            return
        end
        json = handle:read("*a")
        handle:close()
    end

    -- 检查内容是否是有效的 JSON
    local function is_valid_json(json_str)
        local success, _ = pcall(function()
            return vim.fn.json_decode(json_str)
        end)
        return success
    end

    if not is_valid_json(json) then
        print("Error: Clipboard content is not valid JSON")
        return
    end

    -- 写入临时文件
    local tmpfile = vim.fn.tempname()
    local f = io.open(tmpfile, "w")
    f:write(json)
    f:close()

    -- 使用 jq 格式化 JSON，使用一个制表符缩进
    local handle = io.popen("jq -M --tab . " .. tmpfile)
    if not handle then
        print("Error: Failed to format JSON using jq")
        return
    end
    local formatted_json = handle:read("*a")
    handle:close()

    -- 删除临时文件
    os.remove(tmpfile)

    -- 确保格式化后的 JSON 是多行的
    local formatted_lines = vim.split(formatted_json:gsub("\r\n", "\n"), "\n")
    -- 将格式化后的 JSON 多行粘贴到当前缓冲区
    vim.api.nvim_put(formatted_lines, "l", true, true)
end, {})

local function convert_timestamp_to_china_time()
    -- 获取光标下的单词
    local word = vim.fn.expand("<cword>")

    -- 校验是否为纯数字
    if not word:match("^%d+$") then
        vim.api.nvim_echo({ { "错误：非数字时间戳", "ErrorMsg" } }, true, {})
        return
    end

    -- 校验时间戳长度
    local length = #word
    if length ~= 10 and length ~= 13 then
        vim.api.nvim_echo(
            { { "错误：时间戳应为 10 位（秒）或 13 位（毫秒）", "ErrorMsg" } },
            true,
            {}
        )
        return
    end

    -- 转换为数字并处理毫秒
    local timestamp = tonumber(word)
    if length == 13 then
        timestamp = timestamp / 1000
    end

    -- 计算中国时区时间（UTC+8）
    local success, china_time = pcall(function()
        return os.date("!%Y-%m-%d %H:%M:%S", timestamp + 8 * 3600)
    end)

    if not success then
        vim.api.nvim_echo({ { "错误：无效时间戳", "ErrorMsg" } }, true, {})
        return
    end

    -- 创建悬浮窗内容
    local formatted_time = china_time .. " (UTC+8)"
    local util = require("vim.lsp.util")
    local floating_bufnr, floating_win = util.open_floating_preview(
        { formatted_time },
        "markdown",
        { border = "single" }
    )

    -- 设置自动关闭（5秒）
    vim.defer_fn(function()
        if vim.api.nvim_win_is_valid(floating_win) then
            vim.api.nvim_win_close(floating_win, true)
        end
    end, 5000)
end

-- 创建用户命令
vim.api.nvim_create_user_command(
    "ShowChinaTime",
    convert_timestamp_to_china_time,
    { desc = "Convert timestamp to China timezone" }
)
