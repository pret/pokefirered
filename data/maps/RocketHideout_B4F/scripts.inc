RocketHideout_B4F_MapScripts:: @ 81612E8
    map_script 1, RocketHideout_B4F_MapScript1_1612EE
    .byte 0

RocketHideout_B4F_MapScript1_1612EE:: @ 81612EE
    setvar VAR_0x4001, 0
    checktrainerflag 366
    call_if 1, EventScript_161311
    checktrainerflag 367
    call_if 1, EventScript_161311
    compare_var_to_value VAR_0x4001, 2
    call_if 5, EventScript_16146A
    end

EventScript_161311:: @ 8161311
    addvar VAR_0x4001, 1
    return

RocketHideout_B4F_EventScript_161317:: @ 8161317
    lock
    faceplayer
    setvar VAR_0x8004, 15
    setvar VAR_0x8005, 0
    special SetFlavorTextFlagFromSpecialVars
    message Text_175226
    waitmessage
    playbgm BGM_FRLG_SUSPICIOUS_EYE, 0
    waitbuttonpress
    trainerbattle 3, 348, 0, Text_175318
    loadword 0, gUnknown_817532D
    callstd 4
    fadescreen 1
    closemessage
    removeobject 1
    addobject 2
    clearflag FLAG_0x037
    setflag FLAG_0x05F
    setvar VAR_0x8004, 15
    setvar VAR_0x8005, 2
    special UpdatePickStateFromSpecialVar8005
    fadescreen 0
    release
    end

RocketHideout_B4F_EventScript_161363:: @ 8161363
    lock
    faceplayer
    removeobject 2
    setorcopyvar VAR_0x8000, 359
    setorcopyvar VAR_0x8001, 1
    callstd 0
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_1A6BF9
    release
    end

RocketHideout_B4F_EventScript_161381:: @ 8161381
    trainerbattle 2, 368, 0, Text_175488, Text_1754B9, EventScript_16139D
    loadword 0, gUnknown_81754BD
    callstd 4
    release
    end

EventScript_16139D:: @ 816139D
    loadword 0, gUnknown_81754BD
    callstd 4
    addobject 4
    clearflag FLAG_0x036
    release
    end

RocketHideout_B4F_EventScript_1613AD:: @ 81613AD
    lock
    faceplayer
    setflag FLAG_0x2A5
    removeobject 4
    setorcopyvar VAR_0x8000, 356
    setorcopyvar VAR_0x8001, 1
    callstd 0
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_1A6BF9
    release
    end

RocketHideout_B4F_EventScript_1613CE:: @ 81613CE
    trainerbattle 2, 366, 0, Text_1753D0, Text_1753FE, EventScript_1613E9
    loadword 0, gUnknown_817540C
    callstd 6
    end

EventScript_1613E9:: @ 81613E9
    setvar VAR_0x4001, 0
    checktrainerflag 366
    call_if 1, EventScript_161311
    checktrainerflag 367
    call_if 1, EventScript_161311
    compare_var_to_value VAR_0x4001, 2
    call_if 1, EventScript_1614A1
    compare_var_to_value VAR_0x4001, 2
    call_if 1, EventScript_161462
    release
    end

RocketHideout_B4F_EventScript_161418:: @ 8161418
    trainerbattle 2, 367, 0, Text_175437, Text_175463, EventScript_161433
    loadword 0, gUnknown_817546A
    callstd 6
    end

EventScript_161433:: @ 8161433
    setvar VAR_0x4001, 0
    checktrainerflag 366
    call_if 1, EventScript_161311
    checktrainerflag 367
    call_if 1, EventScript_161311
    compare_var_to_value VAR_0x4001, 2
    call_if 1, EventScript_1614A1
    compare_var_to_value VAR_0x4001, 2
    call_if 1, EventScript_161462
    release
    end

EventScript_161462:: @ 8161462
    playse SE_FU_ZAKU2
    special DrawWholeMapView
    waitse
    return

EventScript_16146A:: @ 816146A
    setmetatile 17, 12, 718, 1
    setmetatile 18, 12, 719, 1
    setmetatile 17, 13, 726, 1
    setmetatile 18, 13, 727, 1
    setmetatile 17, 14, 642, 0
    setmetatile 18, 14, 642, 0
    return

EventScript_1614A1:: @ 81614A1
    setmetatile 17, 12, 642, 0
    setmetatile 18, 12, 641, 0
    setmetatile 17, 13, 642, 0
    setmetatile 18, 13, 641, 0
    setmetatile 17, 14, 642, 0
    setmetatile 18, 14, 641, 0
    return
