.set LOCALID_POLICEMAN, 1
.set LOCALID_GRUNT,     2
.set LOCALID_SLOWBRO,   5
.set LOCALID_LASS,      6
.set LOCALID_RIVAL,     8
.set LOCALID_WOMAN,     11

CeruleanCity_MapScripts:: @ 8166471
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCity_OnTransition
	.byte 0

CeruleanCity_OnTransition:: @ 8166477
	setworldmapflag FLAG_WORLD_MAP_CERULEAN_CITY
	call_if_unset FLAG_GOT_SS_TICKET, CeruleanCity_EventScript_BlockExits
	end

CeruleanCity_EventScript_BlockExits:: @ 8166484
	setobjectxyperm LOCALID_POLICEMAN, 30, 12
	setobjectxyperm LOCALID_SLOWBRO, 26, 31
	setobjectxyperm LOCALID_LASS, 27, 31
	return

CeruleanCity_EventScript_RivalTriggerLeft:: @ 816649A
	lockall
	setvar VAR_TEMP_1, 0
	goto CeruleanCity_EventScript_Rival
	end

CeruleanCity_EventScript_RivalTriggerMid:: @ 81664A6
	lockall
	setvar VAR_TEMP_1, 1
	setobjectxyperm LOCALID_RIVAL, 23, 0
	goto CeruleanCity_EventScript_Rival
	end

CeruleanCity_EventScript_RivalTriggerRight:: @ 81664B9
	lockall
	setvar VAR_TEMP_1, 2
	setobjectxyperm LOCALID_RIVAL, 24, 0
	goto CeruleanCity_EventScript_Rival
	end

CeruleanCity_EventScript_Rival:: @ 81664CC
	textcolor 0
	setvar VAR_MAP_SCENE_ROUTE22, 2
	playbgm MUS_ENCOUNTER_RIVAL, 0
	addobject LOCALID_RIVAL
	applymovement LOCALID_RIVAL, CeruleanCity_Movement_RivalEnter
	waitmovement 0
	msgbox CeruleanCity_Text_RivalIntro
	setvar VAR_LAST_TALKED, LOCALID_RIVAL
	compare VAR_STARTER_MON, 2
	call_if_eq CeruleanCity_EventScript_RivalSquirtle
	compare VAR_STARTER_MON, 1
	call_if_eq CeruleanCity_EventScript_RivalBulbasaur
	compare VAR_STARTER_MON, 0
	call_if_eq CeruleanCity_EventScript_RivalCharmander
	famechecker FAMECHECKER_BILL, 0
	msgbox CeruleanCity_Text_RivalPostBattle
	closemessage
	playbgm MUS_RIVAL_EXIT, 0
	compare VAR_TEMP_1, 0
	call_if_eq CeruleanCity_EventScript_RivalStartExit
	compare VAR_TEMP_1, 1
	call_if_eq CeruleanCity_EventScript_RivalStartExit
	compare VAR_TEMP_1, 2
	call_if_eq CeruleanCity_EventScript_RivalStartExitRight
	msgbox CeruleanCity_Text_OhRightLittlePresentAsFavor
	setvar VAR_MAP_SCENE_CERULEAN_CITY_RIVAL, 1
	setflag FLAG_GOT_FAME_CHECKER
	giveitem ITEM_FAME_CHECKER
	msgbox CeruleanCity_Text_ExplainFameCheckerSmellYa
	closemessage
	applymovement LOCALID_RIVAL, CeruleanCity_Movement_RivalExit
	waitmovement 0
	fadedefaultbgm
	removeobject LOCALID_RIVAL
	releaseall
	end

CeruleanCity_EventScript_RivalSquirtle:: @ 8166582
	trainerbattle_no_intro TRAINER_RIVAL_CERULEAN_SQUIRTLE, CeruleanCity_Text_RivalDefeat
	return

CeruleanCity_EventScript_RivalBulbasaur:: @ 816658D
	trainerbattle_no_intro TRAINER_RIVAL_CERULEAN_BULBASAUR, CeruleanCity_Text_RivalDefeat
	return

CeruleanCity_EventScript_RivalCharmander:: @ 8166598
	trainerbattle_no_intro TRAINER_RIVAL_CERULEAN_CHARMANDER, CeruleanCity_Text_RivalDefeat
	return

CeruleanCity_EventScript_RivalStartExit:: @ 81665A3
	applymovement OBJ_EVENT_ID_PLAYER, CeruleanCity_Movement_PlayerWatchRivalExit
	applymovement LOCALID_RIVAL, CeruleanCity_Movement_RivalStartExit
	waitmovement 0
	return

