#include "global.h"
#include "task.h"
#include "battle_setup.h"
#include "help_system.h"
#include "overworld.h"
#include "item.h"
#include "sound.h"
#include "pokemon.h"
#include "load_save.h"
#include "safari_zone.h"
#include "quest_log.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "strings.h"
#include "string_util.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "metatile_behavior.h"
#include "event_scripts.h"
#include "fldeff.h"
#include "fieldmap.h"
#include "field_control_avatar.h"
#include "field_player_avatar.h"
#include "field_screen_effect.h"
#include "field_message_box.h"
#include "trainer_see.h"
#include "vs_seeker.h"
#include "battle.h"
#include "battle_transition.h"
#include "battle_controllers.h"
#include "constants/battle_setup.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/songs.h"
#include "constants/pokemon.h"
#include "constants/trainers.h"

enum {
    TRANSITION_TYPE_NORMAL,
    TRANSITION_TYPE_CAVE,
    TRANSITION_TYPE_FLASH,
    TRANSITION_TYPE_WATER,
};

enum
{
    TRAINER_PARAM_LOAD_VAL_8BIT,
    TRAINER_PARAM_LOAD_VAL_16BIT,
    TRAINER_PARAM_LOAD_VAL_32BIT,
    TRAINER_PARAM_CLEAR_VAL_8BIT,
    TRAINER_PARAM_CLEAR_VAL_16BIT,
    TRAINER_PARAM_CLEAR_VAL_32BIT,
    TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR,
};

struct TrainerBattleParameter
{
    void *varPtr;
    u8 ptrType;
};

static void DoSafariBattle(void);
static void DoGhostBattle(void);
static void DoStandardWildBattle(bool32 isDouble);
static void CB2_EndWildBattle(void);
static void CB2_EndScriptedWildBattle(void);
static void CB2_EndMarowakBattle(void);
static bool32 IsPlayerDefeated(u32 battleOutcome);
static void CB2_EndTrainerBattle(void);
static const u8 *GetIntroSpeechOfApproachingTrainer(void);
static const u8 *GetTrainerCantBattleSpeech(void);

static EWRAM_DATA u16 sTrainerBattleMode = 0;
EWRAM_DATA u16 gTrainerBattleOpponent_A = 0;
EWRAM_DATA u16 gTrainerBattleOpponent_B = 0;
EWRAM_DATA u16 gPartnerTrainerId = 0;
static EWRAM_DATA u16 sTrainerObjectEventLocalId = 0;
static EWRAM_DATA u8 *sTrainerAIntroSpeech = NULL;
EWRAM_DATA static u8 *sTrainerBIntroSpeech = NULL;
static EWRAM_DATA u8 *sTrainerADefeatSpeech = NULL;
EWRAM_DATA static u8 *sTrainerBDefeatSpeech = NULL;
static EWRAM_DATA u8 *sTrainerVictorySpeech = NULL;
static EWRAM_DATA u8 *sTrainerCannotBattleSpeech = NULL;
static EWRAM_DATA u8 *sTrainerBattleEndScript = NULL;
static EWRAM_DATA u8 *sTrainerABattleScriptRetAddr = NULL;
EWRAM_DATA static u8 *sTrainerBBattleScriptRetAddr = NULL;
static EWRAM_DATA u16 sRivalBattleFlags = 0;
EWRAM_DATA static bool8 sShouldCheckTrainerBScript = FALSE;
EWRAM_DATA static u8 sNoOfPossibleTrainerRetScripts = 0;

// The first transition is used if the enemy pokemon are lower level than our pokemon.
// Otherwise, the second transition is used.
static const u8 sBattleTransitionTable_Wild[][2] =
{
    [TRANSITION_TYPE_NORMAL] = {B_TRANSITION_SLICE,          B_TRANSITION_WHITE_BARS_FADE},
    [TRANSITION_TYPE_CAVE]   = {B_TRANSITION_CLOCKWISE_WIPE, B_TRANSITION_GRID_SQUARES},
    [TRANSITION_TYPE_FLASH]  = {B_TRANSITION_BLUR,           B_TRANSITION_GRID_SQUARES},
    [TRANSITION_TYPE_WATER]  = {B_TRANSITION_WAVE,           B_TRANSITION_RIPPLE},
};

static const u8 sBattleTransitionTable_Trainer[][2] =
{
    [TRANSITION_TYPE_NORMAL] = {B_TRANSITION_POKEBALLS_TRAIL, B_TRANSITION_ANGLED_WIPES},
    [TRANSITION_TYPE_CAVE]   = {B_TRANSITION_SHUFFLE,         B_TRANSITION_BIG_POKEBALL},
    [TRANSITION_TYPE_FLASH]  = {B_TRANSITION_BLUR,            B_TRANSITION_GRID_SQUARES},
    [TRANSITION_TYPE_WATER]  = {B_TRANSITION_SWIRL,           B_TRANSITION_RIPPLE},
};

