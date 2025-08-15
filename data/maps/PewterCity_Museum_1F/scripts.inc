PewterCity_Museum_1F_MapScripts::
	.byte 0

PewterCity_Museum_1F_EventScript_Scientist1::
	lock
	faceplayer
	goto_if_eq VAR_FACING, DIR_WEST, PewterCity_Museum_1F_EventScript_Scientist1BehindCounter
	goto_if_eq VAR_FACING, DIR_SOUTH, PewterCity_Museum_1F_EventScript_Scientist1BehindCounter
	goto_if_eq VAR_FACING, DIR_NORTH, PewterCity_Museum_1F_EventScript_Scientist1BehindCounter
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_Museum_1F_Text_PleaseEnjoyYourself MSGBOX_NPC
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_EventScript_Scientist1BehindCounter::
	faceplayer
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_Museum_1F_Text_PleaseEnjoyYourself MSGBOX_NPC
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_EventScript_AmberHasGeneticMatter::
	msgbox PewterCity_Museum_1F_Text_AmberContainsGeneticMatter
	applymovement LOCALID_MUSEUM_SCIENTIST1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

PewterCity_Museum_1F_EventScript_ExplainAmber::
	msgbox PewterCity_Museum_1F_Text_AmberIsFossilizedSap
	applymovement LOCALID_MUSEUM_SCIENTIST1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

PewterCity_Museum_1F_EventScript_EntranceTriggerLeft::
	lockall
	setvar VAR_TEMP_1, 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFasterRight
	waitmovement 0
	goto PewterCity_Museum_1F_EventScript_EntranceTrigger
	end

PewterCity_Museum_1F_EventScript_EntranceTriggerMid::
	lockall
	setvar VAR_TEMP_1, 1
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFasterRight
	waitmovement 0
	goto PewterCity_Museum_1F_EventScript_EntranceTrigger
	end

PewterCity_Museum_1F_EventScript_EntranceTriggerRight::
	lockall
	setvar VAR_TEMP_1, 2
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFasterRight
	waitmovement 0
	goto PewterCity_Museum_1F_EventScript_EntranceTrigger
	end

PewterCity_Museum_1F_EventScript_EntranceTrigger::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	showmoneybox 0, 0
	msgbox PewterCity_Museum_1F_Text_Its50YForChildsTicket, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, YES, PewterCity_Museum_1F_EventScript_TryPayForTicket
	msgbox PewterCity_Museum_1F_Text_ComeAgain
	closemessage
	hidemoneybox
	applymovement LOCALID_PLAYER, PewterCity_Museum_1F_Movement_ForcePlayerExit
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_EventScript_TryPayForTicket::
	checkmoney 100
	goto_if_eq VAR_RESULT, FALSE, PewterCity_Museum_1F_EventScript_NotEnoughMoney
	closemessage
	call_if_eq VAR_TEMP_1, 0, PewterCity_Museum_1F_EventScript_PlayerApproachCounterLeft
	call_if_eq VAR_TEMP_1, 1, PewterCity_Museum_1F_EventScript_PlayerApproachCounterMid
	call_if_eq VAR_TEMP_1, 2, PewterCity_Museum_1F_EventScript_PlayerApproachCounterRight
	playse SE_SHOP
	removemoney 100
	updatemoneybox
	waitse
	msgbox PewterCity_Museum_1F_Text_Right50YThankYou
	setvar VAR_MAP_SCENE_PEWTER_CITY_MUSEUM_1F, 1
	hidemoneybox
	releaseall
	end

PewterCity_Museum_1F_EventScript_PlayerApproachCounterLeft::
	applymovement LOCALID_PLAYER, PewterCity_Museum_1F_Movement_ApproachCounterLeft
	waitmovement 0
	return

PewterCity_Museum_1F_EventScript_PlayerApproachCounterMid::
	applymovement LOCALID_PLAYER, PewterCity_Museum_1F_Movement_ApproachCounterMid
	waitmovement 0
	return

