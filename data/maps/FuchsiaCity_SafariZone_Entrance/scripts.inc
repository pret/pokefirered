FuchsiaCity_SafariZone_Entrance_MapScripts:: @ 816D2A8
    map_script 2, FuchsiaCity_SafariZone_Entrance_MapScript1_16D2AE
    .byte 0

FuchsiaCity_SafariZone_Entrance_MapScript1_16D2AE:: @ 816D2AE
    map_script_2 VAR_0x406E, 1, EventScript_16D2F2
    map_script_2 VAR_0x406E, 2, EventScript_16D312
    map_script_2 VAR_0x406E, 3, EventScript_16D2C8
    .2byte 0

EventScript_16D2C8:: @ 816D2C8
    lockall
    textcolor 0
    applymovement 255, Movement_16D36A
    waitmovement 0
    loadword 0, gUnknown_8197E85
    callstd 4
    closemessage
    applymovement 255, Movement_16D367
    waitmovement 0
    special sub_80A0EEC
    setvar VAR_0x406E, 0
    releaseall
    end

EventScript_16D2F2:: @ 816D2F2
    lockall
    textcolor 0
    loadword 0, gUnknown_8197E85
    callstd 4
    closemessage
    applymovement 255, Movement_16D362
    waitmovement 0
    special sub_80A0EEC
    setvar VAR_0x406E, 0
    releaseall
    end

EventScript_16D312:: @ 816D312
    lockall
    textcolor 0
    loadword 0, gUnknown_8197E1A
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16D345
    loadword 0, gUnknown_8197E48
    callstd 4
    closemessage
    applymovement 255, Movement_16D362
    waitmovement 0
    special sub_80A0EEC
    setvar VAR_0x406E, 0
    releaseall
    end

EventScript_16D345:: @ 816D345
    loadword 0, gUnknown_8197E7A
    callstd 4
    closemessage
    applymovement 255, Movement_16D365
    waitmovement 0
    warp MAP_SAFARIZONE_CENTER, 255, 26, 30
    waitstate
    end

Movement_16D362:: @ 816D362
    step_10
    step_10
    step_end

Movement_16D365:: @ 816D365
    step_11
    step_end

Movement_16D367:: @ 816D367
    step_10
    step_10
    step_end

Movement_16D36A:: @ 816D36A
    step_10
    step_1b
    step_end

FuchsiaCity_SafariZone_Entrance_EventScript_16D36D:: @ 816D36D
    lockall
    setvar VAR_0x4002, 0
    goto EventScript_16D391
    end

FuchsiaCity_SafariZone_Entrance_EventScript_16D379:: @ 816D379
    lockall
    setvar VAR_0x4002, 1
    goto EventScript_16D391
    end

FuchsiaCity_SafariZone_Entrance_EventScript_16D385:: @ 816D385
    lockall
    setvar VAR_0x4002, 2
    goto EventScript_16D391
    end

EventScript_16D391:: @ 816D391
    textcolor 0
    loadword 0, gUnknown_8197C6B
    callstd 4
    applymovement 255, Movement_1A75EB
    waitmovement 0
    showmoneybox 0, 0, 0
    loadword 0, gUnknown_8197C87
    callstd 5
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_16D3CA
    loadword 0, gUnknown_8197DE9
    callstd 4
    goto EventScript_16D49A
    end

EventScript_16D3CA:: @ 816D3CA
    call EventScript_16D462
    checkmoney 500, 0
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16D48C
    takemoney 500, 0
    updatemoneybox 0, 0, 0
    loadword 0, gUnknown_8197D07
    callstd 4
    textcolor 3
    playfanfare MUS_FANFA1
    message Text_197D50
    waitfanfare
    call EventScript_1A6675
    loadword 0, gUnknown_8197D80
    callstd 4
    closemessage
    hidemoneybox
    .byte 0
    .byte 0
    compare_var_to_value VAR_0x4002, 0
    call_if 1, EventScript_16D44C
    compare_var_to_value VAR_0x4002, 1
    call_if 1, EventScript_16D441
    compare_var_to_value VAR_0x4002, 2
    call_if 1, EventScript_16D457
    special sub_80A0EC4
    setvar VAR_0x406E, 2
    warp MAP_SAFARIZONE_CENTER, 255, 26, 30
    waitstate
    end

EventScript_16D441:: @ 816D441
    applymovement 255, Movement_16D4AF
    waitmovement 0
    return

EventScript_16D44C:: @ 816D44C
    applymovement 255, Movement_16D4AC
    waitmovement 0
    return

EventScript_16D457:: @ 816D457
    applymovement 255, Movement_16D4B3
    waitmovement 0
    return

EventScript_16D462:: @ 816D462
    countpokemon
    compare_var_to_value VAR_RESULT, 6
    goto_if 5, EventScript_1A77A9
    specialvar VAR_RESULT, sub_80CABD0
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_1A77A9
    loadword 0, gUnknown_81BFEAC
    callstd 4
    goto EventScript_16D49A
    end

EventScript_16D48C:: @ 816D48C
    loadword 0, gUnknown_8197E02
    callstd 4
    goto EventScript_16D49A
    end

EventScript_16D49A:: @ 816D49A
    closemessage
    hidemoneybox
    .byte 0
    .byte 0
    applymovement 255, Movement_16D4AA
    waitmovement 0
    releaseall
    end

Movement_16D4AA:: @ 816D4AA
    step_10
    step_end

Movement_16D4AC:: @ 816D4AC
    step_11
    step_11
    step_end

Movement_16D4AF:: @ 816D4AF
    step_11
    step_12
    step_11
    step_end

Movement_16D4B3:: @ 816D4B3
    step_11
    step_13
    step_11
    step_end

FuchsiaCity_SafariZone_Entrance_EventScript_16D4B7:: @ 816D4B7
    lock
    faceplayer
    loadword 0, gUnknown_8197EB0
    callstd 5
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_16D4D6
    loadword 0, gUnknown_819809E
    callstd 4
    release
    end

EventScript_16D4D6:: @ 816D4D6
    loadword 0, gUnknown_8197EE3
    callstd 4
    release
    end
