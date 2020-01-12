SevenIsland_TrainerTower_Elevator_MapScripts:: @ 8164AF8
	map_script MAP_SCRIPT_ON_RESUME, SevenIsland_TrainerTower_Elevator_MapScript1_1C4F54
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SevenIsland_TrainerTower_Elevator_MapScript2_1C5046
	.byte 0

SevenIsland_TrainerTower_Elevator_EventScript_164B03:: @ 8164B03
	lockall
	setvar VAR_0x8004, 6
	call_if_unset FLAG_TEMP_2, EventScript_1A7AB9
	copyvar VAR_0x8005, VAR_ELEVATOR_FLOOR
	special Special_DrawElevatorCurrentFloorWindow
	message Text_WantWhichFloor
	waitmessage
	setvar VAR_0x8004, 6
	specialvar VAR_RESULT, Special_InitElevatorFloorSelectMenuPos
	switch VAR_RESULT
	case 0, EventScript_164B46
	case 1, EventScript_164B52
	end

EventScript_164B46:: @ 8164B46
	multichoicedefault 0, 0, MULTICHOICE_ROOFTOP_B1F, 0, FALSE
	goto EventScript_164B5E
	end

EventScript_164B52:: @ 8164B52
	multichoicedefault 0, 0, MULTICHOICE_ROOFTOP_B1F, 1, FALSE
	goto EventScript_164B5E
	end

EventScript_164B5E:: @ 8164B5E
	switch VAR_RESULT
	case 0, EventScript_164BCD
	case 1, EventScript_164B90
	case 2, EventScript_164BD3
	case 127, EventScript_164BD3
	end

EventScript_164B90:: @ 8164B90
	setvar VAR_0x8006, 3
	setdynamicwarp MAP_SEVEN_ISLAND_TRAINER_TOWER_LOBBY, 255, 17, 8
	compare VAR_ELEVATOR_FLOOR, 3
	goto_if_eq EventScript_164BD3
	call EventScript_164BD8
	setvar VAR_ELEVATOR_FLOOR, 3
	special Special_CloseElevatorCurrentFloorWindow
	delay 25
	applymovement OBJ_EVENT_ID_PLAYER, Movement_164BE5
	waitmovement 0
	warp MAP_SEVEN_ISLAND_TRAINER_TOWER_LOBBY, 255, 17, 8
	waitstate
	releaseall
	end

EventScript_164BCD:: @ 8164BCD
	goto EventScript_164BD3
	end

EventScript_164BD3:: @ 8164BD3
	special Special_CloseElevatorCurrentFloorWindow
	releaseall
	end

EventScript_164BD8:: @ 8164BD8
	special Special_CloseElevatorCurrentFloorWindow
	closemessage
	waitse
	special Special_AnimateElevator
	waitstate
	setflag FLAG_TEMP_2
	return

Movement_164BE5:: @ 8164BE5
	walk_in_place_fastest_down
	delay_16
	walk_down
	walk_right
	walk_right
	walk_down
	step_end
