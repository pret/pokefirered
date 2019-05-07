CeruleanCity_House3_MapScripts:: @ 816A9A7
    .byte 0

CeruleanCity_House3_EventScript_16A9A8:: @ 816A9A8
    loadword 0, gUnknown_8191F80
    callstd 2
    end

CeruleanCity_House3_EventScript_16A9B1:: @ 816A9B1
    lock
    faceplayer
    setvar VAR_0x8008, 1
    call EventScript_1A8CAD
    checkflag FLAG_0x24A
    goto_if 1, EventScript_16AA23
    loadword 0, gUnknown_81A59FE
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16AA0B
    call EventScript_1A8CBD
    compare_var_to_value VAR_0x8004, 6
    goto_if 4, EventScript_16AA0B
    call EventScript_1A8CC9
    compare_var_to_var VAR_RESULT, VAR_0x8009
    goto_if 5, EventScript_16AA15
    call EventScript_1A8CD9
    loadword 0, gUnknown_81A5A9D
    callstd 4
    setflag FLAG_0x24A
    release
    end

EventScript_16AA0B:: @ 816AA0B
    loadword 0, gUnknown_81A5A4E
    callstd 4
    release
    end

EventScript_16AA15:: @ 816AA15
    getspeciesname 0, 32777
    loadword 0, gUnknown_81A5A6A
    callstd 4
    release
    end

EventScript_16AA23:: @ 816AA23
    loadword 0, gUnknown_81A5AA5
    callstd 4
    release
    end
