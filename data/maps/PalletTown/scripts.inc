.equ SIGN_LADY_READY, VAR_TEMP_2

PalletTown_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, PalletTown_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PalletTown_OnFrame
	.byte 0

PalletTown_OnTransition::
	setworldmapflag FLAG_WORLD_MAP_PALLET_TOWN
	call_if_set FLAG_PALLET_LADY_NOT_BLOCKING_SIGN, PalletTown_EventScript_TryReadySignLady
	call_if_eq VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 0, PalletTown_EventScript_SetSignLadyPos
	call_if_eq VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 1, PalletTown_EventScript_SetSignLadyDone
	end

PalletTown_EventScript_TryReadySignLady::
	goto_if_unset FLAG_OPENED_START_MENU, EventScript_Return
	goto_if_ge VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 1, EventScript_Return
	setvar VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 1
	return

PalletTown_EventScript_SetSignLadyDone::
	setvar VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 2
	return

PalletTown_EventScript_SetSignLadyPos::
	goto_if_set FLAG_PALLET_LADY_NOT_BLOCKING_SIGN, PalletTown_EventScript_MoveSignLadyToRouteEntrance
	setobjectxyperm LOCALID_PALLET_SIGN_LADY, 7, 13
	setobjectmovementtype LOCALID_PALLET_SIGN_LADY, MOVEMENT_TYPE_FACE_UP
	return

PalletTown_EventScript_MoveSignLadyToRouteEntrance::
	setobjectxyperm LOCALID_PALLET_SIGN_LADY, 12, 2
	setobjectmovementtype LOCALID_PALLET_SIGN_LADY, MOVEMENT_TYPE_FACE_DOWN
	setvar SIGN_LADY_READY, TRUE
	return

PalletTown_OnFrame::
	map_script_2 VAR_MAP_SCENE_PALLET_TOWN_OAK, 2, PalletTown_EventScript_OakRatingScene
	.2byte 0

@ Oak approaches player after exiting their house post Elite Four to check if they should receieve the National Dex
PalletTown_EventScript_OakRatingScene::
	lockall
	textcolor NPC_TEXT_COLOR_MALE
	setobjectxyperm LOCALID_PALLET_PROF_OAK, 14, 14
	setobjectmovementtype LOCALID_PALLET_PROF_OAK, MOVEMENT_TYPE_FACE_LEFT
	addobject LOCALID_PALLET_PROF_OAK
	applymovement LOCALID_PALLET_PROF_OAK, PalletTown_Movement_OakWalkToPlayersDoor
	waitmovement 0
	goto_if_unset FLAG_WORLD_MAP_ONE_ISLAND, PalletTown_EventScript_NotBeenToOneIslandYet
	msgbox PalletTown_Text_OakLetMeSeePokedex
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, GetPokedexCount
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	buffernumberstring STR_VAR_1, VAR_0x8008
	buffernumberstring STR_VAR_2, VAR_0x8009
	goto_if_lt VAR_0x8009, 60, PalletTown_EventScript_NotEnoughMonsForNationalDex
	msgbox PalletTown_Text_CaughtXImpressiveFollowMe
	closemessage
	playbgm MUS_FOLLOW_ME, 0
	applymovement LOCALID_PLAYER, PalletTown_Movement_PlayerWalkToLabFromHouse
	applymovement LOCALID_PALLET_PROF_OAK, PalletTown_Movement_OakWalkToLabFromHouse
	waitmovement 0
	opendoor 16, 13
	waitdooranim
	applymovement LOCALID_PALLET_PROF_OAK, PalletTown_Movement_OakEntraLab
	applymovement LOCALID_PLAYER, PalletTown_Movement_PlayerEnterLab
	waitmovement 0
	closedoor 16, 13
	waitdooranim
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 7
	setvar VAR_MAP_SCENE_PALLET_TOWN_OAK, 3
	setflag FLAG_HIDE_OAK_IN_PALLET_TOWN
	warp MAP_PALLET_TOWN_PROFESSOR_OAKS_LAB, 5, 12
	waitstate
	releaseall
	end

PalletTown_EventScript_EndOakRatingScene::
	closemessage
	applymovement LOCALID_PALLET_PROF_OAK, PalletTown_Movement_OakExit
	waitmovement 0
	removeobject LOCALID_PALLET_PROF_OAK
	setvar VAR_MAP_SCENE_PALLET_TOWN_OAK, 3
	releaseall
	end

PalletTown_EventScript_NotEnoughMonsForNationalDex::
	msgbox PalletTown_Text_CaughtXPuttingInHonestEffort
	goto PalletTown_EventScript_EndOakRatingScene
	end

PalletTown_EventScript_NotBeenToOneIslandYet::
	msgbox PalletTown_Text_OakYouEnjoyingTraveling
	goto PalletTown_EventScript_EndOakRatingScene
	end

