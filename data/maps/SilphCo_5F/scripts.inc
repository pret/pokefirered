SilphCo_5F_MapScripts:: @ 81617BE
    map_script 1, SilphCo_5F_MapScript1_1617C4
    .byte 0

SilphCo_5F_MapScript1_1617C4:: @ 81617C4
    checkflag FLAG_0x280
    call_if 0, EventScript_1A826F
    checkflag FLAG_0x281
    call_if 0, EventScript_1A82A6
    checkflag FLAG_0x282
    call_if 0, EventScript_1A82DD
    end

SilphCo_5F_EventScript_1617E0:: @ 81617E0
    lock
    faceplayer
    compare_var_to_value VAR_0x4060, 1
    goto_if 4, EventScript_1617F7
    loadword 0, gUnknown_8175B70
    callstd 4
    release
    end

EventScript_1617F7:: @ 81617F7
    loadword 0, gUnknown_8175BB3
    callstd 4
    release
    end

SilphCo_5F_EventScript_161801:: @ 8161801
    loadword 0, gUnknown_8175D89
    callstd 3
    end

SilphCo_5F_EventScript_16180A:: @ 816180A
    loadword 0, gUnknown_8175DE0
    callstd 3
    end

SilphCo_5F_EventScript_161813:: @ 8161813
    loadword 0, gUnknown_8175E28
    callstd 3
    end

SilphCo_5F_EventScript_16181C:: @ 816181C
    loadword 0, gUnknown_8175E80
    callstd 3
    end

SilphCo_5F_EventScript_161825:: @ 8161825
    trainerbattle 0, 340, 0, Text_175C40, Text_175C6D
    loadword 0, gUnknown_8175C7D
    callstd 6
    end

SilphCo_5F_EventScript_16183C:: @ 816183C
    trainerbattle 0, 378, 0, Text_175BE5, Text_175C09
    loadword 0, gUnknown_8175C0F
    callstd 6
    end

SilphCo_5F_EventScript_161853:: @ 8161853
    trainerbattle 0, 379, 0, Text_175D28, Text_175D4B
    loadword 0, gUnknown_8175D59
    callstd 6
    end

SilphCo_5F_EventScript_16186A:: @ 816186A
    trainerbattle 0, 286, 0, Text_175CBD, Text_175CEB
    loadword 0, gUnknown_8175CF9
    callstd 6
    end
