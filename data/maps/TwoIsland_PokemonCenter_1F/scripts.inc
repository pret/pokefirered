TwoIsland_PokemonCenter_1F_MapScripts:: @ 81717B4
    map_script 3, TwoIsland_PokemonCenter_1F_MapScript1_1717BF
    map_script 5, TwoIsland_PokemonCenter_1F_MapScript2_1BC05C
    .byte 0

TwoIsland_PokemonCenter_1F_MapScript1_1717BF:: @ 81717BF
    setrespawn 15
    end

TwoIsland_PokemonCenter_1F_EventScript_1717C3:: @ 81717C3
    lock
    faceplayer
    call EventScript_1A6578
    release
    end

TwoIsland_PokemonCenter_1F_EventScript_1717CC:: @ 81717CC
    loadword 0, gUnknown_81A2E59
    callstd 2
    end

TwoIsland_PokemonCenter_1F_EventScript_1717D5:: @ 81717D5
    loadword 0, gUnknown_81A2EBE
    callstd 2
    end
