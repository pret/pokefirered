FuchsiaCity_Gym_MapScripts:: @ 816D54D
	.byte 0

FuchsiaCity_Gym_EventScript_16D54E:: @ 816D54E
	famechecker FAMECHECKER_KOGA, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle_single TRAINER_LEADER_KOGA, Text_19832E, Text_198444, EventScript_16D580, NO_MUSIC
	goto_if_unset FLAG_GOT_TM06_FROM_KOGA, EventScript_16D5A6
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
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16D5E7
	giveitem_msg gUnknown_819858F, ITEM_TM06
	setflag FLAG_GOT_TM06_FROM_KOGA
	msgbox gUnknown_81985AB
	release
	end

EventScript_16D5E7:: @ 816D5E7
	msgbox gUnknown_819860D
	release
	end

FuchsiaCity_Gym_EventScript_16D5F1:: @ 816D5F1
	trainerbattle_single TRAINER_TAMER_PHIL, Text_198866, Text_1988B6
	msgbox gUnknown_81988CB, 6
	end

FuchsiaCity_Gym_EventScript_16D608:: @ 816D608
	trainerbattle_single TRAINER_TAMER_EDGAR, Text_19891F, Text_19897F
	msgbox gUnknown_8198985, 6
	end

FuchsiaCity_Gym_EventScript_16D61F:: @ 816D61F
	trainerbattle_single TRAINER_JUGGLER_KIRK, Text_19871E, Text_198779
	famechecker FAMECHECKER_KOGA, 2
	msgbox gUnknown_8198787, 6
	end

FuchsiaCity_Gym_EventScript_16D643:: @ 816D643
	trainerbattle_single TRAINER_JUGGLER_SHAWN, Text_1989A1, Text_1989EA
	msgbox gUnknown_8198A10, 6
	end

FuchsiaCity_Gym_EventScript_16D65A:: @ 816D65A
	trainerbattle_single TRAINER_JUGGLER_KAYDEN, Text_198629, Text_1986B4
	msgbox gUnknown_81986C9, 6
	end

FuchsiaCity_Gym_EventScript_16D671:: @ 816D671
	trainerbattle_single TRAINER_JUGGLER_NATE, Text_1987E8, Text_198812
	msgbox gUnknown_8198825, 6
	end

FuchsiaCity_Gym_EventScript_16D688:: @ 816D688
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_KOGA, EventScript_16D69D
	msgbox gUnknown_8198A5E
	release
	end

EventScript_16D69D:: @ 816D69D
	msgbox gUnknown_8198B1D
	release
	end

FuchsiaCity_Gym_EventScript_16D6A7:: @ 816D6A7
	lockall
	goto_if_set FLAG_BADGE05_GET, EventScript_16D6BB
	msgbox gUnknown_8198B4B
	releaseall
	end

EventScript_16D6BB:: @ 816D6BB
	msgbox gUnknown_8198B81
	releaseall
	end
