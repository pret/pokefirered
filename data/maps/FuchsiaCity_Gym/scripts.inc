FuchsiaCity_Gym_MapScripts:: @ 816D54D
	.byte 0

FuchsiaCity_Gym_EventScript_16D54E:: @ 816D54E
	setvar VAR_0x8004, 6
	setvar VAR_0x8005, 2
	special UpdatePickStateFromSpecialVar8005
	trainerbattle 1, 418, 0, Text_19832E, Text_198444, EventScript_16D580
	checkflag FLAG_0x259
	goto_if 0, EventScript_16D5A6
	msgbox gUnknown_8198481
	release
	end

EventScript_16D580:: @ 816D580
	setvar VAR_0x8004, 6
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	clearflag FLAG_0x09F
	setflag FLAG_0x4B4
	setflag FLAG_UNK824
	setvar VAR_0x8008, 5
	call EventScript_1A6B18
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
	trainerbattle 0, 294, 0, Text_198866, Text_1988B6
	msgbox gUnknown_81988CB, 6
	end

FuchsiaCity_Gym_EventScript_16D608:: @ 816D608
	trainerbattle 0, 295, 0, Text_19891F, Text_19897F
	msgbox gUnknown_8198985, 6
	end

FuchsiaCity_Gym_EventScript_16D61F:: @ 816D61F
	trainerbattle 0, 288, 0, Text_19871E, Text_198779
	setvar VAR_0x8004, 6
	setvar VAR_0x8005, 2
	special SetFlavorTextFlagFromSpecialVars
	msgbox gUnknown_8198787, 6
	end

FuchsiaCity_Gym_EventScript_16D643:: @ 816D643
	trainerbattle 0, 289, 0, Text_1989A1, Text_1989EA
	msgbox gUnknown_8198A10, 6
	end

FuchsiaCity_Gym_EventScript_16D65A:: @ 816D65A
	trainerbattle 0, 292, 0, Text_198629, Text_1986B4
	msgbox gUnknown_81986C9, 6
	end

FuchsiaCity_Gym_EventScript_16D671:: @ 816D671
	trainerbattle 0, 293, 0, Text_1987E8, Text_198812
	msgbox gUnknown_8198825, 6
	end

FuchsiaCity_Gym_EventScript_16D688:: @ 816D688
	lock
	faceplayer
	checkflag FLAG_0x4B4
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
	checkflag FLAG_UNK824
	goto_if_eq EventScript_16D6BB
	msgbox gUnknown_8198B4B
	releaseall
	end

EventScript_16D6BB:: @ 816D6BB
	msgbox gUnknown_8198B81
	releaseall
	end
