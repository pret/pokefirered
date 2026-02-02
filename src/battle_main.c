#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_ai_main.h"
#include "battle_ai_util.h"
// #include "battle_arena.h"
#include "battle_controllers.h"
#include "battle_end_turn.h"
#include "battle_hold_effects.h"
#include "battle_interface.h"
#include "battle_main.h"
#include "battle_message.h"
// #include "battle_pyramid.h"
#include "battle_scripts.h"
#include "battle_setup.h"
#include "battle_z_move.h"
#include "battle_gimmick.h"
#include "berry.h"
#include "bg.h"
#include "data.h"
#include "debug.h"
#include "decompress.h"
#include "dexnav.h"
#include "dma3.h"
#include "event_data.h"
#include "evolution_scene.h"
// #include "frontier_util.h"
#include "field_weather.h"
#include "follower_npc.h"
#include "graphics.h"
#include "help_system.h"
#include "gpu_regs.h"
#include "international_string_util.h"
#include "item.h"
#include "link.h"
#include "link_rfu.h"
#include "load_save.h"
#include "main.h"
#include "malloc.h"
#include "m4a.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeball.h"
#include "pokedex.h"
#include "pokemon.h"
#include "quest_log.h"
#include "pokerus.h"
#include "random.h"
#include "recorded_battle.h"
#include "roamer.h"
#include "safari_zone.h"
#include "scanline_effect.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "test/battle.h"
#include "test_runner.h"
#include "text.h"
#include "trainer_pools.h"
#include "trig.h"
// #include "tv.h"
#include "util.h"
#include "vs_seeker.h"
#include "wild_encounter.h"
#include "window.h"
#include "constants/abilities.h"
#include "constants/battle_ai.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_string_ids.h"
#include "constants/battle_partner.h"
#include "constants/battle_setup.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/party_menu.h"
#include "constants/rgb.h"
#include "constants/songs.h"
#include "constants/trainer_slide.h"
#include "constants/trainers.h"
#include "constants/weather.h"
#include "cable_club.h"
#include "test/test_runner_battle.h"

extern const struct BgTemplate gBattleBgTemplates[];

static void CB2_InitBattleInternal(void);
static void CB2_PreInitMultiBattle(void);
static void CB2_PreInitIngamePlayerPartnerBattle(void);
static void CB2_HandleStartMultiPartnerBattle(void);
static void CB2_HandleStartMultiBattle(void);
static void CB2_HandleStartBattle(void);
static void TryCorrectShedinjaLanguage(struct Pokemon *mon);
static u8 CreateNPCTrainerParty(struct Pokemon *party, u16 trainerNum, bool8 firstTrainer);
static void BattleMainCB1(void);
static void CB2_QuitPokedudeBattle(void);
static void CB2_EndLinkBattle(void);
static void EndLinkBattleInSteps(void);
// static void CB2_InitAskRecordBattle(void);
// static void CB2_AskRecordBattle(void);
// static void AskRecordBattle(void);
static void SpriteCB_MoveWildMonToRight(struct Sprite *sprite);
static void SpriteCB_WildMonShowHealthbox(struct Sprite *sprite);
static void SpriteCB_WildMonAnimate(struct Sprite *sprite);
static void SpriteCB_AnimFaintOpponent(struct Sprite *sprite);
static void SpriteCB_BlinkVisible(struct Sprite *sprite);
static void SpriteCB_Idle(struct Sprite *sprite);
static void SpriteCB_BattleSpriteSlideLeft(struct Sprite *sprite);
static void TurnValuesCleanUp(bool8 var0);
static void SpriteCB_BounceEffect(struct Sprite *sprite);
static void BattleStartClearSetData(void);
static void DoBattleIntro(void);
static void TryDoEventsBeforeFirstTurn(void);
static void HandleTurnActionSelectionState(void);
static void RunTurnActionsFunctions(void);
static void SetActionsAndBattlersTurnOrder(void);
static void UpdateBattlerPartyOrdersOnSwitch(u32 battler);
static bool8 AllAtActionConfirmed(void);
static void TryChangeTurnOrder(void);
static void TryChangingTurnOrderEffects(struct BattleCalcValues *calcValues, u32 *quickClawRandom, u32 *quickDrawRandom);
static void CheckChangingTurnOrderEffects(void);
static void FreeResetData_ReturnToOvOrDoEvolutions(void);
static void ReturnFromBattleToOverworld(void);
static void TryEvolvePokemon(void);
static void WaitForEvoSceneToFinish(void);
static void HandleEndTurn_ContinueBattle(void);
static void HandleEndTurn_BattleWon(void);
static void HandleEndTurn_BattleLost(void);
static void HandleEndTurn_RanFromBattle(void);
static void HandleEndTurn_MonFled(void);
static void HandleEndTurn_FinishBattle(void);
static u32 Crc32B (const u8 *data, u32 size);
static u32 GeneratePartyHash(const struct Trainer *trainer, u32 i);

