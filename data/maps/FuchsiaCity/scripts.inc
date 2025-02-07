# 1 "data/maps/FuchsiaCity/scripts.pory"

# 2 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_MapScripts::
# 3 "data/maps/FuchsiaCity/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, FuchsiaCity_OnTransition
# 4 "data/maps/FuchsiaCity/scripts.pory"
	.byte 0
# 5 "data/maps/FuchsiaCity/scripts.pory"

# 6 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_OnTransition::
# 7 "data/maps/FuchsiaCity/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_FUCHSIA_CITY
# 8 "data/maps/FuchsiaCity/scripts.pory"
	call_if_set FLAG_GOT_DOME_FOSSIL, FuchsiaCity_EventScript_SetOmanyteGfx
# 9 "data/maps/FuchsiaCity/scripts.pory"
	call_if_unset FLAG_GOT_DOME_FOSSIL, FuchsiaCity_EventScript_SetKabutoGfx
# 10 "data/maps/FuchsiaCity/scripts.pory"
	end
# 11 "data/maps/FuchsiaCity/scripts.pory"

# 12 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_SetOmanyteGfx::
# 13 "data/maps/FuchsiaCity/scripts.pory"
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OMANYTE
# 14 "data/maps/FuchsiaCity/scripts.pory"
	return
# 15 "data/maps/FuchsiaCity/scripts.pory"

# 16 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_SetKabutoGfx::
# 17 "data/maps/FuchsiaCity/scripts.pory"
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_KABUTO
# 18 "data/maps/FuchsiaCity/scripts.pory"
	return
# 19 "data/maps/FuchsiaCity/scripts.pory"

# 20 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_LittleBoy::
# 21 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_DidYouTrySafariGame, MSGBOX_NPC
# 22 "data/maps/FuchsiaCity/scripts.pory"
	end
# 23 "data/maps/FuchsiaCity/scripts.pory"

# 24 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_OldMan::
# 25 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_SafariZoneZooInFront, MSGBOX_NPC
# 26 "data/maps/FuchsiaCity/scripts.pory"
	end
# 27 "data/maps/FuchsiaCity/scripts.pory"

# 28 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_Erik::
# 29 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_WheresSara, MSGBOX_NPC
# 30 "data/maps/FuchsiaCity/scripts.pory"
	end
# 31 "data/maps/FuchsiaCity/scripts.pory"

# 32 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_Youngster::
# 33 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_ItemBallInThere, MSGBOX_NPC
# 34 "data/maps/FuchsiaCity/scripts.pory"
	end
# 35 "data/maps/FuchsiaCity/scripts.pory"

# 36 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_Lass::
# 37 "data/maps/FuchsiaCity/scripts.pory"
	lock
# 38 "data/maps/FuchsiaCity/scripts.pory"
	faceplayer
# 39 "data/maps/FuchsiaCity/scripts.pory"
	famechecker FAMECHECKER_KOGA, 3
# 40 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_MyFatherIsGymLeader
# 41 "data/maps/FuchsiaCity/scripts.pory"
	release
# 42 "data/maps/FuchsiaCity/scripts.pory"
	end
# 43 "data/maps/FuchsiaCity/scripts.pory"

# 44 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_CitySign::
# 45 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_CitySign, MSGBOX_SIGN
# 46 "data/maps/FuchsiaCity/scripts.pory"
	end
# 47 "data/maps/FuchsiaCity/scripts.pory"

# 48 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_SafariZoneSign::
# 49 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_SafariZoneSign, MSGBOX_SIGN
# 50 "data/maps/FuchsiaCity/scripts.pory"
	end
# 51 "data/maps/FuchsiaCity/scripts.pory"

# 52 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_SafariGameSign::
# 53 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_SafariGameSign, MSGBOX_SIGN
# 54 "data/maps/FuchsiaCity/scripts.pory"
	end
# 55 "data/maps/FuchsiaCity/scripts.pory"

# 56 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_WardensHomeSign::
# 57 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_WardensHomeSign, MSGBOX_SIGN
# 58 "data/maps/FuchsiaCity/scripts.pory"
	end
# 59 "data/maps/FuchsiaCity/scripts.pory"

# 60 "data/maps/FuchsiaCity/scripts.pory"
@ Unused
# 61 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_SafariZoneOfficeSign::
# 62 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_SafariZoneOfficeSign, MSGBOX_SIGN
# 63 "data/maps/FuchsiaCity/scripts.pory"
	end
# 64 "data/maps/FuchsiaCity/scripts.pory"

# 65 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_GymSign::
# 66 "data/maps/FuchsiaCity/scripts.pory"
	lockall
# 67 "data/maps/FuchsiaCity/scripts.pory"
	famechecker FAMECHECKER_KOGA, 0
# 68 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_GymSign
# 69 "data/maps/FuchsiaCity/scripts.pory"
	releaseall
# 70 "data/maps/FuchsiaCity/scripts.pory"
	end
# 71 "data/maps/FuchsiaCity/scripts.pory"

# 72 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_ChanseySign::
# 73 "data/maps/FuchsiaCity/scripts.pory"
	lockall
# 74 "data/maps/FuchsiaCity/scripts.pory"
	setvar VAR_0x8004, SPECIES_CHANSEY
# 75 "data/maps/FuchsiaCity/scripts.pory"
	special SetSeenMon
# 76 "data/maps/FuchsiaCity/scripts.pory"
	showmonpic SPECIES_CHANSEY, 10, 3
