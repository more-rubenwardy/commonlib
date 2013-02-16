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
* __mod__ [mod.lua] - namespace
	* __node_implement()__ - A soft depend ingredient adder - uses aliases (by Rubenwardy)
	* __assert_backtrace()__ - A debug function for backtracing (by Sapier)
* __v3__ [vector.lua] - namespace
	* __new()__ - creates new vector from integers, floats, or tables (by celeron55)
	* __copy()__ - copies a vector (by PilzAdam)
	* __floor()__ - rounds vectors to integers (by celeron55)
	* __cmp()__ - compares vectors (by celeron55)
	* __equal()__ - checks if the vectors are equal (by PilzAdam)
	* __add()__ - adds two vectors together (by celeron55)
	* __sub()__ - subtracts two vectors (by celeron55)
	* __mul()__ - multiples two vectors (by celeron55)
	* __len()__ - returns length of the vectors (by celeron55)
	* __norm()__ - normalise the vector (by celeron55)
	* __distance()__ - the distance between two vectors (by celeron55)
	* __rotate_y()__ - rotate y (by celeron55)
* __world__  [world.lua] - namespace
	* __get_surface()__ - get surface of terrain for x/z coordinates (by Sapier)
