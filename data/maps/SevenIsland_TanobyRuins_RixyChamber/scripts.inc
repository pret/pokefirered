# 1 "data/maps/SevenIsland_TanobyRuins_RixyChamber/scripts.pory"

# 2 "data/maps/SevenIsland_TanobyRuins_RixyChamber/scripts.pory"
SevenIsland_TanobyRuins_RixyChamber_MapScripts::
# 3 "data/maps/SevenIsland_TanobyRuins_RixyChamber/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TanobyRuins_RixyChamber_OnTransition
# 4 "data/maps/SevenIsland_TanobyRuins_RixyChamber/scripts.pory"
	.byte 0
# 5 "data/maps/SevenIsland_TanobyRuins_RixyChamber/scripts.pory"

# 6 "data/maps/SevenIsland_TanobyRuins_RixyChamber/scripts.pory"
SevenIsland_TanobyRuins_RixyChamber_OnTransition::
# 7 "data/maps/SevenIsland_TanobyRuins_RixyChamber/scripts.pory"
	call EventScript_TryDarkenRuins
# 8 "data/maps/SevenIsland_TanobyRuins_RixyChamber/scripts.pory"
	end
