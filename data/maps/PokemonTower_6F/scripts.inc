PokemonTower_6F_MapScripts:: @ 81634B7
    .byte 0

PokemonTower_6F_EventScript_1634B8:: @ 81634B8
    lockall
    textcolor 2
    loadword 0, gUnknown_817A2F8
    callstd 4
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    setwildbattle SPECIES_MAROWAK, 30, ITEM_NONE
    special sub_807F904
    waitstate
    special sub_8112364
    compare_var_to_value VAR_RESULT, 0
    goto_if 1, EventScript_1634F5
    applymovement 255, Movement_163512
    waitmovement 0
    releaseall
    end

EventScript_1634F5:: @ 81634F5
    message Text_17A30C
    waitmessage
    waitse
    playmoncry SPECIES_MAROWAK, 0
    waitbuttonpress
    waitmoncry
    loadword 0, gUnknown_817A342
    callstd 4
    setvar VAR_0x4059, 1
    releaseall
    end

Movement_163512:: @ 8163512
    step_11
    step_end

PokemonTower_6F_EventScript_163514:: @ 8163514
    trainerbattle 0, 451, 0, Text_17A243, Text_17A253
    loadword 0, gUnknown_817A25A
    callstd 6
    end

PokemonTower_6F_EventScript_16352B:: @ 816352B
    trainerbattle 0, 452, 0, Text_17A272, Text_17A27F
    loadword 0, gUnknown_817A293
    callstd 6
    end

PokemonTower_6F_EventScript_163542:: @ 8163542
    trainerbattle 0, 453, 0, Text_17A2C8, Text_17A2DC
    loadword 0, gUnknown_817A2E2
    callstd 6
    end
