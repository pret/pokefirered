SilphCo_10F_MapScripts:: @ 8161D86
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_10F_OnLoad
	.byte 0

SilphCo_10F_OnLoad:: @ 8161D8C
	call_if_unset FLAG_SILPH_10F_DOOR, EventScript_Close10FDoor
	end

SilphCo_10F_EventScript_161D96:: @ 8161D96
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if_ge EventScript_161DAD
	msgbox gUnknown_8176DBA
	release
	end

EventScript_161DAD:: @ 8161DAD
	msgbox gUnknown_8176DCE
	release
	end

SilphCo_10F_EventScript_161DB7:: @ 8161DB7
	msgbox gUnknown_8176DF8, MSGBOX_SIGN
	end

SilphCo_10F_EventScript_161DC0:: @ 8161DC0
	trainerbattle_single TRAINER_SCIENTIST_TRAVIS, Text_176D57, Text_176D73
	msgbox gUnknown_8176D86, MSGBOX_AUTOCLOSE
	end

SilphCo_10F_EventScript_161DD7:: @ 8161DD7
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_39, Text_176CED, Text_176D18
	msgbox gUnknown_8176D25, MSGBOX_AUTOCLOSE
	end
