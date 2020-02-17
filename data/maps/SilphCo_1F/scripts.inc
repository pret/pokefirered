SilphCo_1F_MapScripts:: @ 8161625
	map_script MAP_SCRIPT_ON_TRANSITION, SilphCo_1F_OnTransition
	.byte 0

SilphCo_1F_OnTransition:: @ 816162B
	setworldmapflag FLAG_WORLD_MAP_SILPH_CO_1F
	end

SilphCo_1F_EventScript_Receptionist:: @ 816162F
	msgbox SilphCo_1F_Text_WelcomePresidentInBoardroom, MSGBOX_NPC
	end

SilphCo_1F_EventScript_FloorSign:: @ 8161638
	msgbox SilphCo_1F_Text_FloorSign, MSGBOX_SIGN
	end
