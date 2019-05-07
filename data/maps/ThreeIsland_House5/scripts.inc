ThreeIsland_House5_MapScripts:: @ 817191F
    .byte 0

ThreeIsland_House5_EventScript_171920:: @ 8171920
    lock
    faceplayer
    checkflag FLAG_0x2A3
    goto_if 1, EventScript_171935
    loadword 0, gUnknown_81A3469
    callstd 4
    release
    end

EventScript_171935:: @ 8171935
    loadword 0, gUnknown_81A34DB
    callstd 4
    release
    end
