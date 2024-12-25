local ts_utils = require("nvim-treesitter.ts_utils")

local function insert_debug_log()
    local node = ts_utils.get_node_at_cursor()
    local method_info = {}

    while node do
        if node:type() == "function_declaration" or node:type() == "method_declaration" then
            method_info.method_name = vim.treesitter.get_node_text(node:field("name")[1], 0)
            local params_node = node:field("parameters")[1]
            method_info.parameters = {}
            if params_node then
                for _, param in ipairs(ts_utils.get_named_children(params_node)) do
                    table.insert(method_info.parameters, vim.treesitter.get_node_text(param, 0))
                end
            end
        end
        node = node:parent()
    end

    local suffix = vim.fn.expand("%:r"):lower()
    local prefix = (suffix:sub(-2) == "db" or suffix:find("manager")) and "self:" or "sysLog."

    local params = table.concat(method_info.parameters, ",")
    local log_string

    -- 判断是否有参数
    if #method_info.parameters > 0 then
        log_string = string.format('%sdebug("%s:", %s)', prefix, method_info.method_name, params)
    else
        log_string = string.format('%sdebug("%s:")', prefix, method_info.method_name)
    end

    -- 获取当前行的缩进
    local current_line = vim.api.nvim_get_current_line()
    local indent = current_line:match("^(%s*)") -- 获取当前行开头的空白字符

    -- 插入到下一行，将缩进添加到日志字符串
    vim.api.nvim_put({ indent .. log_string }, "l", true, false)
end

vim.api.nvim_create_user_command("InsertDebugLog", function()
    insert_debug_log()
end, {})
