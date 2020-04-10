@ Separate selection menus for before the Rainbow Pass is obtained
EventScript_ChooseDestFromOneIsland:: @ 81A8EC5
    compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
    goto_if_ge EventScript_SeviiDestinationsPage1
    compare VAR_MAP_SCENE_CINNABAR_ISLAND, 4
    goto_if_ge EventScript_ChooseDestFromOneIslandVermilionAllowed
    multichoice 19, 6, MULTICHOICE_ISLAND_23, FALSE
    switch VAR_RESULT
    case 0, EventScript_SailToTwoIsland2
    case 1, EventScript_SailToThreeIsland2
    case 2, EventScript_CancelSail
    case SCR_MENU_CANCEL, EventScript_CancelSail
    end

EventScript_ChooseDestFromOneIslandVermilionAllowed:: @ 81A8F12
    multichoice 19, 5, MULTICHOICE_SEAGALLOP_V23, FALSE
    switch VAR_RESULT
    case 0, EventScript_SailToVermilion2
    case 1, EventScript_SailToTwoIsland2
    case 2, EventScript_SailToThreeIsland2
    case 3, EventScript_CancelSail
    case SCR_MENU_CANCEL, EventScript_CancelSail
    end

EventScript_ChooseDestFromTwoIsland:: @ 81A8F54
    compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
    goto_if_ge EventScript_SeviiDestinationsPage1
    compare VAR_MAP_SCENE_CINNABAR_ISLAND, 4
    goto_if_ge EventScript_ChooseDestFromTwoIslandVermilionAllowed
    multichoice 19, 6, MULTICHOICE_ISLAND_13, FALSE
    switch VAR_RESULT
    case 0, EventScript_SailToOneIsland2
    case 1, EventScript_SailToThreeIsland2
    case 2, EventScript_CancelSail
    case SCR_MENU_CANCEL, EventScript_CancelSail
    end

EventScript_ChooseDestFromTwoIslandVermilionAllowed:: @ 81A8FA1
    multichoice 19, 5, MULTICHOICE_SEAGALLOP_V13, FALSE
    switch VAR_RESULT
    case 0, EventScript_SailToVermilion2
    case 1, EventScript_SailToOneIsland2
    case 2, EventScript_SailToThreeIsland2
    case 3, EventScript_CancelSail
    case SCR_MENU_CANCEL, EventScript_CancelSail
    end

EventScript_SailToVermilion2:: @ 81A8FE3
    setvar VAR_0x8006, SEAGALLOP_VERMILION_CITY
    goto EventScript_SailToDest
    end

EventScript_SailToOneIsland2:: @ 81A8FEE
    setvar VAR_0x8006, SEAGALLOP_ONE_ISLAND
    goto EventScript_SailToDest
    end

EventScript_SailToTwoIsland2:: @ 81A8FF9
    setvar VAR_0x8006, SEAGALLOP_TWO_ISLAND
    goto EventScript_SailToDest
    end

EventScript_SailToThreeIsland2:: @ 81A9004
    setvar VAR_0x8006, SEAGALLOP_THREE_ISLAND
    goto EventScript_SailToDest
    end

EventScript_ChooseDestFromIsland:: @ 81A900F
    compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
    goto_if_ge EventScript_SeviiDestinationsPage1
    compare VAR_MAP_SCENE_CINNABAR_ISLAND, 4
    goto_if_ge EventScript_ChooseDestFromIslandVermilionAllowed
    multichoice 19, 6, MULTICHOICE_ISLAND_12, FALSE
    switch VAR_RESULT
    case 0, EventScript_SailToOneIsland2
    case 1, EventScript_SailToTwoIsland2
    case 2, EventScript_CancelSail
    case SCR_MENU_CANCEL, EventScript_CancelSail
    end

EventScript_ChooseDestFromIslandVermilionAllowed:: @ 81A905C
    multichoice 19, 5, MULTICHOICE_SEAGALLOP_V12, FALSE
    switch VAR_RESULT
    case 0, EventScript_SailToVermilion2
    case 1, EventScript_SailToOneIsland2
    case 2, EventScript_SailToTwoIsland2
    case 3, EventScript_CancelSail
    case SCR_MENU_CANCEL, EventScript_CancelSail
    end

EventScript_SailToDest:: @ 81A909E
    specialvar VAR_RESULT, GetSeagallopNumber
    getnumberstring 0, VAR_RESULT
    compare VAR_0x8004, SEAGALLOP_VERMILION_CITY
    goto_if_eq EventScript_DepartingVermilion
    compare VAR_0x8004, SEAGALLOP_VERMILION_CITY
    goto_if_ne EventScript_DepartingNotVermilion
    end

