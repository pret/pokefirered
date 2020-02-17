SevenIsland_TanobyRuins_ScufibChamber_MapScripts:: @ 8164D02
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TanobyRuins_ScufibChamber_OnTransition
	.byte 0

SevenIsland_TanobyRuins_ScufibChamber_OnTransition:: @ 8164D08
	call EventScript_TryDarkenRuins
	end
