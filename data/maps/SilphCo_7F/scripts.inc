SilphCo_7F_MapScripts:: @ 8161984
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_7F_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, SilphCo_7F_OnTransition
	.byte 0

SilphCo_7F_OnLoad:: @ 816198F
	call_if_unset FLAG_SILPH_7F_DOOR_1, EventScript_Close7FDoor1
	call_if_unset FLAG_SILPH_7F_DOOR_2, EventScript_Close7FDoor2
	call_if_unset FLAG_SILPH_7F_DOOR_3, EventScript_Close7FDoor3
	end

SilphCo_7F_OnTransition:: @ 81619AB
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	call_if_ge EventScript_1619B7
	end

EventScript_1619B7:: @ 81619B7
	setobjectmovementtype 8, 7
	return

SilphCo_7F_EventScript_1619BC:: @ 81619BC
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_1619D4

EventScript_1619C7:: @ 81619C7
	end

SilphCo_7F_EventScript_1619C8:: @ 81619C8
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_1619D4

EventScript_1619D3:: @ 81619D3
	end

EventScript_1619D4:: @ 81619D4
	textcolor 0
	playbgm MUS_RIVAL1, 0
	applymovement 1, Movement_ExclamationMark
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestDown
	applymovement 1, Movement_Delay48
	waitmovement 0
	msgbox gUnknown_8176710
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_161A73
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_161A7F
	msgbox gUnknown_8176727
	setvar VAR_LAST_TALKED, 1
	compare VAR_STARTER_MON, 2
	call_if_eq EventScript_161A80
	compare VAR_STARTER_MON, 1
	call_if_eq EventScript_161A8B
	compare VAR_STARTER_MON, 0
	call_if_eq EventScript_161A96
	msgbox gUnknown_8176827
	closemessage
	playbgm MUS_RIVAL2, 0
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_161AA1
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_161AAC
	playse SE_TK_WARPIN
	fadedefaultbgm
	removeobject 1
	waitse
	setvar VAR_MAP_SCENE_SILPH_CO_7F, 1
	releaseall
	end

EventScript_161A73:: @ 8161A73
	closemessage
	applymovement 1, Movement_161AB7
	waitmovement 0
	return

EventScript_161A7F:: @ 8161A7F
	return

EventScript_161A80:: @ 8161A80
	trainerbattle_no_intro TRAINER_RIVAL_SILPH_SQUIRTLE, Text_1767D0
	return

EventScript_161A8B:: @ 8161A8B
	trainerbattle_no_intro TRAINER_RIVAL_SILPH_BULBASAUR, Text_1767D0
	return

EventScript_161A96:: @ 8161A96
	trainerbattle_no_intro TRAINER_RIVAL_SILPH_CHARMANDER, Text_1767D0
	return

EventScript_161AA1:: @ 8161AA1
	applymovement 1, Movement_161AB9
	waitmovement 0
	return

EventScript_161AAC:: @ 8161AAC
	applymovement 1, Movement_161ABF
	waitmovement 0
	return

Movement_161AB7:: @ 8161AB7
	walk_up
	step_end

Movement_161AB9:: @ 8161AB9
	walk_right
	walk_right
	walk_right
	walk_up
	delay_16
	step_end

Movement_161ABF:: @ 8161ABF
	walk_left
	walk_up
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	delay_16
	step_end

SilphCo_7F_EventScript_161AC8:: @ 8161AC8
	lock
	faceplayer
	goto_if_set FLAG_GOT_LAPRAS_FROM_SILPH, EventScript_161B8D
	msgbox gUnknown_8176266
	setvar VAR_TEMP_1, SPECIES_LAPRAS
	givemon SPECIES_LAPRAS, 25, ITEM_NONE
	compare VAR_RESULT, 0
	goto_if_eq EventScript_161B12
	compare VAR_RESULT, 1
	goto_if_eq EventScript_161B45
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A927C
	release
	end

EventScript_161B12:: @ 8161B12
	textcolor 3
	playfanfare MUS_FANFA1
	message Text_1762D7
	waitmessage
	waitfanfare
	getspeciesname 0, SPECIES_LAPRAS
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if_eq EventScript_161B7E
	call EventScript_1A8C27
	call EventScript_1A74EB
	goto EventScript_161B7E

EventScript_161B44:: @ 8161B44
	end

EventScript_161B45:: @ 8161B45
	textcolor 3
	playfanfare MUS_FANFA1
	message Text_1762D7
	waitmessage
	waitfanfare
	getspeciesname 0, SPECIES_LAPRAS
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if_eq EventScript_161B73
	call EventScript_1A8C33
	goto EventScript_161B73

EventScript_161B72:: @ 8161B72
	end

EventScript_161B73:: @ 8161B73
	call EventScript_1A8C3C
	goto EventScript_161B7E

EventScript_161B7D:: @ 8161B7D
	end

EventScript_161B7E:: @ 8161B7E
	textcolor 0
	msgbox gUnknown_8176305
	setflag FLAG_GOT_LAPRAS_FROM_SILPH
	release
	end

EventScript_161B8D:: @ 8161B8D
	msgbox gUnknown_81763DD
	release
	end

SilphCo_7F_EventScript_161B97:: @ 8161B97
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if_ge EventScript_161BAE
	msgbox gUnknown_8176444
	release
	end

EventScript_161BAE:: @ 8161BAE
	msgbox gUnknown_8176486
	release
	end

SilphCo_7F_EventScript_161BB8:: @ 8161BB8
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if_ge EventScript_161BCF
	msgbox gUnknown_81764C2
	release
	end

EventScript_161BCF:: @ 8161BCF
	msgbox gUnknown_8176501
	release
	end

SilphCo_7F_EventScript_161BD9:: @ 8161BD9
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if_ge EventScript_161BF0
	msgbox gUnknown_8176532
	release
	end

EventScript_161BF0:: @ 8161BF0
	msgbox gUnknown_8176573
	release
	end

SilphCo_7F_EventScript_161BFA:: @ 8161BFA
	msgbox gUnknown_8176954, 3
	end

SilphCo_7F_EventScript_161C03:: @ 8161C03
	trainerbattle_single TRAINER_SCIENTIST_JOSHUA, Text_1765E2, Text_17660C
	msgbox gUnknown_8176616, 6
	end

SilphCo_7F_EventScript_161C1A:: @ 8161C1A
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_33, Text_176643, Text_176669
	msgbox gUnknown_8176681, 6
	end

SilphCo_7F_EventScript_161C31:: @ 8161C31
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_34, Text_1766B3, Text_1766D7
	msgbox gUnknown_81766E5, 6
	end

SilphCo_7F_EventScript_161C48:: @ 8161C48
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_35, Text_176586, Text_1765A5
	msgbox gUnknown_81765B1, 6
	end
