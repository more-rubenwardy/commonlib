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