static const struct TrainerBattleParameter sOrdinaryBattleParams[] =
{
    {&sTrainerBattleMode,           TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent_A,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerObjectEventLocalId,   TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerAIntroSpeech,         TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerADefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech,        TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech,   TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerABattleScriptRetAddr, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleEndScript,      TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};

static const struct TrainerBattleParameter sContinueScriptBattleParams[] =
{
    {&sTrainerBattleMode,           TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent_A,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerObjectEventLocalId,   TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerAIntroSpeech,         TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerADefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech,        TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech,   TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerABattleScriptRetAddr, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerBattleEndScript,      TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};

static const struct TrainerBattleParameter sDoubleBattleParams[] =
{
    {&sTrainerBattleMode,           TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent_A,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerObjectEventLocalId,   TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerAIntroSpeech,         TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerADefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech,        TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech,   TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerABattleScriptRetAddr, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleEndScript,      TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};

static const struct TrainerBattleParameter sOrdinaryNoIntroBattleParams[] =
{
    {&sTrainerBattleMode,           TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent_A,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerObjectEventLocalId,   TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerAIntroSpeech,         TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerADefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech,        TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech,   TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerABattleScriptRetAddr, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleEndScript,      TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};

static const struct TrainerBattleParameter sEarlyRivalBattleParams[] =
{
    {&sTrainerBattleMode,           TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent_A,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sRivalBattleFlags,            TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerAIntroSpeech,         TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerADefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerCannotBattleSpeech,   TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerABattleScriptRetAddr, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleEndScript,      TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};

static const struct TrainerBattleParameter sContinueScriptDoubleBattleParams[] =
{
    {&sTrainerBattleMode,           TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent_A,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerObjectEventLocalId,   TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerAIntroSpeech,         TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerADefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech,        TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech,   TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerABattleScriptRetAddr, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerBattleEndScript,      TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};

static const struct TrainerBattleParameter sTrainerBOrdinaryBattleParams[] =
{
    {&sTrainerBattleMode,           TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent_B,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerObjectEventLocalId,   TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerBIntroSpeech,         TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerBDefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech,        TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech,   TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBBattleScriptRetAddr, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleEndScript,      TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};

static const struct TrainerBattleParameter sTrainerBContinueScriptBattleParams[] =
{
    {&sTrainerBattleMode,           TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent_B,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerObjectEventLocalId,   TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerBIntroSpeech,         TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerBDefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech,        TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech,   TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBBattleScriptRetAddr, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerBattleEndScript,      TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};

// two trainers, each with a defeat speech
static const struct TrainerBattleParameter sTrainerTwoTrainerBattleParams[] =
{
    {&sTrainerBattleMode,           TRAINER_PARAM_LOAD_VAL_8BIT},
    {&sTrainerObjectEventLocalId,   TRAINER_PARAM_CLEAR_VAL_16BIT},
    {&gTrainerBattleOpponent_A,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerAIntroSpeech,         TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerADefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&gTrainerBattleOpponent_B,     TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerBIntroSpeech,         TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBDefeatSpeech,        TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech,        TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech,   TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBBattleScriptRetAddr, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleEndScript,      TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};


#define tState data[0]
#define tTransition data[1]

static void Task_BattleStart(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        if (!FldEffPoison_IsActive())
        {
            HelpSystem_Disable();
            BattleTransition_StartOnField(tTransition);
            ++tState;
        }
        break;
    case 1:
        if (IsBattleTransitionDone() == TRUE)
        {
            HelpSystem_Enable();
            CleanupOverworldWindowsAndTilemaps();
            SetMainCallback2(CB2_InitBattle);
            RestartWildEncounterImmunitySteps();
            ClearPoisonStepCounter();
            DestroyTask(taskId);
        }
        break;
    }
}

static void CreateBattleStartTask(u8 transition, u16 song) // song == 0 means default music for current map
{
    u8 taskId = CreateTask(Task_BattleStart, 1);

    gTasks[taskId].tTransition = transition;
    PlayMapChosenOrBattleBGM(song);
}

static void Task_BattleStart_Debug(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        if (!FldEffPoison_IsActive()) // is poison not active?
        {
            HelpSystem_Disable();
            BattleTransition_StartOnField(tTransition);
            // ClearMirageTowerPulseBlendEffect();
            tState++; // go to case 1.
        }
        break;
    case 1:
        if (IsBattleTransitionDone() == TRUE)
        {
            HelpSystem_Enable();
            CleanupOverworldWindowsAndTilemaps();
            SetMainCallback2(CB2_InitBattle);
            RestartWildEncounterImmunitySteps();
            ClearPoisonStepCounter();
            DestroyTask(taskId);
        }
        break;
    }
}

static void CreateBattleStartTask_Debug(u8 transition, u16 song)
{
    u8 taskId = CreateTask(Task_BattleStart_Debug, 1);

    gTasks[taskId].tTransition = transition;
    PlayMapChosenOrBattleBGM(song);
}

#undef tState
#undef tTransition

static bool8 CheckSilphScopeInPokemonTower(u16 mapGroup, u16 mapNum)
{
    if (mapGroup == MAP_GROUP(POKEMON_TOWER_1F)
     && (mapNum == MAP_NUM(POKEMON_TOWER_1F)
      || mapNum == MAP_NUM(POKEMON_TOWER_2F)
      || mapNum == MAP_NUM(POKEMON_TOWER_3F)
      || mapNum == MAP_NUM(POKEMON_TOWER_4F)
      || mapNum == MAP_NUM(POKEMON_TOWER_5F)
      || mapNum == MAP_NUM(POKEMON_TOWER_6F)
      || mapNum == MAP_NUM(POKEMON_TOWER_7F))
     && !(CheckBagHasItem(ITEM_SILPH_SCOPE, 1)))
        return TRUE;
    else
        return FALSE;
}

void StartWildBattle(void)
{
    if (GetSafariZoneFlag())
        DoSafariBattle();
    else if (CheckSilphScopeInPokemonTower(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum))
        DoGhostBattle();
    else
        DoStandardWildBattle(FALSE);
}

void StartDoubleWildBattle(void)
{
    DoStandardWildBattle(TRUE);
}

static void DoStandardWildBattle(bool32 isDouble)
{
    LockPlayerFieldControls();
    FreezeObjectEvents();
    StopPlayerAvatar();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = 0;
    if (isDouble)
        gBattleTypeFlags |= BATTLE_TYPE_DOUBLE;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void StartRoamerBattle(void)
{
    LockPlayerFieldControls();
    FreezeObjectEvents();
    StopPlayerAvatar();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_ROAMER;
    CreateBattleStartTask(GetWildBattleTransition(), MUS_VS_LEGEND);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

static void DoSafariBattle(void)
{
    LockPlayerFieldControls();
    FreezeObjectEvents();
    StopPlayerAvatar();
    gMain.savedCallback = CB2_EndSafariBattle;
    gBattleTypeFlags = BATTLE_TYPE_SAFARI;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
}

static void DoGhostBattle(void)
{
    LockPlayerFieldControls();
    FreezeObjectEvents();
    StopPlayerAvatar();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_GHOST;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    SetMonData(&gEnemyParty[0], MON_DATA_NICKNAME, gText_Ghost);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

static void DoTrainerBattle(void)
{
    CreateBattleStartTask(GetTrainerBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_TRAINER_BATTLES);
}

void StartOldManTutorialBattle(void)
{
    CreateMaleMon(&gEnemyParty[0], SPECIES_WEEDLE, 5);
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_ReturnToFieldContinueScriptPlayMapMusic;
    gBattleTypeFlags = BATTLE_TYPE_OLD_MAN_TUTORIAL;
    CreateBattleStartTask(B_TRANSITION_SLICE, 0);
}

void BattleSetup_StartScriptedWildBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_WILD_SCRIPTED;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void BattleSetup_StartScriptedDoubleWildBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_DOUBLE;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void StartMarowakBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndMarowakBattle;
    if (CheckBagHasItem(ITEM_SILPH_SCOPE, 1))
    {
        gBattleTypeFlags = BATTLE_TYPE_GHOST | BATTLE_TYPE_GHOST_UNVEILED;
        CreateMonWithGenderNatureLetter(gEnemyParty, SPECIES_MAROWAK, 30, 31, MON_FEMALE, NATURE_SERIOUS, 0);
    }
    else
    {
        gBattleTypeFlags = BATTLE_TYPE_GHOST;
    }
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    SetMonData(&gEnemyParty[0], MON_DATA_NICKNAME, gText_Ghost);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void StartSouthernIslandBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void StartLegendaryBattle(void)
{
    u16 species;
    
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;
    species = GetMonData(&gEnemyParty[0], MON_DATA_SPECIES);
    switch (species)
    {
    case SPECIES_MEWTWO:
    case SPECIES_MEWTWO_MEGA_X:
    case SPECIES_MEWTWO_MEGA_Y:
        CreateBattleStartTask(B_TRANSITION_BLUR, MUS_VS_MEWTWO);
        break;
    case SPECIES_DEOXYS_NORMAL:
    case SPECIES_DEOXYS_ATTACK:
    case SPECIES_DEOXYS_DEFENSE:
    case SPECIES_DEOXYS_SPEED:
        CreateBattleStartTask(B_TRANSITION_BLUR, MUS_VS_DEOXYS);
        break;
    default:
        if (gSpeciesInfo[species].isLegendary || gSpeciesInfo[species].isMythical)
            CreateBattleStartTask(B_TRANSITION_BLUR, MUS_VS_LEGEND);
        else
            CreateBattleStartTask(B_TRANSITION_BLUR, MUS_RS_VS_TRAINER);
        break;
    }
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void StartGroudonKyogreBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;
    CreateBattleStartTask(B_TRANSITION_ANGLED_WIPES, MUS_RS_VS_TRAINER);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void StartRegiBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;
    CreateBattleStartTask(B_TRANSITION_BLUR, MUS_RS_VS_TRAINER);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

static void DowngradeBadPoison(void)
{
    u8 i;
    u32 status = STATUS1_POISON;
    if (B_TOXIC_REVERSAL < GEN_5)
        return;
    for(i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_HAS_SPECIES) && GetMonData(&gPlayerParty[i], MON_DATA_STATUS) == STATUS1_TOXIC_POISON)
            SetMonData(&gPlayerParty[i], MON_DATA_STATUS, &status);
    }
}

static void CB2_EndWildBattle(void)
{
    CpuFill16(0, (void *)BG_PLTT, BG_PLTT_SIZE);
    ResetOamRange(0, 128);
    if (IsPlayerDefeated(gBattleOutcome) == TRUE)
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        SetMainCallback2(CB2_ReturnToField);
        DowngradeBadPoison();
        gFieldCallback = FieldCB_SafariZoneRanOutOfBalls;
    }
}

static void CB2_EndScriptedWildBattle(void)
{
    CpuFill16(0, (void *)BG_PLTT, BG_PLTT_SIZE);
    ResetOamRange(0, 128);
    if (IsPlayerDefeated(gBattleOutcome) == TRUE)
        SetMainCallback2(CB2_WhiteOut);
    else
    {
        DowngradeBadPoison();
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
    }
}

static void CB2_EndMarowakBattle(void)
{
    CpuFill16(0, (void *)BG_PLTT, BG_PLTT_SIZE);
    ResetOamRange(0, 128);
    if (IsPlayerDefeated(gBattleOutcome))
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        // If result is TRUE player didnt defeat Marowak, force player back from stairs
        if (gBattleOutcome == B_OUTCOME_WON)
            gSpecialVar_Result = FALSE;
        else
            gSpecialVar_Result = TRUE;
        DowngradeBadPoison();
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
    }
}

u8 BattleSetup_GetTerrainId(void)
{
    u16 tileBehavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
    if (MetatileBehavior_IsTallGrass(tileBehavior))
        return BATTLE_TERRAIN_GRASS;
    if (MetatileBehavior_IsLongGrass(tileBehavior))
        return BATTLE_TERRAIN_LONG_GRASS;
    if (MetatileBehavior_IsSandOrShallowFlowingWater(tileBehavior))
        return BATTLE_TERRAIN_SAND;
    switch (gMapHeader.mapType)
    {
    case MAP_TYPE_TOWN:
    case MAP_TYPE_CITY:
    case MAP_TYPE_ROUTE:
        break;
    case MAP_TYPE_UNDERGROUND:
        if (MetatileBehavior_IsIndoorEncounter(tileBehavior))
            return BATTLE_TERRAIN_BUILDING;
        if (MetatileBehavior_IsSurfable(tileBehavior))
            return BATTLE_TERRAIN_POND;
        return BATTLE_TERRAIN_CAVE;
    case MAP_TYPE_INDOOR:
    case MAP_TYPE_SECRET_BASE:
        return BATTLE_TERRAIN_BUILDING;
    case MAP_TYPE_UNDERWATER:
        return BATTLE_TERRAIN_UNDERWATER;
    case MAP_TYPE_OCEAN_ROUTE:
        if (MetatileBehavior_IsSurfable(tileBehavior))
            return BATTLE_TERRAIN_WATER;
        return BATTLE_TERRAIN_PLAIN;
    }
    if (MetatileBehavior_IsDeepWaterTerrain(tileBehavior))
        return BATTLE_TERRAIN_WATER;
    if (MetatileBehavior_IsSurfable(tileBehavior))
        return BATTLE_TERRAIN_POND;
    if (MetatileBehavior_IsMountain(tileBehavior))
        return BATTLE_TERRAIN_MOUNTAIN;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
    {
        if (MetatileBehavior_GetBridgeType(tileBehavior))
            return BATTLE_TERRAIN_POND;
        if (MetatileBehavior_IsBridge(tileBehavior) == TRUE)
            return BATTLE_TERRAIN_WATER;
    }
    return BATTLE_TERRAIN_PLAIN;
}

static u8 GetBattleTransitionTypeByMap(void)
{
    u16 behavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);

    if (Overworld_GetFlashLevel())
        return TRANSITION_TYPE_FLASH;

    if (MetatileBehavior_IsSurfable(behavior))
        return TRANSITION_TYPE_WATER;

    switch (gMapHeader.mapType)
    {
    case MAP_TYPE_UNDERGROUND:
        return TRANSITION_TYPE_CAVE;
    case MAP_TYPE_UNDERWATER:
        return TRANSITION_TYPE_WATER;
    default:
        return TRANSITION_TYPE_NORMAL;
    }
}

static u16 GetSumOfPlayerPartyLevel(u8 numMons)
{
    u8 sum = 0;
    s32 i;

    for (i = 0; i < PARTY_SIZE; ++i)
    {
        u32 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG);

        if (species != SPECIES_EGG && species != SPECIES_NONE && GetMonData(&gPlayerParty[i], MON_DATA_HP) != 0)
        {
            sum += GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
            if (--numMons == 0)
                break;
        }
    }
    return sum;
}

static u8 GetSumOfEnemyPartyLevel(u16 opponentId, u8 numMons)
{
    u8 i;
    u8 sum;
    u32 count = numMons;
    const struct TrainerMon *party;

    if (GetTrainerPartySizeFromId(opponentId) < count)
        count = GetTrainerPartySizeFromId(opponentId);

    sum = 0;

    party = GetTrainerPartyFromId(opponentId);
    for (i = 0; i < count && party != NULL; i++)
        sum += party[i].lvl;

    return sum;
}

u8 GetWildBattleTransition(void)
{
    u8 transitionType = GetBattleTransitionTypeByMap();
    u8 enemyLevel = GetMonData(&gEnemyParty[0], MON_DATA_LEVEL);
    u8 playerLevel = GetSumOfPlayerPartyLevel(1);

    if (enemyLevel < playerLevel)
        return sBattleTransitionTable_Wild[transitionType][0];
    else
        return sBattleTransitionTable_Wild[transitionType][1];
}

u8 GetTrainerBattleTransition(void)
{
    u8 minPartyCount;
    u8 transitionType;
    u8 enemyLevel;
    u8 playerLevel;
    u32 trainerId = SanitizeTrainerId(gTrainerBattleOpponent_A);

    if (DoesTrainerHaveMugshot(trainerId))
        return B_TRANSITION_MUGSHOT;

    if (IsTrainerDoubleBattle(trainerId))
        minPartyCount = 2; // double battles always at least have 2 pokemon.
    else
        minPartyCount = 1;
    transitionType = GetBattleTransitionTypeByMap();
    enemyLevel = GetSumOfEnemyPartyLevel(trainerId, minPartyCount);
    playerLevel = GetSumOfPlayerPartyLevel(minPartyCount);
    if (enemyLevel < playerLevel)
        return sBattleTransitionTable_Trainer[transitionType][0];
    else
        return sBattleTransitionTable_Trainer[transitionType][1];
}

u8 BattleSetup_GetBattleTowerBattleTransition(void)
{
    u8 enemyLevel = GetMonData(&gEnemyParty[0], MON_DATA_LEVEL);
    u8 playerLevel = GetSumOfPlayerPartyLevel(1);

    if (enemyLevel < playerLevel)
        return B_TRANSITION_POKEBALLS_TRAIL;
    else
        return B_TRANSITION_BIG_POKEBALL;
}

static u32 TrainerBattleLoadArg32(const u8 *ptr)
{
    return T1_READ_32(ptr);
}

static u16 TrainerBattleLoadArg16(const u8 *ptr)
{
    return T1_READ_16(ptr);
}

static u8 TrainerBattleLoadArg8(const u8 *ptr)
{
    return T1_READ_8(ptr);
}

static u16 GetTrainerAFlag(void)
{
    return TRAINER_FLAGS_START + gTrainerBattleOpponent_A;
}

static u16 GetTrainerBFlag(void)
{
    return TRAINER_FLAGS_START + gTrainerBattleOpponent_B;
}

static bool32 IsPlayerDefeated(u32 battleOutcome)
{
    switch (battleOutcome)
    {
    case B_OUTCOME_LOST:
    case B_OUTCOME_DREW:
        return TRUE;
    case B_OUTCOME_WON:
    case B_OUTCOME_RAN:
    case B_OUTCOME_PLAYER_TELEPORTED:
    case B_OUTCOME_MON_FLED:
    case B_OUTCOME_CAUGHT:
        return FALSE;
    default:
        return FALSE;
    }
}

void ResetTrainerOpponentIds(void)
{
    gTrainerBattleOpponent_A = 0;
    gTrainerBattleOpponent_B = 0;
}

static void InitTrainerBattleVariables(void)
{
    sTrainerBattleMode = 0;

    if (gApproachingTrainerId == 0)
    {
        sTrainerAIntroSpeech = NULL;
        sTrainerADefeatSpeech = NULL;
        sTrainerABattleScriptRetAddr = NULL;
    }
    else
    {
        sTrainerBIntroSpeech = NULL;
        sTrainerBDefeatSpeech = NULL;
        sTrainerBBattleScriptRetAddr = NULL;
    }

    sTrainerObjectEventLocalId = 0;
    sTrainerVictorySpeech = NULL;
    sTrainerCannotBattleSpeech = NULL;
    sTrainerBattleEndScript = NULL;
    sRivalBattleFlags = 0;
}

static inline void SetU8(void *ptr, u8 value)
{
    *(u8 *)(ptr) = value;
}

static inline void SetU16(void *ptr, u16 value)
{
    *(u16 *)(ptr) = value;
}

static inline void SetU32(void *ptr, u32 value)
{
    *(u32 *)(ptr) = value;
}

static inline void SetPtr(const void *ptr, const void *value)
{
    *(const void **)(ptr) = value;
}

static void TrainerBattleLoadArgs(const struct TrainerBattleParameter *specs, const u8 *data)
{
    while (1)
    {
        switch (specs->ptrType)
        {
        case TRAINER_PARAM_LOAD_VAL_8BIT:
            SetU8(specs->varPtr, TrainerBattleLoadArg8(data));
            data += 1;
            break;
        case TRAINER_PARAM_LOAD_VAL_16BIT:
            SetU16(specs->varPtr, TrainerBattleLoadArg16(data));
            data += 2;
            break;
        case TRAINER_PARAM_LOAD_VAL_32BIT:
            SetU32(specs->varPtr, TrainerBattleLoadArg32(data));
            data += 4;
            break;
        case TRAINER_PARAM_CLEAR_VAL_8BIT:
            SetU8(specs->varPtr, 0);
            break;
        case TRAINER_PARAM_CLEAR_VAL_16BIT:
            SetU16(specs->varPtr, 0);
            break;
        case TRAINER_PARAM_CLEAR_VAL_32BIT:
            SetU32(specs->varPtr, 0);
            break;
        case TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR:
            SetPtr(specs->varPtr, data);
            return;
        }
        ++specs;
    }
}

static void SetMapVarsToTrainer(void)
{
    if (sTrainerObjectEventLocalId != 0)
    {
        gSpecialVar_LastTalked = sTrainerObjectEventLocalId;
        gSelectedObjectEvent = GetObjectEventIdByLocalIdAndMap(sTrainerObjectEventLocalId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    }
}

const u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data)
{
    if (TrainerBattleLoadArg8(data) != TRAINER_BATTLE_SET_TRAINER_B)
        InitTrainerBattleVariables();
    sTrainerBattleMode = TrainerBattleLoadArg8(data);
    switch (sTrainerBattleMode)
    {
    case TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT:
        TrainerBattleLoadArgs(sOrdinaryNoIntroBattleParams, data);
        return EventScript_DoNoIntroTrainerBattle;
    case TRAINER_BATTLE_DOUBLE:
        TrainerBattleLoadArgs(sDoubleBattleParams, data);
        SetMapVarsToTrainer();
        return EventScript_TryDoDoubleTrainerBattle;
    case TRAINER_BATTLE_CONTINUE_SCRIPT:
    case TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC:
        TrainerBattleLoadArgs(sContinueScriptBattleParams, data);
        SetMapVarsToTrainer();
        return EventScript_TryDoNormalTrainerBattle;
    case TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE:
    case TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC:
        TrainerBattleLoadArgs(sContinueScriptDoubleBattleParams, data);
        SetMapVarsToTrainer();
        return EventScript_TryDoDoubleTrainerBattle;
    case TRAINER_BATTLE_REMATCH_DOUBLE:
        QL_FinishRecordingScene();
        TrainerBattleLoadArgs(sDoubleBattleParams, data);
        SetMapVarsToTrainer();
        gTrainerBattleOpponent_A = GetRematchTrainerId(gTrainerBattleOpponent_A);
        return EventScript_TryDoDoubleRematchBattle;
    case TRAINER_BATTLE_REMATCH:
        QL_FinishRecordingScene();
        TrainerBattleLoadArgs(sOrdinaryBattleParams, data);
        SetMapVarsToTrainer();
        gTrainerBattleOpponent_A = GetRematchTrainerId(gTrainerBattleOpponent_A);
        return EventScript_TryDoRematchBattle;
    case TRAINER_BATTLE_EARLY_RIVAL:
        TrainerBattleLoadArgs(sEarlyRivalBattleParams, data);
        return EventScript_DoNoIntroTrainerBattle;
    case TRAINER_BATTLE_SET_TRAINER_A:
        TrainerBattleLoadArgs(sOrdinaryBattleParams, data);
        return sTrainerBattleEndScript;
    case TRAINER_BATTLE_SET_TRAINER_B:
        TrainerBattleLoadArgs(sTrainerBOrdinaryBattleParams, data);
        return sTrainerBattleEndScript;
    default:
        if (gApproachingTrainerId == 0)
        {
            TrainerBattleLoadArgs(sOrdinaryBattleParams, data);
            SetMapVarsToTrainer();
        }
        else
        {
            TrainerBattleLoadArgs(sTrainerBOrdinaryBattleParams, data);
        }
        return EventScript_TryDoNormalTrainerBattle;
    }
}

void ConfigureAndSetUpOneTrainerBattle(u8 trainerEventObjId, const u8 *trainerScript)
{
    gSelectedObjectEvent = trainerEventObjId;
    gSpecialVar_LastTalked = gObjectEvents[trainerEventObjId].localId;
    BattleSetup_ConfigureTrainerBattle(trainerScript + 1);
    ScriptContext_SetupScript(EventScript_DoTrainerBattleFromApproach);
    LockPlayerFieldControls();
}

void ConfigureTwoTrainersBattle(u8 trainerObjEventId, const u8 *trainerScript)
{
    gSelectedObjectEvent = trainerObjEventId;
    gSpecialVar_LastTalked = gObjectEvents[trainerObjEventId].localId;
    BattleSetup_ConfigureTrainerBattle(trainerScript + 1);
}

void SetUpTwoTrainersBattle(void)
{
    ScriptContext_SetupScript(EventScript_DoTrainerBattleFromApproach);
    LockPlayerFieldControls();
}

bool32 GetTrainerFlagFromScriptPointer(const u8 *data)
{
    u32 flag = TrainerBattleLoadArg16(data + 2);

    return FlagGet(TRAINER_FLAGS_START + flag);
}

void SetUpTrainerMovement(void)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[gSelectedObjectEvent];

    SetTrainerMovementType(objectEvent, GetTrainerFacingDirectionMovementType(objectEvent->facingDirection));
}

u8 GetTrainerBattleMode(void)
{
    return sTrainerBattleMode;
}

u16 GetRivalBattleFlags(void)
{
    return sRivalBattleFlags;
}

u16 Script_HasTrainerBeenFought(void)
{
    return FlagGet(GetTrainerAFlag());
}

void SetBattledTrainerFlag(void)
{
    if (gTrainerBattleOpponent_B != 0)
        FlagSet(GetTrainerBFlag());
    FlagSet(GetTrainerAFlag());
}

bool8 HasTrainerBeenFought(u16 trainerId)
{
    return FlagGet(TRAINER_FLAGS_START + trainerId);
}

void SetTrainerFlag(u16 trainerId)
{
    FlagSet(TRAINER_FLAGS_START + trainerId);
}

void ClearTrainerFlag(u16 trainerId)
{
    FlagClear(TRAINER_FLAGS_START + trainerId);
}

void BattleSetup_StartTrainerBattle(void)
{
    if (gNoOfApproachingTrainers == 2)
        gBattleTypeFlags = (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_TWO_OPPONENTS | BATTLE_TYPE_TRAINER);
    else
        gBattleTypeFlags = (BATTLE_TYPE_TRAINER);
        
    if (GetTrainerBattleMode() == TRAINER_BATTLE_EARLY_RIVAL && GetRivalBattleFlags() & RIVAL_BATTLE_TUTORIAL)
        gBattleTypeFlags |= BATTLE_TYPE_FIRST_BATTLE;

    sNoOfPossibleTrainerRetScripts = gNoOfApproachingTrainers;
    gNoOfApproachingTrainers = 0;
    sShouldCheckTrainerBScript = FALSE;
    gWhichTrainerToFaceAfterBattle = 0;
    gMain.savedCallback = CB2_EndTrainerBattle;

    DoTrainerBattle();

    ScriptContext_Stop();
}

void BattleSetup_StartTrainerBattle_Debug(void)
{
    sNoOfPossibleTrainerRetScripts = gNoOfApproachingTrainers;
    gNoOfApproachingTrainers = 0;
    sShouldCheckTrainerBScript = FALSE;
    gWhichTrainerToFaceAfterBattle = 0;
    gMain.savedCallback = CB2_EndTrainerBattle;

    CreateBattleStartTask_Debug(GetWildBattleTransition(), 0);

    ScriptContext_Stop();
}

static void SaveChangesToPlayerParty(void)
{
    u8 i = 0, j = 0;
    u8 participatedPokemon = VarGet(B_VAR_SKY_BATTLE);
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if ((participatedPokemon >> i & 1) == 1)
        {
            gSaveBlock1Ptr->playerParty[i] = gPlayerParty[j];
            j++;
        }
    }
}

static void HandleBattleVariantEndParty(void)
{
    if (B_FLAG_SKY_BATTLE == 0 || !FlagGet(B_FLAG_SKY_BATTLE))
        return;
    SaveChangesToPlayerParty();
    LoadPlayerParty();
    FlagClear(B_FLAG_SKY_BATTLE);
}

static void CB2_EndTrainerBattle(void)
{
    HandleBattleVariantEndParty();

    if (sTrainerBattleMode == TRAINER_BATTLE_EARLY_RIVAL)
    {
        if (IsPlayerDefeated(gBattleOutcome) == TRUE)
        {
            gSpecialVar_Result = TRUE;
            if (sRivalBattleFlags & RIVAL_BATTLE_HEAL_AFTER)
            {
                HealPlayerParty();
            }
            else
            {
                SetMainCallback2(CB2_WhiteOut);
                return;
            }
            SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
            SetBattledTrainerFlag();
            QuestLogEvents_HandleEndTrainerBattle();
        }
        else
        {
            gSpecialVar_Result = FALSE;
            DowngradeBadPoison();
            SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
            SetBattledTrainerFlag();
            QuestLogEvents_HandleEndTrainerBattle();
        }

    }
    else
    {
        if (gTrainerBattleOpponent_A == TRAINER_SECRET_BASE)
        {
            DowngradeBadPoison();
            SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
        }
        else if (IsPlayerDefeated(gBattleOutcome) == TRUE)
        {
            SetMainCallback2(CB2_WhiteOut);
        }
        else
        {
            SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
            DowngradeBadPoison();
            SetBattledTrainerFlag();
            QuestLogEvents_HandleEndTrainerBattle();
        }
    }
}

static void CB2_EndRematchBattle(void)
{
    if (gTrainerBattleOpponent_A == TRAINER_SECRET_BASE)
    {
        DowngradeBadPoison();
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
    }
    else if (IsPlayerDefeated(gBattleOutcome) == TRUE)
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
        SetBattledTrainerFlag();
        ClearRematchStateOfLastTalked();
        ResetDeferredLinkEvent();
        DowngradeBadPoison();
    }
}

void StartRematchBattle(void)
{
    gBattleTypeFlags = BATTLE_TYPE_TRAINER;
    gMain.savedCallback = CB2_EndRematchBattle;
    DoTrainerBattle();
    ScriptContext_Stop();
}

void ShowTrainerIntroSpeech(void)
{
    ShowFieldMessage(GetIntroSpeechOfApproachingTrainer());
}

const u8 *BattleSetup_GetScriptAddrAfterBattle(void)
{
    if (sTrainerBattleEndScript != NULL)
        return sTrainerBattleEndScript;
    else
        return EventScript_TestSignpostMsg;
}

const u8 *BattleSetup_GetTrainerPostBattleScript(void)
{
    if (sTrainerABattleScriptRetAddr != NULL)
        return sTrainerABattleScriptRetAddr;
    else
        return EventScript_TestSignpostMsg;
}

void ShowTrainerCantBattleSpeech(void)
{
    ShowFieldMessage(GetTrainerCantBattleSpeech());
}

void PlayTrainerEncounterMusic(void)
{
    u16 trainerId;
    u16 music;

    if (gApproachingTrainerId == 0)
        trainerId = gTrainerBattleOpponent_A;
    else
        trainerId = gTrainerBattleOpponent_B;

    if (!QL_IS_PLAYBACK_STATE
     && sTrainerBattleMode != TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC
     && sTrainerBattleMode != TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC)
    {
        switch (GetTrainerEncounterMusicId(trainerId))
        {
        case TRAINER_ENCOUNTER_MUSIC_FEMALE:
        case TRAINER_ENCOUNTER_MUSIC_GIRL:
        case TRAINER_ENCOUNTER_MUSIC_TWINS:
            music = MUS_ENCOUNTER_GIRL;
            break;
        case TRAINER_ENCOUNTER_MUSIC_MALE:
        case TRAINER_ENCOUNTER_MUSIC_INTENSE:
        case TRAINER_ENCOUNTER_MUSIC_COOL:
        case TRAINER_ENCOUNTER_MUSIC_SWIMMER:
        case TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR:
        case TRAINER_ENCOUNTER_MUSIC_HIKER:
        case TRAINER_ENCOUNTER_MUSIC_INTERVIEWER:
        case TRAINER_ENCOUNTER_MUSIC_RICH:
            music = MUS_ENCOUNTER_BOY;
            break;
        default:
            music = MUS_ENCOUNTER_ROCKET;
            break;
        }
        PlayNewMapMusic(music);
    }
}

static const u8 *ReturnEmptyStringIfNull(const u8 *string)
{
    if (string == NULL)
        return gString_Dummy;
    else
        return string;
}

static const u8 *GetIntroSpeechOfApproachingTrainer(void)
{
    if (gApproachingTrainerId == 0)
        return ReturnEmptyStringIfNull(sTrainerAIntroSpeech);
    else
        return ReturnEmptyStringIfNull(sTrainerBIntroSpeech);
}

const u8 *GetTrainerALoseText(void)
{
    const u8 *string = sTrainerADefeatSpeech;

    StringExpandPlaceholders(gStringVar4, ReturnEmptyStringIfNull(string));
    return gStringVar4;
}

const u8 *GetTrainerBLoseText(void)
{
    StringExpandPlaceholders(gStringVar4, ReturnEmptyStringIfNull(sTrainerBDefeatSpeech));
    return gStringVar4;
}

const u8 *GetTrainerWonSpeech(void)
{
    StringExpandPlaceholders(gStringVar4, ReturnEmptyStringIfNull(sTrainerVictorySpeech));
    return gStringVar4;
}

static const u8 *GetTrainerCantBattleSpeech(void)
{
    return ReturnEmptyStringIfNull(sTrainerCannotBattleSpeech);
}
