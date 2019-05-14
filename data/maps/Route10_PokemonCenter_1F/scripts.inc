Route10_PokemonCenter_1F_MapScripts:: @ 816FC2F
    map_script 3, Route10_PokemonCenter_1F_MapScript1_16FC3A
    map_script 5, Route10_PokemonCenter_1F_MapScript2_1BC05C
    .byte 0

Route10_PokemonCenter_1F_MapScript1_16FC3A:: @ 816FC3A
    setworldmapflag 2211
    setrespawn 13
    end

Route10_PokemonCenter_1F_EventScript_16FC41:: @ 816FC41
    lock
    faceplayer
    call EventScript_1A6578
    release
    end

Route10_PokemonCenter_1F_EventScript_16FC4A:: @ 816FC4A
    loadword 0, gUnknown_819E59D
    callstd 2
    end

Route10_PokemonCenter_1F_EventScript_16FC53:: @ 816FC53
    loadword 0, gUnknown_819E523
    callstd 2
    end

Route10_PokemonCenter_1F_EventScript_16FC5C:: @ 816FC5C
    loadword 0, gUnknown_819E5D2
    callstd 2
    end

Route10_PokemonCenter_1F_EventScript_16FC65:: @ 816FC65
    lock
    faceplayer
    call EventScript_16FCF1
    checkflag FLAG_0x2FA
    goto_if 1, EventScript_16FCE7
    loadword 0, gUnknown_819E5FB
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_1A7AD1
    setvar VAR_0x8004, 0
    specialvar VAR_RESULT, sub_80CA3D8
    getnumberstring 2, VAR_0x8006
    call EventScript_16FCF1
    compare_var_to_value VAR_0x8006, 20
    goto_if 0, EventScript_1A7ABD
    loadword 0, gUnknown_819E733
    callstd 4
    checkitemspace ITEM_EVERSTONE, 1
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_1A7AC7
    additem ITEM_EVERSTONE, 1
    loadword 0, gUnknown_819E786
    setorcopyvar VAR_0x8000, 195
    setorcopyvar VAR_0x8001, 1
    setorcopyvar VAR_0x8002, 257
    callstd 9
    setflag FLAG_0x2FA
    loadword 0, gUnknown_819E7AF
    callstd 4
    release
    end

EventScript_16FCE7:: @ 816FCE7
    loadword 0, gUnknown_819E7AF
    callstd 4
    release
    end

EventScript_16FCF1:: @ 816FCF1
    getnumberstring 0, 20
    getitemname 1, ITEM_EVERSTONE
    return
