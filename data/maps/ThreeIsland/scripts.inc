.equ LOCALID_ANTIBIKER1, 1
.equ LOCALID_ANTIBIKER2, 2
.equ LOCALID_PAXTON, 3
.equ LOCALID_BIKER1, 5
.equ LOCALID_BIKER2, 7
.equ LOCALID_BIKER3, 4
.equ LOCALID_BIKER4, 6
.equ LOCALID_BIKER5, 8
.equ LOCALID_BIKER6, 14

ThreeIsland_MapScripts:: @ 81677AD
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_OnTransition
	.byte 0

ThreeIsland_OnTransition:: @ 81677B3
	setworldmapflag FLAG_WORLD_MAP_THREE_ISLAND
	call_if_set FLAG_RESCUED_LOSTELLE, ThreeIsland_EventScript_HideAntiBikers
	compare VAR_MAP_SCENE_THREE_ISLAND, 4
	call_if_eq ThreeIsland_EventScript_SetAntiBikersMovementAfterBikers
	end

ThreeIsland_EventScript_HideAntiBikers:: @ 81677CB
	setflag FLAG_HIDE_THREE_ISLAND_ANTIBIKERS
	return

ThreeIsland_EventScript_SetAntiBikersMovementAfterBikers:: @ 81677CF
	setobjectmovementtype LOCALID_ANTIBIKER1, MOVEMENT_TYPE_LOOK_AROUND
	setobjectmovementtype LOCALID_ANTIBIKER2, MOVEMENT_TYPE_LOOK_AROUND
	return

ThreeIsland_EventScript_Biker:: @ 81677D8
	lock
	setvar VAR_TEMP_1, 2
	call ThreeIsland_EventScript_BikerArgumentScene
	release
	end

ThreeIsland_EventScript_AntiBiker1:: @ 81677E5
	lock
	goto_if_set FLAG_GOT_FULL_RESTORE_FROM_THREE_ISLAND_DEFENDER, ThreeIsland_EventScript_AntiBiker1GotFullRestore
	compare VAR_MAP_SCENE_THREE_ISLAND, 4
	goto_if_eq ThreeIsland_EventScript_GiveFullRestore
	setvar VAR_TEMP_1, 0
	call ThreeIsland_EventScript_BikerArgumentScene
	release
	end

ThreeIsland_EventScript_AntiBiker1GotFullRestore:: @ 8167806
	applymovement LOCALID_ANTIBIKER1, Movement_FacePlayer
	waitmovement 0
	msgbox ThreeIsland_Text_YouveGotImpressiveMons
	release
	end

ThreeIsland_EventScript_GiveFullRestore:: @ 816781A
	applymovement LOCALID_ANTIBIKER1, Movement_FacePlayer
	waitmovement 0
	msgbox ThreeIsland_Text_ThankYouOhYourMonGotHurt
	checkitemspace ITEM_FULL_RESTORE, 1
	compare VAR_RESULT, FALSE
	goto_if_eq ThreeIsland_EventScript_NoRoomForFullRestore
	msgreceiveditem ThreeIsland_Text_GivenFullRestore, ITEM_FULL_RESTORE
	additem ITEM_FULL_RESTORE
	setflag FLAG_GOT_FULL_RESTORE_FROM_THREE_ISLAND_DEFENDER
	msgbox ThreeIsland_Text_YouveGotImpressiveMons
	release
	end

ThreeIsland_EventScript_NoRoomForFullRestore:: @ 8167865
	msgbox ThreeIsland_Text_OhYourBagIsFull
	release
	end

