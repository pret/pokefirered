# 1 "data/maps/ViridianCity_Gym/scripts.pory"

# 2 "data/maps/ViridianCity_Gym/scripts.pory"
.set LOCALID_GIOVANNI, 8
# 3 "data/maps/ViridianCity_Gym/scripts.pory"

# 4 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_MapScripts::
# 5 "data/maps/ViridianCity_Gym/scripts.pory"
	.byte 0
# 6 "data/maps/ViridianCity_Gym/scripts.pory"

# 7 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_Giovanni::
# 8 "data/maps/ViridianCity_Gym/scripts.pory"
	famechecker FAMECHECKER_GIOVANNI, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 9 "data/maps/ViridianCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_LEADER_GIOVANNI, ViridianCity_Gym_Text_GiovanniIntro, ViridianCity_Gym_Text_GiovanniDefeat, ViridianCity_Gym_EventScript_DefeatedGiovanni, NO_MUSIC
# 10 "data/maps/ViridianCity_Gym/scripts.pory"
	goto_if_unset FLAG_GOT_TM26_FROM_GIOVANNI, ViridianCity_Gym_EventScript_GiveTM26
# 11 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_GiovanniPostBattle
# 12 "data/maps/ViridianCity_Gym/scripts.pory"
	closemessage
# 13 "data/maps/ViridianCity_Gym/scripts.pory"
	fadescreen FADE_TO_BLACK
# 14 "data/maps/ViridianCity_Gym/scripts.pory"
	removeobject LOCALID_GIOVANNI
# 15 "data/maps/ViridianCity_Gym/scripts.pory"
	fadescreen FADE_FROM_BLACK
# 16 "data/maps/ViridianCity_Gym/scripts.pory"
	release
# 17 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 18 "data/maps/ViridianCity_Gym/scripts.pory"

# 19 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_DefeatedGiovanni::
# 20 "data/maps/ViridianCity_Gym/scripts.pory"
	famechecker FAMECHECKER_GIOVANNI, 3
# 21 "data/maps/ViridianCity_Gym/scripts.pory"
	setflag FLAG_HIDE_MISC_KANTO_ROCKETS
# 22 "data/maps/ViridianCity_Gym/scripts.pory"
	setflag FLAG_DEFEATED_LEADER_GIOVANNI
# 23 "data/maps/ViridianCity_Gym/scripts.pory"
	setflag FLAG_BADGE08_GET
# 24 "data/maps/ViridianCity_Gym/scripts.pory"
	setvar VAR_MAP_SCENE_ROUTE22, 3
# 25 "data/maps/ViridianCity_Gym/scripts.pory"
	set_gym_trainers 8
# 26 "data/maps/ViridianCity_Gym/scripts.pory"
	goto ViridianCity_Gym_EventScript_GiveTM26
# 27 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 28 "data/maps/ViridianCity_Gym/scripts.pory"

# 29 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_GiveTM26::
# 30 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_ExplainEarthBadgeTakeThis
# 31 "data/maps/ViridianCity_Gym/scripts.pory"
	checkitemspace ITEM_TM26
# 32 "data/maps/ViridianCity_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, ViridianCity_Gym_EventScript_NoRoomForTM26
# 33 "data/maps/ViridianCity_Gym/scripts.pory"
	giveitem_msg ViridianCity_Gym_Text_ReceivedTM26FromGiovanni, ITEM_TM26
# 34 "data/maps/ViridianCity_Gym/scripts.pory"
	setflag FLAG_GOT_TM26_FROM_GIOVANNI
# 35 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_ExplainTM26
# 36 "data/maps/ViridianCity_Gym/scripts.pory"
	release
# 37 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 38 "data/maps/ViridianCity_Gym/scripts.pory"

# 39 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_NoRoomForTM26::
# 40 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_YouDoNotHaveSpace
# 41 "data/maps/ViridianCity_Gym/scripts.pory"
	release
# 42 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 43 "data/maps/ViridianCity_Gym/scripts.pory"

# 44 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_Jason::
# 45 "data/maps/ViridianCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_TAMER_JASON, ViridianCity_Gym_Text_JasonIntro, ViridianCity_Gym_Text_JasonDefeat
# 46 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_JasonPostBattle, MSGBOX_AUTOCLOSE
# 47 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 48 "data/maps/ViridianCity_Gym/scripts.pory"

# 49 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_Cole::
# 50 "data/maps/ViridianCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_TAMER_COLE, ViridianCity_Gym_Text_ColeIntro, ViridianCity_Gym_Text_ColeDefeat
# 51 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_ColePostBattle, MSGBOX_AUTOCLOSE
# 52 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 53 "data/maps/ViridianCity_Gym/scripts.pory"

