# 1 "data/maps/RocketHideout_Elevator/scripts.pory"

# 2 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_MapScripts::
# 3 "data/maps/RocketHideout_Elevator/scripts.pory"
	.byte 0
# 4 "data/maps/RocketHideout_Elevator/scripts.pory"

# 5 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_FloorSelect::
# 6 "data/maps/RocketHideout_Elevator/scripts.pory"
	lockall
# 7 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto_if_unset FLAG_CAN_USE_ROCKET_HIDEOUT_LIFT, RocketHideout_Elevator_EventScript_NeedKey
# 8 "data/maps/RocketHideout_Elevator/scripts.pory"
	setvar VAR_0x8004, 2
# 9 "data/maps/RocketHideout_Elevator/scripts.pory"
	call_if_unset FLAG_TEMP_2, EventScript_GetElevatorFloor
# 10 "data/maps/RocketHideout_Elevator/scripts.pory"
	copyvar VAR_0x8005, VAR_ELEVATOR_FLOOR
# 11 "data/maps/RocketHideout_Elevator/scripts.pory"
	special DrawElevatorCurrentFloorWindow
# 12 "data/maps/RocketHideout_Elevator/scripts.pory"
	message Text_WantWhichFloor
# 13 "data/maps/RocketHideout_Elevator/scripts.pory"
	waitmessage
# 14 "data/maps/RocketHideout_Elevator/scripts.pory"
	setvar VAR_0x8004, 2
# 15 "data/maps/RocketHideout_Elevator/scripts.pory"
	specialvar VAR_RESULT, InitElevatorFloorSelectMenuPos
# 16 "data/maps/RocketHideout_Elevator/scripts.pory"
	switch VAR_RESULT
# 17 "data/maps/RocketHideout_Elevator/scripts.pory"
	case 0, RocketHideout_Elevator_EventScript_FloorSelectFromB1F
# 18 "data/maps/RocketHideout_Elevator/scripts.pory"
	case 1, RocketHideout_Elevator_EventScript_FloorSelectFromB2F
# 19 "data/maps/RocketHideout_Elevator/scripts.pory"
	case 2, RocketHideout_Elevator_EventScript_FloorSelectFromB4F
# 20 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
# 21 "data/maps/RocketHideout_Elevator/scripts.pory"

# 22 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_FloorSelectFromB1F::
# 23 "data/maps/RocketHideout_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_ROCKET_HIDEOUT_ELEVATOR, 0, FALSE
# 24 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto RocketHideout_Elevator_EventScript_ChooseFloor
# 25 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
# 26 "data/maps/RocketHideout_Elevator/scripts.pory"

# 27 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_FloorSelectFromB2F::
# 28 "data/maps/RocketHideout_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_ROCKET_HIDEOUT_ELEVATOR, 1, FALSE
# 29 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto RocketHideout_Elevator_EventScript_ChooseFloor
# 30 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
# 31 "data/maps/RocketHideout_Elevator/scripts.pory"

# 32 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_FloorSelectFromB4F::
# 33 "data/maps/RocketHideout_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_ROCKET_HIDEOUT_ELEVATOR, 2, FALSE
# 34 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto RocketHideout_Elevator_EventScript_ChooseFloor
# 35 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
# 36 "data/maps/RocketHideout_Elevator/scripts.pory"

# 37 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_ChooseFloor::
# 38 "data/maps/RocketHideout_Elevator/scripts.pory"
	switch VAR_RESULT
# 39 "data/maps/RocketHideout_Elevator/scripts.pory"
	case 0, RocketHideout_Elevator_EventScript_ToB1F
# 40 "data/maps/RocketHideout_Elevator/scripts.pory"
	case 1, RocketHideout_Elevator_EventScript_ToB2F
# 41 "data/maps/RocketHideout_Elevator/scripts.pory"
	case 2, RocketHideout_Elevator_EventScript_ToB4F
# 42 "data/maps/RocketHideout_Elevator/scripts.pory"
	case 3, RocketHideout_Elevator_EventScript_ExitFloorSelect
# 43 "data/maps/RocketHideout_Elevator/scripts.pory"
	case 127, RocketHideout_Elevator_EventScript_ExitFloorSelect