PalletTown_Movement_OakWalkToPlayersDoor::
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_faster_up
	step_end

PalletTown_Movement_OakExit::
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	step_end

PalletTown_Movement_OakWalkToLabFromHouse::
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	face_up
	step_end

PalletTown_Movement_PlayerWalkToLabFromHouse::
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

PalletTown_EventScript_OakTriggerLeft::
	lockall
	setvar VAR_TEMP_1, 0
	goto PalletTown_EventScript_OakTrigger
	end

PalletTown_EventScript_OakTriggerRight::
	lockall
	setvar VAR_TEMP_1, 1
	goto PalletTown_EventScript_OakTrigger
	end

PalletTown_EventScript_OakTrigger::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	famechecker FAMECHECKER_OAK, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	delay 30
	playbgm MUS_OAK, 0
	namebox Name_Oak
	message PalletTown_Text_AltoAhi
	waitmessage
	delay 85
	closemessage
	hidenamebox
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFasterDown
	waitmovement 0
	playse SE_PIN
	applymovement LOCALID_PLAYER, Common_Movement_ExclamationMark
	waitmovement 0
	delay 30
	addobject LOCALID_PALLET_PROF_OAK
	call_if_eq VAR_TEMP_1, 0, PalletTown_EventScript_OakEnterLeft
	call_if_eq VAR_TEMP_1, 1, PalletTown_EventScript_OakEnterRight
	delay 30
	namebox Name_Oak
	msgbox PalletTown_Text_CuidadoEnLaHierba
	closemessage
	hidenamebox
	delay 30
	playmoncry SPECIES_PIKACHU, 0
	call_if_eq VAR_TEMP_1, 0, PalletTown_EventScript_AparicionPikachuIzq
	call_if_eq VAR_TEMP_1, 1, PalletTown_EventScript_AparicionPikachuDer
	setobjectxy 4,14,2
	fadescreen FADE_TO_WHITE
	special StartOldManTutorialBattle
	waitstate
	lock
	playbgm MUS_OAK, 0
	namebox Name_Oak
	msgbox PalletTown_Text_EsoEstuvoCerca
	closemessage
	hidenamebox
	applymovement LOCALID_PALLET_PROF_OAK, Common_Movement_FaceUp
	applymovement LOCALID_PLAYER, Common_Movement_FaceDown
	waitmovement 0
	namebox Name_Oak
	msgbox PalletTown_Text_LosPokemonPueden
	closemessage
	hidenamebox
	delay 30
	@regresolaboratorio
	call_if_eq VAR_TEMP_1, 0, PuebloPaleta_EventScript_OakRegresoLabIzq
	call_if_eq VAR_TEMP_1, 1, PalletTown_EventScript_OakRegresoLabDer
	opendoor 21, 12
	waitdooranim

	applymovement LOCALID_PALLET_PROF_OAK, PalletTown_Movement_OakEntraLab
	applymovement LOCALID_PLAYER, PalletTown_Movement_PlayerEnterLab

	waitmovement 0
	closedoor 21, 12
	waitdooranim
	setvar VAR_MAP_SCENE_PALLET_TOWN_PROFESSOR_OAKS_LAB, 1
	clearflag FLAG_HIDE_OAK_IN_HIS_LAB
	setvar VAR_MAP_SCENE_PALLET_TOWN_OAK, 1
	setflag FLAG_HIDE_OAK_IN_PALLET_TOWN
	setflag FLAG_DONT_TRANSITION_MUSIC
	warp MAP_PALLET_TOWN_PROFESSOR_OAKS_LAB, 5, 12
	waitstate
	releaseall
	end


Movement_ExclamacionIzq::
	emote_exclamation_mark
	jump_in_place_right
	step_end

Movement_ExclamacionDer::
	emote_exclamation_mark
	jump_in_place_left
	step_end

Movement_Aparicion_PikachuIzq::
	set_visible
	step_end

Movement_Aparicion_PikachuDer::
	face_right
	set_visible
	step_end


PalletTown_EventScript_AparicionPikachuIzq::
	applymovement 3,Movement_ExclamacionIzq
	applymovement LOCALID_PLAYER, Movement_ExclamacionIzq
	waitmovement LOCALID_PLAYER
	waitmovement 3
	setobjectxy 4,13,1
	waitmoncry
	delay 30
	applymovement 4, Movement_Aparicion_PikachuIzq
	waitmovement 4
	return

PalletTown_EventScript_AparicionPikachuDer::
	applymovement 3,Movement_ExclamacionDer
	applymovement LOCALID_PLAYER, Movement_ExclamacionDer
	waitmovement LOCALID_PLAYER
	waitmovement 3
	applymovement 4, Movement_Aparicion_PikachuDer
	waitmovement 4
	setobjectxy 4,12,1
	waitmoncry
	delay 30
	return

