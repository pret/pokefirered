SaffronCity_House1_1F_MapScripts:: @ 816EB36
    .byte 0

SaffronCity_House1_1F_EventScript_16EB37:: @ 816EB37
    loadword 0, gUnknown_819AB9B
    callstd 2
    end

SaffronCity_House1_1F_EventScript_16EB40:: @ 816EB40
    loadword 0, gUnknown_819ABD7
    callstd 2
    end

SaffronCity_House1_1F_EventScript_16EB49:: @ 816EB49
    lock
    faceplayer
    waitse
    playmoncry SPECIES_CHANSEY, 0
    loadword 0, gUnknown_819AC4B
    callstd 4
    waitmoncry
    release
    end
