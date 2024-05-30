.set LOCALID_CLERK, 1

ViridianCity_Mart_MapScripts::
	map_script MAP_SCRIPT_ON_LOAD, ViridianCity_Mart_OnLoad
	map_script MAP_SCRIPT_ON_FRAME_TABLE, ViridianCity_Mart_OnFrame
	.byte 0

ViridianCity_Mart_OnLoad::
	goto_if_unset FLAG_SYS_POKEDEX_GET, ViridianCity_Mart_EventScript_HideQuestionnaire
	end

ViridianCity_Mart_EventScript_HideQuestionnaire::
	setmetatile 1, 3, METATILE_Mart_CounterMid_Top, 1
	setmetatile 1, 4, METATILE_Mart_CounterMid_Bottom, 1
	end

ViridianCity_Mart_OnFrame::
	map_script_2 VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 0, ViridianCity_Mart_EventScript_ParcelScene
	.2byte 0

ViridianCity_Mart_EventScript_ParcelScene::
	lockall
	textcolor NPC_TEXT_COLOR_MALE
	applymovement LOCALID_CLERK, Common_Movement_WalkInPlaceFasterDown
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

ViridianCity_Mart_Movement_ApproachCounter::
	walk_up
	walk_up
	walk_up
	walk_up
	walk_in_place_faster_left
	step_end

ViridianCity_Mart_Movement_FacePlayer::
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_faster_right
	step_end

ViridianCity_Mart_EventScript_Clerk::
	lock
	faceplayer
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1, ViridianCity_Mart_EventScript_SayHiToOak
	goto_if_questlog EventScript_ReleaseEnd
	message Text_MayIHelpYou
	waitmessage
	pokemart ViridianCity_Mart_Items
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
ViridianCity_Mart_Items::
	.2byte ITEM_POKE_BALL
	.2byte ITEM_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_RARE_CANDY
	.2byte ITEM_TM02
	.2byte ITEM_TM10
	.2byte ITEM_PECHA_BERRY
	.2byte ITEM_FULL_RESTORE
	.2byte ITEM_X_ATTACK
	.2byte ITEM_GUARD_SPEC
	.2byte ITEM_DIRE_HIT
	.2byte ITEM_POKE_DOLL
	.2byte ITEM_MASTER_BALL
	.2byte ITEM_MOON_BALL
	.2byte ITEM_CHERISH_BALL
	.2byte ITEM_REVIVE
	.2byte ITEM_ETHER
	.2byte ITEM_ELIXIR
	.2byte ITEM_LEPPA_BERRY
	.2byte ITEM_MAX_MUSHROOMS
	.2byte ITEM_EXP_CANDY_XS
	.2byte ITEM_EXP_CANDY_XL
	.2byte ITEM_OVAL_CHARM
	.2byte ITEM_EVERSTONE
	.2byte ITEM_THUNDER_STONE
	.2byte ITEM_FIRE_STONE
	.2byte ITEM_LEAF_STONE
	.2byte ITEM_WATER_STONE
	.2byte ITEM_ICE_STONE
	.2byte ITEM_MOON_STONE
	.2byte ITEM_SUN_STONE
	.2byte ITEM_DRAGON_SCALE
	.2byte ITEM_UPGRADE
	.2byte ITEM_DUBIOUS_DISC
	.2byte ITEM_KINGS_ROCK
	.2byte ITEM_PROTECTOR
	.2byte ITEM_ELECTIRIZER
	.2byte ITEM_MAGMARIZER
	.2byte ITEM_LINKING_CORD
	.2byte ITEM_BLACK_AUGURITE
	.2byte ITEM_METAL_COAT
	.2byte ITEM_PP_UP
	.2byte ITEM_MUSCLE_FEATHER
	.2byte ITEM_PROTEIN
	.2byte ITEM_ABILITY_CAPSULE
	.2byte ITEM_ABILITY_PATCH
	.2byte ITEM_STICKY_BARB
	.2byte ITEM_ORAN_BERRY
	.2byte ITEM_BEAST_BALL
	.2byte ITEM_POMEG_BERRY
	.2byte ITEM_MEGA_RING
	.2byte ITEM_VENUSAURITE
	.2byte ITEM_CHARIZARDITE_X
	.2byte ITEM_CHARIZARDITE_Y
	.2byte ITEM_BLASTOISINITE
	.2byte ITEM_PIDGEOTITE
	.2byte ITEM_SILPH_SCOPE
	.2byte ITEM_DYNAMAX_BAND
	.2byte ITEM_Z_POWER_RING
	.2byte ITEM_NORMALIUM_Z
	.2byte ITEM_ULTRANECROZIUM_Z
	.2byte ITEM_MODEST_MINT
	.2byte ITEM_BOLD_MINT
	.2byte ITEM_ADAMANT_MINT
	.2byte ITEM_SERIOUS_MINT
	.2byte ITEM_NONE
	release
	end

ViridianCity_Mart_EventScript_SayHiToOak::
	msgbox ViridianCity_Mart_Text_SayHiToOakForMe
	release
	end

ViridianCity_Mart_EventScript_Woman::
	msgbox ViridianCity_Mart_Text_ShopDoesGoodBusinessInAntidotes, MSGBOX_NPC
	end

ViridianCity_Mart_EventScript_Youngster::
	msgbox ViridianCity_Mart_Text_GotToBuySomePotions, MSGBOX_NPC
	end
