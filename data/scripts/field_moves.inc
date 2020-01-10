EventScript_InteractWithCutTreeObject:: @ 81BDF13
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	goto_if_unset FLAG_BADGE02_GET, EventScript_1BDF87
	checkpartymove MOVE_CUT
	compare VAR_RESULT, PARTY_SIZE
	goto_if_eq EventScript_1BDF87
	setfieldeffectarg 0, VAR_RESULT
	getpartymonname 0, VAR_RESULT
	getmovename 1, MOVE_CUT
	msgbox gUnknown_81BDF94, 5
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BDF91
	msgbox gUnknown_81BDFD7
	closemessage
	dofieldeffect FLDEFF_USE_CUT_ON_TREE
	waitstate
	goto EventScript_1BDF76
	end

gUnknown_81BDF6B:: @ 81BDF6B
	lockall
	dofieldeffect FLDEFF_USE_CUT_ON_TREE
	waitstate
	goto EventScript_1BDF76
	end

EventScript_1BDF76:: @ 81BDF76
	applymovement VAR_LAST_TALKED, Movement_1BDF85
	waitmovement 0
	removeobject VAR_LAST_TALKED
	releaseall
	end

Movement_1BDF85:: @ 81BDF85
	cut_tree
	step_end

EventScript_1BDF87:: @ 81BDF87
	msgbox gUnknown_81BDFE3, 3
	releaseall
	end

EventScript_1BDF91:: @ 81BDF91
	closemessage
	releaseall
	end

gUnknown_81BDF94:: @ 81BDF94
	.string "This tree looks like it can be CUT\n"
	.string "down!\p"
	.string "Would you like to CUT it?$"

gUnknown_81BDFD7:: @ 81BDFD7
	.string "{STR_VAR_1} used {STR_VAR_2}!$"

gUnknown_81BDFE3:: @ 81BDFE3
	.string "This tree looks like it can be CUT\n"
	.string "down!$"

EventScript_InteractWithRockSmashRockObject:: @ 81BE00C
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	goto_if_unset FLAG_BADGE06_GET, EventScript_1BE091
	checkpartymove MOVE_ROCK_SMASH
	compare VAR_RESULT, PARTY_SIZE
	goto_if_eq EventScript_1BE091
	setfieldeffectarg 0, VAR_RESULT
	getpartymonname 0, VAR_RESULT
	getmovename 1, MOVE_ROCK_SMASH
	msgbox Text_1BE09D, 5
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BE09A
	msgbox gUnknown_81BDFD7
	closemessage
	dofieldeffect FLDEFF_USE_ROCK_SMASH
	waitstate
	goto EventScript_1BE06F
	end

EventScript_FldEffRockSmash:: @ 81BE064
	lockall
	dofieldeffect FLDEFF_USE_ROCK_SMASH
	waitstate
	goto EventScript_1BE06F
	end

EventScript_1BE06F:: @ 81BE06F
	applymovement VAR_LAST_TALKED, Movement_1BE08F
	waitmovement 0
	removeobject VAR_LAST_TALKED
	special ScrSpecial_RockSmashWildEncounter
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BE08D
	waitstate
	releaseall
	end

EventScript_1BE08D:: @ 81BE08D
	releaseall
	end

Movement_1BE08F:: @ 81BE08F
	rock_smash_break
	step_end

EventScript_1BE091:: @ 81BE091
	msgbox gUnknown_81BE0E2, 3
	end

EventScript_1BE09A:: @ 81BE09A
	closemessage
	releaseall
	end

Text_1BE09D:: @ 81BE09D
	.string "This rock appears to be breakable.\n"
	.string "Would you like to use ROCK SMASH?$"

gUnknown_81BE0E2:: @ 81BE0E2
	.string "It's a rugged rock, but a POKéMON\n"
	.string "may be able to smash it.$"

EventScript_InteractWithStrengthBoulderObject:: @ 81BE11D
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	goto_if_unset FLAG_BADGE04_GET, EventScript_1BE185
	goto_if_set FLAG_SYS_STRENGTH_ACTIVE, EventScript_1BE18E
	checkpartymove MOVE_STRENGTH
	compare VAR_RESULT, PARTY_SIZE
	goto_if_eq EventScript_1BE185
	setfieldeffectarg 0, VAR_RESULT
	msgbox gUnknown_81BE19A, 5
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BE197
	closemessage
	dofieldeffect FLDEFF_USE_STRENGTH
	waitstate
	goto EventScript_1BE179
	end

EventScript_FldEffStrength:: @ 81BE16E
	lockall
	dofieldeffect FLDEFF_USE_STRENGTH
	waitstate
	goto EventScript_1BE179
	end

EventScript_1BE179:: @ 81BE179
	setflag FLAG_SYS_STRENGTH_ACTIVE
	msgbox gUnknown_81BE1FA, 3
	end

