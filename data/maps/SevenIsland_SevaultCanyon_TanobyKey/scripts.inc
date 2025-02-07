# 1 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 2 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
.set LOCALID_BOULDER1, 1
# 3 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
.set LOCALID_BOULDER2, 2
# 4 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
.set LOCALID_BOULDER3, 3
# 5 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
.set LOCALID_BOULDER4, 4
# 6 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
.set LOCALID_BOULDER5, 5
# 7 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
.set LOCALID_BOULDER6, 6
# 8 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
.set LOCALID_BOULDER7, 7
# 9 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 10 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
.equ NUM_SWITCHES_PRESSED, VAR_TEMP_8
# 11 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 12 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_MapScripts::
# 13 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_SevaultCanyon_TanobyKey_OnTransition
# 14 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	.byte 0
# 15 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 16 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_OnTransition::
# 17 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_SEVEN_ISLAND_SEVAULT_CANYON_TANOBY_KEY
# 18 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	call_if_set FLAG_SYS_UNLOCKED_TANOBY_RUINS, SevenIsland_SevaultCanyon_TanobyKey_EventScript_MoveBouldersToSolvedPos
# 19 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_1, 0
# 20 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_2, 0
# 21 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_3, 0
# 22 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_4, 0
# 23 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_5, 0
# 24 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_6, 0
# 25 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_7, 0
# 26 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar NUM_SWITCHES_PRESSED, 0
# 27 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
# 28 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 29 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_MoveBouldersToSolvedPos::
# 30 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setobjectxyperm LOCALID_BOULDER1, 7, 2
# 31 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setobjectxyperm LOCALID_BOULDER2, 4, 4
# 32 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setobjectxyperm LOCALID_BOULDER3, 10, 4
# 33 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setobjectxyperm LOCALID_BOULDER4, 5, 6
# 34 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setobjectxyperm LOCALID_BOULDER5, 9, 6
# 35 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setobjectxyperm LOCALID_BOULDER6, 5, 8
# 36 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setobjectxyperm LOCALID_BOULDER7, 9, 8
# 37 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	return
# 38 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 39 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch1::
# 40 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	lockall
# 41 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq VAR_TEMP_1, 100, SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
# 42 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
# 43 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_1, 100
# 44 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq NUM_SWITCHES_PRESSED, 7, SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
# 45 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	releaseall
# 46 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
# 47 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 48 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch2::
# 49 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	lockall
# 50 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq VAR_TEMP_2, 100, SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
# 51 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
# 52 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_2, 100
# 53 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq NUM_SWITCHES_PRESSED, 7, SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
# 54 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	releaseall
# 55 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
# 56 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 57 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch3::
# 58 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	lockall
# 59 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq VAR_TEMP_3, 100, SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
# 60 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
# 61 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_3, 100
# 62 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq NUM_SWITCHES_PRESSED, 7, SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
# 63 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	releaseall
# 64 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
# 65 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 66 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch4::
# 67 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	lockall
# 68 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq VAR_TEMP_4, 100, SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
# 69 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
# 70 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_4, 100
# 71 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq NUM_SWITCHES_PRESSED, 7, SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
# 72 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	releaseall
# 73 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
# 74 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 75 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch5::
# 76 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	lockall
# 77 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq VAR_TEMP_5, 100, SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
# 78 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
# 79 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_5, 100
# 80 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq NUM_SWITCHES_PRESSED, 7, SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
# 81 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	releaseall
# 82 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
# 83 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 84 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch6::
# 85 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	lockall
# 86 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq VAR_TEMP_6, 100, SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
# 87 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
# 88 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_6, 100
# 89 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq NUM_SWITCHES_PRESSED, 7, SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
# 90 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	releaseall
# 91 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
# 92 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 93 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_Switch7::
# 94 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	lockall
# 95 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq VAR_TEMP_7, 100, SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed
# 96 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed
# 97 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_TEMP_7, 100
# 98 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	goto_if_eq NUM_SWITCHES_PRESSED, 7, SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved
# 99 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	releaseall
# 100 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
# 101 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 102 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchPressed::
# 103 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	addvar NUM_SWITCHES_PRESSED, 1
# 104 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	playse SE_TRUCK_MOVE
# 105 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8004, 1
# 106 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8005, 1
# 107 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8006, 8
# 108 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8007, 3
# 109 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	special ShakeScreen
# 110 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	delay 60
# 111 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	return
# 112 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 113 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolvedShakeScreen::
# 114 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8004, 2
# 115 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8005, 2
# 116 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8006, 10
# 117 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8007, 3
# 118 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	special ShakeScreen
# 119 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	delay 60
# 120 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8004, 3
# 121 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8005, 3
# 122 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8006, 12
# 123 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setvar VAR_0x8007, 2
# 124 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	special ShakeScreen
# 125 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	delay 60
# 126 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	playse SE_LAVARIDGE_FALL_WARP
# 127 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	waitse
# 128 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	return
# 129 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 130 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_SwitchAlreadyPressed::
# 131 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	releaseall
# 132 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
# 133 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"

# 134 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolved::
# 135 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	call SevenIsland_SevaultCanyon_TanobyKey_EventScript_PuzzleSolvedShakeScreen
# 136 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	msgbox SevenIsland_SevaultCanyon_TanobyKey_Text_MysteriousRumbleFarAway
# 137 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	setflag FLAG_SYS_UNLOCKED_TANOBY_RUINS
# 138 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	releaseall
# 139 "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.pory"
	end
