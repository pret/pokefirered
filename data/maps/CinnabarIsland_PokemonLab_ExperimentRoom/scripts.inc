CinnabarIsland_PokemonLab_ExperimentRoom_MapScripts:: @ 816E400
	.byte 0

CinnabarIsland_PokemonLab_ExperimentRoom_EventScript_16E401:: @ 816E401
	lock
	faceplayer
	setvar VAR_0x8008, 8
	call EventScript_1A8CAD
	checkflag FLAG_0x276
	goto_if 1, EventScript_16E473
	msgbox gUnknown_81A597B, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16E45B
	call EventScript_1A8CBD
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_16E45B
	call EventScript_1A8CC9
	compare_var_to_var VAR_RESULT, VAR_0x8009
	goto_if 5, EventScript_16E465
	call EventScript_1A8CD9
	msgbox gUnknown_81A59DA
	setflag FLAG_0x276
	release
	end

EventScript_16E45B:: @ 816E45B
	msgbox gUnknown_81A59B6
	release
	end

EventScript_16E465:: @ 816E465
	getspeciesname 0, 32777
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
	checkflag FLAG_0x2EE
	call_if 1, EventScript_16E8A1
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16E897
	compare_var_to_value VAR_0x406A, 2
	goto_if 1, EventScript_16E736
	compare_var_to_value VAR_0x406A, 1
	goto_if 1, EventScript_16E72C
	call EventScript_16E4EC
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16E544
	call EventScript_16E504
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16E586
	call EventScript_16E51C
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16E5C8
	msgbox gUnknown_819A282
	goto EventScript_16E53A
	end

EventScript_16E4EC:: @ 816E4EC
	checkflag FLAG_0x273
	goto_if 0, EventScript_16E534
	checkflag FLAG_0x2ED
	goto_if 1, EventScript_16E534
	setvar VAR_RESULT, 1
	return

EventScript_16E504:: @ 816E504
	checkflag FLAG_0x272
	goto_if 0, EventScript_16E534
	checkflag FLAG_0x2EC
	goto_if 1, EventScript_16E534
	setvar VAR_RESULT, 1
	return

EventScript_16E51C:: @ 816E51C
	checkflag FLAG_0x25E
	goto_if 0, EventScript_16E534
	checkflag FLAG_0x2EE
	goto_if 1, EventScript_16E534
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
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16E5FA
	multichoice 0, 0, 21, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_16E668
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16E53A
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_16E53A
	end

EventScript_16E586:: @ 816E586
	message Text_19A282
	waitmessage
	call EventScript_16E51C
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16E631
	multichoice 0, 0, 22, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_16E6A6
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16E53A
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_16E53A
	end

EventScript_16E5C8:: @ 816E5C8
	message Text_19A282
	waitmessage
	multichoice 0, 0, 23, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_16E6E4
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16E53A
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_16E53A
	end

EventScript_16E5FA:: @ 816E5FA
	multichoice 0, 0, 24, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_16E668
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16E6E4
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_16E53A
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_16E53A
	end

EventScript_16E631:: @ 816E631
	multichoice 0, 0, 25, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_16E6A6
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16E6E4
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_16E53A
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_16E53A
	end

EventScript_16E668:: @ 816E668
	getspeciesname 0, SPECIES_OMANYTE
	getitemname 1, ITEM_HELIX_FOSSIL
	msgbox gUnknown_819A3D4, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16E722
	msgbox gUnknown_819A45D
	textcolor 0
	removeitem ITEM_HELIX_FOSSIL, 1
	msgbox gUnknown_819A4AB
	setvar VAR_0x406A, 1
	setvar VAR_0x4069, 1
	release
	end

EventScript_16E6A6:: @ 816E6A6
	getspeciesname 0, SPECIES_KABUTO
	getitemname 1, ITEM_DOME_FOSSIL
	msgbox gUnknown_819A3D4, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16E722
	msgbox gUnknown_819A45D
	textcolor 0
	removeitem ITEM_DOME_FOSSIL, 1
	msgbox gUnknown_819A4AB
	setvar VAR_0x406A, 1
	setvar VAR_0x4069, 2
	release
	end

EventScript_16E6E4:: @ 816E6E4
	getspeciesname 0, SPECIES_AERODACTYL
	getitemname 1, ITEM_OLD_AMBER
	msgbox gUnknown_819A3D4, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16E722
	msgbox gUnknown_819A45D
	textcolor 0
	removeitem ITEM_OLD_AMBER, 1
	msgbox gUnknown_819A4AB
	setvar VAR_0x406A, 1
	setvar VAR_0x4069, 3
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
	compare_var_to_value VAR_0x4069, 1
	goto_if 1, EventScript_16E758
	compare_var_to_value VAR_0x4069, 2
	goto_if 1, EventScript_16E79D
	compare_var_to_value VAR_0x4069, 3
	goto_if 1, EventScript_16E7E2
	end

EventScript_16E758:: @ 816E758
	setvar VAR_0x4001, 138
	getspeciesname 0, SPECIES_OMANYTE
	msgbox gUnknown_819A34F
	givemon SPECIES_OMANYTE, 5, ITEM_NONE, 0, 0, 0
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A927C
	setflag FLAG_0x2ED
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16E827
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16E85B
	end

EventScript_16E79D:: @ 816E79D
	setvar VAR_0x4001, 140
	getspeciesname 0, SPECIES_KABUTO
	msgbox gUnknown_819A34F
	givemon SPECIES_KABUTO, 5, ITEM_NONE, 0, 0, 0
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A927C
	setflag FLAG_0x2EC
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16E827
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16E85B
	end

EventScript_16E7E2:: @ 816E7E2
	setvar VAR_0x4001, 142
	getspeciesname 0, SPECIES_AERODACTYL
	msgbox gUnknown_819A34F
	givemon SPECIES_AERODACTYL, 5, ITEM_NONE, 0, 0, 0
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A927C
	setflag FLAG_0x2EE
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16E827
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16E85B
	end

EventScript_16E827:: @ 816E827
	textcolor 3
	playfanfare MUS_FANFA1
	message Text_19A39E
	waitmessage
	waitfanfare
	setvar VAR_0x406A, 0
	msgbox gUnknown_81A56A7, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16E895
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
	setvar VAR_0x406A, 0
	msgbox gUnknown_81A56A7, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16E88A
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
	checkflag FLAG_0x273
	goto_if 1, EventScript_16E8B9
	checkflag FLAG_0x272
	goto_if 1, EventScript_16E8C8
	goto EventScript_16E534
	end

EventScript_16E8B9:: @ 816E8B9
	checkflag FLAG_0x2ED
	goto_if 0, EventScript_16E534
	setvar VAR_RESULT, 1
	return

EventScript_16E8C8:: @ 816E8C8
	checkflag FLAG_0x2EC
	goto_if 0, EventScript_16E534
	setvar VAR_RESULT, 1
	return
