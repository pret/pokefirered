# 1 "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.pory"

# 2 "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.pory"
SevenIsland_TanobyRuins_MoneanChamber_MapScripts::
# 3 "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TanobyRuins_MoneanChamber_OnTransition
# 4 "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.pory"
	.byte 0
# 5 "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.pory"

# 6 "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.pory"
SevenIsland_TanobyRuins_MoneanChamber_OnTransition::
# 7 "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER
# 8 "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.pory"
	call EventScript_TryDarkenRuins
# 9 "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.pory"
	end
