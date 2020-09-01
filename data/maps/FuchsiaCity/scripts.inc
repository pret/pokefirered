FuchsiaCity_MapScripts:: @ 8166D75
	map_script MAP_SCRIPT_ON_TRANSITION, FuchsiaCity_OnTransition
	.byte 0

FuchsiaCity_OnTransition:: @ 8166D7B
	setworldmapflag FLAG_WORLD_MAP_FUCHSIA_CITY
	call_if_set FLAG_GOT_DOME_FOSSIL, FuchsiaCity_EventScript_SetOmanyteGfx
	call_if_unset FLAG_GOT_DOME_FOSSIL, FuchsiaCity_EventScript_SetKabutoGfx
	end

FuchsiaCity_EventScript_SetOmanyteGfx:: @ 8166D91
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OMANYTE
	return

FuchsiaCity_EventScript_SetKabutoGfx:: @ 8166D97
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_KABUTO
	return

FuchsiaCity_EventScript_LittleBoy:: @ 8166D9D
	msgbox FuchsiaCity_Text_DidYouTrySafariGame, MSGBOX_NPC
	end

FuchsiaCity_EventScript_OldMan:: @ 8166DA6
	msgbox FuchsiaCity_Text_SafariZoneZooInFront, MSGBOX_NPC
	end

FuchsiaCity_EventScript_Erik:: @ 8166DAF
	msgbox FuchsiaCity_Text_WheresSara, MSGBOX_NPC
	end

FuchsiaCity_EventScript_Youngster:: @ 8166DB8
	msgbox FuchsiaCity_Text_ItemBallInThere, MSGBOX_NPC
	end

FuchsiaCity_EventScript_Lass:: @ 8166DC1
	lock
	faceplayer
	famechecker FAMECHECKER_KOGA, 3
	msgbox FuchsiaCity_Text_MyFatherIsGymLeader
	release
	end

FuchsiaCity_EventScript_CitySign:: @ 8166DDA
	msgbox FuchsiaCity_Text_CitySign, MSGBOX_SIGN
	end

FuchsiaCity_EventScript_SafariZoneSign:: @ 8166DE3
	msgbox FuchsiaCity_Text_SafariZoneSign, MSGBOX_SIGN
	end

FuchsiaCity_EventScript_SafariGameSign:: @ 8166DEC
	msgbox FuchsiaCity_Text_SafariGameSign, MSGBOX_SIGN
	end

FuchsiaCity_EventScript_WardensHomeSign:: @ 8166DF5
	msgbox FuchsiaCity_Text_WardensHomeSign, MSGBOX_SIGN
	end

@ Unused
FuchsiaCity_EventScript_SafariZoneOfficeSign:: @ 8166DFE
	msgbox FuchsiaCity_Text_SafariZoneOfficeSign, MSGBOX_SIGN
	end

FuchsiaCity_EventScript_GymSign:: @ 8166E07
	lockall
	famechecker FAMECHECKER_KOGA, 0
	msgbox FuchsiaCity_Text_GymSign
	releaseall
	end

FuchsiaCity_EventScript_ChanseySign:: @ 8166E1F
	lockall
	setvar VAR_0x8004, SPECIES_CHANSEY
	special SetSeenMon
	drawmonpic SPECIES_CHANSEY, 10, 3
	msgbox FuchsiaCity_Text_ChanseySign
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_VoltorbSign:: @ 8166E38
	lockall
	setvar VAR_0x8004, SPECIES_VOLTORB
	special SetSeenMon
	drawmonpic SPECIES_VOLTORB, 10, 3
	msgbox FuchsiaCity_Text_VoltorbSign
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_KangaskhanSign:: @ 8166E51
	lockall
	setvar VAR_0x8004, SPECIES_KANGASKHAN
	special SetSeenMon
	drawmonpic SPECIES_KANGASKHAN, 10, 3
	msgbox FuchsiaCity_Text_KangaskhanSign
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_SlowpokeSign:: @ 8166E6A
	lockall
	setvar VAR_0x8004, SPECIES_SLOWPOKE
	special SetSeenMon
	drawmonpic SPECIES_SLOWPOKE, 10, 3
	msgbox FuchsiaCity_Text_SlowpokeSign
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_LaprasSign:: @ 8166E83
	lockall
	setvar VAR_0x8004, SPECIES_LAPRAS
	special SetSeenMon
	drawmonpic SPECIES_LAPRAS, 10, 3
	msgbox FuchsiaCity_Text_LaprasSign
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_FossilMonSign:: @ 8166E9C
	lockall
	goto_if_set FLAG_GOT_DOME_FOSSIL, FuchsiaCity_EventScript_OmanyteSign
	setvar VAR_0x8004, SPECIES_KABUTO
	special SetSeenMon
	drawmonpic SPECIES_KABUTO, 10, 3
	msgbox FuchsiaCity_Text_KabutoSign
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_OmanyteSign:: @ 8166EBE
	setvar VAR_0x8004, SPECIES_OMANYTE
	special SetSeenMon
	drawmonpic SPECIES_OMANYTE, 10, 3
	msgbox FuchsiaCity_Text_OmanyteSign
	erasemonpic
	releaseall
	end
