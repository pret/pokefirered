CeladonCity_GameCorner_MapScripts:: @ 816C646
	map_script MAP_SCRIPT_ON_LOAD, CeladonCity_GameCorner_OnLoad
	.byte 0

CeladonCity_GameCorner_OnLoad:: @ 816C64C
	call_if_unset FLAG_OPENED_ROCKET_HIDEOUT, EventScript_16C656
	end

EventScript_16C656:: @ 816C656
	setmetatile 15, 2, 658, 0
	setmetatile 16, 2, 658, 0
	setmetatile 17, 2, 658, 0
	setmetatile 16, 3, 719, 1
	setmetatile 17, 3, 719, 1
	return

CeladonCity_GameCorner_EventScript_16C684:: @ 816C684
	msgbox gUnknown_8196940, MSGBOX_NPC
	end

CeladonCity_GameCorner_EventScript_16C68D:: @ 816C68D
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	showmoneybox 0, 0, 0
	showcoinsbox 0, 5
	message Text_196984
	waitmessage
	multichoice 13, 0, MULTICHOICE_GAME_CORNER_COIN_PURCHASE_COUNTER, FALSE
	copyvar VAR_0x8009, VAR_RESULT
	switch VAR_RESULT
	case 0, EventScript_16C6E6
	case 1, EventScript_16C6E6
	case 2, EventScript_16C782
	case 127, EventScript_16C782
	end

EventScript_16C6E6:: @ 816C6E6
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_16C790
	compare VAR_0x8009, 0
	goto_if_eq EventScript_16C734
	compare VAR_0x8009, 1
	goto_if_eq EventScript_16C706
	end

EventScript_16C706:: @ 816C706
	checkcoins VAR_TEMP_1
	compare VAR_TEMP_1, 9500
	goto_if_ge EventScript_16C79E
	checkmoney 10000, 0
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_16C7AC
	givecoins 500
	takemoney 10000, 0
	goto EventScript_16C762
	end

EventScript_16C734:: @ 816C734
	checkcoins VAR_TEMP_1
	compare VAR_TEMP_1, 9950
	goto_if_ge EventScript_16C79E
	checkmoney 1000, 0
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_16C7AC
	givecoins 50
	takemoney 1000, 0
	goto EventScript_16C762
	end

EventScript_16C762:: @ 816C762
	updatemoneybox 0, 0, 0
	updatecoinsbox 0, 5
	playse SE_SHOP
	msgbox gUnknown_8196A62
	goto EventScript_16C77A
	end

EventScript_16C77A:: @ 816C77A
	hidemoneybox 0, 0
	hidecoinsbox 0, 5
	release
	end

EventScript_16C782:: @ 816C782
	msgbox gUnknown_81969DC
	goto EventScript_16C77A
	end

EventScript_16C790:: @ 816C790
	msgbox gUnknown_81969FB
	goto EventScript_16C77A
	end

EventScript_16C79E:: @ 816C79E
	msgbox gUnknown_8196A26
	goto EventScript_16C77A
	end

EventScript_16C7AC:: @ 816C7AC
	msgbox gUnknown_8196A46
	goto EventScript_16C77A
	end

CeladonCity_GameCorner_EventScript_16C7BA:: @ 816C7BA
	lock
	faceplayer
	msgbox gUnknown_8196A82
	goto EventScript_16C7CA
	end

EventScript_16C7CA:: @ 816C7CA
	closemessage
	applymovement VAR_LAST_TALKED, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

CeladonCity_GameCorner_EventScript_16C7D7:: @ 816C7D7
	lock
	faceplayer
	msgbox gUnknown_8196AC7
	goto EventScript_16C7CA
	end

CeladonCity_GameCorner_EventScript_16C7E7:: @ 816C7E7
	lock
	faceplayer
	goto_if_set FLAG_GOT_10_COINS_FROM_GAMBLER, EventScript_16C849
	msgbox gUnknown_8196AF3
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_16C839
	checkcoins VAR_TEMP_1
	compare VAR_TEMP_1, 9990
	goto_if_ge EventScript_16C82B
	givecoins 10
	textcolor 3
	msgbox gUnknown_8196B0D
	playse SE_SHOP
	waitse
	setflag FLAG_GOT_10_COINS_FROM_GAMBLER
	goto EventScript_16C7CA
	end

