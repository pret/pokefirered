SilphCo_5F_MapScripts:: @ 81617BE
	map_script 1, SilphCo_5F_MapScript1_1617C4
	.byte 0

SilphCo_5F_MapScript1_1617C4:: @ 81617C4
	checkflag FLAG_0x280
	call_if lt, EventScript_1A826F
	checkflag FLAG_0x281
	call_if lt, EventScript_1A82A6
	checkflag FLAG_0x282
	call_if lt, EventScript_1A82DD
	end

SilphCo_5F_EventScript_1617E0:: @ 81617E0
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if ge, EventScript_1617F7
	msgbox gUnknown_8175B70
	release
	end

EventScript_1617F7:: @ 81617F7
	msgbox gUnknown_8175BB3
	release
	end

SilphCo_5F_EventScript_161801:: @ 8161801
	msgbox gUnknown_8175D89, 3
	end

SilphCo_5F_EventScript_16180A:: @ 816180A
	msgbox gUnknown_8175DE0, 3
	end

SilphCo_5F_EventScript_161813:: @ 8161813
	msgbox gUnknown_8175E28, 3
	end

SilphCo_5F_EventScript_16181C:: @ 816181C
	msgbox gUnknown_8175E80, 3
	end

SilphCo_5F_EventScript_161825:: @ 8161825
	trainerbattle 0, TRAINER_SCIENTIST_BEAU, 0, Text_175C40, Text_175C6D
	msgbox gUnknown_8175C7D, 6
	end

SilphCo_5F_EventScript_16183C:: @ 816183C
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_28, 0, Text_175BE5, Text_175C09
	msgbox gUnknown_8175C0F, 6
	end

SilphCo_5F_EventScript_161853:: @ 8161853
	trainerbattle 0, TRAINER_TEAM_ROCKET_GRUNT_29, 0, Text_175D28, Text_175D4B
	msgbox gUnknown_8175D59, 6
	end

SilphCo_5F_EventScript_16186A:: @ 816186A
	trainerbattle 0, TRAINER_JUGGLER_DALTON, 0, Text_175CBD, Text_175CEB
	msgbox gUnknown_8175CF9, 6
	end
