MtMoon_1F_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, MtMoon_1F_OnTransition
	.byte 0

MtMoon_1F_OnTransition::
	setworldmapflag FLAG_WORLD_MAP_MT_MOON_1F
	end

MtMoon_1F_EventScript_ZubatSign::
	msgbox MtMoon_1F_Text_ZubatIsABloodsucker, MSGBOX_SIGN
	end

MtMoon_1F_EventScript_Sign01::
	msgbox MtMoon_1F_Text_Sign01, MSGBOX_SIGN
	end

MtMoon_1F_EventScript_Marcos::
	trainerbattle_single TRAINER_HIKER_MARCOS, MtMoon_1F_Text_MarcosIntro, MtMoon_1F_Text_MarcosDefeat
	msgbox MtMoon_1F_Text_MarcosPostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_1F_EventScript_Josh::
	trainerbattle_single TRAINER_YOUNGSTER_JOSH, MtMoon_1F_Text_JoshIntro, MtMoon_1F_Text_JoshDefeat
	msgbox MtMoon_1F_Text_JoshPostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_1F_EventScript_Miriam::
	trainerbattle_single TRAINER_LASS_MIRIAM, MtMoon_1F_Text_MiriamIntro, MtMoon_1F_Text_MiriamDefeat
	msgbox MtMoon_1F_Text_MiriamPostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_1F_EventScript_Iris::
	trainerbattle_single TRAINER_LASS_IRIS, MtMoon_1F_Text_IrisIntro, MtMoon_1F_Text_IrisDefeat
	msgbox MtMoon_1F_Text_IrisPostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_1F_EventScript_Jovan::
	trainerbattle_single TRAINER_SUPER_NERD_JOVAN, MtMoon_1F_Text_JovanIntro, MtMoon_1F_Text_JovanDefeat
	msgbox MtMoon_1F_Text_JovanPostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_1F_EventScript_Kent::
	trainerbattle_single TRAINER_BUG_CATCHER_KENT, MtMoon_1F_Text_KentIntro, MtMoon_1F_Text_KentDefeat
	msgbox MtMoon_1F_Text_KentPostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_1F_EventScript_Robby::
	trainerbattle_single TRAINER_BUG_CATCHER_ROBBY, MtMoon_1F_Text_RobbyIntro, MtMoon_1F_Text_RobbyDefeat
	msgbox MtMoon_1F_Text_RobbyPostBattle, MSGBOX_AUTOCLOSE
	end

@ENCUENTRO SILVIO
MtMoon_1F_EventScript_SilvioIzq::
	setflag FLAG_HIDE_MT_MOON_HIDE_SILVIO
	setobjectxy LOCALID_MT_MOON_SILVIO,30,15
	applymovement LOCALID_PLAYER, MtMoon_1F_Movement_PlayerCamina
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioAparece
	waitmovement 0
	namebox Name_Desconociodo
	msgbox MtMoon_1F_Text_Silvio_EsperaUnSegundo
	closemessage
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioExclamacion
	waitmovement 0
	checkplayergender
	call_if_eq VAR_RESULT, FEMALE, MtMoon_1F_EventScript_Silvio_EresEntrenadora
	call_if_eq VAR_RESULT, MALE, MtMoon_1F_EventScript_Silvio_EresEntrenador
	applymovement LOCALID_PLAYER, MtMoon_1F_Movement_PlayerEsperaPaso
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_CLEFAIRY,31,16
	applymovement LOCALID_MT_MOON_CLEFAIRY MtMoon_1F_Movement_SilvioCamina
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioCamina
	waitmovement 0
	namebox Name_Desconociodo
	msgbox MtMoon_1F_Text_Silvio_QueSorpresa
	closemessage
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioMiraAlrededor
	waitmovement 0
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioSalto
	waitmovement 0
	namebox Name_Silvio
	msgbox MtMoon_1F_Text_EsteLugar
	closemessage
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioSalto
	waitmovement 0
	namebox Name_Silvio
	msgbox MtMoon_1F_Text_SilvioIntro
	closemessage
	trainerbattle_no_intro TRAINER_SILVIO, MtMoon_1F_Text_SilvioDefeat
	msgbox MtMoon_1F_Text_CuandoVuelvas
	closemessage
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioSalida
	applymovement LOCALID_MT_MOON_CLEFAIRY MtMoon_1F_Movement_ClefarySalida
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_SILVIO,30,21
	setobjectxy LOCALID_MT_MOON_CLEFAIRY,30,22
	setflag FLAG_SILVIO_MART
	setvar VAR_MT_MOON_SILVIO, 1
	release
	end

