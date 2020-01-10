SixIsland_MapScripts:: @ 8167ED8
	map_script MAP_SCRIPT_ON_TRANSITION, SixIsland_OnTransition
	.byte 0

SixIsland_OnTransition:: @ 8167EDE
	setworldmapflag FLAG_WORLD_MAP_SIX_ISLAND
	end

SixIsland_EventScript_167EE2:: @ 8167EE2
	msgbox gUnknown_81831EF, MSGBOX_NPC
	end

SixIsland_EventScript_167EEB:: @ 8167EEB
	msgbox gUnknown_8183255, MSGBOX_NPC
	end

SixIsland_EventScript_167EF4:: @ 8167EF4
	msgbox gUnknown_81831C6, MSGBOX_SIGN
	end