CeruleanCity_EventScript_RivalStartExitRight:: @ 81665B5
	applymovement OBJ_EVENT_ID_PLAYER, CeruleanCity_Movement_PlayerWatchRivalExitRight
	applymovement LOCALID_RIVAL, CeruleanCity_Movement_RivalStartExitRight
	waitmovement 0
	return

CeruleanCity_Movement_PlayerWatchRivalExit:: @ 81665C7
	delay_16
	delay_8
	walk_in_place_fastest_right
	delay_16
	walk_in_place_fastest_down
	step_end

CeruleanCity_Movement_PlayerWatchRivalExitRight:: @ 81665CD
	delay_16
	delay_8
	walk_in_place_fastest_left
	delay_16
	walk_in_place_fastest_down
	step_end

CeruleanCity_Movement_RivalEnter:: @ 81665D3
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

CeruleanCity_Movement_RivalStartExit:: @ 81665D9
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	delay_16
	delay_16
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

CeruleanCity_Movement_RivalStartExitRight:: @ 81665EA
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	delay_16
	delay_16
	walk_right
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

CeruleanCity_Movement_RivalExit:: @ 81665FB
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

CeruleanCity_EventScript_Grunt:: @ 8166603
	lock
	faceplayer
	goto_if_defeated TRAINER_TEAM_ROCKET_GRUNT_5, CeruleanCity_EventScript_GruntDefeated
	message CeruleanCity_Text_GruntIntro
	waitmessage
	playbgm MUS_ENCOUNTER_ROCKET, 0
	waitbuttonpress
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_5, CeruleanCity_Text_GruntDefeat
	setvar VAR_MAP_SCENE_CERULEAN_CITY_ROCKET, 1
	goto CeruleanCity_EventScript_GruntDefeated
	end

CeruleanCity_EventScript_GruntDefeated:: @ 816662E
	msgbox CeruleanCity_Text_OkayIllReturnStolenTM
	checkitemspace ITEM_TM28, 1
	compare VAR_RESULT, FALSE
	goto_if_eq CeruleanCity_EventScript_NoRoomForTM28
	giveitem_msg CeruleanCity_Text_RecoveredTM28FromGrunt, ITEM_TM28
	msgbox CeruleanCity_Text_BetterGetMovingBye
	closemessage
	fadescreen FADE_TO_BLACK
	removeobject LOCALID_GRUNT
	fadescreen FADE_FROM_BLACK
	setflag FLAG_GOT_TM28_FROM_ROCKET
	release
	end

CeruleanCity_EventScript_NoRoomForTM28:: @ 8166677
	textcolor 0
	msgbox CeruleanCity_Text_MakeRoomForThisCantRun
	release
	end

CeruleanCity_EventScript_GruntTriggerTop:: @ 8166683
	lockall
	setvar VAR_TEMP_1, 0
	applymovement LOCALID_GRUNT, Movement_WalkInPlaceFastestUp
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestDown
	waitmovement 0
	goto CeruleanCity_EventScript_GruntTrigger
	end

CeruleanCity_EventScript_GruntTriggerBottom:: @ 81666A3
	lockall
	setvar VAR_TEMP_1, 1
	applymovement LOCALID_GRUNT, Movement_WalkInPlaceFastestDown
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	goto CeruleanCity_EventScript_GruntTrigger
	end

CeruleanCity_EventScript_GruntTrigger:: @ 81666C3
	textcolor 0
	msgbox CeruleanCity_Text_GruntIntro
	setvar VAR_LAST_TALKED, LOCALID_GRUNT
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_5, CeruleanCity_Text_GruntDefeat
	setvar VAR_MAP_SCENE_CERULEAN_CITY_ROCKET, 1
	goto CeruleanCity_EventScript_GruntDefeated
	end

CeruleanCity_EventScript_Policeman:: @ 81666E7
	lock
	faceplayer
	msgbox CeruleanCity_Text_PeopleHereWereRobbed
	closemessage
	applymovement LOCALID_POLICEMAN, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

CeruleanCity_EventScript_LittleBoy:: @ 81666FE
	lock
	faceplayer
	goto_if_set FLAG_GOT_SS_TICKET, CeruleanCity_EventScript_LittleBoySlowbroMoved
	msgbox CeruleanCity_Text_IfSlowbroWasntThereCouldCutTree
	release
	end

CeruleanCity_EventScript_LittleBoySlowbroMoved:: @ 8166713
	msgbox CeruleanCity_Text_YouCanCutDownSmallTrees
	release
	end