EventScript_16C82B:: @ 816C82B
	msgbox gUnknown_8196B30
	goto EventScript_16C7CA
	end

EventScript_16C839:: @ 816C839
	textcolor 3
	msgbox gUnknown_8196F26
	goto EventScript_16C7CA
	end

EventScript_16C849:: @ 816C849
	msgbox gUnknown_8196B49
	goto EventScript_16C7CA
	end

CeladonCity_GameCorner_EventScript_16C857:: @ 816C857
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_ERIKA, EventScript_16C870
	msgbox gUnknown_8196BAD
	goto EventScript_16C7CA
	end

EventScript_16C870:: @ 816C870
	msgbox gUnknown_8196CA1
	goto EventScript_16C7CA
	end

CeladonCity_GameCorner_EventScript_16C87E:: @ 816C87E
	lock
	faceplayer
	msgbox gUnknown_8196B7B
	goto EventScript_16C7CA
	end

CeladonCity_GameCorner_EventScript_16C88E:: @ 816C88E
	lock
	faceplayer
	msgbox gUnknown_8196CFE
	goto EventScript_16C7CA
	end

CeladonCity_GameCorner_EventScript_16C89E:: @ 816C89E
	lock
	faceplayer
	goto_if_set FLAG_GOT_20_COINS_FROM_GAMBLER, EventScript_16C8F0
	msgbox gUnknown_8196D2B
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_16C839
	checkcoins VAR_TEMP_1
	compare VAR_TEMP_1, 9980
	goto_if_ge EventScript_16C8E2
	givecoins 20
	textcolor 3
	msgbox gUnknown_8196D47
	playse SE_SHOP
	waitse
	setflag FLAG_GOT_20_COINS_FROM_GAMBLER
	goto EventScript_16C7CA
	end

EventScript_16C8E2:: @ 816C8E2
	msgbox gUnknown_8196D6F
	goto EventScript_16C7CA
	end

EventScript_16C8F0:: @ 816C8F0
	msgbox gUnknown_8196D87
	goto EventScript_16C7CA
	end

CeladonCity_GameCorner_EventScript_16C8FE:: @ 816C8FE
	lock
	faceplayer
	goto_if_set FLAG_GOT_20_COINS_FROM_GAMBLER_2, EventScript_16C950
	msgbox gUnknown_8196DB7
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_16C839
	checkcoins VAR_TEMP_1
	compare VAR_TEMP_1, 9980
	goto_if_ge EventScript_16C942
	givecoins 20
	textcolor 3
	msgbox gUnknown_8196DF8
	playse SE_SHOP
	waitse
	setflag FLAG_GOT_20_COINS_FROM_GAMBLER_2
	goto EventScript_16C7CA
	end

EventScript_16C942:: @ 816C942
	msgbox gUnknown_8196E1B
	goto EventScript_16C7CA
	end

EventScript_16C950:: @ 816C950
	msgbox gUnknown_8196E40
	goto EventScript_16C7CA
	end

CeladonCity_GameCorner_EventScript_16C95E:: @ 816C95E
	lockall
	setvar VAR_0x8004, 0
	goto EventScript_16C96C
	end

EventScript_16C96A:: @ 816C96A
	releaseall
	end

EventScript_16C96C:: @ 816C96C
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_16CAA0
	msgbox gUnknown_8196F46, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16C96A
	setfieldeffectarg 0, 255
	setfieldeffectarg 1, 10
	setfieldeffectarg 2, 14
	dofieldeffect 64
	waitfieldeffect 64
	specialvar VAR_RESULT, Special_GetRandomSlotMachine
	playslotmachine VAR_RESULT
	releaseall
	end

CeladonCity_GameCorner_EventScript_16C9A4:: @ 816C9A4
	lockall
	setvar VAR_0x8004, 1
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16C9B0:: @ 816C9B0
	lockall
	setvar VAR_0x8004, 2
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16C9BC:: @ 816C9BC
	lockall
	setvar VAR_0x8004, 3
	goto EventScript_16C96C
	end

