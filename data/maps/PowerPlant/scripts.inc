PowerPlant_MapScripts:: @ 8163764
	map_script 5, PowerPlant_MapScript1_16376F
	map_script 3, PowerPlant_MapScript2_16378D
	.byte 0

PowerPlant_MapScript1_16376F:: @ 816376F
	checkflag FLAG_0x807
	call_if 1, EventScript_163779
	end

EventScript_163779:: @ 8163779
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 7
	goto_if 5, EventScript_1A77A9
	removeobject VAR_LAST_TALKED
	return

PowerPlant_MapScript2_16378D:: @ 816378D
	setworldmapflag FLAG_WORLD_MAP_POWER_PLANT
	checkflag FLAG_0x2BF
	call_if 0, EventScript_1637AC
	checkflag FLAG_0x2D0
	call_if 0, EventScript_1637B0
	checkflag FLAG_0x2D1
	call_if 0, EventScript_1637B4
	end

EventScript_1637AC:: @ 81637AC
	clearflag FLAG_HIDE_ZAPDOS
	return

EventScript_1637B0:: @ 81637B0
	clearflag FLAG_HIDE_POWER_PLANT_VOLTORB_1
	return

EventScript_1637B4:: @ 81637B4
	clearflag FLAG_HIDE_POWER_PLANT_VOLTORB_2
	return

PowerPlant_EventScript_1637B8:: @ 81637B8
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	setwildbattle SPECIES_ZAPDOS, 50, ITEM_NONE
	waitse
	playmoncry SPECIES_ZAPDOS, 2
	message Text_1A6448
	waitmessage
	waitmoncry
	delay 10
	playbgm MUS_EXEYE, 0
	waitbuttonpress
	setflag FLAG_0x807
	special sub_807F9D8
	waitstate
	clearflag FLAG_0x807
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_16381B
	compare_var_to_value VAR_RESULT, 4
	goto_if_eq EventScript_163824
	compare_var_to_value VAR_RESULT, 5
	goto_if_eq EventScript_163824
	setflag FLAG_0x2BF
	release
	end

EventScript_16381B:: @ 816381B
	setflag FLAG_0x2BF
	goto EventScript_1A922D
	end

EventScript_163824:: @ 8163824
	setvar VAR_0x8004, SPECIES_ZAPDOS
	goto EventScript_1A9236
	end

PowerPlant_EventScript_16382F:: @ 816382F
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	setwildbattle SPECIES_ELECTRODE, 34, ITEM_NONE
	waitse
	playmoncry SPECIES_ELECTRODE, 2
	delay 40
	waitmoncry
	setflag FLAG_0x807
	dowildbattle
	clearflag FLAG_0x807
	special sub_8112364
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_163884
	compare_var_to_value VAR_RESULT, 4
	goto_if_eq EventScript_163884
	compare_var_to_value VAR_RESULT, 5
	goto_if_eq EventScript_163884
	setflag FLAG_0x2D0
	release
	end

EventScript_163884:: @ 8163884
	setflag FLAG_0x2D0
	goto EventScript_1A922D
	end

PowerPlant_EventScript_16388D:: @ 816388D
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	setwildbattle SPECIES_ELECTRODE, 34, ITEM_NONE
	waitse
	playmoncry SPECIES_ELECTRODE, 2
	delay 40
	waitmoncry
	setflag FLAG_0x807
	dowildbattle
	clearflag FLAG_0x807
	special sub_8112364
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_1638E2
	compare_var_to_value VAR_RESULT, 4
	goto_if_eq EventScript_1638E2
	compare_var_to_value VAR_RESULT, 5
	goto_if_eq EventScript_1638E2
	setflag FLAG_0x2D1
	release
	end

EventScript_1638E2:: @ 81638E2
	setflag FLAG_0x2D1
	goto EventScript_1A922D
	end
