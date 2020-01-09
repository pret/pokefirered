CinnabarIsland_PokemonLab_ExperimentRoom_MapScripts:: @ 816E400
	.byte 0

CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_16E401:: @ 816E401
	lock
	faceplayer
	setvar VAR_0x8008, 8
	call EventScript_1A8CAD
	checkflag FLAG_DID_SEELOR_TRADE
	goto_if TRUE, EventScript_16E473
	msgbox gUnknown_81A597B, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16E45B
	call EventScript_1A8CBD
	compare VAR_0x8004, 6
	goto_if ge, EventScript_16E45B
	call EventScript_1A8CC9
	compare VAR_RESULT, VAR_0x8009
	goto_if ne, EventScript_16E465
	call EventScript_1A8CD9
	msgbox gUnknown_81A59DA
	setflag FLAG_DID_SEELOR_TRADE
	release
	end

EventScript_16E45B:: @ 816E45B
	msgbox gUnknown_81A59B6
	release
	end

EventScript_16E465:: @ 816E465
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_81A59C6
	release
	end

EventScript_16E473:: @ 816E473
	msgbox gUnknown_81A59E7
	release
	end

CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_16E47D:: @ 816E47D
	lock
	faceplayer
	setvar VAR_RESULT, 0
	checkflag FLAG_REVIVED_AMBER
	call_if TRUE, EventScript_16E8A1
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16E897
	compare VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 2
	goto_if eq, EventScript_16E736
	compare VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1
	goto_if eq, EventScript_16E72C
	call EventScript_16E4EC
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16E544
	call EventScript_16E504
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16E586
	call EventScript_16E51C
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16E5C8
	msgbox gUnknown_819A282
	goto EventScript_16E53A
	end

EventScript_16E4EC:: @ 816E4EC
	checkflag FLAG_GOT_HELIX_FOSSIL
	goto_if FALSE, EventScript_16E534
	checkflag FLAG_REVIVED_HELIX
	goto_if TRUE, EventScript_16E534
	setvar VAR_RESULT, 1
	return

EventScript_16E504:: @ 816E504
	checkflag FLAG_GOT_DOME_FOSSIL
	goto_if FALSE, EventScript_16E534
	checkflag FLAG_REVIVED_DOME
	goto_if TRUE, EventScript_16E534
	setvar VAR_RESULT, 1
	return

EventScript_16E51C:: @ 816E51C
	checkflag FLAG_GOT_OLD_AMBER
	goto_if FALSE, EventScript_16E534
	checkflag FLAG_REVIVED_AMBER
	goto_if TRUE, EventScript_16E534
	setvar VAR_RESULT, 1
	return

EventScript_16E534:: @ 816E534
	setvar VAR_RESULT, 0
	return

EventScript_16E53A:: @ 816E53A
	msgbox gUnknown_819A314
	release
	end

EventScript_16E544:: @ 816E544
	message Text_19A282
	waitmessage
	call EventScript_16E51C
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16E5FA
	multichoice 0, 0, MULTICHOICE_HELIX, FALSE
	switch VAR_RESULT
	case 0, EventScript_16E668
	case 1, EventScript_16E53A
	case 127, EventScript_16E53A
	end

EventScript_16E586:: @ 816E586
	message Text_19A282
	waitmessage
	call EventScript_16E51C
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16E631
	multichoice 0, 0, MULTICHOICE_DOME, FALSE
	switch VAR_RESULT
	case 0, EventScript_16E6A6
	case 1, EventScript_16E53A
	case 127, EventScript_16E53A
	end

EventScript_16E5C8:: @ 816E5C8
	message Text_19A282
	waitmessage
	multichoice 0, 0, MULTICHOICE_AMBER, FALSE
	switch VAR_RESULT
	case 0, EventScript_16E6E4
	case 1, EventScript_16E53A
	case 127, EventScript_16E53A
	end

EventScript_16E5FA:: @ 816E5FA
	multichoice 0, 0, MULTICHOICE_HELIX_AMBER, FALSE
	switch VAR_RESULT
	case 0, EventScript_16E668
	case 1, EventScript_16E6E4
	case 2, EventScript_16E53A
	case 127, EventScript_16E53A
	end

EventScript_16E631:: @ 816E631
	multichoice 0, 0, MULTICHOICE_DOME_AMBER, FALSE
	switch VAR_RESULT
	case 0, EventScript_16E6A6
	case 1, EventScript_16E6E4
	case 2, EventScript_16E53A
	case 127, EventScript_16E53A
	end

