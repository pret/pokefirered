Route22_NorthEntrance_MapScripts:: @ 81704FB
	.byte 0

Route22_NorthEntrance_EventScript_1704FC:: @ 81704FC
	lock
	faceplayer
	setvar VAR_0x4001, 1
	getstdstring 0, 15
	goto EventScript_1A7803
	end

Route22_NorthEntrance_EventScript_17050D:: @ 817050D
	lockall
	setvar VAR_0x4001, 1
	setvar VAR_0x8009, 1
	getstdstring 0, 15
	goto EventScript_1A796E
	end
