CeladonCity_GameCorner_PrizeRoom_MapScripts:: @ 816CB75
    .byte 0

CeladonCity_GameCorner_PrizeRoom_EventScript_16CB76:: @ 816CB76
    loadword 0, gUnknown_8196FC1
    callstd 2
    end

CeladonCity_GameCorner_PrizeRoom_EventScript_16CB7F:: @ 816CB7F
    loadword 0, gUnknown_8196FFF
    callstd 2
    end

CeladonCity_GameCorner_PrizeRoom_EventScript_16CB88:: @ 816CB88
    lock
    faceplayer
    checkflag FLAG_0x243
    goto_if 0, EventScript_16CD99
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    showcoinsbox 0, 0
    loadword 0, gUnknown_8197057
    callstd 4
    goto EventScript_16CBB2
    end

EventScript_16CBB2:: @ 816CBB2
    message Text_19707A
    waitmessage
    multichoice 11, 0, 14, 0
    copyvar VAR_0x8000, VAR_RESULT
    compare_var_to_value VAR_0x8000, 0
    goto_if 1, EventScript_16CC15
    compare_var_to_value VAR_0x8000, 1
    goto_if 1, EventScript_16CC25
    compare_var_to_value VAR_0x8000, 2
    goto_if 1, EventScript_16CC35
    compare_var_to_value VAR_0x8000, 3
    goto_if 1, EventScript_16CC45
    compare_var_to_value VAR_0x8000, 4
    goto_if 1, EventScript_16CC55
    compare_var_to_value VAR_0x8000, 5
    goto_if 1, EventScript_16CC10
    compare_var_to_value VAR_0x8000, 127
    goto_if 1, EventScript_16CC10
    end

EventScript_16CC10:: @ 816CC10
    hidecoinsbox 0, 0
    release
    end

EventScript_16CC15:: @ 816CC15
    setvar VAR_0x4001, 63
    setvar VAR_0x4002, 180
    goto EventScript_16CC65
    end

EventScript_16CC25:: @ 816CC25
    setvar VAR_0x4001, 35
    setvar VAR_0x4002, 500
    goto EventScript_16CC65
    end

EventScript_16CC35:: @ 816CC35
    setvar VAR_0x4001, 147
    setvar VAR_0x4002, 2800
    goto EventScript_16CC65
    end

EventScript_16CC45:: @ 816CC45
    setvar VAR_0x4001, 123
    setvar VAR_0x4002, 5500
    goto EventScript_16CC65
    end

EventScript_16CC55:: @ 816CC55
    setvar VAR_0x4001, 137
    setvar VAR_0x4002, 9999
    goto EventScript_16CC65
    end

EventScript_16CC65:: @ 816CC65
    getspeciesname 0, 16385
    loadword 0, gUnknown_819709D
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16CC10
    checkcoins VAR_RESULT
    compare_var_to_var VAR_RESULT, VAR_0x4002
    goto_if 0, EventScript_16CDA5
    textcolor 3
    copyvar VAR_0x8000, VAR_0x4001
    compare_var_to_value VAR_0x8000, 63
    goto_if 1, EventScript_16CCD4
    compare_var_to_value VAR_0x8000, 35
    goto_if 1, EventScript_16CCE9
    compare_var_to_value VAR_0x8000, 147
    goto_if 1, EventScript_16CCFE
    compare_var_to_value VAR_0x8000, 123
    goto_if 1, EventScript_16CD13
    compare_var_to_value VAR_0x8000, 137
    goto_if 1, EventScript_16CD28
    compare_var_to_value VAR_0x8000, 127
    goto_if 1, EventScript_16CD3D
    end

EventScript_16CCD4:: @ 816CCD4
    givemon 16385, 9, ITEM_NONE, 0, 0, 0
    goto EventScript_16CD52
    end

EventScript_16CCE9:: @ 816CCE9
    givemon 16385, 8, ITEM_NONE, 0, 0, 0
    goto EventScript_16CD52
    end

