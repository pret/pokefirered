SaffronCity_Duplicate_MapScripts:: @ 816735F
    map_script 3, SaffronCity_Duplicate_MapScript1_167365
    .byte 0

SaffronCity_Duplicate_MapScript1_167365:: @ 8167365
    setworldmapflag 2202
    checkflag FLAG_0x23C
    call_if 0, EventScript_167372
    end

EventScript_167372:: @ 8167372
    setobjectxyperm 6, 33, 31
    return

SaffronCity_Duplicate_EventScript_16737A:: @ 816737A
    loadword 0, gUnknown_8181003
    callstd 2
    end

SaffronCity_Duplicate_EventScript_167383:: @ 8167383
    loadword 0, gUnknown_818101F
    callstd 2
    end

SaffronCity_Duplicate_EventScript_16738C:: @ 816738C
    loadword 0, gUnknown_818105A
    callstd 2
    end

SaffronCity_Duplicate_EventScript_167395:: @ 8167395
    loadword 0, gUnknown_8181087
    callstd 2
    end

SaffronCity_Duplicate_EventScript_16739E:: @ 816739E
    loadword 0, gUnknown_81810A7
    callstd 2
    end

SaffronCity_Duplicate_EventScript_1673A7:: @ 81673A7
    loadword 0, gUnknown_81810D5
    callstd 2
    end

SaffronCity_Duplicate_EventScript_1673B0:: @ 81673B0
    loadword 0, gUnknown_81810F5
    callstd 2
    end

SaffronCity_Duplicate_EventScript_1673B9:: @ 81673B9
    lock
    checkflag FLAG_0x23C
    goto_if 1, EventScript_1673D7
    applymovement 6, Movement_1A75E1
    waitmovement 0
    loadword 0, gUnknown_81812CA
    callstd 4
    release
    end

EventScript_1673D7:: @ 81673D7
    textcolor 3
    loadword 0, gUnknown_8181302
    callstd 4
    release
    end

SaffronCity_Duplicate_EventScript_1673E3:: @ 81673E3
    loadword 0, gUnknown_8181159
    callstd 2
    end

SaffronCity_Duplicate_EventScript_1673EC:: @ 81673EC
    loadword 0, gUnknown_8181189
    callstd 2
    end

SaffronCity_Duplicate_EventScript_1673F5:: @ 81673F5
    loadword 0, gUnknown_81811BF
    callstd 2
    end

SaffronCity_Duplicate_EventScript_1673FE:: @ 81673FE
    loadword 0, gUnknown_8181225
    callstd 2
    end

SaffronCity_Duplicate_EventScript_167407:: @ 8167407
    lock
    faceplayer
    waitse
    playmoncry SPECIES_PIDGEOT, 0
    loadword 0, gUnknown_8181286
    callstd 4
    waitmoncry
    release
    end

SaffronCity_Duplicate_EventScript_16741A:: @ 816741A
    loadword 0, gUnknown_8181299
    callstd 2
    end

SaffronCity_Duplicate_EventScript_167423:: @ 8167423
    loadword 0, gUnknown_8181326
    callstd 3
    end

SaffronCity_Duplicate_EventScript_16742C:: @ 816742C
    loadword 0, gUnknown_8181354
    callstd 3
    end

SaffronCity_Duplicate_EventScript_167435:: @ 8167435
    lockall
    setvar VAR_0x8004, 7
    setvar VAR_0x8005, 0
    special SetFlavorTextFlagFromSpecialVars
    loadword 0, gUnknown_8181362
    callstd 4
    releaseall
    end

SaffronCity_Duplicate_EventScript_16744D:: @ 816744D
    loadword 0, gUnknown_81813AA
    callstd 3
    end

SaffronCity_Duplicate_EventScript_167456:: @ 8167456
    loadword 0, gUnknown_8181452
    callstd 3
    end

SaffronCity_Duplicate_EventScript_16745F:: @ 816745F
    loadword 0, gUnknown_81814B9
    callstd 3
    end

SaffronCity_Duplicate_EventScript_167468:: @ 8167468
    loadword 0, gUnknown_81814D3
    callstd 3
    end

SaffronCity_Duplicate_EventScript_167471:: @ 8167471
    loadword 0, gUnknown_81814E7
    callstd 3
    end

SaffronCity_Duplicate_EventScript_16747A:: @ 816747A
    loadword 0, gUnknown_8181519
    callstd 3
    end
