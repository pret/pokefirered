SilphCo_8F_MapScripts:: @ 8161C5F
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_8F_OnLoad
	.byte 0

SilphCo_8F_OnLoad:: @ 8161C65
	call_if_unset FLAG_SILPH_8F_DOOR, EventScript_Close8FDoor
	end

SilphCo_8F_EventScript_161C6F:: @ 8161C6F
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if_ge EventScript_161C86
	msgbox gUnknown_817696D
	release
	end

EventScript_161C86:: @ 8161C86
	msgbox gUnknown_817698C
	release
	end

SilphCo_8F_EventScript_161C90:: @ 8161C90
	msgbox gUnknown_8176AB2, MSGBOX_SIGN
	end

SilphCo_8F_EventScript_161C99:: @ 8161C99
	trainerbattle_single TRAINER_SCIENTIST_PARKER, Text_1769FD, Text_176A19
	msgbox gUnknown_8176A26, MSGBOX_AUTOCLOSE
	end

SilphCo_8F_EventScript_161CB0:: @ 8161CB0
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_32, Text_1769A2, Text_1769BE
	msgbox gUnknown_81769CF, MSGBOX_AUTOCLOSE
	end

SilphCo_8F_EventScript_161CC7:: @ 8161CC7
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_36, Text_176A56, Text_176A7C
	msgbox gUnknown_8176A90, MSGBOX_AUTOCLOSE
	end
