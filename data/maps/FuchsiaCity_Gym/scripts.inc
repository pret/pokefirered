# 1 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 2 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_MapScripts::
# 3 "data/maps/FuchsiaCity_Gym/scripts.pory"
	.byte 0
# 4 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 5 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_Koga::
# 6 "data/maps/FuchsiaCity_Gym/scripts.pory"
	famechecker FAMECHECKER_KOGA, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 7 "data/maps/FuchsiaCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_LEADER_KOGA, FuchsiaCity_Gym_Text_KogaIntro, FuchsiaCity_Gym_Text_KogaDefeat, FuchsiaCity_Gym_EventScript_DefeatedKoga, NO_MUSIC
# 8 "data/maps/FuchsiaCity_Gym/scripts.pory"
	goto_if_unset FLAG_GOT_TM06_FROM_KOGA, FuchsiaCity_Gym_EventScript_GiveTM06
# 9 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_KogaPostBattle
# 10 "data/maps/FuchsiaCity_Gym/scripts.pory"
	release
# 11 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 12 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 13 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_DefeatedKoga::
# 14 "data/maps/FuchsiaCity_Gym/scripts.pory"
	famechecker FAMECHECKER_KOGA, 1
# 15 "data/maps/FuchsiaCity_Gym/scripts.pory"
	clearflag FLAG_HIDE_FAME_CHECKER_KOGA_JOURNAL
# 16 "data/maps/FuchsiaCity_Gym/scripts.pory"
	setflag FLAG_DEFEATED_KOGA
# 17 "data/maps/FuchsiaCity_Gym/scripts.pory"
	setflag FLAG_BADGE05_GET
# 18 "data/maps/FuchsiaCity_Gym/scripts.pory"
	set_gym_trainers 5
# 19 "data/maps/FuchsiaCity_Gym/scripts.pory"
	goto FuchsiaCity_Gym_EventScript_GiveTM06
# 20 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 21 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 22 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_GiveTM06::
# 23 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_KogaExplainSoulBadge
# 24 "data/maps/FuchsiaCity_Gym/scripts.pory"
	checkitemspace ITEM_TM06
# 25 "data/maps/FuchsiaCity_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, FuchsiaCity_Gym_EventScript_NoRoomForTM06
# 26 "data/maps/FuchsiaCity_Gym/scripts.pory"
	giveitem_msg FuchsiaCity_Gym_Text_ReceivedTM06FromKoga, ITEM_TM06
# 27 "data/maps/FuchsiaCity_Gym/scripts.pory"
	setflag FLAG_GOT_TM06_FROM_KOGA
# 28 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_KogaExplainTM06
# 29 "data/maps/FuchsiaCity_Gym/scripts.pory"
	release
# 30 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 31 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 32 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_NoRoomForTM06::
# 33 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_MakeSpaceForThis
# 34 "data/maps/FuchsiaCity_Gym/scripts.pory"
	release
# 35 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 36 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 37 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_Phil::
# 38 "data/maps/FuchsiaCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_TAMER_PHIL, FuchsiaCity_Gym_Text_PhilIntro, FuchsiaCity_Gym_Text_PhilDefeat
# 39 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_PhilPostBattle, MSGBOX_AUTOCLOSE
# 40 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 41 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 42 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_Edgar::
# 43 "data/maps/FuchsiaCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_TAMER_EDGAR, FuchsiaCity_Gym_Text_EdgarIntro, FuchsiaCity_Gym_Text_EdgarDefeat
# 44 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_EdgarPostBattle, MSGBOX_AUTOCLOSE
# 45 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 46 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 47 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_Kirk::
# 48 "data/maps/FuchsiaCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_JUGGLER_KIRK, FuchsiaCity_Gym_Text_KirkIntro, FuchsiaCity_Gym_Text_KirkDefeat
# 49 "data/maps/FuchsiaCity_Gym/scripts.pory"
	famechecker FAMECHECKER_KOGA, 2
# 50 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_KirkPostBattle, MSGBOX_AUTOCLOSE
# 51 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 52 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 53 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_Shawn::
# 54 "data/maps/FuchsiaCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_JUGGLER_SHAWN, FuchsiaCity_Gym_Text_ShawnIntro, FuchsiaCity_Gym_Text_ShawnDefeat
# 55 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_ShawnPostBattle, MSGBOX_AUTOCLOSE
# 56 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 57 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 58 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_Kayden::
# 59 "data/maps/FuchsiaCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_JUGGLER_KAYDEN, FuchsiaCity_Gym_Text_KaydenIntro, FuchsiaCity_Gym_Text_KaydenDefeat
# 60 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_KaydenPostBattle, MSGBOX_AUTOCLOSE
# 61 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 62 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 63 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_Nate::
# 64 "data/maps/FuchsiaCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_JUGGLER_NATE, FuchsiaCity_Gym_Text_NateIntro, FuchsiaCity_Gym_Text_NateDefeat
# 65 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_NatePostBattle, MSGBOX_AUTOCLOSE
# 66 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 67 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 68 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_GymGuy::
# 69 "data/maps/FuchsiaCity_Gym/scripts.pory"
	lock
# 70 "data/maps/FuchsiaCity_Gym/scripts.pory"
	faceplayer
# 71 "data/maps/FuchsiaCity_Gym/scripts.pory"
	goto_if_set FLAG_DEFEATED_KOGA, FuchsiaCity_Gym_EventScript_GymGuyPostVictory
# 72 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_GymGuyAdvice
# 73 "data/maps/FuchsiaCity_Gym/scripts.pory"
	release
# 74 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 75 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 76 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_GymGuyPostVictory::
# 77 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_GymGuyPostVictory
# 78 "data/maps/FuchsiaCity_Gym/scripts.pory"
	release
# 79 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 80 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 81 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_GymStatue::
# 82 "data/maps/FuchsiaCity_Gym/scripts.pory"
	lockall
# 83 "data/maps/FuchsiaCity_Gym/scripts.pory"
	goto_if_set FLAG_BADGE05_GET, FuchsiaCity_Gym_EventScript_GymStatuePostVictory
# 84 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_GymStatue
# 85 "data/maps/FuchsiaCity_Gym/scripts.pory"
	releaseall
# 86 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
# 87 "data/maps/FuchsiaCity_Gym/scripts.pory"

# 88 "data/maps/FuchsiaCity_Gym/scripts.pory"
FuchsiaCity_Gym_EventScript_GymStatuePostVictory::
# 89 "data/maps/FuchsiaCity_Gym/scripts.pory"
	msgbox FuchsiaCity_Gym_Text_GymStatuePlayerWon
# 90 "data/maps/FuchsiaCity_Gym/scripts.pory"
	releaseall
# 91 "data/maps/FuchsiaCity_Gym/scripts.pory"
	end
