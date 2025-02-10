	@Custom multi-battle commands

	.macro multi_do type:req, partnerId:req
	special ReducePlayerPartyToSelectedMons
	@setvar VAR_0x8004, FRONTIER_UTIL_FUNC_SET_DATA
	@setvar VAR_0x8005, FRONTIER_DATA_SELECTED_MON_ORDER
	@special CallFrontierUtilFunc @ saves the mon order, so the non-selected mons get restored afterwards
	setvar VAR_0x8004, SPECIAL_BATTLE_MULTI
	setvar VAR_0x8005, \type | MULTI_BATTLE_CHOOSE_MONS
	setvar VAR_0x8006, \partnerId
	special DoSpecialTrainerBattle
	waitstate
	@setvar VAR_0x8004, FRONTIER_UTIL_FUNC_SAVE_PARTY
	@special CallFrontierUtilFunc
	special LoadPlayerParty
	.endm

	.macro multi_2_vs_2 trainer1Id:req, trainer1LoseText:req, trainer2Id:req, trainer2LoseText:req, partnerId:req
	special SavePlayerParty
	trainerbattle TRAINER_BATTLE_SET_TRAINERS_FOR_MULTI_BATTLE, OBJ_ID_NONE, \trainer1Id, NULL, \trainer1LoseText, NULL, OBJ_ID_NONE, \trainer2Id, NULL, \trainer2LoseText, NULL, NULL, NULL, FALSE, TRUE, FALSE, FALSE
	multi_do MULTI_BATTLE_2_VS_2, \partnerId
	.endm
