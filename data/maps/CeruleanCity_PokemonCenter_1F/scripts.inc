CeruleanCity_PokemonCenter_1F_MapScripts:: @ 816AA2D
    map_script 3, CeruleanCity_PokemonCenter_1F_MapScript1_16AA38
    map_script 5, CeruleanCity_PokemonCenter_1F_MapScript2_1BC05C
    .byte 0

CeruleanCity_PokemonCenter_1F_MapScript1_16AA38:: @ 816AA38
    setrespawn 4
    end

CeruleanCity_PokemonCenter_1F_EventScript_16AA3C:: @ 816AA3C
    lock
    faceplayer
    call EventScript_1A6578
    release
    end

CeruleanCity_PokemonCenter_1F_EventScript_16AA45:: @ 816AA45
    loadword 0, gUnknown_8192079
    callstd 2
    end

CeruleanCity_PokemonCenter_1F_EventScript_16AA4E:: @ 816AA4E
    loadword 0, gUnknown_8191FFB
    callstd 2
    end

CeruleanCity_PokemonCenter_1F_EventScript_16AA57:: @ 816AA57
    lock
    faceplayer
    setvar VAR_0x8004, 13
    setvar VAR_0x8005, 1
    special SetFlavorTextFlagFromSpecialVars
    loadword 0, gUnknown_8192116
    callstd 4
    release
    end

CeruleanCity_PokemonCenter_1F_EventScript_16AA70:: @ 816AA70
    loadword 0, gUnknown_819214C
    callstd 2
    end
