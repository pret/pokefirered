# 1 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 2 "data/maps/CinnabarIsland_Gym/scripts.pory"
.set LOCALID_QUINN, 1
# 3 "data/maps/CinnabarIsland_Gym/scripts.pory"
.set LOCALID_AVERY, 3
# 4 "data/maps/CinnabarIsland_Gym/scripts.pory"
.set LOCALID_RAMON, 4
# 5 "data/maps/CinnabarIsland_Gym/scripts.pory"
.set LOCALID_DEREK, 5
# 6 "data/maps/CinnabarIsland_Gym/scripts.pory"
.set LOCALID_DUSTY, 6
# 7 "data/maps/CinnabarIsland_Gym/scripts.pory"
.set LOCALID_ZAC,   7
# 8 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 9 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_MapScripts::
# 10 "data/maps/CinnabarIsland_Gym/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, CinnabarIsland_Gym_OnLoad
# 11 "data/maps/CinnabarIsland_Gym/scripts.pory"
	.byte 0
# 12 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 13 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_OnLoad::
# 14 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_DEFEATED_BLAINE, CinnabarIsland_Gym_OnLoadOpenAllDoors
# 15 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_set FLAG_CINNABAR_GYM_QUIZ_1, CinnabarIsland_Gym_OnLoadOpenDoor1
# 16 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_set FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_OnLoadOpenDoor2
# 17 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_set FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_OnLoadOpenDoor3
# 18 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_set FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_OnLoadOpenDoor4
# 19 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_set FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_OnLoadOpenDoor5
# 20 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_set FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_OnLoadOpenDoor6
# 21 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 22 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 23 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_OnLoadOpenAllDoors::
# 24 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor1
# 25 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor2
# 26 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor3
# 27 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor4
# 28 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor5
# 29 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor6
# 30 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 31 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 32 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_OnLoadOpenDoor1::
# 33 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor1
# 34 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 35 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 36 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_OnLoadOpenDoor2::
# 37 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor2
# 38 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 39 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 40 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_OnLoadOpenDoor3::
# 41 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor3
# 42 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 43 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 44 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_OnLoadOpenDoor4::
# 45 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor4
# 46 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 47 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 48 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_OnLoadOpenDoor5::
# 49 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor5
# 50 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 51 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 52 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_OnLoadOpenDoor6::
# 53 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor6
# 54 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 55 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 56 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Blaine::
# 57 "data/maps/CinnabarIsland_Gym/scripts.pory"
	famechecker FAMECHECKER_BLAINE, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 58 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_single TRAINER_LEADER_BLAINE, CinnabarIsland_Gym_Text_BlaineIntro, CinnabarIsland_Gym_Text_BlaineDefeat, CinnabarIsland_Gym_EventScript_DefeatedBlaine, NO_MUSIC
# 59 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_unset FLAG_GOT_TM38_FROM_BLAINE, CinnabarIsland_Gym_EventScript_GiveTM38
# 60 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_BlainePostBattle
# 61 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 62 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 63 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 64 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DefeatedBlaine::
# 65 "data/maps/CinnabarIsland_Gym/scripts.pory"
	famechecker FAMECHECKER_BLAINE, 1
# 66 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setflag FLAG_DEFEATED_BLAINE
# 67 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setflag FLAG_BADGE07_GET
# 68 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setrespawn SPAWN_CINNABAR_ISLAND
# 69 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 1
# 70 "data/maps/CinnabarIsland_Gym/scripts.pory"
	clearflag FLAG_HIDE_CINNABAR_BILL
# 71 "data/maps/CinnabarIsland_Gym/scripts.pory"
	set_gym_trainers 7
# 72 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_GiveTM38
# 73 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 74 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 75 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_GiveTM38::
# 76 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_ExplainVolcanoBadge
# 77 "data/maps/CinnabarIsland_Gym/scripts.pory"
	checkitemspace ITEM_TM38
# 78 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CinnabarIsland_Gym_EventScript_NoRoomForTM38
# 79 "data/maps/CinnabarIsland_Gym/scripts.pory"
	giveitem_msg CinnabarIsland_Gym_Text_ReceivedTM38FromBlaine, ITEM_TM38
