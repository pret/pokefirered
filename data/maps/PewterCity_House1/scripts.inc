PewterCity_House1_MapScripts:: @ 816A71C
    .byte 0

PewterCity_House1_EventScript_16A71D:: @ 816A71D
    loadword 0, gUnknown_81915DB
    callstd 2
    end

PewterCity_House1_EventScript_16A726:: @ 816A726
    lock
    loadword 0, gUnknown_81915CD
    callstd 4
    call EventScript_16A749
    release
    end

PewterCity_House1_EventScript_16A736:: @ 816A736
    lock
    faceplayer
    call EventScript_16A749
    applymovement 3, Movement_1A75E5
    waitmovement 0
    release
    end

EventScript_16A749:: @ 816A749
    textcolor 3
    waitse
    playmoncry SPECIES_NIDORAN_M, 0
    loadword 0, gUnknown_81915BB
    callstd 4
    waitmoncry
    call EventScript_1A6675
    return
