ViridianCity_PokemonCenter_1F_MapScripts:: @ 816A2C0
    map_script 3, ViridianCity_PokemonCenter_1F_MapScript1_16A2CB
    map_script 5, ViridianCity_PokemonCenter_1F_MapScript2_1BC05C
    .byte 0

ViridianCity_PokemonCenter_1F_MapScript1_16A2CB:: @ 816A2CB
    setrespawn 2
    end

ViridianCity_PokemonCenter_1F_EventScript_16A2CF:: @ 816A2CF
    lock
    faceplayer
    call EventScript_1A6578
    release
    end

ViridianCity_PokemonCenter_1F_EventScript_16A2D8:: @ 816A2D8
    loadword 0, gUnknown_81903E5
    callstd 2
    end

ViridianCity_PokemonCenter_1F_EventScript_16A2E1:: @ 816A2E1
    loadword 0, gUnknown_8190384
    callstd 2
    end

ViridianCity_PokemonCenter_1F_EventScript_16A2EA:: @ 816A2EA
    loadword 0, gUnknown_8190450
    callstd 2
    end
