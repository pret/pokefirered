ViridianCity_Mart_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, ViridianCity_Mart_OnTransition
	map_script MAP_SCRIPT_ON_LOAD, ViridianCity_Mart_OnLoad
	map_script MAP_SCRIPT_ON_FRAME_TABLE, ViridianCity_Mart_OnFrame
	.byte 0

ViridianCity_Mart_OnTransition::
	call Common_EventScript_SetupRedGreenGfxId
	end

ViridianCity_Mart_OnLoad::
	goto_if_unset FLAG_SYS_POKEDEX_GET, ViridianCity_Mart_EventScript_HideQuestionnaire
	end

ViridianCity_Mart_EventScript_HideQuestionnaire::
	end

ViridianCity_Mart_OnFrame::
	map_script_2 VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 0, ViridianCity_Mart_EventScript_ParcelScene
	.2byte 0

ViridianCity_Mart_EventScript_ParcelScene::
	lockall
	call ViridianCity_Mart_EventScript_RedGreen
	famechecker FAMECHECKER_OAK, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_MART, 1
	setvar VAR_LAB_POKEDEX_EVENT, 1
	releaseall
	end

ViridianCity_Mart_EventScript_RedGreen::
	delay 40
	textcolor NPC_TEXT_COLOR_NEUTRAL
	applymovement LOCALID_VIDRIAN_MART_REDGREEN, ViridianCity_Mart_Movement_Down
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_RedGreen
	msgbox ViridianCity_Mart_Text_QueAlegriaEncontrarteAqui
	hidenamebox
	closemessage
	applymovement LOCALID_PLAYER, ViridianCity_Mart_Movement_ApproachCounter
	waitmovement 0
	delay 40
	textcolor NPC_TEXT_COLOR_NEUTRAL
	namebox Name_RedGreen
	msgbox ViridianCity_Mart_Text_VinePorUnasPokeball
	hidenamebox
	closemessage
	applymovement LOCALID_VIDRIAN_MART_REDGREEN, ViridianCity_Mart_Movement_FacePlayer
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_FaceDown
	waitmovement 0
	textcolor NPC_TEXT_COLOR_NEUTRAL
	namebox Name_RedGreen
	msgbox ViridianCity_Mart_Text_NosVemosEnElLaboratorio
	hidenamebox
	closemessage
	applymovement LOCALID_VIDRIAN_MART_REDGREEN, ViridianCity_Mart_Movement_Seva
	waitmovement 0
	setobjectxy LOCALID_VIDRIAN_MART_REDGREEN,10,9
	playbgm MUS_POKE_CENTER, 0
	setflag FLAG_HIDE_VIRIDIAN_CITY_MART_REDGREEN
	return
	end

ViridianCity_Mart_Movement_Down::
	jump_in_place_down
	step_end

ViridianCity_Mart_Movement_ApproachCounter::
	walk_up
	walk_up
	walk_up
	step_end

ViridianCity_Mart_Movement_FacePlayer::
	walk_right
	walk_down
	walk_down
	walk_left
	walk_down
	walk_down
	jump_in_place_up
	emote_exclamation_mark
	step_end

ViridianCity_Mart_Movement_Seva::
	walk_in_place_down
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
	.2byte ITEM_NONE
	release
	end

ViridianCity_Mart_EventScript_SayHiToOak::
	message Text_MayIHelpYou
	waitmessage
	pokemart ViridianCity_Mart_Items2
	msgbox Text_PleaseComeAgain
	release
	end

ViridianCity_Mart_Items2::
	.2byte ITEM_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_RARE_CANDY
	.2byte ITEM_NONE
	release
	end

ViridianCity_Mart_EventScript_Woman::
	msgbox ViridianCity_Mart_Text_ShopDoesGoodBusinessInAntidotes, MSGBOX_NPC
	end

ViridianCity_Mart_EventScript_Youngster::
	msgbox ViridianCity_Mart_Text_GotToBuySomePotions, MSGBOX_NPC
	end
