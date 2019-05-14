PokemonTower_7F_MapScripts:: @ 8163559
	.byte 0

PokemonTower_7F_EventScript_16355A:: @ 816355A
	lock
	faceplayer
	setvar VAR_0x8004, 14
	setvar VAR_0x8005, 2
	special UpdatePickStateFromSpecialVar8005
	setflag FLAG_0x034
	clearflag FLAG_0x035
	setflag FLAG_0x23C
	loadword 0, gUnknown_817A529
	callstd 4
	closemessage
	warp MAP_LAVENDER_TOWN_VOLUNTEER_POKEMON_HOUSE, 255, 4, 7
	waitstate
	release
	end

PokemonTower_7F_EventScript_163586:: @ 8163586
	trainerbattle 2, 369, 0, Text_17A380, Text_17A3A4, EventScript_1635A1
	loadword 0, gUnknown_817A3AF
	callstd 6
	end

EventScript_1635A1:: @ 81635A1
	loadword 0, gUnknown_817A3AF
	callstd 4
	closemessage
	getplayerxy VAR_0x8004, VAR_0x8005
	compare_var_to_value VAR_0x8004, 10
	goto_if 1, EventScript_1635E0
	compare_var_to_value VAR_0x8004, 11
	goto_if 1, EventScript_1635F0
	compare_var_to_value VAR_0x8004, 9
	goto_if 1, EventScript_163600
	applymovement 2, Movement_16362C
	waitmovement 0
	goto EventScript_163616
	end

EventScript_1635E0:: @ 81635E0
	applymovement 2, Movement_16361B
	waitmovement 0
	goto EventScript_163616
	end

EventScript_1635F0:: @ 81635F0
	applymovement 2, Movement_163624
	waitmovement 0
	goto EventScript_163616
	end

EventScript_163600:: @ 8163600
	applymovement 2, Movement_163633
	waitmovement 0
	playse SE_KAIDAN
	delay 25
	goto EventScript_163616
	end

EventScript_163616:: @ 8163616
	removeobject 2
	release
	end

Movement_16361B:: @ 816361B
	step_10
	step_13
	step_10
	step_10
	step_10
	step_13
	step_10
	step_10
	step_end

Movement_163624:: @ 8163624
	step_10
	step_10
	step_10
	step_10
	step_13
	step_10
	step_10
	step_end

Movement_16362C:: @ 816362C
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

Movement_163633:: @ 8163633
	step_13
	step_10
	step_10
	step_10
	step_10
	step_13
	step_10
	step_10
	step_2f
	step_end

PokemonTower_7F_EventScript_16363D:: @ 816363D
	trainerbattle 2, 370, 0, Text_17A3CD, Text_17A466, EventScript_163658
	loadword 0, gUnknown_817A477
	callstd 6
	end

EventScript_163658:: @ 8163658
	setvar VAR_0x8004, 14
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_817A477
	callstd 4
	closemessage
	getplayerxy VAR_0x8004, VAR_0x8005
	compare_var_to_value VAR_0x8004, 12
	goto_if 1, EventScript_163699
	compare_var_to_value VAR_0x8004, 13
	goto_if 1, EventScript_1636A9
	applymovement 3, Movement_1636C6
	waitmovement 0
	goto EventScript_1636B9
	end

EventScript_163699:: @ 8163699
	applymovement 3, Movement_1636BE
	waitmovement 0
	goto EventScript_1636B9
	end

EventScript_1636A9:: @ 81636A9
	applymovement 3, Movement_1636CD
	waitmovement 0
	goto EventScript_1636B9
	end

EventScript_1636B9:: @ 81636B9
	removeobject 3
	release
	end

Movement_1636BE:: @ 81636BE
	step_10
	step_10
	step_10
	step_12
	step_10
	step_10
	step_10
	step_end

Movement_1636C6:: @ 81636C6
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

Movement_1636CD:: @ 81636CD
	step_12
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

PokemonTower_7F_EventScript_1636D6:: @ 81636D6
	trainerbattle 2, 371, 0, Text_17A4CF, Text_17A4EE, EventScript_1636F1
	loadword 0, gUnknown_817A506
	callstd 6
	end

EventScript_1636F1:: @ 81636F1
	loadword 0, gUnknown_817A506
	callstd 4
	closemessage
	getplayerxy VAR_0x8004, VAR_0x8005
	compare_var_to_value VAR_0x8004, 10
	goto_if 1, EventScript_163725
	compare_var_to_value VAR_0x8004, 9
	goto_if 1, EventScript_163735
	applymovement 4, Movement_163754
	waitmovement 0
	goto EventScript_163745
	end

EventScript_163725:: @ 8163725
	applymovement 4, Movement_16374C
	waitmovement 0
	goto EventScript_163745
	end

EventScript_163735:: @ 8163735
	applymovement 4, Movement_16375B
	waitmovement 0
	goto EventScript_163745
	end

EventScript_163745:: @ 8163745
	removeobject 4
	release
	end

EventScript_16374A:: @ 816374A
	release
	end

Movement_16374C:: @ 816374C
	step_10
	step_10
	step_10
	step_10
	step_10
	step_13
	step_10
	step_end

Movement_163754:: @ 8163754
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

Movement_16375B:: @ 816375B
	step_13
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end