EWRAM_DATA u16 gBattle_BG0_X = 0;
EWRAM_DATA u16 gBattle_BG0_Y = 0;
EWRAM_DATA u16 gBattle_BG1_X = 0;
EWRAM_DATA u16 gBattle_BG1_Y = 0;
EWRAM_DATA u16 gBattle_BG2_X = 0;
EWRAM_DATA u16 gBattle_BG2_Y = 0;
EWRAM_DATA u16 gBattle_BG3_X = 0;
EWRAM_DATA u16 gBattle_BG3_Y = 0;
EWRAM_DATA u16 gBattle_WIN0H = 0;
EWRAM_DATA u16 gBattle_WIN0V = 0;
EWRAM_DATA u16 gBattle_WIN1H = 0;
EWRAM_DATA u16 gBattle_WIN1V = 0;
EWRAM_DATA u8 gDisplayedStringBattle[478] = {0};    // Increased in size to fit Brock's defeat text, which is 477 characters long (PewterCity_Gym_Text_BrockDefeat)
EWRAM_DATA u8 gBattleTextBuff1[TEXT_BUFF_ARRAY_COUNT] = {0};
EWRAM_DATA u8 gBattleTextBuff2[TEXT_BUFF_ARRAY_COUNT] = {0};
EWRAM_DATA u8 gBattleTextBuff3[TEXT_BUFF_ARRAY_COUNT + 13] = {0};   // expanded for stupidly long z move names
EWRAM_DATA u32 gBattleTypeFlags = 0;
EWRAM_DATA u8 gBattleEnvironment = 0;
EWRAM_DATA struct MultiPartnerMenuPokemon gMultiPartnerParty[MULTI_PARTY_SIZE] = {0};
EWRAM_DATA static struct MultiPartnerMenuPokemon *sMultiPartnerPartyBuffer = NULL;
EWRAM_DATA u8 *gBattleAnimBgTileBuffer = NULL;
EWRAM_DATA u8 *gBattleAnimBgTilemapBuffer = NULL;
EWRAM_DATA u32 gBattleControllerExecFlags = 0;
EWRAM_DATA u8 gBattlersCount = 0;
EWRAM_DATA u16 gBattlerPartyIndexes[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gBattlerPositions[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gActionsByTurnOrder[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gBattlerByTurnOrder[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gBattlersBySpeed[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gCurrentTurnActionNumber = 0;
EWRAM_DATA u8 gCurrentActionFuncId = 0;
EWRAM_DATA struct BattlePokemon gBattleMons[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gBattlerSpriteIds[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gCurrMovePos = 0;
EWRAM_DATA u8 gChosenMovePos = 0;
EWRAM_DATA u16 gCurrentMove = 0;
EWRAM_DATA u16 gChosenMove = 0;
EWRAM_DATA u16 gCalledMove = 0;
EWRAM_DATA s32 gBideDmg[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gLastUsedItem = 0;
EWRAM_DATA enum Ability gLastUsedAbility = 0;
EWRAM_DATA u8 gBattlerAttacker = 0;
EWRAM_DATA u8 gBattlerTarget = 0;
EWRAM_DATA u8 gBattlerFainted = 0;
EWRAM_DATA u8 gEffectBattler = 0;
EWRAM_DATA u8 gPotentialItemEffectBattler = 0;
EWRAM_DATA u8 gAbsentBattlerFlags = 0;
EWRAM_DATA u8 gMultiHitCounter = 0;
EWRAM_DATA const u8 *gBattlescriptCurrInstr = NULL;
EWRAM_DATA u8 gChosenActionByBattler[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA const u8 *gSelectionBattleScripts[MAX_BATTLERS_COUNT] = {NULL};
// EWRAM_DATA const u8 *gPalaceSelectionBattleScripts[MAX_BATTLERS_COUNT] = {NULL};
EWRAM_DATA u16 gLastPrintedMoves[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gLastMoves[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gLastLandedMoves[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gLastHitByType[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gLastUsedMoveType[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gLastResultingMoves[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gLockedMoves[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gLastUsedMove = 0;
EWRAM_DATA u8 gLastHitBy[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gChosenMoveByBattler[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u32 gHitMarker = 0;
EWRAM_DATA u8 gBideTarget[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u32 gSideStatuses[NUM_BATTLE_SIDES] = {0};
EWRAM_DATA struct SideTimer gSideTimers[NUM_BATTLE_SIDES] = {0};
EWRAM_DATA u16 gPauseCounterBattle = 0;
EWRAM_DATA u16 gPaydayMoney = 0;
EWRAM_DATA u8 gBattleCommunication[BATTLE_COMMUNICATION_ENTRIES_COUNT] = {0};
EWRAM_DATA u8 gBattleOutcome = 0;
EWRAM_DATA struct ProtectStruct gProtectStructs[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA struct SpecialStatus gSpecialStatuses[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u16 gBattleWeather = 0;
EWRAM_DATA u16 gIntroSlideFlags = 0;
EWRAM_DATA u8 gSentPokesToOpponent[2] = {0};
EWRAM_DATA struct BattleEnigmaBerry gEnigmaBerries[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA struct BattleScripting gBattleScripting = {0};
EWRAM_DATA struct BattleStruct *gBattleStruct = NULL;
EWRAM_DATA struct StartingStatuses gStartingStatuses = {0};
EWRAM_DATA struct AiThinkingStruct *gAiThinkingStruct = NULL;
EWRAM_DATA struct AiLogicData *gAiLogicData = NULL;
EWRAM_DATA struct AiPartyData *gAiPartyData = NULL;
EWRAM_DATA struct BattleHistory *gBattleHistory = NULL;
EWRAM_DATA struct AiBattleData *gAiBattleData = NULL;

EWRAM_DATA u8 *gLinkBattleSendBuffer = NULL;
EWRAM_DATA u8 *gLinkBattleRecvBuffer = NULL;
EWRAM_DATA struct BattleResources *gBattleResources = NULL;
EWRAM_DATA u8 gActionSelectionCursor[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gMoveSelectionCursor[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gBattlerStatusSummaryTaskId[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gBattlerInMenuId = 0;
EWRAM_DATA bool8 gDoingBattleAnim = FALSE;
EWRAM_DATA u32 gTransformedPersonalities[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA bool8 gTransformedShininess[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA u8 gPlayerDpadHoldFrames = 0;
EWRAM_DATA struct BattleSpriteData *gBattleSpritesDataPtr = NULL;
EWRAM_DATA struct MonSpritesGfx *gMonSpritesGfxPtr = NULL;
EWRAM_DATA u16 gBattleMovePower = 0;
EWRAM_DATA u16 gMoveToLearn = 0;
EWRAM_DATA u32 gFieldStatuses = 0;
EWRAM_DATA struct FieldTimer gFieldTimers = {0};
EWRAM_DATA u16 gBattleTurnCounter = 0;
EWRAM_DATA u8 gBattlerAbility = 0;
EWRAM_DATA struct QueuedStatBoost gQueuedStatBoosts[MAX_BATTLERS_COUNT] = {0};
EWRAM_DATA bool8 gHasFetchedBall = FALSE;
EWRAM_DATA u16 gLastUsedBall = 0;
EWRAM_DATA u16 gLastThrownBall = 0;
EWRAM_DATA u16 gBallToDisplay = 0;
EWRAM_DATA bool8 gLastUsedBallMenuPresent = FALSE;
EWRAM_DATA u8 gPartyCriticalHits[PARTY_SIZE] = {0};
EWRAM_DATA static u8 sTriedEvolving = 0;
EWRAM_DATA u8 gCategoryIconSpriteId = 0;

COMMON_DATA MainCallback gPreBattleCallback1 = NULL;
COMMON_DATA void (*gBattleMainFunc)(void) = NULL;
COMMON_DATA struct BattleResults gBattleResults = {0};
COMMON_DATA u8 gLeveledUpInBattle = 0;
COMMON_DATA u8 gHealthboxSpriteIds[MAX_BATTLERS_COUNT] = {0};
COMMON_DATA u8 gMultiUsePlayerCursor = 0;
COMMON_DATA u8 gNumberOfMovesToChoose = 0;

static const struct ScanlineEffectParams sIntroScanlineParams16Bit =
{
    &REG_BG3HOFS, SCANLINE_EFFECT_DMACNT_16BIT, 1
};

static const u8 sText_ShedinjaJpnName[] = _("ヌケニン"); // Nukenin

const struct OamData gOamData_BattleSpriteOpponentSide =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

const struct OamData gOamData_BattleSpritePlayerSide =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 2,
    .affineParam = 0,
};

static const s8 sCenterToCornerVecXs[8] ={-32, -16, -16, -32, -32};

#include "data/types_info.h"

// [TRAINER_CLASS_XYZ] = { _("name"), <money=5>, <ball=BALL_POKE> }
const struct TrainerClass gTrainerClasses[TRAINER_CLASS_COUNT] =
{
    [TRAINER_CLASS_PKMN_TRAINER_1] =  { _("{PKMN} TRAINER") },
    [TRAINER_CLASS_PKMN_TRAINER_2] =  { _("{PKMN} TRAINER") },
    [TRAINER_CLASS_AQUA_LEADER] =     { _("AQUA LEADER"), 20, BALL_MASTER },
    [TRAINER_CLASS_TEAM_AQUA] =       { _("TEAM AQUA"), 5 },
    [TRAINER_CLASS_RS_AROMA_LADY] =   { _("AROMA LADY"), 10 },
    [TRAINER_CLASS_RS_RUIN_MANIAC] =  { _("RUIN MANIAC"), 15 },
    [TRAINER_CLASS_INTERVIEWER] =     { _("INTERVIEWER"), 12 },
    [TRAINER_CLASS_RS_TUBER_F] =      { _("TUBER"), 1 },
    [TRAINER_CLASS_RS_TUBER_M] =      { _("TUBER"), 1 },
    [TRAINER_CLASS_RS_COOLTRAINER] =  { _("COOLTRAINER"), 12, BALL_ULTRA },
    [TRAINER_CLASS_HEX_MANIAC] =      { _("HEX MANIAC"), 6 },
    [TRAINER_CLASS_RS_LADY] =         { _("LADY"), 50 },
    [TRAINER_CLASS_RS_BEAUTY] =       { _("BEAUTY"), 20 },
    [TRAINER_CLASS_RICH_BOY] =        { _("RICH BOY"), 50 },
    [TRAINER_CLASS_RS_POKEMANIAC] =   { _("POKéMANIAC"), 15 },
    [TRAINER_CLASS_RS_SWIMMER_M] =    { _("SWIMMER♂"), 2 },
    [TRAINER_CLASS_RS_BLACK_BELT] =   { _("BLACK BELT"), 8 },
    [TRAINER_CLASS_GUITARIST] =       { _("GUITARIST"), 8 },
    [TRAINER_CLASS_KINDLER] =         { _("KINDLER"), 8 },
    [TRAINER_CLASS_RS_CAMPER] =       { _("CAMPER"), 4 },
    [TRAINER_CLASS_BUG_MANIAC] =      { _("BUG MANIAC"), 15 },
    [TRAINER_CLASS_RS_PSYCHIC] =      { _("PSYCHIC"), 6 },
    [TRAINER_CLASS_RS_GENTLEMAN] =    { _("GENTLEMAN"), 20, BALL_LUXURY },
    [TRAINER_CLASS_RS_ELITE_FOUR] =   { _("ELITE FOUR"), 25, BALL_ULTRA },
    [TRAINER_CLASS_RS_LEADER] =       { _("LEADER"), 25 },
    [TRAINER_CLASS_SCHOOL_KID] =      { _("SCHOOL KID"), 5 },
    [TRAINER_CLASS_SR_AND_JR] =       { _("SR. AND JR."), 4 },
    [TRAINER_CLASS_POKEFAN] =         { _("POKéFAN"), 20 },
    [TRAINER_CLASS_EXPERT] =          { _("EXPERT"), 10 },
    [TRAINER_CLASS_RS_YOUNGSTER] =    { _("YOUNGSTER"), 4 },
    [TRAINER_CLASS_RS_CHAMPION] =     { _("CHAMPION"), 50 },
    [TRAINER_CLASS_RS_FISHERMAN] =    { _("FISHERMAN"), 10 },
    [TRAINER_CLASS_TRIATHLETE] =      { _("TRIATHLETE"), 10 },
    [TRAINER_CLASS_DRAGON_TAMER] =    { _("DRAGON TAMER"), 12 },
    [TRAINER_CLASS_RS_BIRD_KEEPER] =  { _("BIRD KEEPER"), 8 },
    [TRAINER_CLASS_NINJA_BOY] =       { _("NINJA BOY"), 3 },
    [TRAINER_CLASS_BATTLE_GIRL] =     { _("BATTLE GIRL"), 6 },
    [TRAINER_CLASS_PARASOL_LADY] =    { _("PARASOL LADY"), 10 },
    [TRAINER_CLASS_RS_SWIMMER_F] =    { _("SWIMMER♀"), 2, BALL_DIVE },
    [TRAINER_CLASS_RS_PICNICKER] =    { _("PICNICKER"), 4 },
    [TRAINER_CLASS_RS_TWINS] =        { _("TWINS"), 3 },
    [TRAINER_CLASS_RS_SAILOR] =       { _("SAILOR"), 8 },
    [TRAINER_CLASS_BOARDER] =         { _("BOARDER") },
    [TRAINER_CLASS_COLLECTOR] =       { _("COLLECTOR"), 15, BALL_PREMIER },
    [TRAINER_CLASS_PKMN_TRAINER] =    { _("{PKMN} TRAINER"), 15 },
    [TRAINER_CLASS_RS_PKMN_BREEDER] = { _("{PKMN} BREEDER"), 10 },
    [TRAINER_CLASS_RS_PKMN_RANGER] =  { _("{PKMN} RANGER"), 12 },
    [TRAINER_CLASS_MAGMA_LEADER] =    { _("MAGMA LEADER"), 20, BALL_MASTER },
    [TRAINER_CLASS_TEAM_MAGMA] =      { _("TEAM MAGMA"), 5 },
    [TRAINER_CLASS_RS_LASS] =         { _("LASS"), 4 },
    [TRAINER_CLASS_RS_BUG_CATCHER] =  { _("BUG CATCHER"), 4 },
    [TRAINER_CLASS_RS_HIKER] =        { _("HIKER"), 10 },
    [TRAINER_CLASS_RS_YOUNG_COUPLE] = { _("YOUNG COUPLE"), 8 },
    [TRAINER_CLASS_OLD_COUPLE] =      { _("OLD COUPLE"), 10 },
    [TRAINER_CLASS_RS_SIS_AND_BRO] =  { _("SIS AND BRO"), 3 },
    [TRAINER_CLASS_AQUA_ADMIN] =      { _("AQUA ADMIN"), 10 },
    [TRAINER_CLASS_MAGMA_ADMIN] =     { _("MAGMA ADMIN"), 10 },
    [TRAINER_CLASS_YOUNGSTER] =       { _("YOUNGSTER"), 4 },
    [TRAINER_CLASS_BUG_CATCHER] =     { _("BUG CATCHER"), 3 },
    [TRAINER_CLASS_LASS] =            { _("LASS"), 4 },
    [TRAINER_CLASS_SAILOR] =          { _("SAILOR"), 8 },
    [TRAINER_CLASS_CAMPER] =          { _("CAMPER"), 5 },
    [TRAINER_CLASS_PICNICKER] =       { _("PICNICKER"), 5 },
    [TRAINER_CLASS_POKEMANIAC] =      { _("POKéMANIAC"), 12 },
    [TRAINER_CLASS_SUPER_NERD] =      { _("SUPER NERD"), 6 },
    [TRAINER_CLASS_HIKER] =           { _("HIKER"), 9 },
    [TRAINER_CLASS_BIKER] =           { _("BIKER"), 5 },
    [TRAINER_CLASS_BURGLAR] =         { _("BURGLAR"), 22 },
    [TRAINER_CLASS_ENGINEER] =        { _("ENGINEER"), 12 },
    [TRAINER_CLASS_FISHERMAN] =       { _("FISHERMAN"), 9, B_TRAINER_CLASS_POKE_BALLS >= GEN_8 ? BALL_DIVE : BALL_LURE },
    [TRAINER_CLASS_SWIMMER_M] =       { _("SWIMMER♂"), 1 },
    [TRAINER_CLASS_CUE_BALL] =        { _("CUE BALL"), 6 },
    [TRAINER_CLASS_GAMER] =           { _("GAMER"), 18 },
    [TRAINER_CLASS_BEAUTY] =          { _("BEAUTY"), 18 },
    [TRAINER_CLASS_SWIMMER_F] =       { _("SWIMMER♀"), 1, BALL_DIVE },
    [TRAINER_CLASS_PSYCHIC] =         { _("PSYCHIC"), 5 },
    [TRAINER_CLASS_ROCKER] =          { _("ROCKER"), 6 },
    [TRAINER_CLASS_JUGGLER] =         { _("JUGGLER"), 10 },
    [TRAINER_CLASS_TAMER] =           { _("TAMER"), 10 },
    [TRAINER_CLASS_BIRD_KEEPER] =     { _("BIRD KEEPER"), 6 },
    [TRAINER_CLASS_BLACK_BELT] =      { _("BLACK BELT"), 6, BALL_ULTRA },
    [TRAINER_CLASS_RIVAL_EARLY] =     { _("RIVAL"), 4 },
    [TRAINER_CLASS_SCIENTIST] =       { _("SCIENTIST"), 12 },
    [TRAINER_CLASS_BOSS] =            { _("BOSS"), 25 },
    [TRAINER_CLASS_LEADER] =          { _("LEADER"), 25 },
    [TRAINER_CLASS_TEAM_ROCKET] =     { _("TEAM ROCKET"), 8 },
    [TRAINER_CLASS_COOLTRAINER] =     { _("COOLTRAINER"), 9, BALL_ULTRA },
    [TRAINER_CLASS_ELITE_FOUR] =      { _("ELITE FOUR"), 25, BALL_ULTRA },
    [TRAINER_CLASS_GENTLEMAN] =       { _("GENTLEMAN"), 18, BALL_LUXURY },
    [TRAINER_CLASS_RIVAL_LATE] =      { _("RIVAL"), 9 },
    [TRAINER_CLASS_CHAMPION] =        { _("CHAMPION"), 25 },
    [TRAINER_CLASS_CHANNELER] =       { _("CHANNELER"), 8 },
    [TRAINER_CLASS_TWINS] =           { _("TWINS"), 3 },
    [TRAINER_CLASS_COOL_COUPLE] =     { _("COOL COUPLE"), 6 },
    [TRAINER_CLASS_YOUNG_COUPLE] =    { _("YOUNG COUPLE"), 7 },
    [TRAINER_CLASS_CRUSH_KIN] =       { _("CRUSH KIN"), 6 },
    [TRAINER_CLASS_SIS_AND_BRO] =     { _("SIS AND BRO"), 1 },
    [TRAINER_CLASS_PKMN_PROF] =       { _("{PKMN} PROF."), 25 },
    [TRAINER_CLASS_PLAYER] =          { _("{PKMN} TRAINER"), 1 },
    [TRAINER_CLASS_CRUSH_GIRL] =      { _("CRUSH GIRL"), 6 },
    [TRAINER_CLASS_TUBER] =           { _("TUBER"), 1 },
    [TRAINER_CLASS_PKMN_BREEDER] =    { _("{PKMN} BREEDER"), 7, B_TRAINER_CLASS_POKE_BALLS >= GEN_8 ? BALL_HEAL : BALL_FRIEND },
    [TRAINER_CLASS_PKMN_RANGER] =     { _("{PKMN} RANGER"), 9 },
    [TRAINER_CLASS_AROMA_LADY] =      { _("AROMA LADY"), 7 },
    [TRAINER_CLASS_RUIN_MANIAC] =     { _("RUIN MANIAC"), 12 },
    [TRAINER_CLASS_LADY] =            { _("LADY"), 50 },
    [TRAINER_CLASS_PAINTER] =         { _("PAINTER"), 4 },
};

static void (*const sTurnActionsFuncsTable[])(void) =
{
    [B_ACTION_USE_MOVE]               = HandleAction_UseMove,
    [B_ACTION_USE_ITEM]               = HandleAction_UseItem,
    [B_ACTION_SWITCH]                 = HandleAction_Switch,
    [B_ACTION_RUN]                    = HandleAction_Run,
    [B_ACTION_SAFARI_WATCH_CAREFULLY] = HandleAction_WatchesCarefully,
    [B_ACTION_SAFARI_BALL]            = HandleAction_SafariZoneBallThrow,
    [B_ACTION_SAFARI_BAIT]            = HandleAction_ThrowBait,
    [B_ACTION_SAFARI_GO_NEAR]         = HandleAction_ThrowRock,
    [B_ACTION_SAFARI_RUN]             = HandleAction_SafariZoneRun,
    [B_ACTION_OLDMAN_THROW]           = HandleAction_OldManBallThrow,
    [B_ACTION_EXEC_SCRIPT]            = HandleAction_RunBattleScript,
    [B_ACTION_TRY_FINISH]             = HandleAction_TryFinish,
    [B_ACTION_FINISHED]               = HandleAction_ActionFinished,
    [B_ACTION_NOTHING_FAINTED]        = HandleAction_NothingIsFainted,
    [B_ACTION_THROW_BALL]             = HandleAction_ThrowBall,
};

static void (*const sEndTurnFuncsTable[])(void) =
{
    [0]                           = HandleEndTurn_ContinueBattle,
    [B_OUTCOME_WON]               = HandleEndTurn_BattleWon,
    [B_OUTCOME_LOST]              = HandleEndTurn_BattleLost,
    [B_OUTCOME_DREW]              = HandleEndTurn_BattleLost,
    [B_OUTCOME_RAN]               = HandleEndTurn_RanFromBattle,
    [B_OUTCOME_PLAYER_TELEPORTED] = HandleEndTurn_FinishBattle,
    [B_OUTCOME_MON_FLED]          = HandleEndTurn_MonFled,
    [B_OUTCOME_CAUGHT]            = HandleEndTurn_FinishBattle,
    [B_OUTCOME_NO_SAFARI_BALLS]   = HandleEndTurn_FinishBattle,
    [B_OUTCOME_FORFEITED]         = HandleEndTurn_FinishBattle,
    [B_OUTCOME_MON_TELEPORTED]    = HandleEndTurn_FinishBattle,
};

const u8 gStatusConditionString_PoisonJpn[] = _("どく$$$$$");
const u8 gStatusConditionString_SleepJpn[] = _("ねむり$$$$");
const u8 gStatusConditionString_ParalysisJpn[] = _("まひ$$$$$");
const u8 gStatusConditionString_BurnJpn[] = _("やけど$$$$");
const u8 gStatusConditionString_IceJpn[] = _("こおり$$$$");
const u8 gStatusConditionString_ConfusionJpn[] = _("こんらん$$$");
const u8 gStatusConditionString_LoveJpn[] = _("メロメロ$$$");

const u8 *const gStatusConditionStringsTable[][2] =
{
    {gStatusConditionString_PoisonJpn, gText_Poison},
    {gStatusConditionString_SleepJpn, gText_Sleep},
    {gStatusConditionString_ParalysisJpn, gText_Paralysis},
    {gStatusConditionString_BurnJpn, gText_Burn},
    {gStatusConditionString_IceJpn, gText_Ice},
    {gStatusConditionString_ConfusionJpn, gText_Confusion},
    {gStatusConditionString_LoveJpn, gText_Love}
};

void CB2_InitBattle(void)
{
    if (!gTestRunnerEnabled)
        MoveSaveBlocks_ResetHeap();
    AllocateBattleResources();
    AllocateBattleSpritesData();
    AllocateMonSpritesGfx();
    // RecordedBattle_ClearFrontierPassFlag();

#if T_SHOULD_RUN_MOVE_ANIM
    gLoadFail = FALSE;
#endif // T_SHOULD_RUN_MOVE_ANIM

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI && gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_RECORDED)
        {
            CB2_InitBattleInternal();
        }
        else if (!(gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER))
        {
            HandleLinkBattleSetup();
            SetMainCallback2(CB2_PreInitMultiBattle);
        }
        else
        {
            SetMainCallback2(CB2_PreInitIngamePlayerPartnerBattle);
        }
        gBattleCommunication[MULTIUSE_STATE] = 0;
    }
    else
    {
        CB2_InitBattleInternal();
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK)))
        {
            if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                    SetHelpContext(HELPCONTEXT_TRAINER_BATTLE_DOUBLE);
                else
                    SetHelpContext(HELPCONTEXT_TRAINER_BATTLE_SINGLE);
            }
            else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
            {
                SetHelpContext(HELPCONTEXT_SAFARI_BATTLE);
            }
            else
            {
                SetHelpContext(HELPCONTEXT_WILD_BATTLE);
            }
        }
    }
}

static void CB2_InitBattleInternal(void)
{
    s32 i;

    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);

    CpuFill32(0, (void *)(VRAM), VRAM_SIZE);

    SetGpuReg(REG_OFFSET_MOSAIC, 0);
    SetGpuReg(REG_OFFSET_WIN0H, DISPLAY_WIDTH);
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(DISPLAY_HEIGHT / 2, DISPLAY_HEIGHT / 2 + 1));
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, 0);

    gBattle_WIN0H = DISPLAY_WIDTH;

    if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER && gPartnerTrainerId < TRAINER_PARTNER(PARTNER_NONE))
    {
        gBattle_WIN0V = DISPLAY_HEIGHT - 1;
        gBattle_WIN1H = DISPLAY_WIDTH;
        gBattle_WIN1V = 32;
    }
    else
    {
        gBattle_WIN0V = WIN_RANGE(DISPLAY_HEIGHT / 2, DISPLAY_HEIGHT / 2 + 1);
        ScanlineEffect_Clear();
        if (B_FAST_INTRO_NO_SLIDE == FALSE && !gTestRunnerHeadless)
        {
            for (i = 0; i < DISPLAY_HEIGHT / 2; i++)
            {
                gScanlineEffectRegBuffers[0][i] = 0xF0;
                gScanlineEffectRegBuffers[1][i] = 0xF0;
            }

            for (; i < DISPLAY_HEIGHT; i++)
            {
                gScanlineEffectRegBuffers[0][i] = 0xFF10;
                gScanlineEffectRegBuffers[1][i] = 0xFF10;
            }

            ScanlineEffect_SetParams(sIntroScanlineParams16Bit);
        }
    }

    ResetPaletteFade();
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 0;
    gBattle_BG3_Y = 0;

    if (!DEBUG_OVERWORLD_MENU || (DEBUG_OVERWORLD_MENU && !gIsDebugBattle))
    {
        gBattleEnvironment = BattleSetup_GetEnvironmentId();
    }
    if (gBattleTypeFlags & BATTLE_TYPE_RECORDED)
        gBattleEnvironment = BATTLE_ENVIRONMENT_BUILDING;
    if (TestRunner_Battle_GetForcedEnvironment())
        gBattleEnvironment = TestRunner_Battle_GetForcedEnvironment() - 1;

    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && !(gBattleTypeFlags & (BATTLE_TYPE_FRONTIER
                                                                        | BATTLE_TYPE_EREADER_TRAINER
                                                                        | BATTLE_TYPE_TRAINER_HILL
                                                                        | BATTLE_TYPE_RECORDED)))
    {
        switch (GetTrainerBattleType(TRAINER_BATTLE_PARAM.opponentA))
        {
        case TRAINER_BATTLE_TYPE_SINGLES:
            break;
        case TRAINER_BATTLE_TYPE_DOUBLES:
            gBattleTypeFlags |= BATTLE_TYPE_DOUBLE;
            break;
        }
    }

    InitBattleBgsVideo();
    LoadBattleTextboxAndBackground();
    ResetSpriteData();
    ResetTasks();
    if (B_FAST_INTRO_NO_SLIDE == FALSE && !gTestRunnerHeadless)
        DrawBattleEntryBackground();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = MAX_BATTLERS_COUNT;
    SetVBlankCallback(VBlankCB_Battle);
    SetUpBattleVars();

    if ((IsMultibattleTest() && gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
    || (gBattleTypeFlags & BATTLE_TYPE_MULTI && gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
    || (gBattleTypeFlags & BATTLE_TYPE_MULTI && gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER))
        SetMainCallback2(CB2_HandleStartMultiPartnerBattle);
    else if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        SetMainCallback2(CB2_HandleStartMultiBattle);
    else
        SetMainCallback2(CB2_HandleStartBattle);

    if (!DEBUG_OVERWORLD_MENU || (DEBUG_OVERWORLD_MENU && !gIsDebugBattle))
    {
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED)))
        {
            CreateNPCTrainerParty(&gEnemyParty[0], TRAINER_BATTLE_PARAM.opponentA, TRUE);
            if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS && !BATTLE_TWO_VS_ONE_OPPONENT)
                CreateNPCTrainerParty(&gEnemyParty[PARTY_SIZE / 2], TRAINER_BATTLE_PARAM.opponentB, FALSE);
            SetWildMonHeldItem();
            CalculateEnemyPartyCount();
        }
    }

    gMain.inBattle = TRUE;
    // gSaveBlock2Ptr->frontier.disableRecordBattle = FALSE;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        AdjustFriendship(&gPlayerParty[i], FRIENDSHIP_EVENT_LEAGUE_BATTLE);

        // Apply party-wide start-of-battle form changes for both sides.
        TryFormChange(i, B_SIDE_PLAYER, FORM_CHANGE_BEGIN_BATTLE);
        TryFormChange(i, B_SIDE_OPPONENT, FORM_CHANGE_BEGIN_BATTLE);
    }

    if (TESTING)
    {
        gPlayerPartyCount = CalculatePartyCount(gPlayerParty);
        gEnemyPartyCount = CalculatePartyCount(gEnemyParty);
    }

    gBattleCommunication[MULTIUSE_STATE] = 0;
}

#define BUFFER_PARTY_VS_SCREEN_STATUS(party, flags, i)                      \
    for ((i) = 0; (i) < PARTY_SIZE; (i)++)                                  \
    {                                                                       \
        u16 species = GetMonData(&(party)[(i)], MON_DATA_SPECIES_OR_EGG);   \
        u16 hp = GetMonData(&(party)[(i)], MON_DATA_HP);                    \
        u32 status = GetMonData(&(party)[(i)], MON_DATA_STATUS);            \
                                                                            \
        if (species == SPECIES_NONE)                                        \
            continue;                                                       \
                                                                            \
        /* Is healthy mon? */                                               \
        if (species != SPECIES_EGG && hp != 0 && status == 0)               \
            (flags) |= 1 << (i) * 2;                                        \
                                                                            \
        if (species == SPECIES_NONE) /* Redundant */                        \
            continue;                                                       \
                                                                            \
        /* Is Egg or statused? */                                           \
        if (hp != 0 && (species == SPECIES_EGG || status != 0))             \
            (flags) |= 2 << (i) * 2;                                        \
                                                                            \
        if (species == SPECIES_NONE) /* Redundant */                        \
            continue;                                                       \
                                                                            \
        /* Is fainted? */                                                   \
        if (species != SPECIES_EGG && hp == 0)                              \
            (flags) |= 3 << (i) * 2;                                        \
    }

// For Vs Screen at link battle start
static void BufferPartyVsScreenHealth_AtStart(void)
{
    u16 flags = 0;
    s32 i;

    BUFFER_PARTY_VS_SCREEN_STATUS(gPlayerParty, flags, i);
    gBattleStruct->multiBuffer.linkBattlerHeader.vsScreenHealthFlagsLo = flags;
    *(&gBattleStruct->multiBuffer.linkBattlerHeader.vsScreenHealthFlagsHi) = flags >> 8;
    // gBattleStruct->multiBuffer.linkBattlerHeader.vsScreenHealthFlagsHi |= FlagGet(FLAG_SYS_FRONTIER_PASS) << 7;
}

static void SetPlayerBerryDataInBattleStruct(void)
{
    s32 i;
    struct BattleStruct *battleStruct = gBattleStruct;
    struct BattleEnigmaBerry *battleBerry = &battleStruct->multiBuffer.linkBattlerHeader.battleEnigmaBerry;

    if (IsEnigmaBerryValid() == TRUE)
    {
    #if FREE_ENIGMA_BERRY == FALSE
        for (i = 0; i < BERRY_NAME_LENGTH; i++)
            battleBerry->name[i] = gSaveBlock1Ptr->enigmaBerry.berry.name[i];
        battleBerry->name[i] = EOS;

        for (i = 0; i < BERRY_ITEM_EFFECT_COUNT; i++)
            battleBerry->itemEffect[i] = gSaveBlock1Ptr->enigmaBerry.itemEffect[i];

        battleBerry->holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
        battleBerry->holdEffectParam = gSaveBlock1Ptr->enigmaBerry.holdEffectParam;
    #endif //FREE_ENIGMA_BERRY
    }
    else
    {
        const struct Berry *berryData = GetBerryInfo(ItemIdToBerryType(ITEM_ENIGMA_BERRY_E_READER));

        for (i = 0; i < BERRY_NAME_LENGTH; i++)
            battleBerry->name[i] = berryData->name[i];
        battleBerry->name[i] = EOS;

        for (i = 0; i < BERRY_ITEM_EFFECT_COUNT; i++)
            battleBerry->itemEffect[i] = 0;

        battleBerry->holdEffect = HOLD_EFFECT_NONE;
        battleBerry->holdEffectParam = 0;
    }
}

static void SetAllPlayersBerryData(void)
{
    s32 i, j;

    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        if (IsEnigmaBerryValid() == TRUE)
        {
        #if FREE_ENIGMA_BERRY == FALSE
            for (i = 0; i < BERRY_NAME_LENGTH; i++)
            {
                gEnigmaBerries[0].name[i] = gSaveBlock1Ptr->enigmaBerry.berry.name[i];
                gEnigmaBerries[2].name[i] = gSaveBlock1Ptr->enigmaBerry.berry.name[i];
            }
            gEnigmaBerries[0].name[i] = EOS;
            gEnigmaBerries[2].name[i] = EOS;

            for (i = 0; i < BERRY_ITEM_EFFECT_COUNT; i++)
            {
                gEnigmaBerries[0].itemEffect[i] = gSaveBlock1Ptr->enigmaBerry.itemEffect[i];
                gEnigmaBerries[2].itemEffect[i] = gSaveBlock1Ptr->enigmaBerry.itemEffect[i];
            }

            gEnigmaBerries[0].holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
            gEnigmaBerries[2].holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
            gEnigmaBerries[0].holdEffectParam = gSaveBlock1Ptr->enigmaBerry.holdEffectParam;
            gEnigmaBerries[2].holdEffectParam = gSaveBlock1Ptr->enigmaBerry.holdEffectParam;
        #endif //FREE_ENIGMA_BERRY
        }
        else
        {
            const struct Berry *berryData = GetBerryInfo(ItemIdToBerryType(ITEM_ENIGMA_BERRY_E_READER));

            for (i = 0; i < BERRY_NAME_LENGTH; i++)
            {
                gEnigmaBerries[0].name[i] = berryData->name[i];
                gEnigmaBerries[2].name[i] = berryData->name[i];
            }
            gEnigmaBerries[0].name[i] = EOS;
            gEnigmaBerries[2].name[i] = EOS;

            for (i = 0; i < BERRY_ITEM_EFFECT_COUNT; i++)
            {
                gEnigmaBerries[0].itemEffect[i] = 0;
                gEnigmaBerries[2].itemEffect[i] = 0;
            }

            gEnigmaBerries[0].holdEffect = HOLD_EFFECT_NONE;
            gEnigmaBerries[2].holdEffect = HOLD_EFFECT_NONE;
            gEnigmaBerries[0].holdEffectParam = 0;
            gEnigmaBerries[2].holdEffectParam = 0;
        }
    }
    else
    {
        s32 numPlayers;
        struct BattleEnigmaBerry *src;
        u32 battler;

        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                numPlayers = 2;
            else
                numPlayers = 4;

            for (i = 0; i < numPlayers; i++)
            {
                src = (struct BattleEnigmaBerry *)(gBlockRecvBuffer[i] + 2);
                battler = gLinkPlayers[i].id;

                for (j = 0; j < BERRY_NAME_LENGTH; j++)
                    gEnigmaBerries[battler].name[j] = src->name[j];
                gEnigmaBerries[battler].name[j] = EOS;

                for (j = 0; j < BERRY_ITEM_EFFECT_COUNT; j++)
                    gEnigmaBerries[battler].itemEffect[j] = src->itemEffect[j];

                gEnigmaBerries[battler].holdEffect = src->holdEffect;
                gEnigmaBerries[battler].holdEffectParam = src->holdEffectParam;
            }
        }
        else
        {
            for (i = 0; i < 2; i++)
            {
                src = (struct BattleEnigmaBerry *)(gBlockRecvBuffer[i] + 2);

                for (j = 0; j < BERRY_NAME_LENGTH; j++)
                {
                    gEnigmaBerries[i].name[j] = src->name[j];
                    gEnigmaBerries[i + 2].name[j] = src->name[j];
                }
                gEnigmaBerries[i].name[j] = EOS;
                gEnigmaBerries[i + 2].name[j] = EOS;

                for (j = 0; j < BERRY_ITEM_EFFECT_COUNT; j++)
                {
                    gEnigmaBerries[i].itemEffect[j] = src->itemEffect[j];
                    gEnigmaBerries[i + 2].itemEffect[j] = src->itemEffect[j];
                }

                gEnigmaBerries[i].holdEffect = src->holdEffect;
                gEnigmaBerries[i + 2].holdEffect = src->holdEffect;
                gEnigmaBerries[i].holdEffectParam = src->holdEffectParam;
                gEnigmaBerries[i + 2].holdEffectParam = src->holdEffectParam;
            }
        }
    }
}

// This was inlined in Ruby/Sapphire
static void FindLinkBattleMaster(u8 numPlayers, u8 multiPlayerId)
{
    u8 found = 0;

    // If player 1 is playing the minimum version, player 1 is master.
    if (gBlockRecvBuffer[0][0] == 0x100)
    {
        if (multiPlayerId == 0)
            gBattleTypeFlags |= BATTLE_TYPE_IS_MASTER | BATTLE_TYPE_TRAINER;
        else
            gBattleTypeFlags |= BATTLE_TYPE_TRAINER;
        found++;
    }

    if (found == 0)
    {
        // If multiple different versions are being used, player 1 is master.
        s32 i;

        for (i = 0; i < numPlayers; i++)
        {
            if (gBlockRecvBuffer[0][0] != gBlockRecvBuffer[i][0])
                break;
        }

        if (i == numPlayers)
        {
            if (multiPlayerId == 0)
                gBattleTypeFlags |= BATTLE_TYPE_IS_MASTER | BATTLE_TYPE_TRAINER;
            else
                gBattleTypeFlags |= BATTLE_TYPE_TRAINER;
            found++;
        }

        if (found == 0)
        {
            // Lowest index player with the highest game version is master.
            for (i = 0; i < numPlayers; i++)
            {
                if (gBlockRecvBuffer[i][0] == 0x201 && i != multiPlayerId)
                {
                    if (i < multiPlayerId)
                        break;
                }
                if (gBlockRecvBuffer[i][0] > 0x201 && i != multiPlayerId)
                    break;
            }

            if (i == numPlayers)
                gBattleTypeFlags |= BATTLE_TYPE_IS_MASTER | BATTLE_TYPE_TRAINER;
            else
                gBattleTypeFlags |= BATTLE_TYPE_TRAINER;
        }
    }
}

static void CB2_HandleStartBattle(void)
{
    u8 playerMultiplayerId;
    u8 enemyMultiplayerId;

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    playerMultiplayerId = GetMultiplayerId();
    gBattleScripting.multiplayerId = playerMultiplayerId;
    enemyMultiplayerId = playerMultiplayerId ^ BIT_SIDE;

    switch (gBattleCommunication[MULTIUSE_STATE])
    {
    case 0:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            ShowBg(0);
            ShowBg(1);
            ShowBg(2);
            ShowBg(3);
            FillAroundBattleWindows();
            gBattleCommunication[MULTIUSE_STATE] = 1;
        }
        if (gWirelessCommType)
            LoadWirelessStatusIndicatorSpriteGfx();
        break;
    case 1:
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            if (gReceivedRemoteLinkPlayers)
            {
                if (IsLinkTaskFinished())
                {
                    // 0x201
                    *(&gBattleStruct->multiBuffer.linkBattlerHeader.versionSignatureLo) = 1;
                    *(&gBattleStruct->multiBuffer.linkBattlerHeader.versionSignatureHi) = 2;
                    BufferPartyVsScreenHealth_AtStart();
                    SetPlayerBerryDataInBattleStruct();

                    if (TRAINER_BATTLE_PARAM.opponentA == TRAINER_UNION_ROOM)
                    {
                        gLinkPlayers[0].id = 0;
                        gLinkPlayers[1].id = 1;
                    }

                    SendBlock(BitmaskAllOtherLinkPlayers(), &gBattleStruct->multiBuffer.linkBattlerHeader, sizeof(gBattleStruct->multiBuffer.linkBattlerHeader));
                    gBattleCommunication[MULTIUSE_STATE] = 2;
                }
                if (gWirelessCommType)
                    CreateWirelessStatusIndicatorSprite(0, 0);
            }
        }
        else
        {
            if (!(gBattleTypeFlags & BATTLE_TYPE_RECORDED))
                gBattleTypeFlags |= BATTLE_TYPE_IS_MASTER;
            gBattleCommunication[MULTIUSE_STATE] = 15;
            SetAllPlayersBerryData();
        }
        break;
    case 2:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            u8 taskId;

            ResetBlockReceivedFlags();
            FindLinkBattleMaster(2, playerMultiplayerId);
            SetAllPlayersBerryData();
            taskId = CreateTask(InitLinkBattleVsScreen, 0);
            gTasks[taskId].data[1] = 270;
            gTasks[taskId].data[2] = 90;
            gTasks[taskId].data[5] = 0;
            gTasks[taskId].data[3] = gBattleStruct->multiBuffer.linkBattlerHeader.vsScreenHealthFlagsLo | (gBattleStruct->multiBuffer.linkBattlerHeader.vsScreenHealthFlagsHi << 8);
            gTasks[taskId].data[4] = gBlockRecvBuffer[enemyMultiplayerId][1];
            // RecordedBattle_SetFrontierPassFlagFromHword(gBlockRecvBuffer[playerMultiplayerId][1]);
            // RecordedBattle_SetFrontierPassFlagFromHword(gBlockRecvBuffer[enemyMultiplayerId][1]);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 3:
        // Link battle, send/receive party Pokémon 2 at a time
        if (IsLinkTaskFinished())
        {
            // Send Pokémon 1-2
            SendBlock(BitmaskAllOtherLinkPlayers(), gPlayerParty, sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 4:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            // Recv Pokémon 1-2
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty, gBlockRecvBuffer[enemyMultiplayerId], sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 7:
        if (IsLinkTaskFinished())
        {
            // Send Pokémon 3-4
            SendBlock(BitmaskAllOtherLinkPlayers(), &gPlayerParty[2], sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 8:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            // Recv Pokémon 3-4
            ResetBlockReceivedFlags();
            memcpy(&gEnemyParty[2], gBlockRecvBuffer[enemyMultiplayerId], sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 11:
        if (IsLinkTaskFinished())
        {
            // Send Pokémon 5-6
            SendBlock(BitmaskAllOtherLinkPlayers(), &gPlayerParty[4], sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 12:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            // Recv Pokémon 5-6
            ResetBlockReceivedFlags();
            memcpy(&gEnemyParty[4], gBlockRecvBuffer[enemyMultiplayerId], sizeof(struct Pokemon) * 2);

            TryCorrectShedinjaLanguage(&gEnemyParty[0]);
            TryCorrectShedinjaLanguage(&gEnemyParty[1]);
            TryCorrectShedinjaLanguage(&gEnemyParty[2]);
            TryCorrectShedinjaLanguage(&gEnemyParty[3]);
            TryCorrectShedinjaLanguage(&gEnemyParty[4]);
            TryCorrectShedinjaLanguage(&gEnemyParty[5]);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 15:
        InitBattleControllers();
        RecordedBattle_SetTrainerInfo();
        gBattleCommunication[MULTIUSE_STATE]++;
        gBattleCommunication[SPRITES_INIT_STATE1] = 0;
        gBattleCommunication[SPRITES_INIT_STATE2] = 0;
        // if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        // {
        //     // Check if both players are using Emerald
        //     // to determine if the recorded battle rng
        //     // seed needs to be sent
        //     s32 i;
        //     for (i = 0; i < 2 && (gLinkPlayers[i].version & 0xFF) == VERSION_EMERALD; i++);

        //     if (i == 2)
        //         gBattleCommunication[MULTIUSE_STATE] = 16;
        //     else
        //         gBattleCommunication[MULTIUSE_STATE] = 18;
        // }
        // else
        // {
        //     gBattleCommunication[MULTIUSE_STATE] = 18;
        // }
        break;
    case 16:
        // Both players are using Emerald, send rng seed for recorded battle
    //     if (IsLinkTaskFinished())
    //     {
    //         SendBlock(BitmaskAllOtherLinkPlayers(), &gRecordedBattleRngSeed, sizeof(gRecordedBattleRngSeed));
    //         gBattleCommunication[MULTIUSE_STATE]++;
    //     }
    //     break;
    // case 17:
    //     // Receive rng seed for recorded battle (only read it if partner is the link master)
    //     if ((GetBlockReceivedStatus() & 3) == 3)
    //     {
    //         ResetBlockReceivedFlags();
    //         if (!(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER))
    //             memcpy(&gRecordedBattleRngSeed, gBlockRecvBuffer[enemyMultiplayerId], sizeof(gRecordedBattleRngSeed));
    //         gBattleCommunication[MULTIUSE_STATE]++;
    //     }
    //     break;
    // case 18:
        // Finish, start battle
        if (BattleInitAllSprites(&gBattleCommunication[SPRITES_INIT_STATE1], &gBattleCommunication[SPRITES_INIT_STATE2]))
        {
            gPreBattleCallback1 = gMain.callback1;
            gMain.callback1 = BattleMainCB1;
            SetMainCallback2(BattleMainCB2);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                gBattleTypeFlags |= BATTLE_TYPE_LINK_IN_BATTLE;
        }
        break;
    // Introduce short delays between sending party Pokémon for link
    case 5:
    case 9:
    case 13:
        gBattleCommunication[MULTIUSE_STATE]++;
        gBattleCommunication[1] = 1;
    case 6:
    case 10:
    case 14:
        if (--gBattleCommunication[1] == 0)
            gBattleCommunication[MULTIUSE_STATE]++;
        break;
    }
}

static void CB2_HandleStartMultiPartnerBattle(void)
{
    u8 playerMultiplayerId;
    u8 partnerMultiplayerId;

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    playerMultiplayerId = GetMultiplayerId();
    gBattleScripting.multiplayerId = playerMultiplayerId;
    partnerMultiplayerId = playerMultiplayerId ^ BIT_SIDE;

    switch (gBattleCommunication[MULTIUSE_STATE])
    {
    case 0:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            ShowBg(0);
            ShowBg(1);
            ShowBg(2);
            ShowBg(3);
            FillAroundBattleWindows();
            gBattleCommunication[MULTIUSE_STATE] = 1;
        }
        if (gWirelessCommType)
            LoadWirelessStatusIndicatorSpriteGfx();
        // fall through
    case 1:
        // if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        // {
        //     if (gReceivedRemoteLinkPlayers)
        //     {
        //         u8 language;

        //         gLinkPlayers[0].id = 0;
        //         gLinkPlayers[1].id = 2;
        //         gLinkPlayers[2].id = 1;
        //         gLinkPlayers[3].id = 3;
        //         GetFrontierTrainerName(gLinkPlayers[2].name, TRAINER_BATTLE_PARAM.opponentA);
        //         GetFrontierTrainerName(gLinkPlayers[3].name, TRAINER_BATTLE_PARAM.opponentB);
        //         GetBattleTowerTrainerLanguage(&language, TRAINER_BATTLE_PARAM.opponentA);
        //         gLinkPlayers[2].language = language;
        //         GetBattleTowerTrainerLanguage(&language, TRAINER_BATTLE_PARAM.opponentB);
        //         gLinkPlayers[3].language = language;

        //         if (IsLinkTaskFinished())
        //         {
        //             // 0x300
        //             *(&gBattleStruct->multiBuffer.linkBattlerHeader.versionSignatureLo) = 0;
        //             *(&gBattleStruct->multiBuffer.linkBattlerHeader.versionSignatureHi) = 3;
        //             BufferPartyVsScreenHealth_AtStart();
        //             SetPlayerBerryDataInBattleStruct();
        //             SendBlock(BitmaskAllOtherLinkPlayers(), &gBattleStruct->multiBuffer.linkBattlerHeader, sizeof(gBattleStruct->multiBuffer.linkBattlerHeader));
        //             gBattleCommunication[MULTIUSE_STATE] = 2;
        //         }

        //         if (gWirelessCommType)
        //             CreateWirelessStatusIndicatorSprite(0, 0);
        //     }
        // }
        // else
        // {
            if (!(gBattleTypeFlags & BATTLE_TYPE_RECORDED))
                gBattleTypeFlags |= BATTLE_TYPE_IS_MASTER;
            gBattleCommunication[MULTIUSE_STATE] = 13;
            SetAllPlayersBerryData();
        // }
        break;
    case 2:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            u8 taskId;

            ResetBlockReceivedFlags();
            FindLinkBattleMaster(2, playerMultiplayerId);
            SetAllPlayersBerryData();
            taskId = CreateTask(InitLinkBattleVsScreen, 0);
            gTasks[taskId].data[1] = 0x10E;
            gTasks[taskId].data[2] = 0x5A;
            gTasks[taskId].data[5] = 0;
            gTasks[taskId].data[3] = 0x145;
            gTasks[taskId].data[4] = 0x145;
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 3:
        // Link battle, send/receive party Pokémon in groups
        if (IsLinkTaskFinished())
        {
            // Send Pokémon 1-2
            SendBlock(BitmaskAllOtherLinkPlayers(), gPlayerParty, sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 4:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            // Recv partner's Pokémon 1-2, and copy partner's and own Pokémon into party positions
            ResetBlockReceivedFlags();
            if (gLinkPlayers[playerMultiplayerId].id != 0)
            {
                memcpy(gPlayerParty, gBlockRecvBuffer[partnerMultiplayerId], sizeof(struct Pokemon) * 2);
                memcpy(&gPlayerParty[MULTI_PARTY_SIZE], gBlockRecvBuffer[playerMultiplayerId], sizeof(struct Pokemon) * 2);
            }
            else
            {
                memcpy(gPlayerParty, gBlockRecvBuffer[playerMultiplayerId], sizeof(struct Pokemon) * 2);
                memcpy(&gPlayerParty[MULTI_PARTY_SIZE], gBlockRecvBuffer[partnerMultiplayerId], sizeof(struct Pokemon) * 2);
            }
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 5:
        if (IsLinkTaskFinished())
        {
            // Send Pokémon 3
            SendBlock(BitmaskAllOtherLinkPlayers(), &gPlayerParty[2], sizeof(struct Pokemon));
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 6:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            // Recv partner's Pokémon 3, and copy partner's and own Pokémon into party positions
            ResetBlockReceivedFlags();
            if (gLinkPlayers[playerMultiplayerId].id != 0)
            {
                memcpy(&gPlayerParty[2], gBlockRecvBuffer[partnerMultiplayerId], sizeof(struct Pokemon));
                memcpy(&gPlayerParty[2 + MULTI_PARTY_SIZE], gBlockRecvBuffer[playerMultiplayerId], sizeof(struct Pokemon));
            }
            else
            {
                memcpy(&gPlayerParty[2], gBlockRecvBuffer[playerMultiplayerId], sizeof(struct Pokemon));
                memcpy(&gPlayerParty[2 + MULTI_PARTY_SIZE], gBlockRecvBuffer[partnerMultiplayerId], sizeof(struct Pokemon));
            }
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 7:
        if (IsLinkTaskFinished())
        {
            // Send enemy Pokémon 1-2 to partner
            SendBlock(BitmaskAllOtherLinkPlayers(), gEnemyParty, sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 8:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            // Recv enemy Pokémon 1-2 (if not master)
            ResetBlockReceivedFlags();
            if (GetMultiplayerId() != 0)
                memcpy(gEnemyParty, gBlockRecvBuffer[0], sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 9:
        if (IsLinkTaskFinished())
        {
            // Send enemy Pokémon 3-4 to partner
            SendBlock(BitmaskAllOtherLinkPlayers(), &gEnemyParty[2], sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 10:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            // Recv enemy Pokémon 3-4 (if not master)
            ResetBlockReceivedFlags();
            if (GetMultiplayerId() != 0)
                memcpy(&gEnemyParty[2], gBlockRecvBuffer[0], sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 11:
        if (IsLinkTaskFinished())
        {
            // Send enemy Pokémon 5-6 to partner
            SendBlock(BitmaskAllOtherLinkPlayers(), &gEnemyParty[4], sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 12:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            // Recv enemy Pokémon 5-6 (if not master)
            ResetBlockReceivedFlags();
            if (GetMultiplayerId() != 0)
                memcpy(&gEnemyParty[4], gBlockRecvBuffer[0], sizeof(struct Pokemon) * 2);

            TryCorrectShedinjaLanguage(&gPlayerParty[0]);
            TryCorrectShedinjaLanguage(&gPlayerParty[1]);
            TryCorrectShedinjaLanguage(&gPlayerParty[2]);
            TryCorrectShedinjaLanguage(&gPlayerParty[3]);
            TryCorrectShedinjaLanguage(&gPlayerParty[4]);
            TryCorrectShedinjaLanguage(&gPlayerParty[5]);
            TryCorrectShedinjaLanguage(&gEnemyParty[0]);
            TryCorrectShedinjaLanguage(&gEnemyParty[1]);
            TryCorrectShedinjaLanguage(&gEnemyParty[2]);
            TryCorrectShedinjaLanguage(&gEnemyParty[3]);
            TryCorrectShedinjaLanguage(&gEnemyParty[4]);
            TryCorrectShedinjaLanguage(&gEnemyParty[5]);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 13:
        InitBattleControllers();
        RecordedBattle_SetTrainerInfo();
        gBattleCommunication[SPRITES_INIT_STATE1] = 0;
        gBattleCommunication[SPRITES_INIT_STATE2] = 0;
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            gBattleCommunication[MULTIUSE_STATE] = 14;
        else
            gBattleCommunication[MULTIUSE_STATE] = 16;
        break;
    case 14:
        // Send rng seed for recorded battle
        if (IsLinkTaskFinished())
        {
            SendBlock(BitmaskAllOtherLinkPlayers(), &gRecordedBattleRngSeed, sizeof(gRecordedBattleRngSeed));
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 15:
        // Receive rng seed for recorded battle (only read it if partner is the link master)
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            if (!(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER))
                memcpy(&gRecordedBattleRngSeed, gBlockRecvBuffer[partnerMultiplayerId], sizeof(gRecordedBattleRngSeed));
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 16:
        // Finish, start battle
        if (BattleInitAllSprites(&gBattleCommunication[SPRITES_INIT_STATE1], &gBattleCommunication[SPRITES_INIT_STATE2]))
        {
            // TrySetLinkBattleTowerEnemyPartyLevel();
            gPreBattleCallback1 = gMain.callback1;
            gMain.callback1 = BattleMainCB1;
            SetMainCallback2(BattleMainCB2);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                gBattleTypeFlags |= BATTLE_TYPE_LINK_IN_BATTLE;
        }
        break;
    }
}

static void SetMultiPartnerMenuParty(u8 offset)
{
    s32 i;

    for (i = 0; i < MULTI_PARTY_SIZE; i++)
    {
        gMultiPartnerParty[i].species     = GetMonData(&gPlayerParty[offset + i], MON_DATA_SPECIES);
        gMultiPartnerParty[i].heldItem    = GetMonData(&gPlayerParty[offset + i], MON_DATA_HELD_ITEM);
        GetMonData(&gPlayerParty[offset + i], MON_DATA_NICKNAME, gMultiPartnerParty[i].nickname);
        gMultiPartnerParty[i].level       = GetMonData(&gPlayerParty[offset + i], MON_DATA_LEVEL);
        gMultiPartnerParty[i].hp          = GetMonData(&gPlayerParty[offset + i], MON_DATA_HP);
        gMultiPartnerParty[i].maxhp       = GetMonData(&gPlayerParty[offset + i], MON_DATA_MAX_HP);
        gMultiPartnerParty[i].status      = GetMonData(&gPlayerParty[offset + i], MON_DATA_STATUS);
        gMultiPartnerParty[i].personality = GetMonData(&gPlayerParty[offset + i], MON_DATA_PERSONALITY);
        gMultiPartnerParty[i].gender      = GetMonGender(&gPlayerParty[offset + i]);
        StripExtCtrlCodes(gMultiPartnerParty[i].nickname);
        if (GetMonData(&gPlayerParty[offset + i], MON_DATA_LANGUAGE) != LANGUAGE_JAPANESE)
            PadNameString(gMultiPartnerParty[i].nickname, CHAR_SPACE);
    }
    memcpy(sMultiPartnerPartyBuffer, gMultiPartnerParty, sizeof(gMultiPartnerParty));
}

static void CB2_PreInitMultiBattle(void)
{
    s32 i;
    u8 playerMultiplierId;
    s32 numPlayers = MAX_BATTLERS_COUNT;
    u8 blockMask = 0xF;
    u32 *savedBattleTypeFlags;
    void (**savedCallback)(void);

    if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
    {
        numPlayers = 2;
        blockMask = 3;
    }

    playerMultiplierId = GetMultiplayerId();
    gBattleScripting.multiplayerId = playerMultiplierId;
    savedCallback = &gBattleStruct->savedCallback;
    savedBattleTypeFlags = &gBattleStruct->savedBattleTypeFlags;

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gBattleCommunication[MULTIUSE_STATE])
    {
    case 0:
        if (gReceivedRemoteLinkPlayers && IsLinkTaskFinished())
        {
            sMultiPartnerPartyBuffer = Alloc(sizeof(gMultiPartnerParty));
            SetMultiPartnerMenuParty(0);
            SendBlock(BitmaskAllOtherLinkPlayers(), sMultiPartnerPartyBuffer, sizeof(gMultiPartnerParty));
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & blockMask) == blockMask)
        {
            ResetBlockReceivedFlags();
            for (i = 0; i < numPlayers; i++)
            {
                if (i == playerMultiplierId)
                    continue;

                if ((!(gLinkPlayers[i].id & 1) && !(gLinkPlayers[playerMultiplierId].id & 1))
                    || (gLinkPlayers[i].id & 1 && gLinkPlayers[playerMultiplierId].id & 1))
                {
                    memcpy(gMultiPartnerParty, gBlockRecvBuffer[i], sizeof(gMultiPartnerParty));
                }
            }
            gBattleCommunication[MULTIUSE_STATE]++;
            *savedCallback = gMain.savedCallback;
            *savedBattleTypeFlags = gBattleTypeFlags;
            gMain.savedCallback = CB2_PreInitMultiBattle;
            ShowPartyMenuToShowcaseMultiBattleParty();
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            gBattleCommunication[MULTIUSE_STATE]++;
            if (gWirelessCommType)
                SetLinkStandbyCallback();
            else
                SetCloseLinkCallback();
        }
        break;
    case 3:
        if (gWirelessCommType)
        {
            if (IsLinkRfuTaskFinished())
            {
                gBattleTypeFlags = *savedBattleTypeFlags;
                gMain.savedCallback = *savedCallback;
                SetMainCallback2(CB2_InitBattleInternal);
                FREE_AND_SET_NULL(sMultiPartnerPartyBuffer);
            }
        }
        else if (gReceivedRemoteLinkPlayers == 0)
        {
            gBattleTypeFlags = *savedBattleTypeFlags;
            gMain.savedCallback = *savedCallback;
            SetMainCallback2(CB2_InitBattleInternal);
            FREE_AND_SET_NULL(sMultiPartnerPartyBuffer);
        }
        break;
    }
}

static void CB2_PreInitIngamePlayerPartnerBattle(void)
{
    u32 *savedBattleTypeFlags;
    void (**savedCallback)(void);

    savedCallback = &gBattleStruct->savedCallback;
    savedBattleTypeFlags = &gBattleStruct->savedBattleTypeFlags;

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gBattleCommunication[MULTIUSE_STATE])
    {
    case 0:
        sMultiPartnerPartyBuffer = Alloc(sizeof(gMultiPartnerParty));
        SetMultiPartnerMenuParty(MULTI_PARTY_SIZE);
        gBattleCommunication[MULTIUSE_STATE]++;
        *savedCallback = gMain.savedCallback;
        *savedBattleTypeFlags = gBattleTypeFlags;
        gMain.savedCallback = CB2_PreInitIngamePlayerPartnerBattle;
        if (!PlayerHasFollowerNPC() || !FollowerNPCIsBattlePartner() || (FNPC_NPC_FOLLOWER_PARTY_PREVIEW && FollowerNPCIsBattlePartner()))
            ShowPartyMenuToShowcaseMultiBattleParty();

        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gBattleCommunication[MULTIUSE_STATE] = 2;
            gBattleTypeFlags = *savedBattleTypeFlags;
            gMain.savedCallback = *savedCallback;
            SetMainCallback2(CB2_InitBattleInternal);
            FREE_AND_SET_NULL(sMultiPartnerPartyBuffer);
        }
        break;
    }
}

static void CB2_HandleStartMultiBattle(void)
{
    u8 playerMultiplayerId;
    s32 id;
    u8 var;

    playerMultiplayerId = GetMultiplayerId();
    gBattleScripting.multiplayerId = playerMultiplayerId;

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gBattleCommunication[MULTIUSE_STATE])
    {
    case 0:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            ShowBg(0);
            ShowBg(1);
            ShowBg(2);
            ShowBg(3);
            FillAroundBattleWindows();
            gBattleCommunication[MULTIUSE_STATE] = 1;
        }
        if (gWirelessCommType)
            LoadWirelessStatusIndicatorSpriteGfx();
        break;
    case 1:
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            if (gReceivedRemoteLinkPlayers)
            {
                if (IsLinkTaskFinished())
                {
                    // 0x201
                    *(&gBattleStruct->multiBuffer.linkBattlerHeader.versionSignatureLo) = 1;
                    *(&gBattleStruct->multiBuffer.linkBattlerHeader.versionSignatureHi) = 2;
                    BufferPartyVsScreenHealth_AtStart();
                    SetPlayerBerryDataInBattleStruct();

                    SendBlock(BitmaskAllOtherLinkPlayers(), &gBattleStruct->multiBuffer.linkBattlerHeader, sizeof(gBattleStruct->multiBuffer.linkBattlerHeader));
                    gBattleCommunication[MULTIUSE_STATE]++;
                }
                if (gWirelessCommType)
                    CreateWirelessStatusIndicatorSprite(0, 0);
            }
        }
        else
        {
            if (!(gBattleTypeFlags & BATTLE_TYPE_RECORDED))
                gBattleTypeFlags |= BATTLE_TYPE_IS_MASTER;
            gBattleCommunication[MULTIUSE_STATE] = 7;
            SetAllPlayersBerryData();
        }
        break;
    case 2:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            ResetBlockReceivedFlags();
            FindLinkBattleMaster(4, playerMultiplayerId);
            SetAllPlayersBerryData();
            var = CreateTask(InitLinkBattleVsScreen, 0);
            gTasks[var].data[1] = 270;
            gTasks[var].data[2] = 90;
            gTasks[var].data[5] = 0;
            gTasks[var].data[3] = 0;
            gTasks[var].data[4] = 0;

            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                // RecordedBattle_SetFrontierPassFlagFromHword(gBlockRecvBuffer[id][1]);
                switch (gLinkPlayers[id].id)
                {
                case 0:
                    gTasks[var].data[3] |= gBlockRecvBuffer[id][1] & 0x3F;
                    break;
                case 1:
                    gTasks[var].data[4] |= gBlockRecvBuffer[id][1] & 0x3F;
                    break;
                case 2:
                    gTasks[var].data[3] |= (gBlockRecvBuffer[id][1] & 0x3F) << 6;
                    break;
                case 3:
                    gTasks[var].data[4] |= (gBlockRecvBuffer[id][1] & 0x3F) << 6;
                    break;
                }
            }
            ZeroEnemyPartyMons();
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        else
        {
            break;
        }
        // fall through
    case 3:
        if (IsLinkTaskFinished())
        {
            SendBlock(BitmaskAllOtherLinkPlayers(), gPlayerParty, sizeof(struct Pokemon) * 2);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 4:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            ResetBlockReceivedFlags();
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                if (id == playerMultiplayerId)
                {
                    switch (gLinkPlayers[id].id)
                    {
                    case 0:
                    case 3:
                        memcpy(gPlayerParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                        break;
                    case 1:
                    case 2:
                        memcpy(gPlayerParty + MULTI_PARTY_SIZE, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                        break;
                    }
                }
                else
                {
                    if ((!(gLinkPlayers[id].id & 1) && !(gLinkPlayers[playerMultiplayerId].id & 1))
                     || ((gLinkPlayers[id].id & 1) && (gLinkPlayers[playerMultiplayerId].id & 1)))
                    {
                        switch (gLinkPlayers[id].id)
                        {
                        case 0:
                        case 3:
                            memcpy(gPlayerParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        case 1:
                        case 2:
                            memcpy(gPlayerParty + MULTI_PARTY_SIZE, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        }
                    }
                    else
                    {
                        switch (gLinkPlayers[id].id)
                        {
                        case 0:
                        case 3:
                            memcpy(gEnemyParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        case 1:
                        case 2:
                            memcpy(gEnemyParty + MULTI_PARTY_SIZE, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        }
                    }
                }
            }
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 7:
        if (IsLinkTaskFinished())
        {
            SendBlock(BitmaskAllOtherLinkPlayers(), gPlayerParty + 2, sizeof(struct Pokemon));
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 8:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            ResetBlockReceivedFlags();
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                if (id == playerMultiplayerId)
                {
                    switch (gLinkPlayers[id].id)
                    {
                    case 0:
                    case 3:
                        memcpy(gPlayerParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                        break;
                    case 1:
                    case 2:
                        memcpy(gPlayerParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                        break;
                    }
                }
                else
                {
                    if ((!(gLinkPlayers[id].id & 1) && !(gLinkPlayers[playerMultiplayerId].id & 1))
                     || ((gLinkPlayers[id].id & 1) && (gLinkPlayers[playerMultiplayerId].id & 1)))
                    {
                        switch (gLinkPlayers[id].id)
                        {
                        case 0:
                        case 3:
                            memcpy(gPlayerParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        case 1:
                        case 2:
                            memcpy(gPlayerParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        }
                    }
                    else
                    {
                        switch (gLinkPlayers[id].id)
                        {
                        case 0:
                        case 3:
                            memcpy(gEnemyParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        case 1:
                        case 2:
                            memcpy(gEnemyParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        }
                    }
                }
            }
            TryCorrectShedinjaLanguage(&gPlayerParty[0]);
            TryCorrectShedinjaLanguage(&gPlayerParty[1]);
            TryCorrectShedinjaLanguage(&gPlayerParty[2]);
            TryCorrectShedinjaLanguage(&gPlayerParty[3]);
            TryCorrectShedinjaLanguage(&gPlayerParty[4]);
            TryCorrectShedinjaLanguage(&gPlayerParty[5]);

            TryCorrectShedinjaLanguage(&gEnemyParty[0]);
            TryCorrectShedinjaLanguage(&gEnemyParty[1]);
            TryCorrectShedinjaLanguage(&gEnemyParty[2]);
            TryCorrectShedinjaLanguage(&gEnemyParty[3]);
            TryCorrectShedinjaLanguage(&gEnemyParty[4]);
            TryCorrectShedinjaLanguage(&gEnemyParty[5]);

            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 11:
        InitBattleControllers();
        RecordedBattle_SetTrainerInfo();
        gBattleCommunication[MULTIUSE_STATE]++;
        gBattleCommunication[SPRITES_INIT_STATE1] = 0;
        gBattleCommunication[SPRITES_INIT_STATE2] = 0;
        // if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        // {
        //     for (id = 0; id < MAX_LINK_PLAYERS && (gLinkPlayers[id].version & 0xFF) == VERSION_EMERALD; id++);

        //     if (id == MAX_LINK_PLAYERS)
        //         gBattleCommunication[MULTIUSE_STATE] = 8;
        //     else
        //         gBattleCommunication[MULTIUSE_STATE] = 10;
        // }
        // else
        // {
        //     gBattleCommunication[MULTIUSE_STATE] = 10;
        // }
        break;
    case 12:
    //     if (IsLinkTaskFinished())
    //     {
    //         struct BattleVideo *ptr = &gBattleStruct->multiBuffer.battleVideo;
    //         ptr->battleTypeFlags = gBattleTypeFlags;
    //         ptr->rngSeed = gRecordedBattleRngSeed;

    //         SendBlock(BitmaskAllOtherLinkPlayers(), ptr, sizeof(gBattleStruct->multiBuffer.battleVideo));
    //         gBattleCommunication[MULTIUSE_STATE]++;
    //     }
    //     break;
    // case 9:
    //     if ((GetBlockReceivedStatus() & 0xF) == 0xF)
    //     {
    //         ResetBlockReceivedFlags();
    //         for (var = 0; var < 4; var++)
    //         {
    //             u32 blockValue = gBlockRecvBuffer[var][0];
    //             if (blockValue & 4)
    //             {
    //                 memcpy(&gRecordedBattleRngSeed, &gBlockRecvBuffer[var][2], sizeof(gRecordedBattleRngSeed));
    //                 break;
    //             }
    //         }

    //         gBattleCommunication[MULTIUSE_STATE]++;
    //     }
    //     break;
    // case 10:
        if (BattleInitAllSprites(&gBattleCommunication[SPRITES_INIT_STATE1], &gBattleCommunication[SPRITES_INIT_STATE2]))
        {
            gPreBattleCallback1 = gMain.callback1;
            gMain.callback1 = BattleMainCB1;
            SetMainCallback2(BattleMainCB2);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                TRAINER_BATTLE_PARAM.opponentA = TRAINER_LINK_OPPONENT;
                gBattleTypeFlags |= BATTLE_TYPE_LINK_IN_BATTLE;
            }
        }
        break;
    case 5:
    case 9:
    case 13:
        ++gBattleCommunication[0];
        gBattleCommunication[1] = 1;
        // fall through
    case 6:
    case 10:
    case 14:
        if (--gBattleCommunication[1] == 0)
            ++gBattleCommunication[0];
        break;
    }
}

void BattleMainCB2(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTextPrinters();
    UpdatePaletteFade();
    RunTasks();

    if (JOY_HELD(B_BUTTON) && gBattleTypeFlags & BATTLE_TYPE_RECORDED && RecordedBattle_CanStopPlayback())
    {
        // Player pressed B during recorded battle playback, end battle
        gSpecialVar_Result = gBattleOutcome = B_OUTCOME_PLAYER_TELEPORTED;
        ResetPaletteFadeControl();
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        SetMainCallback2(CB2_QuitRecordedBattle);
    }

    if (JOY_HELD(B_BUTTON) && gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
    {
        gSpecialVar_Result = gBattleOutcome = B_OUTCOME_DREW;
        ResetPaletteFadeControl();
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        SetMainCallback2(CB2_QuitPokedudeBattle);
    }
}

void FreeRestoreBattleData(void)
{
    gMain.callback1 = gPreBattleCallback1;
    gScanlineEffect.state = 3;
    gMain.inBattle = FALSE;
    ZeroEnemyPartyMons();
    m4aSongNumStop(SE_LOW_HEALTH);
    FreeMonSpritesGfx();
    FreeBattleSpritesData();
    FreeBattleResources();
    ResetDynamicAiFunctions();
}

void CB2_QuitRecordedBattle(void)
{
    UpdatePaletteFade();
    if (!gPaletteFade.active)
    {
        m4aMPlayStop(&gMPlayInfo_SE1);
        m4aMPlayStop(&gMPlayInfo_SE2);
        if (gTestRunnerEnabled)
        {
            // Clean up potentially-leaking tasks.
            // I think these leak when the battle ends soon after a
            // battler is fainted.
            u8 taskId;
            taskId = FindTaskIdByFunc(Task_PlayerController_RestoreBgmAfterCry);
            if (taskId != TASK_NONE)
                DestroyTask(taskId);
            taskId = FindTaskIdByFunc(Task_DuckBGMForPokemonCry);
            if (taskId != TASK_NONE)
                DestroyTask(taskId);

            gCurrentActionFuncId = B_ACTION_FINISHED;
            sEndTurnFuncsTable[gBattleOutcome & 0x7F](); // Contains TestRunner_Battle_AfterLastTurn
        }
        FreeRestoreBattleData();
        FreeAllWindowBuffers();
        SetMainCallback2(gMain.savedCallback);
    }
}

static void CB2_QuitPokedudeBattle(void)
{
    UpdatePaletteFade();
    if (!gPaletteFade.active)
    {
        FreeRestoreBattleData();
        FreeAllWindowBuffers();
        SetMainCallback2(gMain.savedCallback);
    }
}

static u32 Crc32B (const u8 *data, u32 size)
{
   s32 i, j;
   u32 byte, crc, mask;

   i = 0;
   crc = 0xFFFFFFFF;
   for (i = 0; i < size; ++i)
   {
        byte = data[i];
        crc = crc ^ byte;
        for (j = 7; j >= 0; --j)
        {
            mask = -(crc & 1);
            crc = (crc >> 1) ^ (0xEDB88320 & mask);
        }
   }
   return ~crc;
}

static u32 GeneratePartyHash(const struct Trainer *trainer, u32 i)
{
    const u8 *buffer = (const u8 *) &trainer->party[i];
    u32 n = sizeof(*trainer->party);
    return Crc32B(buffer, n);
}

void ModifyPersonalityForNature(u32 *personality, u32 newNature)
{
    u32 nature = GetNatureFromPersonality(*personality);
    s32 diff = abs((s32)nature - (s32)newNature);
    s32 sign = (nature > newNature) ? 1 : -1;
    if (diff > NUM_NATURES / 2)
    {
        diff = NUM_NATURES - diff;
        sign *= -1;
    }
    *personality -= (diff * sign);
}

u32 GeneratePersonalityForGender(u32 gender, u32 species)
{
    const struct SpeciesInfo *speciesInfo = &gSpeciesInfo[species];
    if (gender == MON_GENDERLESS)
        return 0;
    else if (gender == MON_MALE)
        return ((255 - speciesInfo->genderRatio) / 2) + speciesInfo->genderRatio;
    else
        return speciesInfo->genderRatio / 2;
}

void CustomTrainerPartyAssignMoves(struct Pokemon *mon, const struct TrainerMon *partyEntry)
{
    bool32 noMoveSet = TRUE;
    u32 j;

    for (j = 0; j < MAX_MON_MOVES; ++j)
    {
        if (partyEntry->moves[j] != MOVE_NONE)
            noMoveSet = FALSE;
    }
    if (noMoveSet)
    {
        GiveMonInitialMoveset(mon);
        // TODO: Figure out a default strategy when moves are not set, to generate a good moveset
        return;
    }

    for (j = 0; j < MAX_MON_MOVES; ++j)
    {
        u32 pp = GetMovePP(partyEntry->moves[j]);
        SetMonData(mon, MON_DATA_MOVE1 + j, &partyEntry->moves[j]);
        SetMonData(mon, MON_DATA_PP1 + j, &pp);
    }
}

u8 CreateNPCTrainerPartyFromTrainer(struct Pokemon *party, const struct Trainer *trainer, bool32 firstTrainer, u32 battleTypeFlags)
{
    u32 personalityValue;
    s32 i;
    u8 monsCount;
    if (battleTypeFlags & BATTLE_TYPE_TRAINER && !(battleTypeFlags & (BATTLE_TYPE_FRONTIER
                                                                        | BATTLE_TYPE_EREADER_TRAINER
                                                                        | BATTLE_TYPE_TRAINER_HILL)))
    {
        if (firstTrainer == TRUE)
            ZeroEnemyPartyMons();

        if (battleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
        {
            if (trainer->partySize > PARTY_SIZE / 2)
                monsCount = PARTY_SIZE / 2;
            else
                monsCount = trainer->partySize;
        }
        else
        {
            monsCount = trainer->partySize;
        }

        u32 monIndices[monsCount];
        DoTrainerPartyPool(trainer, monIndices, monsCount, battleTypeFlags);

        for (i = 0; i < monsCount; i++)
        {
            u32 monIndex = monIndices[i];
            s32 ball = -1;
            u32 personalityHash = GeneratePartyHash(trainer, i);
            const struct TrainerMon *partyData = trainer->party;
            struct OriginalTrainerId otId = OTID_STRUCT_RANDOM_NO_SHINY;
            u32 abilityNum = 0;

            if (trainer->battleType != TRAINER_BATTLE_TYPE_SINGLES)
                personalityValue = 0x80;
            else if (trainer->gender == TRAINER_GENDER_FEMALE)
                personalityValue = 0x78; // Use personality more likely to result in a female Pokémon
            else
                personalityValue = 0x88; // Use personality more likely to result in a male Pokémon

            personalityValue += personalityHash << 8;
            if (partyData[monIndex].gender == TRAINER_MON_MALE)
                personalityValue = (personalityValue & 0xFFFFFF00) | GeneratePersonalityForGender(MON_MALE, partyData[monIndex].species);
            else if (partyData[monIndex].gender == TRAINER_MON_FEMALE)
                personalityValue = (personalityValue & 0xFFFFFF00) | GeneratePersonalityForGender(MON_FEMALE, partyData[monIndex].species);
            else if (partyData[monIndex].gender == TRAINER_MON_RANDOM_GENDER)
                personalityValue = (personalityValue & 0xFFFFFF00) | GeneratePersonalityForGender(Random() & 1 ? MON_MALE : MON_FEMALE, partyData[monIndex].species);
            ModifyPersonalityForNature(&personalityValue, partyData[monIndex].nature);
            if (partyData[monIndex].isShiny)
            {
                otId.method = OT_ID_PRESET;
                otId.value = HIHALF(personalityValue) ^ LOHALF(personalityValue);
            }
            CreateMon(&party[i], partyData[monIndex].species, partyData[monIndex].lvl, personalityValue, otId);
            SetMonData(&party[i], MON_DATA_HELD_ITEM, &partyData[monIndex].heldItem);

            CustomTrainerPartyAssignMoves(&party[i], &partyData[monIndex]);
            SetMonData(&party[i], MON_DATA_IVS, &(partyData[monIndex].iv));
            if (partyData[monIndex].ev != NULL)
            {
                SetMonData(&party[i], MON_DATA_HP_EV, &(partyData[monIndex].ev[0]));
                SetMonData(&party[i], MON_DATA_ATK_EV, &(partyData[monIndex].ev[1]));
                SetMonData(&party[i], MON_DATA_DEF_EV, &(partyData[monIndex].ev[2]));
                SetMonData(&party[i], MON_DATA_SPATK_EV, &(partyData[monIndex].ev[3]));
                SetMonData(&party[i], MON_DATA_SPDEF_EV, &(partyData[monIndex].ev[4]));
                SetMonData(&party[i], MON_DATA_SPEED_EV, &(partyData[monIndex].ev[5]));
            }
            if (partyData[monIndex].ability != ABILITY_NONE)
            {
                const struct SpeciesInfo *speciesInfo = &gSpeciesInfo[partyData[monIndex].species];
                u32 maxAbilityNum = ARRAY_COUNT(speciesInfo->abilities);
                for (abilityNum = 0; abilityNum < maxAbilityNum; ++abilityNum)
                {
                    if (speciesInfo->abilities[abilityNum] == partyData[monIndex].ability)
                        break;
                }
                assertf(abilityNum < maxAbilityNum, "illegal ability %S for %S", gAbilitiesInfo[partyData[monIndex].ability].name, speciesInfo->speciesName);
            }
            else if (B_TRAINER_MON_RANDOM_ABILITY)
            {
                const struct SpeciesInfo *speciesInfo = &gSpeciesInfo[partyData[monIndex].species];
                abilityNum = personalityHash % 3;
                while (speciesInfo->abilities[abilityNum] == ABILITY_NONE)
                {
                    abilityNum--;
                }
            }
            SetMonData(&party[i], MON_DATA_ABILITY_NUM, &abilityNum);
            SetMonData(&party[i], MON_DATA_FRIENDSHIP, &(partyData[monIndex].friendship));
            if (partyData[monIndex].ball != ITEM_NONE)
            {
                ball = partyData[monIndex].ball;
                SetMonData(&party[i], MON_DATA_POKEBALL, &ball);
            }
            if (partyData[monIndex].nickname != NULL)
            {
                SetMonData(&party[i], MON_DATA_NICKNAME, partyData[monIndex].nickname);
            }
            if (partyData[monIndex].isShiny)
            {
                bool32 data = TRUE;
                SetMonData(&party[i], MON_DATA_IS_SHINY, &data);
            }
            if (partyData[monIndex].dynamaxLevel > 0)
            {
                u32 data = partyData[monIndex].dynamaxLevel;
                if (partyData[monIndex].shouldUseDynamax)
                    gBattleStruct->opponentMonCanDynamax |= 1 << i;
                SetMonData(&party[i], MON_DATA_DYNAMAX_LEVEL, &data);
            }
            if (partyData[monIndex].gigantamaxFactor)
            {
                u32 data = partyData[monIndex].gigantamaxFactor;
                SetMonData(&party[i], MON_DATA_GIGANTAMAX_FACTOR, &data);
            }
            if (partyData[monIndex].teraType > 0)
            {
                gBattleStruct->opponentMonCanTera |= 1 << i;
                enum Type data = partyData[monIndex].teraType;
                SetMonData(&party[i], MON_DATA_TERA_TYPE, &data);
            }
            CalculateMonStats(&party[i]);

            if (B_TRAINER_CLASS_POKE_BALLS >= GEN_7 && ball == -1)
            {
                ball = gTrainerClasses[trainer->trainerClass].ball ?: ITEM_POKE_BALL;
                SetMonData(&party[i], MON_DATA_POKEBALL, &ball);
            }
        }
    }

    return trainer->partySize;
}

static u8 CreateNPCTrainerParty(struct Pokemon *party, u16 trainerNum, bool8 firstTrainer)
{
    u8 retVal;
    if (trainerNum == TRAINER_SECRET_BASE)
        return 0;
    if (GetTrainerStructFromId(trainerNum)->overrideTrainer)
    {
        struct Trainer tempTrainer;
        memcpy(&tempTrainer, GetTrainerStructFromId(trainerNum), sizeof(struct Trainer));
        const struct Trainer *origTrainer = GetTrainerStructFromId(tempTrainer.overrideTrainer);

        tempTrainer.party = origTrainer->party;

        tempTrainer.poolSize = origTrainer->poolSize;
        if (tempTrainer.partySize == 0)
            tempTrainer.partySize = origTrainer->partySize;

        retVal = CreateNPCTrainerPartyFromTrainer(party, (const struct Trainer *)(&tempTrainer), firstTrainer, gBattleTypeFlags);
    }
    else
    {
        retVal = CreateNPCTrainerPartyFromTrainer(party, GetTrainerStructFromId(trainerNum), firstTrainer, gBattleTypeFlags);
    }
    return retVal;
}

void CreateTrainerPartyForPlayer(void)
{
    Script_RequestEffects(SCREFF_V1);

    ZeroPlayerPartyMons();
    gPartnerTrainerId = gSpecialVar_0x8004;
    CreateNPCTrainerPartyFromTrainer(gPlayerParty, GetTrainerStructFromId(gSpecialVar_0x8004), TRUE, BATTLE_TYPE_TRAINER);
}

void VBlankCB_Battle(void)
{
    // Change gRngSeed every vblank unless the battle could be recorded.
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_RECORDED)))
        AdvanceRandom();

    SetGpuReg(REG_OFFSET_BG0HOFS, gBattle_BG0_X);
    SetGpuReg(REG_OFFSET_BG0VOFS, gBattle_BG0_Y);
    SetGpuReg(REG_OFFSET_BG1HOFS, gBattle_BG1_X);
    SetGpuReg(REG_OFFSET_BG1VOFS, gBattle_BG1_Y);
    SetGpuReg(REG_OFFSET_BG2HOFS, gBattle_BG2_X);
    SetGpuReg(REG_OFFSET_BG2VOFS, gBattle_BG2_Y);
    SetGpuReg(REG_OFFSET_BG3HOFS, gBattle_BG3_X);
    SetGpuReg(REG_OFFSET_BG3VOFS, gBattle_BG3_Y);
    SetGpuReg(REG_OFFSET_WIN0H, gBattle_WIN0H);
    SetGpuReg(REG_OFFSET_WIN0V, gBattle_WIN0V);
    SetGpuReg(REG_OFFSET_WIN1H, gBattle_WIN1H);
    SetGpuReg(REG_OFFSET_WIN1V, gBattle_WIN1V);
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();
}

void SpriteCB_VsLetterDummy(struct Sprite *sprite)
{

}

static void SpriteCB_VsLetter(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
        sprite->x = sprite->data[1] + ((sprite->data[2] & 0xFF00) >> 8);
    else
        sprite->x = sprite->data[1] - ((sprite->data[2] & 0xFF00) >> 8);

    sprite->data[2] += 0x180;

    if (sprite->affineAnimEnded)
    {
        FreeSpriteTilesByTag(ANIM_SPRITES_START);
        FreeSpritePaletteByTag(ANIM_SPRITES_START);
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

void SpriteCB_VsLetterInit(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 1);
    sprite->callback = SpriteCB_VsLetter;
    PlaySE(SE_MUGSHOT);
}

static void BufferPartyVsScreenHealth_AtEnd(u8 taskId)
{
    struct Pokemon *party1 = NULL;
    struct Pokemon *party2 = NULL;
    u8 multiplayerId = gBattleScripting.multiplayerId;
    u32 flags;
    s32 i;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        switch (gLinkPlayers[multiplayerId].id)
        {
        case 0:
        case 2:
            party1 = gPlayerParty;
            party2 = gEnemyParty;
            break;
        case 1:
        case 3:
            party1 = gEnemyParty;
            party2 = gPlayerParty;
            break;
        }
    }
    else
    {
        party1 = gPlayerParty;
        party2 = gEnemyParty;
    }

    flags = 0;
    BUFFER_PARTY_VS_SCREEN_STATUS(party1, flags, i);
    gTasks[taskId].data[3] = flags;

    flags = 0;
    BUFFER_PARTY_VS_SCREEN_STATUS(party2, flags, i);
    gTasks[taskId].data[4] = flags;
}

void CB2_InitEndLinkBattle(void)
{
    s32 i;
    u8 taskId;

    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);
    gBattleTypeFlags &= ~BATTLE_TYPE_LINK_IN_BATTLE;

    if (gBattleTypeFlags & BATTLE_TYPE_FRONTIER)
    {
        SetMainCallback2(gMain.savedCallback);
        FreeBattleResources();
        FreeBattleSpritesData();
        FreeMonSpritesGfx();
    }
    else
    {
        CpuFill32(0, (void *)(VRAM), VRAM_SIZE);
        SetGpuReg(REG_OFFSET_MOSAIC, 0);
        SetGpuReg(REG_OFFSET_WIN0H, DISPLAY_WIDTH);
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(DISPLAY_HEIGHT / 2, DISPLAY_HEIGHT / 2 + 1));
        SetGpuReg(REG_OFFSET_WININ, 0);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        gBattle_WIN0H = DISPLAY_WIDTH;
        gBattle_WIN0V = WIN_RANGE(DISPLAY_HEIGHT / 2, DISPLAY_HEIGHT / 2 + 1);
        ScanlineEffect_Clear();

        i = 0;
        while (i < 80)
        {
            gScanlineEffectRegBuffers[0][i] = 0xF0;
            gScanlineEffectRegBuffers[1][i] = 0xF0;
            i++;
        }

        while (i < 160)
        {
            gScanlineEffectRegBuffers[0][i] = 0xFF10;
            gScanlineEffectRegBuffers[1][i] = 0xFF10;
            i++;
        }

        ResetPaletteFade();

        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 0;
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        gBattle_BG2_X = 0;
        gBattle_BG2_Y = 0;
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;

        InitBattleBgsVideo();
        LoadPalette(gBattleTextboxPalette, BG_PLTT_ID(0), 2 * PLTT_SIZE_4BPP);
        LoadBattleMenuWindowGfx();
        ResetSpriteData();
        ResetTasks();
        DrawBattleEntryBackground();
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG0 | WINOUT_WIN01_BG1 | WINOUT_WIN01_BG2 | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR);
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = MAX_BATTLERS_COUNT;
        SetVBlankCallback(VBlankCB_Battle);

        // Show end Vs screen with battle results
        taskId = CreateTask(InitLinkBattleVsScreen, 0);
        gTasks[taskId].data[1] = 270;
        gTasks[taskId].data[2] = 90;
        gTasks[taskId].data[5] = 1;
        BufferPartyVsScreenHealth_AtEnd(taskId);

        SetMainCallback2(CB2_EndLinkBattle);
        gBattleCommunication[MULTIUSE_STATE] = 0;
    }
}

static void CB2_EndLinkBattle(void)
{
    EndLinkBattleInSteps();
    AnimateSprites();
    BuildOamBuffer();
    // RunTextPrinters();
    UpdatePaletteFade();
    RunTasks();
}

static void EndLinkBattleInSteps(void)
{
    switch (gBattleCommunication[MULTIUSE_STATE])
    {
    case 0:
        ShowBg(0);
        ShowBg(1);
        ShowBg(2);
        gBattleCommunication[1] = 0xFF;
        gBattleCommunication[MULTIUSE_STATE]++;
        break;
    case 1:
        if (--gBattleCommunication[1] == 0)
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            SetMainCallback2(gMain.savedCallback);
            TrySetQuestLogLinkBattleEvent();
            FreeMonSpritesGfx();
            FreeBattleSpritesData();
            FreeBattleResources();
        }
        break;
    }
}

u32 GetBattleBgTemplateData(u8 arrayId, u8 caseId)
{
    u32 ret = 0;

    switch (caseId)
    {
    case 0:
        ret = gBattleBgTemplates[arrayId].bg;
        break;
    case 1:
        ret = gBattleBgTemplates[arrayId].charBaseIndex;
        break;
    case 2:
        ret = gBattleBgTemplates[arrayId].mapBaseIndex;
        break;
    case 3:
        ret = gBattleBgTemplates[arrayId].screenSize;
        break;
    case 4:
        ret = gBattleBgTemplates[arrayId].paletteMode;
        break;
    case 5: // Only this case is used
        ret = gBattleBgTemplates[arrayId].priority;
        break;
    case 6:
        ret = gBattleBgTemplates[arrayId].baseTile;
        break;
    }

    return ret;
}

static void TryCorrectShedinjaLanguage(struct Pokemon *mon)
{
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    u8 language = LANGUAGE_JAPANESE;

    if (GetMonData(mon, MON_DATA_SPECIES) == SPECIES_SHEDINJA
     && GetMonData(mon, MON_DATA_LANGUAGE) != language)
    {
        GetMonData(mon, MON_DATA_NICKNAME, nickname);
        if (StringCompareWithoutExtCtrlCodes(nickname, sText_ShedinjaJpnName) == 0)
            SetMonData(mon, MON_DATA_LANGUAGE, &language);
    }
}

#define sBattler            data[0]
#define sSpeciesId          data[2]

void SpriteCB_WildMon(struct Sprite *sprite)
{
    sprite->callback = SpriteCB_MoveWildMonToRight;
    StartSpriteAnimIfDifferent(sprite, 0);
    if (B_FAST_INTRO_NO_SLIDE == FALSE && !gTestRunnerHeadless)
    {
        if (WILD_DOUBLE_BATTLE)
            BeginNormalPaletteFade((0x10000 << sprite->sBattler) | (0x10000 << BATTLE_PARTNER(sprite->sBattler)), 0, 10, 10, RGB(8, 8, 8));
        else
            BeginNormalPaletteFade((0x10000 << sprite->sBattler), 0, 10, 10, RGB(8, 8, 8));
    }
}

static void SpriteCB_MoveWildMonToRight(struct Sprite *sprite)
{
    if ((gIntroSlideFlags & 1) == 0)
    {
        if (B_FAST_INTRO_NO_SLIDE == FALSE && !gTestRunnerHeadless)
            sprite->x2 += 2;
        else
            sprite->x2 = 0;

        if (sprite->x2 == 0)
        {
            sprite->callback = SpriteCB_WildMonShowHealthbox;
        }
    }
}

static void SpriteCB_WildMonShowHealthbox(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        StartHealthboxSlideIn(sprite->sBattler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[sprite->sBattler]);
        sprite->callback = SpriteCB_WildMonAnimate;
        StartSpriteAnimIfDifferent(sprite, 0);
        if (B_FAST_INTRO_NO_SLIDE == FALSE && !gTestRunnerHeadless)
        {
            if (WILD_DOUBLE_BATTLE)
                BeginNormalPaletteFade((0x10000 << sprite->sBattler) | (0x10000 << BATTLE_PARTNER(sprite->sBattler)), 0, 10, 0, RGB(8, 8, 8));
            else
                BeginNormalPaletteFade((0x10000 << sprite->sBattler), 0, 10, 0, RGB(8, 8, 8));
        }
    }
}

static void SpriteCB_WildMonAnimate(struct Sprite *sprite)
{
    if (!gPaletteFade.active)
    {
        BattleAnimateFrontSprite(sprite, sprite->sSpeciesId, FALSE, 1);
    }
}

void SpriteCallbackDummy_2(struct Sprite *sprite)
{

}

void SpriteCB_FaintOpponentMon(struct Sprite *sprite)
{
    u8 battler = sprite->sBattler;
    u32 personality = GetMonData(GetBattlerMon(battler), MON_DATA_PERSONALITY);
    u16 species;
    u8 yOffset;

    if (gBattleSpritesDataPtr->battlerData[battler].transformSpecies != 0)
        species = gBattleSpritesDataPtr->battlerData[battler].transformSpecies;
    else
        species = sprite->sSpeciesId;

    species = SanitizeSpeciesId(species);
    if (species == SPECIES_UNOWN)
        species = GetUnownSpeciesId(personality);
    yOffset = gSpeciesInfo[species].frontPicYOffset;

    sprite->data[3] = 8 - yOffset / 8;
    sprite->data[4] = 1;
    sprite->callback = SpriteCB_AnimFaintOpponent;
}

static void SpriteCB_AnimFaintOpponent(struct Sprite *sprite)
{
    s32 i;

    if (--sprite->data[4] == 0)
    {
        sprite->data[4] = 2;
        sprite->y2 += 8; // Move the sprite down.
        if (--sprite->data[3] < 0)
        {
            FreeSpriteOamMatrix(sprite);
            DestroySprite(sprite);
        }
        else // Erase bottom part of the sprite to create a smooth illusion of mon falling down.
        {
            u8 *dst = &gMonSpritesGfxPtr->spritesGfx[GetBattlerPosition(sprite->sBattler)][(sprite->data[3] << 8)];

            for (i = 0; i < 0x100; i++)
                *(dst++) = 0;

            StartSpriteAnim(sprite, 0);
        }
    }
}

// Used when selecting a move, which can hit multiple targets, in double battles.
void SpriteCB_ShowAsMoveTarget(struct Sprite *sprite)
{
    sprite->data[3] = 8;
    sprite->data[4] = sprite->invisible;
    sprite->callback = SpriteCB_BlinkVisible;
}

static void SpriteCB_BlinkVisible(struct Sprite *sprite)
{
    if (--sprite->data[3] == 0)
    {
        sprite->invisible ^= 1;
        sprite->data[3] = 8;
    }
}

void SpriteCB_HideAsMoveTarget(struct Sprite *sprite)
{
    sprite->invisible = sprite->data[4];
    sprite->data[4] = FALSE;
    sprite->callback = SpriteCallbackDummy_2;
}

void SpriteCB_OpponentMonFromBall(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        if (!(gHitMarker & HITMARKER_NO_ANIMATIONS) || gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK))
        {
            if (HasTwoFramesAnimation(sprite->sSpeciesId))
                StartSpriteAnim(sprite, 1);
        }
        BattleAnimateFrontSprite(sprite, sprite->sSpeciesId, TRUE, 1);
    }
}

// This callback is frequently overwritten by SpriteCB_TrainerSlideIn
void SpriteCB_BattleSpriteStartSlideLeft(struct Sprite *sprite)
{
    sprite->callback = SpriteCB_BattleSpriteSlideLeft;
}

static void SpriteCB_BattleSpriteSlideLeft(struct Sprite *sprite)
{
    if (!(gIntroSlideFlags & 1))
    {
        sprite->x2 -= 2;
        if (sprite->x2 == 0)
        {
            sprite->callback = SpriteCB_Idle;
            sprite->data[1] = 0;
        }
    }
}

static void UNUSED SetIdleSpriteCallback(struct Sprite *sprite)
{
    sprite->callback = SpriteCB_Idle;
}

static void SpriteCB_Idle(struct Sprite *sprite)
{
}

#define sSpeedX data[1]
#define sSpeedY data[2]

void SpriteCB_FaintSlideAnim(struct Sprite *sprite)
{
    if (!(gIntroSlideFlags & 1))
    {
        sprite->x2 += sprite->sSpeedX;
        sprite->y2 += sprite->sSpeedY;
    }
}

#undef sSpeedX
#undef sSpeedY

#define sSinIndex           data[3]
#define sDelta              data[4]
#define sAmplitude          data[5]
#define sBouncerSpriteId    data[6]
#define sWhich              data[7]

void DoBounceEffect(u8 battler, u8 which, s8 delta, s8 amplitude)
{
    u8 invisibleSpriteId;
    u8 bouncerSpriteId;

    switch (which)
    {
    case BOUNCE_HEALTHBOX:
    default:
        if (gBattleSpritesDataPtr->healthBoxesData[battler].healthboxIsBouncing)
            return;
        break;
    case BOUNCE_MON:
        if (gBattleSpritesDataPtr->healthBoxesData[battler].battlerIsBouncing)
            return;
        break;
    }

    invisibleSpriteId = CreateInvisibleSpriteWithCallback(SpriteCB_BounceEffect);
    if (which == BOUNCE_HEALTHBOX)
    {
        bouncerSpriteId = gHealthboxSpriteIds[battler];
        gBattleSpritesDataPtr->healthBoxesData[battler].healthboxBounceSpriteId = invisibleSpriteId;
        gBattleSpritesDataPtr->healthBoxesData[battler].healthboxIsBouncing = 1;
        gSprites[invisibleSpriteId].sSinIndex = 128; // 0
    }
    else
    {
        bouncerSpriteId = gBattlerSpriteIds[battler];
        gBattleSpritesDataPtr->healthBoxesData[battler].battlerBounceSpriteId = invisibleSpriteId;
        gBattleSpritesDataPtr->healthBoxesData[battler].battlerIsBouncing = 1;
        gSprites[invisibleSpriteId].sSinIndex = 192; // -1
    }
    gSprites[invisibleSpriteId].sDelta = delta;
    gSprites[invisibleSpriteId].sAmplitude = amplitude;
    gSprites[invisibleSpriteId].sBouncerSpriteId = bouncerSpriteId;
    gSprites[invisibleSpriteId].sWhich = which;
    gSprites[invisibleSpriteId].sBattler = battler;
    gSprites[bouncerSpriteId].x2 = 0;
    gSprites[bouncerSpriteId].y2 = 0;
}

void EndBounceEffect(u8 battler, u8 which)
{
    u8 bouncerSpriteId;

    if (which == BOUNCE_HEALTHBOX)
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].healthboxIsBouncing)
            return;

        bouncerSpriteId = gSprites[gBattleSpritesDataPtr->healthBoxesData[battler].healthboxBounceSpriteId].sBouncerSpriteId;
        DestroySprite(&gSprites[gBattleSpritesDataPtr->healthBoxesData[battler].healthboxBounceSpriteId]);
        gBattleSpritesDataPtr->healthBoxesData[battler].healthboxIsBouncing = 0;
    }
    else
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].battlerIsBouncing)
            return;

        bouncerSpriteId = gSprites[gBattleSpritesDataPtr->healthBoxesData[battler].battlerBounceSpriteId].sBouncerSpriteId;
        DestroySprite(&gSprites[gBattleSpritesDataPtr->healthBoxesData[battler].battlerBounceSpriteId]);
        gBattleSpritesDataPtr->healthBoxesData[battler].battlerIsBouncing = 0;
    }

    gSprites[bouncerSpriteId].x2 = 0;
    gSprites[bouncerSpriteId].y2 = 0;
}

static void SpriteCB_BounceEffect(struct Sprite *sprite)
{
    u8 bouncerSpriteId = sprite->sBouncerSpriteId;
    s32 index = sprite->sSinIndex;
    s32 y = Sin(index, sprite->sAmplitude) + sprite->sAmplitude;

    gSprites[bouncerSpriteId].y2 = y;
    sprite->sSinIndex = (sprite->sSinIndex + sprite->sDelta) & 0xFF;
}

#undef sSinIndex
#undef sDelta
#undef sAmplitude
#undef sBouncerSpriteId
#undef sWhich

void SpriteCB_PlayerMonFromBall(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
        BattleAnimateBackSprite(sprite, sprite->sSpeciesId);
}

void SpriteCB_PlayerMonSlideIn(struct Sprite *sprite)
{
    if (sprite->data[3] == 0)
    {
        PlaySE(SE_BALL_TRAY_ENTER);
        sprite->data[3]++;
    }
    else if (sprite->data[3] == 1)
    {
        if (sprite->animEnded)
            return;
        sprite->data[4] = sprite->x;
        sprite->x = -33;
        sprite->invisible = FALSE;
        sprite->data[3]++;
    }
    else if (sprite->data[3] < 27)
    {
        sprite->x += 4;
        sprite->data[3]++;
    }
    else
    {
        sprite->data[3] = 0;
        sprite->x = sprite->data[4];
        sprite->data[4] = 0;
        sprite->callback = SpriteCB_PlayerMonFromBall;
        PlayCry_ByMode(sprite->sSpeciesId, -25, CRY_MODE_NORMAL);
    }
}

static void SpriteCB_TrainerThrowObject_Main(struct Sprite *sprite)
{
    AnimSetCenterToCornerVecX(sprite);
    if (sprite->animEnded)
        sprite->callback = SpriteCB_Idle;
}

// Sprite callback for a trainer back pic to throw an object
// (Wally throwing a ball, throwing Pokéblocks/balls in the Safari Zone)
void SpriteCB_TrainerThrowObject(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, 1);
    sprite->callback = SpriteCB_TrainerThrowObject_Main;
}

void AnimSetCenterToCornerVecX(struct Sprite *sprite)
{
    if (sprite->animDelayCounter == 0)
        sprite->centerToCornerVecX = sCenterToCornerVecXs[sprite->animCmdIndex];
}

void BeginBattleIntroDummy(void)
{

}

void BeginBattleIntro(void)
{
    BattleStartClearSetData();
    gBattleCommunication[1] = 0;
    gBattleStruct->eventState.battleIntro = 0;
    gBattleMainFunc = DoBattleIntro;
}

static void BattleMainCB1(void)
{
    u32 battler;

    gBattleMainFunc();
    for (battler = 0; battler < gBattlersCount; battler++)
        gBattlerControllerFuncs[battler](battler);
}

static void ClearSetBScriptingStruct(void)
{
    // windowsType is set up earlier in BattleInitBgsAndWindows, so we need to save the value
    u32 temp = gBattleScripting.windowsType;
    u32 specialBattleType = gBattleScripting.specialTrainerBattleType;
    memset(&gBattleScripting, 0, sizeof(gBattleScripting));

    gBattleScripting.windowsType = temp;
    if (TESTING)
        gBattleScripting.battleStyle = OPTIONS_BATTLE_STYLE_SET;
    else
        gBattleScripting.battleStyle = gSaveBlock2Ptr->optionsBattleStyle;
    gBattleScripting.expOnCatch = (GetConfig(CONFIG_EXP_CATCH) >= GEN_6);
    gBattleScripting.specialTrainerBattleType = specialBattleType;
}

static void BattleStartClearSetData(void)
{
    s32 i;

    TurnValuesCleanUp(FALSE);
    memset(&gSpecialStatuses, 0, sizeof(gSpecialStatuses));

    memset(&gFieldTimers, 0, sizeof(gFieldTimers));
    memset(&gSideStatuses, 0, sizeof(gSideStatuses));
    memset(&gSideTimers, 0, sizeof(gSideTimers));
    memset(&gBattleResults, 0, sizeof(gBattleResults));
    ClearSetBScriptingStruct();

    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        gBattleStruct->battlerState[i].isFirstTurn = 2;
        gLastMoves[i] = MOVE_NONE;
        gLastLandedMoves[i] = MOVE_NONE;
        gLastHitByType[i] = 0;
        gLastUsedMoveType[i] = 0;
        gLastResultingMoves[i] = MOVE_NONE;
        gLastHitBy[i] = 0xFF;
        gLockedMoves[i] = MOVE_NONE;
        gLastPrintedMoves[i] = MOVE_NONE;
        // gPalaceSelectionBattleScripts[i] = 0;
        gBattleStruct->lastTakenMove[i] = MOVE_NONE;
        gBattleStruct->choicedMove[i] = MOVE_NONE;
        gBattleStruct->changedItems[i] = 0;
        gBattleStruct->lastTakenMoveFrom[i][0] = MOVE_NONE;
        gBattleStruct->lastTakenMoveFrom[i][1] = MOVE_NONE;
        gBattleStruct->lastTakenMoveFrom[i][2] = MOVE_NONE;
        gBattleStruct->lastTakenMoveFrom[i][3] = MOVE_NONE;
        gBattleStruct->AI_monToSwitchIntoId[i] = PARTY_SIZE;
        gBattleStruct->skyDropTargets[i] = SKY_DROP_NO_TARGET;
    }

    gLastUsedMove = 0;
    gFieldStatuses = 0;

    gHasFetchedBall = FALSE;
    gLastUsedBall = 0;

    gBattlerAttacker = 0;
    gBattlerTarget = 0;
    gEffectBattler = 0;
    gBattlerAbility = 0;
    gBattleWeather = 0;
    gHitMarker = 0;

    if (!(gBattleTypeFlags & BATTLE_TYPE_RECORDED))
    {
        if (!(gBattleTypeFlags & BATTLE_TYPE_LINK) && gSaveBlock2Ptr->optionsBattleSceneOff == TRUE)
            gHitMarker |= HITMARKER_NO_ANIMATIONS;
    }
    else if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK)) && GetBattleSceneInRecordedBattle())
    {
        gHitMarker |= HITMARKER_NO_ANIMATIONS;
    }

    gMultiHitCounter = 0;
    gBattleOutcome = 0;
    gBattleControllerExecFlags = 0;
    gPaydayMoney = 0;
    gBattleResources->battleScriptsStack->size = 0;
    gBattleResources->battleCallbackStack->size = 0;

    for (i = 0; i < BATTLE_COMMUNICATION_ENTRIES_COUNT; i++)
        gBattleCommunication[i] = 0;

    gPauseCounterBattle = 0;
    gIntroSlideFlags = 0;
    gLeveledUpInBattle = 0;
    gAbsentBattlerFlags = 0;
    gBattleStruct->runTries = 0;
    gBattleStruct->safariRockThrowCounter = 0;
    gBattleStruct->safariBaitThrowCounter = 0;
    gBattleStruct->safariCatchFactor = gSpeciesInfo[GetMonData(&gEnemyParty[0], MON_DATA_SPECIES)].catchRate * 100 / 1275;
    gBattleStruct->safariEscapeFactor = 3;
    gBattleStruct->wildVictorySong = 0;
    gBattleStruct->moneyMultiplier = 1;

    gBattleStruct->givenExpMons = 0;
    gBattleStruct->palaceFlags = 0;

    gBattleResults.shinyWildMon = IsMonShiny(&gEnemyParty[0]);

    gBattleStruct->arenaLostPlayerMons = 0;
    gBattleStruct->arenaLostOpponentMons = 0;

    for (i = 0; i < ARRAY_COUNT(gSideTimers); i++)
    {
        gSideTimers[i].stickyWebBattlerId = 0xFF;
    }
    gBattleStruct->beatUpSlot = 0;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        gBattleStruct->partyState[B_SIDE_PLAYER][i].usedHeldItem = ITEM_NONE;
        gBattleStruct->partyState[B_SIDE_OPPONENT][i].usedHeldItem = ITEM_NONE;
        gBattleStruct->itemLost[B_SIDE_PLAYER][i].originalItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        gBattleStruct->itemLost[B_SIDE_OPPONENT][i].originalItem = GetMonData(&gEnemyParty[i], MON_DATA_HELD_ITEM);
        gPartyCriticalHits[i] = 0;
    }

    gBattleStruct->swapDamageCategory = FALSE; // Photon Geyser, Shell Side Arm, Light That Burns the Sky
    gBattleStruct->categoryOverride = FALSE; // used for Z-Moves and Max Moves

    ClearPursuitValues();
    gSelectedMonPartyId = PARTY_SIZE; // Revival Blessing
    gCategoryIconSpriteId = 0xFF;

    if (IsSleepClauseEnabled())
    {
        // If monCausingSleepClause[side] equals PARTY_SIZE, Sleep Clause is not active for the given side.
        gBattleStruct->monCausingSleepClause[B_SIDE_PLAYER] = PARTY_SIZE;
        gBattleStruct->monCausingSleepClause[B_SIDE_OPPONENT] = PARTY_SIZE;
    }
}

#define UNPACK_VOLATILE_BATON_PASSABLES(_enum, _fieldName, _typeMaxValue, ...) __VA_OPT__(if ((FIRST(__VA_ARGS__)) & V_BATON_PASSABLE) gBattleMons[battler].volatiles._fieldName = volatilesCopy->_fieldName;)

void SwitchInClearSetData(u32 battler, struct Volatiles *volatilesCopy)
{
    s32 i;
    enum BattleMoveEffects effect = GetMoveEffect(gCurrentMove);

    ClearIllusionMon(battler);
    if (effect != EFFECT_BATON_PASS)
    {
        for (i = 0; i < NUM_BATTLE_STATS; i++)
            gBattleMons[battler].statStages[i] = DEFAULT_STAT_STAGE;
        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattleMons[i].volatiles.escapePrevention && gBattleMons[i].volatiles.battlerPreventingEscape == battler)
                gBattleMons[i].volatiles.escapePrevention = FALSE;
            if (gBattleMons[i].volatiles.lockOn && gBattleMons[i].volatiles.battlerWithSureHit == battler)
            {
                gBattleMons[i].volatiles.lockOn = 0;
                gBattleMons[i].volatiles.battlerWithSureHit = 0;
            }
        }
    }

    // Clear volatiles - reapply some if Baton Pass was used
    memset(&gBattleMons[battler].volatiles, 0, sizeof(struct Volatiles));
    if (effect == EFFECT_BATON_PASS)
    {
        // Transfer Baton Passable volatile statuses
        VOLATILE_DEFINITIONS(UNPACK_VOLATILE_BATON_PASSABLES)
        /* Expands to the following (compiler removes `if` statements):
         * gBattleMons[battler].volatiles.confusionTurns = volatilesCopy->confusionTurns;
         * gBattleMons[battler].volatiles.substitute = volatilesCopy->substitute;
         * gBattleMons[battler].volatiles.escapePrevention = volatilesCopy->escapePrevention;
         * ...etc
         */

        for (i = 0; i < gBattlersCount; i++)
        {
            if (!IsBattlerAlly(battler, i)
             && gBattleMons[i].volatiles.lockOn != 0
             && (gBattleMons[i].volatiles.battlerWithSureHit == battler))
            {
                gBattleMons[i].volatiles.lockOn = 0;
            }
        }
        if (gBattleMons[battler].volatiles.powerTrick)
            SWAP(gBattleMons[battler].attack, gBattleMons[battler].defense, i);
    }

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gBattleMons[i].volatiles.infatuation == INFATUATED_WITH(battler))
            gBattleMons[i].volatiles.infatuation = 0;
        if (gBattleMons[i].volatiles.wrapped && gBattleMons[i].volatiles.wrappedBy == battler)
            gBattleMons[i].volatiles.wrapped = FALSE;
        if (gBattleMons[i].volatiles.syrupBomb && gBattleMons[i].volatiles.stickySyrupedBy == battler)
            gBattleMons[i].volatiles.syrupBomb = FALSE;
        if (gBattleMons[i].volatiles.octolock && gBattleMons[i].volatiles.octolockedBy == battler)
            gBattleMons[i].volatiles.octolock = FALSE;
    }

    gActionSelectionCursor[battler] = 0;
    gMoveSelectionCursor[battler] = 0;

    if (GetProtectType(gProtectStructs[battler].protected) == PROTECT_TYPE_SINGLE) // Side type protects expire at the end of the turn
        gProtectStructs[battler].protected = PROTECT_NONE;

    if (effect == EFFECT_BATON_PASS)
    {
        gBattleMons[battler].volatiles.substituteHP = volatilesCopy->substituteHP;
        gBattleMons[battler].volatiles.battlerWithSureHit = volatilesCopy->battlerWithSureHit;
        gBattleMons[battler].volatiles.perishSongTimer = volatilesCopy->perishSongTimer;
        gBattleMons[battler].volatiles.battlerPreventingEscape = volatilesCopy->battlerPreventingEscape;
        gBattleMons[battler].volatiles.embargoTimer = volatilesCopy->embargoTimer;
        gBattleMons[battler].volatiles.healBlockTimer = volatilesCopy->healBlockTimer;
    }
    else if (effect == EFFECT_SHED_TAIL)
    {
        gBattleMons[battler].volatiles.substitute = TRUE;
        gBattleMons[battler].volatiles.substituteHP = volatilesCopy->substituteHP;
    }

    gBattleStruct->moveResultFlags[battler] = 0;
    gBattleStruct->battlerState[battler].isFirstTurn = 2;
    gBattleStruct->battlerState[battler].fainted = FALSE;
    gBattleMons[battler].volatiles.truantSwitchInHack = volatilesCopy->truantSwitchInHack;
    gLastMoves[battler] = MOVE_NONE;
    gLastLandedMoves[battler] = MOVE_NONE;
    gLastHitByType[battler] = 0;
    gLastUsedMoveType[battler] = 0;
    gLastResultingMoves[battler] = MOVE_NONE;
    gLastPrintedMoves[battler] = MOVE_NONE;
    gLastHitBy[battler] = 0xFF;

    gBattleStruct->lastTakenMove[battler] = 0;
    gBattleStruct->lastTakenMoveFrom[battler][0] = 0;
    gBattleStruct->lastTakenMoveFrom[battler][1] = 0;
    gBattleStruct->lastTakenMoveFrom[battler][2] = 0;
    gBattleStruct->lastTakenMoveFrom[battler][3] = 0;
    gBattleStruct->battlerState[battler].stompingTantrumTimer = 0;
    gBattleStruct->palaceFlags &= ~(1u << battler);
    gBattleStruct->battlerState[battler].canPickupItem = FALSE;
    gBattleStruct->battlerState[battler].wasAboveHalfHp = gBattleMons[battler].hp > gBattleMons[battler].maxHP / 2;
    gBattleStruct->hazardsCounter = 0;

    ClearPursuitValuesIfSet(battler);

    for (i = 0; i < ARRAY_COUNT(gSideTimers); i++)
    {
        // Switched into sticky web user slot, so reset stored battler ID
        if (gSideTimers[i].stickyWebBattlerId == battler)
            gSideTimers[i].stickyWebBattlerId = 0xFF;
    }

    for (i = 0; i < gBattlersCount; i++)
    {
        if (i != battler && !IsBattlerAlly(i, battler))
            gBattleStruct->lastTakenMove[i] = MOVE_NONE;

        gBattleStruct->lastTakenMoveFrom[i][battler] = 0;
    }

    gBattleStruct->choicedMove[battler] = MOVE_NONE;
    gBattleStruct->eventState.arenaTurn = 0xFF;

    // Reset damage to prevent things like red card activating if the switched-in mon is holding it
    gSpecialStatuses[battler].damagedByAttack = FALSE;

    // Reset Eject Button / Eject Pack switch detection
    gAiLogicData->ejectButtonSwitch = FALSE;
    gAiLogicData->ejectPackSwitch = FALSE;

    // Clear selected party ID so Revival Blessing doesn't get confused.
    gSelectedMonPartyId = PARTY_SIZE;

    // Allow for illegal abilities within tests.
    #if TESTING
    if (gTestRunnerEnabled)
    {
        enum BattleTrainer trainer = GetBattlerTrainer(battler);
        u32 partyIndex = gBattlerPartyIndexes[battler];
        if (TestRunner_Battle_GetForcedAbility(trainer, partyIndex))
            gBattleMons[i].ability = TestRunner_Battle_GetForcedAbility(trainer, partyIndex);
    }
    #endif // TESTING

    Ai_UpdateSwitchInData(battler);
}

const u8* FaintClearSetData(u32 battler)
{
    s32 i;
    const u8 *result = NULL;

    for (i = 0; i < NUM_BATTLE_STATS; i++)
        gBattleMons[battler].statStages[i] = DEFAULT_STAT_STAGE;

    bool32 keepGastroAcid = gBattleMons[battler].volatiles.gastroAcid;
    memset(&gBattleMons[battler].volatiles, 0, sizeof(struct Volatiles));
    gBattleMons[battler].volatiles.gastroAcid = keepGastroAcid; // Edge case: Keep Gastro Acid if pokemon's ability can have effect after fainting, for example Innards Out.

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gBattleMons[i].volatiles.escapePrevention && gBattleMons[i].volatiles.battlerPreventingEscape == battler)
            gBattleMons[i].volatiles.escapePrevention = FALSE;
        if (gBattleMons[i].volatiles.infatuation == INFATUATED_WITH(battler))
            gBattleMons[i].volatiles.infatuation = 0;
        if (gBattleMons[i].volatiles.wrapped && gBattleMons[i].volatiles.wrappedBy == battler)
            gBattleMons[i].volatiles.wrapped = FALSE;
        if (gBattleMons[i].volatiles.syrupBomb && gBattleMons[i].volatiles.stickySyrupedBy == battler)
            gBattleMons[i].volatiles.syrupBomb = FALSE;
        if (gBattleMons[i].volatiles.octolock && gBattleMons[i].volatiles.octolockedBy == battler)
            gBattleMons[i].volatiles.octolock = FALSE;
    }

    gActionSelectionCursor[battler] = 0;
    gMoveSelectionCursor[battler] = 0;

    if (GetProtectType(gProtectStructs[battler].protected) == PROTECT_TYPE_SINGLE) // Side type protects expire at the end of the turn
        gProtectStructs[battler].protected = PROTECT_NONE;

    gProtectStructs[battler].quash = FALSE;
    gProtectStructs[battler].noValidMoves = FALSE;
    gProtectStructs[battler].helpingHand = 0;
    gProtectStructs[battler].bounceMove = FALSE;
    gProtectStructs[battler].stealMove = FALSE;
    gProtectStructs[battler].chargingTurn = FALSE;
    gProtectStructs[battler].fleeType = 0;
    gProtectStructs[battler].statRaised = FALSE;
    gProtectStructs[battler].pranksterElevated = FALSE;

    gBattleStruct->battlerState[battler].isFirstTurn = 2;

    gLastMoves[battler] = MOVE_NONE;
    gLastLandedMoves[battler] = MOVE_NONE;
    gLastHitByType[battler] = 0;
    gLastUsedMoveType[battler] = 0;
    gLastResultingMoves[battler] = MOVE_NONE;
    gLastPrintedMoves[battler] = MOVE_NONE;
    gLastHitBy[battler] = 0xFF;

    gBattleStruct->choicedMove[battler] = MOVE_NONE;
    gBattleStruct->lastTakenMove[battler] = MOVE_NONE;
    gBattleStruct->lastTakenMoveFrom[battler][0] = 0;
    gBattleStruct->lastTakenMoveFrom[battler][1] = 0;
    gBattleStruct->lastTakenMoveFrom[battler][2] = 0;
    gBattleStruct->lastTakenMoveFrom[battler][3] = 0;
    gBattleStruct->palaceFlags &= ~(1u << battler);

    ClearPursuitValuesIfSet(battler);

    if (gBattleStruct->battlerState[battler].commanderSpecies != SPECIES_NONE)
    {
        u32 partner = BATTLE_PARTNER(battler);
        if (IsBattlerAlive(partner))
        {
            BtlController_EmitSpriteInvisibility(partner, B_COMM_TO_CONTROLLER, FALSE);
            MarkBattlerForControllerExec(partner);
        }
    }

    for (i = 0; i < ARRAY_COUNT(gSideTimers); i++)
    {
        // User of sticky web fainted, so reset the stored battler ID
        if (gSideTimers[i].stickyWebBattlerId == battler)
            gSideTimers[i].stickyWebBattlerId = 0xFF;
    }

    for (i = 0; i < gBattlersCount; i++)
    {
        if (i != battler && !IsBattlerAlly(i, battler))
            gBattleStruct->lastTakenMove[i] = MOVE_NONE;

        gBattleStruct->lastTakenMoveFrom[i][battler] = 0;
    }

    gBattleMons[battler].types[0] = GetSpeciesType(gBattleMons[battler].species, 0);
    gBattleMons[battler].types[1] = GetSpeciesType(gBattleMons[battler].species, 1);
    gBattleMons[battler].types[2] = TYPE_MYSTERY;

    Ai_UpdateFaintData(battler);
    TryBattleFormChange(battler, FORM_CHANGE_FAINT);

    // If the fainted mon was involved in a Sky Drop
    if (gBattleStruct->skyDropTargets[battler] != SKY_DROP_NO_TARGET)
    {
        // Get battler id of the other Pokemon involved in this Sky Drop
        u8 otherSkyDropper = gBattleStruct->skyDropTargets[battler];

        // Clear Sky Drop data
        gBattleStruct->skyDropTargets[battler] = SKY_DROP_NO_TARGET;
        gBattleStruct->skyDropTargets[otherSkyDropper] = SKY_DROP_NO_TARGET;

        // If the other Pokemon involved in this Sky Drop was the target, not the attacker
        if (gBattleMons[otherSkyDropper].volatiles.semiInvulnerable == STATE_SKY_DROP)
        {
            // Release the target and take them out of the semi-invulnerable state
            gBattleMons[otherSkyDropper].volatiles.semiInvulnerable = STATE_NONE;

            // Make the target's sprite visible
            gSprites[gBattlerSpriteIds[otherSkyDropper]].invisible = FALSE;

            // If the target was sky dropped in the middle of using Outrage/Petal Dance/Thrash,
            // confuse them upon release and print "confused via fatigue" message and animation.
            if (gBattleMons[otherSkyDropper].volatiles.rampageTurns)
            {
                gBattleMons[otherSkyDropper].volatiles.rampageTurns = 0;

                // If the released mon can be confused, do so.
                // Don't use CanBeConfused here, since it can cause issues in edge cases.
                enum Ability ability = GetBattlerAbility(otherSkyDropper);
                if (!(ability == ABILITY_OWN_TEMPO
                    || gBattleMons[otherSkyDropper].volatiles.confusionTurns
                    || IsMistyTerrainAffected(otherSkyDropper, ability, GetBattlerHoldEffect(otherSkyDropper), gFieldStatuses)))
                {
                    gBattleMons[otherSkyDropper].volatiles.confusionTurns = ((Random()) % 4) + 2;
                    gBattlerAttacker = otherSkyDropper;
                    result = BattleScript_ThrashConfuses;
                }
            }
        }
    }

    return result;
}

static void DoBattleIntro(void)
{
    s32 i;
    u32 battler;

    switch ((enum BattleIntroStates)gBattleStruct->eventState.battleIntro)
    {
    case BATTLE_INTRO_STATE_GET_MON_DATA:
        battler = gBattleCommunication[1];
        BtlController_EmitGetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_ALL_BATTLE, 0);
        MarkBattlerForControllerExec(battler);
        gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_LOOP_BATTLER_DATA:
        if (!gBattleControllerExecFlags)
        {
            if (++gBattleCommunication[1] == gBattlersCount)
                gBattleStruct->eventState.battleIntro++;
            else
                gBattleStruct->eventState.battleIntro = BATTLE_INTRO_STATE_GET_MON_DATA;
        }
        break;
    case BATTLE_INTRO_STATE_PREPARE_BG_SLIDE:
        if (!gBattleControllerExecFlags)
        {
            battler = GetBattlerAtPosition(0);
            BtlController_EmitIntroSlide(battler, B_COMM_TO_CONTROLLER, gBattleEnvironment);
            MarkBattlerForControllerExec(battler);
            gBattleCommunication[0] = 0;
            gBattleCommunication[1] = 0;
            gBattleStruct->eventState.battleIntro++;
        }
        break;
    case BATTLE_INTRO_STATE_WAIT_FOR_BG_SLIDE:
        if (!gBattleControllerExecFlags)
            gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_DRAW_SPRITES:
        for (battler = 0; battler < gBattlersCount; battler++)
        {
            if ((gBattleTypeFlags & BATTLE_TYPE_SAFARI) && IsOnPlayerSide(battler))
            {
                memset(&gBattleMons[battler], 0, sizeof(struct BattlePokemon));
            }
            else
            {
                memcpy(&gBattleMons[battler], &gBattleResources->bufferB[battler][4], sizeof(struct BattlePokemon));
                gBattleMons[battler].types[0] = GetSpeciesType(gBattleMons[battler].species, 0);
                gBattleMons[battler].types[1] = GetSpeciesType(gBattleMons[battler].species, 1);
                gBattleMons[battler].types[2] = TYPE_MYSTERY;
                gBattleMons[battler].ability = GetAbilityBySpecies(gBattleMons[battler].species, gBattleMons[battler].abilityNum);
                gBattleStruct->battlerState[battler].hpOnSwitchout = gBattleMons[battler].hp;
                memset(&gBattleMons[battler].volatiles, 0, sizeof(struct Volatiles));
                for (i = 0; i < NUM_BATTLE_STATS; i++)
                    gBattleMons[battler].statStages[i] = DEFAULT_STAT_STAGE;
                #if TESTING
                if (gTestRunnerEnabled)
                {
                    enum BattleTrainer trainer = GetBattlerTrainer(battler);
                    u32 partyIndex = gBattlerPartyIndexes[battler];
                    if (TestRunner_Battle_GetForcedAbility(trainer, partyIndex))
                        gBattleMons[battler].ability = TestRunner_Battle_GetForcedAbility(trainer, partyIndex);
                }
                #endif
            }

            // Draw sprite.
            switch (GetBattlerPosition(battler))
            {
            case B_POSITION_PLAYER_LEFT: // player sprite
                BtlController_EmitDrawTrainerPic(battler, B_COMM_TO_CONTROLLER);
                MarkBattlerForControllerExec(battler);
                break;
            case B_POSITION_OPPONENT_LEFT:
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER) // opponent 1 sprite
                {
                    BtlController_EmitDrawTrainerPic(battler, B_COMM_TO_CONTROLLER);
                    MarkBattlerForControllerExec(battler);
                }
                else // wild mon 1
                {
                    BtlController_EmitLoadMonSprite(battler, B_COMM_TO_CONTROLLER);
                    MarkBattlerForControllerExec(battler);
                    gBattleResults.lastOpponentSpecies = GetMonData(GetBattlerMon(battler), MON_DATA_SPECIES);
                }
                break;
            case B_POSITION_PLAYER_RIGHT:
                if (gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER)) // partner sprite
                {
                    BtlController_EmitDrawTrainerPic(battler, B_COMM_TO_CONTROLLER);
                    MarkBattlerForControllerExec(battler);
                }
                break;
            case B_POSITION_OPPONENT_RIGHT:
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                {
                    if (gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_TWO_OPPONENTS) && !BATTLE_TWO_VS_ONE_OPPONENT) // opponent 2 if exists
                    {
                        BtlController_EmitDrawTrainerPic(battler, B_COMM_TO_CONTROLLER);
                        MarkBattlerForControllerExec(battler);
                    }
                }
                else if (IsBattlerAlive(battler)) // wild mon 2 if alive
                {
                    BtlController_EmitLoadMonSprite(battler, B_COMM_TO_CONTROLLER);
                    MarkBattlerForControllerExec(battler);
                    gBattleResults.lastOpponentSpecies = GetMonData(GetBattlerMon(battler), MON_DATA_SPECIES);
                }
                break;
            default:
                break;
            }

            // if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
            //     BattleArena_InitPoints();
        }

        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            gBattleStruct->eventState.battleIntro++;
        else // Skip party summary since it is a wild battle.
            gBattleStruct->eventState.battleIntro = BATTLE_INTRO_STATE_INTRO_TEXT;
        break;
    case BATTLE_INTRO_STATE_DRAW_PARTY_SUMMARY:
        if (!gBattleControllerExecFlags)
        {
            struct HpAndStatus hpStatus[PARTY_SIZE];

            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES_OR_EGG) == SPECIES_NONE
                 || GetMonData(&gEnemyParty[i], MON_DATA_SPECIES_OR_EGG) == SPECIES_EGG)
                {
                    hpStatus[i].hp = HP_EMPTY_SLOT;
                    hpStatus[i].status = 0;
                }
                else
                {
                    hpStatus[i].hp = GetMonData(&gEnemyParty[i], MON_DATA_HP);
                    hpStatus[i].status = GetMonData(&gEnemyParty[i], MON_DATA_STATUS);
                }
            }

            battler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            BtlController_EmitDrawPartyStatusSummary(battler, B_COMM_TO_CONTROLLER, hpStatus, PARTY_SUMM_SKIP_DRAW_DELAY);
            MarkBattlerForControllerExec(battler);

            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG) == SPECIES_NONE
                 || GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG) == SPECIES_EGG)
                {
                    hpStatus[i].hp = HP_EMPTY_SLOT;
                    hpStatus[i].status = 0;
                }
                else
                {
                    hpStatus[i].hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
                    hpStatus[i].status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
                }
            }

            battler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
            BtlController_EmitDrawPartyStatusSummary(battler, B_COMM_TO_CONTROLLER, hpStatus, PARTY_SUMM_SKIP_DRAW_DELAY);
            MarkBattlerForControllerExec(battler);

            gBattleStruct->eventState.battleIntro++;
        }
        break;
    case BATTLE_INTRO_STATE_WAIT_FOR_PARTY_SUMMARY:
        if (!gBattleControllerExecFlags)
            gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_INTRO_TEXT:
        if (!IsBattlerMarkedForControllerExec(GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)))
        {
            PrepareStringBattle(STRINGID_INTROMSG, GetBattlerAtPosition(B_POSITION_PLAYER_LEFT));
            gBattleStruct->eventState.battleIntro++;
        }
        break;
    case BATTLE_INTRO_STATE_WAIT_FOR_INTRO_TEXT:
        if (!IsBattlerMarkedForControllerExec(GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)))
        {
            if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            {
                gBattleStruct->eventState.battleIntro++;
            }
            else
            {
                if (B_FAST_INTRO_PKMN_TEXT == TRUE)
                    gBattleStruct->eventState.battleIntro = BATTLE_INTRO_STATE_WAIT_FOR_WILD_BATTLE_TEXT;
                else
                    gBattleStruct->eventState.battleIntro = BATTLE_INTRO_STATE_WAIT_FOR_TRAINER_2_SEND_OUT_ANIM;
            }
        }
        break;
    case BATTLE_INTRO_STATE_TRAINER_SEND_OUT_TEXT:
        if (gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK && !(gBattleTypeFlags & BATTLE_TYPE_RECORDED_IS_MASTER))
            PrepareStringBattle(STRINGID_INTROSENDOUT, GetBattlerAtPosition(B_POSITION_PLAYER_LEFT));
        else
            PrepareStringBattle(STRINGID_INTROSENDOUT, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT));
        gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_WAIT_FOR_TRAINER_SEND_OUT_TEXT:
        if (!gBattleControllerExecFlags)
            gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_TRAINER_1_SEND_OUT_ANIM:
        if (gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK && !(gBattleTypeFlags & BATTLE_TYPE_RECORDED_IS_MASTER))
            battler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        else
            battler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);

        BtlController_EmitIntroTrainerBallThrow(battler, B_COMM_TO_CONTROLLER);
        MarkBattlerForControllerExec(battler);
        gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_TRAINER_2_SEND_OUT_ANIM:
        if (gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_TWO_OPPONENTS) && !BATTLE_TWO_VS_ONE_OPPONENT)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK && !(gBattleTypeFlags & BATTLE_TYPE_RECORDED_IS_MASTER))
                battler = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            else
                battler = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);

            BtlController_EmitIntroTrainerBallThrow(battler, B_COMM_TO_CONTROLLER);
            MarkBattlerForControllerExec(battler);
        }
        if (B_FAST_INTRO_PKMN_TEXT == TRUE
          && !(gBattleTypeFlags & (BATTLE_TYPE_RECORDED | BATTLE_TYPE_RECORDED_LINK | BATTLE_TYPE_RECORDED_IS_MASTER | BATTLE_TYPE_LINK)))
            gBattleStruct->eventState.battleIntro = BATTLE_INTRO_STATE_WAIT_FOR_WILD_BATTLE_TEXT; // Print at the same time as trainer sends out second mon.
        else
            gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_WAIT_FOR_TRAINER_2_SEND_OUT_ANIM:
        if (!gBattleControllerExecFlags)
            gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_WAIT_FOR_WILD_BATTLE_TEXT:
        if (!IsBattlerMarkedForControllerExec(GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)))
        {
            if (gBattleTypeFlags & BATTLE_TYPE_GHOST && CheckBagHasItem(ITEM_SILPH_SCOPE, 1))
            {
                gBattleScripting.battler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
                BattleScriptExecute(BattleScript_SilphScopeUnveiled);
            }
            gBattleStruct->eventState.battleIntro++;
        }
        break;
    case BATTLE_INTRO_STATE_PRINT_PLAYER_SEND_OUT_TEXT:
        if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI))
        {
            if (gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK && !(gBattleTypeFlags & BATTLE_TYPE_RECORDED_IS_MASTER))
                battler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            else
                battler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);

            // A hack that makes fast intro work in trainer battles too.
            if (B_FAST_INTRO_PKMN_TEXT == TRUE
                && gBattleTypeFlags & BATTLE_TYPE_TRAINER
                && !(gBattleTypeFlags & (BATTLE_TYPE_RECORDED | BATTLE_TYPE_RECORDED_LINK | BATTLE_TYPE_RECORDED_IS_MASTER | BATTLE_TYPE_LINK))
                && gSprites[gHealthboxSpriteIds[battler ^ BIT_SIDE]].callback == SpriteCallbackDummy)
            {
                return;
            }

            PrepareStringBattle(STRINGID_INTROSENDOUT, battler);
        }
        gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_WAIT_FOR_PLAYER_SEND_OUT_TEXT:
        if (!(gBattleTypeFlags & BATTLE_TYPE_LINK && gBattleControllerExecFlags))
        {
            if (gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK && !(gBattleTypeFlags & BATTLE_TYPE_RECORDED_IS_MASTER))
                battler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            else
                battler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);

            if (!IsBattlerMarkedForControllerExec(battler))
                gBattleStruct->eventState.battleIntro++;
        }
        break;
    case BATTLE_INTRO_STATE_PRINT_PLAYER_1_SEND_OUT_TEXT:
        if (gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK && !(gBattleTypeFlags & BATTLE_TYPE_RECORDED_IS_MASTER))
            battler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        else
            battler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);

        BtlController_EmitIntroTrainerBallThrow(battler, B_COMM_TO_CONTROLLER);
        MarkBattlerForControllerExec(battler);
        gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_PRINT_PLAYER_2_SEND_OUT_TEXT:
        if (gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER))
        {
            if (gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK && !(gBattleTypeFlags & BATTLE_TYPE_RECORDED_IS_MASTER))
                battler = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            else
                battler = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);

            BtlController_EmitIntroTrainerBallThrow(battler, B_COMM_TO_CONTROLLER);
            MarkBattlerForControllerExec(battler);
        }
        gBattleStruct->eventState.battleIntro++;
        break;
    case BATTLE_INTRO_STATE_SET_DEX_AND_BATTLE_VARS:
        if (!gBattleControllerExecFlags)
        {
            gBattleStruct->eventState.beforeFirstTurn = 0;
            gBattleStruct->switchInBattlerCounter = 0;
            Ai_InitPartyStruct(); // Save mons party counts, and first 2/4 mons on the battlefield.

            // mark all battlers as sent out
            for (battler = 0; battler < gBattlersCount; battler++)
                GetBattlerPartyState(battler)->sentOut = TRUE;

#define UNPACK_STARTING_STATUS_TO_BATTLE(_enum, _fieldName, ...) gStartingStatuses._fieldName = (statusesOpponentA._fieldName || statusesOpponentB._fieldName || gStartingStatuses._fieldName);

            struct StartingStatuses statusesOpponentA = {0};
            struct StartingStatuses statusesOpponentB = {0};

            // Try to set a status to start the battle with
            if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            {
                statusesOpponentA = GetTrainerStartingStatusFromId(TRAINER_BATTLE_PARAM.opponentA);
                if (TRAINER_BATTLE_PARAM.opponentB != 0xFFFF)
                    statusesOpponentB = GetTrainerStartingStatusFromId(TRAINER_BATTLE_PARAM.opponentB);
            }
            STARTING_STATUS_DEFINITIONS(UNPACK_STARTING_STATUS_TO_BATTLE);
            gBattleMainFunc = TryDoEventsBeforeFirstTurn;
        }
        break;
    }
}

