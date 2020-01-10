PokemonTower_5F_MapScripts:: @ 8163432
	.byte 0

PokemonTower_5F_EventScript_163433:: @ 8163433
	msgbox gUnknown_817A0E3, MSGBOX_NPC
	end

PokemonTower_5F_EventScript_16343C:: @ 816343C
	lockall
	fadescreen 3
	special sp000_heal_pokemon
	fadescreen 2
	msgbox gUnknown_817A1FA
	setvar VAR_TEMP_1, 1
	releaseall
	end

PokemonTower_5F_EventScript_163453:: @ 8163453
	lockall
	setvar VAR_TEMP_1, 0
	releaseall
	end

PokemonTower_5F_EventScript_16345B:: @ 816345B
	trainerbattle_single TRAINER_CHANNELER_TAMMY, Text_17A11F, Text_17A132
	msgbox gUnknown_817A138, MSGBOX_AUTOCLOSE
	end

PokemonTower_5F_EventScript_163472:: @ 8163472
	trainerbattle_single TRAINER_CHANNELER_RUTH, Text_17A150, Text_17A164
	msgbox gUnknown_817A176, MSGBOX_AUTOCLOSE
	end

PokemonTower_5F_EventScript_163489:: @ 8163489
	trainerbattle_single TRAINER_CHANNELER_KARINA, Text_17A187, Text_17A190
	msgbox gUnknown_817A194, MSGBOX_AUTOCLOSE
	end

PokemonTower_5F_EventScript_1634A0:: @ 81634A0
	trainerbattle_single TRAINER_CHANNELER_JANAE, Text_17A1AA, Text_17A1B7
	msgbox gUnknown_817A1BD, MSGBOX_AUTOCLOSE
	end
