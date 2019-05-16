ViridianCity_House1_MapScripts:: @ 8169E9A
	.byte 0

ViridianCity_House1_EventScript_169E9B:: @ 8169E9B
	msgbox gUnknown_818F292, 2
	end

ViridianCity_House1_EventScript_169EA4:: @ 8169EA4
	msgbox gUnknown_818F30F, 2
	end

ViridianCity_House1_EventScript_169EAD:: @ 8169EAD
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SPEAROW, 0
	msgbox gUnknown_818F32C
	waitmoncry
	release
	end

ViridianCity_House1_EventScript_169EC0:: @ 8169EC0
	msgbox gUnknown_818F33D, 3
	end
