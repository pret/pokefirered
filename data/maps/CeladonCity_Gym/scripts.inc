# 1 "data/maps/CeladonCity_Gym/scripts.pory"

# 2 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_MapScripts::
# 3 "data/maps/CeladonCity_Gym/scripts.pory"
	.byte 0
# 4 "data/maps/CeladonCity_Gym/scripts.pory"

# 5 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_Erika::
# 6 "data/maps/CeladonCity_Gym/scripts.pory"
	famechecker FAMECHECKER_ERIKA, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 7 "data/maps/CeladonCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_LEADER_ERIKA, CeladonCity_Gym_Text_ErikaIntro, CeladonCity_Gym_Text_ErikaDefeat, CeladonCity_Gym_EventScript_DefeatedErika, NO_MUSIC
# 8 "data/maps/CeladonCity_Gym/scripts.pory"
	goto_if_unset FLAG_GOT_TM19_FROM_ERIKA, CeladonCity_Gym_EventScript_GiveTM19
# 9 "data/maps/CeladonCity_Gym/scripts.pory"
	famechecker FAMECHECKER_ERIKA, 4
# 10 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_ErikaPostBattle
# 11 "data/maps/CeladonCity_Gym/scripts.pory"
	release
# 12 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 13 "data/maps/CeladonCity_Gym/scripts.pory"

# 14 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_DefeatedErika::
# 15 "data/maps/CeladonCity_Gym/scripts.pory"
	famechecker FAMECHECKER_ERIKA, 1
# 16 "data/maps/CeladonCity_Gym/scripts.pory"
	clearflag FLAG_HIDE_FAME_CHECKER_ERIKA_JOURNALS
# 17 "data/maps/CeladonCity_Gym/scripts.pory"
	setflag FLAG_DEFEATED_ERIKA
# 18 "data/maps/CeladonCity_Gym/scripts.pory"
	setflag FLAG_BADGE04_GET
# 19 "data/maps/CeladonCity_Gym/scripts.pory"
	set_gym_trainers 4
# 20 "data/maps/CeladonCity_Gym/scripts.pory"
	goto CeladonCity_Gym_EventScript_GiveTM19
# 21 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 22 "data/maps/CeladonCity_Gym/scripts.pory"

# 23 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_GiveTM19::
# 24 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_ExplainRainbowBadgeTakeThis
# 25 "data/maps/CeladonCity_Gym/scripts.pory"
	checkitemspace ITEM_TM19
# 26 "data/maps/CeladonCity_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeladonCity_Gym_EventScript_NoRoomForTM19
# 27 "data/maps/CeladonCity_Gym/scripts.pory"
	giveitem_msg CeladonCity_Gym_Text_ReceivedTM19FromErika, ITEM_TM19
# 28 "data/maps/CeladonCity_Gym/scripts.pory"
	setflag FLAG_GOT_TM19_FROM_ERIKA
# 29 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_ExplainTM19
# 30 "data/maps/CeladonCity_Gym/scripts.pory"
	release
# 31 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 32 "data/maps/CeladonCity_Gym/scripts.pory"

# 33 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_NoRoomForTM19::
# 34 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_ShouldMakeRoomForThis
# 35 "data/maps/CeladonCity_Gym/scripts.pory"
	release
# 36 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 37 "data/maps/CeladonCity_Gym/scripts.pory"

# 38 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_Kay::
# 39 "data/maps/CeladonCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_LASS_KAY, CeladonCity_Gym_Text_KayIntro, CeladonCity_Gym_Text_KayDefeat
# 40 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_KayPostBattle, MSGBOX_AUTOCLOSE
# 41 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 42 "data/maps/CeladonCity_Gym/scripts.pory"

# 43 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_Lisa::
# 44 "data/maps/CeladonCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_LASS_LISA, CeladonCity_Gym_Text_LisaIntro, CeladonCity_Gym_Text_LisaDefeat
# 45 "data/maps/CeladonCity_Gym/scripts.pory"
	famechecker FAMECHECKER_ERIKA, 2
# 46 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_LisaPostBattle, MSGBOX_AUTOCLOSE
# 47 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 48 "data/maps/CeladonCity_Gym/scripts.pory"

# 49 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_Tina::
# 50 "data/maps/CeladonCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_PICNICKER_TINA, CeladonCity_Gym_Text_TinaIntro, CeladonCity_Gym_Text_TinaDefeat
# 51 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_TinaPostBattle, MSGBOX_AUTOCLOSE
# 52 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 53 "data/maps/CeladonCity_Gym/scripts.pory"

# 54 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_Bridget::
# 55 "data/maps/CeladonCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_BEAUTY_BRIDGET, CeladonCity_Gym_Text_BridgetIntro, CeladonCity_Gym_Text_BridgetDefeat
# 56 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_BridgetPostBattle, MSGBOX_AUTOCLOSE
# 57 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 58 "data/maps/CeladonCity_Gym/scripts.pory"

# 59 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_Tamia::
# 60 "data/maps/CeladonCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_BEAUTY_TAMIA, CeladonCity_Gym_Text_TamiaIntro, CeladonCity_Gym_Text_TamiaDefeat
# 61 "data/maps/CeladonCity_Gym/scripts.pory"
	famechecker FAMECHECKER_ERIKA, 3
# 62 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_TamiaPostBattle, MSGBOX_AUTOCLOSE
# 63 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 64 "data/maps/CeladonCity_Gym/scripts.pory"

# 65 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_Lori::
# 66 "data/maps/CeladonCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_BEAUTY_LORI, CeladonCity_Gym_Text_LoriIntro, CeladonCity_Gym_Text_LoriDefeat
# 67 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_LoriPostBattle, MSGBOX_AUTOCLOSE
# 68 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 69 "data/maps/CeladonCity_Gym/scripts.pory"

# 70 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_Mary::
# 71 "data/maps/CeladonCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_COOLTRAINER_MARY, CeladonCity_Gym_Text_MaryIntro, CeladonCity_Gym_Text_MaryDefeat
# 72 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_MaryPostBattle, MSGBOX_AUTOCLOSE
# 73 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 74 "data/maps/CeladonCity_Gym/scripts.pory"

# 75 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_GymStatue::
# 76 "data/maps/CeladonCity_Gym/scripts.pory"
	lockall
# 77 "data/maps/CeladonCity_Gym/scripts.pory"
	goto_if_set FLAG_BADGE04_GET, CeladonCity_Gym_EventScript_GymStatuePostVictory
# 78 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_GymStatue
# 79 "data/maps/CeladonCity_Gym/scripts.pory"
	releaseall
# 80 "data/maps/CeladonCity_Gym/scripts.pory"
	end
# 81 "data/maps/CeladonCity_Gym/scripts.pory"

# 82 "data/maps/CeladonCity_Gym/scripts.pory"
CeladonCity_Gym_EventScript_GymStatuePostVictory::
# 83 "data/maps/CeladonCity_Gym/scripts.pory"
	msgbox CeladonCity_Gym_Text_GymStatuePlayerWon
# 84 "data/maps/CeladonCity_Gym/scripts.pory"
	releaseall
# 85 "data/maps/CeladonCity_Gym/scripts.pory"
	end
