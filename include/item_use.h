#ifndef GUARD_ITEM_USE_H
#define GUARD_ITEM_USE_H

void ItemUseOutOfBattle_AbilityCapsule(u8 taskId);
void ItemUseOutOfBattle_AbilityPatch(u8 taskId);
void ItemUseOutOfBattle_BerryPouch(u8 taskId);
void ItemUseOutOfBattle_Bike(u8 taskId);
void ItemUseOutOfBattle_BlackWhiteFlute(u8 taskId);
void ItemUseOutOfBattle_CoinCase(u8 taskId);
void ItemUseOutOfBattle_DynamaxCandy(u8 taskId);
void ItemUseOutOfBattle_EscapeRope(u8 taskId);
void ItemUseOutOfBattle_EnigmaBerry(u8 taskId);
void ItemUseOutOfBattle_EvolutionStone(u8 taskId);
void ItemUseOutOfBattle_FameChecker(u8 taskId);
void ItemUseOutOfBattle_FormChange(u8 taskId);
void ItemUseOutOfBattle_FormChange_ConsumedOnUse(u8 taskId);
void ItemUseOutOfBattle_Fusion(u8 taskId);
void ItemUseOutOfBattle_Honey(u8 taskId);
void ItemUseOutOfBattle_Itemfinder(u8 taskId);
void ItemUseOutOfBattle_Mail(u8 taskId);
void ItemUseOutOfBattle_Medicine(u8 taskId);
void ItemUseOutOfBattle_Mint(u8 taskId);
void ItemUseOutOfBattle_PokeFlute(u8 taskId);
void ItemUseOutOfBattle_PokemonBoxLink(u8 taskId);
void ItemUseOutOfBattle_PowderJar(u8 taskId);
void ItemUseOutOfBattle_PPRecovery(u8 taskId);
void ItemUseOutOfBattle_PPUp(u8 taskId);
void ItemUseOutOfBattle_RareCandy(u8 taskId);
void ItemUseOutOfBattle_Repel(u8 taskId);
void ItemUseOutOfBattle_ReduceEV(u8 taksId);
void ItemUseOutOfBattle_ResetEVs(u8 taskId);
void ItemUseOutOfBattle_Rod(u8 taskId);
void ItemUseOutOfBattle_RotomCatalog(u8 taskId);
void ItemUseOutOfBattle_SacredAsh(u8 taskId);
void ItemUseOutOfBattle_TeachyTv(u8 taskId);
void ItemUseOutOfBattle_TmCase(u8 taskId);
void ItemUseOutOfBattle_TownMap(u8 taskId);
void ItemUseOutOfBattle_VsSeeker(u8 taskId);
void ItemUseOutOfBattle_ZygardeCube(u8 taskId);
void ItemUseOutOfBattle_CannotUse(u8 taskId);
void ItemUseInBattle_BagMenu(u8 taskId);
void ItemUseInBattle_PartyMenu(u8 taskId);
void ItemUseInBattle_PartyMenuChooseMove(u8 taskId);
void Task_UseDigEscapeRopeOnField(u8 taskId);
u8 CanUseEscapeRopeOnCurrMap(void);
u8 CheckIfItemIsTMHMOrEvolutionStone(u16 itemId);
void Task_ItemUse_CloseMessageBoxAndReturnToField_VsSeeker(u8);
void ItemUse_SetQuestLogEvent(u8, struct Pokemon *, u16, u16);

enum {
    BALL_THROW_UNABLE_TWO_MONS,
    BALL_THROW_UNABLE_NO_ROOM,
    BALL_THROW_UNABLE_SEMI_INVULNERABLE,
    BALL_THROW_ABLE,
    BALL_THROW_UNABLE_DISABLED_FLAG,
};

bool32 CannotUseItemsInBattle(u16 itemId, struct Pokemon *mon);

#endif //GUARD_ITEM_USE_H
