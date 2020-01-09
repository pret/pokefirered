EventScript_1A8EC5:: @ 81A8EC5
    compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
    goto_if ge, EventScript_1A911E
    compare VAR_MAP_SCENE_CINNABAR_ISLAND, 4
    goto_if ge, EventScript_1A8F12
    multichoice 19, 6, MULTICHOICE_ISLAND_23, FALSE
    switch VAR_RESULT
    case 0, EventScript_1A8FF9
    case 1, EventScript_1A9004
    case 2, EventScript_1A90F6
    case SCR_MENU_CANCEL, EventScript_1A90F6
    end

EventScript_1A8F12:: @ 81A8F12
    multichoice 19, 5, MULTICHOICE_SEAGALLOP_V23, FALSE
    switch VAR_RESULT
    case 0, EventScript_1A8FE3
    case 1, EventScript_1A8FF9
    case 2, EventScript_1A9004
    case 3, EventScript_1A90F6
    case SCR_MENU_CANCEL, EventScript_1A90F6
    end

EventScript_1A8F54:: @ 81A8F54
    compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
    goto_if ge, EventScript_1A911E
    compare VAR_MAP_SCENE_CINNABAR_ISLAND, 4
    goto_if ge, EventScript_1A8FA1
    multichoice 19, 6, MULTICHOICE_ISLAND_13, FALSE
    switch VAR_RESULT
    case 0, EventScript_1A8FEE
    case 1, EventScript_1A9004
    case 2, EventScript_1A90F6
    case SCR_MENU_CANCEL, EventScript_1A90F6
    end

EventScript_1A8FA1:: @ 81A8FA1
    multichoice 19, 5, MULTICHOICE_SEAGALLOP_V13, FALSE
    switch VAR_RESULT
    case 0, EventScript_1A8FE3
    case 1, EventScript_1A8FEE
    case 2, EventScript_1A9004
    case 3, EventScript_1A90F6
    case SCR_MENU_CANCEL, EventScript_1A90F6
    end

EventScript_1A8FE3:: @ 81A8FE3
    setvar VAR_0x8006, SEAGALLOP_VERMILION_CITY
    goto EventScript_1A909E
    end

EventScript_1A8FEE:: @ 81A8FEE
    setvar VAR_0x8006, SEAGALLOP_ONE_ISLAND
    goto EventScript_1A909E
    end

EventScript_1A8FF9:: @ 81A8FF9
    setvar VAR_0x8006, SEAGALLOP_TWO_ISLAND
    goto EventScript_1A909E
    end

EventScript_1A9004:: @ 81A9004
    setvar VAR_0x8006, SEAGALLOP_THREE_ISLAND
    goto EventScript_1A909E
    end

EventScript_1A900F:: @ 81A900F
    compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
    goto_if ge, EventScript_1A911E
    compare VAR_MAP_SCENE_CINNABAR_ISLAND, 4
    goto_if ge, EventScript_1A905C
    multichoice 19, 6, MULTICHOICE_ISLAND_12, FALSE
    switch VAR_RESULT
    case 0, EventScript_1A8FEE
    case 1, EventScript_1A8FF9
    case 2, EventScript_1A90F6
    case SCR_MENU_CANCEL, EventScript_1A90F6
    end

EventScript_1A905C:: @ 81A905C
    multichoice 19, 5, MULTICHOICE_SEAGALLOP_V12, FALSE
    switch VAR_RESULT
    case 0, EventScript_1A8FE3
    case 1, EventScript_1A8FEE
    case 2, EventScript_1A8FF9
    case 3, EventScript_1A90F6
    case SCR_MENU_CANCEL, EventScript_1A90F6
    end

EventScript_1A909E:: @ 81A909E
    specialvar VAR_RESULT, sub_8147500
    getnumberstring 0, VAR_RESULT
    compare VAR_0x8004, SEAGALLOP_VERMILION_CITY
    goto_if eq, EventScript_1A90BE
    compare VAR_0x8004, SEAGALLOP_VERMILION_CITY
    goto_if ne, EventScript_1A90CC
    end

