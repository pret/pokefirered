FuchsiaCity_Gym_MapScripts:: @ 816D54D
    .byte 0

FuchsiaCity_Gym_EventScript_16D54E:: @ 816D54E
    setvar VAR_0x8004, 6
    setvar VAR_0x8005, 2
    special UpdatePickStateFromSpecialVar8005
    trainerbattle 1, 418, 0, Text_19832E, Text_198444, EventScript_16D580
    checkflag FLAG_0x259
    goto_if 0, EventScript_16D5A6
    loadword 0, gUnknown_8198481
    callstd 4
    release
    end

EventScript_16D580:: @ 816D580
    setvar VAR_0x8004, 6
    setvar VAR_0x8005, 1
    special SetFlavorTextFlagFromSpecialVars
    clearflag FLAG_0x09F
    setflag FLAG_0x4B4
    setflag FLAG_UNK824
    setvar VAR_0x8008, 5
    call EventScript_1A6B18
    goto EventScript_16D5A6
    end

EventScript_16D5A6:: @ 816D5A6
    loadword 0, gUnknown_819850E
    callstd 4
    checkitemspace ITEM_TM06, 1
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16D5E7
    additem ITEM_TM06, 1
    loadword 0, gUnknown_819858F
    setorcopyvar VAR_0x8000, 294
    setorcopyvar VAR_0x8001, 1
    setorcopyvar VAR_0x8002, 257
    callstd 9
    setflag FLAG_0x259
    loadword 0, gUnknown_81985AB
    callstd 4
    release
    end

EventScript_16D5E7:: @ 816D5E7
    loadword 0, gUnknown_819860D
    callstd 4
    release
    end

FuchsiaCity_Gym_EventScript_16D5F1:: @ 816D5F1
    trainerbattle 0, 294, 0, Text_198866, Text_1988B6
    loadword 0, gUnknown_81988CB
    callstd 6
    end

FuchsiaCity_Gym_EventScript_16D608:: @ 816D608
    trainerbattle 0, 295, 0, Text_19891F, Text_19897F
    loadword 0, gUnknown_8198985
    callstd 6
    end

FuchsiaCity_Gym_EventScript_16D61F:: @ 816D61F
    trainerbattle 0, 288, 0, Text_19871E, Text_198779
    setvar VAR_0x8004, 6
    setvar VAR_0x8005, 2
    special SetFlavorTextFlagFromSpecialVars
    loadword 0, gUnknown_8198787
    callstd 6
    end

FuchsiaCity_Gym_EventScript_16D643:: @ 816D643
    trainerbattle 0, 289, 0, Text_1989A1, Text_1989EA
    loadword 0, gUnknown_8198A10
    callstd 6
    end

FuchsiaCity_Gym_EventScript_16D65A:: @ 816D65A
    trainerbattle 0, 292, 0, Text_198629, Text_1986B4
    loadword 0, gUnknown_81986C9
    callstd 6
    end

FuchsiaCity_Gym_EventScript_16D671:: @ 816D671
    trainerbattle 0, 293, 0, Text_1987E8, Text_198812
    loadword 0, gUnknown_8198825
    callstd 6
    end

FuchsiaCity_Gym_EventScript_16D688:: @ 816D688
    lock
    faceplayer
    checkflag FLAG_0x4B4
    goto_if 1, EventScript_16D69D
    loadword 0, gUnknown_8198A5E
    callstd 4
    release
    end

EventScript_16D69D:: @ 816D69D
    loadword 0, gUnknown_8198B1D
    callstd 4
    release
    end

FuchsiaCity_Gym_EventScript_16D6A7:: @ 816D6A7
    lockall
    checkflag FLAG_UNK824
    goto_if 1, EventScript_16D6BB
    loadword 0, gUnknown_8198B4B
    callstd 4
    releaseall
    end

EventScript_16D6BB:: @ 816D6BB
    loadword 0, gUnknown_8198B81
    callstd 4
    releaseall
    end
