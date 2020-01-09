SilphCo_8F_MapScripts:: @ 8161C5F
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_8F_OnLoad
	.byte 0

SilphCo_8F_OnLoad:: @ 8161C65
	checkflag FLAG_SILPH_8F_DOOR
	call_if FALSE, EventScript_Close8FDoor
	end

SilphCo_8F_EventScript_161C6F:: @ 8161C6F
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if ge, EventScript_161C86
	msgbox gUnknown_817696D
	release
	end

EventScript_161C86:: @ 8161C86
	msgbox gUnknown_817698C
	release
	end

SilphCo_8F_EventScript_161C90:: @ 8161C90
	msgbox gUnknown_8176AB2, 3
	end

SilphCo_8F_EventScript_161C99:: @ 8161C99
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SCIENTIST_PARKER, 0, Text_1769FD, Text_176A19
	msgbox gUnknown_8176A26, 6
	end

SilphCo_8F_EventScript_161CB0:: @ 8161CB0
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TEAM_ROCKET_GRUNT_32, 0, Text_1769A2, Text_1769BE
	msgbox gUnknown_81769CF, 6
	end

SilphCo_8F_EventScript_161CC7:: @ 8161CC7
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TEAM_ROCKET_GRUNT_36, 0, Text_176A56, Text_176A7C
	msgbox gUnknown_8176A90, 6
	end