MtMoon_1F_EventScript_SilvioRight::
	setflag FLAG_HIDE_MT_MOON_HIDE_SILVIO
	setobjectxy LOCALID_MT_MOON_SILVIO,30,15
	applymovement LOCALID_PLAYER, MtMoon_1F_Movement_PlayerCamina
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioAparece
	waitmovement 0
	namebox Name_Desconociodo
	msgbox MtMoon_1F_Text_Silvio_EsperaUnSegundo
	closemessage
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioExclamacion
	waitmovement 0
	checkplayergender
	call_if_eq VAR_RESULT, FEMALE, MtMoon_1F_EventScript_Silvio_EresEntrenadora
	call_if_eq VAR_RESULT, MALE, MtMoon_1F_EventScript_Silvio_EresEntrenador
	applymovement LOCALID_PLAYER, MtMoon_1F_Movement_PlayerEspera
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_CLEFAIRY,31,16
	applymovement LOCALID_MT_MOON_CLEFAIRY MtMoon_1F_Movement_SilvioCamina
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioCamina
	waitmovement 0
	namebox Name_Desconociodo
	msgbox MtMoon_1F_Text_Silvio_QueSorpresa
	closemessage
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioMiraAlrededor
	waitmovement 0
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioSalto
	waitmovement 0
	namebox Name_Silvio
	msgbox MtMoon_1F_Text_EsteLugar	
	closemessage
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioSalto
	waitmovement 0
	namebox Name_Silvio
	msgbox MtMoon_1F_Text_SilvioIntro
	closemessage
	trainerbattle_no_intro TRAINER_SILVIO, MtMoon_1F_Text_SilvioDefeat
	msgbox MtMoon_1F_Text_CuandoVuelvas
	closemessage
	applymovement LOCALID_MT_MOON_SILVIO MtMoon_1F_Movement_SilvioSalida
	applymovement LOCALID_MT_MOON_CLEFAIRY MtMoon_1F_Movement_ClefarySalida
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_SILVIO,30,21
	setobjectxy LOCALID_MT_MOON_CLEFAIRY,30,22
	setflag FLAG_SILVIO_MART
	setvar VAR_MT_MOON_SILVIO, 1
	release
	end

MtMoon_1F_EventScript_Silvio_EresEntrenadora::
	namebox Name_Desconociodo
	msgbox MtMoon_1F_Text_Silvio_EresEntrenadora
	closemessage
	return

MtMoon_1F_EventScript_Silvio_EresEntrenador::
	namebox Name_Desconociodo
	msgbox MtMoon_1F_Text_Silvio_EresEntrenador
	
	closemessage
	return

MtMoon_1F_Movement_PlayerCamina::
	walk_up
	walk_up
	walk_up
	jump_in_place_right
	step_end

MtMoon_1F_Movement_PlayerEspera::
	jump_in_place_right
	emote_question_mark
	step_end

MtMoon_1F_Movement_PlayerEsperaPaso::
	jump_in_place_right
	emote_question_mark
	walk_right
	step_end

MtMoon_1F_Movement_SilvioAparece::
	walk_down
	delay_16
	delay_16
	face_left
	delay_16
	delay_16
	face_right
	delay_16
	delay_16
	jump_in_place_left
	step_end

MtMoon_1F_Movement_SilvioExclamacion::
	emote_exclamation_mark
	step_end

MtMoon_1F_Movement_SilvioCamina::
	walk_left
	walk_left
	step_end
	
MtMoon_1F_Movement_SilvioMiraAlrededor::
	face_right
	delay_16
	face_up
	delay_16
	face_up
	delay_16
	face_down
	delay_16
	face_left
	step_end

MtMoon_1F_Movement_SilvioSalto::
	walk_in_place_left
	jump_in_place_left
	walk_in_place_left
	step_end


MtMoon_1F_Movement_SilvioSalida::
	walk_down
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

MtMoon_1F_Movement_ClefarySalida::
	walk_left
	walk_down
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end