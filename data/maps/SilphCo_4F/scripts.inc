SilphCo_4F_MapScripts:: @ 8161736
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_4F_OnLoad
	.byte 0

SilphCo_4F_OnLoad:: @ 816173C
	call_if_unset FLAG_SILPH_4F_DOOR_1, EventScript_Close4FDoor1
	call_if_unset FLAG_SILPH_4F_DOOR_2, EventScript_Close4FDoor2
	end

SilphCo_4F_EventScript_16174F:: @ 816174F
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if_ge EventScript_161766
	msgbox gUnknown_81759F5
	release
	end

EventScript_161766:: @ 8161766
	msgbox gUnknown_8175A15
	release
	end

SilphCo_4F_EventScript_161770:: @ 8161770
	msgbox gUnknown_8175B57, MSGBOX_SIGN
	end

SilphCo_4F_EventScript_161779:: @ 8161779
	trainerbattle_single TRAINER_SCIENTIST_RODNEY, Text_175A90, Text_175AB0
	msgbox gUnknown_8175AC8, MSGBOX_AUTOCLOSE
	end

SilphCo_4F_EventScript_161790:: @ 8161790
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_26, Text_175A2F, Text_175A5B
	msgbox gUnknown_8175A62, MSGBOX_AUTOCLOSE
	end

SilphCo_4F_EventScript_1617A7:: @ 81617A7
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_27, Text_175B19, Text_175B2B
	msgbox gUnknown_8175B38, MSGBOX_AUTOCLOSE
	end