EventScript_1A90BE:: @ 81A90BE
    msgbox Text_17FB67
    goto EventScript_1A90DA
    end

EventScript_1A90CC:: @ 81A90CC
    msgbox Text_1A641B
    goto EventScript_1A90DA
    end

EventScript_1A90DA:: @ 81A90DA
    closemessage
    delay 20
    special sub_8110AB4
    compare VAR_RESULT, 2
    goto_if eq, EventScript_1A7AE0
    special sub_8112364
    fadescreen 1
    special ScrSpecial_SeagallopFerry
    waitstate
    end

EventScript_1A90F6:: @ 81A90F6
    specialvar VAR_RESULT, sub_8147594
    compare VAR_RESULT, 1
    goto_if eq, EventScript_1A9108
    release
    end

EventScript_1A9108:: @ 81A9108
    closemessage
    applymovement 6, Movement_FaceOriginalDirection
    applymovement OBJ_EVENT_ID_PLAYER, Movement_1A911C
    waitmovement 0
    releaseall
    end

Movement_1A911C:: @ 81A911C
    walk_up
    step_end

EventScript_1A911E:: @ 81A911E
    setvar VAR_0x8005, 0
    special Special_DrawSeagallopDestinationMenu
    waitstate
    specialvar VAR_0x8006, Special_GetSelectedSeagallopDestination
    switch VAR_0x8006
    case SEAGALLOP_VERMILION_CITY, EventScript_1A91D5
    case SEAGALLOP_ONE_ISLAND,     EventScript_1A91E0
    case SEAGALLOP_TWO_ISLAND,     EventScript_1A91EB
    case SEAGALLOP_THREE_ISLAND,   EventScript_1A91F6
    case SEAGALLOP_FOUR_ISLAND,    EventScript_1A9201
    case SEAGALLOP_MORE,           EventScript_1A917F
    case SCR_MENU_CANCEL, EventScript_1A90F6
    end

EventScript_1A917F:: @ 81A917F
    setvar VAR_0x8005, 1
    special Special_DrawSeagallopDestinationMenu
    waitstate
    specialvar VAR_0x8006, Special_GetSelectedSeagallopDestination
    switch VAR_0x8006
    case SEAGALLOP_FOUR_ISLAND,  EventScript_1A9201
    case SEAGALLOP_FIVE_ISLAND,  EventScript_1A920C
    case SEAGALLOP_SIX_ISLAND,   EventScript_1A9217
    case SEAGALLOP_SEVEN_ISLAND, EventScript_1A9222
    case SEAGALLOP_MORE,           EventScript_1A911E
    case SCR_MENU_CANCEL, EventScript_1A90F6
    end

EventScript_1A91D5:: @ 81A91D5
    setvar VAR_0x8006, SEAGALLOP_VERMILION_CITY
    goto EventScript_1A909E
    end

EventScript_1A91E0:: @ 81A91E0
    setvar VAR_0x8006, SEAGALLOP_ONE_ISLAND
    goto EventScript_1A909E
    end

EventScript_1A91EB:: @ 81A91EB
    setvar VAR_0x8006, SEAGALLOP_TWO_ISLAND
    goto EventScript_1A909E
    end

EventScript_1A91F6:: @ 81A91F6
    setvar VAR_0x8006, SEAGALLOP_THREE_ISLAND
    goto EventScript_1A909E
    end

EventScript_1A9201:: @ 81A9201
    setvar VAR_0x8006, SEAGALLOP_FOUR_ISLAND
    goto EventScript_1A909E
    end

EventScript_1A920C:: @ 81A920C
    setvar VAR_0x8006, SEAGALLOP_FIVE_ISLAND
    goto EventScript_1A909E
    end

EventScript_1A9217:: @ 81A9217
    setvar VAR_0x8006, SEAGALLOP_SIX_ISLAND
    goto EventScript_1A909E
    end

EventScript_1A9222:: @ 81A9222
    setvar VAR_0x8006, SEAGALLOP_SEVEN_ISLAND
    goto EventScript_1A909E
    end