ThreeIsland_EventScript_BikerArgumentScene:: @ 816786F
	compare VAR_TEMP_1, 1
	call_if_eq ThreeIsland_EventScript_PlayerFaceLeft
	compare VAR_TEMP_1, 2
	call_if_eq ThreeIsland_EventScript_PlayerFaceLeft
	applymovement LOCALID_ANTIBIKER1, ThreeIsland_Movement_SpeakRight
	waitmovement 0
	msgbox ThreeIsland_Text_GoBackToKanto
	compare VAR_TEMP_1, 0
	call_if_eq ThreeIsland_EventScript_PlayerFaceRight
	compare VAR_TEMP_1, 1
	call_if_eq ThreeIsland_EventScript_PlayerFaceRight
	compare VAR_TEMP_1, 2
	call_if_eq ThreeIsland_EventScript_PlayerFaceBiker
	applymovement LOCALID_BIKER1, ThreeIsland_Movement_SpeakLeft
	waitmovement 0
	msgbox ThreeIsland_Text_BossIsOnHisWay
	compare VAR_TEMP_1, 0
	call_if_eq ThreeIsland_EventScript_PlayerFaceUp
	compare VAR_TEMP_1, 1
	call_if_eq ThreeIsland_EventScript_PlayerFaceUp
	compare VAR_TEMP_1, 2
	call_if_eq ThreeIsland_EventScript_PlayerFaceAntiBiker
	applymovement LOCALID_ANTIBIKER2, ThreeIsland_Movement_SpeakRight
	waitmovement 0
	msgbox ThreeIsland_Text_GetOffIslandNow
	compare VAR_TEMP_1, 0
	call_if_eq ThreeIsland_EventScript_PlayerFaceRight
	compare VAR_TEMP_1, 1
	call_if_eq ThreeIsland_EventScript_PlayerFaceRight
	compare VAR_TEMP_1, 2
	call_if_eq ThreeIsland_EventScript_PlayerFaceBiker
	applymovement LOCALID_BIKER3, ThreeIsland_Movement_SpeakLeft
	waitmovement 0
	msgbox ThreeIsland_Text_WhosGonnaMakeMe
	return

ThreeIsland_EventScript_PlayerFaceUp:: @ 8167931
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

@ Unused
ThreeIsland_EventScript_PlayerFaceDown:: @ 816793C
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

ThreeIsland_EventScript_PlayerFaceLeft:: @ 8167947
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

ThreeIsland_EventScript_PlayerFaceRight:: @ 8167952
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

ThreeIsland_EventScript_PlayerFaceBiker:: @ 816795D
	getplayerxy VAR_0x8004, VAR_0x8005
	compare VAR_0x8004, 9
	goto_if_ge ThreeIsland_EventScript_PlayerFaceUp
	goto ThreeIsland_EventScript_PlayerFaceRight
	end

ThreeIsland_EventScript_PlayerFaceAntiBiker:: @ 8167973
	getplayerxy VAR_0x8004, VAR_0x8005
	compare VAR_0x8004, 9
	goto_if_ge ThreeIsland_EventScript_PlayerFaceLeft
	goto ThreeIsland_EventScript_PlayerFaceUp
	end

ThreeIsland_EventScript_AntiBiker2:: @ 8167989
	lock
	compare VAR_MAP_SCENE_THREE_ISLAND, 4
	goto_if_eq ThreeIsland_EventScript_AntiBiker2BikersGone
	setvar VAR_TEMP_1, 1
	call ThreeIsland_EventScript_BikerArgumentScene
	release
	end

ThreeIsland_EventScript_AntiBiker2BikersGone:: @ 81679A1
	applymovement LOCALID_ANTIBIKER2, Movement_FacePlayer
	waitmovement 0
	msgbox ThreeIsland_Text_LostelleWentOffTowardsBondBridge
	release
	end

ThreeIsland_EventScript_BikerBossIntroTrigger:: @ 81679B5
	lockall
	textcolor 0
	applymovement LOCALID_ANTIBIKER1, ThreeIsland_Movement_SpeakRight
	waitmovement 0
	msgbox ThreeIsland_Text_AreYouBossGoBackToKanto
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_SpeakLeft
	waitmovement 0
	msgbox ThreeIsland_Text_JustGotHerePal
	applymovement LOCALID_ANTIBIKER1, ThreeIsland_Movement_SpeakRight
	waitmovement 0
	msgbox ThreeIsland_Text_FollowersRaisingHavoc
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_SpeakLeft
	waitmovement 0
	msgbox ThreeIsland_Text_OughtToBeThankingUs
	applymovement LOCALID_ANTIBIKER1, ThreeIsland_Movement_SpeakRight
	waitmovement 0
	msgbox ThreeIsland_Text_YouCowardsToughInPack
	setvar VAR_MAP_SCENE_THREE_ISLAND, 3
	releaseall
	end

ThreeIsland_Movement_SpeakLeft:: @ 8167A19
	walk_in_place_left
	step_end

ThreeIsland_Movement_SpeakRight:: @ 8167A1B
	walk_in_place_right
	step_end

ThreeIsland_EventScript_BattleBikersTriggerLeft:: @ 8167A1D
	lockall
	setvar VAR_TEMP_1, 0
	goto ThreeIsland_EventScript_BattleBikersScene
	end