EventScript_16C9C8:: @ 816C9C8
	lockall
	setvar VAR_0x8004, 4
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16C9D4:: @ 816C9D4
	lockall
	setvar VAR_0x8004, 5
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16C9E0:: @ 816C9E0
	lockall
	setvar VAR_0x8004, 6
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16C9EC:: @ 816C9EC
	lockall
	setvar VAR_0x8004, 7
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16C9F8:: @ 816C9F8
	lockall
	setvar VAR_0x8004, 8
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA04:: @ 816CA04
	lockall
	setvar VAR_0x8004, 9
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA10:: @ 816CA10
	lockall
	setvar VAR_0x8004, 10
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA1C:: @ 816CA1C
	lockall
	setvar VAR_0x8004, 11
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA28:: @ 816CA28
	lockall
	setvar VAR_0x8004, 12
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA34:: @ 816CA34
	lockall
	setvar VAR_0x8004, 13
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA40:: @ 816CA40
	lockall
	setvar VAR_0x8004, 14
	goto EventScript_16C96C
	end

EventScript_16CA4C:: @ 816CA4C
	lockall
	setvar VAR_0x8004, 15
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA58:: @ 816CA58
	lockall
	setvar VAR_0x8004, 16
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA64:: @ 816CA64
	lockall
	setvar VAR_0x8004, 17
	goto EventScript_16C96C
	end

EventScript_16CA70:: @ 816CA70
	lockall
	setvar VAR_0x8004, 18
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA7C:: @ 816CA7C
	lockall
	setvar VAR_0x8004, 19
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA88:: @ 816CA88
	lockall
	setvar VAR_0x8004, 20
	goto EventScript_16C96C
	end

CeladonCity_GameCorner_EventScript_16CA94:: @ 816CA94
	lockall
	setvar VAR_0x8004, 21
	goto EventScript_16C96C
	end

EventScript_16CAA0:: @ 816CAA0
	msgbox gUnknown_8196F0D
	releaseall
	end

CeladonCity_GameCorner_EventScript_16CAAA:: @ 816CAAA
	lockall
	msgbox gUnknown_8196EDC
	call_if_unset FLAG_OPENED_ROCKET_HIDEOUT, EventScript_16CABE
	releaseall
	end

EventScript_16CABE:: @ 816CABE
	playse SE_KI_GASYAN
	setmetatile 15, 2, 669, 0
	setmetatile 16, 2, 670, 1
	setmetatile 17, 2, 671, 1
	setmetatile 16, 3, 678, 1
	setmetatile 17, 3, 679, 1
	special DrawWholeMapView
	setflag FLAG_OPENED_ROCKET_HIDEOUT
	return

CeladonCity_GameCorner_EventScript_16CAF5:: @ 816CAF5
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_7, Text_196E69, Text_196E95, EventScript_16CB10
	msgbox gUnknown_8196E9B, MSGBOX_AUTOCLOSE
	end

EventScript_16CB10:: @ 816CB10
	msgbox gUnknown_8196E9B
	closemessage
	compare VAR_FACING, DIR_WEST
	call_if_eq EventScript_16CB34
	compare VAR_FACING, DIR_WEST
	call_if_ne EventScript_16CB3F
	removeobject 11
	release
	end

EventScript_16CB34:: @ 816CB34
	applymovement 11, Movement_16CB4A
	waitmovement 0
	return

EventScript_16CB3F:: @ 816CB3F
	applymovement 11, Movement_16CB53
	waitmovement 0
	return

Movement_16CB4A:: @ 816CB4A
	walk_down
	walk_right
	walk_right
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

Movement_16CB53:: @ 816CB53
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

CeladonCity_GameCorner_EventScript_16CB5A:: @ 816CB5A
	msgbox gUnknown_8196F64, MSGBOX_SIGN
	end

CeladonCity_GameCorner_EventScript_16CB63:: @ 816CB63
	msgbox gUnknown_8196F81, MSGBOX_SIGN
	end

CeladonCity_GameCorner_EventScript_16CB6C:: @ 816CB6C
	msgbox gUnknown_8196FA0, MSGBOX_SIGN
	end
