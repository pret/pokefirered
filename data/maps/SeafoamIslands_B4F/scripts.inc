SeafoamIslands_B4F_MapScripts:: @ 816302E
    map_script 3, SeafoamIslands_B4F_MapScript1_163066
    map_script 5, SeafoamIslands_B4F_MapScript2_163048
    map_script 1, SeafoamIslands_B4F_MapScript3_1630B1
    map_script 4, SeafoamIslands_B4F_MapScript4_1630E7
    map_script 2, SeafoamIslands_B4F_MapScript5_1630F9
    .byte 0

SeafoamIslands_B4F_MapScript2_163048:: @ 8163048
    checkflag 2055
    call_if 1, EventScript_163052
    end

EventScript_163052:: @ 8163052
    specialvar VAR_RESULT, sub_80CA74C
    compare_var_to_value VAR_RESULT, 7
    goto_if 5, EventScript_1A77A9
    removeobject VAR_LAST_TALKED
    return

SeafoamIslands_B4F_MapScript1_163066:: @ 8163066
    checkflag FLAG_0x2BE
    call_if 0, EventScript_1630AD
    checkflag FLAG_0x2D3
    call_if 0, EventScript_163082
    checkflag FLAG_0x2D3
    call_if 1, EventScript_1630A9
    end

EventScript_163082:: @ 8163082
    setvar VAR_0x4002, 0
    checkflag FLAG_0x04C
    call_if 0, EventScript_163169
    checkflag FLAG_0x04D
    call_if 0, EventScript_163169
    compare_var_to_value VAR_0x4002, 2
    call_if 1, EventScript_1630A5
    return

EventScript_1630A5:: @ 81630A5
    setflag FLAG_0x2D3
    return

EventScript_1630A9:: @ 81630A9
    setmaplayoutindex LAYOUT_UNUSEDLAYOUT_833BE30
    return

EventScript_1630AD:: @ 81630AD
    clearflag FLAG_0x082
    return

SeafoamIslands_B4F_MapScript3_1630B1:: @ 81630B1
    setvar VAR_0x4002, 0
    checkflag FLAG_0x04C
    call_if 0, EventScript_163169
    checkflag FLAG_0x04D
    call_if 0, EventScript_163169
    compare_var_to_value VAR_0x4002, 2
    goto_if 1, EventScript_1630D4
    end

EventScript_1630D4:: @ 81630D4
    setmetatile 12, 14, 299, 0
    setmetatile 13, 14, 299, 0
    end

SeafoamIslands_B4F_MapScript4_1630E7:: @ 81630E7
    map_script_2 VAR_0x4063, 1, EventScript_1630F1
    .2byte 0

EventScript_1630F1:: @ 81630F1
    turnobject 255, 2
    special sub_80CBD80
    end

SeafoamIslands_B4F_MapScript5_1630F9:: @ 81630F9
    map_script_2 VAR_0x4063, 1, EventScript_16310B
    map_script_2 VAR_0x4001, 1, EventScript_163121
    .2byte 0

EventScript_16310B:: @ 816310B
    lockall
    applymovement 255, Movement_16311D
    waitmovement 0
    setvar VAR_0x4063, 0
    releaseall
    end

Movement_16311D:: @ 816311D
    step_1e
    step_1e
    step_1e
    step_end

EventScript_163121:: @ 8163121
    lockall
    setvar VAR_0x4002, 0
    checkflag FLAG_0x04C
    call_if 0, EventScript_163169
    checkflag FLAG_0x04D
    call_if 0, EventScript_163169
    compare_var_to_value VAR_0x4002, 2
    goto_if 1, EventScript_163185
    getplayerxy VAR_0x8008, VAR_0x8009
    compare_var_to_value VAR_0x8008, 9
    call_if 0, EventScript_16316F
    compare_var_to_value VAR_0x8008, 9
    call_if 4, EventScript_16317A
    special sub_805D1A8
    setvar VAR_0x4001, 0
    releaseall
    end

EventScript_163169:: @ 8163169
    addvar VAR_0x4002, 1
    return

EventScript_16316F:: @ 816316F
    applymovement 255, Movement_16318C
    waitmovement 0
    return

EventScript_16317A:: @ 816317A
    applymovement 255, Movement_163195
    waitmovement 0
    return

EventScript_163185:: @ 8163185
    setvar VAR_0x4001, 0
    releaseall
    end

Movement_16318C:: @ 816318C
    step_11
    step_11
    step_11
    step_13
    step_13
    step_13
    step_13
    step_11
    step_end

Movement_163195:: @ 8163195
    step_11
    step_11
    step_11
    step_13
    step_13
    step_13
    step_11
    step_end

SeafoamIslands_B4F_EventScript_16319D:: @ 816319D
    lockall
    applymovement 255, Movement_1631AA
    waitmovement 0
    releaseall
    end

Movement_1631AA:: @ 81631AA
    step_11
    step_end

SeafoamIslands_B4F_EventScript_1631AC:: @ 81631AC
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    special sub_8112364
    lock
    faceplayer
    setwildbattle SPECIES_ARTICUNO, 50, ITEM_NONE
    waitse
    playmoncry SPECIES_ARTICUNO, 2
    message Text_1A6448
    waitmessage
    waitmoncry
    delay 10
    playbgm BGM_FRLG_LEADER_EYE, 0
    waitbuttonpress
    setflag 2055
    special sub_807F9D8
    waitstate
    clearflag 2055
    specialvar VAR_RESULT, sub_80CA74C
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_16320F
    compare_var_to_value VAR_RESULT, 4
    goto_if 1, EventScript_163218
    compare_var_to_value VAR_RESULT, 5
    goto_if 1, EventScript_163218
    setflag FLAG_0x2BE
    release
    end

EventScript_16320F:: @ 816320F
    setflag FLAG_0x2BE
    goto EventScript_1A922D

EventScript_163217:: @ 8163217
    end

EventScript_163218:: @ 8163218
    setvar VAR_0x8004, 144
    goto EventScript_1A9236

EventScript_163222:: @ 8163222
    end

SeafoamIslands_B4F_EventScript_163223:: @ 8163223
    loadword 0, gUnknown_8179B36
    callstd 3
    end

SeafoamIslands_B4F_EventScript_16322C:: @ 816322C
    loadword 0, gUnknown_8179B65
    callstd 3
    end
