SevenIsland_TanobyRuins_LiptooChamber_MapScripts:: @ 8164CDE
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TanobyRuins_LiptooChamber_OnTransition
	.byte 0

SevenIsland_TanobyRuins_LiptooChamber_OnTransition:: @ 8164CE4
	call EventScript_TryDarkenRuins
	end
