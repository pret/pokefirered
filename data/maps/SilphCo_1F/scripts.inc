SilphCo_1F_MapScripts:: @ 8161625
	map_script MAP_SCRIPT_ON_TRANSITION, SilphCo_1F_OnTransition
	.byte 0

SilphCo_1F_OnTransition:: @ 816162B
	setworldmapflag FLAG_WORLD_MAP_SILPH_CO_1F
	end

SilphCo_1F_EventScript_16162F:: @ 816162F
	msgbox gUnknown_81754F7, MSGBOX_NPC
	end

SilphCo_1F_EventScript_161638:: @ 8161638
	msgbox gUnknown_8175549, MSGBOX_SIGN
	end