# 80 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setflag FLAG_GOT_TM38_FROM_BLAINE
# 81 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_FireBlastIsUltimateFireMove
# 82 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 83 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 84 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 85 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_NoRoomForTM38::
# 86 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_MakeSpaceForThis
# 87 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 88 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 89 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 90 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Erik::
# 91 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_single TRAINER_SUPER_NERD_ERIK, CinnabarIsland_Gym_Text_ErikIntro, CinnabarIsland_Gym_Text_ErikDefeat
# 92 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_ErikPostBattle, MSGBOX_AUTOCLOSE
# 93 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 94 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 95 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Avery::
# 96 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_single TRAINER_SUPER_NERD_AVERY, CinnabarIsland_Gym_Text_AveryIntro, CinnabarIsland_Gym_Text_AveryDefeat, CinnabarIsland_Gym_EventScript_DefeatedAvery
# 97 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_AveryPostBattle, MSGBOX_AUTOCLOSE
# 98 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 99 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 100 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DefeatedAvery::
# 101 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_EventScript_Quiz2CompleteTrainer
# 102 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 103 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 104 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 105 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz2CompleteTrainer::
# 106 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz2Complete
# 107 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 108 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 109 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Derek::
# 110 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_single TRAINER_SUPER_NERD_DEREK, CinnabarIsland_Gym_Text_DerekIntro, CinnabarIsland_Gym_Text_DerekDefeat, CinnabarIsland_Gym_EventScript_DefeatedDerek
# 111 "data/maps/CinnabarIsland_Gym/scripts.pory"
	famechecker FAMECHECKER_BLAINE, 2
# 112 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_DerekPostBattle, MSGBOX_AUTOCLOSE
# 113 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 114 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 115 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DefeatedDerek::
# 116 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_EventScript_Quiz4CompleteTrainer
# 117 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 118 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 119 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 120 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz4CompleteTrainer::
# 121 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz4Complete
# 122 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 123 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 124 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Zac::
# 125 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_single TRAINER_SUPER_NERD_ZAC, CinnabarIsland_Gym_Text_ZacIntro, CinnabarIsland_Gym_Text_ZacDefeat, CinnabarIsland_Gym_EventScript_DefeatedZac
# 126 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_ZacPostBattle, MSGBOX_AUTOCLOSE
# 127 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 128 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 129 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DefeatedZac::
# 130 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_EventScript_Quiz6CompleteTrainer
# 131 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 132 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 133 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 134 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz6CompleteTrainer::
# 135 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz6Complete
# 136 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 137 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 138 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quinn::
# 139 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_single TRAINER_BURGLAR_QUINN, CinnabarIsland_Gym_Text_QuinnIntro, CinnabarIsland_Gym_Text_QuinnDefeat, CinnabarIsland_Gym_EventScript_DefeatedQuinn
# 140 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_QuinnPostBattle, MSGBOX_AUTOCLOSE
# 141 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 142 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 143 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DefeatedQuinn::
# 144 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_1, CinnabarIsland_Gym_EventScript_Quiz1CompleteTrainer
# 145 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 146 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 147 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 148 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz1CompleteTrainer::
# 149 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz1Complete
# 150 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 151 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 152 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Ramon::
# 153 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_single TRAINER_BURGLAR_RAMON, CinnabarIsland_Gym_Text_RamonIntro, CinnabarIsland_Gym_Text_RamonDefeat, CinnabarIsland_Gym_EventScript_DefeatedRamon
# 154 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_RamonPostBattle, MSGBOX_AUTOCLOSE
# 155 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 156 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 157 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DefeatedRamon::
# 158 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_EventScript_Quiz3CompleteTrainer
# 159 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 160 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 161 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 162 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz3CompleteTrainer::
# 163 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz3Complete
# 164 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 165 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 166 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Dusty::
# 167 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_single TRAINER_BURGLAR_DUSTY, CinnabarIsland_Gym_Text_DustyIntro, CinnabarIsland_Gym_Text_DustyDefeat, CinnabarIsland_Gym_EventScript_DefeatedDusty
# 168 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_DustyPostBattle, MSGBOX_AUTOCLOSE
# 169 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 170 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 171 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DefeatedDusty::
# 172 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_unset FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_EventScript_Quiz5CompleteTrainer
# 173 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 174 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 175 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 176 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz5CompleteTrainer::
# 177 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz5Complete
# 178 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 179 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 180 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_GymGuy::
# 181 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lock
# 182 "data/maps/CinnabarIsland_Gym/scripts.pory"
	faceplayer
