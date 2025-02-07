# 1 "data/maps/MtMoon_B2F/scripts.pory"

# 2 "data/maps/MtMoon_B2F/scripts.pory"
.equ LOCALID_DOME_FOSSIL,  1
# 3 "data/maps/MtMoon_B2F/scripts.pory"
.equ LOCALID_HELIX_FOSSIL, 2
# 4 "data/maps/MtMoon_B2F/scripts.pory"
.equ LOCALID_MIGUEL,       3
# 5 "data/maps/MtMoon_B2F/scripts.pory"

# 6 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_MapScripts::
# 7 "data/maps/MtMoon_B2F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, MtMoon_B2F_OnTransition
# 8 "data/maps/MtMoon_B2F/scripts.pory"
	.byte 0
# 9 "data/maps/MtMoon_B2F/scripts.pory"

# 10 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_OnTransition::
# 11 "data/maps/MtMoon_B2F/scripts.pory"
	call_if_unset FLAG_GOT_FOSSIL_FROM_MT_MOON, MtMoon_B2F_EventScript_ShowFossils
# 12 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 13 "data/maps/MtMoon_B2F/scripts.pory"

# 14 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_ShowFossils::
# 15 "data/maps/MtMoon_B2F/scripts.pory"
	clearflag FLAG_HIDE_DOME_FOSSIL
# 16 "data/maps/MtMoon_B2F/scripts.pory"
	clearflag FLAG_HIDE_HELIX_FOSSIL
# 17 "data/maps/MtMoon_B2F/scripts.pory"
	return
# 18 "data/maps/MtMoon_B2F/scripts.pory"

# 19 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_MiguelTrigger::
# 20 "data/maps/MtMoon_B2F/scripts.pory"
	lockall
# 21 "data/maps/MtMoon_B2F/scripts.pory"
	applymovement LOCALID_MIGUEL, Common_Movement_WalkInPlaceFasterRight
# 22 "data/maps/MtMoon_B2F/scripts.pory"
	waitmovement 0
# 23 "data/maps/MtMoon_B2F/scripts.pory"
	call MtMoon_B2F_EventScript_BattleMiguel
# 24 "data/maps/MtMoon_B2F/scripts.pory"
	releaseall
# 25 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 26 "data/maps/MtMoon_B2F/scripts.pory"

# 27 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_Miguel::
# 28 "data/maps/MtMoon_B2F/scripts.pory"
	lock
# 29 "data/maps/MtMoon_B2F/scripts.pory"
	faceplayer
# 30 "data/maps/MtMoon_B2F/scripts.pory"
	goto_if_set FLAG_GOT_FOSSIL_FROM_MT_MOON, MtMoon_B2F_EventScript_MiguelFossilPicked
# 31 "data/maps/MtMoon_B2F/scripts.pory"
	goto_if_defeated TRAINER_SUPER_NERD_MIGUEL, MtMoon_B2F_EventScript_MiguelGoPickFossil
# 32 "data/maps/MtMoon_B2F/scripts.pory"
	call MtMoon_B2F_EventScript_BattleMiguel
# 33 "data/maps/MtMoon_B2F/scripts.pory"
	release
# 34 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 35 "data/maps/MtMoon_B2F/scripts.pory"

# 36 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_BattleMiguel::
# 37 "data/maps/MtMoon_B2F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 38 "data/maps/MtMoon_B2F/scripts.pory"
	message MtMoon_B2F_Text_MiguelIntro
# 39 "data/maps/MtMoon_B2F/scripts.pory"
	waitmessage
# 40 "data/maps/MtMoon_B2F/scripts.pory"
	playbgm MUS_ENCOUNTER_GYM_LEADER, 0
# 41 "data/maps/MtMoon_B2F/scripts.pory"
	waitbuttonpress
# 42 "data/maps/MtMoon_B2F/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_MIGUEL
# 43 "data/maps/MtMoon_B2F/scripts.pory"
	trainerbattle_no_intro TRAINER_SUPER_NERD_MIGUEL, MtMoon_B2F_Text_MiguelDefeat
# 44 "data/maps/MtMoon_B2F/scripts.pory"
	setvar VAR_MAP_SCENE_MT_MOON_B2F, 1
# 45 "data/maps/MtMoon_B2F/scripts.pory"
	msgbox MtMoon_B2F_Text_WellEachTakeAFossil
# 46 "data/maps/MtMoon_B2F/scripts.pory"
	return
# 47 "data/maps/MtMoon_B2F/scripts.pory"

