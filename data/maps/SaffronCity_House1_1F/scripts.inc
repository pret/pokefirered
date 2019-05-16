SaffronCity_House1_1F_MapScripts:: @ 816EB36
	.byte 0

SaffronCity_House1_1F_EventScript_16EB37:: @ 816EB37
	msgbox gUnknown_819AB9B, 2
	end

SaffronCity_House1_1F_EventScript_16EB40:: @ 816EB40
	msgbox gUnknown_819ABD7, 2
	end

SaffronCity_House1_1F_EventScript_16EB49:: @ 816EB49
	lock
	faceplayer
	waitse
	playmoncry SPECIES_CHANSEY, 0
	msgbox gUnknown_819AC4B
	waitmoncry
	release
	end
