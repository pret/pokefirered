# 1 "data/maps/SaffronCity_Gym/scripts.pory"

# 2 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_MapScripts::
# 3 "data/maps/SaffronCity_Gym/scripts.pory"
	.byte 0
# 4 "data/maps/SaffronCity_Gym/scripts.pory"

# 5 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_Sabrina::
# 6 "data/maps/SaffronCity_Gym/scripts.pory"
	famechecker FAMECHECKER_SABRINA, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 7 "data/maps/SaffronCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_LEADER_SABRINA, SaffronCity_Gym_Text_SabrinaIntro, SaffronCity_Gym_Text_SabrinaDefeat, SaffronCity_Gym_EventScript_DefeatedSabrina, NO_MUSIC
# 8 "data/maps/SaffronCity_Gym/scripts.pory"
	goto_if_unset FLAG_GOT_TM04_FROM_SABRINA, SaffronCity_Gym_EventScript_GiveTM04
# 9 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_ExplainTM04
# 10 "data/maps/SaffronCity_Gym/scripts.pory"
	release
# 11 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 12 "data/maps/SaffronCity_Gym/scripts.pory"

# 13 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_DefeatedSabrina::
# 14 "data/maps/SaffronCity_Gym/scripts.pory"
	famechecker FAMECHECKER_SABRINA, 2
# 15 "data/maps/SaffronCity_Gym/scripts.pory"
	famechecker FAMECHECKER_SABRINA, 3
# 16 "data/maps/SaffronCity_Gym/scripts.pory"
	clearflag FLAG_HIDE_SAFFRON_CITY_POKECENTER_SABRINA_JOURNALS
# 17 "data/maps/SaffronCity_Gym/scripts.pory"
	setflag FLAG_DEFEATED_SABRINA
# 18 "data/maps/SaffronCity_Gym/scripts.pory"
	setflag FLAG_BADGE06_GET
# 19 "data/maps/SaffronCity_Gym/scripts.pory"
	set_gym_trainers 6
# 20 "data/maps/SaffronCity_Gym/scripts.pory"
	goto SaffronCity_Gym_EventScript_GiveTM04
# 21 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 22 "data/maps/SaffronCity_Gym/scripts.pory"

# 23 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_GiveTM04::
# 24 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_ExplainMarshBadgeTakeThis
# 25 "data/maps/SaffronCity_Gym/scripts.pory"
	checkitemspace ITEM_TM04
# 26 "data/maps/SaffronCity_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, SaffronCity_Gym_EventScript_NoRoomForTM04
# 27 "data/maps/SaffronCity_Gym/scripts.pory"
	giveitem_msg SaffronCity_Gym_Text_ReceivedTM04FromSabrina, ITEM_TM04
# 28 "data/maps/SaffronCity_Gym/scripts.pory"
	setflag FLAG_GOT_TM04_FROM_SABRINA
# 29 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_SabrinaPostBattle
# 30 "data/maps/SaffronCity_Gym/scripts.pory"
	release
# 31 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 32 "data/maps/SaffronCity_Gym/scripts.pory"

# 33 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_NoRoomForTM04::
# 34 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_BagFullOfOtherItems
# 35 "data/maps/SaffronCity_Gym/scripts.pory"
	release
# 36 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 37 "data/maps/SaffronCity_Gym/scripts.pory"

# 38 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_Johan::
# 39 "data/maps/SaffronCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_PSYCHIC_JOHAN, SaffronCity_Gym_Text_JohanIntro, SaffronCity_Gym_Text_JohanDefeat
# 40 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_JohanPostBattle, MSGBOX_AUTOCLOSE
# 41 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 42 "data/maps/SaffronCity_Gym/scripts.pory"

# 43 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_Tyron::
# 44 "data/maps/SaffronCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_PSYCHIC_TYRON, SaffronCity_Gym_Text_TyronIntro, SaffronCity_Gym_Text_TyronDefeat
# 45 "data/maps/SaffronCity_Gym/scripts.pory"
	famechecker FAMECHECKER_SABRINA, 5
