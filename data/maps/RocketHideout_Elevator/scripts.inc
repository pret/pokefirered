RocketHideout_Elevator_MapScripts:: @ 81614D8
	.byte 0

RocketHideout_Elevator_EventScript_1614D9:: @ 81614D9
	lockall
	checkflag FLAG_CAN_USE_ROCKET_HIDEOUT_LIFT
	goto_if FALSE, EventScript_16161B
	setvar VAR_0x8004, 2
	checkflag FLAG_TEMP_2
	call_if FALSE, EventScript_1A7AB9
	copyvar VAR_0x8005, VAR_ELEVATOR_FLOOR
	special Special_DrawElevatorCurrentFloorWindow
	message Text_1A535C
	waitmessage
	setvar VAR_0x8004, 2
	specialvar VAR_RESULT, Special_InitElevatorFloorSelectMenuPos
	switch VAR_RESULT
	case 0, EventScript_161530
	case 1, EventScript_16153C
	case 2, EventScript_161548
	end

EventScript_161530:: @ 8161530
	multichoicedefault 0, 0, MULTICHOICE_ROCKET_HIDEOUT_ELEVATOR, 0, FALSE
	goto EventScript_161554

EventScript_16153B:: @ 816153B
	end

EventScript_16153C:: @ 816153C
	multichoicedefault 0, 0, MULTICHOICE_ROCKET_HIDEOUT_ELEVATOR, 1, FALSE
	goto EventScript_161554

EventScript_161547:: @ 8161547
	end

EventScript_161548:: @ 8161548
	multichoicedefault 0, 0, MULTICHOICE_ROCKET_HIDEOUT_ELEVATOR, 2, FALSE
	goto EventScript_161554

EventScript_161553:: @ 8161553
	end

EventScript_161554:: @ 8161554
	switch VAR_RESULT
	case 0, EventScript_161591
	case 1, EventScript_1615B9
	case 2, EventScript_1615E1
	case 3, EventScript_161609
	case 127, EventScript_161609
	end

EventScript_161591:: @ 8161591
	setvar VAR_0x8006, 3
	setdynamicwarp MAP_ROCKET_HIDEOUT_B1F, 255, 24, 25
	compare VAR_ELEVATOR_FLOOR, 3
	goto_if eq, EventScript_161609
	call EventScript_16160E
	setvar VAR_ELEVATOR_FLOOR, 3
	goto EventScript_161609

EventScript_1615B8:: @ 81615B8
	end

EventScript_1615B9:: @ 81615B9
	setvar VAR_0x8006, 2
	setdynamicwarp MAP_ROCKET_HIDEOUT_B2F, 255, 28, 16
	compare VAR_ELEVATOR_FLOOR, 2
	goto_if eq, EventScript_161609
	call EventScript_16160E
	setvar VAR_ELEVATOR_FLOOR, 2
	goto EventScript_161609

EventScript_1615E0:: @ 81615E0
	end

EventScript_1615E1:: @ 81615E1
	setvar VAR_0x8006, 0
	setdynamicwarp MAP_ROCKET_HIDEOUT_B4F, 255, 20, 23
	compare VAR_ELEVATOR_FLOOR, 0
	goto_if eq, EventScript_161609
	call EventScript_16160E
	setvar VAR_ELEVATOR_FLOOR, 0
	goto EventScript_161609

EventScript_161608:: @ 8161608
	end

EventScript_161609:: @ 8161609
	special Special_CloseElevatorCurrentFloorWindow
	releaseall
	end

EventScript_16160E:: @ 816160E
	special Special_CloseElevatorCurrentFloorWindow
	closemessage
	waitse
	special Special_AnimateElevator
	waitstate
	setflag FLAG_TEMP_2
	return

EventScript_16161B:: @ 816161B
	msgbox gUnknown_81754DD
	releaseall
	end
