-- CommonLib
--	by Rubenwardy
-------------------------------------------------------------------------------
-- Adds common functions that help minetest modders achieve
-- perfection in both their mod, and in interacting with other mods
-------------------------------------------------------------------------------
-- You can include this library as a mod (recommended)
-- or as a file in your mod's directory
-------------------------------------------------------------------------------

v3={}

-------------------------------------------------------------------------------
-- Misc vector functions by celeron55, wtfpl
-------------------------------------------------------------------------------
function v3.new(x, y, z)
    if x == nil then
        return {
            x = 0,
            y = 0,
            z = 0
        }
    end
    if type(x) == "table" then
        return {
            x = x.x,
            y = x.y,
            z = x.z,
        }
    end
    return {
        x = x,
        y = y,
        z = z,
    }
end
function v3.floor(v)
    return {
        x = math.floor(v.x),
        y = math.floor(v.y),
        z = math.floor(v.z),
    }
end
function v3.cmp(v, w)
    return (
        v.x == w.x and
        v.y == w.y and
        v.z == w.z
    )
end
function v3.add(v, w)
    return {
        x = v.x + w.x,
        y = v.y + w.y,
        z = v.z + w.z,
    }
end
function v3.sub(v, w)
    return {
        x = v.x - w.x,
        y = v.y - w.y,
        z = v.z - w.z,
    }
end
function v3.mul(v, a)
    return {
        x = v.x * a,
        y = v.y * a,
        z = v.z * a,
    }
end
function v3.len(v)
    return math.sqrt(
        math.pow(v.x, 2) +
        math.pow(v.y, 2) +
        math.pow(v.z, 2)
    )
end
function v3.norm(v)
    return v3.mul(v, 1.0 / v3.len(v))
end
function v3.distance(v, w)
    return math.sqrt(
        math.pow(v.x - w.x, 2) +
        math.pow(v.y - w.y, 2) +
        math.pow(v.z - w.z, 2)
    )
end
function v3.rotate_y(v, a)
    return {
        x = v.x * math.cos(a) - v.z * math.sin(a),
        y = v.y,
        z = v.x * math.sin(a) + v.z * math.cos(a),
    }
end

-------------------------------------------------------------------------------
-- v3.get_direction(pos1,pos2)
-------------------------------------------------------------------------------
-- pos1: source point
-- pos2: destination point
-------------------------------------------------------------------------------
function v3.get_direction(pos1,pos2)

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
-- vector.calc_scalar_speed(speedx,speedz)
-------------------------------------------------------------------------------
-- speedx: speed in direction x
-- speedz: speed in direction z
-------------------------------------------------------------------------------
function v3.calc_scalar_speed(speedx,speedz)
	return math.sqrt(math.pow(speedx,2)+
	                          math.pow(speedz,2))
end