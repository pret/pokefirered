SevenIsland_MapScripts:: @ 8167EB3
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_OnTransition
	.byte 0

SevenIsland_OnTransition:: @ 8167EB9
	setworldmapflag FLAG_WORLD_MAP_SEVEN_ISLAND
	end

SevenIsland_EventScript_167EBD:: @ 8167EBD
	msgbox gUnknown_8183046, MSGBOX_SIGN
	end

SevenIsland_EventScript_167EC6:: @ 8167EC6
	msgbox gUnknown_818306C, MSGBOX_NPC
	end

SevenIsland_EventScript_167ECF:: @ 8167ECF
	msgbox gUnknown_8183143, MSGBOX_NPC
	end