# 183 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_DEFEATED_BLAINE, CinnabarIsland_Gym_EventScript_GymGuyPostVictory
# 184 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_GymGuyAdvice
# 185 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 186 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 187 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 188 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_GymGuyPostVictory::
# 189 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_GymGuyPostVictory
# 190 "data/maps/CinnabarIsland_Gym/scripts.pory"
	release
# 191 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 192 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 193 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_GymStatue::
# 194 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 195 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_BADGE07_GET, CinnabarIsland_Gym_EventScript_GymStatuePostVictory
# 196 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_GymStatue
# 197 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 198 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 199 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 200 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_GymStatuePostVictory::
# 201 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_GymStatuePlayerWon
# 202 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 203 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 204 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 205 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quz1Left::
# 206 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 207 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 0
# 208 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz1
# 209 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 210 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 211 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quz1Right::
# 212 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 213 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 1
# 214 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz1
# 215 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 216 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 217 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz1::
# 218 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
# 219 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_QuizQuestion1, MSGBOX_YESNO
# 220 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, YES, CinnabarIsland_Gym_EventScript_Quiz1Correct
# 221 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_Gym_EventScript_Quiz1Incorrect
# 222 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 223 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 224 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_CorrectAnswer::
# 225 "data/maps/CinnabarIsland_Gym/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 226 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitfanfare
# 227 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_CorrectGoOnThrough
# 228 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 229 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 230 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_IncorrectAnswer::
# 231 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitse
# 232 "data/maps/CinnabarIsland_Gym/scripts.pory"
	playse SE_BOO
# 233 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitse
# 234 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_SorryBadCall
# 235 "data/maps/CinnabarIsland_Gym/scripts.pory"
	closemessage
# 236 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 237 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 238 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz1Correct::
# 239 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
# 240 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_1, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 241 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz1Complete
# 242 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 243 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 244 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 245 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz1Complete::
# 246 "data/maps/CinnabarIsland_Gym/scripts.pory"
	playse SE_UNLOCK
# 247 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitse
# 248 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor1
# 249 "data/maps/CinnabarIsland_Gym/scripts.pory"
	special DrawWholeMapView
# 250 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setflag FLAG_CINNABAR_GYM_QUIZ_1
# 251 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 252 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 253 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DoorAlreadyOpen::
# 254 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 255 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 256 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 257 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz1Incorrect::
# 258 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
# 259 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_not_defeated TRAINER_BURGLAR_QUINN, CinnabarIsland_Gym_EventScript_BattleQuinn
# 260 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 261 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 262 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 263 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_BattleQuinn::
# 264 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, CinnabarIsland_Gym_EventScript_QuinnApproachLeft
# 265 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, CinnabarIsland_Gym_EventScript_QuinnApproachRight
# 266 "data/maps/CinnabarIsland_Gym/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 267 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_QuinnIntro
# 268 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_no_intro TRAINER_BURGLAR_QUINN, CinnabarIsland_Gym_Text_QuinnDefeat
# 269 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_1, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 270 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz1Complete
# 271 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 272 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 273 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 274 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_QuinnApproachLeft::
# 275 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 276 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_QUINN, CinnabarIsland_Gym_Movement_QuinnApproachLeft
# 277 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 278 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 279 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 280 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_QuinnApproachRight::
# 281 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 282 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_QUINN, CinnabarIsland_Gym_Movement_QuinnApproachRight
# 283 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 284 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 285 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 286 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_QuinnApproachLeft::
# 287 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 288 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 289 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 290 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 291 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_QuinnApproachRight::
# 292 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 293 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 294 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 295 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz2Left::
# 296 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 297 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 0
# 298 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz2
# 299 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 300 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 301 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz2Right::
# 302 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 303 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 1
# 304 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz2
# 305 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 306 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 307 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz2::
# 308 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
# 309 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_QuizQuestion2, MSGBOX_YESNO
# 310 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, YES, CinnabarIsland_Gym_EventScript_Quiz2Incorrect
# 311 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_Gym_EventScript_Quiz2Correct
# 312 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 313 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 314 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz2Correct::
# 315 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
# 316 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 317 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz2Complete
# 318 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 319 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 320 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 321 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz2Complete::
# 322 "data/maps/CinnabarIsland_Gym/scripts.pory"
	playse SE_UNLOCK
