Route16_NorthEntrance_2F_MapScripts:: @ 81702BE
    .byte 0

Route16_NorthEntrance_2F_EventScript_1702BF:: @ 81702BF
    loadword 0, gUnknown_819FA07
    callstd 2
    end

Route16_NorthEntrance_2F_EventScript_1702C8:: @ 81702C8
    loadword 0, gUnknown_819FA41
    callstd 2
    end

Route16_NorthEntrance_2F_EventScript_1702D1:: @ 81702D1
    loadword 0, gUnknown_819FA6F
    callstd 3
    end

Route16_NorthEntrance_2F_EventScript_1702DA:: @ 81702DA
    loadword 0, gUnknown_819FAB9
    callstd 3
    end

Route16_NorthEntrance_2F_EventScript_1702E3:: @ 81702E3
    lock
    faceplayer
    call EventScript_17036F
    checkflag FLAG_0x2FD
    goto_if 1, EventScript_170365
    loadword 0, gUnknown_819FB0E
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_1A7AD1
    setvar VAR_0x8004, 0
    specialvar VAR_RESULT, sub_80CA3D8
    getnumberstring 2, VAR_0x8006
    call EventScript_17036F
    compare_var_to_value VAR_0x8006, 40
    goto_if 0, EventScript_1A7ABD
    loadword 0, gUnknown_819FC15
    callstd 4
    checkitemspace ITEM_AMULET_COIN, 1
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_1A7AC7
    additem ITEM_AMULET_COIN, 1
    loadword 0, gUnknown_819FC68
    setorcopyvar VAR_0x8000, 189
    setorcopyvar VAR_0x8001, 1
    setorcopyvar VAR_0x8002, 257
    callstd 9
    setflag FLAG_0x2FD
    loadword 0, gUnknown_819FC93
    callstd 4
    release
    end

EventScript_170365:: @ 8170365
    loadword 0, gUnknown_819FC93
    callstd 4
    release
    end

EventScript_17036F:: @ 817036F
    getnumberstring 0, 40
    getitemname 1, ITEM_AMULET_COIN
    return