EventScript_16E668:: @ 816E668
	getspeciesname 0, SPECIES_OMANYTE
	getitemname 1, ITEM_HELIX_FOSSIL
	msgbox gUnknown_819A3D4, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16E722
	msgbox gUnknown_819A45D
	textcolor 0
	removeitem ITEM_HELIX_FOSSIL, 1
	msgbox gUnknown_819A4AB
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, 1
	release
	end

EventScript_16E6A6:: @ 816E6A6
	getspeciesname 0, SPECIES_KABUTO
	getitemname 1, ITEM_DOME_FOSSIL
	msgbox gUnknown_819A3D4, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16E722
	msgbox gUnknown_819A45D
	textcolor 0
	removeitem ITEM_DOME_FOSSIL, 1
	msgbox gUnknown_819A4AB
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, 2
	release
	end

EventScript_16E6E4:: @ 816E6E4
	getspeciesname 0, SPECIES_AERODACTYL
	getitemname 1, ITEM_OLD_AMBER
	msgbox gUnknown_819A3D4, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16E722
	msgbox gUnknown_819A45D
	textcolor 0
	removeitem ITEM_OLD_AMBER, 1
	msgbox gUnknown_819A4AB
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 1
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, 3
	release
	end

EventScript_16E722:: @ 816E722
	msgbox gUnknown_819A4E1
	release
	end

EventScript_16E72C:: @ 816E72C
	msgbox gUnknown_819A4AB
	release
	end

EventScript_16E736:: @ 816E736
	compare VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, 1
	goto_if eq, EventScript_16E758
	compare VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, 2
	goto_if eq, EventScript_16E79D
	compare VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_WHICH_FOSSIL, 3
	goto_if eq, EventScript_16E7E2
	end

EventScript_16E758:: @ 816E758
	setvar VAR_TEMP_1, SPECIES_OMANYTE
	getspeciesname 0, SPECIES_OMANYTE
	msgbox gUnknown_819A34F
	givemon SPECIES_OMANYTE, 5, ITEM_NONE, 0, 0, 0
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A927C
	setflag FLAG_REVIVED_HELIX
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16E827
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16E85B
	end

EventScript_16E79D:: @ 816E79D
	setvar VAR_TEMP_1, SPECIES_KABUTO
	getspeciesname 0, SPECIES_KABUTO
	msgbox gUnknown_819A34F
	givemon SPECIES_KABUTO, 5, ITEM_NONE, 0, 0, 0
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A927C
	setflag FLAG_REVIVED_DOME
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16E827
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16E85B
	end

EventScript_16E7E2:: @ 816E7E2
	setvar VAR_TEMP_1, SPECIES_AERODACTYL
	getspeciesname 0, SPECIES_AERODACTYL
	msgbox gUnknown_819A34F
	givemon SPECIES_AERODACTYL, 5, ITEM_NONE, 0, 0, 0
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A927C
	setflag FLAG_REVIVED_AMBER
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16E827
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16E85B
	end

EventScript_16E827:: @ 816E827
	textcolor 3
	playfanfare MUS_FANFA1
	message Text_19A39E
	waitmessage
	waitfanfare
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 0
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16E895
	call EventScript_1A8C27
	call EventScript_1A74EB
	goto EventScript_16E895
	end

EventScript_16E85B:: @ 816E85B
	textcolor 3
	playfanfare MUS_FANFA1
	message Text_19A39E
	waitmessage
	waitfanfare
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_POKEMON_LAB_EXPERIMENT_ROOM_REVIVE_STATE, 0
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16E88A
	call EventScript_1A8C33
	goto EventScript_16E88A
	end

EventScript_16E88A:: @ 816E88A
	call EventScript_1A8C3C
	goto EventScript_16E895
	end

EventScript_16E895:: @ 816E895
	release
	end

EventScript_16E897:: @ 816E897
	msgbox gUnknown_819A4E1
	release
	end

EventScript_16E8A1:: @ 816E8A1
	checkflag FLAG_GOT_HELIX_FOSSIL
	goto_if TRUE, EventScript_16E8B9
	checkflag FLAG_GOT_DOME_FOSSIL
	goto_if TRUE, EventScript_16E8C8
	goto EventScript_16E534
	end

EventScript_16E8B9:: @ 816E8B9
	checkflag FLAG_REVIVED_HELIX
	goto_if FALSE, EventScript_16E534
	setvar VAR_RESULT, 1
	return

EventScript_16E8C8:: @ 816E8C8
	checkflag FLAG_REVIVED_DOME
	goto_if FALSE, EventScript_16E534
	setvar VAR_RESULT, 1
	return
