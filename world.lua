-- CommonLib
--	by Rubenwardy
-------------------------------------------------------------------------------
-- Adds common functions that help minetest modders achieve
-- perfection in both their mod, and in interacting with other mods
-------------------------------------------------------------------------------
-- #### world.lua
-- functions that interact with the world
-------------------------------------------------------------------------------

world={}

-------------------------------------------------------------------------------
-- world.get_surface(x,z, min_y, max_y)
-------------------------------------------------------------------------------
-- x: x-coordinate
-- z: z-coordinate
-- min_y: minimum y-coordinate to consider
-- max_y: maximum y-coordinate to consider
-------------------------------------------------------------------------------
function world.get_surface(x,z, min_y, max_y)

	local last_node = minetest.env:get_node({ x=x,y=min_y, z=z })

    for runy = min_y+1, max_y,1 do
        local pos = { x=x,y=runy, z=z }
        local node_to_check = minetest.env:get_node(pos)
        
        if node_to_check.name == "air" and
        	last_node.name ~= "air" and
        	last_node.mame ~= "ignore" then
            return pos.y
        end
        last_node = node_to_check
    end
    return nil
end


-------------------------------------------------------------------------------
-- world.node_owner(pos,placer)
-------------------------------------------------------------------------------
-- pos: position of the node
-- placer: 
-- returns the name of the owner
-------------------------------------------------------------------------------

function world.node_owner(pos)
	local ownername = ""
	if type(IsPlayerNodeOwner) == "function" then	-- node_ownership mod
		if HasOwner(pos, "") then	-- returns true if the node is owned
			if type(getLastOwner) == "function" then	-- ...is an old version
				ownername = getLastOwner(pos)
			elseif type(GetNodeOwnerName) == "function" then	-- ...is a recent version
				ownername = GetNodeOwnerName(pos)
			else
				ownername = "someone"
			end
		end
	elseif type(isprotect)=="function" then -- glomie's protection mod
		if not isprotect(5, pos, "xbnwifn378ekihnks") then
			ownername = "someone"
		end
	end
	
	return ownername
end