PewterCity_Museum_1F_EventScript_PlayerApproachCounterRight::
	applymovement LOCALID_PLAYER, PewterCity_Museum_1F_Movement_ApproachCounterRight
	waitmovement 0
	return

PewterCity_Museum_1F_EventScript_NotEnoughMoney::
	msgbox PewterCity_Museum_1F_Text_DontHaveEnoughMoney
	closemessage
	hidemoneybox
	applymovement LOCALID_PLAYER, PewterCity_Museum_1F_Movement_ForcePlayerExit
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_Movement_ForcePlayerExit::
	walk_down
	step_end

PewterCity_Museum_1F_Movement_ApproachCounterLeft::
	walk_right
	walk_right
	delay_8
	walk_in_place_right
	step_end

PewterCity_Museum_1F_Movement_ApproachCounterMid::
	step_end

PewterCity_Museum_1F_Movement_ApproachCounterRight::
	delay_8
	walk_in_place_right
	step_end

PewterCity_Museum_1F_EventScript_Scientist2::
	msgbox PewterCity_Museum_1F_Text_WeHaveTwoFossilsOnExhibit, MSGBOX_NPC
	end

PewterCity_Museum_1F_EventScript_OldMan::
	msgbox PewterCity_Museum_1F_Text_ShouldBeGratefulForLongLife, MSGBOX_NPC
	end

PewterCity_Museum_1F_EventScript_OldAmberScientist::
	lock
	faceplayer
	goto_if_set FLAG_GOT_OLD_AMBER, PewterCity_Museum_1F_EventScript_AlreadyGotOldAmber
	msgbox PewterCity_Museum_1F_Text_WantYouToGetAmberExamined
	checkitemspace ITEM_OLD_AMBER
	goto_if_eq VAR_RESULT, FALSE, PewterCity_Museum_1F_EventScript_NoRoomForOldAmber
	setflag FLAG_GOT_OLD_AMBER
	removeobject LOCALID_OLD_AMBER
	giveitem_msg PewterCity_Museum_1F_Text_ReceivedOldAmberFromMan, ITEM_OLD_AMBER, 1, MUS_OBTAIN_KEY_ITEM
	release
	end

PewterCity_Museum_1F_EventScript_NoRoomForOldAmber::
	msgbox PewterCity_Museum_1F_Text_DontHaveSpaceForThis
	release
	end

PewterCity_Museum_1F_EventScript_AlreadyGotOldAmber::
	msgbox PewterCity_Museum_1F_Text_GetOldAmberChecked
	release
	end

PewterCity_Museum_1F_EventScript_OldAmber::
	msgbox PewterCity_Museum_1F_Text_BeautifulPieceOfAmber, MSGBOX_NPC
	end

PewterCity_Museum_1F_EventScript_AerodactylFossil::
	lockall
	setvar VAR_0x8004, SPECIES_AERODACTYL
	setvar VAR_0x8005, 10
	setvar VAR_0x8006, 3
	special OpenMuseumFossilPic
	signmsg
	msgbox PewterCity_Museum_1F_Text_AerodactylFossil
	normalmsg
	waitmessage
	special CloseMuseumFossilPic
	releaseall
	end

PewterCity_Museum_1F_EventScript_KabutopsFossil::
	lockall
	setvar VAR_0x8004, SPECIES_KABUTOPS
	setvar VAR_0x8005, 10
	setvar VAR_0x8006, 3
	special OpenMuseumFossilPic
	msgbox PewterCity_Museum_1F_Text_KabutopsFossil
	special CloseMuseumFossilPic
	releaseall
	end

PewterCity_Museum_1F_EventScript_Montanero::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_Museum_1F_Text_Montanero
	releaseall
	end

