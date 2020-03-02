SixIsland_MapScripts:: @ 8167ED8
	map_script MAP_SCRIPT_ON_TRANSITION, SixIsland_OnTransition
	.byte 0

SixIsland_OnTransition:: @ 8167EDE
	setworldmapflag FLAG_WORLD_MAP_SIX_ISLAND
	end

SixIsland_EventScript_Hiker:: @ 8167EE2
	msgbox SixIsland_Text_ThatWayToWaterPathRuinValley, MSGBOX_NPC
	end

SixIsland_EventScript_Boy:: @ 8167EEB
	msgbox SixIsland_Text_SkyAtNightIsFantastic, MSGBOX_NPC
	end

SixIsland_EventScript_IslandSign:: @ 8167EF4
	msgbox SixIsland_Text_IslandSign, MSGBOX_SIGN
	end