EventScript_DepartingVermilion:: @ 81A90BE
    msgbox VermilionCity_Text_Seagallop7Departing
    goto EventScript_SetSail
    end

EventScript_DepartingNotVermilion:: @ 81A90CC
    msgbox Text_AllAboardSeagallopNum
    goto EventScript_SetSail
    end

EventScript_SetSail:: @ 81A90DA
    closemessage
    delay 20
    goto_if_questlog EventScript_ReleaseEnd
    special QuestLog_CutRecording
    fadescreen FADE_TO_BLACK
    special DoSeagallopFerryScene
    waitstate
    end

EventScript_CancelSail:: @ 81A90F6
    specialvar VAR_RESULT, IsPlayerLeftOfVermilionSailor
    compare VAR_RESULT, TRUE
    goto_if_eq VermilionCity_EventScript_WalkUpPier
    release
    end

VermilionCity_EventScript_WalkUpPier:: @ 81A9108
    closemessage
    applymovement LOCALID_FERRY_SAILOR, Movement_FaceOriginalDirection
    applymovement OBJ_EVENT_ID_PLAYER, VermilionCity_Movement_WalkUp
    waitmovement 0
    releaseall
    end

VermilionCity_Movement_WalkUp:: @ 81A911C
    walk_up
    step_end

EventScript_SeviiDestinationsPage1:: @ 81A911E
    setvar VAR_0x8005, 0
    special DrawSeagallopDestinationMenu
    waitstate
    specialvar VAR_0x8006, GetSelectedSeagallopDestination
    switch VAR_0x8006
    case SEAGALLOP_VERMILION_CITY, EventScript_SailToVermilionCity
    case SEAGALLOP_ONE_ISLAND,     EventScript_SailToOneIsland
    case SEAGALLOP_TWO_ISLAND,     EventScript_SailToTwoIsland
    case SEAGALLOP_THREE_ISLAND,   EventScript_SailToThreeIsland
    case SEAGALLOP_FOUR_ISLAND,    EventScript_SailToFourIsland
    case SEAGALLOP_MORE,           EventScript_SeviiDestinationsPage2
    case SCR_MENU_CANCEL,          EventScript_CancelSail
    end

EventScript_SeviiDestinationsPage2:: @ 81A917F
    setvar VAR_0x8005, 1
    special DrawSeagallopDestinationMenu
    waitstate
    specialvar VAR_0x8006, GetSelectedSeagallopDestination
    switch VAR_0x8006
    case SEAGALLOP_FOUR_ISLAND,  EventScript_SailToFourIsland
    case SEAGALLOP_FIVE_ISLAND,  EventScript_SailToFiveIsland
    case SEAGALLOP_SIX_ISLAND,   EventScript_SailToSixIsland
    case SEAGALLOP_SEVEN_ISLAND, EventScript_SailToSevenIsland
    case SEAGALLOP_MORE,         EventScript_SeviiDestinationsPage1
    case SCR_MENU_CANCEL,        EventScript_CancelSail
    end

EventScript_SailToVermilionCity:: @ 81A91D5
    setvar VAR_0x8006, SEAGALLOP_VERMILION_CITY
    goto EventScript_SailToDest
    end

EventScript_SailToOneIsland:: @ 81A91E0
    setvar VAR_0x8006, SEAGALLOP_ONE_ISLAND
    goto EventScript_SailToDest
    end

EventScript_SailToTwoIsland:: @ 81A91EB
    setvar VAR_0x8006, SEAGALLOP_TWO_ISLAND
    goto EventScript_SailToDest
    end

EventScript_SailToThreeIsland:: @ 81A91F6
    setvar VAR_0x8006, SEAGALLOP_THREE_ISLAND
    goto EventScript_SailToDest
    end

EventScript_SailToFourIsland:: @ 81A9201
    setvar VAR_0x8006, SEAGALLOP_FOUR_ISLAND
    goto EventScript_SailToDest
    end

EventScript_SailToFiveIsland:: @ 81A920C
    setvar VAR_0x8006, SEAGALLOP_FIVE_ISLAND
    goto EventScript_SailToDest
    end

EventScript_SailToSixIsland:: @ 81A9217
    setvar VAR_0x8006, SEAGALLOP_SIX_ISLAND
    goto EventScript_SailToDest
    end

EventScript_SailToSevenIsland:: @ 81A9222
    setvar VAR_0x8006, SEAGALLOP_SEVEN_ISLAND
    goto EventScript_SailToDest
    end
