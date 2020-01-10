SevenIsland_TrainerTower_1F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_2F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_3F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_4F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_5F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_6F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_7F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_8F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_Elevator_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_Roof_MapScript1_1C4F54:: @ 81C4F54
	setvar VAR_TEMP_2, 0
	setvar VAR_0x8004, 10
	special sub_815D9E8
	end

SevenIsland_TrainerTower_1F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_2F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_3F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_4F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_5F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_6F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_7F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_8F_MapScript2_1C4F62:: @ 81C4F62
	setvar VAR_0x8004, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C4FA7
	case 1, EventScript_1C4FC5
	case 2, EventScript_1C5019
	setflag FLAG_TEMP_2
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_4
	setflag FLAG_TEMP_5
	setvar VAR_TEMP_E, 1
	setvar VAR_TEMP_F, 1
	end

EventScript_1C4FA7:: @ 81C4FA7
	setflag FLAG_TEMP_2
	setflag FLAG_TEMP_4
	setflag FLAG_TEMP_5
	setvar VAR_TEMP_F, 1
	setobjectxyperm 3, 15, 13
	setobjectmovementtype 3, 9
	goto EventScript_1C5042

EventScript_1C4FC5:: @ 81C4FC5
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_4
	setvar VAR_TEMP_E, 1
	setvar VAR_0x8004, 5
	special sub_815D9E8
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1C4FFE
	setobjectxyperm 2, 10, 12
	setobjectmovementtype 2, 9
	setobjectxyperm 5, 10, 13
	setobjectmovementtype 5, 9
	goto EventScript_1C5042

EventScript_1C4FFE:: @ 81C4FFE
	setobjectxyperm 2, 10, 12
	setobjectmovementtype 2, 8
	setobjectxyperm 5, 11, 12
	setobjectmovementtype 5, 8
	goto EventScript_1C5042

EventScript_1C5019:: @ 81C5019
	setflag FLAG_TEMP_5
	setvar VAR_TEMP_F, 1
	setobjectxyperm 2, 10, 10
	setobjectmovementtype 2, 8
	setobjectxyperm 3, 14, 13
	setobjectmovementtype 3, 9
	setobjectxyperm 4, 10, 16
	setobjectmovementtype 4, 7
EventScript_1C5042:
	setflag FLAG_TEMP_6
	end

SevenIsland_TrainerTower_1F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_2F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_3F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_4F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_5F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_6F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_7F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_8F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_Elevator_MapScript2_1C5046:: @ 81C5046
SevenIsland_TrainerTower_Roof_MapScript2_1C5046:: @ 81C5046
	map_script_2 VAR_TEMP_2, 0, EventScript_1C5050
	.2byte 0

EventScript_1C5050:: @ 81C5050
	setvar VAR_TEMP_2, 1
	setvar VAR_0x8004, 5
	special sub_815D9E8
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1C5072
	setvar VAR_TEMP_E, 1
	setvar VAR_TEMP_F, 1
EventScript_1C5072:
	setvar VAR_0x8004, 18
	special sub_815D9E8
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1C5086
	end

EventScript_1C5086:: @ 81C5086
	warp MAP_SEVEN_ISLAND_TRAINER_TOWER_LOBBY, 255, 9, 7
	waitstate
EventScript_1C508F::
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C50C2
	case 1, EventScript_1C510D
	case 2, EventScript_1C515C
EventScript_1C50C2:
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 3, Movement_ExclamationMark
	waitmovement 0
	applymovement 3, Movement_Delay48
	waitmovement 0
	setvar VAR_TEMP_E, 1
	applymovement 3, Movement_1C5541
	waitmovement 0
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 2
	setvar VAR_0x8006, 0
	special sub_815D9E8
	msgbox gStringVar4
	closemessage
	goto EventScript_1C5219

EventScript_1C510D:: @ 81C510D
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 2
	copyvar VAR_0x8006, VAR_TEMP_3
	special sub_815D9E8
	msgbox gStringVar4
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 2
	addvar VAR_TEMP_3, 1
	compare VAR_TEMP_3, 1
	goto_if_eq EventScript_1C5146
	setvar VAR_TEMP_3, 0
EventScript_1C5146:
	copyvar VAR_0x8006, VAR_TEMP_3
	special sub_815D9E8
	msgbox gStringVar4
	closemessage
	goto EventScript_1C5219

EventScript_1C515C:: @ 81C515C
	switch VAR_TEMP_1
	case 0, EventScript_1C5182
	case 1, EventScript_1C51AD
	case 2, EventScript_1C51D8
EventScript_1C5182:
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 4, Movement_ExclamationMark
	waitmovement 0
	applymovement 4, Movement_Delay48
	waitmovement 0
	applymovement 4, Movement_1C5546
	waitmovement 0
	goto EventScript_1C51FE

EventScript_1C51AD:: @ 81C51AD
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 2, Movement_ExclamationMark
	waitmovement 0
	applymovement 2, Movement_Delay48
	waitmovement 0
	applymovement 2, Movement_1C5549
	waitmovement 0
	goto EventScript_1C51FE

EventScript_1C51D8:: @ 81C51D8
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 3, Movement_ExclamationMark
	waitmovement 0
	applymovement 3, Movement_Delay48
	waitmovement 0
	applymovement 3, Movement_1C5542
	waitmovement 0
EventScript_1C51FE:
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 2
	copyvar VAR_0x8006, VAR_TEMP_1
	special sub_815D9E8
	msgbox gStringVar4
	closemessage
EventScript_1C5219:
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 0
	special sub_815D9E8
	waitstate
	switch VAR_RESULT
	case 1, EventScript_1C524D
	case 2, EventScript_1C52E0
	case 3, EventScript_1C52E0
