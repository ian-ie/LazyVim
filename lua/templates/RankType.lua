--- Class {{_file_name_}} Declaration
--- @class {{_file_name_}}:TCLASS,CrossBaseRankType
{{_file_name_}} = class("{{_file_name_}}", CrossBaseRankType)

--- Class {{_file_name_}} Constructor
function {{_file_name_}}:ctor() end

function {{_file_name_}}:getRankTyp()
	return CrossRankGameType.{{_cursor_}}
end

return {{_file_name_}}
