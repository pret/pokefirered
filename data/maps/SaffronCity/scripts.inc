# 1 "data/maps/SaffronCity/scripts.pory"

# 2 "data/maps/SaffronCity/scripts.pory"
.set LOCALID_DOOR_GUARD_GRUNT, 6
# 3 "data/maps/SaffronCity/scripts.pory"

# 4 "data/maps/SaffronCity/scripts.pory"
SaffronCity_MapScripts::
# 5 "data/maps/SaffronCity/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SaffronCity_OnTransition
# 6 "data/maps/SaffronCity/scripts.pory"
	.byte 0
# 7 "data/maps/SaffronCity/scripts.pory"

# 8 "data/maps/SaffronCity/scripts.pory"
SaffronCity_OnTransition::
# 9 "data/maps/SaffronCity/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_SAFFRON_CITY
# 10 "data/maps/SaffronCity/scripts.pory"
	call_if_unset FLAG_RESCUED_MR_FUJI, SaffronCity_EventScript_MoveDoorGuardGrunt
# 11 "data/maps/SaffronCity/scripts.pory"
	end
# 12 "data/maps/SaffronCity/scripts.pory"

# 13 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_MoveDoorGuardGrunt::
# 14 "data/maps/SaffronCity/scripts.pory"
	setobjectxyperm LOCALID_DOOR_GUARD_GRUNT, 33, 31
# 15 "data/maps/SaffronCity/scripts.pory"
	return
# 16 "data/maps/SaffronCity/scripts.pory"

# 17 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_RocketGrunt1::
# 18 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_WhatDoYouWantGetLost, MSGBOX_NPC
# 19 "data/maps/SaffronCity/scripts.pory"
	end
# 20 "data/maps/SaffronCity/scripts.pory"

# 21 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_RocketGrunt2::
# 22 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_BossTakeTownForTeamRocket, MSGBOX_NPC
# 23 "data/maps/SaffronCity/scripts.pory"
	end
# 24 "data/maps/SaffronCity/scripts.pory"

# 25 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_RocketGrunt3::
# 26 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_DontGetDefiantOrIllHurtYou, MSGBOX_NPC
# 27 "data/maps/SaffronCity/scripts.pory"
	end
# 28 "data/maps/SaffronCity/scripts.pory"

# 29 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_RocketGrunt4::
# 30 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_SaffronBelongsToTeamRocket, MSGBOX_NPC
# 31 "data/maps/SaffronCity/scripts.pory"
	end
# 32 "data/maps/SaffronCity/scripts.pory"

# 33 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_RocketGrunt5::
# 34 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_CriminalLifeMakesMeFeelAlive, MSGBOX_NPC
# 35 "data/maps/SaffronCity/scripts.pory"
	end
# 36 "data/maps/SaffronCity/scripts.pory"

# 37 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_RocketGrunt6::
# 38 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_WatchWhereYoureWalking, MSGBOX_NPC
# 39 "data/maps/SaffronCity/scripts.pory"
	end
# 40 "data/maps/SaffronCity/scripts.pory"

# 41 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_RocketGrunt7::
# 42 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_WeCanExploitMonsAroundWorld, MSGBOX_NPC
# 43 "data/maps/SaffronCity/scripts.pory"
	end
# 44 "data/maps/SaffronCity/scripts.pory"

# 45 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_DoorGuardGrunt::
# 46 "data/maps/SaffronCity/scripts.pory"
	lock
# 47 "data/maps/SaffronCity/scripts.pory"
	goto_if_set FLAG_RESCUED_MR_FUJI, SaffronCity_EventScript_DoorGuardAsleep
# 48 "data/maps/SaffronCity/scripts.pory"
	applymovement LOCALID_DOOR_GUARD_GRUNT, Common_Movement_FacePlayer
# 49 "data/maps/SaffronCity/scripts.pory"
	waitmovement 0
# 50 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_ImASecurityGuard
# 51 "data/maps/SaffronCity/scripts.pory"
	release
# 52 "data/maps/SaffronCity/scripts.pory"
	end
# 53 "data/maps/SaffronCity/scripts.pory"

# 54 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_DoorGuardAsleep::
# 55 "data/maps/SaffronCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 56 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_HesTakingASnooze
# 57 "data/maps/SaffronCity/scripts.pory"
	release
# 58 "data/maps/SaffronCity/scripts.pory"
	end
# 59 "data/maps/SaffronCity/scripts.pory"

