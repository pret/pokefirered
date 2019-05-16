SaffronCity_Gym_MapScripts:: @ 816EDD7
	.byte 0

SaffronCity_Gym_EventScript_16EDD8:: @ 816EDD8
	setvar VAR_0x8004, 7
	setvar VAR_0x8005, 2
	special UpdatePickStateFromSpecialVar8005
	trainerbattle 1, 420, 0, Text_19B53C, Text_19B602, EventScript_16EE0A
	checkflag FLAG_0x29A
	goto_if 0, EventScript_16EE3D
	loadword 0, gUnknown_819B7F2
	callstd 4
	release
	end

EventScript_16EE0A:: @ 816EE0A
	setvar VAR_0x8004, 7
	setvar VAR_0x8005, 2
	special SetFlavorTextFlagFromSpecialVars
	setvar VAR_0x8004, 7
	setvar VAR_0x8005, 3
	special SetFlavorTextFlagFromSpecialVars
	clearflag FLAG_0x0AE
	setflag FLAG_0x4B5
	setflag FLAG_0x825
	setvar VAR_0x8008, 6
	call EventScript_1A6B18
	goto EventScript_16EE3D
	end

EventScript_16EE3D:: @ 816EE3D
	loadword 0, gUnknown_819B6FA
	callstd 4
	checkitemspace ITEM_TM04, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16EE7E
	additem ITEM_TM04, 1
	giveitemfanfaremsg gUnknown_819B7D3, ITEM_TM04
	setflag FLAG_0x29A
	loadword 0, gUnknown_819B685
	callstd 4
	release
	end

EventScript_16EE7E:: @ 816EE7E
	loadword 0, gUnknown_819B849
	callstd 4
	release
	end

SaffronCity_Gym_EventScript_16EE88:: @ 816EE88
	trainerbattle 0, 280, 0, Text_19B936, Text_19B957
	loadword 0, gUnknown_819B96D
	callstd 6
	end

SaffronCity_Gym_EventScript_16EE9F:: @ 816EE9F
	trainerbattle 0, 281, 0, Text_19BA45, Text_19BA9E
	setvar VAR_0x8004, 7
	setvar VAR_0x8005, 5
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_819BAB4
	callstd 6
	end

SaffronCity_Gym_EventScript_16EEC3:: @ 816EEC3
	trainerbattle 0, 282, 0, Text_19BB49, Text_19BBA1
	loadword 0, gUnknown_819BBB3
	callstd 6
	end

SaffronCity_Gym_EventScript_16EEDA:: @ 816EEDA
	trainerbattle 0, 283, 0, Text_19BC57, Text_19BCBC
	loadword 0, gUnknown_819BCC4
	callstd 6
	end

SaffronCity_Gym_EventScript_16EEF1:: @ 816EEF1
	trainerbattle 0, 462, 0, Text_19B86A, Text_19B8A8
	loadword 0, gUnknown_819B8B9
	callstd 6
	end

SaffronCity_Gym_EventScript_16EF08:: @ 816EF08
	trainerbattle 0, 463, 0, Text_19B998, Text_19B9EC
	loadword 0, gUnknown_819B9F7
	callstd 6
	end

SaffronCity_Gym_EventScript_16EF1F:: @ 816EF1F
	trainerbattle 0, 464, 0, Text_19BAE8, Text_19BB0D
	loadword 0, gUnknown_819BB1F
	callstd 6
	end

SaffronCity_Gym_EventScript_16EF36:: @ 816EF36
	lock
	faceplayer
	checkflag FLAG_0x4B5
	goto_if 1, EventScript_16EF4B
	loadword 0, gUnknown_819BCF6
	callstd 4
	release
	end

EventScript_16EF4B:: @ 816EF4B
	loadword 0, gUnknown_819BDBB
	callstd 4
	release
	end

SaffronCity_Gym_EventScript_16EF55:: @ 816EF55
	lockall
	checkflag FLAG_0x825
	goto_if 1, EventScript_16EF69
	loadword 0, gUnknown_819BDFE
	callstd 4
	releaseall
	end

EventScript_16EF69:: @ 816EF69
	loadword 0, gUnknown_819BE37
	callstd 4
	releaseall
	end