PalletTown_EventScript_OakEnterLeft::
	applymovement LOCALID_PALLET_PROF_OAK, PalletTown_Movement_OakEnterLeft
	waitmovement 0
	return

PalletTown_EventScript_OakEnterRight::
	applymovement LOCALID_PALLET_PROF_OAK, PalletTown_Movement_OakEnterRight
	waitmovement 0
	return

PuebloPaleta_EventScript_OakRegresoLabIzq::
	applymovement LOCALID_PALLET_PROF_OAK, PuebloPaleta_Movement_RegresoLabOakIzq
	applymovement LOCALID_PLAYER, PuebloPaleta_EventScript_PlayerRegresoLabIzq
	waitmovement 0
	return

PalletTown_EventScript_OakRegresoLabDer::
	applymovement LOCALID_PALLET_PROF_OAK, PuebloPaleta_Movement_RegresoLabOakDer
	applymovement LOCALID_PLAYER, PuebloPaleta_EventScript_PlayerRegresoLabDer
	waitmovement 0
	return

PalletTown_Movement_OakEnterLeft::
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

PalletTown_Movement_OakEnterRight::
	walk_right
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

PuebloPaleta_Movement_RegresoLabOakIzq::
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right	
	step_end

PuebloPaleta_Movement_RegresoLabOakDer::
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

PalletTown_Movement_OakEntraLab::
	walk_up
	set_invisible
	step_end

PuebloPaleta_EventScript_PlayerRegresoLabIzq::
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

PuebloPaleta_EventScript_PlayerRegresoLabDer::
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

PalletTown_Movement_PlayerEnterLab::
	walk_right
	face_up
	set_invisible
	step_end

PalletTown_EventScript_SignLady::
	lock
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 2, PalletTown_EventScript_SignLadyDone
	goto_if_eq VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 1, PalletTown_EventScript_SignLadyJustShowedSign
	goto_if_eq SIGN_LADY_READY, TRUE, PalletTown_EventScript_SignLadyStartShowSign
	goto_if_set FLAG_TEMP_2, PalletTown_EventScript_SignLadyGoReadSign
	msgbox PalletTown_Text_HmmIsThatRight
	applymovement LOCALID_PALLET_SIGN_LADY, Common_Movement_FacePlayer
	waitmovement 0
	playse SE_PIN
	applymovement LOCALID_PALLET_SIGN_LADY, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_PALLET_SIGN_LADY, Common_Movement_Delay48
	waitmovement 0
	msgbox PalletTown_Text_OhLookLook
	closemessage
	call_if_eq VAR_FACING, DIR_EAST, PalletTown_EventScript_SignLadyMoveOutOfWayRight
	call_if_ne VAR_FACING, DIR_EAST, PalletTown_EventScript_SignLadyMoveOutOfWayLeft
	copyobjectxytoperm LOCALID_PALLET_SIGN_LADY
	setflag FLAG_TEMP_2
	release
	end

PalletTown_EventScript_SignLadyMoveOutOfWayRight::
	applymovement LOCALID_PALLET_SIGN_LADY, PalletTown_Movement_SignLadyMoveOutOfWayRight
	waitmovement 0
	return

PalletTown_EventScript_SignLadyMoveOutOfWayLeft::
	applymovement LOCALID_PALLET_SIGN_LADY, PalletTown_Movement_SignLadyMoveOutOfWayLeft
	waitmovement 0
	return

PalletTown_EventScript_SignLadyDone::
	applymovement LOCALID_PALLET_SIGN_LADY, Common_Movement_FacePlayer
	waitmovement 0
	msgbox PalletTown_Text_YoTambienEntreno
	release
	end

PalletTown_EventScript_SignLadyGoReadSign::
	applymovement LOCALID_PALLET_SIGN_LADY, Common_Movement_FacePlayer
	waitmovement 0
	msgbox PalletTown_Text_ReadItReadIt
	release
	end

PalletTown_EventScript_SignLadyJustShowedSign::
	applymovement LOCALID_PALLET_SIGN_LADY, Common_Movement_FacePlayer
	waitmovement 0
	msgbox PalletTown_Text_SignsAreUsefulArentThey
	release
	end

PalletTown_Movement_SignLadyMoveOutOfWayRight::
	walk_right
	walk_in_place_faster_left
	step_end

PalletTown_Movement_SignLadyMoveOutOfWayLeft::
	walk_left
	walk_in_place_faster_right
	step_end

PalletTown_EventScript_FatMan::
	msgbox PalletTown_Text_LaTecnologiaEs, MSGBOX_NPC
	end

PalletTown_EventScript_OaksLabSign::
	lockall
	famechecker FAMECHECKER_OAK, 0
	msgbox PalletTown_Text_LaboratorioDeInvestigacion
	releaseall
	end

