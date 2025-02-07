# 1 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 2 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_MapScripts::
# 3 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	.byte 0
# 4 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 5 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelect::
# 6 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	lockall
# 7 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_0x8004, 3
# 8 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	call_if_unset FLAG_TEMP_2, EventScript_GetElevatorFloor
# 9 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	copyvar VAR_0x8005, VAR_ELEVATOR_FLOOR
# 10 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	special DrawElevatorCurrentFloorWindow
# 11 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	message Text_WantWhichFloor
# 12 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	waitmessage
# 13 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_0x8004, 3
# 14 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	specialvar VAR_RESULT, InitElevatorFloorSelectMenuPos
# 15 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	switch VAR_RESULT
# 16 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom5F
# 17 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom4F
# 18 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 2, CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom3F
# 19 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 3, CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom2F
# 20 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 4, CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom1F
# 21 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 22 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 23 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom5F::
# 24 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_DEPT_STORE_ELEVATOR, 0, FALSE
# 25 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ChooseFloor
# 26 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 27 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 28 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom4F::
# 29 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_DEPT_STORE_ELEVATOR, 1, FALSE
# 30 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ChooseFloor
# 31 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 32 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 33 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom3F::
# 34 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_DEPT_STORE_ELEVATOR, 2, FALSE
# 35 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ChooseFloor
# 36 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 37 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 38 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom2F::
# 39 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_DEPT_STORE_ELEVATOR, 3, FALSE
# 40 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ChooseFloor
# 41 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 42 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 43 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_FloorSelectFrom1F::
# 44 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_DEPT_STORE_ELEVATOR, 4, FALSE
# 45 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ChooseFloor
# 46 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 47 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 48 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_ChooseFloor::
# 49 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	switch VAR_RESULT
# 50 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 0, CeladonCity_DepartmentStore_Elevator_EventScript_To5F
# 51 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 1, CeladonCity_DepartmentStore_Elevator_EventScript_To4F
# 52 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 2, CeladonCity_DepartmentStore_Elevator_EventScript_To3F
# 53 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 3, CeladonCity_DepartmentStore_Elevator_EventScript_To2F
# 54 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 4, CeladonCity_DepartmentStore_Elevator_EventScript_To1F
# 55 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 5, CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 56 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	case 127, CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 57 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 58 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 59 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_To1F::
# 60 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_0x8006, 4
# 61 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_1F, 255, 6, 1
# 62 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 4, CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 63 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	call CeladonCity_DepartmentStore_Elevator_EventScript_MoveElevator
# 64 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 4
# 65 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 66 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 67 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 68 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_To2F::
# 69 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_0x8006, 5
# 70 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_2F, 255, 6, 1
# 71 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 5, CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 72 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	call CeladonCity_DepartmentStore_Elevator_EventScript_MoveElevator
# 73 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 5
# 74 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 75 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 76 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 77 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_To3F::
# 78 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_0x8006, 6
# 79 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_3F, 255, 6, 1
# 80 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 6, CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 81 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	call CeladonCity_DepartmentStore_Elevator_EventScript_MoveElevator
# 82 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 6
# 83 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 84 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 85 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 86 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_To4F::
# 87 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_0x8006, 7
# 88 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_4F, 255, 6, 1
# 89 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 7, CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 90 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	call CeladonCity_DepartmentStore_Elevator_EventScript_MoveElevator
# 91 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 7
# 92 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 93 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 94 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 95 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_To5F::
# 96 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_0x8006, 8
# 97 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_5F, 255, 6, 1
# 98 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 8, CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 99 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	call CeladonCity_DepartmentStore_Elevator_EventScript_MoveElevator
# 100 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 8
# 101 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	goto CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect
# 102 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 103 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 104 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_ExitFloorSelect::
# 105 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	special CloseElevatorCurrentFloorWindow
# 106 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	releaseall
# 107 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	end
# 108 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"

# 109 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
CeladonCity_DepartmentStore_Elevator_EventScript_MoveElevator::
# 110 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	special CloseElevatorCurrentFloorWindow
# 111 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	closemessage
# 112 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	waitse
# 113 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	special AnimateElevator
# 114 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	waitstate
# 115 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	setflag FLAG_TEMP_2
# 116 "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.pory"
	return
