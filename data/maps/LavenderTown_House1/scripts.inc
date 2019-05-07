LavenderTown_House1_MapScripts:: @ 816B232
    .byte 0

LavenderTown_House1_EventScript_16B233:: @ 816B233
    lock
    faceplayer
    checkflag FLAG_0x23C
    goto_if 1, EventScript_16B248
    loadword 0, gUnknown_819397D
    callstd 4
    release
    end

EventScript_16B248:: @ 816B248
    loadword 0, gUnknown_81939F8
    callstd 4
    release
    end

LavenderTown_House1_EventScript_16B252:: @ 816B252
    lock
    faceplayer
    waitse
    playmoncry SPECIES_CUBONE, 0
    loadword 0, gUnknown_819396B
    callstd 4
    waitmoncry
    release
    end
