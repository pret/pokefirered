PokemonTower_5F_MapScripts:: @ 8163432
	.byte 0

PokemonTower_5F_EventScript_163433:: @ 8163433
	msgbox gUnknown_817A0E3, 2
	end

PokemonTower_5F_EventScript_16343C:: @ 816343C
	lockall
	fadescreen 3
	special sp000_heal_pokemon
	fadescreen 2
	msgbox gUnknown_817A1FA
	setvar VAR_0x4001, 1
	releaseall
	end

PokemonTower_5F_EventScript_163453:: @ 8163453
	lockall
	setvar VAR_0x4001, 0
	releaseall
	end

PokemonTower_5F_EventScript_16345B:: @ 816345B
	trainerbattle 0, TRAINER_CHANNELER_TAMMY, 0, Text_17A11F, Text_17A132
	msgbox gUnknown_817A138, 6
	end

PokemonTower_5F_EventScript_163472:: @ 8163472
	trainerbattle 0, TRAINER_CHANNELER_RUTH, 0, Text_17A150, Text_17A164
	msgbox gUnknown_817A176, 6
	end

PokemonTower_5F_EventScript_163489:: @ 8163489
	trainerbattle 0, TRAINER_CHANNELER_KARINA, 0, Text_17A187, Text_17A190
	msgbox gUnknown_817A194, 6
	end

PokemonTower_5F_EventScript_1634A0:: @ 81634A0
	trainerbattle 0, TRAINER_CHANNELER_JANAE, 0, Text_17A1AA, Text_17A1B7
	msgbox gUnknown_817A1BD, 6
	end