# 44 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
# 45 "data/maps/RocketHideout_Elevator/scripts.pory"

# 46 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_ToB1F::
# 47 "data/maps/RocketHideout_Elevator/scripts.pory"
	setvar VAR_0x8006, 3
# 48 "data/maps/RocketHideout_Elevator/scripts.pory"
	setdynamicwarp MAP_ROCKET_HIDEOUT_B1F, 255, 24, 25
# 49 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 3, RocketHideout_Elevator_EventScript_ExitFloorSelect
# 50 "data/maps/RocketHideout_Elevator/scripts.pory"
	call RocketHideout_Elevator_EventScript_MoveElevator
# 51 "data/maps/RocketHideout_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 3
# 52 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto RocketHideout_Elevator_EventScript_ExitFloorSelect
# 53 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
# 54 "data/maps/RocketHideout_Elevator/scripts.pory"

# 55 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_ToB2F::
# 56 "data/maps/RocketHideout_Elevator/scripts.pory"
	setvar VAR_0x8006, 2
# 57 "data/maps/RocketHideout_Elevator/scripts.pory"
	setdynamicwarp MAP_ROCKET_HIDEOUT_B2F, 255, 28, 16
# 58 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 2, RocketHideout_Elevator_EventScript_ExitFloorSelect
# 59 "data/maps/RocketHideout_Elevator/scripts.pory"
	call RocketHideout_Elevator_EventScript_MoveElevator
# 60 "data/maps/RocketHideout_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 2
# 61 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto RocketHideout_Elevator_EventScript_ExitFloorSelect
# 62 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
# 63 "data/maps/RocketHideout_Elevator/scripts.pory"

# 64 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_ToB4F::
# 65 "data/maps/RocketHideout_Elevator/scripts.pory"
	setvar VAR_0x8006, 0
# 66 "data/maps/RocketHideout_Elevator/scripts.pory"
	setdynamicwarp MAP_ROCKET_HIDEOUT_B4F, 255, 20, 23
# 67 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 0, RocketHideout_Elevator_EventScript_ExitFloorSelect
# 68 "data/maps/RocketHideout_Elevator/scripts.pory"
	call RocketHideout_Elevator_EventScript_MoveElevator
# 69 "data/maps/RocketHideout_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 0
# 70 "data/maps/RocketHideout_Elevator/scripts.pory"
	goto RocketHideout_Elevator_EventScript_ExitFloorSelect
# 71 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
# 72 "data/maps/RocketHideout_Elevator/scripts.pory"

# 73 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_ExitFloorSelect::
# 74 "data/maps/RocketHideout_Elevator/scripts.pory"
	special CloseElevatorCurrentFloorWindow
# 75 "data/maps/RocketHideout_Elevator/scripts.pory"
	releaseall
# 76 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
# 77 "data/maps/RocketHideout_Elevator/scripts.pory"

# 78 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_MoveElevator::
# 79 "data/maps/RocketHideout_Elevator/scripts.pory"
	special CloseElevatorCurrentFloorWindow
# 80 "data/maps/RocketHideout_Elevator/scripts.pory"
	closemessage
# 81 "data/maps/RocketHideout_Elevator/scripts.pory"
	waitse
# 82 "data/maps/RocketHideout_Elevator/scripts.pory"
	special AnimateElevator
# 83 "data/maps/RocketHideout_Elevator/scripts.pory"
	waitstate
# 84 "data/maps/RocketHideout_Elevator/scripts.pory"
	setflag FLAG_TEMP_2
# 85 "data/maps/RocketHideout_Elevator/scripts.pory"
	return
# 86 "data/maps/RocketHideout_Elevator/scripts.pory"

# 87 "data/maps/RocketHideout_Elevator/scripts.pory"
RocketHideout_Elevator_EventScript_NeedKey::
# 88 "data/maps/RocketHideout_Elevator/scripts.pory"
	msgbox RocketHideout_Elevator_Text_AppearsToNeedAKey
# 89 "data/maps/RocketHideout_Elevator/scripts.pory"
	releaseall
# 90 "data/maps/RocketHideout_Elevator/scripts.pory"
	end
