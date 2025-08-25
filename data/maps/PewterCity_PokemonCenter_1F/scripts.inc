PewterCity_PokemonCenter_1F_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, PewterCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

PewterCity_PokemonCenter_1F_OnTransition::
	setrespawn HEAL_LOCATION_PEWTER_CITY
	end

PewterCity_PokemonCenter_1F_EventScript_Nurse::
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

PewterCity_PokemonCenter_1F_EventScript_Gentleman::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_PokemonCenter_1F_Text_TeamRocketMtMoonImOnPhone, MSGBOX_NPC
	end


PewterCity_PokemonCenter_1F_EventScript_Silvio::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_PokemonCenter_1F_Text_Silvio, MSGBOX_NPC
	end

PewterCity_PokemonCenter_1F_EventScript_Jigglypuff::
	lock
	faceplayer
	fadeoutbgm 0
	playbgm MUS_JIGGLYPUFF, 0
	textcolor NPC_TEXT_COLOR_NEUTRAL
	namebox Name_Jigglypuff
	msgbox PewterCity_PokemonCenter_1F_Text_Jigglypuff
	closemessage
	delay 455
	playbgm MUS_POKE_CENTER, 1
	release
	end

PewterCity_PokemonCenter_1F_EventScript_Youngster::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_PokemonCenter_1F_Text_WhenJiggylypuffSingsMonsGetDrowsy, MSGBOX_NPC
	end

PewterCity_PokemonCenter_1F_EventScript_GBAKid1::
	lock
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_PokemonCenter_1F_Text_TradingMyClefairyForPikachu
	release
	end

PewterCity_PokemonCenter_1F_EventScript_GBAKid2::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_PokemonCenter_1F_Text_TradingPikachuWithKid, MSGBOX_NPC
	end
