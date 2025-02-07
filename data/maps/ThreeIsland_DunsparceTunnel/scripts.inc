# 1 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"

# 2 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
.set LOCALID_PROSPECTOR, 1
# 3 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"

# 4 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
ThreeIsland_DunsparceTunnel_MapScripts::
# 5 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_DunsparceTunnel_OnTransition
# 6 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	.byte 0
# 7 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"

# 8 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
ThreeIsland_DunsparceTunnel_OnTransition::
# 9 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_THREE_ISLAND_DUNSPARCE_TUNNEL
# 10 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	specialvar VAR_RESULT, IsNationalPokedexEnabled
# 11 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	copyvar VAR_0x8008, VAR_RESULT
# 12 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	call_if_eq VAR_0x8008, TRUE, ThreeIsland_DunsparceTunnel_EventScript_SetLayoutDugOut
# 13 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	call_if_eq VAR_0x8008, FALSE, ThreeIsland_DunsparceTunnel_EventScript_MoveProspectorToWall
# 14 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	end
# 15 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"

# 16 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
ThreeIsland_DunsparceTunnel_EventScript_SetLayoutDugOut::
# 17 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	setmaplayoutindex LAYOUT_THREE_ISLAND_DUNSPARCE_TUNNEL_DUG_OUT
# 18 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	return
# 19 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"

# 20 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
ThreeIsland_DunsparceTunnel_EventScript_MoveProspectorToWall::
# 21 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	setobjectxyperm LOCALID_PROSPECTOR, 6, 3
# 22 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	setobjectmovementtype LOCALID_PROSPECTOR, MOVEMENT_TYPE_FACE_RIGHT
# 23 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	return
# 24 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"

# 25 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
ThreeIsland_DunsparceTunnel_EventScript_Prospector::
# 26 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	lock
# 27 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	faceplayer
# 28 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	goto_if_set FLAG_GOT_NUGGET_FROM_DUNSPARCE_TUNNEL, ThreeIsland_DunsparceTunnel_EventScript_ProspectorAlreadyGaveNugget
# 29 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	specialvar VAR_RESULT, IsNationalPokedexEnabled
# 30 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, ThreeIsland_DunsparceTunnel_EventScript_ProspectorStruckGold
# 31 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	msgbox ThreeIsland_DunsparceTunnel_Text_ProspectingForGold
# 32 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	closemessage
# 33 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	applymovement LOCALID_PROSPECTOR, Common_Movement_FaceOriginalDirection
# 34 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	waitmovement 0
# 35 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	release
# 36 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	end
# 37 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"

# 38 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
ThreeIsland_DunsparceTunnel_EventScript_ProspectorStruckGold::
# 39 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	msgbox ThreeIsland_DunsparceTunnel_Text_StruckGoldThisIsForYou
# 40 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	giveitem ITEM_NUGGET
# 41 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, ThreeIsland_DunsparceTunnel_EventScript_NoRoomForNugget
# 42 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	setflag FLAG_GOT_NUGGET_FROM_DUNSPARCE_TUNNEL
# 43 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	goto ThreeIsland_DunsparceTunnel_EventScript_ProspectorAlreadyGaveNugget
# 44 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	end
# 45 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"

# 46 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
ThreeIsland_DunsparceTunnel_EventScript_NoRoomForNugget::
# 47 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	msgbox ThreeIsland_DunsparceTunnel_Text_WhoopsBagCrammedFull
# 48 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	release
# 49 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	end
# 50 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"

# 51 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
ThreeIsland_DunsparceTunnel_EventScript_ProspectorAlreadyGaveNugget::
# 52 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	msgbox ThreeIsland_DunsparceTunnel_Text_ThatsANugget
# 53 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	release
# 54 "data/maps/ThreeIsland_DunsparceTunnel/scripts.pory"
	end
