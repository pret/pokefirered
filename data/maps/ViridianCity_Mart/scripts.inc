ViridianCity_Mart_MapScripts:: @ 816A1D3
	map_script 1, ViridianCity_Mart_MapScript1_16A1DE
	map_script 2, ViridianCity_Mart_MapScript2_16A1FB
	.byte 0

ViridianCity_Mart_MapScript1_16A1DE:: @ 816A1DE
	checkflag FLAG_SYS_POKEDEX_GET
	goto_if FALSE, EventScript_16A1E8
	end

EventScript_16A1E8:: @ 816A1E8
	setmetatile 1, 3, 703, 1
	setmetatile 1, 4, 704, 1
	end

ViridianCity_Mart_MapScript2_16A1FB:: @ 816A1FB
	map_script_2 VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 0, EventScript_16A205
	.2byte 0

EventScript_16A205:: @ 816A205
	lockall
	textcolor 0
	applymovement 1, Movement_1A75ED
	waitmovement 0
	msgbox gUnknown_819021A
	closemessage
	applymovement 1, Movement_16A262
	applymovement 255, Movement_16A25C
	waitmovement 0
	msgbox gUnknown_819023A
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1
	additem ITEM_OAKS_PARCEL, 1
	giveitemfanfaremsg gUnknown_8190289, ITEM_OAKS_PARCEL, 1, MUS_FAN5
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 5
	releaseall
	end

Movement_16A25C:: @ 816A25C
	step_11
	step_11
	step_11
	step_11
	step_2f
	step_end

Movement_16A262:: @ 816A262
	step_1c
	step_1c
	step_1c
	step_1c
	step_30
	step_end

ViridianCity_Mart_EventScript_16A268:: @ 816A268
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1
	goto_if eq, EventScript_16A2A4
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	message Text_1A6211
	waitmessage
	pokemart Items_16A298
	msgbox gUnknown_81A5190
	release
	end

	.align 2
Items_16A298:: @ 816A298
	.2byte ITEM_POKE_BALL
	.2byte ITEM_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_NONE
	release
	end

EventScript_16A2A4:: @ 816A2A4
	msgbox Text_1902BF
	release
	end

ViridianCity_Mart_EventScript_16A2AE:: @ 816A2AE
	msgbox gUnknown_81902F5, 2
	end

ViridianCity_Mart_EventScript_16A2B7:: @ 816A2B7
	msgbox gUnknown_819032C, 2
	end