ThreeIsland_EventScript_BattleBikersTriggerMidLeft:: @ 8167A29
	lockall
	setvar VAR_TEMP_1, 1
	goto ThreeIsland_EventScript_BattleBikersScene
	end

ThreeIsland_EventScript_BattleBikersTriggerMid:: @ 8167A35
	lockall
	setvar VAR_TEMP_1, 2
	goto ThreeIsland_EventScript_BattleBikersScene
	end

ThreeIsland_EventScript_BattleBikersTriggerMidRight:: @ 8167A41
	lockall
	setvar VAR_TEMP_1, 3
	goto ThreeIsland_EventScript_BattleBikersScene
	end

ThreeIsland_EventScript_BattleBikersTriggerRight:: @ 8167A4D
	lockall
	setvar VAR_TEMP_1, 4
	goto ThreeIsland_EventScript_BattleBikersScene
	end

ThreeIsland_EventScript_BattleBikersScene:: @ 8167A59
	textcolor 0
	applymovement LOCALID_BIKER1, Movement_WalkInPlaceFastestDown
	waitmovement 0
	playse SE_PIN
	applymovement LOCALID_BIKER1, Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_BIKER1, Movement_Delay48
	waitmovement 0
	applymovement LOCALID_BIKER1, ThreeIsland_Movement_BikerApproach
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	msgbox ThreeIsland_Text_WannaMakeSomethingOfYourStaring, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq ThreeIsland_EventScript_LeaveBikersAlone
	msgbox ThreeIsland_Text_Biker1Intro
	setvar VAR_LAST_TALKED, LOCALID_BIKER1
	trainerbattle_no_intro TRAINER_BIKER_GOON, ThreeIsland_Text_Biker1Defeat
	applymovement LOCALID_BIKER1, ThreeIsland_Movement_BikerSpeak
	waitmovement 0
	msgbox ThreeIsland_Text_Biker1PostBattle
	closemessage
	applymovement LOCALID_BIKER2, ThreeIsland_Movement_BikerApproach
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	msgbox ThreeIsland_Text_Biker2Intro
	setvar VAR_LAST_TALKED, LOCALID_BIKER2
	trainerbattle_no_intro TRAINER_BIKER_GOON_2, ThreeIsland_Text_Biker2Defeat
	applymovement LOCALID_BIKER2, ThreeIsland_Movement_BikerSpeak
	waitmovement 0
	msgbox ThreeIsland_Text_Biker2PostBattle
	closemessage
	applymovement LOCALID_BIKER3, ThreeIsland_Movement_BikerApproach
	waitmovement 0
	playbgm MUS_ENCOUNTER_BOY, 0
	msgbox ThreeIsland_Text_Biker3Intro
	setvar VAR_LAST_TALKED, LOCALID_BIKER3
	trainerbattle_no_intro TRAINER_BIKER_GOON_3, ThreeIsland_Text_Biker3Defeat
	applymovement LOCALID_BIKER3, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement LOCALID_BIKER4, Movement_WalkInPlaceFastestDown
	applymovement LOCALID_BIKER5, Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox ThreeIsland_Text_Biker3PostBattle
	closemessage
	delay 45
	compare VAR_TEMP_1, 0
	call_if_eq ThreeIsland_EventScript_PaxtonApproachLeft
	compare VAR_TEMP_1, 1
	call_if_eq ThreeIsland_EventScript_PaxtonApproachMidLeft
	compare VAR_TEMP_1, 2
	call_if_eq ThreeIsland_EventScript_PaxtonApproachMid
	compare VAR_TEMP_1, 3
	call_if_eq ThreeIsland_EventScript_PaxtonApproachMidRight
	compare VAR_TEMP_1, 4
	call_if_eq ThreeIsland_EventScript_PaxtonApproachRight
	playbgm MUS_ENCOUNTER_BOY, 0
	msgbox ThreeIsland_Text_PaxtonIntro
	setvar VAR_LAST_TALKED, LOCALID_PAXTON
	trainerbattle_no_intro TRAINER_CUE_BALL_PAXTON, ThreeIsland_Text_PaxtonDefeat
	msgbox ThreeIsland_Text_PaxtonPostBattle
	closemessage
	fadescreen FADE_TO_BLACK
	removeobject LOCALID_PAXTON
	removeobject LOCALID_BIKER1
	removeobject LOCALID_BIKER2
	removeobject LOCALID_BIKER3
	removeobject LOCALID_BIKER4
	removeobject LOCALID_BIKER5
	removeobject LOCALID_BIKER6
	fadescreen FADE_FROM_BLACK
	setvar VAR_MAP_SCENE_THREE_ISLAND, 4
	releaseall
	end

