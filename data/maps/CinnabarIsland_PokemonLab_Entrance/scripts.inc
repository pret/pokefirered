CinnabarIsland_PokemonLab_Entrance_MapScripts:: @ 816E273
    map_script 3, CinnabarIsland_PokemonLab_Entrance_MapScript1_16E279
    .byte 0

CinnabarIsland_PokemonLab_Entrance_MapScript1_16E279:: @ 816E279
    compare_var_to_value VAR_0x406A, 1
    call_if 1, EventScript_16E285
    end

EventScript_16E285:: @ 816E285
    setvar VAR_0x406A, 2
    return

CinnabarIsland_PokemonLab_Entrance_EventScript_16E28B:: @ 816E28B
    loadword 0, gUnknown_8199EE5
    callstd 2
    end

CinnabarIsland_PokemonLab_Entrance_EventScript_16E294:: @ 816E294
    loadword 0, gUnknown_8199F41
    callstd 3
    end

CinnabarIsland_PokemonLab_Entrance_EventScript_16E29D:: @ 816E29D
    loadword 0, gUnknown_8199F6A
    callstd 3
    end

CinnabarIsland_PokemonLab_Entrance_EventScript_16E2A6:: @ 816E2A6
    loadword 0, gUnknown_8199F83
    callstd 3
    end

CinnabarIsland_PokemonLab_Entrance_EventScript_16E2AF:: @ 816E2AF
    loadword 0, gUnknown_8199F9A
    callstd 3
    end
