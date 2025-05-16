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
	setvar VAR_0x4090, 0
	end

MtMoon_1F_EventScript_Kent::
	trainerbattle_single TRAINER_BUG_CATCHER_KENT, MtMoon_1F_Text_KentIntro, MtMoon_1F_Text_KentDefeat
	msgbox MtMoon_1F_Text_KentPostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_1F_EventScript_Robby::
	trainerbattle_single TRAINER_BUG_CATCHER_ROBBY, MtMoon_1F_Text_RobbyIntro, MtMoon_1F_Text_RobbyDefeat
	msgbox MtMoon_1F_Text_RobbyPostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_1F_EventScript_Silvio::
	goto_if_set FLAG_SILVIO_MONTE_LUNA, MtMoon_1F_EventScript_SilvioTerminado
	setflag FLAG_HIDE_SILVIO
	setobjectxy 17,30,15													@APARECE SILVIO
	applymovement OBJ_EVENT_ID_PLAYER, MtMoon_1F_Movement_PlayerCamina		@PLAYER CAMINA
	applymovement 17 MtMoon_1F_Movement_SilvioAparece						@SILVIO SE SORPRENDE
	waitmovement 0
	
	namebox Name_Desconociodo
	msgbox MtMoon_1F_Text_Silvio_EsperaUnSegundo							@ESPERA UN SEGUNDO...
	hidenamebox
	closemessage

	applymovement 17, MtMoon_1F_Movement_SilvioMira							@SILVIO MIRA IZQUIERDA
	waitmovement 0
	
	namebox Name_Desconociodo
	msgbox MtMoon_1F_Text_Silvio_EresEntrenadora							@ERES ENTRENADORA
	hidenamebox
	closemessage

	applymovement OBJ_EVENT_ID_PLAYER, MtMoon_1F_Movement_PlayerEspera		@PLAYER ESPERA
	waitmovement 0
	applymovement 17 MtMoon_1F_Movement_SilvioCamina						@SILVIO SE ACERCA
	waitmovement 0

	namebox Name_Desconociodo
	msgbox MtMoon_1F_Text_Silvio_QueSorpresa								@QUE SORPRESA...
	hidenamebox	
	closemessage
	
	applymovement 17 MtMoon_1F_Movement_SilvioMiraAlrededor				@SILVIO MIRA ALREDEDOR
	waitmovement 0

	applymovement 17 MtMoon_1F_Movement_SilvioSalto 						@SILVIO SALTO EN EL LUGAR
	waitmovement 0

	msgbox MtMoon_1F_Text_Silvio_3
	applymovement 17 MtMoon_1F_Movement_SilvioSalto 						@SILVIO CAMINA EN EL LUEGAR
	waitmovement 0

	msgbox MtMoon_1F_Text_SilvioIntro 									@INTRODUCCIÓN BATALLA

	trainerbattle_no_intro TRAINER_SILVIO, MtMoon_1F_Text_SilvioDefeat	@BATALLA
	msgbox MtMoon_1F_Text_Silvio_4 										@INVITACION TIENDA
	applymovement 17 MtMoon_1F_Movement_SilvioSalida						@SILVIO SE VA
	waitmovement 0
	setobjectxy 17,30,21													@SILVIO DESAPARECE
	setflag FLAG_SILVIO_MONTE_LUNA
	setflag FLAG_SILVIO_TIENDA
	setvar VAR_0x4090, 1
	release
	end

MtMoon_1F_EventScript_SilvioTerminado::
	msgbox MtMoon_1F_Text_SilvioTerminado, MSGBOX_DEFAULT
	end

MtMoon_1F_Movement_PlayerCamina::
	walk_up
	walk_up
	step_end

MtMoon_1F_Movement_PlayerEspera::
	jump_in_place_up
	emote_question_mark
	step_end

MtMoon_1F_Movement_SilvioMira::
	face_left
	step_end

MtMoon_1F_Movement_SilvioAparece::
	walk_down
	delay_16
	delay_16
	emote_exclamation_mark
	jump_in_place_down
	step_end

MtMoon_1F_Movement_SilvioCamina::
	walk_left
	walk_left
	walk_left
	face_down
	step_end
	
MtMoon_1F_Movement_SilvioMiraAlrededor::
	face_right
	delay_16
	face_up
	delay_16
	face_left
	delay_16
	face_up
	delay_16
	face_down
	step_end

MtMoon_1F_Movement_SilvioSalto::
	walk_in_place_down
	jump_in_place_down
	walk_in_place_down
	step_end


MtMoon_1F_Movement_SilvioSalida::
	walk_left
	walk_down
	walk_down
	walk_down
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	step_end