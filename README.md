CommonLib by Rubenwardy
=======================

Adds common functions that help minetest modders achieve perfection in both their mod, and in interacting with other mods too.

You can include this library as a mod (recommended) or just add the commonlib.lua file to your mod's directory.

License
=======

Code: CC-BY-SA

* These conditions apply to the Commonlib code, and not to any mods using the library.
* Commonlib is counted as a seperate library rather than part of the mod using it.
* This means you can use Commonlib in a mod with a different license to this.

Contained Functions
===================

* node_implement() - A soft depend ingredient adder (by Rubenwardy)
* assert_backtrace() - A debug function for backtracing (by Sapier)
* vector
	* calc_distance() - Calculates the distance between two points (by Sapier)
	* calc_distance_2d() - Calculates the distance between two points, excluding the height (by Sapier)
	* calc_scalar_speed() - Calculates scalar speed (by Sapier)
	* calc_vector_components() - Calculate x and z components of a directed speed (by Sapier)
	* get_direction() - Calculates the direction from one point to enougher (by Sapier)
	* round_pos() - Rounds the position to integers (by Sapier)
	* get_surface() - get surface of terrain for x/z coordinates (by Sapier)