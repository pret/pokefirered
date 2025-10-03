#ifndef GUARD_BATTLE_MAIN_H
#define GUARD_BATTLE_MAIN_H

#include "pokemon.h"
#include "data.h"
#include "constants/hold_effects.h"

// For displaying a multi battle partner's Pokémon in the party menu
struct MultiPartnerMenuPokemon
{
    /*0x00*/ u16 species;
    /*0x02*/ u16 heldItem;
    /*0x04*/ u8 nickname[POKEMON_NAME_LENGTH + 1];
    /*0x0F*/ u8 level;
    /*0x10*/ u16 hp;
    /*0x12*/ u16 maxhp;
    /*0x14*/ u32 status;
    /*0x18*/ u32 personality;
    /*0x1C*/ u8 gender;
    /*0x1D*/ u8 language;
};

// defines for the 'DoBounceEffect' function
#define BOUNCE_MON          0x0
#define BOUNCE_HEALTHBOX    0x1

enum BattleIntroStates
{
    BATTLE_INTRO_STATE_GET_MON_DATA,
    BATTLE_INTRO_STATE_LOOP_BATTLER_DATA,
    BATTLE_INTRO_STATE_PREPARE_BG_SLIDE,
    BATTLE_INTRO_STATE_WAIT_FOR_BG_SLIDE,
    BATTLE_INTRO_STATE_DRAW_SPRITES,
    BATTLE_INTRO_STATE_DRAW_PARTY_SUMMARY,
    BATTLE_INTRO_STATE_WAIT_FOR_PARTY_SUMMARY,
    BATTLE_INTRO_STATE_INTRO_TEXT,
    BATTLE_INTRO_STATE_WAIT_FOR_INTRO_TEXT,
    BATTLE_INTRO_STATE_TRAINER_SEND_OUT_TEXT,
    BATTLE_INTRO_STATE_WAIT_FOR_TRAINER_SEND_OUT_TEXT,
    BATTLE_INTRO_STATE_TRAINER_1_SEND_OUT_ANIM,
    BATTLE_INTRO_STATE_TRAINER_2_SEND_OUT_ANIM,
    BATTLE_INTRO_STATE_WAIT_FOR_TRAINER_2_SEND_OUT_ANIM,
    BATTLE_INTRO_STATE_WAIT_FOR_WILD_BATTLE_TEXT,
    BATTLE_INTRO_STATE_PRINT_PLAYER_SEND_OUT_TEXT,
    BATTLE_INTRO_STATE_WAIT_FOR_PLAYER_SEND_OUT_TEXT,
    BATTLE_INTRO_STATE_PRINT_PLAYER_1_SEND_OUT_TEXT,
    BATTLE_INTRO_STATE_PRINT_PLAYER_2_SEND_OUT_TEXT,
    BATTLE_INTRO_STATE_SET_DEX_AND_BATTLE_VARS
};

enum FirstTurnEventsStates
{
    FIRST_TURN_EVENTS_START,
    FIRST_TURN_EVENTS_OVERWORLD_WEATHER,
    FIRST_TURN_EVENTS_TERRAIN,
    FIRST_TURN_EVENTS_STARTING_STATUS,
    FIRST_TURN_EVENTS_TOTEM_BOOST,
    FIRST_TURN_EVENTS_NEUTRALIZING_GAS,
    FIRST_TURN_EVENTS_SWITCH_IN_ABILITIES,
    FIRST_TURN_EVENTS_ITEM_EFFECTS,
    FIRST_TURN_EVENTS_WHITE_HERB,
    FIRST_TURN_EVENTS_OPPORTUNIST,
    FIRST_TURN_EVENTS_MIRROR_HERB,
    FIRST_TURN_EVENTS_EJECT_PACK,
    FIRST_TURN_EVENTS_END,
};

