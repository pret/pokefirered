# 1 "data/maps/SilphCo_Elevator/scripts.pory"

# 2 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_MapScripts::
# 3 "data/maps/SilphCo_Elevator/scripts.pory"
	.byte 0
# 4 "data/maps/SilphCo_Elevator/scripts.pory"

# 5 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_FloorSelect::
# 6 "data/maps/SilphCo_Elevator/scripts.pory"
	lockall
# 7 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8004, 1
# 8 "data/maps/SilphCo_Elevator/scripts.pory"
	call_if_unset FLAG_TEMP_2, EventScript_GetElevatorFloor
# 9 "data/maps/SilphCo_Elevator/scripts.pory"
	copyvar VAR_0x8005, VAR_ELEVATOR_FLOOR
# 10 "data/maps/SilphCo_Elevator/scripts.pory"
	special DrawElevatorCurrentFloorWindow
# 11 "data/maps/SilphCo_Elevator/scripts.pory"
	message Text_WantWhichFloor
# 12 "data/maps/SilphCo_Elevator/scripts.pory"
	waitmessage
# 13 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8004, LISTMENU_SILPHCO_FLOORS
# 14 "data/maps/SilphCo_Elevator/scripts.pory"
	specialvar VAR_RESULT, InitElevatorFloorSelectMenuPos
# 15 "data/maps/SilphCo_Elevator/scripts.pory"
	special ListMenu
# 16 "data/maps/SilphCo_Elevator/scripts.pory"
	waitstate
# 17 "data/maps/SilphCo_Elevator/scripts.pory"
	switch VAR_RESULT
# 18 "data/maps/SilphCo_Elevator/scripts.pory"
	case 0, SilphCo_Elevator_EventScript_To11F
# 19 "data/maps/SilphCo_Elevator/scripts.pory"
	case 1, SilphCo_Elevator_EventScript_To10F
# 20 "data/maps/SilphCo_Elevator/scripts.pory"
	case 2, SilphCo_Elevator_EventScript_To9F
# 21 "data/maps/SilphCo_Elevator/scripts.pory"
	case 3, SilphCo_Elevator_EventScript_To8F
# 22 "data/maps/SilphCo_Elevator/scripts.pory"
	case 4, SilphCo_Elevator_EventScript_To7F
# 23 "data/maps/SilphCo_Elevator/scripts.pory"
	case 5, SilphCo_Elevator_EventScript_To6F
# 24 "data/maps/SilphCo_Elevator/scripts.pory"
	case 6, SilphCo_Elevator_EventScript_To5F
# 25 "data/maps/SilphCo_Elevator/scripts.pory"
	case 7, SilphCo_Elevator_EventScript_To4F
# 26 "data/maps/SilphCo_Elevator/scripts.pory"
	case 8, SilphCo_Elevator_EventScript_To3F
# 27 "data/maps/SilphCo_Elevator/scripts.pory"
	case 9, SilphCo_Elevator_EventScript_To2F
# 28 "data/maps/SilphCo_Elevator/scripts.pory"
	case 10, SilphCo_Elevator_EventScript_To1F
# 29 "data/maps/SilphCo_Elevator/scripts.pory"
	case 11, SilphCo_Elevator_EventScript_ExitFloorSelect
# 30 "data/maps/SilphCo_Elevator/scripts.pory"
	case 127, SilphCo_Elevator_EventScript_ExitFloorSelect
# 31 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 32 "data/maps/SilphCo_Elevator/scripts.pory"

# 33 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To1F::
# 34 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 4
# 35 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_1F, 255, 22, 3
# 36 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 4, SilphCo_Elevator_EventScript_ExitFloorSelect
# 37 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 38 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 4
# 39 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 40 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 41 "data/maps/SilphCo_Elevator/scripts.pory"

# 42 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To2F::
# 43 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 5
# 44 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_2F, 255, 22, 3
# 45 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 5, SilphCo_Elevator_EventScript_ExitFloorSelect
# 46 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 47 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 5
# 48 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 49 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 50 "data/maps/SilphCo_Elevator/scripts.pory"

