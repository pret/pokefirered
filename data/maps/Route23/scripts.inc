Route23_MapScripts:: @ 81684EB
    map_script 3, Route23_MapScript1_1684F1
    .byte 0

Route23_MapScript1_1684F1:: @ 81684F1
    clearflag FLAG_0x059
    setflag FLAG_0x058
    setvar VAR_0x4064, 0
    setvar VAR_0x4065, 0
    setvar VAR_0x4066, 0
    setvar VAR_0x4067, 0
    end

Route23_EventScript_16850C:: @ 816850C
    lock
    faceplayer
    setvar VAR_0x4001, 2
    getstdstring 0, 16
    goto EventScript_1A786C
    end

Route23_EventScript_16851D:: @ 816851D
    lock
    faceplayer
    setvar VAR_0x4001, 3
    getstdstring 0, 17
    goto EventScript_1A786C
    end

Route23_EventScript_16852E:: @ 816852E
    lock
    faceplayer
    setvar VAR_0x4001, 4
    getstdstring 0, 18
    goto EventScript_1A786C
    end

Route23_EventScript_16853F:: @ 816853F
    lock
    faceplayer
    setvar VAR_0x4001, 5
    getstdstring 0, 19
    goto EventScript_1A786C
    end

Route23_EventScript_168550:: @ 8168550
    lock
    faceplayer
    setvar VAR_0x4001, 6
    getstdstring 0, 20
    goto EventScript_1A786C
    end

Route23_EventScript_168561:: @ 8168561
    lock
    faceplayer
    setvar VAR_0x4001, 7
    getstdstring 0, 21
    goto EventScript_1A786C
    end

Route23_EventScript_168572:: @ 8168572
    lock
    faceplayer
    setvar VAR_0x4001, 8
    getstdstring 0, 22
    goto EventScript_1A786C
    end

Route23_EventScript_168583:: @ 8168583
    lockall
    setvar VAR_0x4001, 2
    setvar VAR_0x8009, 1
    getstdstring 0, 16
    goto EventScript_1A796E
    end

Route23_EventScript_168598:: @ 8168598
    lockall
    setvar VAR_0x4001, 3
    setvar VAR_0x8009, 2
    getstdstring 0, 17
    goto EventScript_1A796E
    end

Route23_EventScript_1685AD:: @ 81685AD
    lockall
    setvar VAR_0x4001, 4
    setvar VAR_0x8009, 3
    getstdstring 0, 18
    goto EventScript_1A796E
    end

Route23_EventScript_1685C2:: @ 81685C2
    lockall
    setvar VAR_0x4001, 5
    setvar VAR_0x8009, 4
    getstdstring 0, 19
    goto EventScript_1A796E
    end

Route23_EventScript_1685D7:: @ 81685D7
    lockall
    setvar VAR_0x4001, 6
    setvar VAR_0x8009, 5
    getstdstring 0, 20
    goto EventScript_1A796E
    end

Route23_EventScript_1685EC:: @ 81685EC
    lockall
    setvar VAR_0x4001, 7
    setvar VAR_0x8009, 6
    getstdstring 0, 21
    goto EventScript_1A796E
    end

Route23_EventScript_168601:: @ 8168601
    lockall
    setvar VAR_0x4001, 8
    setvar VAR_0x8009, 7
    getstdstring 0, 22
    goto EventScript_1A796E
    end

Route23_EventScript_168616:: @ 8168616
    loadword 0, gUnknown_8188C19
    callstd 3
    end
