ViridianForest_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, ViridianForest_OnTransition
	.byte 0

ViridianForest_OnTransition::
	clearflag FLAG_SYS_DEXNAV_GET
	setworldmapflag FLAG_WORLD_MAP_VIRIDIAN_FOREST
	call Common_EventScript_SetupRedGreenGfxId
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

ViridianForest_EventScript_RedGreenEncounter::
	namebox Name_RedGreen
	msgbox ViridianForest_Text_MiraDondeTeEncuentro
	hidenamebox
	closemessage
	applymovement LOCALID_VIDRIAN_FOREST_REDGREEN, ViridianForest_MirarAlrededorRedGreen
	waitmovement 0
	namebox Name_RedGreen
	msgbox ViridianForest_Text_TeDijeQue
	hidenamebox
	closemessage
	checkplayergender
	call_if_eq VAR_RESULT, FEMALE, ViridianForest_EventScript_BattleFemale
	call_if_eq VAR_RESULT, MALE, ViridianForest_EventScript_BattleMale
	namebox Name_RedGreen
	msgbox ViridianForest_Text_CreQueEsHora
	hidenamebox
	closemessage
	applymovement LOCALID_VIDRIAN_FOREST_REDGREEN, ViridianForest_RegresaRedGreen
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	namebox Name_RedGreen	
	msgbox ViridianForest_Text_SoyTanDespitado
	hidenamebox
	closemessage
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	namebox Name_RedGreen
	msgbox ViridianForest_Text_ElRepartirExpEs
	hidenamebox
	closemessage
	applymovement LOCALID_VIDRIAN_FOREST_REDGREEN, ViridianForest_SalidaRedGreen
	waitmovement 0
	return

ViridianForest_EventScript_RedGreenEncounterLeft::
	setflag FLAG_HIDE_REDGREEN_VIRIDIAN_FOREST
	playbgm MUS_ENCOUNTER_BOY, 0
	setvar VAR_REDGREEN_VIRIDIAN_FOREST,2
	setobjectxy LOCALID_VIDRIAN_FOREST_REDGREEN,39,42 
	applymovement LOCALID_PLAYER, ViridianForest_EntradaPlayerLeft
	applymovement LOCALID_VIDRIAN_FOREST_REDGREEN, ViridianForest_EntradaRedGreenLeft
	waitmovement 
	call ViridianForest_EventScript_RedGreenEncounter
	setobjectxy LOCALID_VIDRIAN_FOREST_REDGREEN,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_RedGreenEncounterRight::
	setflag FLAG_HIDE_REDGREEN_VIRIDIAN_FOREST
	playbgm MUS_ENCOUNTER_BOY, 0
	setvar VAR_REDGREEN_VIRIDIAN_FOREST,2
	setobjectxy LOCALID_VIDRIAN_FOREST_REDGREEN,39,42 
	applymovement LOCALID_PLAYER, ViridianForest_EntradaPlayerRight
	applymovement LOCALID_VIDRIAN_FOREST_REDGREEN, ViridianForest_EntradaRedGreenRight
	waitmovement 
	call ViridianForest_EventScript_RedGreenEncounter
	setobjectxy LOCALID_VIDRIAN_FOREST_REDGREEN,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_BattleFemale::
	goto_if_set FLAG_BULBASAUR, ViridianForest_EventScript_BulbasaurFemale
	goto_if_set FLAG_SQUIRTLE, ViridianForest_EventScript_SquirtleFemale
	goto_if_set FLAG_CHARMANDER, ViridianForest_EventScript_CharmanderFemale
	return

ViridianForest_EventScript_BattleMale::
	goto_if_set FLAG_BULBASAUR, ViridianForest_EventScript_BulbasaurMale
	goto_if_set FLAG_SQUIRTLE, ViridianForest_EventScript_SquirtleMale
	goto_if_set FLAG_CHARMANDER, ViridianForest_EventScript_CharmanderMale
	return

ViridianForest_EventScript_BulbasaurFemale::
	trainerbattle_no_intro TRAINER_ROJO_BULBASAUR, ViridianForest_Text_BattleRedGreen
	return

ViridianForest_EventScript_SquirtleFemale::
	trainerbattle_no_intro TRAINER_ROJO_SQUIRTLE, ViridianForest_Text_BattleRedGreen
	return

ViridianForest_EventScript_CharmanderFemale::
	trainerbattle_no_intro TRAINER_ROJO_CHARMANDER, ViridianForest_Text_BattleRedGreen
	return

ViridianForest_EventScript_BulbasaurMale::
	trainerbattle_no_intro TRAINER_HOJA_BULBASAUR, ViridianForest_Text_BattleRedGreen
	return

ViridianForest_EventScript_SquirtleMale::
	trainerbattle_no_intro TRAINER_HOJA_SQUIRTLE, ViridianForest_Text_BattleRedGreen
	return

ViridianForest_EventScript_CharmanderMale::
	trainerbattle_no_intro TRAINER_HOJA_CHARMANDER, ViridianForest_Text_BattleRedGreen
	return

ViridianForest_EntradaRedGreenRight::
	walk_down
	walk_down
	walk_down
	walk_down
	jump_in_place_right
	emote_exclamation_mark
	walk_in_place_right
	step_end

ViridianForest_EntradaRedGreenLeft::
	walk_down
	walk_down
	walk_down
	jump_in_place_down
	emote_exclamation_mark
	walk_in_place_down
	step_end

ViridianForest_EntradaPlayerLeft::
	walk_up
	walk_up
	walk_up
	jump_in_place_up
	emote_exclamation_mark
	step_end

ViridianForest_EntradaPlayerRight::
	walk_up
	walk_up
	walk_up
	jump_in_place_left
	emote_exclamation_mark
	step_end

ViridianForest_MirarAlrededorRedGreen::
	face_up
	delay_16
	face_right
	delay_16
	face_left
	delay_16
	face_player
	step_end

ViridianForest_RegresaRedGreen::
	delay_16
	delay_16
	walk_up
	walk_up
	emote_exclamation_mark
	delay_16
	jump_in_place_down
	walk_down
	walk_down
	delay_16
	face_player
	delay_16
	step_end

ViridianForest_SalidaRedGreen::
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end