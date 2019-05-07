SevenIsland_TrainerTower_Elevator_MapScripts:: @ 8164AF8
    map_script 5, SevenIsland_TrainerTower_Elevator_MapScript1_1C4F54
    map_script 2, SevenIsland_TrainerTower_Elevator_MapScript2_1C5046
    .byte 0

SevenIsland_TrainerTower_Elevator_EventScript_164B03:: @ 8164B03
    lockall
    setvar VAR_0x8004, 6
    checkflag FLAG_0x002
    call_if 0, EventScript_1A7AB9
    copyvar VAR_0x8005, VAR_0x403A
    special sub_80CB580
    message Text_1A535C
    waitmessage
    setvar VAR_0x8004, 6
    specialvar VAR_RESULT, sub_80CB328
    copyvar VAR_0x8000, VAR_RESULT
    compare_var_to_value VAR_0x8000, 0
    goto_if 1, EventScript_164B46
    compare_var_to_value VAR_0x8000, 1
    goto_if 1, EventScript_164B52
    end

EventScript_164B46:: @ 8164B46
    multichoicedefault 0, 0, 20, 0, 0
    goto EventScript_164B5E
    end

EventScript_164B52:: @ 8164B52
    multichoicedefault 0, 0, 20, 1, 0
    goto EventScript_164B5E
    end

EventScript_164B5E:: @ 8164B5E
    copyvar VAR_0x8000, VAR_RESULT
    compare_var_to_value VAR_0x8000, 0
    goto_if 1, EventScript_164BCD
    compare_var_to_value VAR_0x8000, 1
    goto_if 1, EventScript_164B90
    compare_var_to_value VAR_0x8000, 2
    goto_if 1, EventScript_164BD3
    compare_var_to_value VAR_0x8000, 127
    goto_if 1, EventScript_164BD3
    end

EventScript_164B90:: @ 8164B90
    setvar VAR_0x8006, 3
    setdynamicwarp MAP_SEVENISLAND_TRAINERTOWER_LOBBY, 255, 17, 8
    compare_var_to_value VAR_0x403A, 3
    goto_if 1, EventScript_164BD3
    call EventScript_164BD8
    setvar VAR_0x403A, 3
    special sub_80CB63C
    delay 25
    applymovement 255, Movement_164BE5
    waitmovement 0
    warp MAP_SEVENISLAND_TRAINERTOWER_LOBBY, 255, 17, 8
    waitstate
    releaseall
    end

EventScript_164BCD:: @ 8164BCD
    goto EventScript_164BD3
    end

EventScript_164BD3:: @ 8164BD3
    special sub_80CB63C
    releaseall
    end

EventScript_164BD8:: @ 8164BD8
    special sub_80CB63C
    closemessage
    waitse
    special sub_80CB498
    waitstate
    setflag FLAG_0x002
    return

Movement_164BE5:: @ 8164BE5
    step_2d
    step_1c
    step_10
    step_13
    step_13
    step_10
    step_end
