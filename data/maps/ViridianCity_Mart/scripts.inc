# 1 "data/maps/ViridianCity_Mart/scripts.pory"

# 2 "data/maps/ViridianCity_Mart/scripts.pory"
.set LOCALID_CLERK, 1
# 3 "data/maps/ViridianCity_Mart/scripts.pory"

# 4 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_MapScripts::
# 5 "data/maps/ViridianCity_Mart/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, ViridianCity_Mart_OnLoad
# 6 "data/maps/ViridianCity_Mart/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, ViridianCity_Mart_OnFrame
# 7 "data/maps/ViridianCity_Mart/scripts.pory"
	.byte 0
# 8 "data/maps/ViridianCity_Mart/scripts.pory"

# 9 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_OnLoad::
# 10 "data/maps/ViridianCity_Mart/scripts.pory"
	goto_if_unset FLAG_SYS_POKEDEX_GET, ViridianCity_Mart_EventScript_HideQuestionnaire
# 11 "data/maps/ViridianCity_Mart/scripts.pory"
	end
# 12 "data/maps/ViridianCity_Mart/scripts.pory"

# 13 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_EventScript_HideQuestionnaire::
# 14 "data/maps/ViridianCity_Mart/scripts.pory"
	setmetatile 1, 3, METATILE_Mart_CounterMid_Top, 1
# 15 "data/maps/ViridianCity_Mart/scripts.pory"
	setmetatile 1, 4, METATILE_Mart_CounterMid_Bottom, 1
# 16 "data/maps/ViridianCity_Mart/scripts.pory"
	end
# 17 "data/maps/ViridianCity_Mart/scripts.pory"

# 18 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_OnFrame::
# 19 "data/maps/ViridianCity_Mart/scripts.pory"
	map_script_2 VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 0, ViridianCity_Mart_EventScript_ParcelScene
# 20 "data/maps/ViridianCity_Mart/scripts.pory"
	.2byte 0
# 21 "data/maps/ViridianCity_Mart/scripts.pory"

# 22 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_EventScript_ParcelScene::
# 23 "data/maps/ViridianCity_Mart/scripts.pory"
	lockall
# 24 "data/maps/ViridianCity_Mart/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 25 "data/maps/ViridianCity_Mart/scripts.pory"
	applymovement LOCALID_CLERK, Common_Movement_WalkInPlaceFasterDown
# 26 "data/maps/ViridianCity_Mart/scripts.pory"
	waitmovement 0
# 27 "data/maps/ViridianCity_Mart/scripts.pory"
	msgbox ViridianCity_Mart_Text_YouCameFromPallet
# 28 "data/maps/ViridianCity_Mart/scripts.pory"
	closemessage
# 29 "data/maps/ViridianCity_Mart/scripts.pory"
	applymovement LOCALID_CLERK, ViridianCity_Mart_Movement_FacePlayer
# 30 "data/maps/ViridianCity_Mart/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, ViridianCity_Mart_Movement_ApproachCounter
# 31 "data/maps/ViridianCity_Mart/scripts.pory"
	waitmovement 0
# 32 "data/maps/ViridianCity_Mart/scripts.pory"
	msgbox ViridianCity_Mart_Text_TakeThisToProfOak
# 33 "data/maps/ViridianCity_Mart/scripts.pory"
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1
# 34 "data/maps/ViridianCity_Mart/scripts.pory"
	giveitem_msg ViridianCity_Mart_Text_ReceivedOaksParcelFromClerk, ITEM_OAKS_PARCEL, 1, MUS_OBTAIN_KEY_ITEM
# 35 "data/maps/ViridianCity_Mart/scripts.pory"
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 5
# 36 "data/maps/ViridianCity_Mart/scripts.pory"
	releaseall
# 37 "data/maps/ViridianCity_Mart/scripts.pory"
	end
# 38 "data/maps/ViridianCity_Mart/scripts.pory"

# 39 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_Movement_ApproachCounter::
# 40 "data/maps/ViridianCity_Mart/scripts.pory"
	walk_up
# 41 "data/maps/ViridianCity_Mart/scripts.pory"
	walk_up
# 42 "data/maps/ViridianCity_Mart/scripts.pory"
	walk_up