static void TryDoEventsBeforeFirstTurn(void)
{
    s32 i;

    if (gBattleControllerExecFlags)
        return;

    switch (gBattleStruct->eventState.beforeFirstTurn)
    {
    case FIRST_TURN_EVENTS_START:
        // Set invalid mons as absent(for example when starting a double battle with only one pokemon).
        if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI))
        {
            for (i = 0; i < gBattlersCount; i++)
            {
                gBattleStruct->monToSwitchIntoId[i] = PARTY_SIZE; // Included here because switches can happen before during set ups (eg. eject pack)
                struct Pokemon *mon = GetBattlerMon(i);
                if (!IsBattlerAlive(i) || gBattleMons[i].species == SPECIES_NONE || GetMonData(mon, MON_DATA_IS_EGG))
                    gAbsentBattlerFlags |= 1u << i;
            }
        }

        // Allow for illegal abilities within tests.
        #if TESTING
        if (gTestRunnerEnabled)
        {
            for (i = 0; i < gBattlersCount; ++i)
            {
                enum BattleTrainer trainer = GetBattlerTrainer(i);
                u32 partyIndex = gBattlerPartyIndexes[i];
                if (TestRunner_Battle_GetForcedAbility(trainer, partyIndex))
                    gBattleMons[i].ability = TestRunner_Battle_GetForcedAbility(trainer, partyIndex);
            }
        }
        #endif // TESTING

        gBattleStruct->speedTieBreaks = RandomUniform(RNG_SPEED_TIE, 0, Factorial(MAX_BATTLERS_COUNT) - 1);
        gBattleTurnCounter = 0;
        gBattleStruct->eventState.beforeFirstTurn++;
        break;
    case FIRST_TURN_EVENTS_OVERWORLD_WEATHER:
        gBattleStruct->eventState.beforeFirstTurn++;
        if (TryFieldEffects(FIELD_EFFECT_OVERWORLD_WEATHER))
            return;
        break;
    case FIRST_TURN_EVENTS_TERRAIN:
        gBattleStruct->eventState.beforeFirstTurn++;
        if (TryFieldEffects(FIELD_EFFECT_OVERWORLD_TERRAIN))
            return;
        break;
    case FIRST_TURN_EVENTS_STARTING_STATUS:
        while (TRUE)
        {
            if (TryFieldEffects(FIELD_EFFECT_TRAINER_STATUSES))
                return;
            break;
        }
        gBattleStruct->eventState.beforeFirstTurn++;
        break;
    case FIRST_TURN_EVENTS_TOTEM_BOOST:
        for (i = 0; i < gBattlersCount; i++)
        {
            if (gQueuedStatBoosts[i].stats != 0 && !gProtectStructs[i].eatMirrorHerb && gProtectStructs[i].activateOpportunist == 0)
            {
                gBattlerAttacker = i;
                BattleScriptExecute(BattleScript_TotemVar);
                return;
            }
        }
        memset(gQueuedStatBoosts, 0, sizeof(gQueuedStatBoosts)); // erase all totem boosts for Mirror Herb and Opportunist
        gBattleStruct->eventState.beforeFirstTurn++;
        break;
    case FIRST_TURN_SWITCH_IN_EVENTS:
        gBattleStruct->eventState.switchIn = 0;
        for (u32 battler = 0; battler < gBattlersCount; battler++)
            gBattleStruct->battlerState[battler].switchIn = TRUE;
        BattleScriptPushCursorAndCallback(BattleScript_FirstTurnSwitchInEvents);
        gBattleStruct->eventState.beforeFirstTurn++;
        break;
    case FIRST_TURN_FAINTED_BATTLERS:
        // Handle any Pokemon that fainted from starting hazards before transitioning to action selection
        if (HandleFaintedMonActions())
            return;
        gBattleStruct->eventState.faintedAction = 0;
        gBattleStruct->eventState.beforeFirstTurn++;
        break;
    case FIRST_TURN_EVENTS_TRAINER_SLIDE_A:
        if (ShouldDoTrainerSlide(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), TRAINER_SLIDE_BEFORE_FIRST_TURN))
            BattleScriptExecute(BattleScript_TrainerASlideMsgEnd2);
        gBattleStruct->eventState.beforeFirstTurn++;
        break;
    case FIRST_TURN_EVENTS_TRAINER_SLIDE_B:
        if (ShouldDoTrainerSlide(GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT), TRAINER_SLIDE_BEFORE_FIRST_TURN))
        {
            // Ensures only trainer A slide is played in single-trainer doubles (B == A / B == TRAINER_NONE) and 2v1 multibattles (B == 0xFFFF)
            if (!((TRAINER_BATTLE_PARAM.opponentB == TRAINER_BATTLE_PARAM.opponentA)
            || (TRAINER_BATTLE_PARAM.opponentB == TRAINER_NONE)
            || (TRAINER_BATTLE_PARAM.opponentB == 0xFFFF)))
            {
                BattleScriptExecute(BattleScript_TrainerBSlideMsgEnd2);
            }
        }
        gBattleStruct->eventState.beforeFirstTurn++;
        break;
    case FIRST_TURN_EVENTS_TRAINER_SLIDE_PARTNER:
        if (ShouldDoTrainerSlide(GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT), TRAINER_SLIDE_BEFORE_FIRST_TURN))
            BattleScriptExecute(BattleScript_TrainerPartnerSlideMsgEnd2);
        gBattleStruct->eventState.beforeFirstTurn++;
        break;
    case FIRST_TURN_EVENTS_END:
        for (i = 0; i < MAX_BATTLERS_COUNT; i++)
        {
            gBattleStruct->monToSwitchIntoId[i] = PARTY_SIZE;
            gChosenActionByBattler[i] = B_ACTION_NONE;
            gChosenMoveByBattler[i] = MOVE_NONE;
        }
        TurnValuesCleanUp(FALSE);
        memset(&gSpecialStatuses, 0, sizeof(gSpecialStatuses));
        BattlePutTextOnWindow(gText_EmptyString3, B_WIN_MSG);
        AssignUsableGimmicks();
        gBattleMainFunc = HandleTurnActionSelectionState;
        ResetSentPokesToOpponentValue();

        for (i = 0; i < BATTLE_COMMUNICATION_ENTRIES_COUNT; i++)
            gBattleCommunication[i] = 0;

        gBattleStruct->eventState.endTurnBlock = 0;
        gBattleStruct->eventState.endTurnBattler = 0;
        gBattleScripting.moveendState = 0;
        gBattleStruct->eventState.faintedAction = 0;
        gBattleStruct->eventState.endTurn = 0;

        memset(gQueuedStatBoosts, 0, sizeof(gQueuedStatBoosts));
        SetShellSideArmCategory();
        SetAiLogicDataForTurn(gAiLogicData); // get assumed abilities, hold effects, etc of all battlers

        // if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
        // {
        //     StopCryAndClearCrySongs();
        //     BattleScriptExecute(BattleScript_ArenaTurnBeginning);
        // }

        gBattleStruct->eventState.beforeFirstTurn = 0;
        break;
    }
}

