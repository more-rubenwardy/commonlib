CommonLib by Rubenwardy
=======================

Adds common functions that help minetest modders achieve perfection in both their mod, and in interacting with other mods too.

You can include the whole library as a mod (recommended) or just include some modules in your mod.
			
License
=======

Code: CC-BY-SA

* These conditions apply to the Commonlib code, and not to any mods using the library.
* Commonlib is counted as a seperate library rather than part of the mod using it.
* This means you can use Commonlib in a mod with a different license to this.

Contained Functions
===================
* __mod__ [mod.lua] - namespace
	* __node_implement(__ modname,n_ext,n_int,resultfunc __)__ - A soft depend ingredient adder - uses aliases (by Rubenwardy)
	* __soft_depend(__ modname,func __)__ - Runs a function if a mod is present, and after it loads (by Rubenwardy)
	* __assert_backtrace(__ item __)__ - A debug function for backtracing (by Sapier)
* __player__ [player.lua] - namespace
	* __player_exists(__ name __)__ - sees if a player exists (by Sokomine)
* __v3__ - namespace
	* core module [vector.lua]
		* __new(__ x, y, z __)__ - creates new vector from integers, floats, or tables (by celeron55)
		* __copy(__ v __)__ - copies a vector (by PilzAdam)
		* __floor(__ v __)__ - rounds a vector to integers (by celeron55)
		* __len(__ v __)__ - returns length of the vector (by celeron55)
		* __norm(__ v _)__ - normalise the vector (by celeron55)
	* compare module [vector_cmp.lua]
		* __cmp(__ v, u __)__ - compares vectors (by celeron55)
		* __equal(__ v, u __)__ - checks if two vectors are equal (by PilzAdam)
		* __distance(__ v, u __)__ - the distance between two vectors (by celeron55)
		* __rotate_y(__ v, u __)__ - rotate y (by celeron55)
		* __get_direction(__ pos1, pos2 __) - get the direction of a point from enougher (by Sapier)
	* calculation module [vector_calc.lua]
		* __add(__ v, u __)__ - adds two vectors together (by celeron55)
		* __sub(__ v, u __)__ - subtracts two vectors (by celeron55)
		* __mul(__ v, u __)__ - multiples two vectors (by celeron55)
* __world__  [world.lua] - namespace
	* __get_surface(__ x, z __)__ - get surface of terrain for x/z coordinates (by Sapier)
	* __node_owner(__ pos __)__ - get the name of that node's owner (by VanessaE)
