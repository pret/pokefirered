VermilionCity_Gym_MapScripts:: @ 816B69E
	map_script MAP_SCRIPT_ON_LOAD, VermilionCity_Gym_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, VermilionCity_Gym_OnTransition
	.byte 0

VermilionCity_Gym_OnLoad:: @ 816B6A9
	call_if_set FLAG_TEMP_1, EventScript_16B6BC
	call_if_set FLAG_FOUND_BOTH_VERMILION_GYM_SWITCHES, EventScript_16B717
	end

EventScript_16B6BC:: @ 816B6BC
	setmetatile 3, 6, 699, 1
	setmetatile 4, 6, 700, 1
	setmetatile 5, 6, 701, 1
	setmetatile 6, 6, 702, 1
	setmetatile 7, 6, 703, 1
	setmetatile 3, 7, 707, 1
	setmetatile 4, 7, 708, 1
	setmetatile 5, 7, 709, 1
	setmetatile 6, 7, 710, 1
	setmetatile 7, 7, 711, 1
	return

EventScript_16B717:: @ 816B717
	setmetatile 3, 6, 659, 1
	setmetatile 4, 6, 660, 0
	setmetatile 5, 6, 641, 0
	setmetatile 6, 6, 661, 0
	setmetatile 7, 6, 662, 1
	setmetatile 3, 7, 667, 1
	setmetatile 4, 7, 668, 0
	setmetatile 5, 7, 641, 0
	setmetatile 6, 7, 669, 0
	setmetatile 7, 7, 670, 1
	return

VermilionCity_Gym_OnTransition:: @ 816B772
	call EventScript_16B778
	end

EventScript_16B778:: @ 816B778
	goto_if_set FLAG_FOUND_BOTH_VERMILION_GYM_SWITCHES, EventScript_Return
	special Special_SetVermilionTrashCans
	copyvar VAR_TEMP_0, VAR_0x8004
	copyvar VAR_TEMP_1, VAR_0x8005
	return

VermilionCity_Gym_EventScript_16B78F:: @ 816B78F
	lockall
	setvar VAR_0x8008, 1
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B79B:: @ 816B79B
	lockall
	setvar VAR_0x8008, 2
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B7A7:: @ 816B7A7
	lockall
	setvar VAR_0x8008, 3
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B7B3:: @ 816B7B3
	lockall
	setvar VAR_0x8008, 4
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B7BF:: @ 816B7BF
	lockall
	setvar VAR_0x8008, 5
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B7CB:: @ 816B7CB
	lockall
	setvar VAR_0x8008, 6
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B7D7:: @ 816B7D7
	lockall
	setvar VAR_0x8008, 7
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B7E3:: @ 816B7E3
	lockall
	setvar VAR_0x8008, 8
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B7EF:: @ 816B7EF
	lockall
	setvar VAR_0x8008, 9
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B7FB:: @ 816B7FB
	lockall
	setvar VAR_0x8008, 10
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B807:: @ 816B807
	lockall
	setvar VAR_0x8008, 11
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B813:: @ 816B813
	lockall
	setvar VAR_0x8008, 12
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B81F:: @ 816B81F
	lockall
	setvar VAR_0x8008, 13
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B82B:: @ 816B82B
	lockall
	setvar VAR_0x8008, 14
	goto EventScript_16B843
	end

VermilionCity_Gym_EventScript_16B837:: @ 816B837
	lockall
	setvar VAR_0x8008, 15
	goto EventScript_16B843
	end

EventScript_16B843:: @ 816B843
	goto_if_questlog EventScript_ReleaseEnd
	special sub_8112364
	copyvar VAR_0x8004, VAR_TEMP_0
	copyvar VAR_0x8005, VAR_TEMP_1
	goto_if_set FLAG_FOUND_BOTH_VERMILION_GYM_SWITCHES, EventScript_16B8E5
	goto_if_set FLAG_TEMP_1, EventScript_16B89E
	compare VAR_0x8004, VAR_0x8008
	goto_if_eq EventScript_16B885
	msgbox gUnknown_8195289
	releaseall
	end

EventScript_16B885:: @ 816B885
	msgbox gUnknown_81952A8
	playse SE_PIN
	waitse
	call EventScript_16B6BC
	special DrawWholeMapView
	setflag FLAG_TEMP_1
	releaseall
	end