static void HandleEndTurn_ContinueBattle(void)
{
    s32 i;

    if (gBattleControllerExecFlags == 0)
    {
        gBattleMainFunc = BattleTurnPassed;
        for (i = 0; i < BATTLE_COMMUNICATION_ENTRIES_COUNT; i++)
            gBattleCommunication[i] = 0;
        for (i = 0; i < gBattlersCount; i++)
        {
            gBattleMons[i].volatiles.flinched = FALSE;
            if ((gBattleMons[i].status1 & STATUS1_SLEEP) && (gBattleMons[i].volatiles.multipleTurns))
                CancelMultiTurnMoves(i, SKY_DROP_IGNORE);
        }
        gBattleStruct->eventState.endTurnBlock = 0;
        gBattleStruct->eventState.endTurnBattler = 0;
        gBattleStruct->eventState.endTurn = 0;
    }
}

void BattleTurnPassed(void)
{
    s32 i;

    gBattleStruct->speedTieBreaks = RandomUniform(RNG_SPEED_TIE, 0, Factorial(MAX_BATTLERS_COUNT) - 1);

    TurnValuesCleanUp(TRUE);

    if (gBattleOutcome == 0 && DoEndTurnEffects())
        return;
    // if (BattleArenaTurnEnd())
    //     return;
    if (HandleFaintedMonActions())
        return;

    gBattleStruct->eventState.faintedAction = 0;

    TurnValuesCleanUp(FALSE);
    gHitMarker &= ~HITMARKER_PLAYER_FAINTED;
    gBattleScripting.animTurn = 0;
    gBattleScripting.animTargetsHit = 0;
    gBattleScripting.moveendState = 0;

    for (i = 0; i < 5; i++)
        gBattleCommunication[i] = 0;

    if (gBattleOutcome != 0)
    {
        gCurrentActionFuncId = B_ACTION_FINISHED;
        gBattleMainFunc = RunTurnActionsFunctions;
        return;
    }

    if (gBattleResults.battleTurnCounter < 0xFF)
    {
        gBattleResults.battleTurnCounter++;
        gBattleStruct->eventState.arenaTurn++;
    }

    for (i = 0; i < gBattlersCount; i++)
    {
        gChosenActionByBattler[i] = B_ACTION_NONE;
        gChosenMoveByBattler[i] = MOVE_NONE;
        gBattleStruct->monToSwitchIntoId[i] = PARTY_SIZE;
        gBattleMons[i].volatiles.electrified = FALSE;
        gBattleMons[i].volatiles.flinched = FALSE;
        gBattleMons[i].volatiles.powder = FALSE;

        if (gBattleStruct->battlerState[i].stompingTantrumTimer > 0)
            gBattleStruct->battlerState[i].stompingTantrumTimer--;
    }

    for (i = 0; i < NUM_BATTLE_SIDES; i++)
    {
        if (gSideTimers[i].retaliateTimer > 0)
            gSideTimers[i].retaliateTimer--;
    }

    gFieldStatuses &= ~STATUS_FIELD_ION_DELUGE;

    BattlePutTextOnWindow(gText_EmptyString3, B_WIN_MSG);
    AssignUsableGimmicks();
    SetShellSideArmCategory();
    SetAiLogicDataForTurn(gAiLogicData); // get assumed abilities, hold effects, etc of all battlers
    gBattleMainFunc = HandleTurnActionSelectionState;

    // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
    //     BattleScriptExecute(BattleScript_PalacePrintFlavorText);
    // else if (gBattleTypeFlags & BATTLE_TYPE_ARENA && gBattleStruct->eventState.arenaTurn == 0)
    //     BattleScriptExecute(BattleScript_ArenaTurnBeginning);
}

