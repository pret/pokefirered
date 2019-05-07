SaffronCity_House2_MapScripts:: @ 816EF73
    .byte 0

SaffronCity_House2_EventScript_16EF74:: @ 816EF74
    loadword 0, gUnknown_819BE74
    callstd 2
    end

SaffronCity_House2_EventScript_16EF7D:: @ 816EF7D
    loadword 0, gUnknown_819BED5
    callstd 2
    end

SaffronCity_House2_EventScript_16EF86:: @ 816EF86
    lock
    faceplayer
    waitse
    playmoncry SPECIES_PIDGEY, 0
    loadword 0, gUnknown_819BEC3
    callstd 4
    waitmoncry
    release
    end

SaffronCity_House2_EventScript_16EF99:: @ 816EF99
    loadword 0, gUnknown_819BF07
    callstd 3
    end