# 51 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To3F::
# 52 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 6
# 53 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_3F, 255, 22, 3
# 54 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 6, SilphCo_Elevator_EventScript_ExitFloorSelect
# 55 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 56 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 6
# 57 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 58 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 59 "data/maps/SilphCo_Elevator/scripts.pory"

# 60 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To4F::
# 61 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 7
# 62 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_4F, 255, 22, 3
# 63 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 7, SilphCo_Elevator_EventScript_ExitFloorSelect
# 64 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 65 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 7
# 66 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 67 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 68 "data/maps/SilphCo_Elevator/scripts.pory"

# 69 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To5F::
# 70 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 8
# 71 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_5F, 255, 22, 3
# 72 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 8, SilphCo_Elevator_EventScript_ExitFloorSelect
# 73 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 74 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 8
# 75 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 76 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 77 "data/maps/SilphCo_Elevator/scripts.pory"

# 78 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To6F::
# 79 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 9
# 80 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_6F, 255, 20, 3
# 81 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 9, SilphCo_Elevator_EventScript_ExitFloorSelect
# 82 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 83 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 9
# 84 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 85 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 86 "data/maps/SilphCo_Elevator/scripts.pory"

# 87 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To7F::
# 88 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 10
# 89 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_7F, 255, 23, 3
# 90 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 10, SilphCo_Elevator_EventScript_ExitFloorSelect
# 91 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 92 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 10
# 93 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 94 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 95 "data/maps/SilphCo_Elevator/scripts.pory"

# 96 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To8F::
# 97 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 11
# 98 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_8F, 255, 22, 3
# 99 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 11, SilphCo_Elevator_EventScript_ExitFloorSelect
# 100 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 101 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 11
# 102 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 103 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 104 "data/maps/SilphCo_Elevator/scripts.pory"

# 105 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To9F::
# 106 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 12
# 107 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_9F, 255, 24, 3
# 108 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 12, SilphCo_Elevator_EventScript_ExitFloorSelect
# 109 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 110 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 12
# 111 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 112 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 113 "data/maps/SilphCo_Elevator/scripts.pory"

# 114 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To10F::
# 115 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 13
# 116 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_10F, 255, 13, 3
# 117 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 13, SilphCo_Elevator_EventScript_ExitFloorSelect
# 118 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 119 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 13
# 120 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 121 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 122 "data/maps/SilphCo_Elevator/scripts.pory"

# 123 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_To11F::
# 124 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_0x8006, 14
# 125 "data/maps/SilphCo_Elevator/scripts.pory"
	setdynamicwarp MAP_SILPH_CO_11F, 255, 13, 3
# 126 "data/maps/SilphCo_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 14, SilphCo_Elevator_EventScript_ExitFloorSelect
# 127 "data/maps/SilphCo_Elevator/scripts.pory"
	call SilphCo_Elevator_EventScript_MoveElevator
# 128 "data/maps/SilphCo_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 14
# 129 "data/maps/SilphCo_Elevator/scripts.pory"
	goto SilphCo_Elevator_EventScript_ExitFloorSelect
# 130 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 131 "data/maps/SilphCo_Elevator/scripts.pory"

# 132 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_ExitFloorSelect::
# 133 "data/maps/SilphCo_Elevator/scripts.pory"
	special CloseElevatorCurrentFloorWindow
# 134 "data/maps/SilphCo_Elevator/scripts.pory"
	releaseall
# 135 "data/maps/SilphCo_Elevator/scripts.pory"
	end
# 136 "data/maps/SilphCo_Elevator/scripts.pory"

# 137 "data/maps/SilphCo_Elevator/scripts.pory"
SilphCo_Elevator_EventScript_MoveElevator::
# 138 "data/maps/SilphCo_Elevator/scripts.pory"
	special CloseElevatorCurrentFloorWindow
# 139 "data/maps/SilphCo_Elevator/scripts.pory"
	closemessage
# 140 "data/maps/SilphCo_Elevator/scripts.pory"
	waitse
# 141 "data/maps/SilphCo_Elevator/scripts.pory"
	special AnimateElevator
# 142 "data/maps/SilphCo_Elevator/scripts.pory"
	waitstate
# 143 "data/maps/SilphCo_Elevator/scripts.pory"
	setflag FLAG_TEMP_2
# 144 "data/maps/SilphCo_Elevator/scripts.pory"
	return