# 77 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_ChanseySign
# 78 "data/maps/FuchsiaCity/scripts.pory"
	hidemonpic
# 79 "data/maps/FuchsiaCity/scripts.pory"
	releaseall
# 80 "data/maps/FuchsiaCity/scripts.pory"
	end
# 81 "data/maps/FuchsiaCity/scripts.pory"

# 82 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_VoltorbSign::
# 83 "data/maps/FuchsiaCity/scripts.pory"
	lockall
# 84 "data/maps/FuchsiaCity/scripts.pory"
	setvar VAR_0x8004, SPECIES_VOLTORB
# 85 "data/maps/FuchsiaCity/scripts.pory"
	special SetSeenMon
# 86 "data/maps/FuchsiaCity/scripts.pory"
	showmonpic SPECIES_VOLTORB, 10, 3
# 87 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_VoltorbSign
# 88 "data/maps/FuchsiaCity/scripts.pory"
	hidemonpic
# 89 "data/maps/FuchsiaCity/scripts.pory"
	releaseall
# 90 "data/maps/FuchsiaCity/scripts.pory"
	end
# 91 "data/maps/FuchsiaCity/scripts.pory"

# 92 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_KangaskhanSign::
# 93 "data/maps/FuchsiaCity/scripts.pory"
	lockall
# 94 "data/maps/FuchsiaCity/scripts.pory"
	setvar VAR_0x8004, SPECIES_KANGASKHAN
# 95 "data/maps/FuchsiaCity/scripts.pory"
	special SetSeenMon
# 96 "data/maps/FuchsiaCity/scripts.pory"
	showmonpic SPECIES_KANGASKHAN, 10, 3
# 97 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_KangaskhanSign
# 98 "data/maps/FuchsiaCity/scripts.pory"
	hidemonpic
# 99 "data/maps/FuchsiaCity/scripts.pory"
	releaseall
# 100 "data/maps/FuchsiaCity/scripts.pory"
	end
# 101 "data/maps/FuchsiaCity/scripts.pory"

# 102 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_SlowpokeSign::
# 103 "data/maps/FuchsiaCity/scripts.pory"
	lockall
# 104 "data/maps/FuchsiaCity/scripts.pory"
	setvar VAR_0x8004, SPECIES_SLOWPOKE
# 105 "data/maps/FuchsiaCity/scripts.pory"
	special SetSeenMon
# 106 "data/maps/FuchsiaCity/scripts.pory"
	showmonpic SPECIES_SLOWPOKE, 10, 3
# 107 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_SlowpokeSign
# 108 "data/maps/FuchsiaCity/scripts.pory"
	hidemonpic
# 109 "data/maps/FuchsiaCity/scripts.pory"
	releaseall
# 110 "data/maps/FuchsiaCity/scripts.pory"
	end
# 111 "data/maps/FuchsiaCity/scripts.pory"

# 112 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_LaprasSign::
# 113 "data/maps/FuchsiaCity/scripts.pory"
	lockall
# 114 "data/maps/FuchsiaCity/scripts.pory"
	setvar VAR_0x8004, SPECIES_LAPRAS
# 115 "data/maps/FuchsiaCity/scripts.pory"
	special SetSeenMon
# 116 "data/maps/FuchsiaCity/scripts.pory"
	showmonpic SPECIES_LAPRAS, 10, 3
# 117 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_LaprasSign
# 118 "data/maps/FuchsiaCity/scripts.pory"
	hidemonpic
# 119 "data/maps/FuchsiaCity/scripts.pory"
	releaseall
# 120 "data/maps/FuchsiaCity/scripts.pory"
	end
# 121 "data/maps/FuchsiaCity/scripts.pory"

# 122 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_FossilMonSign::
# 123 "data/maps/FuchsiaCity/scripts.pory"
	lockall
# 124 "data/maps/FuchsiaCity/scripts.pory"
	goto_if_set FLAG_GOT_DOME_FOSSIL, FuchsiaCity_EventScript_OmanyteSign
# 125 "data/maps/FuchsiaCity/scripts.pory"
	setvar VAR_0x8004, SPECIES_KABUTO
# 126 "data/maps/FuchsiaCity/scripts.pory"
	special SetSeenMon
# 127 "data/maps/FuchsiaCity/scripts.pory"
	showmonpic SPECIES_KABUTO, 10, 3
# 128 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_KabutoSign
# 129 "data/maps/FuchsiaCity/scripts.pory"
	hidemonpic
# 130 "data/maps/FuchsiaCity/scripts.pory"
	releaseall
# 131 "data/maps/FuchsiaCity/scripts.pory"
	end
# 132 "data/maps/FuchsiaCity/scripts.pory"

# 133 "data/maps/FuchsiaCity/scripts.pory"
FuchsiaCity_EventScript_OmanyteSign::
# 134 "data/maps/FuchsiaCity/scripts.pory"
	setvar VAR_0x8004, SPECIES_OMANYTE
# 135 "data/maps/FuchsiaCity/scripts.pory"
	special SetSeenMon
# 136 "data/maps/FuchsiaCity/scripts.pory"
	showmonpic SPECIES_OMANYTE, 10, 3
# 137 "data/maps/FuchsiaCity/scripts.pory"
	msgbox FuchsiaCity_Text_OmanyteSign
# 138 "data/maps/FuchsiaCity/scripts.pory"
	hidemonpic
# 139 "data/maps/FuchsiaCity/scripts.pory"
	releaseall
# 140 "data/maps/FuchsiaCity/scripts.pory"
	end
