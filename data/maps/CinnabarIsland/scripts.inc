CinnabarIsland_MapScripts:: @ 8166ED6
	map_script 3, CinnabarIsland_MapScript1_166EE1
	map_script 2, CinnabarIsland_MapScript2_166F6E
	.byte 0

CinnabarIsland_MapScript1_166EE1:: @ 8166EE1
	setworldmapflag FLAG_WORLD_MAP_CINNABAR_ISLAND
	call EventScript_166F5E
	compare_var_to_value VAR_0x4071, 1
	call_if 1, EventScript_166F24
	compare_var_to_value VAR_0x4071, 3
	call_if 1, EventScript_166F52
	compare_var_to_value VAR_MAP_SCENE_CINNABAR_ISLAND, 1
	call_if 1, EventScript_166F0B
	end

EventScript_166F0B:: @ 8166F0B
	savebgm BGM_FRLG_FOLLOW_ME
	setflag FLAG_0x002
	setobjectxyperm 3, 15, 12
	setobjectmovementtype 3, 9
	setobjectxyperm 4, 30, 12
	return

EventScript_166F24:: @ 8166F24
	getplayerxy VAR_0x8004, VAR_0x8005
	compare_var_to_value VAR_0x8004, 18
	goto_if 4, EventScript_166F4A
	setflag FLAG_0x002
	setobjectxyperm 3, 18, 12
	setobjectmovementtype 3, 7
	setobjectxyperm 4, 30, 12
	return

EventScript_166F4A:: @ 8166F4A
	setobjectxyperm 4, 30, 8
	return

EventScript_166F52:: @ 8166F52
	setobjectxyperm 3, 21, 8
	setobjectmovementtype 3, 7
	return

EventScript_166F5E:: @ 8166F5E
	checkflag FLAG_0x1A8
	goto_if 1, EventScript_166F68
	return

EventScript_166F68:: @ 8166F68
	setvar VAR_0x4001, 1
	return

CinnabarIsland_MapScript2_166F6E:: @ 8166F6E
	map_script_2 VAR_MAP_SCENE_CINNABAR_ISLAND, 1, EventScript_166F88
	map_script_2 VAR_0x4071, 1, EventScript_166FCD
	map_script_2 VAR_0x4071, 3, EventScript_166FA0
	.2byte 0

EventScript_166F88:: @ 8166F88
	lockall
	clearflag FLAG_SPECIAL_FLAG_0x4001
	savebgm MUS_DUMMY
	textcolor 0
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 2
	delay 20
	call EventScript_1670E6
	releaseall
	end

EventScript_166FA0:: @ 8166FA0
	lockall
	textcolor 0
	msgbox gUnknown_8180F09
	closemessage
	applymovement 3, Movement_166FC6
	waitmovement 0
	removeobject 3
	setvar VAR_0x4071, 4
	setflag FLAG_0x075
	clearflag FLAG_0x076
	releaseall
	end

Movement_166FC6:: @ 8166FC6
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

EventScript_166FCD:: @ 8166FCD
	lockall
	textcolor 0
	checkflag FLAG_0x002
	call_if 0, EventScript_167032
	checkflag FLAG_0x002
	call_if 1, EventScript_16703D
	playse SE_PIN
	applymovement 3, Movement_1A75DB
	waitmovement 0
	applymovement 3, Movement_1A75DD
	waitmovement 0
	checkflag FLAG_0x002
	call_if 0, EventScript_167048
	checkflag FLAG_0x002
	call_if 1, EventScript_167053
	msgbox gUnknown_8180C90
	msgbox gUnknown_8180CAA, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_167068
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_167078
	end

EventScript_167032:: @ 8167032
	applymovement 3, Movement_1A75E9
	waitmovement 0
	return

EventScript_16703D:: @ 816703D
	applymovement 3, Movement_1A75E7
	waitmovement 0
	return

EventScript_167048:: @ 8167048
	applymovement 3, Movement_1671A4
	waitmovement 0
	return

EventScript_167053:: @ 8167053
	applymovement 3, Movement_1671A6
	waitmovement 0
	applymovement 255, Movement_1A75EB
	waitmovement 0
	return

EventScript_167068:: @ 8167068
	msgbox gUnknown_8180DDD
	closemessage
	call EventScript_1670E6
	releaseall
	end

EventScript_167078:: @ 8167078
	msgbox gUnknown_8180DF8
	closemessage
	checkflag FLAG_0x002
	call_if 0, EventScript_1670A0
	checkflag FLAG_0x002
	call_if 1, EventScript_1670B3
	removeobject 3
	setvar VAR_0x4071, 2
	clearflag FLAG_0x0A2
	releaseall
	end