@NPC CLASE
PewterCity_Museum_1F_EventScript_NPC01::
	faceplayer
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_Museum_1F_Text_NPC01 MSGBOX_NPC
	applymovement 2, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_EventScript_NPC02::
	faceplayer
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_Museum_1F_Text_NPC02 MSGBOX_NPC
	applymovement 6, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_EventScript_NPC03::
	faceplayer
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_Museum_1F_Text_NPC03 MSGBOX_NPC
	applymovement 12, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_EventScript_NPC04::
	faceplayer
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_Museum_1F_Text_NPC04 MSGBOX_NPC
	applymovement 13, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_EventScript_NPC05::
	faceplayer
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_Museum_1F_Text_NPC05 MSGBOX_NPC
	applymovement 11, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

@cientifico npc
PewterCity_Museum_1F_EventScript_NPC06::
	faceplayer
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_Museum_1F_Text_NPC06 MSGBOX_NPC
	applymovement 9, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_EventScript_Brock::
	lock
	setvar VAR_PEWTER_CITY_MUSSEUM_BROCK,2
	applymovement LOCALID_PLAYER, Common_Movement_FaceUp
	waitmovement 0
	special SpawnCameraObject
	applymovement LOCALID_CAMERA, Common_Movement_WalkUp3
	waitmovement 0
	special RemoveCameraObject
	textcolor NPC_TEXT_COLOR_NEUTRAL	
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_AsiEsComoLosFosiles
	closemessage
	applymovement LOCALID_MUSEUM_BROCK, PewterCity_Museum_1F_Move_Brock
	waitmovement 0
	checkplayergender
	call_if_eq VAR_RESULT, FEMALE, PewterCity_Museum_1F_EventScript_PareceQueTenemosUna
	call_if_eq VAR_RESULT, MALE, PewterCity_Museum_1F_EventScript_PareceQueTenemosUn
	applymovement LOCALID_MUSEUM_SPECTATOR1, Common_Movement_FaceDown
	applymovement LOCALID_MUSEUM_SPECTATOR2, PewterCity_Museum_1F_Move_Publico2
	applymovement LOCALID_MUSEUM_SPECTATOR3, Common_Movement_FaceDown
	applymovement LOCALID_MUSEUM_SPECTATOR4, PewterCity_Museum_1F_Move_Publico2
	applymovement LOCALID_MUSEUM_SPECTATOR5, Common_Movement_FaceDown
	waitmovement 0
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_SiempreEmocionado
	closemessage
	applymovement LOCALID_MUSEUM_SPECTATOR1, Common_Movement_FaceUp
	applymovement LOCALID_MUSEUM_SPECTATOR2, Common_Movement_FaceUp
	applymovement LOCALID_MUSEUM_SPECTATOR3, Common_Movement_FaceUp
	applymovement LOCALID_MUSEUM_SPECTATOR4, Common_Movement_FaceUp
	applymovement LOCALID_MUSEUM_SPECTATOR5, Common_Movement_FaceUp
	waitmovement 0
	special SpawnCameraObject
	applymovement LOCALID_CAMERA, Common_Movement_WalkDown3
	waitmovement 0
	special RemoveCameraObject
	setflag FLAG_HIDE_PEWTER_CITY_MUSEUM_BROCK_AND_SPECTATOR
	releaseall
	end

PewterCity_Museum_1F_EventScript_PareceQueTenemosUna::
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_PareceQueTenemosUna
	closemessage
	return

PewterCity_Museum_1F_EventScript_PareceQueTenemosUn::
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_PareceQueTenemosUn
	closemessage
	return

PewterCity_Museum_1F_EventScript_BrockNoTeVayas::
	setvar VAR_PEWTER_CITY_MUSSEUM_BROCK,2
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_BrockNoTeVayas
	closemessage
	applymovement LOCALID_PLAYER, Common_Movement_WalkUp
	waitmovement 0
	releaseall
	end

PewterCity_Museum_1F_Move_Brock::
	emote_exclamation_mark
	walk_in_place_down
	step_end

PewterCity_Museum_1F_Move_Publico2::
	emote_question_mark
	face_down
	step_end