u8 IsRunningFromBattleImpossible(u32 battler)
{
    enum HoldEffect holdEffect;
    u32 i;

    if (FlagGet(B_FLAG_NO_RUNNING))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CANT_ESCAPE;
        return BATTLE_RUN_FORBIDDEN;
    }

    if (gBattleMons[battler].item == ITEM_ENIGMA_BERRY_E_READER)
        holdEffect = gEnigmaBerries[battler].holdEffect;
    else
        holdEffect = GetItemHoldEffect(gBattleMons[battler].item);

    gPotentialItemEffectBattler = battler;

    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE) // Cannot ever run from saving Birch's battle.
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DONT_LEAVE_BIRCH;
        return BATTLE_RUN_FORBIDDEN;
    }
    if (GetBattlerPosition(battler) == B_POSITION_PLAYER_RIGHT && WILD_DOUBLE_BATTLE
        && IsBattlerAlive(GetBattlerAtPosition(B_POSITION_PLAYER_LEFT))) // The second pokemon cannot run from a double wild battle, unless it's the only alive mon.
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CANT_ESCAPE;
        return BATTLE_RUN_FORBIDDEN;
    }

    if (holdEffect == HOLD_EFFECT_CAN_ALWAYS_RUN)
        return BATTLE_RUN_SUCCESS;
    if (GetConfig(CONFIG_GHOSTS_ESCAPE) >= GEN_6 && IS_BATTLER_OF_TYPE(battler, TYPE_GHOST))
        return BATTLE_RUN_SUCCESS;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        return BATTLE_RUN_SUCCESS;
    if (GetBattlerAbility(battler) == ABILITY_RUN_AWAY)
        return BATTLE_RUN_SUCCESS;

    if ((i = IsAbilityPreventingEscape(battler)))
    {
        gBattleScripting.battler = i - 1;
        gLastUsedAbility = gBattleMons[i - 1].ability;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PREVENTS_ESCAPE;
        return BATTLE_RUN_FAILURE;
    }

    if (!CanBattlerEscape(battler))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CANT_ESCAPE;
        return BATTLE_RUN_FORBIDDEN;
    }
    return BATTLE_RUN_SUCCESS;
}

