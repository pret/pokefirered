CeruleanCity_Gym_MapScripts:: @ 816AAA0
    .byte 0

CeruleanCity_Gym_EventScript_16AAA1:: @ 816AAA1
    setvar VAR_0x8004, 3
    setvar VAR_0x8005, 2
    special UpdatePickStateFromSpecialVar8005
    trainerbattle 1, 415, 0, Text_1921EF, Text_19242D, EventScript_16AAD3
    checkflag FLAG_0x297
    goto_if 0, EventScript_16AAF9
    loadword 0, gUnknown_81922BF
    callstd 4
    release
    end

EventScript_16AAD3:: @ 816AAD3
    setvar VAR_0x8004, 3
    setvar VAR_0x8005, 1
    special SetFlavorTextFlagFromSpecialVars
    setflag FLAG_0x4B1
    setflag 2081
    setrespawn 4
    setvar VAR_0x8008, 2
    call EventScript_1A6B18
    goto EventScript_16AAF9
    end

EventScript_16AAF9:: @ 816AAF9
    loadword 0, gUnknown_81922F7
    callstd 4
    checkitemspace ITEM_TM03, 1
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16AB3A
    additem ITEM_TM03, 1
    loadword 0, gUnknown_81923F1
    setorcopyvar VAR_0x8000, 291
    setorcopyvar VAR_0x8001, 1
    setorcopyvar VAR_0x8002, 257
    callstd 9
    setflag FLAG_0x297
    loadword 0, gUnknown_81922BF
    callstd 4
    release
    end

EventScript_16AB3A:: @ 816AB3A
    loadword 0, gUnknown_819240E
    callstd 4
    release
    end

CeruleanCity_Gym_EventScript_16AB44:: @ 816AB44
    trainerbattle 0, 150, 0, Text_192481, Text_1924D0
    loadword 0, gUnknown_81924E4
    callstd 6
    end

CeruleanCity_Gym_EventScript_16AB5B:: @ 816AB5B
    trainerbattle 0, 234, 0, Text_192524, Text_192547
    setvar VAR_0x8004, 3
    setvar VAR_0x8005, 2
    special SetFlavorTextFlagFromSpecialVars
    loadword 0, gUnknown_8192556
    callstd 6
    end

CeruleanCity_Gym_EventScript_16AB7F:: @ 816AB7F
    lock
    faceplayer
    checkflag FLAG_0x4B1
    goto_if 1, EventScript_16AB94
    loadword 0, gUnknown_81925AC
    callstd 4
    release
    end

EventScript_16AB94:: @ 816AB94
    loadword 0, gUnknown_8192688
    callstd 4
    release
    end

CeruleanCity_Gym_EventScript_16AB9E:: @ 816AB9E
    lockall
    checkflag 2081
    goto_if 1, EventScript_16ABB2
    loadword 0, gUnknown_81926E1
    callstd 4
    releaseall
    end

EventScript_16ABB2:: @ 816ABB2
    loadword 0, gUnknown_8192719
    callstd 4
    releaseall
    end