PewterCity_Museum_1F_EventScript_KabutoSign::
	lock
	goto_if_set FLAG_HIDE_PEWTER_CITY_BROCK_EVENT_FINISHED, PewterCity_Museum_1F_EventScript_KabutoSignFinished @EVENTO TERMINADO
	setflag FLAG_PEWTER_CITY_MUSEUM_BROCK_KABUTO
	special SetSeenMon
	setvar VAR_0x8004, SPECIES_KABUTO
	showmonpic SPECIES_KABUTO, 10, 3
	signmsg
	msgbox PewterCity_Museum_1F_Text_Fosil1
	normalmsg
	waitmessage
	hidemonpic
	goto_if_set FLAG_HIDE_PEWTER_CITY_MUSEUM_BROCK_OMANYTE, PewterCity_Museum_1F_EventScript_CheckKabuto @si ya se vio el otro fosil
	release
	end

PewterCity_Museum_1F_EventScript_OmanyteSign::
	lock
	goto_if_set FLAG_HIDE_PEWTER_CITY_BROCK_EVENT_FINISHED, PewterCity_Museum_1F_EventScript_OmanyteSignFinished @EVENTO TERMINADO
	setflag FLAG_HIDE_PEWTER_CITY_MUSEUM_BROCK_OMANYTE
	special SetSeenMon
	setvar VAR_0x8004, SPECIES_OMANYTE
	showmonpic SPECIES_OMANYTE, 10, 3
	signmsg
	msgbox PewterCity_Museum_1F_Text_Fosil2
	normalmsg
	hidemonpic
	waitmessage
	goto_if_set FLAG_PEWTER_CITY_MUSEUM_BROCK_KABUTO, PewterCity_Museum_1F_EventScript_CheckOmanyte @si ya se vio el otro fosil
	release
	end

PewterCity_Museum_1F_EventScript_CheckOmanyte::
	lockall
	goto_if_set FLAG_HIDE_PEWTER_CITY_MUSEUM_BROCK_OMANYTE, PewterCity_Museum_1F_EventScript_BrockFinishedKabuto
	releaseall
	end

PewterCity_Museum_1F_EventScript_CheckKabuto::
	lockall
	goto_if_set FLAG_PEWTER_CITY_MUSEUM_BROCK_KABUTO, PewterCity_Museum_1F_EventScript_BrockFinishedOmanyte
	releaseall
	end

PewterCity_Museum_1F_EventScript_OmanyteSignFinished::
	lock
	special SetSeenMon
	setvar VAR_0x8004, SPECIES_OMANYTE
	showmonpic SPECIES_OMANYTE, 10, 3
	signmsg
	msgbox PewterCity_Museum_1F_Text_Fosil2
	normalmsg
	hidemonpic
	waitmessage
	release
	end

PewterCity_Museum_1F_EventScript_KabutoSignFinished::
	special SetSeenMon
	setvar VAR_0x8004, SPECIES_KABUTO
	showmonpic SPECIES_KABUTO, 10, 3
	signmsg
	msgbox PewterCity_Museum_1F_Text_Fosil2
	normalmsg
	waitmessage
	hidemonpic
	release
	end

