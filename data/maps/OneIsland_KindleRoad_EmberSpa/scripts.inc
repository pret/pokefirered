OneIsland_KindleRoad_EmberSpa_MapScripts:: @ 816535B
	.byte 0

OneIsland_KindleRoad_EmberSpa_EventScript_16535C:: @ 816535C
	msgbox gUnknown_817D34A, 2
	end

OneIsland_KindleRoad_EmberSpa_EventScript_165365:: @ 8165365
	msgbox gUnknown_817D3DE, 2
	end

OneIsland_KindleRoad_EmberSpa_EventScript_16536E:: @ 816536E
	msgbox gUnknown_817D4AA, 2
	end

OneIsland_KindleRoad_EmberSpa_EventScript_165377:: @ 8165377
	msgbox gUnknown_817D4E3, 2
	end

OneIsland_KindleRoad_EmberSpa_EventScript_165380:: @ 8165380
	lock
	faceplayer
	famechecker FAMECHECKER_BRUNO, 3
	msgbox gUnknown_817D550
	release
	end

OneIsland_KindleRoad_EmberSpa_EventScript_165399:: @ 8165399
	lock
	faceplayer
	goto_if_set FLAG_GOT_HM06, EventScript_1653C5
	msgbox gUnknown_817D622
	giveitem ITEM_HM06
	setflag FLAG_GOT_HM06
	msgbox gUnknown_817D6F3
	release
	end

EventScript_1653C5:: @ 81653C5
	msgbox gUnknown_817D6F3
	release
	end

OneIsland_KindleRoad_EmberSpa_EventScript_1653CF:: @ 81653CF
	lockall
	fadescreen 3
	special sp000_heal_pokemon
	fadescreen 2
	msgbox gUnknown_817D450
	setvar VAR_TEMP_1, 1
	releaseall
	end