# 43 "data/maps/ViridianCity_Mart/scripts.pory"
	walk_up
# 44 "data/maps/ViridianCity_Mart/scripts.pory"
	walk_in_place_faster_left
# 45 "data/maps/ViridianCity_Mart/scripts.pory"
	step_end
# 46 "data/maps/ViridianCity_Mart/scripts.pory"

# 47 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_Movement_FacePlayer::
# 48 "data/maps/ViridianCity_Mart/scripts.pory"
	delay_16
# 49 "data/maps/ViridianCity_Mart/scripts.pory"
	delay_16
# 50 "data/maps/ViridianCity_Mart/scripts.pory"
	delay_16
# 51 "data/maps/ViridianCity_Mart/scripts.pory"
	delay_16
# 52 "data/maps/ViridianCity_Mart/scripts.pory"
	walk_in_place_faster_right
# 53 "data/maps/ViridianCity_Mart/scripts.pory"
	step_end
# 54 "data/maps/ViridianCity_Mart/scripts.pory"

# 55 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_EventScript_Clerk::
# 56 "data/maps/ViridianCity_Mart/scripts.pory"
	lock
# 57 "data/maps/ViridianCity_Mart/scripts.pory"
	faceplayer
# 58 "data/maps/ViridianCity_Mart/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1, ViridianCity_Mart_EventScript_SayHiToOak
# 59 "data/maps/ViridianCity_Mart/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 60 "data/maps/ViridianCity_Mart/scripts.pory"
	message Text_MayIHelpYou
# 61 "data/maps/ViridianCity_Mart/scripts.pory"
	waitmessage
# 62 "data/maps/ViridianCity_Mart/scripts.pory"
	pokemart ViridianCity_Mart_Items
# 63 "data/maps/ViridianCity_Mart/scripts.pory"
	msgbox Text_PleaseComeAgain
# 64 "data/maps/ViridianCity_Mart/scripts.pory"
	release
# 65 "data/maps/ViridianCity_Mart/scripts.pory"
	end
# 66 "data/maps/ViridianCity_Mart/scripts.pory"

# 67 "data/maps/ViridianCity_Mart/scripts.pory"
	.align 2
# 68 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_Items::
# 69 "data/maps/ViridianCity_Mart/scripts.pory"
	.2byte ITEM_POKE_BALL
# 70 "data/maps/ViridianCity_Mart/scripts.pory"
	.2byte ITEM_POTION
# 71 "data/maps/ViridianCity_Mart/scripts.pory"
	.2byte ITEM_ANTIDOTE
# 72 "data/maps/ViridianCity_Mart/scripts.pory"
	.2byte ITEM_PARALYZE_HEAL
# 73 "data/maps/ViridianCity_Mart/scripts.pory"
	.2byte ITEM_NONE
# 74 "data/maps/ViridianCity_Mart/scripts.pory"
	release
# 75 "data/maps/ViridianCity_Mart/scripts.pory"
	end
# 76 "data/maps/ViridianCity_Mart/scripts.pory"

# 77 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_EventScript_SayHiToOak::
# 78 "data/maps/ViridianCity_Mart/scripts.pory"
	msgbox ViridianCity_Mart_Text_SayHiToOakForMe
# 79 "data/maps/ViridianCity_Mart/scripts.pory"
	release
# 80 "data/maps/ViridianCity_Mart/scripts.pory"
	end
# 81 "data/maps/ViridianCity_Mart/scripts.pory"

# 82 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_EventScript_Woman::
# 83 "data/maps/ViridianCity_Mart/scripts.pory"
	msgbox ViridianCity_Mart_Text_ShopDoesGoodBusinessInAntidotes, MSGBOX_NPC
# 84 "data/maps/ViridianCity_Mart/scripts.pory"
	end
# 85 "data/maps/ViridianCity_Mart/scripts.pory"

# 86 "data/maps/ViridianCity_Mart/scripts.pory"
ViridianCity_Mart_EventScript_Youngster::
# 87 "data/maps/ViridianCity_Mart/scripts.pory"
	msgbox ViridianCity_Mart_Text_GotToBuySomePotions, MSGBOX_NPC
# 88 "data/maps/ViridianCity_Mart/scripts.pory"
	end
