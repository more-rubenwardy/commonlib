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
* commonlib [commonlib.lua]
	* node_implement() - A soft depend ingredient adder - uses aliases (by Rubenwardy)
	* assert_backtrace() - A debug function for backtracing (by Sapier)
* commonlib.vector [vector.lua]
	* new() - creates new vector from integers, floats, or tables (by celeron55)
	* floor() - rounds vectors to integers (by celeron55)
	* cmp() - compares vectors (by celeron55)
	* add() - adds two vectors together (by celeron55)
	* sub() - subtracts two vectors (by celeron55)
	* mul() - multiples two vectors (by celeron55)
	* len() - returns length of the vectors (by celeron55)
	* norm() - normalise the vector (by celeron55)
	* distance() - the distance between two vectors (by celeron55)
	* rotate_y() - rotate y (by celeron55)
* commonlib.world  [world.lua]
	* get_surface() - get surface of terrain for x/z coordinates (by Sapier)