ThreeIsland_EventScript_PaxtonApproachLeft:: @ 8167BC6
	applymovement LOCALID_BIKER3, Movement_WalkInPlaceFastestDown
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachLeft
	waitmovement 0
	return

ThreeIsland_EventScript_PaxtonApproachMidLeft:: @ 8167BD8
	applymovement LOCALID_BIKER3, Movement_WalkInPlaceFastestDown
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachMidLeft
	waitmovement 0
	return

ThreeIsland_EventScript_PaxtonApproachMid:: @ 8167BEA
	applymovement LOCALID_BIKER3, Movement_WalkInPlaceFastestDown
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachMid
	applymovement OBJ_EVENT_ID_PLAYER, ThreeIsland_Movement_PlayerFacePaxton
	waitmovement 0
	return

ThreeIsland_EventScript_PaxtonApproachMidRight:: @ 8167C03
	applymovement LOCALID_BIKER3, Movement_WalkInPlaceFastestDown
	applymovement OBJ_EVENT_ID_PLAYER, ThreeIsland_Movement_PlayerFacePaxton
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachMidRight
	waitmovement 0
	return

ThreeIsland_EventScript_PaxtonApproachRight:: @ 8167C1C
	applymovement LOCALID_BIKER3, Movement_WalkInPlaceFastestDown
	applymovement OBJ_EVENT_ID_PLAYER, ThreeIsland_Movement_PlayerFacePaxton
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachRight
	waitmovement 0
	return

ThreeIsland_EventScript_LeaveBikersAlone:: @ 8167C35
	msgbox ThreeIsland_Text_ThatsSmart
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, ThreeIsland_Movement_PlayerLeaveBikers
	waitmovement 0
	applymovement LOCALID_BIKER1, ThreeIsland_Movement_Biker1ReturnToPack
	waitmovement 0
	fadedefaultbgm
	releaseall
	end

ThreeIsland_Movement_PlayerLeaveBikers:: @ 8167C55
	walk_down
	step_end

ThreeIsland_Movement_BikerApproach:: @ 8167C57
	walk_down
	step_end

ThreeIsland_Movement_Biker1ReturnToPack:: @ 8167C59
	walk_up
	walk_in_place_fastest_left
	step_end

ThreeIsland_Movement_BikerSpeak:: @ 8167C5C
	walk_in_place_down
	step_end

ThreeIsland_Movement_PaxtonApproachLeft:: @ 8167C5E
	walk_down
	walk_left
	walk_in_place_fastest_down
	step_end

ThreeIsland_Movement_PaxtonApproachMidLeft:: @ 8167C62
	walk_down
	step_end

ThreeIsland_Movement_PaxtonApproachMid:: @ 8167C64
	walk_down
	walk_down
	walk_in_place_fastest_right
	step_end

ThreeIsland_Movement_PlayerFacePaxton:: @ 8167C68
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end

ThreeIsland_Movement_PaxtonApproachMidRight:: @ 8167C6C
	walk_down
	walk_down
	walk_right
	walk_in_place_fastest_right
	step_end

ThreeIsland_Movement_PaxtonApproachRight:: @ 8167C71
	walk_down
	walk_down
	walk_right
	walk_right
	walk_in_place_fastest_right
	step_end

ThreeIsland_EventScript_Woman:: @ 8167C77
	msgbox ThreeIsland_Text_WouldntWantToSeeBikersHereAgain, MSGBOX_NPC
	end

ThreeIsland_EventScript_LittleBoy:: @ 8167C80
	msgbox ThreeIsland_Text_WhenDodouEvolvesGoingToPlayGame, MSGBOX_NPC
	end

ThreeIsland_EventScript_Doduo:: @ 8167C89
	lock
	faceplayer
	waitse
	playmoncry SPECIES_DODUO, 0
	msgbox ThreeIsland_Text_Doduo
	waitmoncry
	release
	end

ThreeIsland_EventScript_IslandSign:: @ 8167C9C
	msgbox ThreeIsland_Text_IslandSign, MSGBOX_SIGN
	end

ThreeIsland_EventScript_Biker6:: @ 8167CA5
	msgbox ThreeIsland_Text_IslandBelongsToUs, MSGBOX_NPC
	end