EventScript_16B89E:: @ 816B89E
	compare VAR_0x8005, VAR_0x8008
	goto_if_eq EventScript_16B8CB
	msgbox gUnknown_819536C
	clearflag FLAG_TEMP_1
	special Special_SetVermilionTrashCans
	copyvar VAR_TEMP_0, VAR_0x8004
	copyvar VAR_TEMP_1, VAR_0x8005
	call EventScript_16B8EF
	special DrawWholeMapView
	releaseall
	end

EventScript_16B8CB:: @ 816B8CB
	msgbox gUnknown_8195330
	closemessage
	call EventScript_16B717
	special DrawWholeMapView
	playse SE_KI_GASYAN
	waitse
	setflag FLAG_FOUND_BOTH_VERMILION_GYM_SWITCHES
	releaseall
	end

EventScript_16B8E5:: @ 816B8E5
	msgbox gUnknown_8195289
	releaseall
	end

EventScript_16B8EF:: @ 816B8EF
	setmetatile 3, 6, 681, 1
	setmetatile 4, 6, 682, 1
	setmetatile 5, 6, 645, 1
	setmetatile 6, 6, 683, 1
	setmetatile 7, 6, 684, 1
	setmetatile 3, 7, 689, 1
	setmetatile 4, 7, 690, 1
	setmetatile 5, 7, 653, 1
	setmetatile 6, 7, 691, 1
	setmetatile 7, 7, 692, 1
	return

VermilionCity_Gym_EventScript_16B94A:: @ 816B94A
	famechecker FAMECHECKER_LTSURGE, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle_single TRAINER_LEADER_LT_SURGE, Text_194BA4, Text_194E03, EventScript_16B97C, NO_MUSIC
	goto_if_unset FLAG_GOT_TM34_FROM_SURGE, EventScript_16B9AF
	msgbox gUnknown_8194C8E
	release
	end

EventScript_16B97C:: @ 816B97C
	famechecker FAMECHECKER_LTSURGE, 1
	call_if_unset FLAG_GOT_HM05, EventScript_16B9AB
	clearflag FLAG_HIDE_FAME_CHECKER_LT_SURGE_JOURNAL
	setflag FLAG_DEFEATED_LT_SURGE
	setflag FLAG_BADGE03_GET
	set_gym_trainers 3
	goto EventScript_16B9AF
	end

EventScript_16B9AB:: @ 816B9AB
	clearflag FLAG_HIDE_VERMILION_CITY_OAKS_AIDE
	return

EventScript_16B9AF:: @ 816B9AF
	msgbox gUnknown_8194CFA
	checkitemspace ITEM_TM34, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_16B9F0
	giveitem_msg gUnknown_8194D87, ITEM_TM34
	setflag FLAG_GOT_TM34_FROM_SURGE
	msgbox gUnknown_8194DA8
	release
	end

EventScript_16B9F0:: @ 816B9F0
	msgbox gUnknown_8194DE3
	release
	end

VermilionCity_Gym_EventScript_16B9FA:: @ 816B9FA
	trainerbattle_single TRAINER_SAILOR_DWAYNE, Text_194FBD, Text_194FF1
	famechecker FAMECHECKER_LTSURGE, 4
	msgbox gUnknown_8195004, MSGBOX_AUTOCLOSE
	end

VermilionCity_Gym_EventScript_16BA1E:: @ 816BA1E
	trainerbattle_single TRAINER_ENGINEER_BAILY, Text_194F1F, Text_194F6F
	msgbox gUnknown_8194F76, MSGBOX_AUTOCLOSE
	end

VermilionCity_Gym_EventScript_16BA35:: @ 816BA35
	trainerbattle_single TRAINER_GENTLEMAN_TUCKER, Text_194E57, Text_194EA5, EventScript_16BA5D
	famechecker FAMECHECKER_LTSURGE, 3
	msgbox gUnknown_8194EBD, MSGBOX_AUTOCLOSE
	end

EventScript_16BA5D:: @ 816BA5D
	famechecker FAMECHECKER_LTSURGE, 2
	release
	end

VermilionCity_Gym_EventScript_16BA6C:: @ 816BA6C
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_LT_SURGE, EventScript_16BA81
	msgbox gUnknown_81950B4
	release
	end

EventScript_16BA81:: @ 816BA81
	msgbox gUnknown_81951EC
	release
	end

VermilionCity_Gym_EventScript_16BA8B:: @ 816BA8B
	lockall
	goto_if_set FLAG_BADGE03_GET, EventScript_16BA9F
	msgbox gUnknown_819520B
	releaseall
	end

EventScript_16BA9F:: @ 816BA9F
	msgbox gUnknown_8195248
	releaseall
	end
