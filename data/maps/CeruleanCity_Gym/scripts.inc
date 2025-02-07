# 1 "data/maps/CeruleanCity_Gym/scripts.pory"

# 2 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_MapScripts::
# 3 "data/maps/CeruleanCity_Gym/scripts.pory"
	.byte 0
# 4 "data/maps/CeruleanCity_Gym/scripts.pory"

# 5 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_Misty::
# 6 "data/maps/CeruleanCity_Gym/scripts.pory"
	famechecker FAMECHECKER_MISTY, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 7 "data/maps/CeruleanCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_LEADER_MISTY, CeruleanCity_Gym_Text_MistyIntro, CeruleanCity_Gym_Text_MistyDefeat, CeruleanCity_Gym_EventScript_MistyDefeated, NO_MUSIC
# 8 "data/maps/CeruleanCity_Gym/scripts.pory"
	goto_if_unset FLAG_GOT_TM03_FROM_MISTY, CeruleanCity_Gym_EventScript_GiveTM03
# 9 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_ExplainTM03
# 10 "data/maps/CeruleanCity_Gym/scripts.pory"
	release
# 11 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
# 12 "data/maps/CeruleanCity_Gym/scripts.pory"

# 13 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_MistyDefeated::
# 14 "data/maps/CeruleanCity_Gym/scripts.pory"
	famechecker FAMECHECKER_MISTY, 1
# 15 "data/maps/CeruleanCity_Gym/scripts.pory"
	setflag FLAG_DEFEATED_MISTY
# 16 "data/maps/CeruleanCity_Gym/scripts.pory"
	setflag FLAG_BADGE02_GET
# 17 "data/maps/CeruleanCity_Gym/scripts.pory"
	setrespawn SPAWN_CERULEAN_CITY
# 18 "data/maps/CeruleanCity_Gym/scripts.pory"
	set_gym_trainers 2
# 19 "data/maps/CeruleanCity_Gym/scripts.pory"
	goto CeruleanCity_Gym_EventScript_GiveTM03
# 20 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
# 21 "data/maps/CeruleanCity_Gym/scripts.pory"

# 22 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_GiveTM03::
# 23 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_ExplainCascadeBadge
# 24 "data/maps/CeruleanCity_Gym/scripts.pory"
	checkitemspace ITEM_TM03
# 25 "data/maps/CeruleanCity_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeruleanCity_Gym_EventScript_NoRoomForTM03
# 26 "data/maps/CeruleanCity_Gym/scripts.pory"
	giveitem_msg CeruleanCity_Gym_Text_ReceivedTM03FromMisty, ITEM_TM03
# 27 "data/maps/CeruleanCity_Gym/scripts.pory"
	setflag FLAG_GOT_TM03_FROM_MISTY
# 28 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_ExplainTM03
# 29 "data/maps/CeruleanCity_Gym/scripts.pory"
	release
# 30 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
# 31 "data/maps/CeruleanCity_Gym/scripts.pory"

# 32 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_NoRoomForTM03::
# 33 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_BetterMakeRoomForThis
# 34 "data/maps/CeruleanCity_Gym/scripts.pory"
	release
# 35 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
# 36 "data/maps/CeruleanCity_Gym/scripts.pory"

# 37 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_Diana::
# 38 "data/maps/CeruleanCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_PICNICKER_DIANA, CeruleanCity_Gym_Text_DianaIntro, CeruleanCity_Gym_Text_DianaDefeat
# 39 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_DianaPostBattle, MSGBOX_AUTOCLOSE
# 40 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
# 41 "data/maps/CeruleanCity_Gym/scripts.pory"

# 42 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_Luis::
# 43 "data/maps/CeruleanCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_SWIMMER_MALE_LUIS, CeruleanCity_Gym_Text_LuisIntro, CeruleanCity_Gym_Text_LuisDefeat
# 44 "data/maps/CeruleanCity_Gym/scripts.pory"
	famechecker FAMECHECKER_MISTY, 2
# 45 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_LuisPostBattle, MSGBOX_AUTOCLOSE
# 46 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
# 47 "data/maps/CeruleanCity_Gym/scripts.pory"

# 48 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_GymGuy::
# 49 "data/maps/CeruleanCity_Gym/scripts.pory"
	lock
# 50 "data/maps/CeruleanCity_Gym/scripts.pory"
	faceplayer
# 51 "data/maps/CeruleanCity_Gym/scripts.pory"
	goto_if_set FLAG_DEFEATED_MISTY, CeruleanCity_Gym_EventScript_GymGuyPostVictory
# 52 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_GymGuyAdvice
# 53 "data/maps/CeruleanCity_Gym/scripts.pory"
	release
# 54 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
# 55 "data/maps/CeruleanCity_Gym/scripts.pory"

# 56 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_GymGuyPostVictory::
# 57 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_WeMakePrettyGoodTeam
# 58 "data/maps/CeruleanCity_Gym/scripts.pory"
	release
# 59 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
# 60 "data/maps/CeruleanCity_Gym/scripts.pory"

# 61 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_GymStatue::
# 62 "data/maps/CeruleanCity_Gym/scripts.pory"
	lockall
# 63 "data/maps/CeruleanCity_Gym/scripts.pory"
	goto_if_set FLAG_BADGE02_GET, CeruleanCity_Gym_EventScript_GymStatuePostVictory
# 64 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_GymStatue
# 65 "data/maps/CeruleanCity_Gym/scripts.pory"
	releaseall
# 66 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
# 67 "data/maps/CeruleanCity_Gym/scripts.pory"

# 68 "data/maps/CeruleanCity_Gym/scripts.pory"
CeruleanCity_Gym_EventScript_GymStatuePostVictory::
# 69 "data/maps/CeruleanCity_Gym/scripts.pory"
	msgbox CeruleanCity_Gym_Text_GymStatuePlayerWon
# 70 "data/maps/CeruleanCity_Gym/scripts.pory"
	releaseall
# 71 "data/maps/CeruleanCity_Gym/scripts.pory"
	end
