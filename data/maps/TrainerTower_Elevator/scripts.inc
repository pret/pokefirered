# 1 "data/maps/TrainerTower_Elevator/scripts.pory"

# 2 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_MapScripts::
# 3 "data/maps/TrainerTower_Elevator/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, TrainerTower_OnResume
# 4 "data/maps/TrainerTower_Elevator/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TrainerTower_OnFrame
# 5 "data/maps/TrainerTower_Elevator/scripts.pory"
	.byte 0
# 6 "data/maps/TrainerTower_Elevator/scripts.pory"

# 7 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_EventScript_FloorSelect::
# 8 "data/maps/TrainerTower_Elevator/scripts.pory"
	lockall
# 9 "data/maps/TrainerTower_Elevator/scripts.pory"
	setvar VAR_0x8004, 6
# 10 "data/maps/TrainerTower_Elevator/scripts.pory"
	call_if_unset FLAG_TEMP_2, EventScript_GetElevatorFloor
# 11 "data/maps/TrainerTower_Elevator/scripts.pory"
	copyvar VAR_0x8005, VAR_ELEVATOR_FLOOR
# 12 "data/maps/TrainerTower_Elevator/scripts.pory"
	special DrawElevatorCurrentFloorWindow
# 13 "data/maps/TrainerTower_Elevator/scripts.pory"
	message Text_WantWhichFloor
# 14 "data/maps/TrainerTower_Elevator/scripts.pory"
	waitmessage
# 15 "data/maps/TrainerTower_Elevator/scripts.pory"
	setvar VAR_0x8004, 6
# 16 "data/maps/TrainerTower_Elevator/scripts.pory"
	specialvar VAR_RESULT, InitElevatorFloorSelectMenuPos
# 17 "data/maps/TrainerTower_Elevator/scripts.pory"
	switch VAR_RESULT
# 18 "data/maps/TrainerTower_Elevator/scripts.pory"
	case 0, TrainerTower_Elevator_EventScript_FloorSelectFromRoof
# 19 "data/maps/TrainerTower_Elevator/scripts.pory"
	case 1, TrainerTower_Elevator_EventScript_FloorSelectFromLobby
# 20 "data/maps/TrainerTower_Elevator/scripts.pory"
	end
# 21 "data/maps/TrainerTower_Elevator/scripts.pory"

# 22 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_EventScript_FloorSelectFromRoof::
# 23 "data/maps/TrainerTower_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_ROOFTOP_B1F, 0, FALSE
# 24 "data/maps/TrainerTower_Elevator/scripts.pory"
	goto TrainerTower_Elevator_EventScript_ChooseFloor
# 25 "data/maps/TrainerTower_Elevator/scripts.pory"
	end
# 26 "data/maps/TrainerTower_Elevator/scripts.pory"

# 27 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_EventScript_FloorSelectFromLobby::
# 28 "data/maps/TrainerTower_Elevator/scripts.pory"
	multichoicedefault 0, 0, MULTICHOICE_ROOFTOP_B1F, 1, FALSE
# 29 "data/maps/TrainerTower_Elevator/scripts.pory"
	goto TrainerTower_Elevator_EventScript_ChooseFloor
# 30 "data/maps/TrainerTower_Elevator/scripts.pory"
	end
# 31 "data/maps/TrainerTower_Elevator/scripts.pory"

# 32 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_EventScript_ChooseFloor::
# 33 "data/maps/TrainerTower_Elevator/scripts.pory"
	switch VAR_RESULT
# 34 "data/maps/TrainerTower_Elevator/scripts.pory"
	case 0, TrainerTower_Elevator_EventScript_SelectRoof
# 35 "data/maps/TrainerTower_Elevator/scripts.pory"
	case 1, TrainerTower_Elevator_EventScript_SelectLobby
# 36 "data/maps/TrainerTower_Elevator/scripts.pory"
	case 2, TrainerTower_Elevator_EventScript_CloseFloorSelect
# 37 "data/maps/TrainerTower_Elevator/scripts.pory"
	case SCR_MENU_CANCEL, TrainerTower_Elevator_EventScript_CloseFloorSelect
# 38 "data/maps/TrainerTower_Elevator/scripts.pory"
	end