void SwitchTwoBattlersInParty(u32 battler, u32 battler2)
{
    s32 i;
    u32 partyId1, partyId2;

    for (i = 0; i < (int)ARRAY_COUNT(gBattlePartyCurrentOrder); i++)
        gBattlePartyCurrentOrder[i] = *(battler * 3 + i + (u8 *)(gBattleStruct->battlerPartyOrders));

    partyId1 = GetPartyIdFromBattlePartyId(gBattlerPartyIndexes[battler]);
    partyId2 = GetPartyIdFromBattlePartyId(gBattlerPartyIndexes[battler2]);
    SwitchPartyMonSlots(partyId1, partyId2);

    for (i = 0; i < (int)ARRAY_COUNT(gBattlePartyCurrentOrder); i++)
    {
        *(battler * 3 + i + (u8 *)(gBattleStruct->battlerPartyOrders)) = gBattlePartyCurrentOrder[i];
        *(BATTLE_PARTNER(battler) * 3 + i + (u8 *)(gBattleStruct->battlerPartyOrders)) = gBattlePartyCurrentOrder[i];
    }
}

void SwitchPartyOrder(u32 battler)
{
    s32 i;
    u32 partyId1, partyId2;

    for (i = 0; i < (int)ARRAY_COUNT(gBattlePartyCurrentOrder); i++)
        gBattlePartyCurrentOrder[i] = *(battler * 3 + i + (u8 *)(gBattleStruct->battlerPartyOrders));

    partyId1 = GetPartyIdFromBattlePartyId(gBattlerPartyIndexes[battler]);
    partyId2 = GetPartyIdFromBattlePartyId(gBattleStruct->monToSwitchIntoId[battler]);
    SwitchPartyMonSlots(partyId1, partyId2);

    if (IsDoubleBattle())
    {
        for (i = 0; i < (int)ARRAY_COUNT(gBattlePartyCurrentOrder); i++)
        {
            *(battler * 3 + i + (u8 *)(gBattleStruct->battlerPartyOrders)) = gBattlePartyCurrentOrder[i];
            *(BATTLE_PARTNER(battler) * 3 + i + (u8 *)(gBattleStruct->battlerPartyOrders)) = gBattlePartyCurrentOrder[i];
        }
    }
    else
    {
        for (i = 0; i < (int)ARRAY_COUNT(gBattlePartyCurrentOrder); i++)
        {
            *(battler * 3 + i + (u8 *)(gBattleStruct->battlerPartyOrders)) = gBattlePartyCurrentOrder[i];
        }
    }
}

enum
{
    STATE_TURN_START_RECORD,
    STATE_BEFORE_ACTION_CHOSEN,
    STATE_WAIT_ACTION_CHOSEN,
    STATE_WAIT_ACTION_CASE_CHOSEN,
    STATE_WAIT_ACTION_CONFIRMED_STANDBY,
    STATE_WAIT_ACTION_CONFIRMED,
    STATE_SELECTION_SCRIPT,
    STATE_WAIT_SET_BEFORE_ACTION,
    STATE_SELECTION_SCRIPT_MAY_RUN
};

static void HandleTurnActionSelectionState(void)
{
    s32 i, battler;

    gBattleCommunication[ACTIONS_CONFIRMED_COUNT] = 0;
    for (battler = 0; battler < gBattlersCount; battler++)
    {
        enum BattlerPosition position = GetBattlerPosition(battler);
        switch (gBattleCommunication[battler])
        {
        case STATE_TURN_START_RECORD: // Recorded battle related action on start of every turn.
            RecordedBattle_CopyBattlerMoves(battler);
            gBattleCommunication[battler] = STATE_BEFORE_ACTION_CHOSEN;
            ComputeBattlerDecisions(battler); // Do AI score computations here so we can use them in AI_TrySwitchOrUseItem
            // fallthrough
        case STATE_BEFORE_ACTION_CHOSEN: // Choose an action.
            gBattleStruct->monToSwitchIntoId[battler] = PARTY_SIZE;
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI
                || (position & BIT_FLANK) == B_FLANK_LEFT
                || gAbsentBattlerFlags & 1u << GetBattlerAtPosition(BATTLE_PARTNER(position))
                || gBattleCommunication[GetBattlerAtPosition(BATTLE_PARTNER(position))] == STATE_WAIT_ACTION_CONFIRMED)
            {
                if (gAbsentBattlerFlags & 1u << battler || gBattleStruct->battlerState[battler].commandingDondozo)
                {
                    gChosenActionByBattler[battler] = B_ACTION_NOTHING_FAINTED;
                    if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
                        gBattleCommunication[battler] = STATE_WAIT_ACTION_CONFIRMED;
                    else
                        gBattleCommunication[battler] = STATE_WAIT_ACTION_CONFIRMED_STANDBY;
                }
                else
                {
                    if (gBattleMons[battler].volatiles.multipleTurns
                        || gBattleMons[battler].volatiles.rechargeTimer > 0)
                    {
                        gChosenActionByBattler[battler] = B_ACTION_USE_MOVE;
                        gBattleCommunication[battler] = STATE_WAIT_ACTION_CONFIRMED_STANDBY;
                    }
                    else if (WILD_DOUBLE_BATTLE
                             && position == B_POSITION_PLAYER_RIGHT
                             && (gBattleStruct->throwingPokeBall || gChosenActionByBattler[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)] == B_ACTION_RUN)
                             && gChosenActionByBattler[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)] != B_ACTION_NOTHING_FAINTED)
                    {
                        gBattleStruct->throwingPokeBall = FALSE;
                        gChosenActionByBattler[battler] = B_ACTION_NOTHING_FAINTED; // Not fainted, but it cannot move, because of the throwing ball.
                        gBattleCommunication[battler] = STATE_WAIT_ACTION_CONFIRMED_STANDBY;
                    }
                    else if (B_RUN_TRAINER_BATTLE
                          && gBattleTypeFlags & BATTLE_TYPE_DOUBLE
                          && position == B_POSITION_PLAYER_RIGHT
                          && gChosenActionByBattler[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)] == B_ACTION_RUN
                          && gChosenActionByBattler[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)] != B_ACTION_NOTHING_FAINTED)
                    {
                        gChosenActionByBattler[battler] = B_ACTION_USE_MOVE;
                        gBattleCommunication[battler] = STATE_WAIT_ACTION_CONFIRMED_STANDBY;
                    }
                    else
                    {
                        gBattleStruct->itemPartyIndex[battler] = PARTY_SIZE;
                        BtlController_EmitChooseAction(battler, B_COMM_TO_CONTROLLER, gChosenActionByBattler[0], gBattleResources->bufferB[0][1] | (gBattleResources->bufferB[0][2] << 8));
                        MarkBattlerForControllerExec(battler);
                        gBattleCommunication[battler]++;
                    }
                }
            }
            break;
        case STATE_WAIT_ACTION_CHOSEN: // Try to perform an action.
            if (!IsBattleControllerActiveOrPendingSyncAnywhere(battler))
            {
                RecordedBattle_SetBattlerAction(battler, gBattleResources->bufferB[battler][1]);
                gChosenActionByBattler[battler] = gBattleResources->bufferB[battler][1];

                switch (gBattleResources->bufferB[battler][1])
                {
                case B_ACTION_USE_MOVE:
                    if (AreAllMovesUnusable(battler))
                    {
                        gBattleCommunication[battler] = STATE_SELECTION_SCRIPT;
                        gBattleStruct->battlerState[battler].selectionScriptFinished = FALSE;
                        gBattleStruct->stateIdAfterSelScript[battler] = STATE_WAIT_ACTION_CONFIRMED_STANDBY;
                        gBattleStruct->moveTarget[battler] = gBattleResources->bufferB[battler][3];
                        return;
                    }
                    else if (GetConfig(CONFIG_ENCORE_TARGET) < GEN_5 && gBattleMons[battler].volatiles.encoredMove != MOVE_NONE)
                    {
                        gChosenMoveByBattler[battler] = gBattleMons[battler].volatiles.encoredMove;
                        gBattleStruct->chosenMovePositions[battler] = gBattleMons[battler].volatiles.encoredMovePos;
                        gBattleCommunication[battler] = STATE_WAIT_ACTION_CONFIRMED_STANDBY;
                        if (gTestRunnerEnabled)
                        {
                            UNUSED enum Gimmick gimmick = GIMMICK_NONE;
                            if (gBattleResources->bufferB[battler][2] & RET_GIMMICK)
                                gimmick = gBattleStruct->gimmick.usableGimmick[battler];
                            TestRunner_Battle_CheckChosenMove(battler, gBattleMons[battler].volatiles.encoredMove, gBattleMons[battler].volatiles.encoredMovePos, gimmick);
                        }
                        return;
                    }
                    else
                    {
                        struct ChooseMoveStruct moveInfo;

                        moveInfo.zmove = gBattleStruct->zmove;
                        moveInfo.species = gBattleMons[battler].species;
                        moveInfo.monTypes[0] = gBattleMons[battler].types[0];
                        moveInfo.monTypes[1] = gBattleMons[battler].types[1];
                        moveInfo.monTypes[2] = gBattleMons[battler].types[2];

                        for (i = 0; i < MAX_MON_MOVES; i++)
                        {
                            moveInfo.moves[i] = gBattleMons[battler].moves[i];
                            moveInfo.currentPp[i] = gBattleMons[battler].pp[i];
                            moveInfo.maxPp[i] = CalculatePPWithBonus(
                                                            gBattleMons[battler].moves[i],
                                                            gBattleMons[battler].ppBonuses,
                                                            i);
                        }

                        BtlController_EmitChooseMove(battler, B_COMM_TO_CONTROLLER, IsDoubleBattle() != 0, FALSE, &moveInfo);
                        MarkBattlerForControllerExec(battler);
                    }
                    break;
                case B_ACTION_USE_ITEM:
                    if (ShouldBattleRestrictionsApply(battler) && !IsAllowedToUseBag())
                    {
                        RecordedBattle_ClearBattlerAction(battler, 1);
                        gSelectionBattleScripts[battler] = BattleScript_ActionSelectionItemsCantBeUsed;
                        gBattleCommunication[battler] = STATE_SELECTION_SCRIPT;
                        gBattleStruct->battlerState[battler].selectionScriptFinished = FALSE;
                        gBattleStruct->stateIdAfterSelScript[battler] = STATE_BEFORE_ACTION_CHOSEN;
                        return;
                    }

                    if (((gBattleTypeFlags & (BATTLE_TYPE_LINK
                                            | BATTLE_TYPE_FRONTIER_NO_PYRAMID
                                            | BATTLE_TYPE_EREADER_TRAINER
                                            | BATTLE_TYPE_RECORDED_LINK))
                                            && !gTestRunnerEnabled)
                                            // Or if currently held by Sky Drop
                                            || gBattleMons[battler].volatiles.semiInvulnerable == STATE_SKY_DROP)
                    {
                        RecordedBattle_ClearBattlerAction(battler, 1);
                        gSelectionBattleScripts[battler] = BattleScript_ActionSelectionItemsCantBeUsed;
                        gBattleCommunication[battler] = STATE_SELECTION_SCRIPT;
                        gBattleStruct->battlerState[battler].selectionScriptFinished = FALSE;
                        gBattleStruct->stateIdAfterSelScript[battler] = STATE_BEFORE_ACTION_CHOSEN;
                        return;
                    }
                    else
                    {
                        BtlController_EmitChooseItem(battler, B_COMM_TO_CONTROLLER, gBattleStruct->battlerPartyOrders[battler]);
                        MarkBattlerForControllerExec(battler);
                    }
                    break;
                case B_ACTION_SWITCH:
                    gBattleStruct->battlerPartyIndexes[battler] = gBattlerPartyIndexes[battler];
                    if (gBattleTypeFlags & BATTLE_TYPE_ARENA
                        || (!CanBattlerEscape(battler) && GetBattlerHoldEffect(battler) != HOLD_EFFECT_SHED_SHELL))
                    {
                        BtlController_EmitChoosePokemon(battler, B_COMM_TO_CONTROLLER, PARTY_ACTION_CANT_SWITCH, PARTY_SIZE, ABILITY_NONE, 0, gBattleStruct->battlerPartyOrders[battler]);
                    }
                    else if (GetItemHoldEffect(gBattleMons[battler].item) != HOLD_EFFECT_SHED_SHELL
                      && (i = IsAbilityPreventingEscape(battler)))   // must be last to keep i value integrity
                    {
                        BtlController_EmitChoosePokemon(battler, B_COMM_TO_CONTROLLER, PARTY_ACTION_ABILITY_PREVENTS, PARTY_SIZE, gBattleMons[i - 1].ability, i - 1, gBattleStruct->battlerPartyOrders[battler]);
                    }
                    else
                    {
                        if (battler == 2 && gChosenActionByBattler[0] == B_ACTION_SWITCH)
                            BtlController_EmitChoosePokemon(battler, B_COMM_TO_CONTROLLER, PARTY_ACTION_CHOOSE_MON, gBattleStruct->monToSwitchIntoId[0], ABILITY_NONE, 0, gBattleStruct->battlerPartyOrders[battler]);
                        else if (battler == 3 && gChosenActionByBattler[1] == B_ACTION_SWITCH)
                            BtlController_EmitChoosePokemon(battler, B_COMM_TO_CONTROLLER, PARTY_ACTION_CHOOSE_MON, gBattleStruct->monToSwitchIntoId[1], ABILITY_NONE, 0, gBattleStruct->battlerPartyOrders[battler]);
                        else
                            BtlController_EmitChoosePokemon(battler, B_COMM_TO_CONTROLLER, PARTY_ACTION_CHOOSE_MON, PARTY_SIZE, ABILITY_NONE, 0, gBattleStruct->battlerPartyOrders[battler]);
                    }
                    MarkBattlerForControllerExec(battler);
                    break;
                case B_ACTION_SAFARI_BALL:
                    if (IsPlayerPartyAndPokemonStorageFull())
                    {
                        gSelectionBattleScripts[battler] = BattleScript_PrintFullBox;
                        gBattleCommunication[battler] = STATE_SELECTION_SCRIPT;
                        gBattleStruct->battlerState[battler].selectionScriptFinished = FALSE;
                        gBattleStruct->stateIdAfterSelScript[battler] = STATE_BEFORE_ACTION_CHOSEN;
                        return;
                    }
                    break;
#if !IS_FRLG
                case B_ACTION_SAFARI_POKEBLOCK:
                    BtlController_EmitChooseItem(battler, B_COMM_TO_CONTROLLER, gBattleStruct->battlerPartyOrders[battler]);
                    MarkBattlerForControllerExec(battler);
                    break;
#endif
                case B_ACTION_CANCEL_PARTNER:
                    gBattleCommunication[battler] = STATE_WAIT_SET_BEFORE_ACTION;
                    gBattleCommunication[GetPartnerBattler(battler)] = STATE_BEFORE_ACTION_CHOSEN;
                    RecordedBattle_ClearBattlerAction(battler, 1);
                    if (gBattleMons[GetPartnerBattler(battler)].volatiles.multipleTurns
                        || gBattleMons[GetPartnerBattler(battler)].volatiles.rechargeTimer > 0)
                    {
                        BtlController_EmitEndBounceEffect(battler, B_COMM_TO_CONTROLLER);
                        MarkBattlerForControllerExec(battler);
                        return;
                    }
                    else if (gChosenActionByBattler[GetPartnerBattler(battler)] == B_ACTION_SWITCH)
                    {
                        RecordedBattle_ClearBattlerAction(GetPartnerBattler(battler), 2);
                    }
                    else if (gChosenActionByBattler[GetPartnerBattler(battler)] == B_ACTION_RUN)
                    {
                        RecordedBattle_ClearBattlerAction(GetPartnerBattler(battler), 1);
                    }
                    else if (gChosenActionByBattler[GetPartnerBattler(battler)] == B_ACTION_USE_MOVE
                             && (gProtectStructs[GetPartnerBattler(battler)].noValidMoves
                                || gBattleMons[GetPartnerBattler(battler)].volatiles.encoredMove))
                    {
                        RecordedBattle_ClearBattlerAction(GetPartnerBattler(battler), 1);
                    }
                    else if (gBattleTypeFlags & BATTLE_TYPE_PALACE
                             && gChosenActionByBattler[GetPartnerBattler(battler)] == B_ACTION_USE_MOVE)
                    {
                        gRngValue = gBattlePalaceMoveSelectionRngValue;
                        RecordedBattle_ClearBattlerAction(GetPartnerBattler(battler), 1);
                    }
                    else
                    {
                        RecordedBattle_ClearBattlerAction(GetPartnerBattler(battler), 3);
                    }

                    gBattleStruct->gimmick.toActivate &= ~((1u << BATTLE_PARTNER(GetBattlerPosition(battler))));
                    BtlController_EmitEndBounceEffect(battler, B_COMM_TO_CONTROLLER);
                    MarkBattlerForControllerExec(battler);
                    return;
                case B_ACTION_DEBUG:
                    BtlController_EmitDebugMenu(battler, B_COMM_TO_CONTROLLER);
                    MarkBattlerForControllerExec(battler);
                    break;
                }

                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER
                    && gBattleTypeFlags & (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_TRAINER_HILL)
                    && gBattleResources->bufferB[battler][1] == B_ACTION_RUN)
                {
                    gSelectionBattleScripts[battler] = BattleScript_AskIfWantsToForfeitMatch;
                    gBattleCommunication[battler] = STATE_SELECTION_SCRIPT_MAY_RUN;
                    gBattleStruct->battlerState[battler].selectionScriptFinished = FALSE;
                    gBattleStruct->stateIdAfterSelScript[battler] = STATE_BEFORE_ACTION_CHOSEN;
                    return;
                }
                // else if (CanPlayerForfeitNormalTrainerBattle() && gBattleResources->bufferB[battler][1] == B_ACTION_RUN)
                // {
                //     gSelectionBattleScripts[battler] = BattleScript_QuestionForfeitBattle;
                //     gBattleCommunication[battler] = STATE_SELECTION_SCRIPT_MAY_RUN;
                //     gBattleStruct->battlerState[battler].selectionScriptFinished = FALSE;
                //     gBattleStruct->stateIdAfterSelScript[battler] = STATE_BEFORE_ACTION_CHOSEN;
                //     return;
                // }
                else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER
                      && !(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK))
                      && gBattleResources->bufferB[battler][1] == B_ACTION_RUN)
                {
                    BattleScriptExecute(BattleScript_PrintCantRunFromTrainer);
                    gBattleCommunication[battler] = STATE_BEFORE_ACTION_CHOSEN;
                }
                else if ((IsRunningFromBattleImpossible(battler) != BATTLE_RUN_SUCCESS
                         && gBattleResources->bufferB[battler][1] == B_ACTION_RUN)
                         || (FlagGet(B_FLAG_NO_RUNNING) == TRUE && gBattleResources->bufferB[battler][1] == B_ACTION_RUN))
                {
                    gSelectionBattleScripts[battler] = BattleScript_PrintCantEscapeFromBattle;
                    gBattleCommunication[battler] = STATE_SELECTION_SCRIPT;
                    gBattleStruct->battlerState[battler].selectionScriptFinished = FALSE;
                    gBattleStruct->stateIdAfterSelScript[battler] = STATE_BEFORE_ACTION_CHOSEN;
                    return;
                }
                else
                {
                    gBattleCommunication[battler]++;
                }
            }
            break;
        case STATE_WAIT_ACTION_CASE_CHOSEN:
            if (!IsBattleControllerActiveOrPendingSyncAnywhere(battler))
            {
                switch (gChosenActionByBattler[battler])
                {
                case B_ACTION_USE_MOVE:
                    switch (gBattleResources->bufferB[battler][1])
                    {
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 9:
                        gChosenActionByBattler[battler] = gBattleResources->bufferB[battler][1];
                        return;
                    case 15:
                        gChosenActionByBattler[battler] = B_ACTION_SWITCH;
                        UpdateBattlerPartyOrdersOnSwitch(battler);
                        return;
                    default:
                        RecordedBattle_CheckMovesetChanges(B_RECORD_MODE_PLAYBACK);
                        if ((gBattleResources->bufferB[battler][2] | (gBattleResources->bufferB[battler][3] << 8)) == 0xFFFF)
                        {
                            gBattleCommunication[battler] = STATE_BEFORE_ACTION_CHOSEN;
                            RecordedBattle_ClearBattlerAction(battler, 1);
                        }
                        else if (TrySetCantSelectMoveBattleScript(battler))
                        {
                            RecordedBattle_ClearBattlerAction(battler, 1);
                            gBattleCommunication[battler] = STATE_SELECTION_SCRIPT;
                            gBattleStruct->battlerState[battler].selectionScriptFinished = FALSE;
                            gBattleResources->bufferB[battler][1] = B_ACTION_USE_MOVE;
                            gBattleStruct->stateIdAfterSelScript[battler] = STATE_WAIT_ACTION_CHOSEN;
                            return;
                        }
                        else
                        {
                            if (!(gBattleTypeFlags & BATTLE_TYPE_PALACE))
                            {
                                RecordedBattle_SetBattlerAction(battler, gBattleResources->bufferB[battler][2]);
                                RecordedBattle_SetBattlerAction(battler, gBattleResources->bufferB[battler][3]);
                            }

                            // Get the chosen move position (and thus the chosen move) and target from the returned buffer.
                            gBattleStruct->chosenMovePositions[battler] = gBattleResources->bufferB[battler][2] & ~RET_GIMMICK;
                            gChosenMoveByBattler[battler] = GetChosenMoveFromPosition(battler);
                            gBattleStruct->moveTarget[battler] = gBattleResources->bufferB[battler][3];
                            if (IsBattleMoveStatus(gChosenMoveByBattler[battler]) && GetBattlerAbility(battler) == ABILITY_MYCELIUM_MIGHT)
                                gProtectStructs[battler].myceliumMight = TRUE;
                            if (GetBattlerHoldEffect(battler) == HOLD_EFFECT_LAGGING_TAIL)
                                gProtectStructs[battler].laggingTail = TRUE;

                            // Check to see if any gimmicks need to be prepared.
                            if (gBattleResources->bufferB[battler][2] & RET_GIMMICK)
                                gBattleStruct->gimmick.toActivate |= 1u << battler;

                            // Max Move check
                            if (GetActiveGimmick(battler) == GIMMICK_DYNAMAX || IsGimmickSelected(battler, GIMMICK_DYNAMAX))
                            {
                                gBattleStruct->dynamax.baseMoves[battler] = GetChosenMoveFromPosition(battler);
                            }
                            gBattleCommunication[battler]++;

                            if (gTestRunnerEnabled)
                            {
                                UNUSED enum Gimmick gimmick = GIMMICK_NONE;
                                if (gBattleResources->bufferB[battler][2] & RET_GIMMICK)
                                    gimmick = gBattleStruct->gimmick.usableGimmick[battler];
                                TestRunner_Battle_CheckChosenMove(battler, gChosenMoveByBattler[battler], gBattleStruct->moveTarget[battler], gimmick);
                            }
                        }
                        break;
                    }
                    break;
                case B_ACTION_USE_ITEM:
                    if ((gBattleResources->bufferB[battler][1] | (gBattleResources->bufferB[battler][2] << 8)) == 0)
                    {
                        gBattleCommunication[battler] = STATE_BEFORE_ACTION_CHOSEN;
                    }
                    else
                    {
                        gLastUsedItem = (gBattleResources->bufferB[battler][1] | (gBattleResources->bufferB[battler][2] << 8));
                        if (GetItemPocket(gLastUsedItem) == POCKET_POKE_BALLS)
                            gBattleStruct->throwingPokeBall = TRUE;
                        gBattleCommunication[battler]++;
                    }
                    break;
                case B_ACTION_SWITCH:
                    if (gBattleResources->bufferB[battler][1] == PARTY_SIZE)
                    {
                        gBattleCommunication[battler] = STATE_BEFORE_ACTION_CHOSEN;
                        RecordedBattle_ClearBattlerAction(battler, 1);
                    }
                    else
                    {
                        UpdateBattlerPartyOrdersOnSwitch(battler);
                        gBattleCommunication[battler]++;
                    }
                    break;
                case B_ACTION_RUN:
                    gHitMarker |= HITMARKER_RUN;
                    gBattleCommunication[battler]++;
                    break;
                case B_ACTION_SAFARI_WATCH_CAREFULLY:
                    gBattleCommunication[battler]++;
                    break;
                case B_ACTION_SAFARI_BALL:
                    gBattleCommunication[battler]++;
                    break;
                case B_ACTION_THROW_BALL:
                    gBattleStruct->throwingPokeBall = TRUE;
                    gBattleCommunication[battler]++;
                    break;
                case B_ACTION_SAFARI_BAIT:
                case B_ACTION_SAFARI_GO_NEAR:
                    gBattleCommunication[battler]++;
                    break;
                case B_ACTION_SAFARI_RUN:
                    gHitMarker |= HITMARKER_RUN;
                    gBattleCommunication[battler]++;
                    break;
                case B_ACTION_OLDMAN_THROW:
                    gBattleCommunication[battler]++;
                    break;
                case B_ACTION_DEBUG:
                    gBattleCommunication[battler] = STATE_BEFORE_ACTION_CHOSEN;
                    break;
                }
            }
            break;
        case STATE_WAIT_ACTION_CONFIRMED_STANDBY:
            if (!IsBattleControllerActiveOrPendingSyncAnywhere(battler))
            {
                if (AllAtActionConfirmed())
                    i = TRUE;
                else
                    i = FALSE;

                if (((gBattleTypeFlags & BATTLE_TYPE_MULTI) || !IsDoubleBattle())
                    || (position & BIT_FLANK) != B_FLANK_LEFT
                    || gAbsentBattlerFlags & 1u << GetBattlerAtPosition(BATTLE_PARTNER(position)))
                {
                    BtlController_EmitLinkStandbyMsg(battler, B_COMM_TO_CONTROLLER, LINK_STANDBY_MSG_STOP_BOUNCE, i);
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(battler, B_COMM_TO_CONTROLLER, LINK_STANDBY_STOP_BOUNCE_ONLY, i);
                }
                MarkBattlerForControllerExec(battler);
                gBattleCommunication[battler]++;
            }
            break;
        case STATE_WAIT_ACTION_CONFIRMED:
            if (!IsBattleControllerActiveOrPendingSyncAnywhere(battler))
            {
                gBattleCommunication[ACTIONS_CONFIRMED_COUNT]++;
            }
            break;
        case STATE_SELECTION_SCRIPT:
            if (gBattleStruct->battlerState[battler].selectionScriptFinished)
            {
                gBattleCommunication[battler] = gBattleStruct->stateIdAfterSelScript[battler];
            }
            else
            {
                gBattlerAttacker = battler;
                gBattlescriptCurrInstr = gSelectionBattleScripts[battler];
                if (!IsBattleControllerActiveOrPendingSyncAnywhere(battler))
                {
                    gBattleScriptingCommandsTable[gBattlescriptCurrInstr[0]]();
                }
                gSelectionBattleScripts[battler] = gBattlescriptCurrInstr;
            }
            break;
        case STATE_WAIT_SET_BEFORE_ACTION:
            if (!IsBattleControllerActiveOrPendingSyncAnywhere(battler))
            {
                gBattleCommunication[battler] = STATE_BEFORE_ACTION_CHOSEN;
            }
            break;
        case STATE_SELECTION_SCRIPT_MAY_RUN:
            if (gBattleStruct->battlerState[battler].selectionScriptFinished)
            {
                if (gBattleResources->bufferB[battler][1] == B_ACTION_NOTHING_FAINTED)
                {
                    gHitMarker |= HITMARKER_RUN;
                    gChosenActionByBattler[battler] = B_ACTION_RUN;
                    gBattleCommunication[battler] = STATE_WAIT_ACTION_CONFIRMED_STANDBY;
                }
                else
                {
                    RecordedBattle_ClearBattlerAction(battler, 1);
                    gBattleCommunication[battler] = gBattleStruct->stateIdAfterSelScript[battler];
                }
            }
            else
            {
                gBattlerAttacker = battler;
                gBattlescriptCurrInstr = gSelectionBattleScripts[battler];
                if (!IsBattleControllerActiveOrPendingSyncAnywhere(battler))
                {
                    gBattleScriptingCommandsTable[gBattlescriptCurrInstr[0]]();
                }
                gSelectionBattleScripts[battler] = gBattlescriptCurrInstr;
            }
            break;
        }
    }

    // Check if everyone chose actions.
    if (gBattleCommunication[ACTIONS_CONFIRMED_COUNT] == gBattlersCount)
    {
        RecordedBattle_CheckMovesetChanges(B_RECORD_MODE_RECORDING);

        if (WILD_DOUBLE_BATTLE
            && gBattleStruct->throwingPokeBall
            && gChosenActionByBattler[GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT)] != B_ACTION_NOTHING_FAINTED)
        {
            // if we choose to throw a ball with our second mon, skip the action of the first
            // (if we have chosen throw ball with first, second's is already skipped)
            // if throwing a ball in a wild battle with an in-game partner, skip partner's turn when throwing a ball
            if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
                gChosenActionByBattler[GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT)] = B_ACTION_NOTHING_FAINTED;
            else
                gChosenActionByBattler[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)] = B_ACTION_NOTHING_FAINTED;
        }

        gBattleMainFunc = SetActionsAndBattlersTurnOrder;

        if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
        {
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gChosenActionByBattler[i] == B_ACTION_SWITCH)
                    SwitchPartyOrderInGameMulti(i, gBattleStruct->monToSwitchIntoId[i]);
            }
        }
    }
}

