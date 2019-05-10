FourIsland_IcefallCave_1F_MapScripts:: @ 8163D44
    map_script 5, FourIsland_IcefallCave_1F_MapScript1_163D54
    map_script 1, FourIsland_IcefallCave_1F_MapScript2_163D57
    map_script 2, FourIsland_IcefallCave_1F_MapScript3_163D5B
    .byte 0

FourIsland_IcefallCave_1F_MapScript1_163D54:: @ 8163D54
    setstepcallback 4
    end

FourIsland_IcefallCave_1F_MapScript2_163D57:: @ 8163D57
    special sub_806E99C
    end

FourIsland_IcefallCave_1F_MapScript3_163D5B:: @ 8163D5B
    map_script_2 VAR_0x4001, 1, EventScript_163D65
    .2byte 0

EventScript_163D65:: @ 8163D65
    lockall
    delay 20
    applymovement 255, Movement_163D7F
    waitmovement 0
    playse SE_FU_ZAKU
    delay 60
    warphole MAP_FOUR_ISLAND_ICEFALLCAVE_B1F
    waitstate
    releaseall
    end

Movement_163D7F:: @ 8163D7F
    step_60
    step_end
