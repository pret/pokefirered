ViridianForest_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, ViridianForest_OnTransition
	.byte 0

ViridianForest_OnTransition::
	clearflag FLAG_SYS_DEXNAV_GET
	setworldmapflag FLAG_WORLD_MAP_VIRIDIAN_FOREST
	end

ViridianForest_EventScript_Youngster::
	msgbox ViridianForest_Text_FriendsItchingToBattle, MSGBOX_NPC
	end

ViridianForest_EventScript_Boy::
	msgbox ViridianForest_Text_RanOutOfPokeBalls, MSGBOX_NPC
	end

ViridianForest_EventScript_TrainerTips1::
	msgbox ViridianForest_Text_AvoidGrassyAreasWhenWeak, MSGBOX_SIGN
	end
ViridianForest_EventScript_BosqueVerde::
	msgbox ViridianForest_Text_BosqueVerde, MSGBOX_SIGN
	end

ViridianForest_EventScript_TrainerTips2::
	msgbox ViridianForest_Text_UseAntidoteForPoison, MSGBOX_SIGN
	end

ViridianForest_EventScript_TrainerTips3::
	msgbox ViridianForest_Text_ContactOakViaPCToRatePokedex, MSGBOX_SIGN
	end

ViridianForest_EventScript_TrainerTips4::
	msgbox ViridianForest_Text_CantCatchOwnedMons, MSGBOX_SIGN
	end

ViridianForest_EventScript_TrainerTips5:: @traducido
	msgbox ViridianForest_Text_WeakenMonsBeforeCapture, MSGBOX_SIGN
	end

ViridianForest_EventScript_ExitSign::
	msgbox ViridianForest_Text_LeavingViridianForest, MSGBOX_SIGN
	end

ViridianForest_EventScript_Rick::
	trainerbattle_single TRAINER_BUG_CATCHER_RICK, ViridianForest_Text_RickIntro, ViridianForest_Text_RickDefeat
	msgbox ViridianForest_Text_RickPostBattle, MSGBOX_AUTOCLOSE
	end

ViridianForest_EventScript_Doug::
	trainerbattle_single TRAINER_BUG_CATCHER_DOUG, ViridianForest_Text_DougIntro, ViridianForest_Text_DougDefeat
	msgbox ViridianForest_Text_DougPostBattle, MSGBOX_AUTOCLOSE
	end

ViridianForest_EventScript_Sammy::
	trainerbattle_single TRAINER_BUG_CATCHER_SAMMY, ViridianForest_Text_SammyIntro, ViridianForest_Text_SammyDefeat
	msgbox ViridianForest_Text_SammyPostBattle, MSGBOX_AUTOCLOSE
	end

ViridianForest_EventScript_Anthony::
	trainerbattle_single TRAINER_BUG_CATCHER_ANTHONY, ViridianForest_Text_AnthonyIntro, ViridianForest_Text_AnthonyDefeat
	msgbox ViridianForest_Text_AnthonyPostBattle, MSGBOX_AUTOCLOSE
	end

ViridianForest_EventScript_NPC::
	msgbox ViridianForest_Text_NPC, MSGBOX_NPC
	end

ViridianForest_EventScript_Charlie::
	trainerbattle_single TRAINER_BUG_CATCHER_CHARLIE, ViridianForest_Text_CharlieIntro, ViridianForest_Text_CharlieDefeat
	msgbox ViridianForest_Text_CharliePostBattle, MSGBOX_AUTOCLOSE
	end

@EVENTO ENCUENTRO ROJO/HOJA - LADO IZQUIERDO
ViridianForest_EventScript_EncuentroRojoHojaIzquierda::
	setflag FLAG_HIDE_ROJOHOJAVIRIDIAN
	checkplayergender
	call_if_eq VAR_RESULT, FEMALE, ViridianForest_EventScript_EncuentroRojoHoja_FemaleIzquierda
	call_if_eq VAR_RESULT, MALE, ViridianForest_EventScript_EncuentroRojoHoja_MaleIzquierda
	end

@EVENTO ENCUENTRO ROJO/HOJA - LADO DERECHO
ViridianForest_EventScript_EncuentroRojoHojaDerecha::
	setflag FLAG_HIDE_ROJOHOJAVIRIDIAN
	checkplayergender
	call_if_eq VAR_RESULT, FEMALE, ViridianForest_EventScript_EncuentroRojoHoja_FemaleDerecha
	call_if_eq VAR_RESULT, MALE, ViridianForest_EventScript_EncuentroRojoHoja_MaleDerecha
	end