# 60 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_WorkerM::
# 61 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_YouBeatTeamRocket, MSGBOX_NPC
# 62 "data/maps/SaffronCity/scripts.pory"
	end
# 63 "data/maps/SaffronCity/scripts.pory"

# 64 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_Youngster::
# 65 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_SafeToGoOutAgain, MSGBOX_NPC
# 66 "data/maps/SaffronCity/scripts.pory"
	end
# 67 "data/maps/SaffronCity/scripts.pory"

# 68 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_Lass::
# 69 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_PeopleComingBackToSaffron, MSGBOX_NPC
# 70 "data/maps/SaffronCity/scripts.pory"
	end
# 71 "data/maps/SaffronCity/scripts.pory"

# 72 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_Boy::
# 73 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_FlewHereOnPidgeot, MSGBOX_NPC
# 74 "data/maps/SaffronCity/scripts.pory"
	end
# 75 "data/maps/SaffronCity/scripts.pory"

# 76 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_Pidgeot::
# 77 "data/maps/SaffronCity/scripts.pory"
	lock
# 78 "data/maps/SaffronCity/scripts.pory"
	faceplayer
# 79 "data/maps/SaffronCity/scripts.pory"
	waitse
# 80 "data/maps/SaffronCity/scripts.pory"
	playmoncry SPECIES_PIDGEOT, CRY_MODE_NORMAL
# 81 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_Pidgeot
# 82 "data/maps/SaffronCity/scripts.pory"
	waitmoncry
# 83 "data/maps/SaffronCity/scripts.pory"
	release
# 84 "data/maps/SaffronCity/scripts.pory"
	end
# 85 "data/maps/SaffronCity/scripts.pory"

# 86 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_Man::
# 87 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_SawRocketBossEscaping, MSGBOX_NPC
# 88 "data/maps/SaffronCity/scripts.pory"
	end
# 89 "data/maps/SaffronCity/scripts.pory"

# 90 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_CitySign::
# 91 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_CitySign, MSGBOX_SIGN
# 92 "data/maps/SaffronCity/scripts.pory"
	end
# 93 "data/maps/SaffronCity/scripts.pory"

# 94 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_DojoSign::
# 95 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_FightingDojo, MSGBOX_SIGN
# 96 "data/maps/SaffronCity/scripts.pory"
	end
# 97 "data/maps/SaffronCity/scripts.pory"

# 98 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_GymSign::
# 99 "data/maps/SaffronCity/scripts.pory"
	lockall
# 100 "data/maps/SaffronCity/scripts.pory"
	famechecker FAMECHECKER_SABRINA, 0
# 101 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_GymSign
# 102 "data/maps/SaffronCity/scripts.pory"
	releaseall
# 103 "data/maps/SaffronCity/scripts.pory"
	end
# 104 "data/maps/SaffronCity/scripts.pory"

# 105 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_TrainerTips1::
# 106 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_FullHealCuresStatus, MSGBOX_SIGN
# 107 "data/maps/SaffronCity/scripts.pory"
	end
# 108 "data/maps/SaffronCity/scripts.pory"

# 109 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_TrainerTips2::
# 110 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_GreatBallImprovedCatchRate, MSGBOX_SIGN
# 111 "data/maps/SaffronCity/scripts.pory"
	end
# 112 "data/maps/SaffronCity/scripts.pory"

# 113 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_SilphCoSign::
# 114 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_SilphCoSign, MSGBOX_SIGN
# 115 "data/maps/SaffronCity/scripts.pory"
	end
# 116 "data/maps/SaffronCity/scripts.pory"

# 117 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_MrPsychicsHouseSign::
# 118 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_MrPsychicsHouse, MSGBOX_SIGN
# 119 "data/maps/SaffronCity/scripts.pory"
	end
# 120 "data/maps/SaffronCity/scripts.pory"

# 121 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_SilphProductSign::
# 122 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_SilphsLatestProduct, MSGBOX_SIGN
# 123 "data/maps/SaffronCity/scripts.pory"
	end
# 124 "data/maps/SaffronCity/scripts.pory"

# 125 "data/maps/SaffronCity/scripts.pory"
SaffronCity_EventScript_TrainerFanClubSign::
# 126 "data/maps/SaffronCity/scripts.pory"
	msgbox SaffronCity_Text_TrainerFanClubSign, MSGBOX_SIGN
# 127 "data/maps/SaffronCity/scripts.pory"
	end
