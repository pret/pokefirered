TwoIsland_MapScripts:: @ 8167564
    map_script 3, TwoIsland_MapScript1_16756A
    .byte 0

TwoIsland_MapScript1_16756A:: @ 816756A
    setworldmapflag 2204
    setflag FLAG_0x2A2
    call EventScript_167576
    end

EventScript_167576:: @ 8167576
    checkflag 2116
    goto_if 1, EventScript_167597
    checkflag 2092
    goto_if 1, EventScript_1675B8
    checkflag FLAG_0x2A3
    goto_if 1, EventScript_1675D9
    goto EventScript_1675E8
    end

EventScript_167597:: @ 8167597
    checkflag FLAG_0x29D
    goto_if 0, EventScript_1675EE
    checkflag FLAG_0x29E
    goto_if 0, EventScript_1675F4
    checkflag FLAG_0x29F
    goto_if 0, EventScript_1675FD
    goto EventScript_167606
    end

EventScript_1675B8:: @ 81675B8
    checkflag FLAG_0x29D
    goto_if 0, EventScript_1675EE
    checkflag FLAG_0x2A3
    goto_if 0, EventScript_1675EE
    checkflag FLAG_0x29E
    goto_if 0, EventScript_1675F4
    goto EventScript_1675FD
    end

EventScript_1675D9:: @ 81675D9
    checkflag FLAG_0x29D
    goto_if 0, EventScript_1675EE
    goto EventScript_1675F4
    end

EventScript_1675E8:: @ 81675E8
    goto EventScript_1675EE
    end

EventScript_1675EE:: @ 81675EE
    setvar VAR_0x4078, 1
    return

EventScript_1675F4:: @ 81675F4
    setvar VAR_0x4078, 2
    clearflag FLAG_0x07B
    return

EventScript_1675FD:: @ 81675FD
    setvar VAR_0x4078, 3
    clearflag FLAG_0x07C
    return

EventScript_167606:: @ 8167606
    setvar VAR_0x4078, 4
    clearflag FLAG_0x07D
    return

TwoIsland_EventScript_16760F:: @ 816760F
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    lock
    faceplayer
    compare_var_to_value VAR_0x4078, 4
    goto_if 1, EventScript_167646
    compare_var_to_value VAR_0x4078, 3
    goto_if 1, EventScript_16765E
    compare_var_to_value VAR_0x4078, 2
    goto_if 1, EventScript_167676
    goto EventScript_16768E
    end

EventScript_167646:: @ 8167646
    checkflag FLAG_0x2A0
    goto_if 1, EventScript_1676A6
    setflag FLAG_0x2A0
    message Text_181CAE
    waitmessage
    goto EventScript_167728
    end

EventScript_16765E:: @ 816765E
    checkflag FLAG_0x29F
    goto_if 1, EventScript_1676A6
    setflag FLAG_0x29F
    message Text_181C77
    waitmessage
    goto EventScript_167708
    end

EventScript_167676:: @ 8167676
    checkflag FLAG_0x29E
    goto_if 1, EventScript_1676A6
    setflag FLAG_0x29E
    message Text_181B7C
    waitmessage
    goto EventScript_1676EC
    end

EventScript_16768E:: @ 816768E
    checkflag FLAG_0x29D
    goto_if 1, EventScript_1676A6
    setflag FLAG_0x29D
    message Text_181AFE
    waitmessage
    goto EventScript_1676D3
    end

EventScript_1676A6:: @ 81676A6
    message Text_1A6211
    waitmessage
    compare_var_to_value VAR_0x4078, 4
    goto_if 1, EventScript_167728
    compare_var_to_value VAR_0x4078, 3
    goto_if 1, EventScript_167708
    compare_var_to_value VAR_0x4078, 2
    goto_if 1, EventScript_1676EC
    goto EventScript_1676D3
    end

EventScript_1676D3:: @ 81676D3
    pokemart Items_1676E4
    loadword 0, gUnknown_81A5190
    callstd 4
    release
    end

    .align 2
Items_1676E4:: @ 81676E4
    .2byte ITEM_GREAT_BALL
    .2byte ITEM_FRESH_WATER
    .2byte ITEM_NONE
    release
    end

EventScript_1676EC:: @ 81676EC
    pokemart Items_1676FC
    loadword 0, gUnknown_81A5190
    callstd 4
    release
    end

    .align 2
Items_1676FC:: @ 81676FC
    .2byte ITEM_ULTRA_BALL
    .2byte ITEM_GREAT_BALL
    .2byte ITEM_SODA_POP
    .2byte ITEM_FRESH_WATER
    .2byte ITEM_NONE
    release
    end

EventScript_167708:: @ 8167708
    pokemart Items_167718
    loadword 0, gUnknown_81A5190
    callstd 4
    release
    end

    .align 2
Items_167718:: @ 8167718
    .2byte ITEM_ULTRA_BALL
    .2byte ITEM_GREAT_BALL
    .2byte ITEM_LEMONADE
    .2byte ITEM_SODA_POP
    .2byte ITEM_FRESH_WATER
    .2byte ITEM_MOOMOO_MILK
    .2byte ITEM_NONE
    release
    end

EventScript_167728:: @ 8167728
    pokemart Items_167738
    loadword 0, gUnknown_81A5190
    callstd 4
    release
    end

    .align 2
Items_167738:: @ 8167738
    .2byte ITEM_ULTRA_BALL
    .2byte ITEM_REPEAT_BALL
    .2byte ITEM_TIMER_BALL
    .2byte ITEM_LEMONADE
    .2byte ITEM_SODA_POP
    .2byte ITEM_FRESH_WATER
    .2byte ITEM_MOOMOO_MILK
    .2byte ITEM_LAVA_COOKIE
    .2byte ITEM_NONE
    release
    end

TwoIsland_EventScript_16774C:: @ 816774C
    loadword 0, gUnknown_8181D2F
    callstd 2
    end

TwoIsland_EventScript_167755:: @ 8167755
    loadword 0, gUnknown_8181DCA
    callstd 2
    end

TwoIsland_EventScript_16775E:: @ 816775E
    lock
    faceplayer
    setvar VAR_0x8004, 10
    setvar VAR_0x8005, 4
    special SetFlavorTextFlagFromSpecialVars
    loadword 0, gUnknown_8181E47
    callstd 4
    release
    end

TwoIsland_EventScript_167777:: @ 8167777
    loadword 0, gUnknown_8181F28
    callstd 2
    end

TwoIsland_EventScript_167780:: @ 8167780
    loadword 0, gUnknown_8181F5D
    callstd 2
    end

TwoIsland_EventScript_167789:: @ 8167789
    loadword 0, gUnknown_8181FCE
    callstd 2
    end

TwoIsland_EventScript_167792:: @ 8167792
    loadword 0, gUnknown_8181A88
    callstd 3
    end

TwoIsland_EventScript_16779B:: @ 816779B
    loadword 0, gUnknown_8181AA7
    callstd 3
    end

TwoIsland_EventScript_1677A4:: @ 81677A4
    loadword 0, gUnknown_8181AC8
    callstd 3
    end
