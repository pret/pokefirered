SevenIsland_TanobyRuins_DilfordChamber_MapScripts:: @ 8164CF6
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TanobyRuins_DilfordChamber_OnTransition
	.byte 0

SevenIsland_TanobyRuins_DilfordChamber_OnTransition:: @ 8164CFC
	call EventScript_TryDarkenRuins
	end
