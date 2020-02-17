SevenIsland_TanobyRuins_RixyChamber_MapScripts:: @ 8164D0E
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TanobyRuins_RixyChamber_OnTransition
	.byte 0

SevenIsland_TanobyRuins_RixyChamber_OnTransition:: @ 8164D14
	call EventScript_TryDarkenRuins
	end
