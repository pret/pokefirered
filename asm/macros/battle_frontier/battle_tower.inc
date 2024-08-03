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
	trainerbattle TRAINER_BATTLE_SET_TRAINER_A, \trainer1Id, 0, NULL, \trainer1LoseText @ set first trainer mons
	trainerbattle TRAINER_BATTLE_SET_TRAINER_B, \trainer2Id, 0, NULL, \trainer2LoseText @ set second trainer mons
	multi_do MULTI_BATTLE_2_VS_2, \partnerId
	.endm
