MtMoon_B2F_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, MtMoon_B2F_OnTransition
	.byte 0

MtMoon_B2F_OnTransition::
	call_if_unset FLAG_GOT_FOSSIL_FROM_MT_MOON, MtMoon_B2F_EventScript_ShowFossils
	end

MtMoon_B2F_EventScript_ShowFossils::
	clearflag FLAG_HIDE_DOME_FOSSIL
	clearflag FLAG_HIDE_HELIX_FOSSIL
	return

MtMoon_B2F_EventScript_MiguelTrigger::
	lockall
	applymovement LOCALID_MT_MOON_MIGUEL, Common_Movement_WalkInPlaceFasterRight
	waitmovement 0
	call MtMoon_B2F_EventScript_BattleMiguel
	releaseall
	end

MtMoon_B2F_EventScript_Miguel::
	lock
	faceplayer
	goto_if_set FLAG_GOT_FOSSIL_FROM_MT_MOON, MtMoon_B2F_EventScript_MiguelFossilPicked
	goto_if_defeated TRAINER_SUPER_NERD_MIGUEL, MtMoon_B2F_EventScript_MiguelGoPickFossil
	call MtMoon_B2F_EventScript_BattleMiguel
	release
	end

MtMoon_B2F_EventScript_BattleMiguel::
	message MtMoon_B2F_Text_MiguelIntro
	waitmessage
	playbgm MUS_ENCOUNTER_GYM_LEADER, 0
	waitbuttonpress
	setvar VAR_LAST_TALKED, LOCALID_MT_MOON_MIGUEL
	trainerbattle_no_intro TRAINER_SUPER_NERD_MIGUEL, MtMoon_B2F_Text_MiguelDefeat
	setvar VAR_MAP_SCENE_MT_MOON_B2F, 1
	msgbox MtMoon_B2F_Text_WellEachTakeAFossil
	return

MtMoon_B2F_EventScript_MiguelFossilPicked::
	msgbox MtMoon_B2F_Text_LabOnCinnabarRegeneratesFossils
	release
	end

MtMoon_B2F_EventScript_MiguelGoPickFossil::
	msgbox MtMoon_B2F_Text_WellEachTakeAFossil
	release
	end

MtMoon_B2F_EventScript_DomeFossil::
	faceplayer
	signmsg
	msgbox MtMoon_B2F_Text_YouWantDomeFossil, MSGBOX_YESNO
	normalmsg
	goto_if_eq VAR_RESULT, NO, MtMoon_B2F_EventScript_DontTakeFossil
	removeobject LOCALID_DOME_FOSSIL
	signmsg
	giveitem_msg MtMoon_B2F_Text_ObtainedDomeFossil, ITEM_DOME_FOSSIL, 1, MUS_OBTAIN_KEY_ITEM
	closemessage
	normalmsg
	special QuestLog_CutRecording
	delay 10
	applymovement LOCALID_MT_MOON_MIGUEL, MtMoon_B2F_Movement_MiguelToHelixFossil
	waitmovement 0
	copyobjectxytoperm LOCALID_MT_MOON_MIGUEL
	playfanfare MUS_OBTAIN_KEY_ITEM
	message MtMoon_B2F_Text_ThenThisFossilIsMine
	waitmessage
	waitfanfare
	removeobject LOCALID_HELIX_FOSSIL
	setflag FLAG_GOT_DOME_FOSSIL
	setflag FLAG_GOT_FOSSIL_FROM_MT_MOON
	playbgm MUS_ROCKET_HIDEOUT, 0
	setvar VAR_MT_MOON_JESSIE_JAMES, 1
	delay 16
	setobjectxy LOCALID_MT_MOON_JAMES,13,14 
	setobjectxy LOCALID_MT_MOON_JESSIE,12,14 
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkUp4
	waitmovement 0
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	namebox Name_Desconocido	
	msgbox MtMoon_B2F_Text_Jessie_Intro
	closemessage
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkUp4
	waitmovement 0
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	namebox Name_Desconocido
	msgbox MtMoon_B2F_Text_James_Intro
	closemessage
	applymovement LOCALID_PLAYER, Common_Movement_JumpFaceDownExclamationMark
	applymovement LOCALID_MT_MOON_MIGUEL, Common_Movement_JumpFaceDownExclamationMark
	waitmovement 0
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	namebox Name_Desconocido
	msgbox MtMoon_B2F_Text_Jessie_Reveal
	closemessage
	applymovement LOCALID_MT_MOON_MIGUEL, MtMoon_B2F_Movement_MiguelRunAway
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_MIGUEL,3,16 
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	checkplayergender
	call_if_eq VAR_RESULT, FEMALE, MtMoon_B2F_EventScript_JessieJamesFemale
	call_if_eq VAR_RESULT, MALE, MtMoon_B2F_EventScript_JessieJamesMale
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkUp
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkUp
	waitmovement 0
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkInPlaceUp
	waitmovement 0
	namebox Name_Jessie
	msgbox MtMoon_B2F_Text_Jessie_DoubleChallenge
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, MtMoon_B2F_Movement_JamesToPlayerDomeFossil
	waitmovement 0
	namebox Name_James
	msgbox MtMoon_B2F_Text_James_DoubleChallenge
	closemessage 

	special HasEnoughMonsForDoubleBattle
	goto_if_ne VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS, MtMoon_B2F_EventScript_OnePokemonForDoubleBattleDomeFossil

	trainerbattle_double_no_intro TRAINER_TEAM_ROCKET_JESSIE_JAMES_MT_MOON, MtMoon_B2F_Text_Jessie_James_Defeat, MtMoon_B2F_Text_Jessie_James_Defeat, MtMoon_B2F_EventScript_AfterBattleDomeFossil
	playbgm MUS_MT_MOON, 0
	setflag FLAG_HIDE_MT_MOON_JESSIE_JAMES
	setvar VAR_MT_MOON_JESSIE_JAMES, 0
	release
	end