# 48 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_MiguelFossilPicked::
# 49 "data/maps/MtMoon_B2F/scripts.pory"
	msgbox MtMoon_B2F_Text_LabOnCinnabarRegeneratesFossils
# 50 "data/maps/MtMoon_B2F/scripts.pory"
	release
# 51 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 52 "data/maps/MtMoon_B2F/scripts.pory"

# 53 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_MiguelGoPickFossil::
# 54 "data/maps/MtMoon_B2F/scripts.pory"
	msgbox MtMoon_B2F_Text_WellEachTakeAFossil
# 55 "data/maps/MtMoon_B2F/scripts.pory"
	release
# 56 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 57 "data/maps/MtMoon_B2F/scripts.pory"

# 58 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_DomeFossil::
# 59 "data/maps/MtMoon_B2F/scripts.pory"
	lock
# 60 "data/maps/MtMoon_B2F/scripts.pory"
	faceplayer
# 61 "data/maps/MtMoon_B2F/scripts.pory"
	msgbox MtMoon_B2F_Text_YouWantDomeFossil, MSGBOX_YESNO
# 62 "data/maps/MtMoon_B2F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, MtMoon_B2F_EventScript_DontTakeFossil
# 63 "data/maps/MtMoon_B2F/scripts.pory"
	removeobject LOCALID_DOME_FOSSIL
# 64 "data/maps/MtMoon_B2F/scripts.pory"
	giveitem_msg MtMoon_B2F_Text_ObtainedDomeFossil, ITEM_DOME_FOSSIL, 1, MUS_OBTAIN_KEY_ITEM
# 65 "data/maps/MtMoon_B2F/scripts.pory"
	closemessage
# 66 "data/maps/MtMoon_B2F/scripts.pory"
	special QuestLog_CutRecording
# 67 "data/maps/MtMoon_B2F/scripts.pory"
	delay 10
# 68 "data/maps/MtMoon_B2F/scripts.pory"
	applymovement LOCALID_MIGUEL, MtMoon_B2F_Movement_MiguelToHelixFossil
# 69 "data/maps/MtMoon_B2F/scripts.pory"
	waitmovement 0
# 70 "data/maps/MtMoon_B2F/scripts.pory"
	copyobjectxytoperm LOCALID_MIGUEL
# 71 "data/maps/MtMoon_B2F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 72 "data/maps/MtMoon_B2F/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 73 "data/maps/MtMoon_B2F/scripts.pory"
	message MtMoon_B2F_Text_ThenThisFossilIsMine
# 74 "data/maps/MtMoon_B2F/scripts.pory"
	waitmessage
# 75 "data/maps/MtMoon_B2F/scripts.pory"
	waitfanfare
# 76 "data/maps/MtMoon_B2F/scripts.pory"
	removeobject LOCALID_HELIX_FOSSIL
# 77 "data/maps/MtMoon_B2F/scripts.pory"
	setflag FLAG_GOT_DOME_FOSSIL
# 78 "data/maps/MtMoon_B2F/scripts.pory"
	setflag FLAG_GOT_FOSSIL_FROM_MT_MOON
# 79 "data/maps/MtMoon_B2F/scripts.pory"
	release
# 80 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 81 "data/maps/MtMoon_B2F/scripts.pory"

# 82 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_Movement_MiguelToHelixFossil::
# 83 "data/maps/MtMoon_B2F/scripts.pory"
	walk_right
# 84 "data/maps/MtMoon_B2F/scripts.pory"
	walk_up
# 85 "data/maps/MtMoon_B2F/scripts.pory"
	walk_up
# 86 "data/maps/MtMoon_B2F/scripts.pory"
	walk_up
# 87 "data/maps/MtMoon_B2F/scripts.pory"
	step_end
# 88 "data/maps/MtMoon_B2F/scripts.pory"

# 89 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_HelixFossil::
# 90 "data/maps/MtMoon_B2F/scripts.pory"
	lock
# 91 "data/maps/MtMoon_B2F/scripts.pory"
	faceplayer
# 92 "data/maps/MtMoon_B2F/scripts.pory"
	msgbox MtMoon_B2F_Text_YouWantHelixFossil, MSGBOX_YESNO
# 93 "data/maps/MtMoon_B2F/scripts.pory"
	goto_if_eq VAR_RESULT, NO, MtMoon_B2F_EventScript_DontTakeFossil
# 94 "data/maps/MtMoon_B2F/scripts.pory"
	removeobject LOCALID_HELIX_FOSSIL
