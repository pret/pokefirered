LavenderTown_House1_MapScripts:: @ 816B232
	.byte 0

LavenderTown_House1_EventScript_CooltrainerF:: @ 816B233
	lock
	faceplayer
	goto_if_set FLAG_RESCUED_MR_FUJI, LavenderTown_House1_EventScript_CooltrainerFGhostGone
	msgbox LavenderTown_House1_Text_RocketsKilledCubonesMother
	release
	end

LavenderTown_House1_EventScript_CooltrainerFGhostGone:: @ 816B248
	msgbox LavenderTown_House1_Text_GhostOfPokemonTowerIsGone
	release
	end

LavenderTown_House1_EventScript_Cubone:: @ 816B252
	lock
	faceplayer
	waitse
	playmoncry SPECIES_CUBONE, 0
	msgbox LavenderTown_House1_Text_Cubone
	waitmoncry
	release
	end
