LavenderTown_House1_MapScripts:: @ 816B232
	.byte 0

LavenderTown_House1_EventScript_16B233:: @ 816B233
	lock
	faceplayer
	goto_if_set FLAG_RESCUED_MR_FUJI, EventScript_16B248
	msgbox gUnknown_819397D
	release
	end

EventScript_16B248:: @ 816B248
	msgbox gUnknown_81939F8
	release
	end

LavenderTown_House1_EventScript_16B252:: @ 816B252
	lock
	faceplayer
	waitse
	playmoncry SPECIES_CUBONE, 0
	msgbox gUnknown_819396B
	waitmoncry
	release
	end
