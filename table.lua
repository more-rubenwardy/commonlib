-- CommonLib
--	by Rubenwardy
-------------------------------------------------------------------------------
-- Adds common functions that help minetest modders achieve
-- perfection in both their mod, and in interacting with other mods
-------------------------------------------------------------------------------
-- #### table.lua
-- functions that do persistant table operations
-- the CSV code was found here: http://lua-users.org/wiki/CsvUtils
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- table.toCSV(tt)
-------------------------------------------------------------------------------
-- tt: the input table
-------------------------------------------------------------------------------

function table.toCSV(tt)
	local s = ""

	for _,p in pairs(tt) do
		s = s .. "," .. escapeCSV(p)
	end

	return string.sub(s, 2)      -- remove first comma
end

-------------------------------------------------------------------------------
-- table.fromCSV(s)
-------------------------------------------------------------------------------
-- s: the input string
-------------------------------------------------------------------------------

function table.fromCSV(s)
	s = s .. ','        -- ending comma
	local t = {}        -- table to collect fields
	local fieldstart = 1
	repeat
		-- next field is quoted? (start with `"'?)
		if string.find(s, '^"', fieldstart) then
			local a, c
			local i  = fieldstart
			repeat
				-- find closing quote
				a, i, c = string.find(s, '"("?)', i+1)
			until c ~= '"'    -- quote not followed by quote?
			
			if not i then error('unmatched "') end
			
			local f = string.sub(s, fieldstart+1, i-1)
			table.insert(t, (string.gsub(f, '""', '"')))
			fieldstart = string.find(s, ',', i) + 1
		else                -- unquoted; find next comma
			local nexti = string.find(s, ',', fieldstart)
			table.insert(t, string.sub(s, fieldstart, nexti-1))
			fieldstart = nexti + 1
		end
	until fieldstart > string.len(s)
	return t
end