PewterCity_Museum_1F_EventScript_BrockFinishedOmanyte::
	lockall
	setflag FLAG_HIDE_PEWTER_CITY_BROCK_EVENT_FINISHED
	applymovement LOCALID_PLAYER, PewterCity_Museum_1F_Move_ExclamationMarkFaceRightPlayer 
	waitmovement 0
	@MUSICA CLASES
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_LosFosilesNosEnsenan
	closemessage
	fadescreen FADE_TO_BLACK
	setobjectxy LOCALID_MUSEUM_SPECTATOR1,13,13
	setobjectxy LOCALID_MUSEUM_SPECTATOR2,13,13
	setobjectxy LOCALID_MUSEUM_SPECTATOR3,13,13
	setobjectxy LOCALID_MUSEUM_SPECTATOR4,13,13
	setobjectxy LOCALID_MUSEUM_SPECTATOR5,13,13
	fadescreen FADE_FROM_BLACK
	@MUSICA DESAFIO
	applymovement LOCALID_MUSEUM_BROCK, PewterCity_Museum_1F_Move_WalkRightBrock
	waitmovement 0
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_HolaEntrenadora
	closemessage
	applymovement LOCALID_MUSEUM_BROCK, PewterCity_Museum_1F_Move_LookAroundRightBrock
	waitmovement 0	
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_HeOidoQue
	closemessage
	applymovement LOCALID_MUSEUM_BROCK, PewterCity_Museum_1F_Move_SalidaBrockRight
	waitmovement 0	
	setvar VAR_PEWTER_CITY_MUSSEUM_BROCK,3
	setobjectxy LOCALID_MUSEUM_BROCK,13,13
	@MUSICA MUSEO
	releaseall
	end

PewterCity_Museum_1F_EventScript_BrockFinishedKabuto::
	lockall
	setflag FLAG_HIDE_PEWTER_CITY_BROCK_EVENT_FINISHED
	normalmsg
	textcolor NPC_TEXT_COLOR_NEUTRAL
	applymovement LOCALID_PLAYER, PewterCity_Museum_1F_Move_ExclamationMarkFaceLeftPlayer 
	waitmovement 0
	@MUSICA CLASES
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_LosFosilesNosEnsenan
	closemessage
	fadescreen FADE_TO_BLACK
	setobjectxy LOCALID_MUSEUM_SPECTATOR1,13,13
	setobjectxy LOCALID_MUSEUM_SPECTATOR2,13,13
	setobjectxy LOCALID_MUSEUM_SPECTATOR3,13,13
	setobjectxy LOCALID_MUSEUM_SPECTATOR4,13,13
	setobjectxy LOCALID_MUSEUM_SPECTATOR5,13,13
	fadescreen FADE_FROM_BLACK
	@MUSICA DESAFIO
	applymovement LOCALID_MUSEUM_BROCK, PewterCity_Museum_1F_Move_WalkLeftBrock
	waitmovement 0	
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_HolaEntrenadora
	closemessage
	applymovement LOCALID_MUSEUM_BROCK, PewterCity_Museum_1F_Move_LookAroundLeftBrock
	waitmovement 0	
	namebox Name_Brock
	msgbox PewterCity_Museum_1F_Text_HeOidoQue
	closemessage
	applymovement LOCALID_MUSEUM_BROCK, PewterCity_Museum_1F_Move_SalidaBrockLeft
	waitmovement 0	
	setvar VAR_PEWTER_CITY_MUSSEUM_BROCK,3
	setobjectxy LOCALID_MUSEUM_BROCK,13,13
	@MUSICA MUSEO
	releaseall
	end

PewterCity_Museum_1F_Move_ExclamationMarkFaceRightPlayer::
	emote_exclamation_mark
	face_right
	step_end

PewterCity_Museum_1F_Move_ExclamationMarkFaceLeftPlayer::
	emote_exclamation_mark
	face_left
	step_end

PewterCity_Museum_1F_Move_WalkRightBrock::
	face_left
	delay_16
	delay_16
	walk_down
	walk_left
	walk_left
	walk_left
	step_end

PewterCity_Museum_1F_Move_WalkLeftBrock::
	face_right
	delay_16
	delay_16
	walk_down
	walk_right
	walk_right
	walk_right
	step_end

PewterCity_Museum_1F_Move_LookAroundRightBrock::
	face_right
	delay_16
	face_down
	delay_16
	face_up
	delay_16
	face_left
	delay_16
	step_end

PewterCity_Museum_1F_Move_LookAroundLeftBrock::
	face_left
	delay_16
	face_down
	delay_16
	face_up
	delay_16
	face_right
	delay_16
	step_end

PewterCity_Museum_1F_Move_SalidaBrockRight::
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

PewterCity_Museum_1F_Move_SalidaBrockLeft::
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end