static bool8 AllAtActionConfirmed(void)
{
    s32 i, count;

    for (count = 0, i = 0; i < gBattlersCount; i++)
    {
        if (gBattleCommunication[i] == STATE_WAIT_ACTION_CONFIRMED)
            count++;
    }

    if (count + 1 == gBattlersCount)
        return TRUE;
    else
        return FALSE;
}

static void UpdateBattlerPartyOrdersOnSwitch(u32 battler)
{
    gBattleStruct->monToSwitchIntoId[battler] = gBattleResources->bufferB[battler][1];
    RecordedBattle_SetBattlerAction(battler, gBattleResources->bufferB[battler][1]);

    if (gBattleTypeFlags & BATTLE_TYPE_LINK && gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        *(battler * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) &= 0xF;
        *(battler * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) |= (gBattleResources->bufferB[battler][2] & 0xF0);
        *(battler * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 1) = gBattleResources->bufferB[battler][3];

        *((BATTLE_PARTNER(battler)) * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) &= (0xF0);
        *((BATTLE_PARTNER(battler)) * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) |= (gBattleResources->bufferB[battler][2] & 0xF0) >> 4;
        *((BATTLE_PARTNER(battler)) * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 2) = gBattleResources->bufferB[battler][3];
    }
}

void SwapTurnOrder(u8 id1, u8 id2)
{
    u32 temp;

    SWAP(gActionsByTurnOrder[id1], gActionsByTurnOrder[id2], temp);
    SWAP(gBattlerByTurnOrder[id1], gBattlerByTurnOrder[id2], temp);
}

// For AI, so it doesn't 'cheat' by knowing player's ability
u32 GetBattlerTotalSpeedStat(u32 battler, enum Ability ability, enum HoldEffect holdEffect)
{
    u32 speed = gBattleMons[battler].speed;

    // stat stages
    speed *= gStatStageRatios[gBattleMons[battler].statStages[STAT_SPEED]][0];
    speed /= gStatStageRatios[gBattleMons[battler].statStages[STAT_SPEED]][1];

    // weather abilities
    if (HasWeatherEffect())
    {
        if (ability == ABILITY_SWIFT_SWIM       && holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA && gBattleWeather & B_WEATHER_RAIN)
            speed *= 2;
        else if (ability == ABILITY_CHLOROPHYLL && holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA && gBattleWeather & B_WEATHER_SUN)
            speed *= 2;
        else if (ability == ABILITY_SAND_RUSH   && gBattleWeather & B_WEATHER_SANDSTORM)
            speed *= 2;
        else if (ability == ABILITY_SLUSH_RUSH  && (gBattleWeather & B_WEATHER_ICY_ANY))
            speed *= 2;
    }

    // other abilities
    if (ability == ABILITY_QUICK_FEET && gBattleMons[battler].status1 & STATUS1_ANY)
        speed = (speed * 150) / 100;
    else if (ability == ABILITY_SURGE_SURFER && gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)
        speed *= 2;
    else if (ability == ABILITY_SLOW_START && gBattleMons[battler].volatiles.slowStartTimer != 0)
        speed /= 2;
    else if (ability == ABILITY_PROTOSYNTHESIS && !(gBattleMons[battler].volatiles.transformed) && ((gBattleWeather & B_WEATHER_SUN && HasWeatherEffect()) || gBattleMons[battler].volatiles.boosterEnergyActivated))
        speed = (GetParadoxBoostedStatId(battler) == STAT_SPEED) ? (speed * 150) / 100 : speed;
    else if (ability == ABILITY_QUARK_DRIVE && !(gBattleMons[battler].volatiles.transformed) && (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN || gBattleMons[battler].volatiles.boosterEnergyActivated))
        speed = (GetParadoxBoostedStatId(battler) == STAT_SPEED) ? (speed * 150) / 100 : speed;
    else if (ability == ABILITY_UNBURDEN && gBattleMons[battler].volatiles.unburdenActive)
        speed *= 2;

    // player's badge boost
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK | BATTLE_TYPE_FRONTIER))
        && ShouldGetStatBadgeBoost(B_FLAG_BADGE_BOOST_SPEED, battler)
        && IsOnPlayerSide(battler))
    {
        speed = uq4_12_multiply_by_int_half_down(GetBadgeBoostModifier(), speed);
    }

    // item effects
    if (holdEffect == HOLD_EFFECT_MACHO_BRACE || holdEffect == HOLD_EFFECT_POWER_ITEM)
        speed /= 2;
    else if (holdEffect == HOLD_EFFECT_IRON_BALL)
        speed /= 2;
    else if (holdEffect == HOLD_EFFECT_CHOICE_SCARF && GetActiveGimmick(battler) != GIMMICK_DYNAMAX)
        speed = (speed * 150) / 100;
    else if (holdEffect == HOLD_EFFECT_QUICK_POWDER && gBattleMons[battler].species == SPECIES_DITTO && !(gBattleMons[battler].volatiles.transformed))
        speed *= 2;

    // various effects
    if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_TAILWIND)
        speed *= 2;

    // paralysis drop
    if (gBattleMons[battler].status1 & STATUS1_PARALYSIS && ability != ABILITY_QUICK_FEET)
        speed /= GetConfig(CONFIG_PARALYSIS_SPEED) >= GEN_7 ? 2 : 4;

    if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SWAMP)
        speed /= 4;

    return speed;
}

s32 GetChosenMovePriority(u32 battler, enum Ability ability)
{
    enum Move move;

    gProtectStructs[battler].pranksterElevated = FALSE;
    if (gProtectStructs[battler].noValidMoves)
        move = MOVE_STRUGGLE;
    else
        move = GetChosenMoveFromPosition(battler);

    return GetBattleMovePriority(battler, ability, move);
}

s32 GetBattleMovePriority(u32 battler, enum Ability ability, enum Move move)
{
    s32 priority = 0;

    if (GetActiveGimmick(battler) == GIMMICK_Z_MOVE && !IsBattleMoveStatus(move))
        move = GetUsableZMove(battler, move);

    priority = GetMovePriority(move);

    // Max Guard check
    if (GetActiveGimmick(battler) == GIMMICK_DYNAMAX && GetMoveCategory(move) == DAMAGE_CATEGORY_STATUS)
        return GetMovePriority(MOVE_MAX_GUARD);

    if (gProtectStructs[battler].quash)
    {
        priority = -8;
    }
    else if (ability == ABILITY_GALE_WINGS
          && (GetConfig(CONFIG_GALE_WINGS) < GEN_7 || IsBattlerAtMaxHp(battler))
          && GetMoveType(move) == TYPE_FLYING)
    {
        priority++;
    }
    else if (IsBattleMoveStatus(move) && IsAbilityAndRecord(battler, ability, ABILITY_PRANKSTER))
    {
        gProtectStructs[battler].pranksterElevated = 1;
        priority++;
    }
    else if (GetMoveEffect(move) == EFFECT_GRASSY_GLIDE
          && IsGrassyTerrainAffected(battler, ability, GetBattlerHoldEffect(battler), gFieldStatuses)
          && GetActiveGimmick(gBattlerAttacker) != GIMMICK_DYNAMAX && !IsGimmickSelected(battler, GIMMICK_DYNAMAX))
    {
        priority++;
    }
    else if (ability == ABILITY_TRIAGE && IsHealingMove(move))
    {
        priority += 3;
    }

    return priority;
}

s32 GetWhichBattlerFasterArgs(struct BattleCalcValues *calcValues, bool32 ignoreChosenMoves, u32 speedBattler1, u32 speedBattler2, s32 priority1, s32 priority2)
{
    u32 strikesFirst = 0;

    if (priority1 == priority2)
    {
        // Quick Claw / Quick Draw / Custap Berry - always first
        // Stall / Mycelium Might - last but before Lagging Tail
        // Lagging Tail - always last
        bool32 battler1HasQuickEffect = gProtectStructs[calcValues->battlerAtk].quickDraw || gProtectStructs[calcValues->battlerAtk].usedCustapBerry;
        bool32 battler2HasQuickEffect = gProtectStructs[calcValues->battlerDef].quickDraw || gProtectStructs[calcValues->battlerDef].usedCustapBerry;
        bool32 battler1HasStallingAbility = calcValues->abilities[calcValues->battlerAtk] == ABILITY_STALL || gProtectStructs[calcValues->battlerAtk].myceliumMight;
        bool32 battler2HasStallingAbility = calcValues->abilities[calcValues->battlerDef] == ABILITY_STALL || gProtectStructs[calcValues->battlerDef].myceliumMight;

        if (battler1HasQuickEffect && !battler2HasQuickEffect)
            strikesFirst = 1;
        else if (battler2HasQuickEffect && !battler1HasQuickEffect)
            strikesFirst = -1;
        else if (gProtectStructs[calcValues->battlerAtk].laggingTail && !gProtectStructs[calcValues->battlerDef].laggingTail)
            strikesFirst = -1;
        else if (gProtectStructs[calcValues->battlerDef].laggingTail && !gProtectStructs[calcValues->battlerAtk].laggingTail)
            strikesFirst = 1;
        else if (battler1HasStallingAbility && !battler2HasStallingAbility)
            strikesFirst = -1;
        else if (battler2HasStallingAbility && !battler1HasStallingAbility)
            strikesFirst = 1;
        else
        {
            if (speedBattler1 == speedBattler2)
            {
                // same speeds, same priorities
                strikesFirst = 0;
            }
            else if (speedBattler1 < speedBattler2)
            {
                // battler2 has more speed
                if (gFieldStatuses & STATUS_FIELD_TRICK_ROOM)
                    strikesFirst = 1;
                else
                    strikesFirst = -1;
            }
            else
            {
                // battler1 has more speed
                if (gFieldStatuses & STATUS_FIELD_TRICK_ROOM)
                    strikesFirst = -1;
                else
                    strikesFirst = 1;
            }
        }
    }
    else if (priority1 < priority2)
    {
        strikesFirst = -1; // battler2's move has greater priority
    }
    else
    {
        strikesFirst = 1; // battler1's move has greater priority
    }
    return strikesFirst;
}

s32 GetWhichBattlerFasterOrTies(struct BattleCalcValues *calcValues, bool32 ignoreChosenMoves)
{
    s32 priority1 = 0, priority2 = 0;
    u32 speedBattler1 = GetBattlerTotalSpeedStat(calcValues->battlerAtk, calcValues->abilities[calcValues->battlerAtk], calcValues->holdEffects[calcValues->battlerAtk]);
    u32 speedBattler2 = GetBattlerTotalSpeedStat(calcValues->battlerDef, calcValues->abilities[calcValues->battlerDef], calcValues->holdEffects[calcValues->battlerDef]);

    if (!ignoreChosenMoves)
    {
        if (gChosenActionByBattler[calcValues->battlerAtk] == B_ACTION_USE_MOVE)
            priority1 = GetChosenMovePriority(calcValues->battlerAtk, calcValues->abilities[calcValues->battlerAtk]);
        if (gChosenActionByBattler[calcValues->battlerDef] == B_ACTION_USE_MOVE)
            priority2 = GetChosenMovePriority(calcValues->battlerDef, calcValues->abilities[calcValues->battlerDef]);
    }

    return GetWhichBattlerFasterArgs(
        calcValues,
        ignoreChosenMoves,
        speedBattler1,
        speedBattler2,
        priority1,
        priority2);
}

// 24 == MAX_BATTLERS_COUNT!.
// These are the possible orders if all the battlers speed tie.
// An order is chosen at the start of the turn.
static const u8 sBattlerOrders[24][4] =
{
    { 0, 1, 2, 3 },
    { 0, 1, 3, 2 },
    { 0, 2, 1, 3 },
    { 0, 2, 3, 1 },
    { 0, 3, 1, 2 },
    { 0, 3, 2, 1 },
    { 1, 0, 2, 3 },
    { 1, 0, 3, 2 },
    { 1, 2, 0, 3 },
    { 1, 2, 3, 0 },
    { 1, 3, 0, 2 },
    { 1, 3, 2, 0 },
    { 2, 0, 1, 3 },
    { 2, 0, 3, 1 },
    { 2, 1, 0, 3 },
    { 2, 1, 3, 0 },
    { 2, 3, 0, 1 },
    { 2, 3, 1, 0 },
    { 3, 0, 1, 2 },
    { 3, 0, 2, 1 },
    { 3, 1, 0, 2 },
    { 3, 1, 2, 0 },
    { 3, 2, 0, 1 },
    { 3, 2, 1, 0 },
};

s32 GetWhichBattlerFaster(struct BattleCalcValues *calcValues, bool32 ignoreChosenMoves)
{
    s32 strikesFirst = GetWhichBattlerFasterOrTies(calcValues, ignoreChosenMoves);
    if (strikesFirst == 0)
    {
        s32 order1 = sBattlerOrders[gBattleStruct->speedTieBreaks][calcValues->battlerAtk];
        s32 order2 = sBattlerOrders[gBattleStruct->speedTieBreaks][calcValues->battlerDef];
        if (order1 < order2)
            strikesFirst = 1;
        else
            strikesFirst = -1;
    }
    return strikesFirst;
}

static void SetActionsAndBattlersTurnOrder(void)
{
    s32 turnOrderId = 0;
    s32 i, j, battler;

    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
    {
        for (battler = 0; battler < gBattlersCount; battler++)
        {
            gActionsByTurnOrder[turnOrderId] = gChosenActionByBattler[battler];
            gBattlerByTurnOrder[turnOrderId] = battler;
            turnOrderId++;
        }
    }
    else
    {
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            for (battler = 0; battler < gBattlersCount; battler++)
            {
                if (gChosenActionByBattler[battler] == B_ACTION_RUN)
                {
                    turnOrderId = 5;
                    break;
                }
            }
        }
        else
        {
            if (gChosenActionByBattler[0] == B_ACTION_RUN)
            {
                battler = 0;
                turnOrderId = 5;
            }
            if (gChosenActionByBattler[2] == B_ACTION_RUN)
            {
                battler = 2;
                turnOrderId = 5;
            }
        }

        if (turnOrderId == 5) // One of battlers wants to run.
        {
            gActionsByTurnOrder[0] = gChosenActionByBattler[battler];
            gBattlerByTurnOrder[0] = battler;
            turnOrderId = 1;
            for (i = 0; i < gBattlersCount; i++)
            {
                if (i != battler)
                {
                    gActionsByTurnOrder[turnOrderId] = gChosenActionByBattler[i];
                    gBattlerByTurnOrder[turnOrderId] = i;
                    turnOrderId++;
                }
            }
        }
        else
        {
            u32 quickClawRandom[MAX_BATTLERS_COUNT] = {0};
            u32 quickDrawRandom[MAX_BATTLERS_COUNT] = {0};

            for (battler = 0; battler < gBattlersCount; battler++)
            {
                if (gChosenActionByBattler[battler] == B_ACTION_USE_ITEM
                  || gChosenActionByBattler[battler] == B_ACTION_SWITCH
                  || gChosenActionByBattler[battler] == B_ACTION_THROW_BALL)
                {
                    gActionsByTurnOrder[turnOrderId] = gChosenActionByBattler[battler];
                    gBattlerByTurnOrder[turnOrderId] = battler;
                    turnOrderId++;
                }
            }
            for (battler = 0; battler < gBattlersCount; battler++)
            {
                if (gChosenActionByBattler[battler] != B_ACTION_USE_ITEM
                  && gChosenActionByBattler[battler] != B_ACTION_SWITCH
                  && gChosenActionByBattler[battler] != B_ACTION_THROW_BALL)
                {
                    gActionsByTurnOrder[turnOrderId] = gChosenActionByBattler[battler];
                    gBattlerByTurnOrder[turnOrderId] = battler;
                    quickClawRandom[battler] = RandomPercentage(RNG_QUICK_CLAW, GetBattlerHoldEffectParam(battler));
                    quickDrawRandom[battler] = RandomPercentage(RNG_QUICK_DRAW, 30);
                    turnOrderId++;
                }
            }
            struct BattleCalcValues calcValues = {0};
            for (i = 0; i < gBattlersCount; i++)
            {
                calcValues.abilities[i] = GetBattlerAbility(i);
                calcValues.holdEffects[i] = GetBattlerHoldEffect(i);
            }
            for (i = 0; i < gBattlersCount - 1; i++)
            {
                for (j = i + 1; j < gBattlersCount; j++)
                {
                    calcValues.battlerAtk = gBattlerByTurnOrder[i];
                    calcValues.battlerDef = gBattlerByTurnOrder[j];
                    TryChangingTurnOrderEffects(&calcValues, quickClawRandom, quickDrawRandom);
                    if (gActionsByTurnOrder[i] != B_ACTION_USE_ITEM
                        && gActionsByTurnOrder[j] != B_ACTION_USE_ITEM
                        && gActionsByTurnOrder[i] != B_ACTION_SWITCH
                        && gActionsByTurnOrder[j] != B_ACTION_SWITCH
                        && gActionsByTurnOrder[i] != B_ACTION_THROW_BALL
                        && gActionsByTurnOrder[j] != B_ACTION_THROW_BALL)
                    {
                        if (GetWhichBattlerFaster(&calcValues, FALSE) == -1)
                            SwapTurnOrder(i, j);
                    }
                }
            }
        }
    }
    gBattleMainFunc = CheckChangingTurnOrderEffects;
    gBattleStruct->quickClawBattlerId = 0;
}

static void TurnValuesCleanUp(bool8 var0)
{
    s32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (var0)
        {
            gProtectStructs[i].protected = PROTECT_NONE;
            gProtectStructs[i].quash = FALSE;
            gProtectStructs[i].usedCustapBerry = FALSE;
            gProtectStructs[i].quickDraw = FALSE;
            memset(&gQueuedStatBoosts[i], 0, sizeof(struct QueuedStatBoost));
        }
        else
        {
            memset(&gProtectStructs[i], 0, sizeof(struct ProtectStruct));

            if (gBattleStruct->battlerState[i].isFirstTurn)
                gBattleStruct->battlerState[i].isFirstTurn--;

            if (gBattleMons[i].volatiles.rechargeTimer)
                gBattleMons[i].volatiles.rechargeTimer--;

            gBattleStruct->battlerState[i].canPickupItem = FALSE;
            gBattleStruct->battlerState[i].wasAboveHalfHp = FALSE;
        }

        if (gBattleMons[i].volatiles.substituteHP == 0)
            gBattleMons[i].volatiles.substitute = FALSE;

        if (gBattleMons[i].volatiles.semiInvulnerable != STATE_COMMANDER)
            gBattleStruct->battlerState[i].commandingDondozo = FALSE;

        gSpecialStatuses[i].parentalBondState = PARENTAL_BOND_OFF;
        gBattleStruct->battlerState[i].usedEjectItem = FALSE;
        gProtectStructs[i].lashOutAffected = FALSE;
        gBattleMons[i].volatiles.endured = FALSE;
    }

    gSideTimers[B_SIDE_PLAYER].followmeTimer = 0;
    gSideTimers[B_SIDE_OPPONENT].followmeTimer = 0;

    gBattleStruct->pledgeMove = FALSE; // combined pledge move may not have been used due to a canceler
    gBattleStruct->tryDestinyBond = FALSE;
    gBattleStruct->tryGrudge = FALSE;
    ClearPursuitValues();
    ClearDamageCalcResults();
}

static void PopulateArrayWithBattlers(u8 *battlers)
{
    u32 i;
    for (i = 0; i < gBattlersCount; i++)
        battlers[i] = i;
}

static bool32 TryActivateGimmick(u32 battler)
{
    if ((gBattleStruct->gimmick.toActivate & (1u << battler)) && !(gProtectStructs[battler].noValidMoves))
    {
        gBattlerAttacker = gBattleScripting.battler = battler;
        gBattleStruct->gimmick.toActivate &= ~(1u << battler);
        if (gGimmicksInfo[gBattleStruct->gimmick.usableGimmick[battler]].ActivateGimmick != NULL)
        {
            gGimmicksInfo[gBattleStruct->gimmick.usableGimmick[battler]].ActivateGimmick(battler);
            return TRUE;
        }
    }
    return FALSE;
}

static bool32 TryDoGimmicksBeforeMoves(void)
{
    if (!(gHitMarker & HITMARKER_RUN) && gBattleStruct->gimmick.toActivate)
    {
        u32 i;
        u8 order[MAX_BATTLERS_COUNT];

        PopulateArrayWithBattlers(order);
        SortBattlersBySpeed(order, FALSE);
        for (i = 0; i < gBattlersCount; i++)
        {
            // Search through each battler and activate their gimmick if they have one prepared.
            if (TryActivateGimmick(order[i]))
                return TRUE;
        }
    }

    if (GetConfig(CONFIG_MEGA_EVO_TURN_ORDER) >= GEN_7)
        TryChangeTurnOrder(); // This will just do nothing if no mon has mega evolved.
    return FALSE;
}

static bool32 TryDoMoveEffectsBeforeMoves(void)
{
    if (!(gHitMarker & HITMARKER_RUN))
    {
        u32 i;
        u8 battlers[MAX_BATTLERS_COUNT];

        PopulateArrayWithBattlers(battlers);
        SortBattlersBySpeed(battlers, FALSE);
        for (i = 0; i < gBattlersCount; i++)
        {
            if (!gBattleStruct->battlerState[battlers[i]].focusPunchBattlers
                && !(gBattleMons[battlers[i]].status1 & STATUS1_SLEEP)
                && !(gBattleMons[battlers[i]].volatiles.truantCounter)
                && !(gProtectStructs[battlers[i]].noValidMoves))
            {
                gBattleStruct->battlerState[battlers[i]].focusPunchBattlers = TRUE;
                gBattlerAttacker = battlers[i];
                switch (GetMoveEffect(gChosenMoveByBattler[gBattlerAttacker]))
                {
                case EFFECT_FOCUS_PUNCH:
                    BattleScriptExecute(BattleScript_FocusPunchSetUp);
                    return TRUE;
                case EFFECT_BEAK_BLAST:
                    BattleScriptExecute(BattleScript_BeakBlastSetUp);
                    return TRUE;
                case EFFECT_SHELL_TRAP:
                    BattleScriptExecute(BattleScript_ShellTrapSetUp);
                    return TRUE;
                default:
                    break;
                }
            }
        }
    }

    return FALSE;
}

// In gen7, priority and speed are recalculated during the turn in which a pokemon mega evolves
static void TryChangeTurnOrder(void)
{
    u32 i, j;

    struct BattleCalcValues calcValues = {0};
    for (i = 0; i < gBattlersCount; i++)
    {
        calcValues.abilities[i] = GetBattlerAbility(i);
        calcValues.holdEffects[i] = GetBattlerHoldEffect(i);
    }
    for (i = gCurrentTurnActionNumber; i < gBattlersCount - 1; i++)
    {
        for (j = i + 1; j < gBattlersCount; j++)
        {
            calcValues.battlerAtk = gBattlerByTurnOrder[i];
            calcValues.battlerDef = gBattlerByTurnOrder[j];

            if (gActionsByTurnOrder[i] == B_ACTION_USE_MOVE
                && gActionsByTurnOrder[j] == B_ACTION_USE_MOVE)
            {
                if (GetWhichBattlerFaster(&calcValues, FALSE) == -1)
                    SwapTurnOrder(i, j);
            }
        }
    }
}

static void TryChangingTurnOrderEffects(struct BattleCalcValues *calcValues, u32 *quickClawRandom, u32 *quickDrawRandom)
{
    u32 battler1 = calcValues->battlerAtk;
    u32 battler2 = calcValues->battlerDef;
    enum Ability ability1 = calcValues->abilities[calcValues->battlerAtk];
    enum Ability ability2 = calcValues->abilities[calcValues->battlerDef];
    enum HoldEffect holdEffectBattler1 = calcValues->holdEffects[calcValues->battlerAtk];
    enum HoldEffect holdEffectBattler2 = calcValues->holdEffects[calcValues->battlerDef];

    // Battler 1
    // Quick Draw
    if (ability1 == ABILITY_QUICK_DRAW && !IsBattleMoveStatus(gChosenMoveByBattler[battler1]) && quickDrawRandom[battler1])
        gProtectStructs[battler1].quickDraw = TRUE;
    // Quick Claw and Custap Berry
    if (!gProtectStructs[battler1].quickDraw
     && ((holdEffectBattler1 == HOLD_EFFECT_QUICK_CLAW && quickClawRandom[battler1])
     || (holdEffectBattler1 == HOLD_EFFECT_CUSTAP_BERRY && HasEnoughHpToEatBerry(battler1, ability1, 4, gBattleMons[battler1].item))))
        gProtectStructs[battler1].usedCustapBerry = TRUE;

    // Battler 2
    // Quick Draw
    if (ability2 == ABILITY_QUICK_DRAW && !IsBattleMoveStatus(gChosenMoveByBattler[battler2]) && quickDrawRandom[battler2])
        gProtectStructs[battler2].quickDraw = TRUE;
    // Quick Claw and Custap Berry
    if (!gProtectStructs[battler2].quickDraw
     && ((holdEffectBattler2 == HOLD_EFFECT_QUICK_CLAW && quickClawRandom[battler2])
     || (holdEffectBattler2 == HOLD_EFFECT_CUSTAP_BERRY && HasEnoughHpToEatBerry(battler2, ability2, 4, gBattleMons[battler2].item))))
        gProtectStructs[battler2].usedCustapBerry = TRUE;
}

static void CheckChangingTurnOrderEffects(void)
{
    u32 i, battler;

    if (!(gHitMarker & HITMARKER_RUN))
    {
        while (gBattleStruct->quickClawBattlerId < gBattlersCount)
        {
            battler = gBattlerAttacker = gBattleStruct->quickClawBattlerId;
            gBattleStruct->quickClawBattlerId++;
            if (gChosenActionByBattler[battler] == B_ACTION_USE_MOVE
             && GetMoveEffect(gChosenMoveByBattler[battler]) != EFFECT_FOCUS_PUNCH   // quick claw message doesn't need to activate here
             && (gProtectStructs[battler].usedCustapBerry || gProtectStructs[battler].quickDraw)
             && !(gBattleMons[battler].status1 & STATUS1_SLEEP)
             && !(gBattleMons[gBattlerAttacker].volatiles.truantCounter)
             && !(gProtectStructs[battler].noValidMoves))
            {
                if (gProtectStructs[battler].usedCustapBerry)
                {
                    gLastUsedItem = gBattleMons[battler].item;
                    PREPARE_ITEM_BUFFER(gBattleTextBuff1, gLastUsedItem);
                    if (GetBattlerHoldEffect(battler) == HOLD_EFFECT_CUSTAP_BERRY)
                    {
                        // don't record berry since its gone now
                        BattleScriptExecute(BattleScript_CustapBerryActivation);
                    }
                    else
                    {
                        RecordItemEffectBattle(battler, GetBattlerHoldEffect(battler));
                        BattleScriptExecute(BattleScript_QuickClawActivation);
                    }
                }
                else if (gProtectStructs[battler].quickDraw)
                {
                    gBattlerAbility = battler;
                    gLastUsedAbility = gBattleMons[battler].ability;
                    PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                    RecordAbilityBattle(battler, gLastUsedAbility);
                    BattleScriptExecute(BattleScript_QuickDrawActivation);
                }
                return;
            }
        }
    }

    // setup stuff before turns/actions
    TryClearRageAndFuryCutter();

    // Prevents trainer slides triggering a turn late if another slide took priority on the previous turn
    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        for (enum TrainerSlideType slideId = 0; slideId < TRAINER_SLIDE_COUNT; slideId++)
        {
            MarkInitializedTrainerSlidesAsPlayed(i, slideId);
        }
    }

    gCurrentTurnActionNumber = 0;
    gCurrentActionFuncId = gActionsByTurnOrder[0];
    gBattleStruct->dynamicMoveType = 0;
    gBattleStruct->effectsBeforeUsingMoveDone = FALSE;
    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        gBattleStruct->battlerState[i].focusPunchBattlers = FALSE;
        gBattleStruct->battlerState[i].ateBoost = FALSE;
        gSpecialStatuses[i].gemBoost = FALSE;
    }

    gBattleMainFunc = RunTurnActionsFunctions;
    gBattleCommunication[3] = 0;
    gBattleCommunication[4] = 0;
    gBattleResources->battleScriptsStack->size = 0;
}

