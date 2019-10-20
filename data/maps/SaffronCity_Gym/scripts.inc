SaffronCity_Gym_MapScripts:: @ 816EDD7
	.byte 0

SaffronCity_Gym_EventScript_16EDD8:: @ 816EDD8
	setvar VAR_0x8004, 7
	setvar VAR_0x8005, 2
	special UpdatePickStateFromSpecialVar8005
	trainerbattle 1, TRAINER_LEADER_SABRINA, 0, Text_19B53C, Text_19B602, EventScript_16EE0A
	checkflag FLAG_0x29A
	goto_if 0, EventScript_16EE3D
	msgbox gUnknown_819B7F2
	release
	end

EventScript_16EE0A:: @ 816EE0A
	famechecker FAMECHECKER_SABRINA, 2
	famechecker FAMECHECKER_SABRINA, 3
	clearflag FLAG_HIDE_SAFFRON_CITY_POKECENTER_SABRINA_JOURNALS
	setflag FLAG_DEFEATED_SABRINA
	setflag FLAG_BADGE06_GET
	set_gym_trainers 6
	goto EventScript_16EE3D
	end

EventScript_16EE3D:: @ 816EE3D
	msgbox gUnknown_819B6FA
	checkitemspace ITEM_TM04, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16EE7E
	additem ITEM_TM04, 1
	giveitemfanfaremsg gUnknown_819B7D3, ITEM_TM04
	setflag FLAG_0x29A
	msgbox gUnknown_819B685
	release
	end

EventScript_16EE7E:: @ 816EE7E
	msgbox gUnknown_819B849
	release
	end

SaffronCity_Gym_EventScript_16EE88:: @ 816EE88
	trainerbattle 0, TRAINER_PSYCHIC_JOHAN, 0, Text_19B936, Text_19B957
	msgbox gUnknown_819B96D, 6
	end

SaffronCity_Gym_EventScript_16EE9F:: @ 816EE9F
	trainerbattle 0, TRAINER_PSYCHIC_TYRON, 0, Text_19BA45, Text_19BA9E
	famechecker FAMECHECKER_SABRINA, 5
	msgbox gUnknown_819BAB4, 6
	end

SaffronCity_Gym_EventScript_16EEC3:: @ 816EEC3
	trainerbattle 0, TRAINER_PSYCHIC_CAMERON, 0, Text_19BB49, Text_19BBA1
	msgbox gUnknown_819BBB3, 6
	end

SaffronCity_Gym_EventScript_16EEDA:: @ 816EEDA
	trainerbattle 0, TRAINER_PSYCHIC_PRESTON, 0, Text_19BC57, Text_19BCBC
	msgbox gUnknown_819BCC4, 6
	end

SaffronCity_Gym_EventScript_16EEF1:: @ 816EEF1
	trainerbattle 0, TRAINER_CHANNELER_AMANDA, 0, Text_19B86A, Text_19B8A8
	msgbox gUnknown_819B8B9, 6
	end

SaffronCity_Gym_EventScript_16EF08:: @ 816EF08
	trainerbattle 0, TRAINER_CHANNELER_STACY, 0, Text_19B998, Text_19B9EC
	msgbox gUnknown_819B9F7, 6
	end

SaffronCity_Gym_EventScript_16EF1F:: @ 816EF1F
	trainerbattle 0, TRAINER_CHANNELER_TASHA, 0, Text_19BAE8, Text_19BB0D
	msgbox gUnknown_819BB1F, 6
	end

SaffronCity_Gym_EventScript_16EF36:: @ 816EF36
	lock
	faceplayer
	checkflag FLAG_DEFEATED_SABRINA
	goto_if_eq EventScript_16EF4B
	msgbox gUnknown_819BCF6
	release
	end

EventScript_16EF4B:: @ 816EF4B
	msgbox gUnknown_819BDBB
	release
	end

SaffronCity_Gym_EventScript_16EF55:: @ 816EF55
	lockall
	checkflag FLAG_BADGE06_GET
	goto_if_eq EventScript_16EF69
	msgbox gUnknown_819BDFE
	releaseall
	end

EventScript_16EF69:: @ 816EF69
	msgbox gUnknown_819BE37
	releaseall
	end