@PLAYER MUJER - LADO IZQUIERDO
ViridianForest_EventScript_EncuentroRojoHoja_FemaleIzquierda::
	playbgm MUS_ENCOUNTER_BOY, 0
	setvar VAR_0x408D,2
	setobjectxy 12,39,42
	applymovement OBJ_EVENT_ID_PLAYER, ViridianForest_EntradaPlayerIzquierda
	applymovement 12, ViridianForest_EntradaRojoHojaIzquieda
	waitmovement 0
	msgbox ViridianForest_Text_MiraDondeTeEncuentro
	closemessage
	applymovement 12, ViridianForest_MirarAlrededorIzquierda
	waitmovement 0
	msgbox ViridianForest_Text_TeDijeQue
	closemessage
	goto_if_set FLAG_BULBASAUR, ViridianForest_EventScript_BulbasaurFemaleIzquierda
	goto_if_set FLAG_SQUIRTLE, ViridianForest_EventScript_SquirtleFemaleIzquierda
	goto_if_set FLAG_CHARMANDER, ViridianForest_EventScript_CharmanderFemaleIzquierda
	playbgm MUS_ENCOUNTER_BOY, 0
	applymovement 12, ViridianForest_RojoHojaSeVaDerecha
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	msgbox ViridianForest_Text_SoyTanDespitada
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	msgbox ViridianForest_Text_ElRepartirExpEs
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

@PLAYER HOMBRE - LADO IZQUIERDO
ViridianForest_EventScript_EncuentroRojoHoja_MaleIzquierda::
	playbgm MUS_ENCOUNTER_BOY, 0
	setvar VAR_0x408D,2
	setobjectxy 17,39,42
	applymovement OBJ_EVENT_ID_PLAYER, ViridianForest_EntradaPlayerIzquierda
	applymovement 17, ViridianForest_EntradaRojoHojaIzquieda
	waitmovement 0
	msgbox ViridianForest_Text_MiraDondeTeEncuentro
	closemessage
	applymovement 17, ViridianForest_MirarAlrededorIzquierda
	waitmovement 0
	msgbox ViridianForest_Text_TeDijeQue
	closemessage
	goto_if_set FLAG_BULBASAUR, ViridianForest_EventScript_BulbasaurMaleIzquierda
	goto_if_set FLAG_SQUIRTLE, ViridianForest_EventScript_SquirtleMaleIzquierda
	goto_if_set FLAG_CHARMANDER, ViridianForest_EventScript_CharmanderMaleIzquierda
	playbgm MUS_ENCOUNTER_BOY, 0
	applymovement 17, ViridianForest_RojoHojaSeVaDerecha
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	msgbox ViridianForest_Text_SoyTanDespitada
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	msgbox ViridianForest_Text_ElRepartirExpEs
	closemessage
	applymovement 17, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 17,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

@PLAYER MUJER - LADO DERECHO
ViridianForest_EventScript_EncuentroRojoHoja_FemaleDerecha::
	playbgm MUS_ENCOUNTER_BOY, 0
	setvar VAR_0x408D,2
	setobjectxy 12,39,42
	applymovement OBJ_EVENT_ID_PLAYER, ViridianForest_EntradaPlayerDerecha
	applymovement 12, ViridianForest_EntradaRojoHojaDerecha
	waitmovement 0
	msgbox ViridianForest_Text_MiraDondeTeEncuentro
	closemessage
	applymovement 12, ViridianForest_MirarAlrededorDerecha
	waitmovement 0
	msgbox ViridianForest_Text_TeDijeQue
	closemessage
	goto_if_set FLAG_BULBASAUR, ViridianForest_EventScript_BulbasaurFemaleDerecha
	goto_if_set FLAG_SQUIRTLE, ViridianForest_EventScript_SquirtleFemaleDerecha
	goto_if_set FLAG_CHARMANDER, ViridianForest_EventScript_CharmanderFemaleDerecha
	end

@PLAYER HOMBRE - LADO DERECHO
ViridianForest_EventScript_EncuentroRojoHoja_MaleDerecha::
	playbgm MUS_ENCOUNTER_BOY, 0
	setvar VAR_0x408D,2
	setobjectxy 17,39,42
	applymovement OBJ_EVENT_ID_PLAYER, ViridianForest_EntradaPlayerDerecha
	applymovement 17, ViridianForest_EntradaRojoHojaDerecha
	waitmovement 0
	msgbox ViridianForest_Text_MiraDondeTeEncuentro
	closemessage
	applymovement 17, ViridianForest_MirarAlrededorDerecha
	waitmovement 0
	msgbox ViridianForest_Text_TeDijeQue
	closemessage
	goto_if_set FLAG_BULBASAUR, ViridianForest_EventScript_BulbasaurMaleDerecha
	goto_if_set FLAG_SQUIRTLE, ViridianForest_EventScript_SquirtleMaleDerecha
	goto_if_set FLAG_CHARMANDER, ViridianForest_EventScript_CharmanderMaleDerecha
	playbgm MUS_ENCOUNTER_BOY, 0
	applymovement 17, ViridianForest_RojoHojaSeVaDerecha
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	msgbox ViridianForest_Text_SoyTanDespitada
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	msgbox ViridianForest_Text_ElRepartirExpEs
	closemessage
	applymovement 17, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 17,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_BulbasaurMaleDerecha::
	trainerbattle_no_intro TRAINER_HOJA_BULBASAUR, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Hoja
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Hoja
	msgbox ViridianForest_Text_SoyTanDespitada
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Hoja
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_SquirtleMaleDerecha::
	trainerbattle_no_intro TRAINER_HOJA_SQUIRTLE, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Hoja
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Hoja
	msgbox ViridianForest_Text_SoyTanDespitada
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Hoja
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_CharmanderMaleDerecha::
	trainerbattle_no_intro TRAINER_HOJA_CHARMANDER, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Hoja
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Hoja
	msgbox ViridianForest_Text_SoyTanDespitada
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Hoja
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

