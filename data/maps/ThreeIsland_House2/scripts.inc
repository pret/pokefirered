ThreeIsland_House2_MapScripts:: @ 81718DF
	.byte 0

ThreeIsland_House2_EventScript_1718E0:: @ 81718E0
	lock
	faceplayer
	setvar VAR_0x8004, 7
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_81A32CA
	callstd 4
	release
	end

ThreeIsland_House2_EventScript_1718F9:: @ 81718F9
	loadword 0, gUnknown_81A3245
	callstd 2
	end
