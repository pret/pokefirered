CeladonCity_Condominiums_1F_MapScripts:: @ 816C320
    .byte 0

CeladonCity_Condominiums_1F_EventScript_16C321:: @ 816C321
    lock
    faceplayer
    checkflag FLAG_0x2F8
    goto_if 1, EventScript_16C36A
    checkflag 2092
    goto_if 1, EventScript_16C374
    checkflag FLAG_0x2A6
    goto_if 1, EventScript_16C36A
    loadword 0, gUnknown_81960C9
    callstd 4
    setflag FLAG_0x2A6
    setorcopyvar VAR_0x8000, 369
    setorcopyvar VAR_0x8001, 1
    callstd 0
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_1A6BF9
    loadword 0, gUnknown_8196109
    callstd 4
    release
    end

EventScript_16C36A:: @ 816C36A
    loadword 0, gUnknown_8196148
    callstd 4
    release
    end

EventScript_16C374:: @ 816C374
    setvar VAR_0x8004, 1
    setvar VAR_0x8005, 4
    special SetFlavorTextFlagFromSpecialVars
    setflag FLAG_0x2F8
    loadword 0, gUnknown_8196188
    callstd 4
    release
    end

CeladonCity_Condominiums_1F_EventScript_16C38E:: @ 816C38E
    lock
    faceplayer
    waitse
    playmoncry SPECIES_MEOWTH, 0
    loadword 0, gUnknown_81960BB
    callstd 4
    waitmoncry
    release
    end

CeladonCity_Condominiums_1F_EventScript_16C3A1:: @ 816C3A1
    lock
    faceplayer
    waitse
    playmoncry SPECIES_CLEFAIRY, 0
    loadword 0, gUnknown_819625B
    callstd 4
    waitmoncry
    release
    end

CeladonCity_Condominiums_1F_EventScript_16C3B4:: @ 816C3B4
    lock
    faceplayer
    waitse
    playmoncry SPECIES_NIDORAN_F, 0
    loadword 0, gUnknown_8196272
    callstd 4
    waitmoncry
    release
    end

CeladonCity_Condominiums_1F_EventScript_16C3C7:: @ 816C3C7
    loadword 0, gUnknown_8196287
    callstd 3
    end
