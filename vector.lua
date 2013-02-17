-- CommonLib
--	by Rubenwardy
-------------------------------------------------------------------------------
-- Adds common functions that help minetest modders achieve
-- perfection in both their mod, and in interacting with other mods
-------------------------------------------------------------------------------
-- #### vector.lua
-- functions that do stuff with vectors
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
function v3.copy(v)
	return {x=v.x, y=v.y, z=v.z}
end
function v3.floor(v)
    return {
        x = math.floor(v.x),
        y = math.floor(v.y),
        z = math.floor(v.z),
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