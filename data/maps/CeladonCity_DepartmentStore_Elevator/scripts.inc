CeladonCity_DepartmentStore_Elevator_MapScripts:: @ 816C152
	.byte 0

CeladonCity_DepartmentStore_Elevator_EventScript_16C153:: @ 816C153
	lockall
	setvar VAR_0x8004, 3
	checkflag FLAG_TEMP_2
	call_if FALSE, EventScript_1A7AB9
	copyvar VAR_0x8005, VAR_0x403A
	special sub_80CB580
	message Text_1A535C
	waitmessage
	setvar VAR_0x8004, 3
	specialvar VAR_RESULT, sub_80CB328
	switch VAR_RESULT
	case 0, EventScript_16C1B7
	case 1, EventScript_16C1C3
	case 2, EventScript_16C1CF
	case 3, EventScript_16C1DB
	case 4, EventScript_16C1E7
	end

EventScript_16C1B7:: @ 816C1B7
	multichoicedefault 0, 0, 31, 0, 0
	goto EventScript_16C1F3

EventScript_16C1C2:: @ 816C1C2
	end

EventScript_16C1C3:: @ 816C1C3
	multichoicedefault 0, 0, 31, 1, 0
	goto EventScript_16C1F3
	end

EventScript_16C1CF:: @ 816C1CF
	multichoicedefault 0, 0, 31, 2, 0
	goto EventScript_16C1F3
	end

EventScript_16C1DB:: @ 816C1DB
	multichoicedefault 0, 0, 31, 3, 0
	goto EventScript_16C1F3
	end

EventScript_16C1E7:: @ 816C1E7
	multichoicedefault 0, 0, 31, 4, 0
	goto EventScript_16C1F3
	end

EventScript_16C1F3:: @ 816C1F3
	switch VAR_RESULT
	case 0, EventScript_16C2E6
	case 1, EventScript_16C2BE
	case 2, EventScript_16C296
	case 3, EventScript_16C26E
	case 4, EventScript_16C246
	case 5, EventScript_16C30E
	case 127, EventScript_16C30E
	end

EventScript_16C246:: @ 816C246
	setvar VAR_0x8006, 4
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_1F, 255, 6, 1
	compare_var_to_value VAR_0x403A, 4
	goto_if eq, EventScript_16C30E
	call EventScript_16C313
	setvar VAR_0x403A, 4
	goto EventScript_16C30E
	end

EventScript_16C26E:: @ 816C26E
	setvar VAR_0x8006, 5
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_2F, 255, 6, 1
	compare_var_to_value VAR_0x403A, 5
	goto_if eq, EventScript_16C30E
	call EventScript_16C313
	setvar VAR_0x403A, 5
	goto EventScript_16C30E
	end

EventScript_16C296:: @ 816C296
	setvar VAR_0x8006, 6
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_3F, 255, 6, 1
	compare_var_to_value VAR_0x403A, 6
	goto_if eq, EventScript_16C30E
	call EventScript_16C313
	setvar VAR_0x403A, 6
	goto EventScript_16C30E
	end

EventScript_16C2BE:: @ 816C2BE
	setvar VAR_0x8006, 7
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_4F, 255, 6, 1
	compare_var_to_value VAR_0x403A, 7
	goto_if eq, EventScript_16C30E
	call EventScript_16C313
	setvar VAR_0x403A, 7
	goto EventScript_16C30E
	end

EventScript_16C2E6:: @ 816C2E6
	setvar VAR_0x8006, 8
	setdynamicwarp MAP_CELADON_CITY_DEPARTMENT_STORE_5F, 255, 6, 1
	compare_var_to_value VAR_0x403A, 8
	goto_if eq, EventScript_16C30E
	call EventScript_16C313
	setvar VAR_0x403A, 8
	goto EventScript_16C30E
	end

EventScript_16C30E:: @ 816C30E
	special sub_80CB63C
	releaseall
	end

EventScript_16C313:: @ 816C313
	special sub_80CB63C
	closemessage
	waitse
	special sub_80CB498
	waitstate
	setflag FLAG_TEMP_2
	return
