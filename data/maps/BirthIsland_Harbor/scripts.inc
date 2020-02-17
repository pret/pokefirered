BirthIsland_Harbor_MapScripts:: @ 81653E6
	.byte 0

BirthIsland_Harbor_EventScript_Sailor:: @ 81653E7
	lock
	faceplayer
	message Text_WhereDoYouWantToSail
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_BIRTH_ISLAND
	multichoice 20, 8, MULTICHOICE_SEAGALLOP_VERMILION, FALSE
	switch VAR_RESULT
	case 0, EventScript_SailToVermilionCity
	case 1, EventScript_CancelSail
	case 127, EventScript_CancelSail
	end
