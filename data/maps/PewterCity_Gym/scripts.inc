PewterCity_Gym_MapScripts:: @ 816A592
	.byte 0

PewterCity_Gym_EventScript_16A593:: @ 816A593
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 2
	special UpdatePickStateFromSpecialVar8005
	trainerbattle 1, TRAINER_LEADER_BROCK, 0, Text_190CD4, Text_190E4F, EventScript_16A5C5
	checkflag FLAG_0x254
	goto_if 0, EventScript_16A5F3
	msgbox gUnknown_819110F
	release
	end

EventScript_16A5C5:: @ 816A5C5
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	setflag FLAG_0x4B0
	setflag FLAG_BADGE01_GET
	setvar VAR_MAP_SCENE_PEWTER_CITY, 1
	setflag FLAG_HIDE_PEWTER_CITY_GYM_ESCORT
	clearflag FLAG_0x092
	setvar VAR_0x8008, 1
	call EventScript_1A6B18
	goto EventScript_16A5F3
	end

EventScript_16A5F3:: @ 816A5F3
	msgbox gUnknown_8190FC1
	checkitemspace ITEM_TM39, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16A634
	additem ITEM_TM39, 1
	giveitemfanfaremsg gUnknown_8190FDB, ITEM_TM39
	setflag FLAG_0x254
	msgbox gUnknown_8190FF8
	release
	end

EventScript_16A634:: @ 816A634
	msgbox gUnknown_81911CE
	release
	end

PewterCity_Gym_EventScript_16A63E:: @ 816A63E
	trainerbattle 0, TRAINER_CAMPER_LIAM, 0, Text_1911EC, Text_191237
	msgbox gUnknown_819126B, 6
	end

PewterCity_Gym_EventScript_16A655:: @ 816A655
	lock
	faceplayer
	checkflag FLAG_0x4B0
	goto_if_eq EventScript_16A67F
	msgbox gUnknown_8191298, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_16A689
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16A697
	end

EventScript_16A67F:: @ 816A67F
	msgbox gUnknown_819143C
	release
	end

EventScript_16A689:: @ 816A689
	msgbox gUnknown_819133C
	goto EventScript_16A6A5
	end

EventScript_16A697:: @ 816A697
	msgbox gUnknown_8191412
	goto EventScript_16A6A5
	end

EventScript_16A6A5:: @ 816A6A5
	msgbox gUnknown_819135C
	release
	end

PewterCity_Gym_EventScript_16A6AF:: @ 816A6AF
	lockall
	checkflag FLAG_BADGE01_GET
	goto_if_eq EventScript_16A6C3
	msgbox gUnknown_819146E
	releaseall
	end

EventScript_16A6C3:: @ 816A6C3
	msgbox gUnknown_81914A4
	releaseall
	end