MtMoon_B2F_Movement_MiguelToHelixFossil::
	walk_right
	walk_up
	walk_up
	walk_up
	step_end

MtMoon_B2F_EventScript_HelixFossil::
	faceplayer
	signmsg
	msgbox MtMoon_B2F_Text_YouWantHelixFossil, MSGBOX_YESNO
	normalmsg
	goto_if_eq VAR_RESULT, NO, MtMoon_B2F_EventScript_DontTakeFossil
	removeobject LOCALID_HELIX_FOSSIL
	signmsg
	giveitem_msg MtMoon_B2F_Text_ObtainedHelixFossil, ITEM_HELIX_FOSSIL, 1, MUS_OBTAIN_KEY_ITEM
	closemessage
	normalmsg
	special QuestLog_CutRecording
	delay 10
	applymovement LOCALID_MT_MOON_MIGUEL, MtMoon_B2F_Movement_MiguelToDomeFossil
	waitmovement 0
	copyobjectxytoperm LOCALID_MT_MOON_MIGUEL
	playfanfare MUS_OBTAIN_KEY_ITEM
	msgbox MtMoon_B2F_Text_ThenThisFossilIsMine
	closemessage
	removeobject LOCALID_DOME_FOSSIL
	setflag FLAG_GOT_HELIX_FOSSIL
	setflag FLAG_GOT_FOSSIL_FROM_MT_MOON
	playbgm MUS_ROCKET_HIDEOUT, 0
	setvar VAR_MT_MOON_JESSIE_JAMES, 1
	delay 16
	setobjectxy LOCALID_MT_MOON_JESSIE,13,14 
	setobjectxy LOCALID_MT_MOON_JAMES,12,14 
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkUp4
	waitmovement 0
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	namebox Name_Desconocido	
	msgbox MtMoon_B2F_Text_Jessie_Intro
	closemessage
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkUp4
	waitmovement 0
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	namebox Name_Desconocido
	msgbox MtMoon_B2F_Text_James_Intro
	closemessage
	applymovement LOCALID_PLAYER, Common_Movement_JumpFaceDownExclamationMark
	applymovement LOCALID_MT_MOON_MIGUEL, Common_Movement_JumpFaceDownExclamationMark
	waitmovement 0
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	namebox Name_Desconocido
	msgbox MtMoon_B2F_Text_Jessie_Reveal
	closemessage
	applymovement LOCALID_MT_MOON_MIGUEL, MtMoon_B2F_Movement_MiguelRunAway
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_MIGUEL,3,16 
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	checkplayergender
	call_if_eq VAR_RESULT, FEMALE, MtMoon_B2F_EventScript_JessieJamesFemale
	call_if_eq VAR_RESULT, MALE, MtMoon_B2F_EventScript_JessieJamesMale
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkUp
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkUp
	waitmovement 0
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkInPlaceUp
	waitmovement 0
	namebox Name_Jessie
	msgbox MtMoon_B2F_Text_Jessie_DoubleChallenge
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, MtMoon_B2F_Movement_JamesToPlayerHelixFossil
	waitmovement 0
	namebox Name_James
	msgbox MtMoon_B2F_Text_James_DoubleChallenge
	closemessage
	
	special HasEnoughMonsForDoubleBattle
	goto_if_ne VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS, MtMoon_B2F_EventScript_OnePokemonForDoubleBattleHelixFossil

	trainerbattle_double_no_intro TRAINER_TEAM_ROCKET_JESSIE_JAMES_MT_MOON, MtMoon_B2F_Text_Jessie_James_Defeat, MtMoon_B2F_Text_Jessie_James_Defeat, MtMoon_B2F_EventScript_AfterBattleHelixFossil
	playbgm MUS_MT_MOON, 0
	setflag FLAG_HIDE_MT_MOON_JESSIE_JAMES
	setvar VAR_MT_MOON_JESSIE_JAMES, 0
	release
	end

