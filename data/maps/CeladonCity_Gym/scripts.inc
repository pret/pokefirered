CeladonCity_Gym_MapScripts:: @ 816D060
	.byte 0

CeladonCity_Gym_EventScript_16D061:: @ 816D061
	famechecker FAMECHECKER_ERIKA, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle 1, TRAINER_LEADER_ERIKA, 0, Text_197114, Text_197260, EventScript_16D0A0
	checkflag FLAG_0x293
	goto_if 0, EventScript_16D0C6
	famechecker FAMECHECKER_ERIKA, 4
	msgbox gUnknown_81972B8
	release
	end

EventScript_16D0A0:: @ 816D0A0
	famechecker FAMECHECKER_ERIKA, 1
	clearflag FLAG_HIDE_FAME_CHECKER_ERIKA_JOURNALS
	setflag FLAG_DEFEATED_ERIKA
	setflag FLAG_BADGE04_GET
	set_gym_trainers 4
	goto EventScript_16D0C6
	end

EventScript_16D0C6:: @ 816D0C6
	msgbox gUnknown_8197327
	checkitemspace ITEM_TM19, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16D107
	additem ITEM_TM19, 1
	giveitemfanfaremsg gUnknown_81973BA, ITEM_TM19
	setflag FLAG_0x293
	msgbox gUnknown_81973D7
	release
	end

EventScript_16D107:: @ 816D107
	msgbox gUnknown_819745D
	release
	end

CeladonCity_Gym_EventScript_16D111:: @ 816D111
	trainerbattle 0, TRAINER_LASS_KAY, 0, Text_19747C, Text_1974C4
	msgbox gUnknown_81974D6, 6
	end

CeladonCity_Gym_EventScript_16D128:: @ 816D128
	trainerbattle 0, TRAINER_LASS_LISA, 0, Text_1976C5, Text_1976FF
	famechecker FAMECHECKER_ERIKA, 2
	msgbox gUnknown_8197708, 6
	end

CeladonCity_Gym_EventScript_16D14C:: @ 816D14C
	trainerbattle 0, TRAINER_PICNICKER_TINA, 0, Text_197595, Text_1975BB
	msgbox gUnknown_81975D1, 6
	end

CeladonCity_Gym_EventScript_16D163:: @ 816D163
	trainerbattle 0, TRAINER_BEAUTY_BRIDGET, 0, Text_1974FA, Text_19751C
	msgbox gUnknown_8197527, 6
	end

CeladonCity_Gym_EventScript_16D17A:: @ 816D17A
	trainerbattle 0, TRAINER_BEAUTY_TAMIA, 0, Text_19760B, Text_197660
	famechecker FAMECHECKER_ERIKA, 3
	msgbox gUnknown_8197664, 6
	end

CeladonCity_Gym_EventScript_16D19E:: @ 816D19E
	trainerbattle 0, TRAINER_BEAUTY_LORI, 0, Text_197747, Text_19777A
	msgbox gUnknown_8197788, 6
	end

CeladonCity_Gym_EventScript_16D1B5:: @ 816D1B5
	trainerbattle 0, TRAINER_COOLTRAINER_MARY, 0, Text_1977E5, Text_197832
	msgbox gUnknown_819783E, 6
	end

CeladonCity_Gym_EventScript_16D1CC:: @ 816D1CC
	lockall
	checkflag FLAG_BADGE04_GET
	goto_if_eq EventScript_16D1E0
	msgbox gUnknown_8197874
	releaseall
	end

EventScript_16D1E0:: @ 816D1E0
	msgbox gUnknown_81978AB
	releaseall
	end