# 323 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitse
# 324 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor2
# 325 "data/maps/CinnabarIsland_Gym/scripts.pory"
	special DrawWholeMapView
# 326 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setflag FLAG_CINNABAR_GYM_QUIZ_2
# 327 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 328 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 329 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz2Incorrect::
# 330 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
# 331 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_not_defeated TRAINER_SUPER_NERD_AVERY, CinnabarIsland_Gym_EventScript_BattleAvery
# 332 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 333 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 334 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 335 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_BattleAvery::
# 336 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, CinnabarIsland_Gym_EventScript_AveryApproachLeft
# 337 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, CinnabarIsland_Gym_EventScript_AveryApproachRight
# 338 "data/maps/CinnabarIsland_Gym/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 339 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_AveryIntro
# 340 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_no_intro TRAINER_SUPER_NERD_AVERY, CinnabarIsland_Gym_Text_AveryDefeat
# 341 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_2, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 342 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz2Complete
# 343 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 344 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 345 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 346 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_AveryApproachLeft::
# 347 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Gym_Movement_PlayerFaceAvery
# 348 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_AVERY, CinnabarIsland_Gym_Movement_AveryApproachLeft
# 349 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 350 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 351 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 352 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_AveryApproachRight::
# 353 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, CinnabarIsland_Gym_Movement_PlayerFaceAvery
# 354 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_AVERY, CinnabarIsland_Gym_Movement_AveryApproachRight
# 355 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 356 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 357 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 358 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_AveryApproachLeft::
# 359 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_up
# 360 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_up
# 361 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 362 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 363 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 364 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_AveryApproachRight::
# 365 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_up
# 366 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_up
# 367 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_in_place_faster_left
# 368 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 369 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 370 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_PlayerFaceAvery::
# 371 "data/maps/CinnabarIsland_Gym/scripts.pory"
	delay_16
# 372 "data/maps/CinnabarIsland_Gym/scripts.pory"
	delay_16
# 373 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_in_place_faster_right
# 374 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 375 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 376 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz3Left::
# 377 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 378 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 0
# 379 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz3
# 380 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 381 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 382 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz3Right::
# 383 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 384 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 1
# 385 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz3
# 386 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 387 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 388 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz3::
# 389 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
# 390 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_QuizQuestion3, MSGBOX_YESNO
# 391 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, YES, CinnabarIsland_Gym_EventScript_Quiz3Incorrect
# 392 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_Gym_EventScript_Quiz3Correct
# 393 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 394 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 395 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz3Correct::
# 396 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
# 397 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 398 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz3Complete
# 399 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 400 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 401 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 402 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz3Complete::
# 403 "data/maps/CinnabarIsland_Gym/scripts.pory"
	playse SE_UNLOCK
# 404 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitse
# 405 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor3
# 406 "data/maps/CinnabarIsland_Gym/scripts.pory"
	special DrawWholeMapView
