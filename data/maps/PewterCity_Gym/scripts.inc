PewterCity_Gym_MapScripts:: @ 816A592
	.byte 0

PewterCity_Gym_EventScript_16A593:: @ 816A593
	famechecker FAMECHECKER_BROCK, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle_single TRAINER_LEADER_BROCK, Text_190CD4, Text_190E4F, EventScript_16A5C5, NO_MUSIC
	goto_if_unset FLAG_GOT_TM39_FROM_BROCK, EventScript_16A5F3
	msgbox gUnknown_819110F
	release
	end

EventScript_16A5C5:: @ 816A5C5
	famechecker FAMECHECKER_BROCK, 1
	setflag FLAG_DEFEATED_BROCK
	setflag FLAG_BADGE01_GET
	setvar VAR_MAP_SCENE_PEWTER_CITY, 1
	setflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
	clearflag FLAG_HIDE_PEWTER_CITY_RUNNING_SHOES_GUY
	set_gym_trainers 1
	goto EventScript_16A5F3
	end

EventScript_16A5F3:: @ 816A5F3
	msgbox gUnknown_8190FC1
	checkitemspace ITEM_TM39, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_16A634
	giveitem_msg gUnknown_8190FDB, ITEM_TM39
	setflag FLAG_GOT_TM39_FROM_BROCK
	msgbox gUnknown_8190FF8
	release
	end

EventScript_16A634:: @ 816A634
	msgbox gUnknown_81911CE
	release
	end

PewterCity_Gym_EventScript_16A63E:: @ 816A63E
	trainerbattle_single TRAINER_CAMPER_LIAM, Text_1911EC, Text_191237
	msgbox gUnknown_819126B, MSGBOX_AUTOCLOSE
	end

PewterCity_Gym_EventScript_16A655:: @ 816A655
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_BROCK, EventScript_16A67F
	msgbox gUnknown_8191298, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16A689
	compare VAR_RESULT, NO
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
	goto_if_set FLAG_BADGE01_GET, EventScript_16A6C3
	msgbox gUnknown_819146E
	releaseall
	end

EventScript_16A6C3:: @ 816A6C3
	msgbox gUnknown_81914A4
	releaseall
	end
