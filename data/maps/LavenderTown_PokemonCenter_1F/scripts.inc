LavenderTown_PokemonCenter_1F_MapScripts:: @ 816B0EF
	map_script 3, LavenderTown_PokemonCenter_1F_MapScript1_16B0FA
	map_script 5, LavenderTown_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

LavenderTown_PokemonCenter_1F_MapScript1_16B0FA:: @ 816B0FA
	setrespawn 5
	end

LavenderTown_PokemonCenter_1F_EventScript_16B0FE:: @ 816B0FE
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

LavenderTown_PokemonCenter_1F_EventScript_16B107:: @ 816B107
	msgbox gUnknown_8193465, 2
	end

LavenderTown_PokemonCenter_1F_EventScript_16B110:: @ 816B110
	msgbox gUnknown_81934DE, 2
	end

LavenderTown_PokemonCenter_1F_EventScript_16B119:: @ 816B119
	msgbox gUnknown_819353A, 2
	end
