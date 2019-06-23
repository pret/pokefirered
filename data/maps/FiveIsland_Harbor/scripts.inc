FiveIsland_Harbor_MapScripts:: @ 8171D42
	.byte 0

FiveIsland_Harbor_EventScript_171D43:: @ 8171D43
	lock
	faceplayer
	message Text_181726
	waitmessage
	setvar VAR_0x8004, 5
	goto EventScript_1A900F
	end