EventScript_16CCFE:: @ 816CCFE
    givemon 16385, 18, ITEM_NONE, 0, 0, 0
    goto EventScript_16CD52
    end

EventScript_16CD13:: @ 816CD13
    givemon 16385, 25, ITEM_NONE, 0, 0, 0
    goto EventScript_16CD52
    end

EventScript_16CD28:: @ 816CD28
    givemon 16385, 26, ITEM_NONE, 0, 0, 0
    goto EventScript_16CD52
    end

EventScript_16CD3D:: @ 816CD3D
    givemon 16385, 18, ITEM_NONE, 0, 0, 0
    goto EventScript_16CD52
    end

EventScript_16CD52:: @ 816CD52
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16CDB3
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_16CDE0
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_16CD74
    end

EventScript_16CD74:: @ 816CD74
    textcolor 3
    loadword 0, gUnknown_81A5E31
    callstd 4
    hidecoinsbox 0, 0
    release
    end

EventScript_16CD83:: @ 816CD83
    countpokemon
    subvar VAR_RESULT, 1
    copyvar VAR_0x8004, VAR_RESULT
    call EventScript_1A74EB
    goto EventScript_16CC10
    end

EventScript_16CD99:: @ 816CD99
    textcolor 3
    loadword 0, gUnknown_819703E
    callstd 4
    release
    end

EventScript_16CDA5:: @ 816CDA5
    loadword 0, gUnknown_81970D5
    callstd 4
    goto EventScript_16CC10
    end

EventScript_16CDB3:: @ 816CDB3
    takecoins VAR_0x4002
    updatecoinsbox 0, 5
    getspeciesname 0, 16385
    playfanfare MUS_FANFA1
    message Text_1A5DF1
    waitmessage
    waitfanfare
    loadword 0, gUnknown_81A56A7
    callstd 5
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_16CD83
    goto EventScript_16CC10
    end

EventScript_16CDE0:: @ 816CDE0
    takecoins VAR_0x4002
    updatecoinsbox 0, 5
    getspeciesname 0, 16385
    playfanfare MUS_FANFA1
    message Text_1A5DF1
    waitmessage
    waitfanfare
    loadword 0, gUnknown_81A56A7
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16CE12
    call EventScript_1A8C33
    goto EventScript_16CE12
    end

EventScript_16CE12:: @ 816CE12
    call EventScript_1A8C3C
    goto EventScript_16CC10
    end

CeladonCity_GameCorner_PrizeRoom_EventScript_16CE1D:: @ 816CE1D
    lock
    faceplayer
    checkflag FLAG_0x243
    goto_if 0, EventScript_16CD99
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    showcoinsbox 0, 0
    loadword 0, gUnknown_8197057
    callstd 4
    goto EventScript_16CE47
    end

EventScript_16CE47:: @ 816CE47
    message Text_19707A
    waitmessage
    multichoice 11, 0, 30, 0
    copyvar VAR_0x8000, VAR_RESULT
    compare_var_to_value VAR_0x8000, 0
    goto_if 1, EventScript_16CEA5
    compare_var_to_value VAR_0x8000, 1
    goto_if 1, EventScript_16CEB9
    compare_var_to_value VAR_0x8000, 2
    goto_if 1, EventScript_16CECD
    compare_var_to_value VAR_0x8000, 3
    goto_if 1, EventScript_16CEE1
    compare_var_to_value VAR_0x8000, 4
    goto_if 1, EventScript_16CEF5
    compare_var_to_value VAR_0x8000, 5
    goto_if 1, EventScript_16CC10
    compare_var_to_value VAR_0x8000, 127
    goto_if 1, EventScript_16CC10
    end

EventScript_16CEA5:: @ 816CEA5
    setvar VAR_0x4001, 301
    setvar VAR_0x4002, 4000
    getmovename 1, MOVE_ICE_BEAM
    goto EventScript_16CF09
    end

