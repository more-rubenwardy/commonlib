-- CommonLib
--	by Rubenwardy
-------------------------------------------------------------------------------
-- Adds common functions that help minetest modders achieve
-- perfection in both their mod, and in interacting with other mods
-------------------------------------------------------------------------------
-- #### mod.lua
-- functions that interact with other mods
-------------------------------------------------------------------------------

-- set up the base table
mod={}

-------------------------------------------------------------------------------
-- node_implement(modname,n_ext,n_int,resultfunc)
-------------------------------------------------------------------------------
-- modname: the ingredient's source mod
-- n_ext: the name of the ingredient in the source mod
-- n_int: the name you want to give it in the current mod
-- resultfunc: the function to run if the mod "modname"
--		does not exist
-------------------------------------------------------------------------------
-- to see an example of this in action, go to this link
-- https://github.com/rubenwardy/food/blob/master/support.lua#L105
-------------------------------------------------------------------------------
function mod.node_implement(modname,n_ext,n_int,resultfunc)
         if not minetest.get_modpath(modname) then
            -- Mod is NOT installed
            resultfunc()
         else
            -- Mod IS installed
            minetest.register_alias(n_int,n_ext)
         end
end

function mod.soft_depend(modname,func)
	if minetest.get_modpath(modname) then
		minetest.after(0, function()
			if func ~= nil then
				func()
			end
		end)
	end
end




-------------------------------------------------------------------------------
-- assert_backtrace(value)
-------------------------------------------------------------------------------
function mod.assert_backtrace(value)
	if value == false then
		print(debug.traceback("Current Callstack:\n"))
		assert(value)
	end
end