EventScript_1BE185:: @ 81BE185
	msgbox gUnknown_81BE244, 3
	end

EventScript_1BE18E:: @ 81BE18E
	msgbox gUnknown_81BE284, 3
	end

EventScript_1BE197:: @ 81BE197
	closemessage
	releaseall
	end

gUnknown_81BE19A:: @ 81BE19A
	.string "It's a big boulder, but a POKéMON\n"
	.string "may be able to push it aside.\p"
	.string "Would you like to use STRENGTH?$"

gUnknown_81BE1FA:: @ 81BE1FA
	.string "{STR_VAR_1} used STRENGTH!\p"
	.string "{STR_VAR_1}'s STRENGTH made it\n"
	.string "possible to move boulders around!$"

gUnknown_81BE244:: @ 81BE244
	.string "It's a big boulder, but a POKéMON\n"
	.string "may be able to push it aside.$"

gUnknown_81BE284:: @ 81BE284
	.string "STRENGTH made it possible to move\n"
	.string "boulders around.$"

gUnknown_81BE2B7:: @ 81BE2B7
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	checkpartymove MOVE_WATERFALL
	compare VAR_RESULT, PARTY_SIZE
	goto_if_eq EventScript_1BE300
	getpartymonname 0, VAR_RESULT
	setfieldeffectarg 0, VAR_RESULT
	msgbox gUnknown_81BE33F, 5
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BE308
	msgbox gUnknown_81BE378
	dofieldeffect FLDEFF_USE_WATERFALL
	goto EventScript_1BE308

EventScript_81BE2FF:: @ 81BE2FF
	lockall
EventScript_1BE300:
	msgbox gUnknown_81BE30A
EventScript_1BE308:
	releaseall
	end

gUnknown_81BE30A:: @ 81BE30A
	.string "A wall of water is crashing down\n"
	.string "with a mighty roar.$"

gUnknown_81BE33F:: @ 81BE33F
	.string "It's a large waterfall.\n"
	.string "Would you like to use WATERFALL?$"

gUnknown_81BE378:: @ 81BE378
	.string "{STR_VAR_1} used WATERFALL.$"

@ Unused leftover from R/S
EventScript_1BE38B:: @ 81BE38B
	lockall
	checkpartymove MOVE_DIVE
	compare VAR_RESULT, PARTY_SIZE
	goto_if_eq EventScript_1BE3CA
	getpartymonname 0, VAR_RESULT
	setfieldeffectarg 0, VAR_RESULT
	setfieldeffectarg 1, 1
	msgbox gUnknown_81BE469, 5
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BE3D2
	msgbox gUnknown_81BE49B
	dofieldeffect FLDEFF_USE_DIVE
	goto EventScript_1BE3D2

EventScript_1BE3C9:: @ 81BE3C9
	lockall
EventScript_1BE3CA:
	msgbox Text_1BE42B
EventScript_1BE3D2:
	releaseall
	end

EventScript_1BE3D4:: @ 81BE3D4
	lockall
	checkpartymove MOVE_DIVE
	compare VAR_RESULT, PARTY_SIZE
	goto_if_eq EventScript_1BE412
	getpartymonname 0, VAR_RESULT
	setfieldeffectarg 0, VAR_RESULT
	setfieldeffectarg 1, 1
	msgbox gUnknown_81BE4EF, 5
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BE429
	msgbox gUnknown_81BE49B
	dofieldeffect FLDEFF_USE_DIVE
	goto EventScript_1BE429

EventScript_1BE412:: @ 81BE412
	lockall
	msgbox gUnknown_81BE4A9
	goto EventScript_1BE429

EventScript_1BE420:: @ 81BE420
	lockall
	msgbox gUnknown_81BE52F
EventScript_1BE429:
	releaseall
	end

Text_1BE42B:: @ 81BE42B
	.string "The sea is deep here. A POKéMON\n"
	.string "may be able to go underwater.$"

gUnknown_81BE469:: @ 81BE469
	.string "The sea is deep here.\n"
	.string "Would you like to use DIVE?$"

gUnknown_81BE49B:: @ 81BE49B
	.string "{STR_VAR_1} used DIVE.$"

gUnknown_81BE4A9:: @ 81BE4A9
	.string "Light is filtering down from above.\n"
	.string "A POKéMON may be able to surface.$"

gUnknown_81BE4EF:: @ 81BE4EF
	.string "Light is filtering down from above.\n"
	.string "Would you like to use DIVE?$"

gUnknown_81BE52F:: @ 81BE52F
	.string "There is an obstacle above.\n"
	.string "DIVE can't be used here.$"

EventScript_FailSweetScent:: @ 81BE564
	msgbox Text_1BE56D, 3
	end

Text_1BE56D:: @ 81BE56D
	.string "Looks like there's nothing here…$"
