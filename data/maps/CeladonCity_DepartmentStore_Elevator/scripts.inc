CeladonCity_DepartmentStore_Elevator_MapScripts:: @ 816C152
    .byte 0

CeladonCity_DepartmentStore_Elevator_EventScript_16C153:: @ 816C153
    lockall
    setvar VAR_0x8004, 3
    checkflag FLAG_0x002
    call_if 0, EventScript_1A7AB9
    copyvar VAR_0x8005, VAR_0x403A
    special sub_80CB580
    message Text_1A535C
    waitmessage
    setvar VAR_0x8004, 3
    specialvar VAR_RESULT, sub_80CB328
    copyvar VAR_0x8000, VAR_RESULT
    compare_var_to_value VAR_0x8000, 0
    goto_if 1, EventScript_16C1B7
    compare_var_to_value VAR_0x8000, 1
    goto_if 1, EventScript_16C1C3
    compare_var_to_value VAR_0x8000, 2
    goto_if 1, EventScript_16C1CF
    compare_var_to_value VAR_0x8000, 3
    goto_if 1, EventScript_16C1DB
    compare_var_to_value VAR_0x8000, 4
    goto_if 1, EventScript_16C1E7
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
    copyvar VAR_0x8000, VAR_RESULT
    compare_var_to_value VAR_0x8000, 0
    goto_if 1, EventScript_16C2E6
    compare_var_to_value VAR_0x8000, 1
    goto_if 1, EventScript_16C2BE
    compare_var_to_value VAR_0x8000, 2
    goto_if 1, EventScript_16C296
    compare_var_to_value VAR_0x8000, 3
    goto_if 1, EventScript_16C26E
    compare_var_to_value VAR_0x8000, 4
    goto_if 1, EventScript_16C246
    compare_var_to_value VAR_0x8000, 5
    goto_if 1, EventScript_16C30E
    compare_var_to_value VAR_0x8000, 127
    goto_if 1, EventScript_16C30E
    end

EventScript_16C246:: @ 816C246
    setvar VAR_0x8006, 4
    setdynamicwarp MAP_CELADON_CITY_DEPARTMENTSTORE_1F, 255, 6, 1
    compare_var_to_value VAR_0x403A, 4
    goto_if 1, EventScript_16C30E
    call EventScript_16C313
    setvar VAR_0x403A, 4
    goto EventScript_16C30E
    end

EventScript_16C26E:: @ 816C26E
    setvar VAR_0x8006, 5
    setdynamicwarp MAP_CELADON_CITY_DEPARTMENTSTORE_2F, 255, 6, 1
    compare_var_to_value VAR_0x403A, 5
    goto_if 1, EventScript_16C30E
    call EventScript_16C313
    setvar VAR_0x403A, 5
    goto EventScript_16C30E
    end

EventScript_16C296:: @ 816C296
    setvar VAR_0x8006, 6
    setdynamicwarp MAP_CELADON_CITY_DEPARTMENTSTORE_3F, 255, 6, 1
    compare_var_to_value VAR_0x403A, 6
    goto_if 1, EventScript_16C30E
    call EventScript_16C313
    setvar VAR_0x403A, 6
    goto EventScript_16C30E
    end

EventScript_16C2BE:: @ 816C2BE
    setvar VAR_0x8006, 7
    setdynamicwarp MAP_CELADON_CITY_DEPARTMENTSTORE_4F, 255, 6, 1
    compare_var_to_value VAR_0x403A, 7
    goto_if 1, EventScript_16C30E
    call EventScript_16C313
    setvar VAR_0x403A, 7
    goto EventScript_16C30E
    end

EventScript_16C2E6:: @ 816C2E6
    setvar VAR_0x8006, 8
    setdynamicwarp MAP_CELADON_CITY_DEPARTMENTSTORE_5F, 255, 6, 1
    compare_var_to_value VAR_0x403A, 8
    goto_if 1, EventScript_16C30E
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
    setflag FLAG_0x002
    return