EventScript_16CEB9:: @ 816CEB9
    setvar VAR_0x4001, 311
    setvar VAR_0x4002, 3500
    getmovename 1, MOVE_IRON_TAIL
    goto EventScript_16CF09
    end

EventScript_16CECD:: @ 816CECD
    setvar VAR_0x4001, 312
    setvar VAR_0x4002, 4000
    getmovename 1, MOVE_THUNDERBOLT
    goto EventScript_16CF09
    end

EventScript_16CEE1:: @ 816CEE1
    setvar VAR_0x4001, 318
    setvar VAR_0x4002, 4500
    getmovename 1, MOVE_SHADOW_BALL
    goto EventScript_16CF09
    end

EventScript_16CEF5:: @ 816CEF5
    setvar VAR_0x4001, 323
    setvar VAR_0x4002, 4000
    getmovename 1, MOVE_FLAMETHROWER
    goto EventScript_16CF09
    end

EventScript_16CF09:: @ 816CF09
    loadword 0, gUnknown_81970B2
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16CC10
    goto EventScript_16CF3F
    end

EventScript_16CF22:: @ 816CF22
    getitemname 0, 16385
    loadword 0, gUnknown_819709D
    callstd 5
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16CC10
    goto EventScript_16CF3F
    end

EventScript_16CF3F:: @ 816CF3F
    getitemname 0, 16385
    checkcoins VAR_RESULT
    compare_var_to_var VAR_RESULT, VAR_0x4002
    goto_if 0, EventScript_16CDA5
    checkitemspace 16385, 1
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_16CF79
    takecoins VAR_0x4002
    updatecoinsbox 0, 5
    setorcopyvar VAR_0x8000, VAR_0x4001
    setorcopyvar VAR_0x8001, 1
    callstd 0
    goto EventScript_16CC10
    end

EventScript_16CF79:: @ 816CF79
    textcolor 3
    loadword 0, gUnknown_81A5242
    callstd 4
    hidecoinsbox 0, 0
    release
    end

CeladonCity_GameCorner_PrizeRoom_EventScript_16CF88:: @ 816CF88
    lock
    faceplayer
    checkflag FLAG_0x243
    goto_if 0, EventScript_16CD99
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    showcoinsbox 0, 0
    loadword 0, gUnknown_8197057
    callstd 4
    goto EventScript_16CFB2
    end

EventScript_16CFB2:: @ 816CFB2
    message Text_19707A
    waitmessage
    multichoice 10, 0, 41, 0
    copyvar VAR_0x8000, VAR_RESULT
    compare_var_to_value VAR_0x8000, 0
    goto_if 1, EventScript_16D010
    compare_var_to_value VAR_0x8000, 1
    goto_if 1, EventScript_16D020
    compare_var_to_value VAR_0x8000, 2
    goto_if 1, EventScript_16D030
    compare_var_to_value VAR_0x8000, 3
    goto_if 1, EventScript_16D040
    compare_var_to_value VAR_0x8000, 4
    goto_if 1, EventScript_16D050
    compare_var_to_value VAR_0x8000, 5
    goto_if 1, EventScript_16CC10
    compare_var_to_value VAR_0x8000, 127
    goto_if 1, EventScript_16CC10
    end

EventScript_16D010:: @ 816D010
    setvar VAR_0x4001, 194
    setvar VAR_0x4002, 800
    goto EventScript_16CF22
    end

EventScript_16D020:: @ 816D020
    setvar VAR_0x4001, 205
    setvar VAR_0x4002, 1000
    goto EventScript_16CF22
    end

EventScript_16D030:: @ 816D030
    setvar VAR_0x4001, 215
    setvar VAR_0x4002, 1000
    goto EventScript_16CF22
    end

EventScript_16D040:: @ 816D040
    setvar VAR_0x4001, 209
    setvar VAR_0x4002, 1000
    goto EventScript_16CF22
    end

EventScript_16D050:: @ 816D050
    setvar VAR_0x4001, 40
    setvar VAR_0x4002, 1600
    goto EventScript_16CF22
    end