MtMoon_B2F_EventScript_OnePokemonForDoubleBattleHelixFossil::
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_JESSIE_JAMES_MT_MOON_NODOUBLE, MtMoon_B2F_Text_Jessie_James_Defeat
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkInPlaceUp
	waitmovement 0
	namebox Name_Jessie
	msgbox MtMoon_B2F_Text_Jessie_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkInPlaceRight
	waitmovement 0
	namebox Name_James
	msgbox MtMoon_B2F_Text_James_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, MtMoon_B2F_Movement_JamesRunAway
	applymovement LOCALID_MT_MOON_JESSIE, MtMoon_B2F_Movement_JessieRunAwayHelixFossil
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_JAMES,3,16 
	setobjectxy LOCALID_MT_MOON_JESSIE,3,16 
	playbgm MUS_MT_MOON, 0
	setflag FLAG_HIDE_MT_MOON_JESSIE_JAMES
	setvar VAR_MT_MOON_JESSIE_JAMES, 0
	releaseall
	end

MtMoon_B2F_EventScript_OnePokemonForDoubleBattleDomeFossil::
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_JESSIE_JAMES_MT_MOON_NODOUBLE, MtMoon_B2F_Text_Jessie_James_Defeat
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkInPlaceUp
	waitmovement 0
	namebox Name_Jessie
	msgbox MtMoon_B2F_Text_Jessie_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkInPlaceLeft
	waitmovement 0
	namebox Name_James
	msgbox MtMoon_B2F_Text_James_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, MtMoon_B2F_Movement_JamesRunAway
	applymovement LOCALID_MT_MOON_JESSIE, MtMoon_B2F_Movement_JessieRunAwayDomeFossil
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_JAMES,3,16 
	setobjectxy LOCALID_MT_MOON_JESSIE,3,16 
	playbgm MUS_MT_MOON, 0
	setflag FLAG_HIDE_MT_MOON_JESSIE_JAMES
	setvar VAR_MT_MOON_JESSIE_JAMES, 0
	releaseall
	end


