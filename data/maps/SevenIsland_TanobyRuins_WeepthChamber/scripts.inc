SevenIsland_TanobyRuins_WeepthChamber_MapScripts:: @ 8164CEA
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TanobyRuins_WeepthChamber_OnTransition
	.byte 0

SevenIsland_TanobyRuins_WeepthChamber_OnTransition:: @ 8164CF0
	call EventScript_TryDarkenRuins
	end