# 407 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setflag FLAG_CINNABAR_GYM_QUIZ_3
# 408 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 409 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 410 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz3Incorrect::
# 411 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
# 412 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_not_defeated TRAINER_BURGLAR_RAMON, CinnabarIsland_Gym_EventScript_BattleRamon
# 413 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 414 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 415 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 416 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_BattleRamon::
# 417 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, CinnabarIsland_Gym_EventScript_RamonApproachLeft
# 418 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, CinnabarIsland_Gym_EventScript_RamonApproachRight
# 419 "data/maps/CinnabarIsland_Gym/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 420 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_RamonIntro
# 421 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_no_intro TRAINER_BURGLAR_RAMON, CinnabarIsland_Gym_Text_RamonDefeat
# 422 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_3, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 423 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz3Complete
# 424 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 425 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 426 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 427 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_RamonApproachLeft::
# 428 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 429 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_RAMON, CinnabarIsland_Gym_Movement_RamonApproachLeft
# 430 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 431 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 432 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 433 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_RamonApproachRight::
# 434 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 435 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_RAMON, CinnabarIsland_Gym_Movement_RamonApproachRight
# 436 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 437 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 438 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 439 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_RamonApproachLeft::
# 440 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 441 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 442 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 443 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 444 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_RamonApproachRight::
# 445 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 446 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 447 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 448 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz4Left::
# 449 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 450 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 0
# 451 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz4
# 452 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 453 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 454 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz4Right::
# 455 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 456 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 1
# 457 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz4
# 458 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 459 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 460 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz4::
# 461 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
# 462 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_QuizQuestion4, MSGBOX_YESNO
# 463 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, YES, CinnabarIsland_Gym_EventScript_Quiz4Incorrect
# 464 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_Gym_EventScript_Quiz4Correct
# 465 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 466 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 467 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz4Correct::
# 468 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
# 469 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 470 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz4Complete
# 471 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 472 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 473 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 474 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz4Complete::
# 475 "data/maps/CinnabarIsland_Gym/scripts.pory"
	playse SE_UNLOCK
# 476 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitse
# 477 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor4
# 478 "data/maps/CinnabarIsland_Gym/scripts.pory"
	special DrawWholeMapView
# 479 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setflag FLAG_CINNABAR_GYM_QUIZ_4
# 480 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 481 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 482 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz4Incorrect::
# 483 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
# 484 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_not_defeated TRAINER_SUPER_NERD_DEREK, CinnabarIsland_Gym_EventScript_BattleDerek
# 485 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 486 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 487 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 488 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_BattleDerek::
# 489 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, CinnabarIsland_Gym_EventScript_DerekApproachLeft
# 490 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, CinnabarIsland_Gym_EventScript_DerekApproachRight
# 491 "data/maps/CinnabarIsland_Gym/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 492 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_DerekIntro
# 493 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_no_intro TRAINER_SUPER_NERD_DEREK, CinnabarIsland_Gym_Text_DerekDefeat
# 494 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_4, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 495 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz4Complete
# 496 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 497 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 498 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 499 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DerekApproachLeft::
# 500 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 501 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_DEREK, CinnabarIsland_Gym_Movement_DerekApproachLeft
# 502 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 503 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 504 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 505 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DerekApproachRight::
# 506 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 507 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_DEREK, CinnabarIsland_Gym_Movement_DerekApproachRight
# 508 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 509 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 510 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 511 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_DerekApproachLeft::
# 512 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 513 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 514 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 515 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 516 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_DerekApproachRight::
# 517 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 518 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 519 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 520 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz5Left::
# 521 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 522 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 0
# 523 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz5
# 524 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 525 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 526 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz5Right::
# 527 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 528 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 1
# 529 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz5
# 530 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 531 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 532 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz5::
# 533 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
# 534 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_QuizQuestion5, MSGBOX_YESNO
# 535 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, YES, CinnabarIsland_Gym_EventScript_Quiz5Correct
# 536 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_Gym_EventScript_Quiz5Incorrect
# 537 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 538 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 539 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz5Correct::
# 540 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
# 541 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 542 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz5Complete
# 543 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 544 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 545 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 546 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz5Complete::
# 547 "data/maps/CinnabarIsland_Gym/scripts.pory"
	playse SE_UNLOCK
# 548 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitse
# 549 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor5
# 550 "data/maps/CinnabarIsland_Gym/scripts.pory"
	special DrawWholeMapView