@ARREGLADOS
ViridianForest_EventScript_BulbasaurMaleIzquierda::
	trainerbattle_no_intro TRAINER_HOJA_BULBASAUR, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Hoja
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 17, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Hoja
	msgbox ViridianForest_Text_SoyTanDespitada
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Hoja
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 17, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 17,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_SquirtleMaleIzquierda::
	trainerbattle_no_intro TRAINER_HOJA_SQUIRTLE, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Hoja
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 17, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Hoja
	msgbox ViridianForest_Text_SoyTanDespitada
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Hoja
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 17, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 17,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_CharmanderMaleIzquierda::
	trainerbattle_no_intro TRAINER_HOJA_CHARMANDER, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Hoja
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 17, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Hoja
	msgbox ViridianForest_Text_SoyTanDespitada
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Hoja
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 17, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 17,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_BulbasaurFemaleDerecha::
	trainerbattle_no_intro TRAINER_ROJO_BULBASAUR, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Rojo
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Rojo
	msgbox ViridianForest_Text_SoyTanDespitado
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Rojo
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_SquirtleFemaleDerecha::
	trainerbattle_no_intro TRAINER_ROJO_SQUIRTLE, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Rojo
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Rojo
	msgbox ViridianForest_Text_SoyTanDespitado
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Rojo
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_CharmanderFemaleDerecha::
	trainerbattle_no_intro TRAINER_ROJO_CHARMANDER, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Rojo
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Rojo
	msgbox ViridianForest_Text_SoyTanDespitado
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Rojo
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_BulbasaurFemaleIzquierda::
	trainerbattle_no_intro TRAINER_ROJO_BULBASAUR, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Rojo
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Rojo
	msgbox ViridianForest_Text_SoyTanDespitado
	hidenamebox
	closemessage
	msgbox ViridianForest_Text_SoyTanDespitada
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Rojo
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_SquirtleFemaleIzquierda::
	trainerbattle_no_intro TRAINER_ROJO_SQUIRTLE, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Rojo
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Rojo
	msgbox ViridianForest_Text_SoyTanDespitado
	hidenamebox
	closemessage
	msgbox ViridianForest_Text_SoyTanDespitada
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Rojo
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_CharmanderFemaleIzquierda::
	trainerbattle_no_intro TRAINER_ROJO_CHARMANDER, ViridianForest_Text_Batalla3_Rojo
	namebox Name_Rojo
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_RojoHojaSeVaIzquierda
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_Rojo
	msgbox ViridianForest_Text_SoyTanDespitado
	hidenamebox
	closemessage
	msgbox ViridianForest_Text_SoyTanDespitada
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_Rojo
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement 12, ViridianForest_HojaRojoSeVaFinal
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EntradaRojoHojaDerecha::
	walk_down
	walk_down
	walk_down
	walk_down
	jump_in_place_right
	emote_exclamation_mark
	walk_in_place_right
	step_end

ViridianForest_EntradaRojoHojaIzquieda::
	walk_down
	walk_down
	walk_down
	jump_in_place_down
	emote_exclamation_mark
	walk_in_place_down
	step_end

ViridianForest_EntradaPlayerIzquierda::
	walk_up
	walk_up
	walk_up
	jump_in_place_up
	emote_exclamation_mark
	step_end


ViridianForest_EntradaPlayerDerecha::
	walk_up
	walk_up
	walk_up
	face_left
	emote_exclamation_mark
	step_end

ViridianForest_MirarAlrededorIzquierda::
	face_up
	delay_16
	face_left
	delay_16
	face_right
	delay_16
	jump_in_place_down
	step_end

ViridianForest_MirarAlrededorDerecha::
	face_up
	delay_16
	face_left
	delay_16
	face_right
	delay_16
	jump_in_place_right
	step_end

ViridianForest_RojoHojaSeVaDerecha::
	delay_16
	delay_16
	walk_up
	walk_up
	emote_exclamation_mark
	delay_16
	jump_in_place_down
	walk_down
	walk_down
	face_player
	delay_16
	jump_in_place_right
	delay_16
	step_end

ViridianForest_RojoHojaSeVaIzquierda::
	delay_16
	delay_16
	walk_up
	walk_up
	emote_exclamation_mark
	delay_16
	jump_in_place_down
	walk_down
	walk_down
	face_player
	delay_16
	jump_in_place_down
	delay_16
	step_end

ViridianForest_HojaRojoSeVaFinal::
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end