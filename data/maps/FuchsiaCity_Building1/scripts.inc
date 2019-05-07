FuchsiaCity_Building1_MapScripts:: @ 816D74B
    .byte 0

FuchsiaCity_Building1_EventScript_16D74C:: @ 816D74C
    lock
    faceplayer
    checkflag FLAG_0x23A
    goto_if 1, EventScript_16D7FA
    checkflag FLAG_0x189
    goto_if 1, EventScript_16D780
    loadword 0, gUnknown_8198DF9
    callstd 5
    compare_var_to_value VAR_RESULT, 1
    call_if 1, EventScript_16D7E8
    compare_var_to_value VAR_RESULT, 0
    call_if 1, EventScript_16D7F1
    release
    end

EventScript_16D780:: @ 816D780
    textcolor 3
    playfanfare MUS_ME_WAZA
    message Text_198E84
    waitmessage
    waitfanfare
    loadword 0, gUnknown_8198EAA
    callstd 4
    call EventScript_1A6675
    checkplayergender
    compare_var_to_value VAR_RESULT, 0
    call_if 1, EventScript_16D7D6
    compare_var_to_value VAR_RESULT, 1
    call_if 1, EventScript_16D7DF
    additem ITEM_HM04, 1
    loadword 0, gUnknown_8199068
    setorcopyvar VAR_0x8000, 342
    setorcopyvar VAR_0x8001, 1
    setorcopyvar VAR_0x8002, 257
    callstd 9
    setflag FLAG_0x23A
    removeitem ITEM_GOLD_TEETH, 1
    release
    end

EventScript_16D7D6:: @ 816D7D6
    loadword 0, gUnknown_8198ECA
    callstd 4
    return

EventScript_16D7DF:: @ 816D7DF
    loadword 0, gUnknown_8198F96
    callstd 4
    return

EventScript_16D7E8:: @ 816D7E8
    loadword 0, gUnknown_8198E3F
    callstd 4
    return

EventScript_16D7F1:: @ 816D7F1
    loadword 0, gUnknown_8198E63
    callstd 4
    return

EventScript_16D7FA:: @ 816D7FA
    loadword 0, gUnknown_819908A
    callstd 4
    release
    end

FuchsiaCity_Building1_EventScript_16D804:: @ 816D804
    loadword 0, gUnknown_819913C
    callstd 3
    end

FuchsiaCity_Building1_EventScript_16D80D:: @ 816D80D
    loadword 0, gUnknown_8199167
    callstd 3
    end
