CommonLib by Rubenwardy
=======================

Adds common functions that help minetest modders achieve perfection in both their mod, and in interacting with other mods too.

You can include this library as a mod (recommended) or as a file in your mod's directory

License
=======

Code: WTFPL

Contained Functions
===================

Starred functions are based on sapiers code from the Mobf mod pack.



* node_implement() - A soft depend ingredient adder. #28
* get_time_ms() - Returns the current time in millisecs *
* get_current_time() - Returns the current time in secs *
* vector
	* calc_distance() - Calculates the distance between two points *
	* calc_distance_2d() - Calculates the distance between two points, excluding the height *
	* calc_scalar_speed() - Calculates scalar speed *
	* calc_vector_components() - Calculate x and z components of a directed speed *
	* get_direction() - Calculates the direction from one point to enougher *
	* round_pos() - Rounds the position to integers *
	* get_surface() - get surface of terrain for x/z coordinates *