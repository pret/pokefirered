SaffronCity_Dojo_MapScripts:: @ 816EBDB
    .byte 0

SaffronCity_Dojo_EventScript_16EBDC:: @ 816EBDC
    lockall
    setvar VAR_0x4081, 1
    applymovement 5, Movement_1A75E7
    waitmovement 0
    releaseall
    end

SaffronCity_Dojo_EventScript_16EBEE:: @ 816EBEE
    lockall
    setvar VAR_0x4081, 1
    applymovement 5, Movement_1A75EB
    waitmovement 0
    releaseall
    end

SaffronCity_Dojo_EventScript_16EC00:: @ 816EC00
    lock
    faceplayer
    checkflag FLAG_0x278
    goto_if 1, EventScript_16EC3C
    drawmonpic SPECIES_HITMONLEE, 10, 3
    setvar VAR_0x4001, 106
    applymovement 5, Movement_1A75E9
    waitmovement 0
    textcolor 0
    loadword 0, gUnknown_819B44E
    callstd 5
    call EventScript_1A6675
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_16EC82
    erasemonpic
    release
    end

EventScript_16EC3C:: @ 816EC3C
    loadword 0, gUnknown_819B4E1
    callstd 4
    release
    end

SaffronCity_Dojo_EventScript_16EC46:: @ 816EC46
    lock
    faceplayer
    checkflag FLAG_0x278
    goto_if 1, EventScript_16EC3C
    drawmonpic SPECIES_HITMONCHAN, 10, 3
    setvar VAR_0x4001, 107
    applymovement 5, Movement_1A75E9
    waitmovement 0
    textcolor 0
    loadword 0, gUnknown_819B49E
    callstd 5
    call EventScript_1A6675
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_16EC82
    erasemonpic
    release
    end

EventScript_16EC82:: @ 816EC82
    erasemonpic
    givemon 16385, 25, ITEM_NONE, 0, 0, 0
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16ECB5
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_16ECEC
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A927C
    release
    end

EventScript_16ECB5:: @ 816ECB5
    removeobject VAR_LAST_TALKED
    getspeciesname 0, 16385
    playfanfare MUS_FANFA1
    message Text_19B473
    waitmessage
    waitfanfare
    setflag FLAG_0x278
    loadword 0, gUnknown_81A56A7
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16ED29
    call EventScript_1A8C27
    call EventScript_1A74EB
    goto EventScript_16ED29
    end

EventScript_16ECEC:: @ 816ECEC
    removeobject VAR_LAST_TALKED
    getspeciesname 0, 16385
    playfanfare MUS_FANFA1
    message Text_19B473
    waitmessage
    waitfanfare
    setflag FLAG_0x278
    loadword 0, gUnknown_81A56A7
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16ED1E
    call EventScript_1A8C33
    goto EventScript_16ED1E
    end

EventScript_16ED1E:: @ 816ED1E
    call EventScript_1A8C3C
    goto EventScript_16ED29
    end

EventScript_16ED29:: @ 816ED29
    release
    end

SaffronCity_Dojo_EventScript_16ED2B:: @ 816ED2B
    loadword 0, gUnknown_819B52E
    callstd 3
    end

SaffronCity_Dojo_EventScript_16ED34:: @ 816ED34
    loadword 0, gUnknown_819B4F8
    callstd 3
    end

SaffronCity_Dojo_EventScript_16ED3D:: @ 816ED3D
    loadword 0, gUnknown_819B50F
    callstd 3
    end

SaffronCity_Dojo_EventScript_16ED46:: @ 816ED46
    trainerbattle 0, 321, 0, Text_19B3DF, Text_19B40F
    loadword 0, gUnknown_819B41F
    callstd 6
    end

SaffronCity_Dojo_EventScript_16ED5D:: @ 816ED5D
    trainerbattle 0, 319, 0, Text_19B2E0, Text_19B2FD
    loadword 0, gUnknown_819B30F
    callstd 6
    end

SaffronCity_Dojo_EventScript_16ED74:: @ 816ED74
    trainerbattle 0, 320, 0, Text_19B341, Text_19B396
    loadword 0, gUnknown_819B3AC
    callstd 6
    end

SaffronCity_Dojo_EventScript_16ED8B:: @ 816ED8B
    trainerbattle 0, 318, 0, Text_19B275, Text_19B292
    loadword 0, gUnknown_819B29D
    callstd 6
    end

SaffronCity_Dojo_EventScript_16EDA2:: @ 816EDA2
    trainerbattle 2, 317, 0, Text_19B12C, Text_19B193, EventScript_16EDD0
    checkflag FLAG_0x278
    goto_if 1, EventScript_16EDC6
    loadword 0, gUnknown_819B1A7
    callstd 6
    end

EventScript_16EDC6:: @ 816EDC6
    loadword 0, gUnknown_819B24C
    callstd 4
    release
    end

EventScript_16EDD0:: @ 816EDD0
    setvar VAR_0x4081, 1
    release
    end
