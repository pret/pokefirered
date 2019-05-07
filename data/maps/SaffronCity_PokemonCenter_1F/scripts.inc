SaffronCity_PokemonCenter_1F_MapScripts:: @ 816EFEC
    map_script 3, SaffronCity_PokemonCenter_1F_MapScript1_16EFF7
    map_script 5, SaffronCity_PokemonCenter_1F_MapScript2_1BC05C
    .byte 0

SaffronCity_PokemonCenter_1F_MapScript1_16EFF7:: @ 816EFF7
    setrespawn 11
    end

SaffronCity_PokemonCenter_1F_EventScript_16EFFB:: @ 816EFFB
    lock
    faceplayer
    call EventScript_1A6578
    release
    end

SaffronCity_PokemonCenter_1F_EventScript_16F004:: @ 816F004
    loadword 0, gUnknown_819C058
    callstd 2
    end

SaffronCity_PokemonCenter_1F_EventScript_16F00D:: @ 816F00D
    loadword 0, gUnknown_819C023
    callstd 2
    end

SaffronCity_PokemonCenter_1F_EventScript_16F016:: @ 816F016
    lock
    faceplayer
    compare_var_to_value VAR_0x4060, 1
    goto_if 1, EventScript_16F02D
    loadword 0, gUnknown_819C0B4
    callstd 4
    release
    end

EventScript_16F02D:: @ 816F02D
    loadword 0, gUnknown_819C102
    callstd 4
    release
    end