# 551 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setflag FLAG_CINNABAR_GYM_QUIZ_5
# 552 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 553 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 554 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz5Incorrect::
# 555 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
# 556 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_not_defeated TRAINER_BURGLAR_DUSTY, CinnabarIsland_Gym_EventScript_BattleDusty
# 557 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 558 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 559 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 560 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_BattleDusty::
# 561 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, CinnabarIsland_Gym_EventScript_DustyApproachLeft
# 562 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, CinnabarIsland_Gym_EventScript_DustyApproachRight
# 563 "data/maps/CinnabarIsland_Gym/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 564 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_DustyIntro
# 565 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_no_intro TRAINER_BURGLAR_DUSTY, CinnabarIsland_Gym_Text_DustyDefeat
# 566 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_5, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 567 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz5Complete
# 568 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 569 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 570 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 571 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DustyApproachLeft::
# 572 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 573 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_DUSTY, CinnabarIsland_Gym_Movement_DustyApproachLeft
# 574 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 575 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 576 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 577 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_DustyApproachRight::
# 578 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 579 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_DUSTY, CinnabarIsland_Gym_Movement_DustyApproachRight
# 580 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 581 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 582 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 583 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_DustyApproachLeft::
# 584 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 585 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 586 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 587 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 588 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_DustyApproachRight::
# 589 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 590 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 591 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 592 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz6Left::
# 593 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 594 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 0
# 595 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz6
# 596 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 597 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 598 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz6Right::
# 599 "data/maps/CinnabarIsland_Gym/scripts.pory"
	lockall
# 600 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setvar VAR_TEMP_1, 1
# 601 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto CinnabarIsland_Gym_EventScript_Quiz6
# 602 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 603 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 604 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz6::
# 605 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_PokemonQuizRules
# 606 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_QuizQuestion6, MSGBOX_YESNO
# 607 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, YES, CinnabarIsland_Gym_EventScript_Quiz6Incorrect
# 608 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_eq VAR_RESULT, NO, CinnabarIsland_Gym_EventScript_Quiz6Correct
# 609 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 610 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 611 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz6Correct::
# 612 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_CorrectAnswer
# 613 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 614 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz6Complete
# 615 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 616 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 617 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 618 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz6Complete::
# 619 "data/maps/CinnabarIsland_Gym/scripts.pory"
	playse SE_UNLOCK
# 620 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitse
# 621 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_OpenDoor6
# 622 "data/maps/CinnabarIsland_Gym/scripts.pory"
	special DrawWholeMapView
# 623 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setflag FLAG_CINNABAR_GYM_QUIZ_6
# 624 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 625 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 626 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_Quiz6Incorrect::
# 627 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_IncorrectAnswer
# 628 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_not_defeated TRAINER_SUPER_NERD_ZAC, CinnabarIsland_Gym_EventScript_BattleZac
# 629 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 630 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 631 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 632 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_BattleZac::
# 633 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, CinnabarIsland_Gym_EventScript_ZacApproachLeft
# 634 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, CinnabarIsland_Gym_EventScript_ZacApproachRight
# 635 "data/maps/CinnabarIsland_Gym/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 636 "data/maps/CinnabarIsland_Gym/scripts.pory"
	msgbox CinnabarIsland_Gym_Text_ZacIntro
# 637 "data/maps/CinnabarIsland_Gym/scripts.pory"
	trainerbattle_no_intro TRAINER_SUPER_NERD_ZAC, CinnabarIsland_Gym_Text_ZacDefeat
# 638 "data/maps/CinnabarIsland_Gym/scripts.pory"
	goto_if_set FLAG_CINNABAR_GYM_QUIZ_6, CinnabarIsland_Gym_EventScript_DoorAlreadyOpen
# 639 "data/maps/CinnabarIsland_Gym/scripts.pory"
	call CinnabarIsland_Gym_EventScript_Quiz6Complete
# 640 "data/maps/CinnabarIsland_Gym/scripts.pory"
	releaseall
# 641 "data/maps/CinnabarIsland_Gym/scripts.pory"
	end
# 642 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 643 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_ZacApproachLeft::
# 644 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 645 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_ZAC, CinnabarIsland_Gym_Movement_ZacApproachLeft
# 646 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 647 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 648 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 649 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_ZacApproachRight::
# 650 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 651 "data/maps/CinnabarIsland_Gym/scripts.pory"
	applymovement LOCALID_ZAC, CinnabarIsland_Gym_Movement_ZacApproachRight
