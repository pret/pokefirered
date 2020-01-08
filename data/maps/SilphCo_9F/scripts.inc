SilphCo_9F_MapScripts:: @ 8161CDE
	map_script 1, SilphCo_9F_MapScript1_161CE4
	.byte 0

SilphCo_9F_MapScript1_161CE4:: @ 8161CE4
	checkflag FLAG_SILPH_9F_DOOR_1
	call_if FALSE, EventScript_Close9FDoor1
	checkflag FLAG_SILPH_9F_DOOR_2
	call_if FALSE, EventScript_Close9FDoor2
	checkflag FLAG_SILPH_9F_DOOR_3
	call_if FALSE, EventScript_Close9FDoor3
	checkflag FLAG_SILPH_9F_DOOR_4
	call_if FALSE, EventScript_Close9FDoor4
	end

SilphCo_9F_EventScript_161D09:: @ 8161D09
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if ge, EventScript_161D2E
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
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SCIENTIST_ED, 0, Text_176BFB, Text_176C2B
	msgbox gUnknown_8176C3C, 6
	end

SilphCo_9F_EventScript_161D58:: @ 8161D58
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TEAM_ROCKET_GRUNT_37, 0, Text_176BA3, Text_176BC8
	msgbox gUnknown_8176BD0, 6
	end

SilphCo_9F_EventScript_161D6F:: @ 8161D6F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TEAM_ROCKET_GRUNT_38, 0, Text_176C7A, Text_176CA0
	msgbox gUnknown_8176CB8, 6
	end