# 46 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_TyronPostBattle, MSGBOX_AUTOCLOSE
# 47 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 48 "data/maps/SaffronCity_Gym/scripts.pory"

# 49 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_Cameron::
# 50 "data/maps/SaffronCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_PSYCHIC_CAMERON, SaffronCity_Gym_Text_CameronIntro, SaffronCity_Gym_Text_CameronDefeat
# 51 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_CameronPostBattle, MSGBOX_AUTOCLOSE
# 52 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 53 "data/maps/SaffronCity_Gym/scripts.pory"

# 54 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_Preston::
# 55 "data/maps/SaffronCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_PSYCHIC_PRESTON, SaffronCity_Gym_Text_PrestonIntro, SaffronCity_Gym_Text_PrestonDefeat
# 56 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_PrestonPostBattle, MSGBOX_AUTOCLOSE
# 57 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 58 "data/maps/SaffronCity_Gym/scripts.pory"

# 59 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_Amanda::
# 60 "data/maps/SaffronCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_AMANDA, SaffronCity_Gym_Text_AmandaIntro, SaffronCity_Gym_Text_AmandaDefeat
# 61 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_AmandaPostBattle, MSGBOX_AUTOCLOSE
# 62 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 63 "data/maps/SaffronCity_Gym/scripts.pory"

# 64 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_Stacy::
# 65 "data/maps/SaffronCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_STACY, SaffronCity_Gym_Text_StacyIntro, SaffronCity_Gym_Text_StacyDefeat
# 66 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_StacyPostBattle, MSGBOX_AUTOCLOSE
# 67 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 68 "data/maps/SaffronCity_Gym/scripts.pory"

# 69 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_Tasha::
# 70 "data/maps/SaffronCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_TASHA, SaffronCity_Gym_Text_TashaIntro, SaffronCity_Gym_Text_TashaDefeat
# 71 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_TashaPostBattle, MSGBOX_AUTOCLOSE
# 72 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 73 "data/maps/SaffronCity_Gym/scripts.pory"

# 74 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_GymGuy::
# 75 "data/maps/SaffronCity_Gym/scripts.pory"
	lock
# 76 "data/maps/SaffronCity_Gym/scripts.pory"
	faceplayer
# 77 "data/maps/SaffronCity_Gym/scripts.pory"
	goto_if_set FLAG_DEFEATED_SABRINA, SaffronCity_Gym_EventScript_GymGuyPostVictory
# 78 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_GymGuyAdvice
# 79 "data/maps/SaffronCity_Gym/scripts.pory"
	release
# 80 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 81 "data/maps/SaffronCity_Gym/scripts.pory"

# 82 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_GymGuyPostVictory::
# 83 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_GymGuyPostVictory
# 84 "data/maps/SaffronCity_Gym/scripts.pory"
	release
# 85 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 86 "data/maps/SaffronCity_Gym/scripts.pory"

# 87 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_GymStatue::
# 88 "data/maps/SaffronCity_Gym/scripts.pory"
	lockall
# 89 "data/maps/SaffronCity_Gym/scripts.pory"
	goto_if_set FLAG_BADGE06_GET, SaffronCity_Gym_EventScript_GymStatuePostVictory
# 90 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_GymStatue
# 91 "data/maps/SaffronCity_Gym/scripts.pory"
	releaseall
# 92 "data/maps/SaffronCity_Gym/scripts.pory"
	end
# 93 "data/maps/SaffronCity_Gym/scripts.pory"

# 94 "data/maps/SaffronCity_Gym/scripts.pory"
SaffronCity_Gym_EventScript_GymStatuePostVictory::
# 95 "data/maps/SaffronCity_Gym/scripts.pory"
	msgbox SaffronCity_Gym_Text_GymStatuePlayerWon
# 96 "data/maps/SaffronCity_Gym/scripts.pory"
	releaseall
# 97 "data/maps/SaffronCity_Gym/scripts.pory"
	end
