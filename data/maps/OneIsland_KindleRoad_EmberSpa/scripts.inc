OneIsland_KindleRoad_EmberSpa_MapScripts:: @ 816535B
	.byte 0

OneIsland_KindleRoad_EmberSpa_EventScript_16535C:: @ 816535C
	loadword 0, gUnknown_817D34A
	callstd 2
	end

OneIsland_KindleRoad_EmberSpa_EventScript_165365:: @ 8165365
	loadword 0, gUnknown_817D3DE
	callstd 2
	end

OneIsland_KindleRoad_EmberSpa_EventScript_16536E:: @ 816536E
	loadword 0, gUnknown_817D4AA
	callstd 2
	end

OneIsland_KindleRoad_EmberSpa_EventScript_165377:: @ 8165377
	loadword 0, gUnknown_817D4E3
	callstd 2
	end

OneIsland_KindleRoad_EmberSpa_EventScript_165380:: @ 8165380
	lock
	faceplayer
	setvar VAR_0x8004, 10
	setvar VAR_0x8005, 3
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_817D550
	callstd 4
	release
	end

OneIsland_KindleRoad_EmberSpa_EventScript_165399:: @ 8165399
	lock
	faceplayer
	checkflag FLAG_0x2EF
	goto_if 1, EventScript_1653C5
	loadword 0, gUnknown_817D622
	callstd 4
	setorcopyvar VAR_0x8000, 344
	setorcopyvar VAR_0x8001, 1
	callstd 0
	setflag FLAG_0x2EF
	loadword 0, gUnknown_817D6F3
	callstd 4
	release
	end

EventScript_1653C5:: @ 81653C5
	loadword 0, gUnknown_817D6F3
	callstd 4
	release
	end

OneIsland_KindleRoad_EmberSpa_EventScript_1653CF:: @ 81653CF
	lockall
	fadescreen 3
	special sp000_heal_pokemon
	fadescreen 2
	loadword 0, gUnknown_817D450
	callstd 4
	setvar VAR_0x4001, 1
	releaseall
	end