CeruleanCity_EventScript_BaldingMan:: @ 816671D
	msgbox CeruleanCity_Text_PokemonEncyclopediaAmusing, MSGBOX_NPC
	end

CeruleanCity_EventScript_Youngster:: @ 8166726
	msgbox CeruleanCity_Text_TrainerLifeIsToughIsntIt, MSGBOX_NPC
	end

CeruleanCity_EventScript_CeruleanCaveGuard:: @ 816672F
	msgbox CeruleanCity_Text_ThisIsCeruleanCave, MSGBOX_NPC
	end

CeruleanCity_EventScript_Woman:: @ 8166738
	lock
	faceplayer
	msgbox CeruleanCity_Text_WantBrightRedBicycle
	closemessage
	applymovement LOCALID_WOMAN, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

CeruleanCity_EventScript_Lass:: @ 816674F
	lock
	random 3
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8008, 0
	call_if_eq CeruleanCity_EventScript_SlowbroCommand1
	compare VAR_0x8008, 1
	call_if_eq CeruleanCity_EventScript_SlowbroCommand2
	compare VAR_0x8008, 2
	call_if_eq CeruleanCity_EventScript_SlowbroCommand3
	waitmessage
	delay 40
	playse SE_PIN
	applymovement LOCALID_SLOWBRO, Movement_QuestionMark
	waitmovement 0
	delay 30
	compare VAR_0x8008, 0
	call_if_eq CeruleanCity_EventScript_SlowbroFailed1
	compare VAR_0x8008, 1
	call_if_eq CeruleanCity_EventScript_SlowbroFailed2
	compare VAR_0x8008, 2
	call_if_eq CeruleanCity_EventScript_SlowbroFailed3
	release
	end

CeruleanCity_EventScript_SlowbroCommand1:: @ 81667B0
	message CeruleanCity_Text_SlowbroUseSonicboom
	return

CeruleanCity_EventScript_SlowbroCommand2:: @ 81667B6
	message CeruleanCity_Text_SlowbroPunch
	return

CeruleanCity_EventScript_SlowbroCommand3:: @ 81667BC
	message CeruleanCity_Text_SlowbroWithdraw
	return

CeruleanCity_EventScript_SlowbroFailed1:: @ 81667C2
	msgbox CeruleanCity_Text_SlowbroPayAttention
	return

CeruleanCity_EventScript_SlowbroFailed2:: @ 81667CB
	msgbox CeruleanCity_Text_NoYouBlewItAgain
	return

CeruleanCity_EventScript_SlowbroFailed3:: @ 81667D4
	msgbox CeruleanCity_Text_HardToControlMonsObedience
	return

CeruleanCity_EventScript_Slowbro:: @ 81667DD
	lock
	random 4
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8008, 0
	call_if_eq CeruleanCity_EventScript_SlowbroText1
	compare VAR_0x8008, 1
	call_if_eq CeruleanCity_EventScript_SlowbroText2
	compare VAR_0x8008, 2
	call_if_eq CeruleanCity_EventScript_SlowbroText3
	compare VAR_0x8008, 3
	call_if_eq CeruleanCity_EventScript_SlowbroText4
	release
	end

CeruleanCity_EventScript_SlowbroText1:: @ 8166814
	msgbox CeruleanCity_Text_SlowbroTookSnooze
	return

CeruleanCity_EventScript_SlowbroText2:: @ 816681D
	msgbox CeruleanCity_Text_SlowbroLoafingAround
	return

CeruleanCity_EventScript_SlowbroText3:: @ 8166826
	msgbox CeruleanCity_Text_SlowbroTurnedAway
	return

CeruleanCity_EventScript_SlowbroText4:: @ 816682F
	msgbox CeruleanCity_Text_SlowbroIgnoredOrders
	return

CeruleanCity_EventScript_CitySign:: @ 8166838
	msgbox CeruleanCity_Text_CitySign, MSGBOX_SIGN
	end

CeruleanCity_EventScript_TrainerTips:: @ 8166841
	msgbox CeruleanCity_Text_TrainerTipsHeldItems, MSGBOX_SIGN
	end

CeruleanCity_EventScript_BikeShopSign:: @ 816684A
	msgbox CeruleanCity_Text_BikeShopSign, MSGBOX_SIGN
	end

CeruleanCity_EventScript_GymSign:: @ 8166853
	lockall
	famechecker FAMECHECKER_MISTY, 0
	msgbox CeruleanCity_Text_GymSign
	releaseall
	end