static void RunTurnActionsFunctions(void)
{
    if (gBattleOutcome != 0)
        gCurrentActionFuncId = B_ACTION_FINISHED;

    // Mega Evolve / Focus Punch-like moves after switching, items, running, but before using a move.
    if (gCurrentActionFuncId == B_ACTION_USE_MOVE && !gBattleStruct->effectsBeforeUsingMoveDone)
    {
        if (!IsPursuitTargetSet())
        {
            if (TryDoGimmicksBeforeMoves())
                return;
            else if (TryDoMoveEffectsBeforeMoves())
                return;
            gBattleStruct->effectsBeforeUsingMoveDone = TRUE;
        }
        else
        {
            if (TryActivateGimmick(gBattlerByTurnOrder[gCurrentTurnActionNumber]))
                return;
        }
    }

    gBattleStruct->savedTurnActionNumber = gCurrentTurnActionNumber;
    sTurnActionsFuncsTable[gCurrentActionFuncId]();

    if (gCurrentTurnActionNumber >= gBattlersCount) // everyone did their actions, turn finished
        gBattleMainFunc = sEndTurnFuncsTable[gBattleOutcome & 0x7F];
}

static void HandleEndTurn_BattleWon(void)
{
    gCurrentActionFuncId = 0;

    if (gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK))
    {
        gSpecialVar_Result = gBattleOutcome;
        gBattleTextBuff1[0] = gBattleOutcome;
        gBattlerAttacker = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        gBattlescriptCurrInstr = BattleScript_LinkBattleWonOrLost;
        gBattleOutcome &= ~B_OUTCOME_LINK_BATTLE_RAN;
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER
            && gBattleTypeFlags & (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_TRAINER_HILL | BATTLE_TYPE_EREADER_TRAINER))
    {
        BattleStopLowHpSound();
        gBattlescriptCurrInstr = BattleScript_BattleTowerTrainerBattleWon;
        PlayBGM(MUS_VICTORY_TRAINER);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && !(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        BattleStopLowHpSound();
        gBattlescriptCurrInstr = BattleScript_LocalTrainerBattleWon;

        switch (GetTrainerClassFromId(TRAINER_BATTLE_PARAM.opponentA))
        {
        case TRAINER_CLASS_LEADER:
        case TRAINER_CLASS_CHAMPION:
            PlayBGM(MUS_VICTORY_GYM_LEADER);
            break;
        case TRAINER_CLASS_BOSS:
        case TRAINER_CLASS_TEAM_ROCKET:
        case TRAINER_CLASS_COOLTRAINER:
        case TRAINER_CLASS_ELITE_FOUR:
        case TRAINER_CLASS_GENTLEMAN:
        default:
            PlayBGM(MUS_VICTORY_TRAINER);
            break;
        }
    }
    else
    {
        gBattlescriptCurrInstr = BattleScript_PayDayMoneyAndPickUpItems;
    }

    gBattleMainFunc = HandleEndTurn_FinishBattle;
}

static void HandleEndTurn_BattleLost(void)
{
    gCurrentActionFuncId = 0;

    if (gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK))
    {
        // if (gBattleTypeFlags & BATTLE_TYPE_FRONTIER)
        // {
        //     if (gBattleOutcome & B_OUTCOME_LINK_BATTLE_RAN)
        //     {
        //         gBattlescriptCurrInstr = BattleScript_PrintPlayerForfeitedLinkBattle;
        //         gBattleOutcome &= ~B_OUTCOME_LINK_BATTLE_RAN;
        //         gSaveBlock2Ptr->frontier.disableRecordBattle = TRUE;
        //     }
        //     else
        //     {
        //         gBattlescriptCurrInstr = BattleScript_FrontierLinkBattleLost;
        //         gBattleOutcome &= ~B_OUTCOME_LINK_BATTLE_RAN;
        //     }
        // }
        // else
        {
            gBattleTextBuff1[0] = gBattleOutcome;
            gBattlerAttacker = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
            gBattlescriptCurrInstr = BattleScript_LinkBattleWonOrLost;
            gBattleOutcome &= ~B_OUTCOME_LINK_BATTLE_RAN;
        }
    }
    else
    {
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && GetTrainerBattleMode() == TRAINER_BATTLE_EARLY_RIVAL)
        {
            if (GetRivalBattleFlags() & RIVAL_BATTLE_HEAL_AFTER)
                gBattleCommunication[MULTISTRING_CHOOSER] = 1; // Dont do white out text
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = 2; // Do white out text
            gBattlerAttacker = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        }
        else
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        }
        gBattlescriptCurrInstr = BattleScript_LocalBattleLost;
    }

    gBattleMainFunc = HandleEndTurn_FinishBattle;
}

static void HandleEndTurn_RanFromBattle(void)
{
    gCurrentActionFuncId = 0;

    // if (gBattleTypeFlags & BATTLE_TYPE_FRONTIER && gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    // {
    //     gBattlescriptCurrInstr = BattleScript_PrintPlayerForfeited;
    //     gBattleOutcome = B_OUTCOME_FORFEITED;
    //     gSaveBlock2Ptr->frontier.disableRecordBattle = TRUE;
    // }
    // else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_HILL)
    // {
    //     gBattlescriptCurrInstr = BattleScript_PrintPlayerForfeited;
    //     gBattleOutcome = B_OUTCOME_FORFEITED;
    // }
    // else if (CanPlayerForfeitNormalTrainerBattle())
    // {
    //     gBattlescriptCurrInstr = BattleScript_ForfeitBattleGaveMoney;
    //     gBattleOutcome = B_OUTCOME_FORFEITED;
    // }
    // else
    // {
        switch (gProtectStructs[gBattlerAttacker].fleeType)
        {
        default:
            gBattlescriptCurrInstr = BattleScript_GotAwaySafely;
            break;
        case FLEE_ITEM:
            gBattlescriptCurrInstr = BattleScript_SmokeBallEscape;
            break;
        case FLEE_ABILITY:
            gBattlescriptCurrInstr = BattleScript_RanAwayUsingMonAbility;
            break;
        }
    // }

    gBattleMainFunc = HandleEndTurn_FinishBattle;
}

static void HandleEndTurn_MonFled(void)
{
    gCurrentActionFuncId = 0;

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gBattlerAttacker, gBattlerPartyIndexes[gBattlerAttacker]);
    gBattlescriptCurrInstr = BattleScript_WildMonFled;

    gBattleMainFunc = HandleEndTurn_FinishBattle;
}

static void HandleEndTurn_FinishBattle(void)
{
    u32 i, battler;

    if (gCurrentActionFuncId == B_ACTION_TRY_FINISH || gCurrentActionFuncId == B_ACTION_FINISHED)
    {
        if (!(gBattleTypeFlags & (BATTLE_TYPE_TRAINER_TOWER
                                | BATTLE_TYPE_RECORDED_LINK
                                | BATTLE_TYPE_EREADER_TRAINER
                                | BATTLE_TYPE_CATCH_TUTORIAL
                                | BATTLE_TYPE_BATTLE_TOWER
                                | BATTLE_TYPE_SAFARI
                                | BATTLE_TYPE_FIRST_BATTLE
                                | BATTLE_TYPE_LINK))
            && !(gBattleTypeFlags & BATTLE_TYPE_GHOST && IsGhostBattleWithoutScope()))
        {
            for (battler = 0; battler < gBattlersCount; battler++)
            {
                if (IsOnPlayerSide(battler))
                {
                    if (gBattleResults.playerMon1Species == SPECIES_NONE)
                    {
                        gBattleResults.playerMon1Species = GetMonData(GetBattlerMon(battler), MON_DATA_SPECIES);
                        GetMonData(GetBattlerMon(battler), MON_DATA_NICKNAME, gBattleResults.playerMon1Name);
                    }
                    else
                    {
                        gBattleResults.playerMon2Species = GetMonData(GetBattlerMon(battler), MON_DATA_SPECIES);
                        GetMonData(GetBattlerMon(battler), MON_DATA_NICKNAME, gBattleResults.playerMon2Name);
                    }
                }
            }
        }
        TrySetQuestLogBattleEvent();
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            ClearRematchStateByTrainerId();

        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK
                                  | BATTLE_TYPE_EREADER_TRAINER
                                  | BATTLE_TYPE_RECORDED_LINK
                                  | BATTLE_TYPE_TRAINER_HILL
                                  | BATTLE_TYPE_FRONTIER)))
        {
            for (enum BattleSide side = 0; side < NUM_BATTLE_SIDES; side++)
            {
                struct Pokemon *party = GetSideParty(side);

                if (side == B_SIDE_PLAYER && !B_PARTNER_MONS_MARKED_SEEN)
                    continue;

                for (u32 partySlot = 0; partySlot < PARTY_SIZE; partySlot++)
                {
                    if (gBattleStruct->partyState[side][partySlot].sentOut)
                        HandleSetPokedexFlagFromMon(&party[partySlot], FLAG_SET_SEEN);
                }
            }
        }

        BeginFastPaletteFade(3);
        FadeOutMapMusic(5);
        if (B_TRAINERS_KNOCK_OFF_ITEMS == TRUE || B_RESTORE_HELD_BATTLE_ITEMS >= GEN_9)
            TryRestoreHeldItems();

        for (i = 0; i < PARTY_SIZE; i++)
        {
            bool32 changedForm = TryRevertPartyMonFormChange(i);

            // Recalculate the stats of every party member before the end
            if (!changedForm && B_RECALCULATE_STATS >= GEN_5)
                CalculateMonStats(&gPlayerParty[i]);
        }
        RecordedBattle_SetPlaybackFinished();
        if (gTestRunnerEnabled)
            TestRunner_Battle_AfterLastTurn();
        // Clear battle mon species to avoid a bug on the next battle that causes
        // healthboxes loading incorrectly due to it trying to create a Mega Indicator
        // if the previous battler would've had it.
        for (i = 0; i < MAX_BATTLERS_COUNT; i++)
        {
            gBattleMons[i].species = SPECIES_NONE;
        }

        // Set Battle Controllers to BATTLE_CONTROLLER_NONE
        for (i = 0; i < MAX_BATTLERS_COUNT; i++)
        {
            gBattlerBattleController[i] = BATTLE_CONTROLLER_NONE;
        }

        gBattleMainFunc = FreeResetData_ReturnToOvOrDoEvolutions;
        gCB2_AfterEvolution = BattleMainCB2;
    }
    else
    {
        if (gBattleControllerExecFlags == 0)
            gBattleScriptingCommandsTable[gBattlescriptCurrInstr[0]]();
    }
}

static void FreeResetData_ReturnToOvOrDoEvolutions(void)
{
    if (!gPaletteFade.active)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
            FreeAllWindowBuffers();
        gIsFishingEncounter = FALSE;
        gIsSurfingEncounter = FALSE;
        if (gDexNavSpecies && (gBattleOutcome == B_OUTCOME_WON || gBattleOutcome == B_OUTCOME_CAUGHT))
        {
            IncrementDexNavChain();
            TryIncrementSpeciesSearchLevel();
        }
        else
            gSaveBlock3Ptr->dexNavChain = 0;

        gDexNavSpecies = SPECIES_NONE;
        ResetSpriteData();
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK
                                  | BATTLE_TYPE_RECORDED_LINK
                                  | BATTLE_TYPE_FIRST_BATTLE
                                  | BATTLE_TYPE_SAFARI
                                  | BATTLE_TYPE_BATTLE_TOWER
                                  | BATTLE_TYPE_EREADER_TRAINER
                                  | BATTLE_TYPE_CATCH_TUTORIAL
                                  | BATTLE_TYPE_POKEDUDE))
            && (B_EVOLUTION_AFTER_WHITEOUT >= GEN_6
                || gBattleOutcome == B_OUTCOME_WON
                || gBattleOutcome == B_OUTCOME_CAUGHT))
        {
            gBattleMainFunc = TryEvolvePokemon;
        }
        else
        {
            gBattleMainFunc = ReturnFromBattleToOverworld;
            return;
        }
    }

    if (!(gBattleTypeFlags & BATTLE_TYPE_POKEDUDE))
        FreeAllWindowBuffers();
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        // To account for Battle Factory and Slateport Battle Tent, enemy parties are zeroed out in the facilitites respective src/xxx.c files
        // The ZeroEnemyPartyMons() call happens in SaveXXXChallenge function (eg. SaveFactoryChallenge)
        if (!(gBattleTypeFlags & (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_ROAMER)))
        {
            ZeroEnemyPartyMons();
        }
        ResetDynamicAiFunctions();
        FreeMonSpritesGfx();
        FreeBattleResources();
        FreeBattleSpritesData();
    }
}

static void TryEvolvePokemon(void)
{
    s32 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (!(sTriedEvolving & (1u << i)))
        {
            bool32 canStopEvo = TRUE;
            enum EvolutionMode mode = EVO_MODE_BATTLE_SPECIAL;
            u32 evolutionItemArg = i;
            u32 species = GetEvolutionTargetSpecies(&gPlayerParty[i], mode, evolutionItemArg, NULL, &canStopEvo, CHECK_EVO);
            sTriedEvolving |= 1u << i;

            if (species == SPECIES_NONE && (gLeveledUpInBattle & (1u << i)))
            {
                gLeveledUpInBattle &= ~(1u << i);
                mode = EVO_MODE_BATTLE_ONLY;
                evolutionItemArg = gLeveledUpInBattle;
                species = GetEvolutionTargetSpecies(&gPlayerParty[i], mode, evolutionItemArg, NULL, &canStopEvo, CHECK_EVO);
            }

            if (species != SPECIES_NONE)
            {
                FreeAllWindowBuffers();
                gBattleMainFunc = WaitForEvoSceneToFinish;
                GetEvolutionTargetSpecies(&gPlayerParty[i], mode, evolutionItemArg, NULL, &canStopEvo, DO_EVO);
                EvolutionScene(&gPlayerParty[i], species, canStopEvo, i);
                return;
            }
        }
    }
    sTriedEvolving = 0;
    gLeveledUpInBattle = 0;
    gBattleMainFunc = ReturnFromBattleToOverworld;
}

static void WaitForEvoSceneToFinish(void)
{
    if (gMain.callback2 == BattleMainCB2)
        gBattleMainFunc = TryEvolvePokemon;
}

static void ReturnFromBattleToOverworld(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        CalculatePlayerPartyCount();
        RandomlyGivePartyPokerus();
        PartySpreadPokerus();
    }

    if (gBattleTypeFlags & BATTLE_TYPE_LINK && gReceivedRemoteLinkPlayers)
        return;

    gSpecialVar_Result = gBattleOutcome;
    gMain.inBattle = FALSE;
    gMain.callback1 = gPreBattleCallback1;

    if (gBattleTypeFlags & BATTLE_TYPE_ROAMER)
    {
        UpdateRoamerHPStatus(&gEnemyParty[0]);
        ZeroEnemyPartyMons();

#ifndef BUGFIX
        if ((gBattleOutcome & B_OUTCOME_WON) || gBattleOutcome == B_OUTCOME_CAUGHT)
#else
        if ((gBattleOutcome == B_OUTCOME_WON) || gBattleOutcome == B_OUTCOME_CAUGHT) // Bug: When Roar is used by roamer, gBattleOutcome is B_OUTCOME_PLAYER_TELEPORTED (5).
#endif                                                                               // & with B_OUTCOME_WON (1) will return TRUE and deactivates the roamer.
            SetRoamerInactive(gEncounteredRoamerIndex);
    }

    m4aSongNumStop(SE_LOW_HEALTH);
    SetMainCallback2(gMain.savedCallback);
}

void RunBattleScriptCommands_PopCallbacksStack(void)
{
    if (gCurrentActionFuncId == B_ACTION_TRY_FINISH || gCurrentActionFuncId == B_ACTION_FINISHED)
    {
        if (gBattleResources->battleCallbackStack->size != 0)
            gBattleResources->battleCallbackStack->size--;
        gBattleMainFunc = gBattleResources->battleCallbackStack->function[gBattleResources->battleCallbackStack->size];
    }
    else
    {
        if (gBattleControllerExecFlags == 0)
            gBattleScriptingCommandsTable[gBattlescriptCurrInstr[0]]();
    }
}

void RunBattleScriptCommands(void)
{
    if (gBattleControllerExecFlags == 0)
        gBattleScriptingCommandsTable[gBattlescriptCurrInstr[0]]();
}

enum Type TrySetAteType(enum Move move, u32 battlerAtk, enum Ability attackerAbility)
{
    enum Type ateType = TYPE_NONE;

    switch (GetMoveEffect(move))
    {
    case EFFECT_TERA_BLAST:
        if (GetActiveGimmick(battlerAtk) == GIMMICK_TERA)
            return ateType;
        break;
    case EFFECT_TERA_STARSTORM:
        if (gBattleMons[battlerAtk].species == SPECIES_TERAPAGOS_STELLAR)
            return ateType;
        break;
    case EFFECT_HIDDEN_POWER:
    case EFFECT_WEATHER_BALL:
    case EFFECT_NATURAL_GIFT:
    case EFFECT_CHANGE_TYPE_ON_ITEM:
    case EFFECT_REVELATION_DANCE:
    case EFFECT_TERRAIN_PULSE:
        return ateType;
    default:
        break;
    }

    switch (attackerAbility)
    {
    case ABILITY_PIXILATE:
        ateType = TYPE_FAIRY;
        break;
    case ABILITY_REFRIGERATE:
        ateType = TYPE_ICE;
        break;
    case ABILITY_AERILATE:
        ateType = TYPE_FLYING;
        break;
    case ABILITY_GALVANIZE:
        ateType = TYPE_ELECTRIC;
        break;
    default:
        ateType = TYPE_NONE;
        break;
    }

    return ateType;
}

// Returns TYPE_NONE if type doesn't change.
enum Type GetDynamicMoveType(struct Pokemon *mon, enum Move move, u32 battler, enum MonState state)
{
    enum Type moveType = GetMoveType(move);
    enum BattleMoveEffects moveEffect = GetMoveEffect(move);
    u32 species, heldItem;
    enum Type type1, type2, type3;
    enum Ability ability;
    enum HoldEffect holdEffect;
    enum Gimmick gimmick = GetActiveGimmick(battler);

    if (state == MON_IN_BATTLE)
    {
        if (moveEffect == EFFECT_STRUGGLE)
            return TYPE_MYSTERY;

        species = gBattleMons[battler].species;
        heldItem = gBattleMons[battler].item;
        holdEffect = GetBattlerHoldEffect(battler);
        ability = GetBattlerAbility(battler);
        type1 = gBattleMons[battler].types[0];
        type2 = gBattleMons[battler].types[1];
        type3 = gBattleMons[battler].types[2];
    }
    else
    {
        species = GetMonData(mon, MON_DATA_SPECIES);
        heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
        holdEffect = GetItemHoldEffect(heldItem);
        ability = GetMonAbility(mon);
        type1 = GetSpeciesType(species, 0);
        type2 = GetSpeciesType(species, 1);
        type3 = TYPE_MYSTERY;
    }

    switch (moveEffect)
    {
    case EFFECT_WEATHER_BALL:
        if (state == MON_IN_BATTLE)
        {
            if (HasWeatherEffect())
            {
                if (gBattleWeather & B_WEATHER_RAIN && holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA)
                    return TYPE_WATER;
                else if (gBattleWeather & B_WEATHER_SANDSTORM)
                    return TYPE_ROCK;
                else if (gBattleWeather & B_WEATHER_SUN && holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA)
                    return TYPE_FIRE;
                else if (gBattleWeather & B_WEATHER_ICY_ANY)
                    return TYPE_ICE;
                else
                    return moveType;
            }
        }
        else
        {
            switch (gWeatherPtr->currWeather)
            {
            case WEATHER_DROUGHT:
                if (holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA)
                    return TYPE_FIRE;
                break;
            case WEATHER_RAIN:
            case WEATHER_RAIN_THUNDERSTORM:
            case WEATHER_DOWNPOUR:
                if (holdEffect != HOLD_EFFECT_UTILITY_UMBRELLA)
                    return TYPE_WATER;
                break;
            case WEATHER_SNOW:
                return TYPE_ICE;
            case WEATHER_SANDSTORM:
                return TYPE_ROCK;
            }
            return moveType;
        }
        break;
    case EFFECT_HIDDEN_POWER:
        {
            u32 typeBits = 0;
            if (state == MON_IN_BATTLE)
            {
                typeBits = ((gBattleMons[battler].hpIV & 1) << 0)
                        | ((gBattleMons[battler].attackIV & 1) << 1)
                        | ((gBattleMons[battler].defenseIV & 1) << 2)
                        | ((gBattleMons[battler].speedIV & 1) << 3)
                        | ((gBattleMons[battler].spAttackIV & 1) << 4)
                        | ((gBattleMons[battler].spDefenseIV & 1) << 5);
            }
            else
            {
                typeBits = ((GetMonData(mon, MON_DATA_HP_IV) & 1) << 0)
                        | ((GetMonData(mon, MON_DATA_ATK_IV) & 1) << 1)
                        | ((GetMonData(mon, MON_DATA_DEF_IV) & 1) << 2)
                        | ((GetMonData(mon, MON_DATA_SPEED_IV) & 1) << 3)
                        | ((GetMonData(mon, MON_DATA_SPATK_IV) & 1) << 4)
                        | ((GetMonData(mon, MON_DATA_SPDEF_IV) & 1) << 5);
            }

            u32 hpTypes[NUMBER_OF_MON_TYPES] = {0};
            u32 i, hpTypeCount = 0;
            for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
            {
                if (gTypesInfo[i].isHiddenPowerType)
                    hpTypes[hpTypeCount++] = i;
            }
            moveType = ((hpTypeCount - 1) * typeBits) / 63;
            return ((hpTypes[moveType] | F_DYNAMIC_TYPE_IGNORE_PHYSICALITY) & 0x3F);
        }
        break;
    case EFFECT_CHANGE_TYPE_ON_ITEM:
        if (holdEffect == GetMoveEffectArg_HoldEffect(move))
            return GetItemSecondaryId(heldItem);
        break;
    case EFFECT_REVELATION_DANCE:
        if (gimmick != GIMMICK_Z_MOVE)
        {
            enum Type teraType;
            if (gimmick == GIMMICK_TERA && ((teraType = GetMonData(mon, MON_DATA_TERA_TYPE)) != TYPE_STELLAR))
                return teraType;
            else if (type1 != TYPE_MYSTERY && !(gBattleMons[battler].volatiles.roostActive && type1 == TYPE_FLYING))
                return type1;
            else if (type2 != TYPE_MYSTERY && !(gBattleMons[battler].volatiles.roostActive && type2 == TYPE_FLYING))
                return type2;
            else if (gBattleMons[battler].volatiles.roostActive)
                return (B_ROOST_PURE_FLYING >= GEN_5 ? TYPE_NORMAL : TYPE_MYSTERY);
            else if (type3 != TYPE_MYSTERY)
                return type3;
            else
                return TYPE_MYSTERY;
        }
        break;
    case EFFECT_RAGING_BULL:
        switch (species)
        {
        case SPECIES_TAUROS_PALDEA_COMBAT:
        case SPECIES_TAUROS_PALDEA_BLAZE:
        case SPECIES_TAUROS_PALDEA_AQUA:
            return GetSpeciesType(species, 1);
        }
        break;
    case EFFECT_IVY_CUDGEL:
        switch (species)
        {
        case SPECIES_OGERPON_WELLSPRING:
        case SPECIES_OGERPON_WELLSPRING_TERA:
        case SPECIES_OGERPON_HEARTHFLAME:
        case SPECIES_OGERPON_HEARTHFLAME_TERA:
        case SPECIES_OGERPON_CORNERSTONE:
        case SPECIES_OGERPON_CORNERSTONE_TERA:
            return GetSpeciesType(species, 1);
        }
        break;
    case EFFECT_NATURAL_GIFT:
        if (GetItemPocket(heldItem) == POCKET_BERRIES)
            return gNaturalGiftTable[ITEM_TO_BERRY(heldItem)].type;
        else
            return moveType;
    case EFFECT_TERRAIN_PULSE:
        if (state == MON_IN_BATTLE)
        {
            if (IsAnyTerrainAffected(battler, GetBattlerAbility(battler), GetBattlerHoldEffect(battler), gFieldStatuses))
            {
                if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)
                    return TYPE_ELECTRIC;
                else if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN)
                    return TYPE_GRASS;
                else if (gFieldStatuses & STATUS_FIELD_MISTY_TERRAIN)
                    return TYPE_FAIRY;
                else if (gFieldStatuses & STATUS_FIELD_PSYCHIC_TERRAIN)
                    return TYPE_PSYCHIC;
                else //failsafe
                    return moveType;
            }
        }
        else
        {
            switch (gWeatherPtr->currWeather)
            {
            case WEATHER_RAIN_THUNDERSTORM:
                if (B_THUNDERSTORM_TERRAIN)
                    return TYPE_ELECTRIC;
                break;
            case WEATHER_FOG_HORIZONTAL:
            case WEATHER_FOG_DIAGONAL:
                if (B_OVERWORLD_FOG >= GEN_8)
                    return TYPE_FAIRY;
                break;
            }
            return moveType;
        }
        break;
    case EFFECT_TERA_BLAST:
        if (gimmick == GIMMICK_TERA)
            return GetMonData(mon, MON_DATA_TERA_TYPE);
        break;
    case EFFECT_TERA_STARSTORM:
        if (species == SPECIES_TERAPAGOS_STELLAR)
            return TYPE_STELLAR;
        break;
    default:
        break;
    }

    if (IsSoundMove(move) && ability == ABILITY_LIQUID_VOICE)
    {
        return TYPE_WATER;
    }
    else if (moveEffect == EFFECT_AURA_WHEEL
          && species == SPECIES_MORPEKO_HANGRY
          && ability != ABILITY_NORMALIZE)
    {
        return TYPE_DARK;
    }
    else if (moveType == TYPE_NORMAL
          && ability != ABILITY_NORMALIZE
          && gimmick != GIMMICK_DYNAMAX
          && gimmick != GIMMICK_Z_MOVE)
    {
        u32 ateType = TrySetAteType(move, battler, ability);
        if (ateType != TYPE_NONE && state == MON_IN_BATTLE)
            gBattleStruct->battlerState[battler].ateBoost = TRUE;
        return ateType;
    }
    else if (moveEffect != EFFECT_CHANGE_TYPE_ON_ITEM
          && moveEffect != EFFECT_TERRAIN_PULSE
          && moveEffect != EFFECT_NATURAL_GIFT
          && moveEffect != EFFECT_HIDDEN_POWER
          && moveEffect != EFFECT_WEATHER_BALL
          && ability == ABILITY_NORMALIZE
          && gimmick != GIMMICK_Z_MOVE)
    {
        if (state == MON_IN_BATTLE && gimmick != GIMMICK_DYNAMAX)
            gBattleStruct->battlerState[battler].ateBoost = TRUE;
        return TYPE_NORMAL;
    }

    return TYPE_NONE;
}

void SetTypeBeforeUsingMove(enum Move move, u32 battler)
{
    enum Type moveType;
    u32 heldItem = gBattleMons[battler].item;
    enum HoldEffect holdEffect = GetBattlerHoldEffect(battler);

    gBattleStruct->dynamicMoveType = 0;
    gBattleStruct->battlerState[battler].ateBoost = FALSE;
    gSpecialStatuses[battler].gemBoost = FALSE;

    moveType = GetDynamicMoveType(GetBattlerMon(battler),
                                  move,
                                  battler,
                                  MON_IN_BATTLE);

    if (moveType != TYPE_NONE)
        gBattleStruct->dynamicMoveType = moveType | F_DYNAMIC_TYPE_SET;

    moveType = GetBattleMoveType(move);
    if ((gFieldStatuses & STATUS_FIELD_ION_DELUGE && moveType == TYPE_NORMAL)
     || gBattleMons[battler].volatiles.electrified)
        gBattleStruct->dynamicMoveType = TYPE_ELECTRIC | F_DYNAMIC_TYPE_SET;

    // Check if a gem should activate.
    u32 effect = GetMoveEffect(move);
    if (holdEffect == HOLD_EFFECT_GEMS
        && GetBattleMoveType(move) == GetItemSecondaryId(heldItem)
        && effect != EFFECT_PLEDGE
        && effect != EFFECT_OHKO
        && effect != EFFECT_SHEER_COLD)
    {
        gSpecialStatuses[battler].gemParam = GetBattlerHoldEffectParam(battler);
        gSpecialStatuses[battler].gemBoost = TRUE;
    }
}

// Queues stat boosts for a given battler for totem battles
void ScriptSetTotemBoost(struct ScriptContext *ctx)
{
    u32 battler = VarGet(ScriptReadHalfword(ctx));
    u32 stat;
    u32 i;

    Script_RequestEffects(SCREFF_V1);

    for (i = 0; i < (NUM_BATTLE_STATS - 1); i++)
    {
        stat = VarGet(ScriptReadHalfword(ctx));
        if (stat)
        {
            gQueuedStatBoosts[battler].stats |= (1 << i);
            gQueuedStatBoosts[battler].statChanges[i] = stat;
            gQueuedStatBoosts[battler].stats |= 0x80;  // used as a flag for the "totem flared to life" script
        }
    }
}

bool32 IsWildMonSmart(void)
{
#if B_SMART_WILD_AI_FLAG != 0
    return (FlagGet(B_SMART_WILD_AI_FLAG));
#else
    return FALSE;
#endif
}

s32 Factorial(s32 n)
{
    s32 f = 1, i;
    for (i = 2; i <= n; i++)
        f *= i;
    return f;
}

bool32 CanPlayerForfeitNormalTrainerBattle(void)
{
    if (!B_RUN_TRAINER_BATTLE)
        return FALSE;

    if (gBattleTypeFlags & BATTLE_TYPE_FRONTIER)
        return FALSE;

    if (gBattleTypeFlags & BATTLE_TYPE_RECORDED_INVALID)
        return FALSE;

    return (gBattleTypeFlags & BATTLE_TYPE_TRAINER);
}

bool32 DidPlayerForfeitNormalTrainerBattle(void)
{
    if (!CanPlayerForfeitNormalTrainerBattle())
        return FALSE;

    return (gBattleOutcome == B_OUTCOME_FORFEITED);
}

// Wins the battle instantly. Used in the battle debug with LIST_ITEM_INSTANT_WIN
void BattleDebug_WonBattle(void)
{
    gBattleOutcome |= B_OUTCOME_WON;
    gBattleMainFunc = sEndTurnFuncsTable[gBattleOutcome & 0x7F];
}
