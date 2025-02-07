# 1 "data/maps/SaffronCity_Dojo/scripts.pory"

# 2 "data/maps/SaffronCity_Dojo/scripts.pory"
.equ LOCALID_KARATE_MASTER, 5
# 3 "data/maps/SaffronCity_Dojo/scripts.pory"

# 4 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_MapScripts::
# 5 "data/maps/SaffronCity_Dojo/scripts.pory"
	.byte 0
# 6 "data/maps/SaffronCity_Dojo/scripts.pory"

# 7 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_TriggerMasterBattleLeft::
# 8 "data/maps/SaffronCity_Dojo/scripts.pory"
	lockall
# 9 "data/maps/SaffronCity_Dojo/scripts.pory"
	setvar VAR_MAP_SCENE_SAFFRON_CITY_DOJO, 1
# 10 "data/maps/SaffronCity_Dojo/scripts.pory"
	applymovement LOCALID_KARATE_MASTER, Common_Movement_WalkInPlaceFasterLeft
# 11 "data/maps/SaffronCity_Dojo/scripts.pory"
	waitmovement 0
# 12 "data/maps/SaffronCity_Dojo/scripts.pory"
	releaseall
# 13 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 14 "data/maps/SaffronCity_Dojo/scripts.pory"

# 15 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_TriggerMasterBattleRight::
# 16 "data/maps/SaffronCity_Dojo/scripts.pory"
	lockall
# 17 "data/maps/SaffronCity_Dojo/scripts.pory"
	setvar VAR_MAP_SCENE_SAFFRON_CITY_DOJO, 1
# 18 "data/maps/SaffronCity_Dojo/scripts.pory"
	applymovement LOCALID_KARATE_MASTER, Common_Movement_WalkInPlaceFasterRight
# 19 "data/maps/SaffronCity_Dojo/scripts.pory"
	waitmovement 0
# 20 "data/maps/SaffronCity_Dojo/scripts.pory"
	releaseall
# 21 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 22 "data/maps/SaffronCity_Dojo/scripts.pory"

# 23 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_HitmonleeBall::
# 24 "data/maps/SaffronCity_Dojo/scripts.pory"
	lock
# 25 "data/maps/SaffronCity_Dojo/scripts.pory"
	faceplayer
# 26 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_set FLAG_GOT_HITMON_FROM_DOJO, SaffronCity_Dojo_EventScript_AlreadyGotHitmon
# 27 "data/maps/SaffronCity_Dojo/scripts.pory"
	showmonpic SPECIES_HITMONLEE, 10, 3
# 28 "data/maps/SaffronCity_Dojo/scripts.pory"
	setvar VAR_TEMP_1, SPECIES_HITMONLEE
# 29 "data/maps/SaffronCity_Dojo/scripts.pory"
	applymovement LOCALID_KARATE_MASTER, Common_Movement_WalkInPlaceFasterUp
# 30 "data/maps/SaffronCity_Dojo/scripts.pory"
	waitmovement 0
# 31 "data/maps/SaffronCity_Dojo/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 32 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_YouWantHitmonlee, MSGBOX_YESNO
# 33 "data/maps/SaffronCity_Dojo/scripts.pory"
	call EventScript_RestorePrevTextColor
# 34 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_eq VAR_RESULT, YES, SaffronCity_Dojo_EventScript_GiveHitmon
# 35 "data/maps/SaffronCity_Dojo/scripts.pory"
	hidemonpic
# 36 "data/maps/SaffronCity_Dojo/scripts.pory"
	release
# 37 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 38 "data/maps/SaffronCity_Dojo/scripts.pory"

# 39 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_AlreadyGotHitmon::
# 40 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_BetterNotGetGreedy
# 41 "data/maps/SaffronCity_Dojo/scripts.pory"
	release
# 42 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 43 "data/maps/SaffronCity_Dojo/scripts.pory"

# 44 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_HitmonchanBall::
# 45 "data/maps/SaffronCity_Dojo/scripts.pory"
	lock
# 46 "data/maps/SaffronCity_Dojo/scripts.pory"
	faceplayer
# 47 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_set FLAG_GOT_HITMON_FROM_DOJO, SaffronCity_Dojo_EventScript_AlreadyGotHitmon
# 48 "data/maps/SaffronCity_Dojo/scripts.pory"
	showmonpic SPECIES_HITMONCHAN, 10, 3
# 49 "data/maps/SaffronCity_Dojo/scripts.pory"
	setvar VAR_TEMP_1, SPECIES_HITMONCHAN
