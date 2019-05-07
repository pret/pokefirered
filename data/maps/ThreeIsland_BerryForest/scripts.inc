ThreeIsland_BerryForest_MapScripts:: @ 8163C71
    map_script 3, ThreeIsland_BerryForest_MapScript1_163C77
    .byte 0

ThreeIsland_BerryForest_MapScript1_163C77:: @ 8163C77
    setworldmapflag 2231
    setescapewarp MAP_THREEISLAND_BONDBRIDGE, 255, 12, 6
    end

ThreeIsland_BerryForest_EventScript_163C83:: @ 8163C83
    lock
    faceplayer
    loadword 0, gUnknown_817ADD6
    callstd 4
    playse SE_PIN
    applymovement 1, Movement_1A75DB
    waitmovement 0
    applymovement 1, Movement_163D22
    waitmovement 0
    loadword 0, gUnknown_817AE8E
    callstd 4
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    waitse
    playmoncry SPECIES_HYPNO, 2
    waitmoncry
    setwildbattle SPECIES_HYPNO, 30, ITEM_NONE
    dowildbattle
    special sub_8112364
    applymovement 1, Movement_1A75E1
    waitmovement 0
    loadword 0, gUnknown_817AEE1
    callstd 4
    setorcopyvar VAR_0x8000, 147
    setorcopyvar VAR_0x8001, 1
    callstd 0
    compare_var_to_value VAR_RESULT, 0
    call_if 1, EventScript_163D19
    special sub_80CA6DC
    loadword 0, gUnknown_817AF3B
    callstd 4
    closemessage
    setflag FLAG_0x2A3
    setflag FLAG_0x07A
    setvar VAR_0x4079, 2
    clearflag FLAG_0x075
    warp MAP_TWOISLAND_JOYFULGAMECORNER, 255, 6, 6
    waitstate
    release
    end

EventScript_163D19:: @ 8163D19
    loadword 0, gUnknown_817AF9F
    callstd 4
    return

Movement_163D22:: @ 8163D22
    step_2f
    step_1c
    step_30
    step_1b
    step_2f
    step_end

ThreeIsland_BerryForest_EventScript_163D28:: @ 8163D28
    loadword 0, gUnknown_817AFD6
    callstd 3
    end

ThreeIsland_BerryForest_EventScript_163D31:: @ 8163D31
    loadword 0, gUnknown_817B029
    callstd 3
    end
