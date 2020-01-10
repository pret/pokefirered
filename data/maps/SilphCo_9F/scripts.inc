SilphCo_9F_MapScripts:: @ 8161CDE
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_9F_OnLoad
	.byte 0

SilphCo_9F_OnLoad:: @ 8161CE4
	call_if_unset FLAG_SILPH_9F_DOOR_1, EventScript_Close9FDoor1
	call_if_unset FLAG_SILPH_9F_DOOR_2, EventScript_Close9FDoor2
	call_if_unset FLAG_SILPH_9F_DOOR_3, EventScript_Close9FDoor3
	call_if_unset FLAG_SILPH_9F_DOOR_4, EventScript_Close9FDoor4
	end

SilphCo_9F_EventScript_161D09:: @ 8161D09
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if_ge EventScript_161D2E
	msgbox gUnknown_8176B54
	closemessage
	call EventScript_FadeOut_Heal_FadeIn
	msgbox gUnknown_8176B81
	release
	end

EventScript_161D2E:: @ 8161D2E
	msgbox gUnknown_8176B90
	release
	end

SilphCo_9F_EventScript_161D38:: @ 8161D38
	msgbox gUnknown_8176CD4, 3
	end

SilphCo_9F_EventScript_161D41:: @ 8161D41
	trainerbattle_single TRAINER_SCIENTIST_ED, Text_176BFB, Text_176C2B
	msgbox gUnknown_8176C3C, 6
	end

SilphCo_9F_EventScript_161D58:: @ 8161D58
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_37, Text_176BA3, Text_176BC8
	msgbox gUnknown_8176BD0, 6
	end

SilphCo_9F_EventScript_161D6F:: @ 8161D6F
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_38, Text_176C7A, Text_176CA0
	msgbox gUnknown_8176CB8, 6
	end
