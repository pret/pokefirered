SilphCo_9F_MapScripts:: @ 8161CDE
	map_script 1, SilphCo_9F_MapScript1_161CE4
	.byte 0

SilphCo_9F_MapScript1_161CE4:: @ 8161CE4
	checkflag FLAG_0x288
	call_if 0, EventScript_1A840C
	checkflag FLAG_0x289
	call_if 0, EventScript_1A8443
	checkflag FLAG_0x28A
	call_if 0, EventScript_1A847A
	checkflag FLAG_0x28B
	call_if 0, EventScript_1A84A8
	end

SilphCo_9F_EventScript_161D09:: @ 8161D09
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if 4, EventScript_161D2E
	msgbox gUnknown_8176B54
	closemessage
	call EventScript_1A6C26
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
	trainerbattle 0, TRAINER_SCIENTIST_ED, 0, Text_176BFB, Text_176C2B
	msgbox gUnknown_8176C3C, 6
	end

SilphCo_9F_EventScript_161D58:: @ 8161D58
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_37, 0, Text_176BA3, Text_176BC8
	msgbox gUnknown_8176BD0, 6
	end

SilphCo_9F_EventScript_161D6F:: @ 8161D6F
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_38, 0, Text_176C7A, Text_176CA0
	msgbox gUnknown_8176CB8, 6
	end
