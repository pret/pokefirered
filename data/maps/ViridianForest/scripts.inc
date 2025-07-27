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

ViridianForest_EventScript_Batalla1::
	playbgm MUS_ENCOUNTER_BOY, 0
	setvar VAR_0x408D,2
	setobjectxy 12,39,42
	applymovement LOCALID_PLAYER, ViridianForest_Batalla1
	applymovement 12, ViridianForest_Batalla2
	waitmovement 0
	msgbox ViridianForest_Text_Batalla1_Rojo
	closemessage
	applymovement 12, ViridianForest_Batalla3
	waitmovement 0
	msgbox ViridianForest_Text_Batalla2_Rojo
	closemessage
	goto_if_set FLAG_BULBASAUR, ViridianForest_EventScript_Bulbasaur
	goto_if_set FLAG_SQUIRTLE, ViridianForest_EventScript_Squirtle
	goto_if_set FLAG_CHARMANDER, ViridianForest_EventScript_Charmander
	end

ViridianForest_EventScript_Batalla2::
	playbgm MUS_ENCOUNTER_BOY, 0
	setvar VAR_0x408D,2
	setobjectxy 12,39,42
	applymovement LOCALID_PLAYER, ViridianForest_Batalla8
	applymovement 12, ViridianForest_Batalla7
	waitmovement 0
	msgbox ViridianForest_Text_Batalla1_Rojo
	closemessage
	applymovement 12, ViridianForest_Batalla9
	waitmovement 0
	msgbox ViridianForest_Text_Batalla2_Rojo
	closemessage
	goto_if_set FLAG_BULBASAUR, ViridianForest_EventScript_Bulbasaur
	goto_if_set FLAG_SQUIRTLE, ViridianForest_EventScript_Squirtle
	goto_if_set FLAG_CHARMANDER, ViridianForest_EventScript_Charmander
	end


ViridianForest_EventScript_Bulbasaur::
	trainerbattle_no_intro TRAINER_ROJO_BULBASAUR, ViridianForest_Text_Batalla3_Rojo
	playbgm MUS_VIRIDIAN_FOREST, 0
	applymovement 12, ViridianForest_Batalla4
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	msgbox ViridianForest_Text_Batalla5_Rojo
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	msgbox ViridianForest_Text_Batalla6_Rojo
	closemessage
	applymovement 12, ViridianForest_Batalla5
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_Squirtle::
	trainerbattle_no_intro TRAINER_ROJO_SQUIRTLE, ViridianForest_Text_Batalla3_Rojo
	playbgm MUS_VIRIDIAN_FOREST, 0
	applymovement 12, ViridianForest_Batalla4
	waitmovement 0
	msgbox ViridianForest_Text_Batalla5_Rojo

	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	normalmsg
	msgbox ViridianForest_Text_Batalla6_Rojo
	closemessage
	applymovement 12, ViridianForest_Batalla5
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_EventScript_Charmander::
	trainerbattle_no_intro TRAINER_ROJO_CHARMANDER, ViridianForest_Text_Batalla3_Rojo
	playbgm MUS_VIRIDIAN_FOREST, 0
	applymovement 12, ViridianForest_Batalla4
	waitmovement 0
	msgbox ViridianForest_Text_Batalla5_Rojo
	signmsg
	giveitem_msg ViridianForest_Text_RepExpRojo, ITEM_EXP_SHARE, 1
	closemessage
	msgbox ViridianForest_Text_Batalla6_Rojo
	applymovement 12, ViridianForest_Batalla5
	waitmovement 0
	setobjectxy 12,53,0
	playbgm MUS_VIRIDIAN_FOREST, 0
	end

ViridianForest_Batalla1::
	walk_up
	walk_up
	walk_up
	jump_in_place_up
	emote_exclamation_mark
	step_end

ViridianForest_Batalla2::
	walk_down
	walk_down
	walk_down
	jump_in_place_down
	emote_exclamation_mark
	step_end

ViridianForest_Batalla7::
	walk_down
	walk_down
	walk_down
	walk_down
	jump_in_place_right
	emote_exclamation_mark
	step_end

ViridianForest_Batalla8::
	walk_up
	walk_up
	walk_up
	face_left
	emote_exclamation_mark
	step_end

ViridianForest_Batalla3::
	face_up
	delay_16
	face_left
	delay_16
	face_right
	delay_16
	jump_in_place_down
	step_end

ViridianForest_Batalla9::
	face_up
	delay_16
	face_left
	delay_16
	face_right
	delay_16
	jump_in_place_right
	step_end

ViridianForest_Batalla4::
	walk_up
	walk_up
	emote_exclamation_mark
	delay_16
	jump_in_place_down
	walk_down
	walk_down
	face_player
	step_end

ViridianForest_Batalla5::
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end