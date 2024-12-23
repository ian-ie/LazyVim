if not _P then
    print("hotfix fail, no _P define")
    return
end

print("hotfix begin")

-- 用于获取函数变量
local function get_up(f)
    local u = {}
    if not f then
        return u
    end
    local i = 1
    while true do
        local name, value = debug.getupvalue(f, i)
        if name == nil then
            return u
        end
        u[name] = value
        i = i + 1
    end
    return u
end

-- 获取原来的函数地址，及函数变量
local command = _P.lua.CMD

local CMD = command
local upvs = get_up()
local skynet = require("skynet")
local sysLog = require("sysLog")
local util = require("util")
local JSON = require("cjson")

-- created: {{_date_}}
sysLog.info("execute hotfix {{_file_name_}}")
local pu = require("logic.global.PlayerUtil")
local hotfixTyp = "{{_file_name_}}"
--- @param player PlayerDb
pu.HOTFIX_FUNC[hotfixTyp] = function(player, content)
    {{_cursor_}}
end

sendMail(-1, MailType.SERVER_HOTFIX, { typ = hotfixTyp })