EventScript_1C524D:
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C52D7
	case 1, EventScript_1C52BA
	case 2, EventScript_1C5280
EventScript_1C5280:
	switch VAR_TEMP_1
	case 0, EventScript_1C52A6
	case 1, EventScript_1C52B0
	case 2, EventScript_1C52D0
EventScript_1C52A6:
	addvar VAR_TEMP_1, 1
	goto EventScript_1C515C

EventScript_1C52B0:: @ 81C52B0
	addvar VAR_TEMP_1, 1
	goto EventScript_1C515C

EventScript_1C52BA:: @ 81C52BA
	applymovement 5, Movement_1C554C
	waitmovement 0
	applymovement 2, Movement_1C5550
	goto EventScript_1C52D7

EventScript_1C52D0:: @ 81C52D0
	applymovement 3, Movement_1C554D
EventScript_1C52D7:
	setvar VAR_0x8004, 4
	special sub_815D9E8
	end

EventScript_1C52E0:: @ 81C52E0
	special HealPlayerParty
	setvar VAR_0x8004, 11
	special sub_815D9E8
	warp MAP_SEVEN_ISLAND_TRAINER_TOWER_LOBBY, 255, 9, 7
	waitstate

EventScript_1C52F4:: @ 81C52F4
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C5327
	case 1, EventScript_1C5327
	case 2, EventScript_1C5331
EventScript_1C5327:
	setvar VAR_0x8006, 0
	goto EventScript_1C5391

EventScript_1C5331:: @ 81C5331
	setvar VAR_0x8006, 1
	goto EventScript_1C5391

EventScript_1C533B:: @ 81C533B
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C536E
	case 1, EventScript_1C536E
	case 2, EventScript_1C5378
EventScript_1C536E:
	setvar VAR_0x8006, 0
	goto EventScript_1C5391

EventScript_1C5378:: @ 81C5378
	setvar VAR_0x8006, 2
	goto EventScript_1C5391

EventScript_1C5382:: @ 81C5382
	setvar VAR_0x8006, 0
	goto EventScript_1C5391

EventScript_1C538C:: @ 81C538C
	setvar VAR_0x8006, 1
EventScript_1C5391:
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 5
	special sub_815D9E8
	lock
	faceplayer
	msgbox gStringVar4
	release
	return

EventScript_1C53AA:: @ 81C53AA
	lock
	faceplayer
	setvar VAR_0x8004, 7
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C53DA
	case 1, EventScript_1C53E2
	case 2, EventScript_1C5492
EventScript_1C53DA:
	msgbox Text_17CA5A
EventScript_1C53E2:
	setvar VAR_0x8004, 8
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C5410
	case 1, EventScript_1C543A
	case 2, EventScript_1C544F
EventScript_1C5410:
	msgbox Text_17CB09
	textcolor 3
	playfanfare MUS_FANFA1
	message Text_ObtainedTheX
	waitfanfare
	waitmessage
	getstdstring 2, 24
	msgbox Text_PutItemAway
	call EventScript_1A6675
	goto EventScript_1C544F

EventScript_1C543A:: @ 81C543A
	msgbox Text_17CB09
	msgbox Text_BagIsFull
	goto EventScript_1C544F

EventScript_1C544F:: @ 81C544F
	setvar VAR_0x8004, 9
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C547D
	case 1, EventScript_1C548A
	case 2, EventScript_1C5492
EventScript_1C547D:
	msgbox Text_17CB1A
	goto EventScript_1C5492

EventScript_1C548A:: @ 81C548A
	msgbox Text_17CBC0
EventScript_1C5492:
	msgbox Text_17CBF5
	release
	return

EventScript_1C549C:: @ 81C549C
	lockall
	setvar VAR_0x8004, 13
	special sub_815D9E8
	msgbox Text_17CC56
	releaseall
	end

SevenIsland_TrainerTower_2F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_4F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_6F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_8F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_5F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_7F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_3F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_1F_EventScript_1C54AF:: @ 81C54AF
	goto EventScript_1C508F

SevenIsland_TrainerTower_2F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_4F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_6F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_8F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_5F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_7F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_3F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_1F_EventScript_1C54B4:: @ 81C54B4
	setvar VAR_TEMP_3, 0
	setvar VAR_0x8004, 16
	special sub_815D9E8
	compare VAR_RESULT, 0
	goto_if_ne EventScript_1C5528
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 2, Movement_ExclamationMark
	waitmovement 0
	applymovement 2, Movement_Delay48
	goto EventScript_1C551B

SevenIsland_TrainerTower_2F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_4F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_6F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_8F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_5F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_7F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_3F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_1F_EventScript_1C54EA:: @ 81C54EA
	setvar VAR_TEMP_3, 1
	setvar VAR_0x8004, 16
	special sub_815D9E8
	compare VAR_RESULT, 0
	goto_if_ne EventScript_1C5528
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 5, Movement_ExclamationMark
	waitmovement 0
	applymovement 5, Movement_Delay48
EventScript_1C551B:
	waitmovement 0
	setvar VAR_TEMP_F, 1
	goto EventScript_1C508F

EventScript_1C5528:: @ 81C5528
	lockall
	playse SE_PINPON
	msgbox Text_17CC73
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1C5544
	waitmovement 0
	releaseall
	end

Movement_1C5541:
	walk_left
Movement_1C5542:: @ 81C5542
	walk_left
	walk_left
Movement_1C5544:
	walk_left
	step_end

Movement_1C5546:: @ 81C5546
	walk_up
	walk_up
	step_end

Movement_1C5549:: @ 81C5549
	walk_down
	walk_down
	step_end

Movement_1C554C:: @ 81C554C
	walk_right
Movement_1C554D:
	walk_up
	face_down
	step_end

Movement_1C5550:: @ 81C5550
	face_down
	step_end