# 95 "data/maps/MtMoon_B2F/scripts.pory"
	giveitem_msg MtMoon_B2F_Text_ObtainedHelixFossil, ITEM_HELIX_FOSSIL, 1, MUS_OBTAIN_KEY_ITEM
# 96 "data/maps/MtMoon_B2F/scripts.pory"
	closemessage
# 97 "data/maps/MtMoon_B2F/scripts.pory"
	special QuestLog_CutRecording
# 98 "data/maps/MtMoon_B2F/scripts.pory"
	delay 10
# 99 "data/maps/MtMoon_B2F/scripts.pory"
	applymovement LOCALID_MIGUEL, MtMoon_B2F_Movement_MiguelToDomeFossil
# 100 "data/maps/MtMoon_B2F/scripts.pory"
	waitmovement 0
# 101 "data/maps/MtMoon_B2F/scripts.pory"
	copyobjectxytoperm LOCALID_MIGUEL
# 102 "data/maps/MtMoon_B2F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 103 "data/maps/MtMoon_B2F/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 104 "data/maps/MtMoon_B2F/scripts.pory"
	message MtMoon_B2F_Text_ThenThisFossilIsMine
# 105 "data/maps/MtMoon_B2F/scripts.pory"
	waitmessage
# 106 "data/maps/MtMoon_B2F/scripts.pory"
	waitfanfare
# 107 "data/maps/MtMoon_B2F/scripts.pory"
	removeobject LOCALID_DOME_FOSSIL
# 108 "data/maps/MtMoon_B2F/scripts.pory"
	setflag FLAG_GOT_HELIX_FOSSIL
# 109 "data/maps/MtMoon_B2F/scripts.pory"
	setflag FLAG_GOT_FOSSIL_FROM_MT_MOON
# 110 "data/maps/MtMoon_B2F/scripts.pory"
	release
# 111 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 112 "data/maps/MtMoon_B2F/scripts.pory"

# 113 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_DontTakeFossil::
# 114 "data/maps/MtMoon_B2F/scripts.pory"
	release
# 115 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 116 "data/maps/MtMoon_B2F/scripts.pory"

# 117 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_Movement_MiguelToDomeFossil::
# 118 "data/maps/MtMoon_B2F/scripts.pory"
	walk_up
# 119 "data/maps/MtMoon_B2F/scripts.pory"
	walk_up
# 120 "data/maps/MtMoon_B2F/scripts.pory"
	walk_up
# 121 "data/maps/MtMoon_B2F/scripts.pory"
	step_end
# 122 "data/maps/MtMoon_B2F/scripts.pory"

# 123 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_Grunt1::
# 124 "data/maps/MtMoon_B2F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT, MtMoon_B2F_Text_Grunt1Intro, MtMoon_B2F_Text_Grunt1Defeat
# 125 "data/maps/MtMoon_B2F/scripts.pory"
	msgbox MtMoon_B2F_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
# 126 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 127 "data/maps/MtMoon_B2F/scripts.pory"

# 128 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_Grunt2::
# 129 "data/maps/MtMoon_B2F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_2, MtMoon_B2F_Text_Grunt2Intro, MtMoon_B2F_Text_Grunt2Defeat
# 130 "data/maps/MtMoon_B2F/scripts.pory"
	msgbox MtMoon_B2F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 131 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 132 "data/maps/MtMoon_B2F/scripts.pory"

# 133 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_Grunt3::
# 134 "data/maps/MtMoon_B2F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_3, MtMoon_B2F_Text_Grunt3Intro, MtMoon_B2F_Text_Grunt3Defeat
# 135 "data/maps/MtMoon_B2F/scripts.pory"
	msgbox MtMoon_B2F_Text_Grunt3PostBattle, MSGBOX_AUTOCLOSE
# 136 "data/maps/MtMoon_B2F/scripts.pory"
	end
# 137 "data/maps/MtMoon_B2F/scripts.pory"

# 138 "data/maps/MtMoon_B2F/scripts.pory"
MtMoon_B2F_EventScript_Grunt4::
# 139 "data/maps/MtMoon_B2F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_4, MtMoon_B2F_Text_Grunt4Intro, MtMoon_B2F_Text_Grunt4Defeat
# 140 "data/maps/MtMoon_B2F/scripts.pory"
	msgbox MtMoon_B2F_Text_Grunt4PostBattle, MSGBOX_AUTOCLOSE
# 141 "data/maps/MtMoon_B2F/scripts.pory"
	end
