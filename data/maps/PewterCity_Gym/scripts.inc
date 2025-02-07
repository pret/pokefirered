# 1 "data/maps/PewterCity_Gym/scripts.pory"

# 2 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_MapScripts::
# 3 "data/maps/PewterCity_Gym/scripts.pory"
	.byte 0
# 4 "data/maps/PewterCity_Gym/scripts.pory"

# 5 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_Brock::
# 6 "data/maps/PewterCity_Gym/scripts.pory"
	famechecker FAMECHECKER_BROCK, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 7 "data/maps/PewterCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_LEADER_BROCK, PewterCity_Gym_Text_BrockIntro, PewterCity_Gym_Text_BrockDefeat, PewterCity_Gym_EventScript_DefeatedBrock, NO_MUSIC
# 8 "data/maps/PewterCity_Gym/scripts.pory"
	goto_if_unset FLAG_GOT_TM39_FROM_BROCK, PewterCity_Gym_EventScript_GiveTM39
# 9 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_BrockPostBattle
# 10 "data/maps/PewterCity_Gym/scripts.pory"
	release
# 11 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 12 "data/maps/PewterCity_Gym/scripts.pory"

# 13 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_DefeatedBrock::
# 14 "data/maps/PewterCity_Gym/scripts.pory"
	famechecker FAMECHECKER_BROCK, 1
# 15 "data/maps/PewterCity_Gym/scripts.pory"
	setflag FLAG_DEFEATED_BROCK
# 16 "data/maps/PewterCity_Gym/scripts.pory"
	setflag FLAG_BADGE01_GET
# 17 "data/maps/PewterCity_Gym/scripts.pory"
	setvar VAR_MAP_SCENE_PEWTER_CITY, 1
# 18 "data/maps/PewterCity_Gym/scripts.pory"
	setflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
# 19 "data/maps/PewterCity_Gym/scripts.pory"
	clearflag FLAG_HIDE_PEWTER_CITY_RUNNING_SHOES_GUY
# 20 "data/maps/PewterCity_Gym/scripts.pory"
	set_gym_trainers 1
# 21 "data/maps/PewterCity_Gym/scripts.pory"
	goto PewterCity_Gym_EventScript_GiveTM39
# 22 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 23 "data/maps/PewterCity_Gym/scripts.pory"

# 24 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_GiveTM39::
# 25 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_TakeThisWithYou
# 26 "data/maps/PewterCity_Gym/scripts.pory"
	checkitemspace ITEM_TM39
# 27 "data/maps/PewterCity_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, PewterCity_Gym_EventScript_NoRoomForTM39
# 28 "data/maps/PewterCity_Gym/scripts.pory"
	giveitem_msg PewterCity_Gym_Text_ReceivedTM39FromBrock, ITEM_TM39
# 29 "data/maps/PewterCity_Gym/scripts.pory"
	setflag FLAG_GOT_TM39_FROM_BROCK
# 30 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_ExplainTM39
# 31 "data/maps/PewterCity_Gym/scripts.pory"
	release
# 32 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 33 "data/maps/PewterCity_Gym/scripts.pory"

# 34 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_NoRoomForTM39::
# 35 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_DontHaveRoomForThis
# 36 "data/maps/PewterCity_Gym/scripts.pory"
	release
# 37 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 38 "data/maps/PewterCity_Gym/scripts.pory"

# 39 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_Liam::
# 40 "data/maps/PewterCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_CAMPER_LIAM, PewterCity_Gym_Text_LiamIntro, PewterCity_Gym_Text_LiamDefeat
# 41 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_LiamPostBattle, MSGBOX_AUTOCLOSE
# 42 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 43 "data/maps/PewterCity_Gym/scripts.pory"

# 44 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_GymGuy::
# 45 "data/maps/PewterCity_Gym/scripts.pory"
	lock
# 46 "data/maps/PewterCity_Gym/scripts.pory"
	faceplayer
# 47 "data/maps/PewterCity_Gym/scripts.pory"
	goto_if_set FLAG_DEFEATED_BROCK, PewterCity_Gym_EventScript_GymGuyPostVictory
# 48 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_LetMeTakeYouToTheTop, MSGBOX_YESNO
# 49 "data/maps/PewterCity_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, YES, PewterCity_Gym_EventScript_GymGuyTakeMeToTop
# 50 "data/maps/PewterCity_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, NO, PewterCity_Gym_EventScript_GymGuyDontTakeMeToTop
# 51 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 52 "data/maps/PewterCity_Gym/scripts.pory"

# 53 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_GymGuyPostVictory::
# 54 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_YoureChampMaterial
# 55 "data/maps/PewterCity_Gym/scripts.pory"
	release
# 56 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 57 "data/maps/PewterCity_Gym/scripts.pory"

# 58 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_GymGuyTakeMeToTop::
# 59 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_LetsGetHappening
# 60 "data/maps/PewterCity_Gym/scripts.pory"
	goto PewterCity_Gym_EventScript_GymGuyAdvice
# 61 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 62 "data/maps/PewterCity_Gym/scripts.pory"

# 63 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_GymGuyDontTakeMeToTop::
# 64 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_ItsFreeLetsGetHappening
# 65 "data/maps/PewterCity_Gym/scripts.pory"
	goto PewterCity_Gym_EventScript_GymGuyAdvice
# 66 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 67 "data/maps/PewterCity_Gym/scripts.pory"

# 68 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_GymGuyAdvice::
# 69 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_TryDifferentPartyOrders
# 70 "data/maps/PewterCity_Gym/scripts.pory"
	release
# 71 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 72 "data/maps/PewterCity_Gym/scripts.pory"

# 73 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_GymStatue::
# 74 "data/maps/PewterCity_Gym/scripts.pory"
	lockall
# 75 "data/maps/PewterCity_Gym/scripts.pory"
	goto_if_set FLAG_BADGE01_GET, PewterCity_Gym_EventScript_GymStatuePostVictory
# 76 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_GymStatue
# 77 "data/maps/PewterCity_Gym/scripts.pory"
	releaseall
# 78 "data/maps/PewterCity_Gym/scripts.pory"
	end
# 79 "data/maps/PewterCity_Gym/scripts.pory"

# 80 "data/maps/PewterCity_Gym/scripts.pory"
PewterCity_Gym_EventScript_GymStatuePostVictory::
# 81 "data/maps/PewterCity_Gym/scripts.pory"
	msgbox PewterCity_Gym_Text_GymStatuePlayerWon
# 82 "data/maps/PewterCity_Gym/scripts.pory"
	releaseall
# 83 "data/maps/PewterCity_Gym/scripts.pory"
	end
