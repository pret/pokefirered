CeruleanCity_PokemonCenter_1F_MapScripts:: @ 816AA2D
	map_script 3, CeruleanCity_PokemonCenter_1F_MapScript1_16AA38
	map_script 5, CeruleanCity_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

CeruleanCity_PokemonCenter_1F_MapScript1_16AA38:: @ 816AA38
	setrespawn SPAWN_CERULEAN_CITY
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA3C:: @ 816AA3C
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA45:: @ 816AA45
	msgbox gUnknown_8192079, 2
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA4E:: @ 816AA4E
	msgbox gUnknown_8191FFB, 2
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA57:: @ 816AA57
	lock
	faceplayer
	setvar VAR_0x8004, 13
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	msgbox gUnknown_8192116
	release
	end

CeruleanCity_PokemonCenter_1F_EventScript_16AA70:: @ 816AA70
	msgbox gUnknown_819214C, 2
	end
