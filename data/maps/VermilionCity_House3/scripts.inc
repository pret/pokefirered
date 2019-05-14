VermilionCity_House3_MapScripts:: @ 816BAA9
    .byte 0

VermilionCity_House3_EventScript_16BAAA:: @ 816BAAA
    loadword 0, gUnknown_81953AF
    callstd 2
    end

VermilionCity_House3_EventScript_16BAB3:: @ 816BAB3
    loadword 0, gUnknown_8195471
    callstd 2
    end

VermilionCity_House3_EventScript_16BABC:: @ 816BABC
    lock
    faceplayer
    waitse
    playmoncry SPECIES_PIDGEY, 0
    loadword 0, gUnknown_81953EE
    callstd 4
    waitmoncry
    release
    end

VermilionCity_House3_EventScript_16BACF:: @ 816BACF
    loadword 0, gUnknown_8195400
    callstd 3
    end