void CB2_InitBattle(void);
void BattleMainCB2(void);
void CB2_QuitRecordedBattle(void);
void FreeRestoreBattleData(void);
void VBlankCB_Battle(void);
void SpriteCB_VsLetterDummy(struct Sprite *sprite);
void SpriteCB_VsLetterInit(struct Sprite *sprite);
void CB2_InitEndLinkBattle(void);
u32 GetBattleBgTemplateData(u8 arrayId, u8 caseId);
u32 GetBattleWindowTemplatePixelWidth(u32 windowsType, u32 tableId);
void SpriteCB_WildMon(struct Sprite *sprite);
void SpriteCallbackDummy_2(struct Sprite *sprite);
void SpriteCB_FaintOpponentMon(struct Sprite *sprite);
void SpriteCB_ShowAsMoveTarget(struct Sprite *sprite);
void SpriteCB_HideAsMoveTarget(struct Sprite *sprite);
void SpriteCB_OpponentMonFromBall(struct Sprite *sprite);
void SpriteCB_BattleSpriteStartSlideLeft(struct Sprite *sprite);
void SpriteCB_FaintSlideAnim(struct Sprite *sprite);
void DoBounceEffect(u8 battler, u8 which, s8 delta, s8 amplitude);
void EndBounceEffect(u8 battler, u8 which);
void SpriteCB_PlayerMonFromBall(struct Sprite *sprite);
void SpriteCB_PlayerMonSlideIn(struct Sprite *sprite);
void SpriteCB_TrainerThrowObject(struct Sprite *sprite);
void AnimSetCenterToCornerVecX(struct Sprite *sprite);
void BeginBattleIntroDummy(void);
void BeginBattleIntro(void);
void SwitchInClearSetData(u32 battler, struct Volatiles *volatilesCopy);
const u8* FaintClearSetData(u32 battler);
void BattleTurnPassed(void);
u8 IsRunningFromBattleImpossible(u32 battler);
void SwitchTwoBattlersInParty(u32 battler, u32 battler2);
void SwitchPartyOrder(u32 battler);
void SwapTurnOrder(u8 id1, u8 id2);
u32 GetBattlerTotalSpeedStatArgs(u32 battler, enum Ability ability, enum ItemHoldEffect holdEffect);
u32 GetBattlerTotalSpeedStat(u32 battler);
s32 GetChosenMovePriority(u32 battler, enum Ability ability);
s32 GetBattleMovePriority(u32 battler, enum Ability ability, u32 move);
s32 GetWhichBattlerFasterArgs(u32 battler1, u32 battler2, bool32 ignoreChosenMoves, enum Ability ability1, enum Ability ability2,
    enum ItemHoldEffect holdEffectBattler1, enum ItemHoldEffect holdEffectBattler2, u32 speedBattler1, u32 speedBattler2, s32 priority1, s32 priority2);
s32 GetWhichBattlerFasterOrTies(u32 battler1, u32 battler2, bool32 ignoreChosenMoves);
s32 GetWhichBattlerFaster(u32 battler1, u32 battler2, bool32 ignoreChosenMoves);
void RunBattleScriptCommands_PopCallbacksStack(void);
void RunBattleScriptCommands(void);
void SpecialStatusesClear(void);
u32 GetDynamicMoveType(struct Pokemon *mon, u32 move, u32 battler, enum MonState monInBattle);
void SetTypeBeforeUsingMove(u32 move, u32 battlerAtk);
bool32 IsWildMonSmart(void);
u8 CreateNPCTrainerPartyFromTrainer(struct Pokemon *party, const struct Trainer *trainer, bool32 firstTrainer, u32 battleTypeFlags);
void ModifyPersonalityForNature(u32 *personality, u32 newNature);
u32 GeneratePersonalityForGender(u32 gender, u32 species);
void CustomTrainerPartyAssignMoves(struct Pokemon *mon, const struct TrainerMon *partyEntry);
bool32 CanPlayerForfeitNormalTrainerBattle(void);
bool32 DidPlayerForfeitNormalTrainerBattle(void);
void BattleDebug_WonBattle(void);

extern struct MultiPartnerMenuPokemon gMultiPartnerParty[MULTI_PARTY_SIZE];

extern const struct SpriteTemplate gUnusedBattleInitSprite;
extern const struct OamData gOamData_BattleSpriteOpponentSide;
extern const struct OamData gOamData_BattleSpritePlayerSide;
extern const struct TypeInfo gTypesInfo[NUMBER_OF_MON_TYPES];
extern const uq4_12_t gTypeEffectivenessTable[NUMBER_OF_MON_TYPES][NUMBER_OF_MON_TYPES];

extern const u8 gStatusConditionString_PoisonJpn[8];
extern const u8 gStatusConditionString_SleepJpn[8];
extern const u8 gStatusConditionString_ParalysisJpn[8];
extern const u8 gStatusConditionString_BurnJpn[8];
extern const u8 gStatusConditionString_IceJpn[8];
extern const u8 gStatusConditionString_ConfusionJpn[8];
extern const u8 gStatusConditionString_LoveJpn[8];

extern const u8 *const gStatusConditionStringsTable[7][2];

#endif // GUARD_BATTLE_MAIN_H
