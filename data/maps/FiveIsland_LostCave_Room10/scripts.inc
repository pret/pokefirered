FiveIsland_LostCave_Room10_MapScripts:: @ 8164C2D
    map_script 5, FiveIsland_LostCave_Room10_MapScript1_164C38
    map_script 2, FiveIsland_LostCave_Room10_MapScript2_164C48
    .byte 0

FiveIsland_LostCave_Room10_MapScript1_164C38:: @ 8164C38
    checktrainerflag 606
    call_if 1, EventScript_164C42
    end

EventScript_164C42:: @ 8164C42
    setvar VAR_0x4083, 1
    return

FiveIsland_LostCave_Room10_MapScript2_164C48:: @ 8164C48
    map_script_2 VAR_0x4083, 0, EventScript_164C52
    .2byte 0

EventScript_164C52:: @ 8164C52
    lockall
    textcolor 1
    applymovement 1, Movement_164CC0
    waitmovement 0
    delay 100
    applymovement 1, Movement_164CC8
    waitmovement 0
    loadword 0, gUnknown_817D062
    callstd 4
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_164CB6
    trainerbattle 3, 606, 0, Text_17D086
    loadword 0, gUnknown_817D0B2
    callstd 4
    closemessage
    call EventScript_164CA5
    warp MAP_FIVE_ISLAND_RESORTGORGEOUS, 255, 39, 10
    waitstate
    releaseall
    end

EventScript_164CA5:: @ 8164CA5
    setflag FLAG_0x093
    clearflag FLAG_0x094
    setvar VAR_0x4083, 1
    setvar VAR_0x4084, 1
    return

EventScript_164CB6:: @ 8164CB6
    settrainerflag 606
    call EventScript_164CA5
    releaseall
    end

Movement_164CC0:: @ 8164CC0
    step_12
    step_1c
    step_13
    step_1c
    step_2e
    step_1c
    step_2d
    step_end

Movement_164CC8:: @ 8164CC8
    step_10
    step_10
    step_end
