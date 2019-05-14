SevenIsland_TrainerTower_MapScripts:: @ 8168BD5
    map_script 3, SevenIsland_TrainerTower_MapScript1_168BDB
    .byte 0

SevenIsland_TrainerTower_MapScript1_168BDB:: @ 8168BDB
    setvar VAR_0x4082, 0
    end

SevenIsland_TrainerTower_EventScript_168BE1:: @ 8168BE1
    loadword 0, gUnknown_818C338
    callstd 3
    end

SevenIsland_TrainerTower_EventScript_168BEA:: @ 8168BEA
    loadword 0, gUnknown_818C370
    callstd 3
    end
