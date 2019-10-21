FuchsiaCity_Gym_MapScripts:: @ 816D54D
	.byte 0

FuchsiaCity_Gym_EventScript_16D54E:: @ 816D54E
	famechecker FAMECHECKER_KOGA, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle 1, TRAINER_LEADER_KOGA, 0, Text_19832E, Text_198444, EventScript_16D580
	checkflag FLAG_0x259
	goto_if lt, EventScript_16D5A6
	msgbox gUnknown_8198481
	release
	end

EventScript_16D580:: @ 816D580
	famechecker FAMECHECKER_KOGA, 1
	clearflag FLAG_HIDE_FAME_CHECKER_KOGA_JOURNAL
	setflag FLAG_DEFEATED_KOGA
	setflag FLAG_BADGE05_GET
	set_gym_trainers 5
	goto EventScript_16D5A6
	end

EventScript_16D5A6:: @ 816D5A6
	msgbox gUnknown_819850E
	checkitemspace ITEM_TM06, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16D5E7
	additem ITEM_TM06, 1
	giveitemfanfaremsg gUnknown_819858F, ITEM_TM06
	setflag FLAG_0x259
	msgbox gUnknown_81985AB
	release
	end

EventScript_16D5E7:: @ 816D5E7
	msgbox gUnknown_819860D
	release
	end

FuchsiaCity_Gym_EventScript_16D5F1:: @ 816D5F1
	trainerbattle 0, TRAINER_TAMER_PHIL, 0, Text_198866, Text_1988B6
	msgbox gUnknown_81988CB, 6
	end

FuchsiaCity_Gym_EventScript_16D608:: @ 816D608
	trainerbattle 0, TRAINER_TAMER_EDGAR, 0, Text_19891F, Text_19897F
	msgbox gUnknown_8198985, 6
	end

FuchsiaCity_Gym_EventScript_16D61F:: @ 816D61F
	trainerbattle 0, TRAINER_JUGGLER_KIRK, 0, Text_19871E, Text_198779
	famechecker FAMECHECKER_KOGA, 2
	msgbox gUnknown_8198787, 6
	end

FuchsiaCity_Gym_EventScript_16D643:: @ 816D643
	trainerbattle 0, TRAINER_JUGGLER_SHAWN, 0, Text_1989A1, Text_1989EA
	msgbox gUnknown_8198A10, 6
	end

FuchsiaCity_Gym_EventScript_16D65A:: @ 816D65A
	trainerbattle 0, TRAINER_JUGGLER_KAYDEN, 0, Text_198629, Text_1986B4
	msgbox gUnknown_81986C9, 6
	end

FuchsiaCity_Gym_EventScript_16D671:: @ 816D671
	trainerbattle 0, TRAINER_JUGGLER_NATE, 0, Text_1987E8, Text_198812
	msgbox gUnknown_8198825, 6
	end

FuchsiaCity_Gym_EventScript_16D688:: @ 816D688
	lock
	faceplayer
	checkflag FLAG_DEFEATED_KOGA
	goto_if_eq EventScript_16D69D
	msgbox gUnknown_8198A5E
	release
	end

EventScript_16D69D:: @ 816D69D
	msgbox gUnknown_8198B1D
	release
	end

FuchsiaCity_Gym_EventScript_16D6A7:: @ 816D6A7
	lockall
	checkflag FLAG_BADGE05_GET
	goto_if_eq EventScript_16D6BB
	msgbox gUnknown_8198B4B
	releaseall
	end

EventScript_16D6BB:: @ 816D6BB
	msgbox gUnknown_8198B81
	releaseall
	end