# 54 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_Atsushi::
# 55 "data/maps/ViridianCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_BLACK_BELT_ATSUSHI, ViridianCity_Gym_Text_AtsushiIntro, ViridianCity_Gym_Text_AtsushiDefeat
# 56 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_AtsushiPostBattle, MSGBOX_AUTOCLOSE
# 57 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 58 "data/maps/ViridianCity_Gym/scripts.pory"

# 59 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_Kiyo::
# 60 "data/maps/ViridianCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_BLACK_BELT_KIYO, ViridianCity_Gym_Text_KiyoIntro, ViridianCity_Gym_Text_KiyoDefeat
# 61 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_KiyoPostBattle, MSGBOX_AUTOCLOSE
# 62 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 63 "data/maps/ViridianCity_Gym/scripts.pory"

# 64 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_Takashi::
# 65 "data/maps/ViridianCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_BLACK_BELT_TAKASHI, ViridianCity_Gym_Text_TakashiIntro, ViridianCity_Gym_Text_TakashiDefeat
# 66 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_TakashiPostBattle, MSGBOX_AUTOCLOSE
# 67 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 68 "data/maps/ViridianCity_Gym/scripts.pory"

# 69 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_Samuel::
# 70 "data/maps/ViridianCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_COOLTRAINER_SAMUEL, ViridianCity_Gym_Text_SamuelIntro, ViridianCity_Gym_Text_SamuelDefeat
# 71 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_SamuelPostBattle, MSGBOX_AUTOCLOSE
# 72 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 73 "data/maps/ViridianCity_Gym/scripts.pory"

# 74 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_Yuji::
# 75 "data/maps/ViridianCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_COOLTRAINER_YUJI, ViridianCity_Gym_Text_YujiIntro, ViridianCity_Gym_Text_YujiDefeat
# 76 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_YujiPostBattle, MSGBOX_AUTOCLOSE
# 77 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 78 "data/maps/ViridianCity_Gym/scripts.pory"

# 79 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_Warren::
# 80 "data/maps/ViridianCity_Gym/scripts.pory"
	trainerbattle_single TRAINER_COOLTRAINER_WARREN, ViridianCity_Gym_Text_WarrenIntro, ViridianCity_Gym_Text_WarrenDefeat
# 81 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_WarrenPostBattle, MSGBOX_AUTOCLOSE
# 82 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 83 "data/maps/ViridianCity_Gym/scripts.pory"

# 84 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_GymGuy::
# 85 "data/maps/ViridianCity_Gym/scripts.pory"
	lock
# 86 "data/maps/ViridianCity_Gym/scripts.pory"
	faceplayer
# 87 "data/maps/ViridianCity_Gym/scripts.pory"
	goto_if_set FLAG_DEFEATED_LEADER_GIOVANNI, ViridianCity_Gym_EventScript_GymGuyPostVictory
# 88 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_GymGuyAdvice
# 89 "data/maps/ViridianCity_Gym/scripts.pory"
	release
# 90 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 91 "data/maps/ViridianCity_Gym/scripts.pory"

# 92 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_GymGuyPostVictory::
# 93 "data/maps/ViridianCity_Gym/scripts.pory"
	famechecker FAMECHECKER_GIOVANNI, 4
# 94 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_GymGuyPostVictory
# 95 "data/maps/ViridianCity_Gym/scripts.pory"
	release
# 96 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 97 "data/maps/ViridianCity_Gym/scripts.pory"

# 98 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_GymStatue::
# 99 "data/maps/ViridianCity_Gym/scripts.pory"
	lockall
# 100 "data/maps/ViridianCity_Gym/scripts.pory"
	goto_if_set FLAG_BADGE08_GET, ViridianCity_Gym_EventScript_GymStatuePostVictory
# 101 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_GymStatue
# 102 "data/maps/ViridianCity_Gym/scripts.pory"
	releaseall
# 103 "data/maps/ViridianCity_Gym/scripts.pory"
	end
# 104 "data/maps/ViridianCity_Gym/scripts.pory"

# 105 "data/maps/ViridianCity_Gym/scripts.pory"
ViridianCity_Gym_EventScript_GymStatuePostVictory::
# 106 "data/maps/ViridianCity_Gym/scripts.pory"
	msgbox ViridianCity_Gym_Text_GymStatuePlayerWon
# 107 "data/maps/ViridianCity_Gym/scripts.pory"
	releaseall
# 108 "data/maps/ViridianCity_Gym/scripts.pory"
	end