MtMoon_B2F_EventScript_JessieJamesRepeat::
	playbgm MUS_ROCKET_HIDEOUT, 0
	setvar VAR_MT_MOON_JESSIE_JAMES, 1
	delay 16
	setobjectxy LOCALID_MT_MOON_JESSIE,13,16 
	setobjectxy LOCALID_MT_MOON_JAMES,12,16 
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkUp4
	waitmovement 0
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	applymovement LOCALID_MT_MOON_MIGUEL, Common_Movement_FaceDown
	waitmovement 0
	applymovement LOCALID_MT_MOON_MIGUEL, Common_Movement_LockFacingDirection
	waitmovement 0
	namebox Name_Desconocido	
	msgbox MtMoon_B2F_Text_Jessie_Intro
	closemessage
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkUp4
	waitmovement 0
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	namebox Name_Desconocido
	msgbox MtMoon_B2F_Text_James_Intro
	closemessage
	applymovement LOCALID_PLAYER, Common_Movement_JumpFaceDownExclamationMark
	applymovement LOCALID_MT_MOON_MIGUEL, Common_Movement_JumpUpExclamationMark
	waitmovement 0
	applymovement LOCALID_MT_MOON_MIGUEL, Common_Movement_UnlockFacingDirection
	waitmovement 0
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	namebox Name_Desconocido
	msgbox MtMoon_B2F_Text_Jessie_Reveal
	closemessage
	applymovement LOCALID_MT_MOON_MIGUEL, MtMoon_B2F_Movement_MiguelRunAwayRepeat
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_MIGUEL,3,16 
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_JumpFaceUpExclamationMark
	waitmovement 0
	checkplayergender
	call_if_eq VAR_RESULT, FEMALE, MtMoon_B2F_EventScript_JessieJamesFemale
	call_if_eq VAR_RESULT, MALE, MtMoon_B2F_EventScript_JessieJamesMale
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkUp
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkUp
	waitmovement 0
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkInPlaceUp
	waitmovement 0
	namebox Name_Jessie
	msgbox MtMoon_B2F_Text_Jessie_DoubleChallenge
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, MtMoon_B2F_Movement_JamesToPlayerHelixFossil
	waitmovement 0
	namebox Name_James
	msgbox MtMoon_B2F_Text_James_DoubleChallenge
	closemessage 
	
	special HasEnoughMonsForDoubleBattle
	goto_if_ne VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS, MtMoon_B2F_EventScript_OnePokemonForDoubleBattleRepeat

	trainerbattle_double_no_intro TRAINER_TEAM_ROCKET_JESSIE_JAMES_MT_MOON, MtMoon_B2F_Text_Jessie_James_Defeat, MtMoon_B2F_Text_Jessie_James_Defeat, MtMoon_B2F_EventScript_AfterBattleRepeat
	release
	end

MtMoon_B2F_EventScript_OnePokemonForDoubleBattleRepeat::
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_JESSIE_JAMES_MT_MOON_NODOUBLE, MtMoon_B2F_Text_Jessie_James_Defeat
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkInPlaceUp
	waitmovement 0
	namebox Name_Jessie
	msgbox MtMoon_B2F_Text_Jessie_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkInPlaceRight
	waitmovement 0
	namebox Name_James
	msgbox MtMoon_B2F_Text_James_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, MtMoon_B2F_Movement_JamesRunAwayRepeat
	applymovement LOCALID_MT_MOON_JESSIE, MtMoon_B2F_Movement_JessieRunAwayRepeat
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_JAMES,3,16 
	setobjectxy LOCALID_MT_MOON_JESSIE,3,16 
	playbgm MUS_MT_MOON, 0
	setflag FLAG_HIDE_MT_MOON_JESSIE_JAMES
	setvar VAR_MT_MOON_JESSIE_JAMES, 0
	releaseall
	end

MtMoon_B2F_EventScript_CheckJessieJamesEvent::
	goto_if_set FLAG_HIDE_MT_MOON_JESSIE_JAMES, MtMoon_B2F_EventScript_DontTakeFossil
	goto_if_set FLAG_GOT_HELIX_FOSSIL, MtMoon_B2F_EventScript_JessieJamesRepeat
	goto_if_set FLAG_GOT_DOME_FOSSIL, MtMoon_B2F_EventScript_JessieJamesRepeat
	release
	end


MtMoon_B2F_EventScript_DontTakeFossil::
	release
	end

MtMoon_B2F_Movement_MiguelToDomeFossil::
	walk_up	
	walk_up
	walk_up
	step_end


MtMoon_B2F_EventScript_Grunt1::
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT, MtMoon_B2F_Text_Grunt1Intro, MtMoon_B2F_Text_Grunt1Defeat
	msgbox MtMoon_B2F_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_B2F_EventScript_Grunt2::
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_2, MtMoon_B2F_Text_Grunt2Intro, MtMoon_B2F_Text_Grunt2Defeat
	msgbox MtMoon_B2F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_B2F_EventScript_Grunt3::
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_3, MtMoon_B2F_Text_Grunt3Intro, MtMoon_B2F_Text_Grunt3Defeat
	msgbox MtMoon_B2F_Text_Grunt3PostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_B2F_EventScript_Grunt4::
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_4, MtMoon_B2F_Text_Grunt4Intro, MtMoon_B2F_Text_Grunt4Defeat
	msgbox MtMoon_B2F_Text_Grunt4PostBattle, MSGBOX_AUTOCLOSE
	end

