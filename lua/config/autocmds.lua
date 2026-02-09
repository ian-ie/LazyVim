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

-- 简单版本的自动滚动
local auto_scroll = {
    active = false,
    timer = nil,
}

-- 切换自动滚动
vim.keymap.set("n", "<F5>", function()
    if auto_scroll.active then
        -- 停止
        if auto_scroll.timer then
            auto_scroll.timer:stop()
            auto_scroll.timer:close()
            auto_scroll.timer = nil
        end
        auto_scroll.active = false
        vim.notify("自动滚动已停止", vim.log.levels.INFO)
    else
        -- 开始
        auto_scroll.timer = vim.loop.new_timer()
        auto_scroll.timer:start(
            0,
            2000,
            vim.schedule_wrap(function()
                if auto_scroll.active then
                    local current_line = vim.api.nvim_win_get_cursor(0)[1]
                    local total_lines = vim.api.nvim_buf_line_count(0)

                    if current_line >= total_lines then
                        auto_scroll.timer:stop()
                        auto_scroll.timer:close()
                        auto_scroll.timer = nil
                        auto_scroll.active = false
                        vim.notify("到达文件末尾", vim.log.levels.INFO)
                    else
                        vim.cmd("normal! j")
                    end
                end
            end)
        )
        auto_scroll.active = true
        vim.notify("自动滚动已启动 (每2秒)", vim.log.levels.INFO)
    end
end, { desc = "切换自动滚动" })

local function ai_review_git_svn()
    -- 1. 配置区
    local api_key = os.getenv("MOMOCA_DEEP_SEEK_KEY")
    local endpoint = "https://ark.cn-beijing.volces.com/api/v3/chat/completions"
    local model = "deepseek-v3-2-251201"
    local upstream = "remotes/git-svn"

    -- 2. 获取 Diff
    local handle = io.popen("git diff " .. upstream .. "..HEAD 2>/dev/null")
    local diff = handle:read("*a")
    handle:close()

    if not diff or diff == "" then
        vim.notify("未发现差异 (upstream: " .. upstream .. ")", vim.log.levels.WARN)
        return
    end

    -- 3. 记录当前窗口并创建 UI 窗口
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("vnew")
    local bufnr = vim.api.nvim_get_current_buf()
    local winid = vim.api.nvim_get_current_win()

    -- 4. 窗口与 Buffer 设置
    vim.api.nvim_set_option_value("filetype", "markdown", { buf = bufnr })
    vim.api.nvim_set_option_value("buftype", "nofile", { buf = bufnr })

    -- 针对窗口的属性 (Window-local)
    vim.wo[winid].spell = false
    vim.wo[winid].wrap = true
    vim.wo[winid].linebreak = true
    vim.bo[bufnr].spellcapcheck = ""

    -- 5. 【关键】：光标切回原窗口
    vim.api.nvim_set_current_win(current_win)

    -- 初始化内容
    vim.api.nvim_buf_set_lines(
        bufnr,
        0,
        -1,
        false,
        { "# AI Code Review", "> 正在连接 DeepSeek 并传输 Diff 数据...", "" }
    )

    -- 6. 构造请求参数
    local payload = {
        model = model,
        messages = {
            {
                role = "system",
                content = "你是一个代码审查专家。请使用 Markdown 格式对 diff 进行 Review。",
            },
            { role = "user", content = "请 Review 以下变更：\n\n```diff\n" .. diff .. "\n```" },
        },
        stream = true,
    }

    local tmp_file = os.tmpname()
    local f = io.open(tmp_file, "w")
    f:write(vim.fn.json_encode(payload))
    f:close()

    local curl_cmd = {
        "curl",
        "-s",
        "-N",
        endpoint,
        "-H",
        "Content-Type: application/json",
        "-H",
        "Authorization: Bearer " .. api_key,
        "-d",
        "@" .. tmp_file,
    }

    local response_text = ""

    -- 7. 启动 Job
    vim.fn.jobstart(curl_cmd, {
        on_stdout = function(_, data)
            if not data then
                return
            end
            for _, line in ipairs(data) do
                if line:match("^data: ") then
                    local json_str = line:gsub("^data: ", "")
                    if json_str:match("%[DONE%]") then
                        break
                    end

                    local ok, decoded = pcall(vim.fn.json_decode, json_str)
                    if ok and decoded.choices and decoded.choices[1].delta.content then
                        local content = decoded.choices[1].delta.content
                        response_text = response_text .. content

                        -- 实时更新并滚动
                        vim.schedule(function()
                            if vim.api.nvim_buf_is_valid(bufnr) then
                                local lines = vim.split("# AI Code Review\n\n" .. response_text, "\n")
                                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

                                -- 【关键】：强制右侧窗口滚动
                                if vim.api.nvim_win_is_valid(winid) then
                                    local line_count = #lines
                                    vim.api.nvim_win_set_cursor(winid, { line_count, 0 })
                                end
                            end
                        end)
                    end
                elseif line:match('^{"error"') then
                    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { "❌ API 错误: " .. line })
                end
            end
        end,
        on_stderr = function(_, data)
            if data and data[1] ~= "" then
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { "⚠️ 错误: " .. table.concat(data, " ") })
                end)
            end
        end,
        on_exit = function()
            os.remove(tmp_file)
            vim.schedule(function()
                vim.keymap.set("n", "q", ":close<CR>", { buffer = bufnr, silent = true })
                -- 完成后提示一下，防止你在左侧写代码没注意到右侧写完了
                vim.notify("Review 传输完成", vim.log.levels.INFO)
            end)
        end,
    })
end

vim.keymap.set("n", "<leader>gr", ai_review_git_svn, { desc = "DeepSeek Native Review" })
