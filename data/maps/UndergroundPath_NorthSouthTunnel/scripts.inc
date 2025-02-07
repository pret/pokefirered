# 1 "data/maps/UndergroundPath_NorthSouthTunnel/scripts.pory"

# 2 "data/maps/UndergroundPath_NorthSouthTunnel/scripts.pory"
UndergroundPath_NorthSouthTunnel_MapScripts::
# 3 "data/maps/UndergroundPath_NorthSouthTunnel/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, UndergroundPath_NorthSouthTunnel_OnTransition
# 4 "data/maps/UndergroundPath_NorthSouthTunnel/scripts.pory"
	.byte 0
# 5 "data/maps/UndergroundPath_NorthSouthTunnel/scripts.pory"

# 6 "data/maps/UndergroundPath_NorthSouthTunnel/scripts.pory"
UndergroundPath_NorthSouthTunnel_OnTransition::
# 7 "data/maps/UndergroundPath_NorthSouthTunnel/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL
# 8 "data/maps/UndergroundPath_NorthSouthTunnel/scripts.pory"
	end
