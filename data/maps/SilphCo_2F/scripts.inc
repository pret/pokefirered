SilphCo_2F_MapScripts:: @ 8161641
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_2F_OnLoad
	.byte 0

SilphCo_2F_OnLoad:: @ 8161647
	call_if_unset FLAG_SILPH_2F_DOOR_1, EventScript_Close2FDoor1
	call_if_unset FLAG_SILPH_2F_DOOR_2, EventScript_Close2FDoor2
	end

SilphCo_2F_EventScript_16165A:: @ 816165A
	goto EventScript_1C4816

EventScript_16165F:: @ 816165F
	end

SilphCo_2F_EventScript_161660:: @ 8161660
	msgbox gUnknown_8175894, MSGBOX_SIGN
	end

SilphCo_2F_EventScript_161669:: @ 8161669
	trainerbattle_single TRAINER_SCIENTIST_CONNOR, Text_175562, Text_17557E
	msgbox gUnknown_817559F, MSGBOX_AUTOCLOSE
	end

SilphCo_2F_EventScript_161680:: @ 8161680
	trainerbattle_single TRAINER_SCIENTIST_JERRY, Text_1755C6, Text_1755E5
	msgbox gUnknown_81755F2, MSGBOX_AUTOCLOSE
	end

SilphCo_2F_EventScript_161697:: @ 8161697
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_23, Text_17562D, Text_17564A
	msgbox gUnknown_8175651, MSGBOX_AUTOCLOSE
	end

SilphCo_2F_EventScript_1616AE:: @ 81616AE
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_24, Text_1756AD, Text_1756D8
	msgbox gUnknown_81756E2, MSGBOX_AUTOCLOSE
	end
