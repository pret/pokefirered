SilphCo_Elevator_MapScripts:: @ 8161F6E
	.byte 0

SilphCo_Elevator_EventScript_161F6F:: @ 8161F6F
	lockall
	setvar VAR_0x8004, 1
	checkflag FLAG_TEMP_2
	call_if FALSE, EventScript_1A7AB9
	copyvar VAR_0x8005, VAR_ELEVATOR_FLOOR
	special Special_DrawElevatorCurrentFloorWindow
	message Text_1A535C
	waitmessage
	setvar VAR_0x8004, 1
	specialvar VAR_RESULT, Special_InitElevatorFloorSelectMenuPos
	special sub_80CB7C4
	waitstate
	switch VAR_RESULT
	case 0, EventScript_1621BF
	case 1, EventScript_162197
	case 2, EventScript_16216F
	case 3, EventScript_162147
	case 4, EventScript_16211F
	case 5, EventScript_1620F7
	case 6, EventScript_1620CF
	case 7, EventScript_1620A7
	case 8, EventScript_16207F
	case 9, EventScript_162057
	case 10, EventScript_16202F
	case 11, EventScript_1621E7
	case 127, EventScript_1621E7
	end

EventScript_16202F:: @ 816202F
	setvar VAR_0x8006, 4
	setdynamicwarp MAP_SILPH_CO_1F, 255, 22, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 4
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 4
	goto EventScript_1621E7

EventScript_162056:: @ 8162056
	end

EventScript_162057:: @ 8162057
	setvar VAR_0x8006, 5
	setdynamicwarp MAP_SILPH_CO_2F, 255, 22, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 5
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 5
	goto EventScript_1621E7

EventScript_16207E:: @ 816207E
	end

EventScript_16207F:: @ 816207F
	setvar VAR_0x8006, 6
	setdynamicwarp MAP_SILPH_CO_3F, 255, 22, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 6
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 6
	goto EventScript_1621E7

EventScript_1620A6:: @ 81620A6
	end

EventScript_1620A7:: @ 81620A7
	setvar VAR_0x8006, 7
	setdynamicwarp MAP_SILPH_CO_4F, 255, 22, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 7
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 7
	goto EventScript_1621E7

EventScript_1620CE:: @ 81620CE
	end

EventScript_1620CF:: @ 81620CF
	setvar VAR_0x8006, 8
	setdynamicwarp MAP_SILPH_CO_5F, 255, 22, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 8
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 8
	goto EventScript_1621E7

EventScript_1620F6:: @ 81620F6
	end

EventScript_1620F7:: @ 81620F7
	setvar VAR_0x8006, 9
	setdynamicwarp MAP_SILPH_CO_6F, 255, 20, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 9
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 9
	goto EventScript_1621E7

EventScript_16211E:: @ 816211E
	end

EventScript_16211F:: @ 816211F
	setvar VAR_0x8006, 10
	setdynamicwarp MAP_SILPH_CO_7F, 255, 23, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 10
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 10
	goto EventScript_1621E7

EventScript_162146:: @ 8162146
	end

EventScript_162147:: @ 8162147
	setvar VAR_0x8006, 11
	setdynamicwarp MAP_SILPH_CO_8F, 255, 22, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 11
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 11
	goto EventScript_1621E7

EventScript_16216E:: @ 816216E
	end

EventScript_16216F:: @ 816216F
	setvar VAR_0x8006, 12
	setdynamicwarp MAP_SILPH_CO_9F, 255, 24, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 12
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 12
	goto EventScript_1621E7

EventScript_162196:: @ 8162196
	end

EventScript_162197:: @ 8162197
	setvar VAR_0x8006, 13
	setdynamicwarp MAP_SILPH_CO_10F, 255, 13, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 13
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 13
	goto EventScript_1621E7

EventScript_1621BE:: @ 81621BE
	end

EventScript_1621BF:: @ 81621BF
	setvar VAR_0x8006, 14
	setdynamicwarp MAP_SILPH_CO_11F, 255, 13, 3
	compare_var_to_value VAR_ELEVATOR_FLOOR, 14
	goto_if eq, EventScript_1621E7
	call EventScript_1621EC
	setvar VAR_ELEVATOR_FLOOR, 14
	goto EventScript_1621E7

EventScript_1621E6:: @ 81621E6
	end

EventScript_1621E7:: @ 81621E7
	special Special_CloseElevatorCurrentFloorWindow
	releaseall
	end

EventScript_1621EC:: @ 81621EC
	special Special_CloseElevatorCurrentFloorWindow
	closemessage
	waitse
	special Special_AnimateElevator
	waitstate
	setflag FLAG_TEMP_2
	return
