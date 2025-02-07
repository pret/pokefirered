# 1 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
.equ LOCALID_BILL,  2
# 3 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
.equ LOCALID_CELIO, 3
# 4 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 5 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_MapScripts::
# 6 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, OneIsland_PokemonCenter_1F_OnTransition
# 7 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 8 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, OneIsland_PokemonCenter_1F_OnLoad
# 9 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, OneIsland_PokemonCenter_1F_OnFrame
# 10 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	.byte 0
# 11 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 12 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_OnLoad::
# 13 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_ge VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5, OneIsland_PokemonCenter_1F_EventScript_SetRubyMetatile
# 14 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_set FLAG_SYS_CAN_LINK_WITH_RS, OneIsland_PokemonCenter_1F_EventScript_SetNetworkMachineOn
# 15 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 16 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 17 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_SetRubyMetatile::
# 18 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setmetatile 13, 4, METATILE_PokemonCenter_NetworkMachine_Ruby, 1
# 19 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 20 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 21 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_SetSapphireMetatile::
# 22 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setmetatile 16, 4, METATILE_PokemonCenter_NetworkMachine_Sapphire, 1
# 23 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 24 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 25 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_SetNetworkMachineOn::
# 26 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call OneIsland_PokemonCenter_1F_EventScript_SetSapphireMetatile
# 27 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setmetatile 14, 4, METATILE_PokemonCenter_NetworkMachine_ScreenLeft_On, 1
# 28 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setmetatile 15, 4, METATILE_PokemonCenter_NetworkMachine_ScreenRight_On, 1
# 29 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 30 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 31 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_OnTransition::
# 32 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_ONE_ISLAND
# 33 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 6, OneIsland_PokemonCenter_1F_EventScript_SetCelioQuestDone
# 34 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 0, OneIsland_PokemonCenter_1F_EventScript_SetBillCelioFirstMeetingPos
# 35 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 2, OneIsland_PokemonCenter_1F_EventScript_SetBillCelioReadyToLeavePos
# 36 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 37 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 38 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_SetCelioQuestDone::
# 39 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 7
# 40 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 41 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 42 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_SetBillCelioFirstMeetingPos::
# 43 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setobjectxyperm LOCALID_BILL, 9, 8
# 44 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setobjectmovementtype LOCALID_BILL, MOVEMENT_TYPE_FACE_UP
# 45 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setobjectxyperm LOCALID_CELIO, 15, 6
# 46 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setobjectmovementtype LOCALID_CELIO, MOVEMENT_TYPE_FACE_UP
# 47 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 48 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 49 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_SetBillCelioReadyToLeavePos::
# 50 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setobjectxyperm LOCALID_BILL, 14, 7
# 51 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setobjectmovementtype LOCALID_BILL, MOVEMENT_TYPE_FACE_LEFT
# 52 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setobjectxyperm LOCALID_CELIO, 14, 8
# 53 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setobjectmovementtype LOCALID_CELIO, MOVEMENT_TYPE_FACE_LEFT
# 54 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 55 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 56 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_OnFrame::
# 57 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	map_script_2 VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 0, OneIsland_PokemonCenter_1F_EventScript_MeetCelioScene
# 58 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	.2byte 0
# 59 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 60 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_MeetCelioScene::
# 61 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lockall
# 62 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 63 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_PokemonCenter_1F_Movement_PlayerWalkToCelio
# 64 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, OneIsland_PokemonCenter_1F_Movement_BillWalkToCelio
# 65 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 66 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillHeyThereCelio
# 67 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 68 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 69 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playse SE_PIN
# 70 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_ExclamationMark
# 71 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 72 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_WalkInPlaceFasterLeft
# 73 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 74 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_Delay48
# 75 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 76 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioCantBelieveYouCameOut
# 77 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillHowsYourResearchComing
# 78 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterDown
# 79 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 80 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 81 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_ThisIsMyBuddyCelio
# 82 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterRight
# 83 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 84 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 85 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 86 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_set FLAG_SYS_GAME_CLEAR, OneIsland_PokemonCenter_1F_EventScript_IntroducePlayerChamp
# 87 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_unset FLAG_SYS_GAME_CLEAR, OneIsland_PokemonCenter_1F_EventScript_IntroducePlayerNotChamp
# 88 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_WalkInPlaceFasterDown
# 89 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 90 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioThatsReallyImpressive
# 91 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillBringMeUpToSpeed
# 92 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_WalkInPlaceFasterLeft
# 93 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 94 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioPCsCantLinkWithYours
# 95 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 96 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterUp
# 97 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 98 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillLetMeHelpYou
# 99 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterDown
# 100 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 101 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 102 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 103 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CanYouDeliverThisMeteoritePlayer
# 104 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgreceiveditem OneIsland_PokemonCenter_1F_Text_AcceptedMeteoriteFromBill, ITEM_METEORITE, 1, MUS_OBTAIN_KEY_ITEM
# 105 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	additem ITEM_METEORITE
# 106 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_WalkInPlaceFasterDown
# 107 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 108 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioPleaseTakeThis
# 109 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	giveitem_msg OneIsland_PokemonCenter_1F_Text_ObtainedTriPass, ITEM_TRI_PASS, 1, MUS_OBTAIN_KEY_ITEM
# 110 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_PassLetsYouTravelBetweenIslands
# 111 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_ge VAR_MAP_SCENE_PALLET_TOWN_RIVALS_HOUSE, 2, OneIsland_PokemonCenter_1F_EventScript_ReceiveTownMapPage
# 112 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_lt VAR_MAP_SCENE_PALLET_TOWN_RIVALS_HOUSE, 2, OneIsland_PokemonCenter_1F_EventScript_ReceiveTownMap
# 113 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_SYS_SEVII_MAP_123
# 114 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillCatchYouLater
# 115 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 116 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterUp
# 117 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 118 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_WalkInPlaceFasterUp
# 119 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 120 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_SYS_PC_STORAGE_DISABLED
# 121 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 1
# 122 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	releaseall
# 123 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 124 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 125 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_IntroducePlayerChamp::
# 126 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_PlayerIsReigningPokemonChamp
# 127 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 128 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 129 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_IntroducePlayerNotChamp::
# 130 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_PlayerIsRisingPokemonChamp
# 131 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 132 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 133 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_ReceiveTownMapPage::
# 134 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 135 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 136 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	message OneIsland_PokemonCenter_1F_Text_ReceivedExtraPageForTownMap
# 137 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmessage
# 138 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitfanfare
# 139 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call EventScript_RestorePrevTextColor
# 140 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 141 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 142 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_ReceiveTownMap::
# 143 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_HIDE_TOWN_MAP
# 144 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_RIVALS_HOUSE, 2
# 145 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	giveitem_msg OneIsland_PokemonCenter_1F_Text_ReceivedTownMap, ITEM_TOWN_MAP, 1, MUS_OBTAIN_KEY_ITEM
# 146 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 147 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 148 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_PlayerWalkToCelio::
# 149 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_up
# 150 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_up
# 151 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 152 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 153 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 154 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 155 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 156 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_faster_up
# 157 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 158 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 159 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_BillWalkToCelio::
# 160 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_up
# 161 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 162 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 163 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 164 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 165 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 166 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_up
# 167 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_faster_right
# 168 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 169 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 170 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
@ Unused
# 171 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_WalkUp:
# 172 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_up
# 173 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 174 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 175 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
@ Unused
# 176 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_StepAsideLeft::
# 177 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 178 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_faster_right
# 179 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 180 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 181 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_Nurse::
# 182 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lock
# 183 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	faceplayer
# 184 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 185 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 186 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 187 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 188 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_Bill::
# 189 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lock
# 190 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_SEVII_DETOUR_FINISHED, OneIsland_PokemonCenter_1F_EventScript_BillGoTakeStroll
# 191 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_HmmHowAboutLikeThis
# 192 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 193 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 194 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 195 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_BillGoTakeStroll::
# 196 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_FacePlayer
# 197 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 198 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_GotPCWorkingStrollAWhileMore
# 199 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 200 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 201 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 202 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_Celio::
# 203 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lock
# 204 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	faceplayer
# 205 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 7, OneIsland_PokemonCenter_1F_EventScript_CelioGiveBillFact
# 206 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 6, OneIsland_PokemonCenter_1F_EventScript_CelioJustGivenSapphire
# 207 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_RECOVERED_SAPPHIRE, OneIsland_PokemonCenter_1F_EventScript_GiveCelioSapphire
# 208 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5, OneIsland_PokemonCenter_1F_EventScript_ExplainRainbowPass
# 209 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_GOT_RUBY, OneIsland_PokemonCenter_1F_EventScript_GiveCelioRuby
# 210 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4, OneIsland_PokemonCenter_1F_EventScript_CelioWaitingForRuby
# 211 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	specialvar VAR_RESULT, IsNationalPokedexEnabled
# 212 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, OneIsland_PokemonCenter_1F_EventScript_CelioRequestRuby
# 213 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 3, OneIsland_PokemonCenter_1F_EventScript_CelioPlayerMissingNationalDex
# 214 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_SorryForBeingPoorHost
# 215 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 216 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_FaceOriginalDirection
# 217 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 218 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 219 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 220 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 221 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_CelioGiveBillFact::
# 222 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioHearingRumorsAboutYou
# 223 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	random 3
# 224 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, 0, OneIsland_PokemonCenter_1F_EventScript_BillFact1
# 225 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, 1, OneIsland_PokemonCenter_1F_EventScript_BillFact2
# 226 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	famechecker FAMECHECKER_BILL, 5
# 227 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillCantStomachMilk
# 228 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 229 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 230 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 231 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_BillFact1::
# 232 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	famechecker FAMECHECKER_BILL, 3
# 233 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillsFirstMonWasAbra
# 234 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 235 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 236 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 237 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_BillFact2::
# 238 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	famechecker FAMECHECKER_BILL, 4
# 239 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillsHometownInGoldenrod
# 240 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 241 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 242 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 243 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_CelioJustGivenSapphire::
# 244 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_WishYouBestOfLuck
# 245 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 246 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 247 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 248 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_GiveCelioSapphire::
# 249 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 250 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playfanfare MUS_OBTAIN_TMHM
# 251 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	message OneIsland_PokemonCenter_1F_Text_HandedSapphireToCelio
# 252 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmessage
# 253 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitfanfare
# 254 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call EventScript_RestorePrevTextColor
# 255 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	removeitem ITEM_SAPPHIRE
# 256 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_ThankYouGiveMeTime
# 257 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 258 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, OneIsland_PokemonCenter_1F_Movement_CelioPutGemInMachine
# 259 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 260 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playse SE_CLICK
# 261 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call OneIsland_PokemonCenter_1F_EventScript_SetSapphireMetatile
# 262 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	special DrawWholeMapView
# 263 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_OkayThisIsGood
# 264 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 265 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay 60
# 266 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, OneIsland_PokemonCenter_1F_Movement_CelioCheckMachine
# 267 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 268 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay 30
# 269 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, OneIsland_PokemonCenter_1F_Movement_CelioCheckMachine
# 270 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 271 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay 40
# 272 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playse SE_PC_ON
# 273 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call OneIsland_PokemonCenter_1F_EventScript_SetNetworkMachineOn
# 274 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	special DrawWholeMapView
# 275 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_LinkedUpWithLanette
# 276 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_FacePlayer
# 277 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 278 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_ManagedToLinkWithHoennThankYou
# 279 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	special SetPostgameFlags
# 280 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_SYS_CAN_LINK_WITH_RS
# 281 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_HIDE_CERULEAN_CAVE_GUARD
# 282 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_HIDE_LORELEI_IN_HER_HOUSE
# 283 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 6
# 284 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	special InitRoamer
# 285 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 286 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 287 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 288 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_ExplainRainbowPass::
# 289 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_PassLetYouGetToAllIslands
# 290 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 291 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 292 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 293 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_GiveCelioRuby::
# 294 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_OhThats
# 295 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 296 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playfanfare MUS_OBTAIN_TMHM
# 297 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	message OneIsland_PokemonCenter_1F_Text_HandedRubyToCelio
# 298 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmessage
# 299 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitfanfare
# 300 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call EventScript_RestorePrevTextColor
# 301 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 302 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, OneIsland_PokemonCenter_1F_Movement_CelioPutGemInMachine
# 303 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 304 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playse SE_CLICK
# 305 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call OneIsland_PokemonCenter_1F_EventScript_SetRubyMetatile
# 306 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	special DrawWholeMapView
# 307 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay 30
# 308 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_FacePlayer
# 309 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 310 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_MayIAskOneMoreFavor, MSGBOX_YESNO
# 311 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, OneIsland_PokemonCenter_1F_EventScript_DeclineHelpCelio
# 312 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto OneIsland_PokemonCenter_1F_EventScript_GiveRainbowPass
# 313 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 314 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 315 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_DeclineHelpCelio::
# 316 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_PleaseINeedYourHelp, MSGBOX_YESNO
# 317 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, OneIsland_PokemonCenter_1F_EventScript_DeclineHelpCelio
# 318 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto OneIsland_PokemonCenter_1F_EventScript_GiveRainbowPass
# 319 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 320 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 321 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_GiveRainbowPass::
# 322 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_AnotherGemstoneInSeviiIslands
# 323 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	removeitem ITEM_RUBY
# 324 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	removeitem ITEM_TRI_PASS
# 325 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
# 326 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	additem ITEM_RAINBOW_PASS
# 327 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_SYS_SEVII_MAP_4567
# 328 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 329 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 330 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	message OneIsland_PokemonCenter_1F_Text_ReturnedTriPassForRainbowPass
# 331 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmessage
# 332 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitfanfare
# 333 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 334 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	message OneIsland_PokemonCenter_1F_Text_ObtainedExtraMapPage
# 335 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmessage
# 336 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitfanfare
# 337 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call EventScript_RestorePrevTextColor
# 338 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto OneIsland_PokemonCenter_1F_EventScript_ExplainRainbowPass
# 339 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 340 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 341 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_CelioWaitingForRuby::
# 342 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_TryingToFindGem
# 343 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 344 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 345 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 346 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_CelioRequestRuby::
# 347 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioCaughtMoreMonMaybeICanBeUseful
# 348 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_WalkInPlaceFasterUp
# 349 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 350 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_YoullBeTradingFromTrainersFarAway
# 351 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_FacePlayer
# 352 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 353 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_NeedsSpecialGemstone
# 354 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_MT_EMBER_EXTERIOR, 1
# 355 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4
# 356 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 357 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 358 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 359 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_CelioPlayerMissingNationalDex::
# 360 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioImModifyingMyNetworkMachine
# 361 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 362 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 363 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 364 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_CelioCheckMachine::
# 365 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_up
# 366 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay_8
# 367 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_up
# 368 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 369 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 370 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_CelioPutGemInMachine::
# 371 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_faster_up
# 372 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_up
# 373 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay_16
# 374 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_up
# 375 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_up
# 376 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 377 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 378 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_LittleBoy::
# 379 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CameFromPalletDontKnowIt, MSGBOX_NPC
# 380 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 381 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 382 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_Hiker::
# 383 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_EnormousVolcanoOnIsland, MSGBOX_NPC
# 384 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 385 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 386 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_BattleGirl::
# 387 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lock
# 388 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	faceplayer
# 389 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, OneIsland_PokemonCenter_1F_EventScript_BattleGirlHoennLinked
# 390 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_WishICouldTradeWithBoyfriend
# 391 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 392 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 393 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 394 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_BattleGirlHoennLinked::
# 395 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_TradedWithFarAwayBoyfriend
# 396 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	release
# 397 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 398 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 399 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_NetworkMachine::
# 400 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lockall
# 401 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, OneIsland_PokemonCenter_1F_EventScript_NetworkMachineLinkedWithHoenn
# 402 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_SEVII_DETOUR_FINISHED, OneIsland_PokemonCenter_1F_EventScript_NetworkMachineLinkedWithKanto
# 403 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_MachineUnderAdjustment
# 404 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	releaseall
# 405 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 406 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 407 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_NetworkMachineLinkedWithKanto::
# 408 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_MachineLinkedWithKanto
# 409 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	releaseall
# 410 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 411 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 412 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_NetworkMachineLinkedWithHoenn::
# 413 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_MachineLinkedWithKantoAndHoenn
# 414 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	releaseall
# 415 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 416 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 417 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_LeaveOneIslandTriggerTop::
# 418 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lockall
# 419 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_TEMP_1, 1
# 420 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto OneIsland_PokemonCenter_1F_EventScript_LeaveOneIslandScene
# 421 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 422 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 423 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_LeaveOneIslandTriggerMidTop::
# 424 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lockall
# 425 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_TEMP_1, 2
# 426 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto OneIsland_PokemonCenter_1F_EventScript_LeaveOneIslandScene
# 427 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 428 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 429 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_LeaveOneIslandTriggerMidBottom::
# 430 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lockall
# 431 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_TEMP_1, 3
# 432 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto OneIsland_PokemonCenter_1F_EventScript_LeaveOneIslandScene
# 433 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 434 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 435 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_LeaveOneIslandTriggerBottom::
# 436 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	lockall
# 437 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_TEMP_1, 4
# 438 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto OneIsland_PokemonCenter_1F_EventScript_LeaveOneIslandScene
# 439 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 440 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 441 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_LeaveOneIslandScene::
# 442 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 443 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playse SE_PIN
# 444 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_ExclamationMark
# 445 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 446 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillOhHeyPlayer
# 447 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 448 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, OneIsland_PokemonCenter_1F_EventScript_PlayerWalkToBillTop
# 449 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, OneIsland_PokemonCenter_1F_EventScript_PlayerWalkToBillMidTop
# 450 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_TEMP_1, 3, OneIsland_PokemonCenter_1F_EventScript_PlayerWalkToBillMidBottom
# 451 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_TEMP_1, 4, OneIsland_PokemonCenter_1F_EventScript_PlayerWalkToBillBottom
# 452 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay 10
# 453 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillWeGotItDone
# 454 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 455 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 456 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioJobWentQuick
# 457 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterDown
# 458 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 459 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_WalkInPlaceFasterUp
# 460 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 461 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillYouveLearnedALot
# 462 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioOhReallyEhehe
# 463 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 464 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterLeft
# 465 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 466 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay 10
# 467 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 468 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 469 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay 15
# 470 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_BillWeShouldHeadBackToKanto
# 471 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 472 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, Common_Movement_WalkInPlaceFasterDown
# 473 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 474 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay 15
# 475 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_CELIO, Common_Movement_WalkInPlaceFasterLeft
# 476 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 477 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 478 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 479 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	msgbox OneIsland_PokemonCenter_1F_Text_CelioPromiseIllShowYouAroundSometime
# 480 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	closemessage
# 481 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay 25
# 482 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_PokemonCenter_1F_Movement_PlayerExit
# 483 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement LOCALID_BILL, OneIsland_PokemonCenter_1F_Movement_BillExit
# 484 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 485 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	playse SE_EXIT
# 486 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setflag FLAG_HIDE_ONE_ISLAND_POKECENTER_BILL
# 487 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 3
# 488 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	clearflag FLAG_HIDE_CINNABAR_BILL
# 489 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 3
# 490 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_0x8004, SEAGALLOP_ONE_ISLAND
# 491 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	setvar VAR_0x8006, SEAGALLOP_CINNABAR_ISLAND
# 492 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	goto EventScript_SetSail
# 493 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	end
# 494 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 495 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_PlayerWalkToBillTop::
# 496 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_PokemonCenter_1F_Movement_PlayerWalkToBillTop
# 497 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 498 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 499 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 500 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_PlayerWalkToBillMidTop::
# 501 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_PokemonCenter_1F_Movement_PlayerWalkToBillMidTop
# 502 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 503 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 504 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 505 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_PlayerWalkToBillMidBottom::
# 506 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_PokemonCenter_1F_Movement_PlayerWalkToBillMidBottom
# 507 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 508 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 509 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 510 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_EventScript_PlayerWalkToBillBottom::
# 511 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_PokemonCenter_1F_Movement_PlayerWalkToBillBottom
# 512 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	waitmovement 0
# 513 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	return
# 514 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 515 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_PlayerWalkToBillTop::
# 516 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 517 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 518 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_faster_right
# 519 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 520 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 521 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_PlayerWalkToBillMidTop::
# 522 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 523 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 524 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 525 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_PlayerWalkToBillMidBottom::
# 526 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 527 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_up
# 528 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_faster_right
# 529 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 530 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 531 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_PlayerWalkToBillBottom::
# 532 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_right
# 533 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_up
# 534 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_up
# 535 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_faster_right
# 536 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 537 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 538 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
@ Unused
# 539 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_DelayWalkInPlaceLeft::
# 540 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay_16
# 541 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay_16
# 542 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	delay_4
# 543 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_faster_left
# 544 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 545 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 546 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
@ Unused
# 547 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_WalkInPlaceDown::
# 548 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_in_place_fast_down
# 549 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 550 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 551 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_PlayerExit::
# 552 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 553 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 554 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 555 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 556 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 557 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 558 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
# 559 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"

# 560 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
OneIsland_PokemonCenter_1F_Movement_BillExit::
# 561 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 562 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 563 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 564 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 565 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_left
# 566 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	walk_down
# 567 "data/maps/OneIsland_PokemonCenter_1F/scripts.pory"
	step_end
