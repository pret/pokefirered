CeruleanCity_Gym_MapScripts:: @ 816AAA0
	.byte 0

CeruleanCity_Gym_EventScript_16AAA1:: @ 816AAA1
	famechecker FAMECHECKER_MISTY, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC, TRAINER_LEADER_MISTY, 0, Text_1921EF, Text_19242D, EventScript_16AAD3
	checkflag FLAG_GOT_TM03_FROM_MISTY
	goto_if FALSE, EventScript_16AAF9
	msgbox gUnknown_81922BF
	release
	end

EventScript_16AAD3:: @ 816AAD3
	famechecker FAMECHECKER_MISTY, 1
	setflag FLAG_DEFEATED_MISTY
	setflag FLAG_BADGE02_GET
	setrespawn SPAWN_CERULEAN_CITY
	set_gym_trainers 2
	goto EventScript_16AAF9
	end

EventScript_16AAF9:: @ 816AAF9
	msgbox gUnknown_81922F7
	checkitemspace ITEM_TM03, 1
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16AB3A
	additem ITEM_TM03, 1
	giveitemfanfaremsg gUnknown_81923F1, ITEM_TM03
	setflag FLAG_GOT_TM03_FROM_MISTY
	msgbox gUnknown_81922BF
	release
	end

EventScript_16AB3A:: @ 816AB3A
	msgbox gUnknown_819240E
	release
	end

CeruleanCity_Gym_EventScript_16AB44:: @ 816AB44
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_DIANA, 0, Text_192481, Text_1924D0
	msgbox gUnknown_81924E4, 6
	end

CeruleanCity_Gym_EventScript_16AB5B:: @ 816AB5B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_LUIS, 0, Text_192524, Text_192547
	famechecker FAMECHECKER_MISTY, 2
	msgbox gUnknown_8192556, 6
	end

CeruleanCity_Gym_EventScript_16AB7F:: @ 816AB7F
	lock
	faceplayer
	checkflag FLAG_DEFEATED_MISTY
	goto_if TRUE, EventScript_16AB94
	msgbox gUnknown_81925AC
	release
	end

EventScript_16AB94:: @ 816AB94
	msgbox gUnknown_8192688
	release
	end

CeruleanCity_Gym_EventScript_16AB9E:: @ 816AB9E
	lockall
	checkflag FLAG_BADGE02_GET
	goto_if TRUE, EventScript_16ABB2
	msgbox gUnknown_81926E1
	releaseall
	end

EventScript_16ABB2:: @ 816ABB2
	msgbox gUnknown_8192719
	releaseall
	end
