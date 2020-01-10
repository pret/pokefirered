FuchsiaCity_MapScripts:: @ 8166D75
	map_script MAP_SCRIPT_ON_TRANSITION, FuchsiaCity_OnTransition
	.byte 0

FuchsiaCity_OnTransition:: @ 8166D7B
	setworldmapflag FLAG_WORLD_MAP_FUCHSIA_CITY
	call_if_set FLAG_GOT_DOME_FOSSIL, EventScript_166D91
	call_if_unset FLAG_GOT_DOME_FOSSIL, EventScript_166D97
	end

EventScript_166D91:: @ 8166D91
	setvar VAR_OBJ_GFX_ID_0, OBJECT_EVENT_GFX_OMANYTE
	return

EventScript_166D97:: @ 8166D97
	setvar VAR_OBJ_GFX_ID_0, OBJECT_EVENT_GFX_KABUTO
	return

FuchsiaCity_EventScript_166D9D:: @ 8166D9D
	msgbox gUnknown_818056E, 2
	end

FuchsiaCity_EventScript_166DA6:: @ 8166DA6
	msgbox gUnknown_81805C6, 2
	end

FuchsiaCity_EventScript_166DAF:: @ 8166DAF
	msgbox gUnknown_818062C, 2
	end

FuchsiaCity_EventScript_166DB8:: @ 8166DB8
	msgbox gUnknown_818065A, 2
	end

FuchsiaCity_EventScript_166DC1:: @ 8166DC1
	lock
	faceplayer
	famechecker FAMECHECKER_KOGA, 3
	msgbox gUnknown_8180ABD
	release
	end

FuchsiaCity_EventScript_166DDA:: @ 8166DDA
	msgbox gUnknown_81806AB, 3
	end

FuchsiaCity_EventScript_166DE3:: @ 8166DE3
	msgbox gUnknown_81806D3, 3
	end

FuchsiaCity_EventScript_166DEC:: @ 8166DEC
	msgbox gUnknown_81806F0, 3
	end

FuchsiaCity_EventScript_166DF5:: @ 8166DF5
	msgbox gUnknown_818070D, 3
	end

EventScript_166DFE:: @ 8166DFE
	msgbox gUnknown_8180727, 3
	end

FuchsiaCity_EventScript_166E07:: @ 8166E07
	lockall
	famechecker FAMECHECKER_KOGA, 0
	msgbox gUnknown_8180768
	releaseall
	end

FuchsiaCity_EventScript_166E1F:: @ 8166E1F
	lockall
	setvar VAR_0x8004, SPECIES_CHANSEY
	special Special_SetSeenMon
	drawmonpic SPECIES_CHANSEY, 10, 3
	msgbox gUnknown_81807A9
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E38:: @ 8166E38
	lockall
	setvar VAR_0x8004, SPECIES_VOLTORB
	special Special_SetSeenMon
	drawmonpic SPECIES_VOLTORB, 10, 3
	msgbox gUnknown_81807D9
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E51:: @ 8166E51
	lockall
	setvar VAR_0x8004, SPECIES_KANGASKHAN
	special Special_SetSeenMon
	drawmonpic SPECIES_KANGASKHAN, 10, 3
	msgbox gUnknown_8180806
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E6A:: @ 8166E6A
	lockall
	setvar VAR_0x8004, SPECIES_SLOWPOKE
	special Special_SetSeenMon
	drawmonpic SPECIES_SLOWPOKE, 10, 3
	msgbox gUnknown_8180859
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E83:: @ 8166E83
	lockall
	setvar VAR_0x8004, SPECIES_LAPRAS
	special Special_SetSeenMon
	drawmonpic SPECIES_LAPRAS, 10, 3
	msgbox gUnknown_8180887
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E9C:: @ 8166E9C
	lockall
	goto_if_set FLAG_GOT_DOME_FOSSIL, EventScript_166EBE
	setvar VAR_0x8004, SPECIES_KABUTO
	special Special_SetSeenMon
	drawmonpic SPECIES_KABUTO, 10, 3
	msgbox gUnknown_81808FA
	erasemonpic
	releaseall
	end

EventScript_166EBE:: @ 8166EBE
	setvar VAR_0x8004, SPECIES_OMANYTE
	special Special_SetSeenMon
	drawmonpic SPECIES_OMANYTE, 10, 3
	msgbox gUnknown_81808AE
	erasemonpic
	releaseall
	end
