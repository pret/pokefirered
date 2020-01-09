EventScript_SetGymTrainers:: @ 81A6B18
	switch VAR_0x8008
	case 1, EventScript_SetPewterGymTrainers
	case 2, EventScript_SetCeruleanGymTrainers
	case 3, EventScript_SetVermilionGymTrainers
	case 4, EventScript_SetCeladonGymTrainers
	case 5, EventScript_SetFuchsiaGymTrainers
	case 6, EventScript_SetSaffronGymTrainers
	case 7, EventScript_SetCinnabarGymTrainers
	case 8, EventScript_SetViridianGymTrainers
	end

EventScript_SetPewterGymTrainers:: @ 81A6B76
	settrainerflag TRAINER_CAMPER_LIAM
	return

EventScript_SetCeruleanGymTrainers:: @ 81A6B7A
	settrainerflag TRAINER_PICNICKER_DIANA
	settrainerflag TRAINER_SWIMMER_MALE_LUIS
	return

EventScript_SetVermilionGymTrainers:: @ 81A6B81
	settrainerflag TRAINER_SAILOR_DWAYNE
	settrainerflag TRAINER_ENGINEER_BAILY
	settrainerflag TRAINER_GENTLEMAN_TUCKER
	return

EventScript_SetCeladonGymTrainers:: @ 81A6B8B
	settrainerflag TRAINER_LASS_KAY
	settrainerflag TRAINER_LASS_LISA
	settrainerflag TRAINER_PICNICKER_TINA
	settrainerflag TRAINER_BEAUTY_BRIDGET
	settrainerflag TRAINER_BEAUTY_TAMIA
	settrainerflag TRAINER_BEAUTY_LORI
	settrainerflag TRAINER_COOLTRAINER_MARY
	return

EventScript_SetFuchsiaGymTrainers:: @ 81A6BA1
	settrainerflag TRAINER_TAMER_PHIL
	settrainerflag TRAINER_TAMER_EDGAR
	settrainerflag TRAINER_JUGGLER_KIRK
	settrainerflag TRAINER_JUGGLER_SHAWN
	settrainerflag TRAINER_JUGGLER_KAYDEN
	settrainerflag TRAINER_JUGGLER_NATE
	return

EventScript_SetSaffronGymTrainers:: @ 81A6BB4
	settrainerflag TRAINER_PSYCHIC_JOHAN
	settrainerflag TRAINER_PSYCHIC_TYRON
	settrainerflag TRAINER_PSYCHIC_CAMERON
	settrainerflag TRAINER_PSYCHIC_PRESTON
	settrainerflag TRAINER_CHANNELER_AMANDA
	settrainerflag TRAINER_CHANNELER_STACY
	settrainerflag TRAINER_CHANNELER_TASHA
	return

EventScript_SetCinnabarGymTrainers:: @ 81A6BCA
	settrainerflag TRAINER_SUPER_NERD_ERIK
	settrainerflag TRAINER_SUPER_NERD_AVERY
	settrainerflag TRAINER_SUPER_NERD_DEREK
	settrainerflag TRAINER_SUPER_NERD_ZAC
	settrainerflag TRAINER_BURGLAR_QUINN
	settrainerflag TRAINER_BURGLAR_RAMON
	settrainerflag TRAINER_BURGLAR_DUSTY
	return

EventScript_SetViridianGymTrainers:: @ 81A6BE0
	settrainerflag TRAINER_TAMER_JASON
	settrainerflag TRAINER_TAMER_COLE
	settrainerflag TRAINER_BLACK_BELT_ATSUSHI
	settrainerflag TRAINER_BLACK_BELT_KIYO
	settrainerflag TRAINER_BLACK_BELT_TAKASHI
	settrainerflag TRAINER_COOLTRAINER_SAMUEL
	settrainerflag TRAINER_COOLTRAINER_YUJI
	settrainerflag TRAINER_COOLTRAINER_WARREN
	return
