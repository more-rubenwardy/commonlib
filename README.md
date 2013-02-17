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
* __mod__ [mod.lua]
	* __node_implement(__ modname,n_ext,n_int,resultfunc __)__ - A soft depend ingredient adder - uses aliases (by Rubenwardy)
	* __soft_depend(__ modname,func __)__ - Runs a function if a mod is present, and after it loads (by Rubenwardy)
	* __assert_backtrace()__ - A debug function for backtracing (by Sapier)
* __v3__ [vector.lua]
	* __new(__ x, y, z __)__ - creates new vector from integers, floats, or tables (by celeron55)
	* __copy(__ v __)__ - copies a vector (by PilzAdam)
	* __floor(__ v __)__ - rounds a vector to integers (by celeron55)
	* __cmp(__ v, u __)__ - compares vectors (by celeron55)
	* __equal(__ v, u __)__ - checks if two vectors are equal (by PilzAdam)
	* __add(__ v, u __)__ - adds two vectors together (by celeron55)
	* __sub(__ v, u __)__ - subtracts two vectors (by celeron55)
	* __mul(__ v, u __)__ - multiples two vectors (by celeron55)
	* __len(__ v __)__ - returns length of the vector (by celeron55)
	* __norm(__ v _)__ - normalise the vector (by celeron55)
	* __distance(__ v, u __)__ - the distance between two vectors (by celeron55)
	* __rotate_y(__ v, u __)__ - rotate y (by celeron55)
* __world__  [world.lua]
	* __get_surface(__ x, z __)__ - get surface of terrain for x/z coordinates (by Sapier)
