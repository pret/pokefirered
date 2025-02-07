# 1 "data/maps/NavelRock_Exterior/scripts.pory"

# 2 "data/maps/NavelRock_Exterior/scripts.pory"
NavelRock_Exterior_MapScripts::
# 3 "data/maps/NavelRock_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, NavelRock_Exterior_OnTransition
# 4 "data/maps/NavelRock_Exterior/scripts.pory"
	.byte 0
# 5 "data/maps/NavelRock_Exterior/scripts.pory"

# 6 "data/maps/NavelRock_Exterior/scripts.pory"
NavelRock_Exterior_OnTransition::
# 7 "data/maps/NavelRock_Exterior/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_NAVEL_ROCK_EXTERIOR
# 8 "data/maps/NavelRock_Exterior/scripts.pory"
	end
