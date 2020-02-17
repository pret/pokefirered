SevenIsland_TanobyRuins_ViapoisChamber_MapScripts:: @ 8164D1A
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TanobyRuins_ViapoisChamber_OnTransition
	.byte 0

SevenIsland_TanobyRuins_ViapoisChamber_OnTransition:: @ 8164D20
	call EventScript_TryDarkenRuins
	end