MtMoon_B2F_EventScript_AfterBattleHelixFossil::
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkInPlaceUp
	waitmovement 0
	namebox Name_Jessie
	msgbox MtMoon_B2F_Text_Jessie_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkInPlaceRight
	waitmovement 0
	namebox Name_James
	msgbox MtMoon_B2F_Text_James_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, MtMoon_B2F_Movement_JamesRunAway
	applymovement LOCALID_MT_MOON_JESSIE, MtMoon_B2F_Movement_JessieRunAwayHelixFossil
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_JAMES,3,16 
	setobjectxy LOCALID_MT_MOON_JESSIE,3,16 
	playbgm MUS_MT_MOON, 0
	setflag FLAG_HIDE_MT_MOON_JESSIE_JAMES
	setvar VAR_MT_MOON_JESSIE_JAMES, 0
	releaseall
	end

MtMoon_B2F_EventScript_AfterBattleRepeat::
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkInPlaceUp
	waitmovement 0
	namebox Name_Jessie
	msgbox MtMoon_B2F_Text_Jessie_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkInPlaceRight
	waitmovement 0
	namebox Name_James
	msgbox MtMoon_B2F_Text_James_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, MtMoon_B2F_Movement_JamesRunAwayRepeat
	applymovement LOCALID_MT_MOON_JESSIE, MtMoon_B2F_Movement_JessieRunAwayRepeat
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_JAMES,3,16 
	setobjectxy LOCALID_MT_MOON_JESSIE,3,16 
	playbgm MUS_MT_MOON, 0
	setflag FLAG_HIDE_MT_MOON_JESSIE_JAMES
	setvar VAR_MT_MOON_JESSIE_JAMES, 0
	releaseall
	end

MtMoon_B2F_EventScript_AfterBattleDomeFossil::
	applymovement LOCALID_MT_MOON_JESSIE, Common_Movement_WalkInPlaceUp
	waitmovement 0
	namebox Name_Jessie
	msgbox MtMoon_B2F_Text_Jessie_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, Common_Movement_WalkInPlaceLeft
	waitmovement 0
	namebox Name_James
	msgbox MtMoon_B2F_Text_James_RunAway
	closemessage 
	applymovement LOCALID_MT_MOON_JAMES, MtMoon_B2F_Movement_JamesRunAway
	applymovement LOCALID_MT_MOON_JESSIE, MtMoon_B2F_Movement_JessieRunAwayDomeFossil
	waitmovement 0
	setobjectxy LOCALID_MT_MOON_JAMES,3,16 
	setobjectxy LOCALID_MT_MOON_JESSIE,3,16 
	playbgm MUS_MT_MOON, 0
	setflag FLAG_HIDE_MT_MOON_JESSIE_JAMES
	setvar VAR_MT_MOON_JESSIE_JAMES, 0
	releaseall
	end

MtMoon_B2F_EventScript_JessieJamesFemale::
	namebox Name_Desconocido
	msgbox MtMoon_B2F_Text_James_RevealFemale
	closemessage
	return

MtMoon_B2F_EventScript_JessieJamesMale::
	namebox Name_Desconocido
	msgbox MtMoon_B2F_Text_James_RevealMale
	closemessage
	return

MtMoon_B2F_Movement_MiguelRunAway::
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	step_end

MtMoon_B2F_Movement_JamesToPlayerHelixFossil::
	walk_up
	face_right
	step_end

MtMoon_B2F_Movement_JamesToPlayerDomeFossil::
	walk_up
	face_left
	step_end

MtMoon_B2F_Movement_JamesRunAway::
	delay_16
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	step_end

MtMoon_B2F_Movement_JamesRunAwayRepeat::
	delay_16
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up	
	walk_fast_up
	step_end

MtMoon_B2F_Movement_MiguelRunAwayRepeat::
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up	
	walk_fast_up
	step_end

MtMoon_B2F_Movement_JessieRunAwayRepeat::
	walk_left
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up	
	walk_fast_up
	step_end

MtMoon_B2F_Movement_JessieRunAwayHelixFossil::
	walk_left
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up	
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	step_end

MtMoon_B2F_Movement_JessieRunAwayDomeFossil::
	walk_right
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up	
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	step_end