CinnabarIsland_Mart_MapScripts:: @ 816EA0F
    .byte 0

CinnabarIsland_Mart_EventScript_16EA10:: @ 816EA10
    loadword 0, gUnknown_819A7A0
    callstd 2
    end

CinnabarIsland_Mart_EventScript_16EA19:: @ 816EA19
    loadword 0, gUnknown_819A7F1
    callstd 2
    end

CinnabarIsland_Mart_EventScript_16EA22:: @ 816EA22
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    lock
    faceplayer
    message Text_1A6211
    waitmessage
    pokemart Items_16EA48
    loadword 0, gUnknown_81A5190
    callstd 4
    release
    end

    .align 2
Items_16EA48:: @ 816EA48
    .2byte ITEM_ULTRA_BALL
    .2byte ITEM_GREAT_BALL
    .2byte ITEM_HYPER_POTION
    .2byte ITEM_REVIVE
    .2byte ITEM_FULL_HEAL
    .2byte ITEM_ESCAPE_ROPE
    .2byte ITEM_MAX_REPEL
    .2byte ITEM_NONE
    release
    end
