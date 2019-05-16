PewterCity_Gym_MapScripts:: @ 816A592
	.byte 0

PewterCity_Gym_EventScript_16A593:: @ 816A593
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 2
	special UpdatePickStateFromSpecialVar8005
	trainerbattle 1, 414, 0, Text_190CD4, Text_190E4F, EventScript_16A5C5
	checkflag FLAG_0x254
	goto_if 0, EventScript_16A5F3
	loadword 0, gUnknown_819110F
	callstd 4
	release
	end

EventScript_16A5C5:: @ 816A5C5
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	setflag FLAG_0x4B0
	setflag FLAG_UNK820
	setvar VAR_0x406C, 1
	setflag FLAG_0x02E
	clearflag FLAG_0x092
	setvar VAR_0x8008, 1
	call EventScript_1A6B18
	goto EventScript_16A5F3
	end

EventScript_16A5F3:: @ 816A5F3
	loadword 0, gUnknown_8190FC1
	callstd 4
	checkitemspace ITEM_TM39, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16A634
	additem ITEM_TM39, 1
	giveitemfanfaremsg gUnknown_8190FDB, ITEM_TM39
	setflag FLAG_0x254
	loadword 0, gUnknown_8190FF8
	callstd 4
	release
	end

EventScript_16A634:: @ 816A634
	loadword 0, gUnknown_81911CE
	callstd 4
	release
	end

PewterCity_Gym_EventScript_16A63E:: @ 816A63E
	trainerbattle 0, 142, 0, Text_1911EC, Text_191237
	loadword 0, gUnknown_819126B
	callstd 6
	end

PewterCity_Gym_EventScript_16A655:: @ 816A655
	lock
	faceplayer
	checkflag FLAG_0x4B0
	goto_if 1, EventScript_16A67F
	loadword 0, gUnknown_8191298
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16A689
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16A697
	end

EventScript_16A67F:: @ 816A67F
	loadword 0, gUnknown_819143C
	callstd 4
	release
	end

EventScript_16A689:: @ 816A689
	loadword 0, gUnknown_819133C
	callstd 4
	goto EventScript_16A6A5
	end

EventScript_16A697:: @ 816A697
	loadword 0, gUnknown_8191412
	callstd 4
	goto EventScript_16A6A5
	end

EventScript_16A6A5:: @ 816A6A5
	loadword 0, gUnknown_819135C
	callstd 4
	release
	end

PewterCity_Gym_EventScript_16A6AF:: @ 816A6AF
	lockall
	checkflag FLAG_UNK820
	goto_if 1, EventScript_16A6C3
	loadword 0, gUnknown_819146E
	callstd 4
	releaseall
	end

EventScript_16A6C3:: @ 816A6C3
	loadword 0, gUnknown_81914A4
	callstd 4
	releaseall
	end
