Route16_MapScripts:: @ 81680E5
    map_script 5, Route16_MapScript1_1680F5
    map_script 3, Route16_MapScript2_168103
    map_script 4, Route16_MapScript3_168113
    .byte 0

Route16_MapScript1_1680F5:: @ 81680F5
    checkflag 2055
    call_if 1, EventScript_1680FF
    end

EventScript_1680FF:: @ 81680FF
    removeobject VAR_LAST_TALKED
    return

Route16_MapScript2_168103:: @ 8168103
    compare_var_to_value VAR_0x405E, 1
    call_if 1, EventScript_16810F
    end

EventScript_16810F:: @ 816810F
    setflag 2096
    return

Route16_MapScript3_168113:: @ 8168113
    map_script_2 VAR_0x405E, 1, EventScript_16811D
    .2byte 0

EventScript_16811D:: @ 816811D
    special sub_80CA630
    end

Route16_EventScript_168121:: @ 8168121
    lock
    faceplayer
    checkflag FLAG_0x23D
    goto_if 0, EventScript_1681A3
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    special sub_8112364
    loadword 0, gUnknown_81853CC
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_168197
    call EventScript_1A924B
    setwildbattle SPECIES_SNORLAX, 30, ITEM_NONE
    waitse
    playmoncry SPECIES_SNORLAX, 2
    delay 40
    waitmoncry
    setflag FLAG_0x080
    setflag 2055
    dowildbattle
    clearflag 2055
    specialvar VAR_RESULT, sub_80CA74C
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_168199
    compare_var_to_value VAR_RESULT, 4
    goto_if 1, EventScript_168199
    compare_var_to_value VAR_RESULT, 5
    goto_if 1, EventScript_168199
    release
    end

EventScript_168197:: @ 8168197
    release
    end

EventScript_168199:: @ 8168199
    loadword 0, gUnknown_8185383
    callstd 4
    release
    end

EventScript_1681A3:: @ 81681A3
    loadword 0, gUnknown_8186F3D
    callstd 4
    release
    end

Route16_EventScript_1681AD:: @ 81681AD
    loadword 0, gUnknown_8186F7A
    callstd 3
    end

Route16_EventScript_1681B6:: @ 81681B6
    loadword 0, gUnknown_8186F98
    callstd 3
    end
