CeladonCity_DepartmentStore_2F_MapScripts:: @ 816BAF4
    .byte 0

CeladonCity_DepartmentStore_2F_EventScript_16BAF5:: @ 816BAF5
    loadword 0, gUnknown_81955C7
    callstd 2
    end

CeladonCity_DepartmentStore_2F_EventScript_16BAFE:: @ 816BAFE
    loadword 0, gUnknown_819560F
    callstd 2
    end

CeladonCity_DepartmentStore_2F_EventScript_16BB07:: @ 816BB07
    loadword 0, gUnknown_8195638
    callstd 3
    end

CeladonCity_DepartmentStore_2F_EventScript_16BB10:: @ 816BB10
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    lock
    faceplayer
    message Text_1A6211
    waitmessage
    pokemart Items_16BB38
    loadword 0, gUnknown_81A5190
    callstd 4
    release
    end

    .align 2
Items_16BB38:: @ 816BB38
    .2byte ITEM_GREAT_BALL
    .2byte ITEM_SUPER_POTION
    .2byte ITEM_REVIVE
    .2byte ITEM_ANTIDOTE
    .2byte ITEM_PARALYZE_HEAL
    .2byte ITEM_AWAKENING
    .2byte ITEM_BURN_HEAL
    .2byte ITEM_ICE_HEAL
    .2byte ITEM_SUPER_REPEL
    .2byte ITEM_NONE
    release
    end

CeladonCity_DepartmentStore_2F_EventScript_16BB4E:: @ 816BB4E
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    lock
    faceplayer
    message Text_1A6211
    waitmessage
    pokemart Items_16BB74
    loadword 0, gUnknown_81A5190
    callstd 4
    release
    end

    .align 2
Items_16BB74:: @ 816BB74
    .2byte ITEM_TM05
    .2byte ITEM_TM15
    .2byte ITEM_TM28
    .2byte ITEM_TM31
    .2byte ITEM_TM43
    .2byte ITEM_TM45
    .2byte ITEM_NONE
    release
    end
