SilphCo_8F_MapScripts:: @ 8161C5F
    map_script 1, SilphCo_8F_MapScript1_161C65
    .byte 0

SilphCo_8F_MapScript1_161C65:: @ 8161C65
    checkflag FLAG_0x287
    call_if 0, EventScript_1A83D5
    end

SilphCo_8F_EventScript_161C6F:: @ 8161C6F
    lock
    faceplayer
    compare_var_to_value VAR_0x4060, 1
    goto_if 4, EventScript_161C86
    loadword 0, gUnknown_817696D
    callstd 4
    release
    end

EventScript_161C86:: @ 8161C86
    loadword 0, gUnknown_817698C
    callstd 4
    release
    end

SilphCo_8F_EventScript_161C90:: @ 8161C90
    loadword 0, gUnknown_8176AB2
    callstd 3
    end

SilphCo_8F_EventScript_161C99:: @ 8161C99
    trainerbattle 0, 343, 0, Text_1769FD, Text_176A19
    loadword 0, gUnknown_8176A26
    callstd 6
    end

SilphCo_8F_EventScript_161CB0:: @ 8161CB0
    trainerbattle 0, 382, 0, Text_1769A2, Text_1769BE
    loadword 0, gUnknown_81769CF
    callstd 6
    end

SilphCo_8F_EventScript_161CC7:: @ 8161CC7
    trainerbattle 0, 386, 0, Text_176A56, Text_176A7C
    loadword 0, gUnknown_8176A90
    callstd 6
    end
