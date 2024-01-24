--- Class {{_file_name_}} Declaration
--- @class {{_file_name_}}:TCLASS, CrossGameBaseSvr
local {{_file_name_}} = class("{{_file_name_}}", CrossGameBaseSvr)

--- Class {{_file_name_}} Constructor
function {{_file_name_}}:init()
    -- init code	
end

function {{_file_name_}}:startGame(allSvrChanged)
	sysLog.info("{{_file_name_}}:startGame")
end

function {{_file_name_}}:reloadGame()
	sysLog.info("{{_file_name_}}:reloadGame")
end

function {{_file_name_}}:finishGame()
	sysLog.info("{{_file_name_}}:finishGame")
end

function {{_file_name_}}:delGame()
	sysLog.info("{{_file_name_}}:delGame")
end

return {{_file_name_}}
