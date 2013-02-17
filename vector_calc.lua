-- CommonLib
--	by Rubenwardy
-------------------------------------------------------------------------------
-- Adds common functions that help minetest modders achieve
-- perfection in both their mod, and in interacting with other mods
-------------------------------------------------------------------------------
-- #### vector_calc.lua
-- functions that calculate with vectors
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Misc vector functions by celeron55, wtfpl
-------------------------------------------------------------------------------
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