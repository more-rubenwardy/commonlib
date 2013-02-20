-- CommonLib
--	by Rubenwardy
-------------------------------------------------------------------------------
-- Adds common functions that help minetest modders achieve
-- perfection in both their mod, and in interacting with other mods
-------------------------------------------------------------------------------
-- #### player.lua
-- player functions
-------------------------------------------------------------------------------

-- set up the base table
player={}

function player_exists( name )
	local privs = minetest.get_player_privs( name );
	if( not( privs )) then
		return false;
	else
		return true;
	end
end