# 652 "data/maps/CinnabarIsland_Gym/scripts.pory"
	waitmovement 0
# 653 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 654 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 655 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_ZacApproachLeft::
# 656 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 657 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 658 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 659 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 660 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_Movement_ZacApproachRight::
# 661 "data/maps/CinnabarIsland_Gym/scripts.pory"
	walk_left
# 662 "data/maps/CinnabarIsland_Gym/scripts.pory"
	step_end
# 663 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 664 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_OpenDoor1::
# 665 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 26,  8, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
# 666 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 27,  8, METATILE_CinnabarGym_Floor_WallRightCorner, 0
# 667 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 26,  9, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
# 668 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 27,  9, METATILE_CinnabarGym_Floor_WallRightEdge, 0
# 669 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 26, 10, METATILE_CinnabarGym_Floor_ShadeFull, 0
# 670 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 27, 10, METATILE_CinnabarGym_Floor, 0
# 671 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 28, 10, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
# 672 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 673 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 674 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_OpenDoor2::
# 675 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 17,  8, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
# 676 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 18,  8, METATILE_CinnabarGym_Floor_WallRightCorner, 0
# 677 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 17,  9, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
# 678 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 18,  9, METATILE_CinnabarGym_Floor_WallRightEdge, 0
# 679 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 17, 10, METATILE_CinnabarGym_Floor_ShadeFull, 0
# 680 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 18, 10, METATILE_CinnabarGym_Floor, 0
# 681 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 19, 10, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
# 682 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 683 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 684 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_OpenDoor3::
# 685 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 17, 15, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
# 686 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 18, 15, METATILE_CinnabarGym_Floor_WallRightCorner, 0
# 687 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 17, 16, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
# 688 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 18, 16, METATILE_CinnabarGym_Floor_WallRightEdge, 0
# 689 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 17, 17, METATILE_CinnabarGym_Floor_ShadeFull, 0
# 690 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 18, 17, METATILE_CinnabarGym_Floor, 0
# 691 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 19, 17, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
# 692 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 693 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 694 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_OpenDoor4::
# 695 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 11, 21, METATILE_CinnabarGym_Wall_RetractedBarrier, 1
# 696 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 11, 22, METATILE_CinnabarGym_Floor_ShadeFull, 0
# 697 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile 11, 23, METATILE_CinnabarGym_Floor, 0
# 698 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 699 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 700 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_OpenDoor5::
# 701 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  5, 16, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
# 702 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  6, 16, METATILE_CinnabarGym_Floor_WallRightCorner, 0
# 703 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  5, 17, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
# 704 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  6, 17, METATILE_CinnabarGym_Floor_WallRightEdge, 0
# 705 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  5, 18, METATILE_CinnabarGym_Floor_ShadeFull, 0
# 706 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  6, 18, METATILE_CinnabarGym_Floor, 0
# 707 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  7, 18, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
# 708 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
# 709 "data/maps/CinnabarIsland_Gym/scripts.pory"

# 710 "data/maps/CinnabarIsland_Gym/scripts.pory"
CinnabarIsland_Gym_EventScript_OpenDoor6::
# 711 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  5,  8, METATILE_CinnabarGym_Floor_WallLeftCorner, 0
# 712 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  6,  8, METATILE_CinnabarGym_Floor_WallRightCorner, 0
# 713 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  5,  9, METATILE_CinnabarGym_Floor_WallLeftEdge, 0
# 714 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  6,  9, METATILE_CinnabarGym_Floor_WallRightEdge, 0
# 715 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  5, 10, METATILE_CinnabarGym_Floor_ShadeFull, 0
# 716 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  6, 10, METATILE_CinnabarGym_Floor, 0
# 717 "data/maps/CinnabarIsland_Gym/scripts.pory"
	setmetatile  7, 10, METATILE_CinnabarGym_Floor_ShadeDiagonal, 0
# 718 "data/maps/CinnabarIsland_Gym/scripts.pory"
	return
