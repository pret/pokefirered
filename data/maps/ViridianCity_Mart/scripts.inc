.set LOCALID_CLERK, 1

ViridianCity_Mart_MapScripts:: @ 816A1D3
	map_script MAP_SCRIPT_ON_LOAD, ViridianCity_Mart_OnLoad
	map_script MAP_SCRIPT_ON_FRAME_TABLE, ViridianCity_Mart_OnFrame
	.byte 0

ViridianCity_Mart_OnLoad:: @ 816A1DE
	goto_if_unset FLAG_SYS_POKEDEX_GET, ViridianCity_Mart_EventScript_HideQuestionnaire
	end

ViridianCity_Mart_EventScript_HideQuestionnaire:: @ 816A1E8
	setmetatile 1, 3, METATILE_Mart_CounterMid_Top, 1
	setmetatile 1, 4, METATILE_Mart_CounterMid_Bottom, 1
	end

ViridianCity_Mart_OnFrame:: @ 816A1FB
	map_script_2 VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 0, ViridianCity_Mart_EventScript_ParcelScene
	.2byte 0

ViridianCity_Mart_EventScript_ParcelScene:: @ 816A205
	lockall
	textcolor 0
	applymovement LOCALID_CLERK, Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox ViridianCity_Mart_Text_YouCameFromPallet
	closemessage
	applymovement LOCALID_CLERK, ViridianCity_Mart_Movement_FacePlayer
	applymovement OBJ_EVENT_ID_PLAYER, ViridianCity_Mart_Movement_ApproachCounter
	waitmovement 0
	msgbox ViridianCity_Mart_Text_TakeThisToProfOak
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1
	giveitem_msg ViridianCity_Mart_Text_ReceivedOaksParcelFromClerk, ITEM_OAKS_PARCEL, 1, MUS_OBTAIN_KEY_ITEM
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 5
	releaseall
	end

ViridianCity_Mart_Movement_ApproachCounter:: @ 816A25C
	walk_up
	walk_up
	walk_up
	walk_up
	walk_in_place_fastest_left
	step_end

ViridianCity_Mart_Movement_FacePlayer:: @ 816A262
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_right
	step_end

ViridianCity_Mart_EventScript_Clerk:: @ 816A268
	lock
	faceplayer
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1
	goto_if_eq ViridianCity_Mart_EventScript_SayHiToOak
	goto_if_questlog EventScript_ReleaseEnd
	message Text_MayIHelpYou
	waitmessage
	pokemart 0
	msgbox Text_PleaseComeAgain
	release
	end

ViridianCity_Mart_EventScript_SayHiToOak:: @ 816A2A4
	msgbox ViridianCity_Mart_Text_SayHiToOakForMe
	release
	end

ViridianCity_Mart_EventScript_Woman:: @ 816A2AE
	msgbox ViridianCity_Mart_Text_ShopDoesGoodBusinessInAntidotes, MSGBOX_NPC
	end

ViridianCity_Mart_EventScript_Youngster:: @ 816A2B7
	msgbox ViridianCity_Mart_Text_GotToBuySomePotions, MSGBOX_NPC
	end
