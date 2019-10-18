SilphCo_10F_MapScripts:: @ 8161D86
	map_script 1, SilphCo_10F_MapScript1_161D8C
	.byte 0

SilphCo_10F_MapScript1_161D8C:: @ 8161D8C
	checkflag FLAG_0x28C
	call_if 0, EventScript_1A84D6
	end

SilphCo_10F_EventScript_161D96:: @ 8161D96
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if 4, EventScript_161DAD
	msgbox gUnknown_8176DBA
	release
	end

EventScript_161DAD:: @ 8161DAD
	msgbox gUnknown_8176DCE
	release
	end

SilphCo_10F_EventScript_161DB7:: @ 8161DB7
	msgbox gUnknown_8176DF8, 3
	end

SilphCo_10F_EventScript_161DC0:: @ 8161DC0
	trainerbattle 0, TRAINER_SCIENTIST_TRAVIS, 0, Text_176D57, Text_176D73
	msgbox gUnknown_8176D86, 6
	end

SilphCo_10F_EventScript_161DD7:: @ 8161DD7
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_39, 0, Text_176CED, Text_176D18
	msgbox gUnknown_8176D25, 6
	end
