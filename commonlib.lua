-- CommonLib
--	by Rubenwardy
-------------------------------------------------------------------------------
-- Adds common functions that help minetest modders achieve
-- perfection in both their mod, and in interacting with other mods
-------------------------------------------------------------------------------
-- You can include this library as a mod (recommended)
-- or as a file in your mod's directory
-------------------------------------------------------------------------------


-- set up the base table
commonlib={}
commonlib.vector={}


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
function commonlib.node_implement(modname,n_ext,n_int,resultfunc)
         if not minetest.get_modpath(modname) then
            -- Mod is NOT installed
            resultfunc()
         else
            -- Mod IS installed
            minetest.register_alias(n_int,n_ext)
         end
end




-------------------------------------------------------------------------------
-- get_time_ms()
-------------------------------------------------------------------------------
function commonlib.get_time_ms()
	if minetest.setting_getbool("mobf_enable_socket_trace") then
		return socket.gettime()*1000
	else
	    return 0
	end
end




-------------------------------------------------------------------------------
-- get_current_time()
-------------------------------------------------------------------------------

function commonlib.get_current_time()
	if minetest.get_time ~= nil then
		return minetest.get_time()
	else
		return os.time(os.date('*t'))
	end
end




-------------------------------------------------------------------------------
-- vector.calc_distance(pos1,pos2)
-------------------------------------------------------------------------------
-- pos1: first position
-- pos2: second position
-------------------------------------------------------------------------------
function commonlib.vector.calc_distance(pos1,pos2)
	mobf_assert_backtrace(pos1 ~= nil)
	mobf_assert_backtrace(pos2 ~= nil)
	
	return math.sqrt( 	math.pow(pos1.x-pos2.x,2) + 
				math.pow(pos1.y-pos2.y,2) +
				math.pow(pos1.z-pos2.z,2))
end




-------------------------------------------------------------------------------
-- vector.calc_distance_2d(pos1,pos2)
-------------------------------------------------------------------------------
-- pos1: first position
-- pos2: second position
-------------------------------------------------------------------------------
function commonlib.vector.calc_distance_2d(pos1,pos2)
	return math.sqrt( math.pow(pos1.x-pos2.x,2) + 
				math.pow(pos1.z-pos2.z,2))
end




-------------------------------------------------------------------------------
-- vector.calc_scalar_speed(speedx,speedz)
-------------------------------------------------------------------------------
-- speedx: speed in direction x
-- speedz: speed in direction z
-------------------------------------------------------------------------------
function commonlib.vector.calc_scalar_speed(speedx,speedz)
	return math.sqrt(math.pow(speedx,2)+
	                          math.pow(speedz,2))
end




-------------------------------------------------------------------------------
-- vector.calc_vector_components(dir_radians,absolute_speed)
-------------------------------------------------------------------------------
-- dir_radians: direction of movement radians
-- absolute_speed: speed in direction
-------------------------------------------------------------------------------
function commonlib.vector.calc_vector_components(dir_radians,absolute_speed)

	local retval = {x=0,z=0}
	
	retval.x = absolute_speed * math.cos(dir_radians)
	retval.z = absolute_speed * math.sin(dir_radians)

	return retval
end




-------------------------------------------------------------------------------
-- commonlib.vector.get_direction(pos1,pos2)
-------------------------------------------------------------------------------
-- pos1: source point
-- pos2: destination point
-------------------------------------------------------------------------------
function commonlib.vector.get_direction(pos1,pos2)

	local x_raw = pos2.x -pos1.x
	local y_raw = pos2.y -pos1.y
	local z_raw = pos2.z -pos1.z


	local x_abs = math.abs(x_raw)
	local y_abs = math.abs(y_raw)
	local z_abs = math.abs(z_raw)

	if 	x_abs >= y_abs and
		x_abs >= z_abs then

		y_raw = y_raw * (1/x_abs)
		z_raw = z_raw * (1/x_abs)

		x_raw = x_raw/x_abs

	end

	if 	y_abs >= x_abs and
		y_abs >= z_abs then


		x_raw = x_raw * (1/y_abs)
		z_raw = z_raw * (1/y_abs)

		y_raw = y_raw/y_abs

	end

	if 	z_abs >= y_abs and
		z_abs >= x_abs then

		x_raw = x_raw * (1/z_abs)
		y_raw = y_raw * (1/z_abs)

		z_raw = z_raw/z_abs

	end

	return {x=x_raw,y=y_raw,z=z_raw}

end


-------------------------------------------------------------------------------
-- vector.round_pos(pos)
-------------------------------------------------------------------------------
function commonlib.vector.round_pos(pos)
	if pos == nil then
		return pos
	end

	return { 	x=math.floor(pos.x + 0.5),
			y=math.floor(pos.y + 0.5),
			z=math.floor(pos.z + 0.5)
		 }
end





-------------------------------------------------------------------------------
-- vector.get_surface(x,z, min_y, max_y)
-------------------------------------------------------------------------------
-- x: x-coordinate
-- z: z-coordinate
-- min_y: minimum y-coordinate to consider
-- max_y: maximum y-coordinate to consider
-------------------------------------------------------------------------------
function commonlib.vector.get_surface(x,z, min_y, max_y)

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
-- vector.get_surface(x,z, min_y, max_y)
-------------------------------------------------------------------------------
function mobf_assert_backtrace(value)
	if value == false then
		print(debug.traceback("Current Callstack:\n"))
		assert(value)
	end
end