EventScript_1670A0:: @ 81670A0
	applymovement 3, Movement_1670AB
	waitmovement 0
	return

Movement_1670AB:: @ 81670AB
	step_13
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

EventScript_1670B3:: @ 81670B3
	applymovement 255, Movement_1670DB
	applymovement 3, Movement_1670DE
	waitmovement 0
	opendoor 14, 11
	waitdooranim
	applymovement 3, Movement_1670E2
	waitmovement 0
	closedoor 14, 11
	waitdooranim
	return

Movement_1670DB:: @ 81670DB
	step_12
	step_30
	step_end

Movement_1670DE:: @ 81670DE
	step_1c
	step_12
	step_2e
	step_end

Movement_1670E2:: @ 81670E2
	step_11
	step_1a
	step_60
	step_end

EventScript_1670E6:: @ 81670E6
	checkflag FLAG_0x002
	call_if 1, EventScript_167142
	addobject 4
	checkflag FLAG_0x002
	call_if 0, EventScript_167154
	checkflag FLAG_0x002
	call_if 1, EventScript_167166
	msgbox gUnknown_8180EAD
	closemessage
	checkflag FLAG_0x002
	call_if 0, EventScript_167171
	checkflag FLAG_0x002
	call_if 1, EventScript_167183
	setvar VAR_0x4071, 2
	removeobject 3
	delay 40
	setflag FLAG_0x06B
	setvar VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 1
	setvar VAR_0x8004, 8
	setvar VAR_0x8006, 1
	goto EventScript_1A90DA
	end

EventScript_167142:: @ 8167142
	applymovement 3, Movement_1671AF
	applymovement 255, Movement_1671AF
	waitmovement 0
	return

EventScript_167154:: @ 8167154
	applymovement 3, Movement_1671AA
	applymovement 4, Movement_167195
	waitmovement 0
	return

EventScript_167166:: @ 8167166
	applymovement 4, Movement_167195
	waitmovement 0
	return

EventScript_167171:: @ 8167171
	applymovement 3, Movement_16719D
	applymovement 255, Movement_1671BA
	waitmovement 0
	return

EventScript_167183:: @ 8167183
	applymovement 3, Movement_1671B6
	applymovement 255, Movement_1671C4
	waitmovement 0
	return

Movement_167195:: @ 8167195
	step_1c
	step_1c
	step_1f
	step_1f
	step_12
	step_left
	step_left
	step_end

Movement_16719D:: @ 816719D
	step_13
	step_10
	step_10
	step_13
	step_1a
	step_60
	step_end

Movement_1671A4:: @ 81671A4
	step_11
	step_end

Movement_1671A6:: @ 81671A6
	step_12
	step_12
	step_12
	step_end

Movement_1671AA:: @ 81671AA
	step_1c
	step_1c
	step_1b
	step_30
	step_end

Movement_1671AF:: @ 81671AF
	step_13
	step_13
	step_13
	step_13
	step_13
	step_13
	step_end

Movement_1671B6:: @ 81671B6
	step_13
	step_1a
	step_60
	step_end

Movement_1671BA:: @ 81671BA
	step_10
	step_13
	step_10
	step_10
	step_30
	step_1a
	step_13
	step_1a
	step_60
	step_end

Movement_1671C4:: @ 81671C4
	step_13
	step_1a
	step_13
	step_1a
	step_60
	step_end

CinnabarIsland_EventScript_1671CA:: @ 81671CA
	lockall
	applymovement 255, Movement_1A75E9
	waitmovement 0
	delay 20
	msgbox gUnknown_8180B20
	closemessage
	applymovement 255, Movement_1671ED
	waitmovement 0
	releaseall
	end

Movement_1671ED:: @ 81671ED
	step_10
	step_end

CinnabarIsland_EventScript_1671EF:: @ 81671EF
	lock
	faceplayer
	setvar VAR_0x8004, 8
	setvar VAR_0x8005, 3
	special SetFlavorTextFlagFromSpecialVars
	msgbox gUnknown_8180B34
	release
	end

CinnabarIsland_EventScript_167208:: @ 8167208
	msgbox gUnknown_8180BA0, 2
	end

CinnabarIsland_EventScript_167211:: @ 8167211
	msgbox gUnknown_8180C0D, 3
	end

CinnabarIsland_EventScript_16721A:: @ 816721A
	msgbox gUnknown_8180C3E, 3
	end

CinnabarIsland_EventScript_167223:: @ 8167223
	lockall
	setvar VAR_0x8004, 8
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	msgbox gUnknown_8180C4A
	releaseall
	end
