SilphCo_4F_MapScripts:: @ 8161736
	map_script 1, SilphCo_4F_MapScript1_16173C
	.byte 0

SilphCo_4F_MapScript1_16173C:: @ 816173C
	checkflag FLAG_0x27E
	call_if lt, EventScript_1A8213
	checkflag FLAG_0x27F
	call_if lt, EventScript_1A8241
	end

SilphCo_4F_EventScript_16174F:: @ 816174F
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if ge, EventScript_161766
	msgbox gUnknown_81759F5
	release
	end

EventScript_161766:: @ 8161766
	msgbox gUnknown_8175A15
	release
	end

SilphCo_4F_EventScript_161770:: @ 8161770
	msgbox gUnknown_8175B57, 3
	end

SilphCo_4F_EventScript_161779:: @ 8161779
	trainerbattle 0, TRAINER_SCIENTIST_RODNEY, 0, Text_175A90, Text_175AB0
	msgbox gUnknown_8175AC8, 6
	end

SilphCo_4F_EventScript_161790:: @ 8161790
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_26, 0, Text_175A2F, Text_175A5B
	msgbox gUnknown_8175A62, 6
	end

SilphCo_4F_EventScript_1617A7:: @ 81617A7
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_27, 0, Text_175B19, Text_175B2B
	msgbox gUnknown_8175B38, 6
	end