PalletTown_EventScript_PlayersHouseSign::
	msgbox PalletTown_Text_CasaPlayer, MSGBOX_SIGN
	end

PalletTown_EventScript_RivalsHouseSign::
	msgbox PalletTown_Text_CasaRival, MSGBOX_SIGN
	end

PalletTown_EventScript_TownSign::
	msgbox PalletTown_Text_LetreroPueblo, MSGBOX_SIGN
	end

PalletTown_EventScript_TrainerTips::
	lockall
	msgbox PalletTown_Text_PressStartToOpenMenu
	setvar VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 1
	releaseall
	end

PalletTown_EventScript_SignLadyTrigger::
	lockall
	applymovement LOCALID_PALLET_SIGN_LADY, Common_Movement_WalkInPlaceFasterRight
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
	waitmovement 0
	call PalletTown_EventScript_SignLadyShowSign
	releaseall
	end

PalletTown_EventScript_SignLadyShowSign::
	textcolor NPC_TEXT_COLOR_FEMALE
	msgbox PalletTown_Text_LookCopiedTrainerTipsSign
	closemessage
	delay 20
	textcolor NPC_TEXT_COLOR_NEUTRAL
	setflag FLAG_OPENED_START_MENU
	setvar VAR_MAP_SCENE_PALLET_TOWN_SIGN_LADY, 1
	setvar SIGN_LADY_READY, FALSE
	special SetWalkingIntoSignVars
	special DisableMsgBoxWalkaway
	signmsg
	msgbox PalletTown_Text_PressStartToOpenMenuCopy
	normalmsg
	return

PalletTown_EventScript_SignLadyStartShowSign::
	applymovement LOCALID_PALLET_SIGN_LADY, Common_Movement_FacePlayer
	waitmovement 0
	call PalletTown_EventScript_SignLadyShowSign
	release
	end

@ZAPATILLAS DEPORTIVAS - TRIGGER
PalletTown_RunningShoes_Trigger::
	lock
	faceplayer
	setvar VAR_TEMP_1, 0
	playse SE_PIN
	applymovement LOCALID_PALLET_MOM, PalletTown_Movement_MiraDerechaExclamacion
	waitmovement 0
	applymovement LOCALID_PLAYER, PalletTown_Movement_MiraIzquierda
	waitmovement 0
	call PalletTown_EventScript_RunningShoes_Shared
	applymovement LOCALID_PALLET_MOM, PalletTown_Movement_MamaRegreso2
	waitmovement 0
	goto PalletTown_EventScript_RunningShoes_MomEntersHouse

@ZAPATILLAS DEPORTIVAS - TRIGGER
PalletTown_EventScript_RunningShoes_Shared::
	namebox Name_Mama
	msgbox PalletTown_Text_RunningShoes_EsperaUnMomento
	hidenamebox
	closemessage

	signmsg
	msgbox PalletTown_Text_RunningShoes_RecibisteZapatillas
	normalmsg
	delay_16
	waitmessage
	waitfanfare
	playfanfare MUS_OBTAIN_KEY_ITEM

	namebox Name_Mama
	msgbox PalletTown_Text_RunningShoes_SonUnasZapatillas
	hidenamebox
	closemessage
	

	namebox Name_Mama
	msgbox PalletTown_Text_RunningShoes_NoOlvides
	hidenamebox
	closemessage
	return

@ZAPATILLAS DEPORTIVAS - MAMA
PalletTown_EventScript_RunningShoes_Mom::
	playse SE_PIN
	call PalletTown_EventScript_RunningShoes_Shared
	applymovement LOCALID_PALLET_MOM, PalletTown_Movement_MamaRegreso1
	waitmovement 0	
	goto PalletTown_EventScript_RunningShoes_MomEntersHouse

PalletTown_EventScript_RunningShoes_MomEntersHouse::
  	opendoor 7, 6
	waitdooranim
	removeobject LOCALID_PALLET_MOM
	closedoor 7, 6
	waitdooranim
	setflag FLAG_SYS_B_DASH
	setflag FLAG_HIDE_PEWTER_CITY_RUNNING_SHOES_GUY
	clearflag FLAG_HIDE_PALLET_TOWN_HOUSE_MOM
	setvar VAR_MAP_SCENE_PEWTER_CITY, 0
	release
	end

PalletTown_Movement_MiraDerechaExclamacion::
	emote_exclamation_mark
	face_right
	step_end

PalletTown_Movement_MiraIzquierda::
	walk_in_place_up
	face_left
	step_end

PalletTown_Movement_MamaTrigger::
	emote_exclamation_mark
	face_right
	step_end

PalletTown_Movement_MamaRegreso1::
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	face_up
	step_end

PalletTown_Movement_MamaRegreso2::
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	face_up
	step_end