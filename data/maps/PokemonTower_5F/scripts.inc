PokemonTower_5F_MapScripts:: @ 8163432
    .byte 0

PokemonTower_5F_EventScript_163433:: @ 8163433
    loadword 0, gUnknown_817A0E3
    callstd 2
    end

PokemonTower_5F_EventScript_16343C:: @ 816343C
    lockall
    fadescreen 3
    special sp000_heal_pokemon
    fadescreen 2
    loadword 0, gUnknown_817A1FA
    callstd 4
    setvar VAR_0x4001, 1
    releaseall
    end

PokemonTower_5F_EventScript_163453:: @ 8163453
    lockall
    setvar VAR_0x4001, 0
    releaseall
    end

PokemonTower_5F_EventScript_16345B:: @ 816345B
    trainerbattle 0, 447, 0, Text_17A11F, Text_17A132
    loadword 0, gUnknown_817A138
    callstd 6
    end

PokemonTower_5F_EventScript_163472:: @ 8163472
    trainerbattle 0, 448, 0, Text_17A150, Text_17A164
    loadword 0, gUnknown_817A176
    callstd 6
    end

PokemonTower_5F_EventScript_163489:: @ 8163489
    trainerbattle 0, 449, 0, Text_17A187, Text_17A190
    loadword 0, gUnknown_817A194
    callstd 6
    end

PokemonTower_5F_EventScript_1634A0:: @ 81634A0
    trainerbattle 0, 450, 0, Text_17A1AA, Text_17A1B7
    loadword 0, gUnknown_817A1BD
    callstd 6
    end