# 50 "data/maps/SaffronCity_Dojo/scripts.pory"
	applymovement LOCALID_KARATE_MASTER, Common_Movement_WalkInPlaceFasterUp
# 51 "data/maps/SaffronCity_Dojo/scripts.pory"
	waitmovement 0
# 52 "data/maps/SaffronCity_Dojo/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 53 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_YouWantHitmonchan, MSGBOX_YESNO
# 54 "data/maps/SaffronCity_Dojo/scripts.pory"
	call EventScript_RestorePrevTextColor
# 55 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_eq VAR_RESULT, YES, SaffronCity_Dojo_EventScript_GiveHitmon
# 56 "data/maps/SaffronCity_Dojo/scripts.pory"
	hidemonpic
# 57 "data/maps/SaffronCity_Dojo/scripts.pory"
	release
# 58 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 59 "data/maps/SaffronCity_Dojo/scripts.pory"

# 60 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_GiveHitmon::
# 61 "data/maps/SaffronCity_Dojo/scripts.pory"
	hidemonpic
# 62 "data/maps/SaffronCity_Dojo/scripts.pory"
	givemon VAR_TEMP_1, 25
# 63 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_eq VAR_RESULT, 0, SaffronCity_Dojo_EventScript_ReceivedHitmonParty
# 64 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_eq VAR_RESULT, 1, SaffronCity_Dojo_EventScript_ReceivedHitmonPC
# 65 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_eq VAR_RESULT, 2, EventScript_NoMoreRoomForPokemon
# 66 "data/maps/SaffronCity_Dojo/scripts.pory"
	release
# 67 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 68 "data/maps/SaffronCity_Dojo/scripts.pory"

# 69 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_ReceivedHitmonParty::
# 70 "data/maps/SaffronCity_Dojo/scripts.pory"
	removeobject VAR_LAST_TALKED
# 71 "data/maps/SaffronCity_Dojo/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_TEMP_1
# 72 "data/maps/SaffronCity_Dojo/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 73 "data/maps/SaffronCity_Dojo/scripts.pory"
	message SaffronCity_Dojo_Text_ReceivedMonFromKarateMaster
# 74 "data/maps/SaffronCity_Dojo/scripts.pory"
	waitmessage
# 75 "data/maps/SaffronCity_Dojo/scripts.pory"
	waitfanfare
# 76 "data/maps/SaffronCity_Dojo/scripts.pory"
	setflag FLAG_GOT_HITMON_FROM_DOJO
# 77 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
# 78 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_eq VAR_RESULT, NO, SaffronCity_Dojo_EventScript_EndGiveMon
# 79 "data/maps/SaffronCity_Dojo/scripts.pory"
	call EventScript_GetGiftMonPartySlot
# 80 "data/maps/SaffronCity_Dojo/scripts.pory"
	call EventScript_ChangePokemonNickname
# 81 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto SaffronCity_Dojo_EventScript_EndGiveMon
# 82 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 83 "data/maps/SaffronCity_Dojo/scripts.pory"

# 84 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_ReceivedHitmonPC::
# 85 "data/maps/SaffronCity_Dojo/scripts.pory"
	removeobject VAR_LAST_TALKED
# 86 "data/maps/SaffronCity_Dojo/scripts.pory"
	bufferspeciesname STR_VAR_1, VAR_TEMP_1
# 87 "data/maps/SaffronCity_Dojo/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 88 "data/maps/SaffronCity_Dojo/scripts.pory"
	message SaffronCity_Dojo_Text_ReceivedMonFromKarateMaster
# 89 "data/maps/SaffronCity_Dojo/scripts.pory"
	waitmessage
# 90 "data/maps/SaffronCity_Dojo/scripts.pory"
	waitfanfare
# 91 "data/maps/SaffronCity_Dojo/scripts.pory"
	setflag FLAG_GOT_HITMON_FROM_DOJO
# 92 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
# 93 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_eq VAR_RESULT, NO, SaffronCity_Dojo_EventScript_TransferredHitmonToPC
# 94 "data/maps/SaffronCity_Dojo/scripts.pory"
	call EventScript_NameReceivedBoxMon
# 95 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto SaffronCity_Dojo_EventScript_TransferredHitmonToPC
# 96 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 97 "data/maps/SaffronCity_Dojo/scripts.pory"

# 98 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_TransferredHitmonToPC::
# 99 "data/maps/SaffronCity_Dojo/scripts.pory"
	call EventScript_TransferredToPC