# 39 "data/maps/TrainerTower_Elevator/scripts.pory"

# 40 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_EventScript_SelectLobby::
# 41 "data/maps/TrainerTower_Elevator/scripts.pory"
	setvar VAR_0x8006, 3
# 42 "data/maps/TrainerTower_Elevator/scripts.pory"
	setdynamicwarp MAP_TRAINER_TOWER_LOBBY, 17, 8
# 43 "data/maps/TrainerTower_Elevator/scripts.pory"
	goto_if_eq VAR_ELEVATOR_FLOOR, 3, TrainerTower_Elevator_EventScript_CloseFloorSelect
# 44 "data/maps/TrainerTower_Elevator/scripts.pory"
	call TrainerTower_Elevator_EventScript_MoveElevator
# 45 "data/maps/TrainerTower_Elevator/scripts.pory"
	setvar VAR_ELEVATOR_FLOOR, 3
# 46 "data/maps/TrainerTower_Elevator/scripts.pory"
	special CloseElevatorCurrentFloorWindow
# 47 "data/maps/TrainerTower_Elevator/scripts.pory"
	delay 25
# 48 "data/maps/TrainerTower_Elevator/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, TrainerTower_Elevator_Movement_ExitElevator
# 49 "data/maps/TrainerTower_Elevator/scripts.pory"
	waitmovement 0
# 50 "data/maps/TrainerTower_Elevator/scripts.pory"
	warp MAP_TRAINER_TOWER_LOBBY, 17, 8
# 51 "data/maps/TrainerTower_Elevator/scripts.pory"
	waitstate
# 52 "data/maps/TrainerTower_Elevator/scripts.pory"
	releaseall
# 53 "data/maps/TrainerTower_Elevator/scripts.pory"
	end
# 54 "data/maps/TrainerTower_Elevator/scripts.pory"

# 55 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_EventScript_SelectRoof::
# 56 "data/maps/TrainerTower_Elevator/scripts.pory"
	goto TrainerTower_Elevator_EventScript_CloseFloorSelect
# 57 "data/maps/TrainerTower_Elevator/scripts.pory"
	end
# 58 "data/maps/TrainerTower_Elevator/scripts.pory"

# 59 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_EventScript_CloseFloorSelect::
# 60 "data/maps/TrainerTower_Elevator/scripts.pory"
	special CloseElevatorCurrentFloorWindow
# 61 "data/maps/TrainerTower_Elevator/scripts.pory"
	releaseall
# 62 "data/maps/TrainerTower_Elevator/scripts.pory"
	end
# 63 "data/maps/TrainerTower_Elevator/scripts.pory"

# 64 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_EventScript_MoveElevator::
# 65 "data/maps/TrainerTower_Elevator/scripts.pory"
	special CloseElevatorCurrentFloorWindow
# 66 "data/maps/TrainerTower_Elevator/scripts.pory"
	closemessage
# 67 "data/maps/TrainerTower_Elevator/scripts.pory"
	waitse
# 68 "data/maps/TrainerTower_Elevator/scripts.pory"
	special AnimateElevator
# 69 "data/maps/TrainerTower_Elevator/scripts.pory"
	waitstate
# 70 "data/maps/TrainerTower_Elevator/scripts.pory"
	setflag FLAG_TEMP_2
# 71 "data/maps/TrainerTower_Elevator/scripts.pory"
	return
# 72 "data/maps/TrainerTower_Elevator/scripts.pory"

# 73 "data/maps/TrainerTower_Elevator/scripts.pory"
TrainerTower_Elevator_Movement_ExitElevator::
# 74 "data/maps/TrainerTower_Elevator/scripts.pory"
	walk_in_place_faster_down
# 75 "data/maps/TrainerTower_Elevator/scripts.pory"
	delay_16
# 76 "data/maps/TrainerTower_Elevator/scripts.pory"
	walk_down
# 77 "data/maps/TrainerTower_Elevator/scripts.pory"
	walk_right
# 78 "data/maps/TrainerTower_Elevator/scripts.pory"
	walk_right
# 79 "data/maps/TrainerTower_Elevator/scripts.pory"
	walk_down
# 80 "data/maps/TrainerTower_Elevator/scripts.pory"
	step_end
