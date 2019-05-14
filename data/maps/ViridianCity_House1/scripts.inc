ViridianCity_House1_MapScripts:: @ 8169E9A
	.byte 0

ViridianCity_House1_EventScript_169E9B:: @ 8169E9B
	loadword 0, gUnknown_818F292
	callstd 2
	end

ViridianCity_House1_EventScript_169EA4:: @ 8169EA4
	loadword 0, gUnknown_818F30F
	callstd 2
	end

ViridianCity_House1_EventScript_169EAD:: @ 8169EAD
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SPEAROW, 0
	loadword 0, gUnknown_818F32C
	callstd 4
	waitmoncry
	release
	end

ViridianCity_House1_EventScript_169EC0:: @ 8169EC0
	loadword 0, gUnknown_818F33D
	callstd 3
	end
