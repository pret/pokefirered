CeruleanCave_B1F_MapScripts:: @ 81624BE
	map_script 5, CeruleanCave_B1F_MapScript1_1624C9
	map_script 3, CeruleanCave_B1F_MapScript2_1624E7
	.byte 0

CeruleanCave_B1F_MapScript1_1624C9:: @ 81624C9
	checkflag 2055
	call_if 1, EventScript_1624D3
	end

EventScript_1624D3:: @ 81624D3
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 7
	goto_if 5, EventScript_1A77A9
	removeobject VAR_LAST_TALKED
	return

CeruleanCave_B1F_MapScript2_1624E7:: @ 81624E7
	checkflag FLAG_0x2BC
	call_if 0, EventScript_1624F1
	end

EventScript_1624F1:: @ 81624F1
	clearflag FLAG_0x081
	return

CeruleanCave_B1F_EventScript_1624F5:: @ 81624F5
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MEWTWO, 2
	message Text_177F9F
	waitmessage
	waitmoncry
	delay 20
	playbgm BGM_FRLG_LEADER_EYE, 0
	waitbuttonpress
	setwildbattle SPECIES_MEWTWO, 70, ITEM_NONE
	setflag 2055
	special sub_807F9D8
	waitstate
	clearflag 2055
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_162558
	compare_var_to_value VAR_RESULT, 4
	goto_if 1, EventScript_162561
	compare_var_to_value VAR_RESULT, 5
	goto_if 1, EventScript_162561
	setflag FLAG_0x2BC
	release
	end

EventScript_162558:: @ 8162558
	setflag FLAG_0x2BC
	goto EventScript_1A922D

EventScript_162560:: @ 8162560
	end

EventScript_162561:: @ 8162561
	setvar VAR_0x8004, 150
	goto EventScript_1A9236

EventScript_16256B:: @ 816256B
	end
