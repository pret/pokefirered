.equ NUM_SWITCHES_PRESSED, VAR_TEMP_8

SevenIsland_SevaultCanyon_TanobyKey_MapScripts:: @ 8164DCC
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_SevaultCanyon_TanobyKey_OnTransition
	.byte 0

SevenIsland_SevaultCanyon_TanobyKey_OnTransition:: @ 8164DD2
	setworldmapflag FLAG_WORLD_MAP_SEVEN_ISLAND_SEVAULT_CANYON_TANOBY_KEY
	call_if_set FLAG_SYS_UNLOCKED_TANOBY_RUINS, SevenIsland_SevaultCanyon_TanobyKey_EventScript_MoveBouldersToSolvedPos
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	setvar VAR_TEMP_3, 0
	setvar VAR_TEMP_4, 0
	setvar VAR_TEMP_5, 0
	setvar VAR_TEMP_6, 0
	setvar VAR_TEMP_7, 0
	setvar NUM_SWITCHES_PRESSED, 0
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_MoveBouldersToSolvedPos:: @ 8164E07
	setobjectxyperm 1, 7, 2
	setobjectxyperm 2, 4, 4
	setobjectxyperm 3, 10, 4
	setobjectxyperm 4, 5, 6
	setobjectxyperm 5, 9, 6
	setobjectxyperm 6, 5, 8
	setobjectxyperm 7, 9, 8
	return

SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch1:: @ 8164E39
	lockall
	compare VAR_TEMP_1, 100
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
	setvar VAR_TEMP_1, 100
	compare NUM_SWITCHES_PRESSED, 7
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch2:: @ 8164E5C
	lockall
	compare VAR_TEMP_2, 100
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
	setvar VAR_TEMP_2, 100
	compare NUM_SWITCHES_PRESSED, 7
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch3:: @ 8164E7F
	lockall
	compare VAR_TEMP_3, 100
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
	setvar VAR_TEMP_3, 100
	compare NUM_SWITCHES_PRESSED, 7
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch4:: @ 8164EA2
	lockall
	compare VAR_TEMP_4, 100
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
	setvar VAR_TEMP_4, 100
	compare NUM_SWITCHES_PRESSED, 7
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch5:: @ 8164EC5
	lockall
	compare VAR_TEMP_5, 100
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
	setvar VAR_TEMP_5, 100
	compare NUM_SWITCHES_PRESSED, 7
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch6:: @ 8164EE8
	lockall
	compare VAR_TEMP_6, 100
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
	setvar VAR_TEMP_6, 100
	compare NUM_SWITCHES_PRESSED, 7
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch7:: @ 8164F0B
	lockall
	compare VAR_TEMP_7, 100
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
	setvar VAR_TEMP_7, 100
	compare NUM_SWITCHES_PRESSED, 7
	goto_if_eq SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed:: @ 8164F2E
	addvar NUM_SWITCHES_PRESSED, 1
	playse SE_TRACK_MOVE
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	setvar VAR_0x8006, 8
	setvar VAR_0x8007, 3
	special Special_ShakeScreen
	delay 60
	return

SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolvedShakeScreen:: @ 8164F51
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 2
	setvar VAR_0x8006, 10
	setvar VAR_0x8007, 3
	special Special_ShakeScreen
	delay 60
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 3
	setvar VAR_0x8006, 12
	setvar VAR_0x8007, 2
	special Special_ShakeScreen
	delay 60
	playse SE_FU_ZUZUZU
	waitse
	return

SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed:: @ 8164F8A
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved:: @ 8164F8C
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolvedShakeScreen
	msgbox SevenIsland_SevaultCanyon_TanobyKey_Text_MysteriousRumbleFarAway
	setflag FLAG_SYS_UNLOCKED_TANOBY_RUINS
	releaseall
	end
