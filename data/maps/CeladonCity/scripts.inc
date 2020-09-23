CeladonCity_MapScripts:: @ 8166C8F
	map_script MAP_SCRIPT_ON_RESUME, CeladonCity_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, CeladonCity_OnTransition
	.byte 0

CeladonCity_OnTransition:: @ 8166C95
	setworldmapflag FLAG_WORLD_MAP_CELADON_CITY
	end

CeladonCity_EventScript_LittleGirl:: @ 8166C99
	msgbox CeladonCity_Text_GotMyKoffingInCinnabar, MSGBOX_NPC
	end

CeladonCity_EventScript_OldMan1:: @ 8166CA2
	lock
	msgbox CeladonCity_Text_GymIsGreatFullOfWomen
	release
	end

CeladonCity_EventScript_Woman:: @ 8166CAD
	msgbox CeladonCity_Text_GameCornerIsBadForCitysImage, MSGBOX_NPC
	end

CeladonCity_EventScript_OldMan2:: @ 8166CB6
	msgbox CeladonCity_Text_BlewItAllAtSlots, MSGBOX_NPC
	end

CeladonCity_EventScript_SoftboiledTutor:: @ 8166CBF
	goto EventScript_SoftboiledTutor
	end

CeladonCity_EventScript_FatMan:: @ 8166CC5
	lock
	faceplayer
	msgbox CeladonCity_Text_MyTrustedPalPoliwrath
	closemessage
	applymovement 2, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

CeladonCity_EventScript_Poliwrath:: @ 8166CDC
	lock
	faceplayer
	waitse
	playmoncry SPECIES_POLIWRATH, 0
	msgbox CeladonCity_Text_Poliwrath
	closemessage
	waitmoncry
	applymovement 3, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

CeladonCity_EventScript_RocketGrunt1:: @ 8166CFA
	msgbox CeladonCity_Text_KeepOutOfTeamRocketsWay, MSGBOX_NPC
	end

CeladonCity_EventScript_RocketGrunt2:: @ 8166D03
	msgbox CeladonCity_Text_GetLostOrIllPunchYou, MSGBOX_NPC
	end

CeladonCity_EventScript_Boy:: @ 8166D0C
	msgbox CeladonCity_Text_ScaldedTongueOnTea, MSGBOX_NPC
	end

CeladonCity_EventScript_SilphCoScientist:: @ 8166D15
	msgbox CeladonCity_Text_SomeoneStoleSilphScope, MSGBOX_NPC
	end

CeladonCity_EventScript_TrainerTips1:: @ 8166D1E
	msgbox CeladonCity_Text_ExplainXAccuracyDireHit, MSGBOX_SIGN
	end

CeladonCity_EventScript_CitySign:: @ 8166D27
	msgbox CeladonCity_Text_CitySign, MSGBOX_SIGN
	end

CeladonCity_EventScript_GymSign:: @ 8166D30
	lockall
	famechecker FAMECHECKER_ERIKA, 0
	msgbox CeladonCity_Text_GymSign
	releaseall
	end

CeladonCity_EventScript_MansionSign:: @ 8166D48
	msgbox CeladonCity_Text_MansionSign, MSGBOX_SIGN
	end

CeladonCity_EventScript_DeptStoreSign:: @ 8166D51
	msgbox CeladonCity_Text_DeptStoreSign, MSGBOX_SIGN
	end

CeladonCity_EventScript_TrainerTips2:: @ 8166D5A
	msgbox CeladonCity_Text_GuardSpecProtectsFromStatus, MSGBOX_SIGN
	end

CeladonCity_EventScript_PrizeExchangeSign:: @ 8166D63
	msgbox CeladonCity_Text_PrizeExchangeSign, MSGBOX_SIGN
	end

CeladonCity_EventScript_GameCornerSign:: @ 8166D6C
	msgbox CeladonCity_Text_GameCornerSign, MSGBOX_SIGN
	end

CeladonCity_OnResume::
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, CeladonCity_EventScript_TryRemoveSnorlax
	end

CeladonCity_EventScript_TryRemoveSnorlax::
	removeobject VAR_LAST_TALKED
	return

CeladonCity_EventScript_Snorlax::
	lock
	faceplayer
	goto_if_unset FLAG_GOT_POKE_FLUTE, CeladonCity_EventScript_SnorlaxNoPokeFlute
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	msgbox Text_WantToUsePokeFlute, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq CeladonCity_EventScript_DontUsePokeFlute
	call EventScript_AwakenSnorlax
	setwildbattle SPECIES_SNORLAX, 30, ITEM_NONE
	waitse
	playmoncry SPECIES_SNORLAX, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_ROUTE_16_SNORLAX
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	dowildbattle
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if_eq CeladonCity_EventScript_FoughtSnorlax
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq CeladonCity_EventScript_FoughtSnorlax
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq CeladonCity_EventScript_FoughtSnorlax
	release
	end

CeladonCity_EventScript_DontUsePokeFlute:: @ 816808D
	release
	end

CeladonCity_EventScript_FoughtSnorlax:: @ 816808F
	msgbox Text_SnorlaxReturnedToMountains
	release
	end

CeladonCity_EventScript_SnorlaxNoPokeFlute:: @ 8168099
	msgbox CeladonCity_Text_MonSprawledOutInSlumber
	release
	end
	
Script_Casino_Gate:: 
		lock
		faceplayer
		msgbox Text_Casino_Gate, MSGBOX_DEFAULT
		release
		end
		
Text_Casino_Gate:
		.string "Sorry kid, but there have been\n"
		.string "numerous reports of players\l"
		.string "receiving Pokemon that are\l"
		.string "well below their expectations.\p"
		.string "We have to investigate this for\n"
		.string "now.$"
		
Script_Koga4_Badge_Gate:: 
		lock
		faceplayer
		msgbox Text_Koga4_Badge_Gate, MSGBOX_DEFAULT
		release
		end
		
Text_Koga4_Badge_Gate:
		.string "Koga gave us instructions to keep\n"
		.string "the city on lockdown.\p"
		.string "Move it along kid!$"
		
Script_Erika1_Badge_Gate:: 
		lock
		msgbox Text_Erika1_Badge_Gate, MSGBOX_DEFAULT
		release
		end
		
Text_Erika1_Badge_Gate:
		.string "Who does Koga think he is?\n"
		.string "This is not his jurisdiction!\p"
		.string "If Celadon has a problem with its\n"
		.string "Snorlax, Erika decides how to\l"
		.string "handle it!$"
		
Script_Erika2_Badge_Gate:: 
		lock
		msgbox Text_Erika2_Badge_Gate, MSGBOX_DEFAULT
		release
		end
		
Text_Erika2_Badge_Gate:
		.string "Erika is caught up dealing with\n"
		.string "the Snorlax at our gym but once\l"
		.string "she finds another strong trainer\l"
		.string "to help her out she'll kick you\l"
		.string "guys out of OUR town!$"
		
Script_Erika3_Badge_Gate:: 
		lock
		msgbox Text_Erika3_Badge_Gate, MSGBOX_DEFAULT
		release
		end
		
Text_Erika3_Badge_Gate:
		.string "This is for the greater good of\n"
		.string "Kanto!\p"
		.string "There's some really strange things\n"
		.string "happening, the Snorlax are just\l"
		.string "the beginning!\p"
		.string "We can't let anyone pass until we\n"
		.string "figure out what the problem is!$"