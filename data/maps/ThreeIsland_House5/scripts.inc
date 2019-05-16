ThreeIsland_House5_MapScripts:: @ 817191F
	.byte 0

ThreeIsland_House5_EventScript_171920:: @ 8171920
	lock
	faceplayer
	checkflag FLAG_0x2A3
	goto_if 1, EventScript_171935
	msgbox gUnknown_81A3469
	release
	end

EventScript_171935:: @ 8171935
	msgbox gUnknown_81A34DB
	release
	end
