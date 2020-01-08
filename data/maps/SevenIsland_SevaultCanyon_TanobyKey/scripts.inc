SevenIsland_SevaultCanyon_TanobyKey_MapScripts:: @ 8164DCC
	map_script 3, SevenIsland_SevaultCanyon_TanobyKey_MapScript1_164DD2
	.byte 0

SevenIsland_SevaultCanyon_TanobyKey_MapScript1_164DD2:: @ 8164DD2
	setworldmapflag FLAG_WORLD_MAP_SEVEN_ISLAND_SEVAULT_CANYON_TANOBY_KEY
	checkflag FLAG_SYS_UNLOCKED_TANOBY_RUINS
	call_if TRUE, EventScript_164E07
	setvar VAR_0x4001, 0
	setvar VAR_0x4002, 0
	setvar VAR_0x4003, 0
	setvar VAR_0x4004, 0
	setvar VAR_0x4005, 0
	setvar VAR_0x4006, 0
	setvar VAR_0x4007, 0
	setvar VAR_0x4008, 0
	end

EventScript_164E07:: @ 8164E07
	setobjectxyperm 1, 7, 2
	setobjectxyperm 2, 4, 4
	setobjectxyperm 3, 10, 4
	setobjectxyperm 4, 5, 6
	setobjectxyperm 5, 9, 6
	setobjectxyperm 6, 5, 8
	setobjectxyperm 7, 9, 8
	return

SevenIsland_SevaultCanyon_TanobyKey_EventScript_164E39:: @ 8164E39
	lockall
	compare VAR_0x4001, 100
	goto_if eq, EventScript_164F8A
	call EventScript_164F2E
	setvar VAR_0x4001, 100
	compare VAR_0x4008, 7
	goto_if eq, EventScript_164F8C
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_164E5C:: @ 8164E5C
	lockall
	compare VAR_0x4002, 100
	goto_if eq, EventScript_164F8A
	call EventScript_164F2E
	setvar VAR_0x4002, 100
	compare VAR_0x4008, 7
	goto_if eq, EventScript_164F8C
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_164E7F:: @ 8164E7F
	lockall
	compare VAR_0x4003, 100
	goto_if eq, EventScript_164F8A
	call EventScript_164F2E
	setvar VAR_0x4003, 100
	compare VAR_0x4008, 7
	goto_if eq, EventScript_164F8C
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_164EA2:: @ 8164EA2
	lockall
	compare VAR_0x4004, 100
	goto_if eq, EventScript_164F8A
	call EventScript_164F2E
	setvar VAR_0x4004, 100
	compare VAR_0x4008, 7
	goto_if eq, EventScript_164F8C
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_164EC5:: @ 8164EC5
	lockall
	compare VAR_0x4005, 100
	goto_if eq, EventScript_164F8A
	call EventScript_164F2E
	setvar VAR_0x4005, 100
	compare VAR_0x4008, 7
	goto_if eq, EventScript_164F8C
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_164EE8:: @ 8164EE8
	lockall
	compare VAR_0x4006, 100
	goto_if eq, EventScript_164F8A
	call EventScript_164F2E
	setvar VAR_0x4006, 100
	compare VAR_0x4008, 7
	goto_if eq, EventScript_164F8C
	releaseall
	end

SevenIsland_SevaultCanyon_TanobyKey_EventScript_164F0B:: @ 8164F0B
	lockall
	compare VAR_0x4007, 100
	goto_if eq, EventScript_164F8A
	call EventScript_164F2E
	setvar VAR_0x4007, 100
	compare VAR_0x4008, 7
	goto_if eq, EventScript_164F8C
	releaseall
	end

EventScript_164F2E:: @ 8164F2E
	addvar VAR_0x4008, 1
	playse SE_TRACK_MOVE
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	setvar VAR_0x8006, 8
	setvar VAR_0x8007, 3
	special Special_ShakeScreen
	delay 60
	return

EventScript_164F51:: @ 8164F51
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 2
	setvar VAR_0x8006, 10
	setvar VAR_0x8007, 3
	special Special_ShakeScreen
	delay 60
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 3
	setvar VAR_0x8006, 12
	setvar VAR_0x8007, 2
	special Special_ShakeScreen
	delay 60
	playse SE_FU_ZUZUZU
	waitse
	return

EventScript_164F8A:: @ 8164F8A
	releaseall
	end

EventScript_164F8C:: @ 8164F8C
	call EventScript_164F51
	msgbox gUnknown_817D31B
	setflag FLAG_SYS_UNLOCKED_TANOBY_RUINS
	releaseall
	end