# 100 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto SaffronCity_Dojo_EventScript_EndGiveMon
# 101 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 102 "data/maps/SaffronCity_Dojo/scripts.pory"

# 103 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_EndGiveMon::
# 104 "data/maps/SaffronCity_Dojo/scripts.pory"
	release
# 105 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 106 "data/maps/SaffronCity_Dojo/scripts.pory"

# 107 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_Statue::
# 108 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_FightingDojo, MSGBOX_SIGN
# 109 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 110 "data/maps/SaffronCity_Dojo/scripts.pory"

# 111 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_LeftScroll::
# 112 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_EnemiesOnEverySide, MSGBOX_SIGN
# 113 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 114 "data/maps/SaffronCity_Dojo/scripts.pory"

# 115 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_RightScroll::
# 116 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_GoesAroundComesAround, MSGBOX_SIGN
# 117 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 118 "data/maps/SaffronCity_Dojo/scripts.pory"

# 119 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_Hitoshi::
# 120 "data/maps/SaffronCity_Dojo/scripts.pory"
	trainerbattle_single TRAINER_BLACK_BELT_HITOSHI, SaffronCity_Dojo_Text_HitoshiIntro, SaffronCity_Dojo_Text_HitoshiDefeat
# 121 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_HitoshiPostBattle, MSGBOX_AUTOCLOSE
# 122 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 123 "data/maps/SaffronCity_Dojo/scripts.pory"

# 124 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_Hideki::
# 125 "data/maps/SaffronCity_Dojo/scripts.pory"
	trainerbattle_single TRAINER_BLACK_BELT_HIDEKI, SaffronCity_Dojo_Text_HidekiIntro, SaffronCity_Dojo_Text_HidekiDefeat
# 126 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_HidekiPostBattle, MSGBOX_AUTOCLOSE
# 127 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 128 "data/maps/SaffronCity_Dojo/scripts.pory"

# 129 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_Aaron::
# 130 "data/maps/SaffronCity_Dojo/scripts.pory"
	trainerbattle_single TRAINER_BLACK_BELT_AARON, SaffronCity_Dojo_Text_AaronIntro, SaffronCity_Dojo_Text_AaronDefeat
# 131 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_AaronPostBattle, MSGBOX_AUTOCLOSE
# 132 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 133 "data/maps/SaffronCity_Dojo/scripts.pory"

# 134 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_Mike::
# 135 "data/maps/SaffronCity_Dojo/scripts.pory"
	trainerbattle_single TRAINER_BLACK_BELT_MIKE, SaffronCity_Dojo_Text_MikeIntro, SaffronCity_Dojo_Text_MikeDefeat
# 136 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_MikePostBattle, MSGBOX_AUTOCLOSE
# 137 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 138 "data/maps/SaffronCity_Dojo/scripts.pory"

# 139 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_MasterKoichi::
# 140 "data/maps/SaffronCity_Dojo/scripts.pory"
	trainerbattle_single TRAINER_BLACK_BELT_KOICHI, SaffronCity_Dojo_Text_MasterKoichiIntro, SaffronCity_Dojo_Text_MasterKoichiDefeat, SaffronCity_Dojo_EventScript_DefeatedMasterKoichi
# 141 "data/maps/SaffronCity_Dojo/scripts.pory"
	goto_if_set FLAG_GOT_HITMON_FROM_DOJO, SaffronCity_Dojo_EventScript_MasterKoichiAlreadyGotHitmon
# 142 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_ChoosePrizedFightingMon, MSGBOX_AUTOCLOSE
# 143 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 144 "data/maps/SaffronCity_Dojo/scripts.pory"

# 145 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_MasterKoichiAlreadyGotHitmon::
# 146 "data/maps/SaffronCity_Dojo/scripts.pory"
	msgbox SaffronCity_Dojo_Text_StayAndTrainWithUs
# 147 "data/maps/SaffronCity_Dojo/scripts.pory"
	release
# 148 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
# 149 "data/maps/SaffronCity_Dojo/scripts.pory"

# 150 "data/maps/SaffronCity_Dojo/scripts.pory"
SaffronCity_Dojo_EventScript_DefeatedMasterKoichi::
# 151 "data/maps/SaffronCity_Dojo/scripts.pory"
	setvar VAR_MAP_SCENE_SAFFRON_CITY_DOJO, 1
# 152 "data/maps/SaffronCity_Dojo/scripts.pory"
	release
# 153 "data/maps/SaffronCity_Dojo/scripts.pory"
	end
