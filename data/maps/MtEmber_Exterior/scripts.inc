MtEmber_Exterior_MapScripts:: @ 8163946
	map_script 3, MtEmber_Exterior_MapScript1_163951
	map_script 1, MtEmber_Exterior_MapScript2_163969
	.byte 0

MtEmber_Exterior_MapScript1_163951:: @ 8163951
	setworldmapflag FLAG_WORLD_MAP_MT_EMBER_EXTERIOR
	compare_var_to_value VAR_MAP_SCENE_MT_EMBER_EXTERIOR, 2
	call_if eq, EventScript_163960
	end

EventScript_163960:: @ 8163960
	setobjectmovementtype 2, 8
	setobjectmovementtype 3, 8
	return

MtEmber_Exterior_MapScript2_163969:: @ 8163969
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4
	call_if ge, EventScript_163975
	end

EventScript_163975:: @ 8163975
	setmetatile 42, 39, 838, 0
	return

MtEmber_Exterior_EventScript_16397F:: @ 816397F
	lock
	checktrainerflag TRAINER_TEAM_ROCKET_GRUNT_43
	goto_if_eq EventScript_16399E
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4
	goto_if_eq EventScript_1639A8
	msgbox gUnknown_817A82A
	release
	end

EventScript_16399E:: @ 816399E
	msgbox gUnknown_817AA3F
	release
	end

EventScript_1639A8:: @ 81639A8
	applymovement 2, Movement_1A75E1
	waitmovement 0
	playbgm MUS_ROCKET, 0
	msgbox gUnknown_817AA06
	trainerbattle 3, TRAINER_TEAM_ROCKET_GRUNT_43, 0, Text_17AA34
	msgbox gUnknown_817AA3F
	checktrainerflag TRAINER_TEAM_ROCKET_GRUNT_44
	goto_if_eq EventScript_1639DB
	release
	end

EventScript_1639DB:: @ 81639DB
	msgbox gUnknown_817AAD7
	closemessage
	fadescreen 1
	removeobject 2
	removeobject 3
	fadescreen 0
	release
	end

MtEmber_Exterior_EventScript_1639F0:: @ 81639F0
	lock
	faceplayer
	checktrainerflag TRAINER_TEAM_ROCKET_GRUNT_44
	goto_if_eq EventScript_163A1B
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4
	goto_if_eq EventScript_163A25
	msgbox gUnknown_817A88C
	closemessage
	applymovement 3, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_163A1B:: @ 8163A1B
	msgbox gUnknown_817AA99
	release
	end

EventScript_163A25:: @ 8163A25
	playbgm MUS_ROCKET, 0
	msgbox gUnknown_817AA56
	trainerbattle 3, TRAINER_TEAM_ROCKET_GRUNT_44, 0, Text_17AA8A
	msgbox gUnknown_817AA99
	checktrainerflag TRAINER_TEAM_ROCKET_GRUNT_43
	goto_if_eq EventScript_1639DB
	release
	end

MtEmber_Exterior_EventScript_163A4E:: @ 8163A4E
	lockall
	textcolor 0
	msgbox gUnknown_817A8B4
	message Text_17A8EE
	waitmessage
	playse SE_PIN
	applymovement 3, Movement_1A75D9
	waitmovement 0
	waitbuttonpress
	msgbox gUnknown_817A970
	applymovement 2, Movement_1A75ED
	waitmovement 0
	playse SE_PIN
	applymovement 2, Movement_1A75DB
	waitmovement 0
	applymovement 2, Movement_1A75DD
	waitmovement 0
	applymovement 3, Movement_1A75ED
	waitmovement 0
	call EventScript_163960
	msgbox gUnknown_817A9E1
	setvar VAR_MAP_SCENE_MT_EMBER_EXTERIOR, 2
	releaseall
	end

MtEmber_Exterior_EventScript_163AB4:: @ 8163AB4
	trainerbattle 0, TRAINER_PKMN_RANGER_LOGAN, 0, Text_17AB73, Text_17ABAA
	msgbox gUnknown_817ABD8, 6
	end

MtEmber_Exterior_EventScript_163ACB:: @ 8163ACB
	trainerbattle 0, TRAINER_PKMN_RANGER_BETH, 0, Text_17AC55, Text_17AC82
	msgbox gUnknown_817ACA2, 6
	end

MtEmber_Exterior_EventScript_163AE2:: @ 8163AE2
	trainerbattle 0, TRAINER_CRUSH_GIRL_JOCELYN, 0, Text_17AD06, Text_17AD6B
	msgbox gUnknown_817AD89, 6
	end
