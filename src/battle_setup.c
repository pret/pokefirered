#include "global.h"
#include "battle.h"
#include "load_save.h"
#include "battle_setup.h"
#include "battle_tower.h"
#include "battle_transition.h"
#include "main.h"
#include "task.h"
#include "safari_zone.h"
#include "script.h"
#include "event_data.h"
#include "metatile_behavior.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "follower_npc.h"
#include "random.h"
// #include "starter_choose.h"
#include "script_pokemon_util.h"
#include "palette.h"
#include "window.h"
#include "event_object_movement.h"
#include "event_scripts.h"
// #include "tv.h"
#include "trainer_see.h"
#include "field_message_box.h"
#include "sound.h"
#include "strings.h"
// #include "trainer_hill.h"
// #include "secret_base.h"
#include "string_util.h"
#include "overworld.h"
#include "field_weather.h"
#include "battle_tower.h"
// #include "gym_leader_rematch.h"
#include "battle_frontier.h"
#include "battle_pike.h"
#include "battle_pyramid.h"
#include "fldeff.h"
// #include "fldeff_misc.h"
#include "field_control_avatar.h"
// #include "mirage_tower.h"
#include "field_screen_effect.h"
#include "data.h"
#include "vs_seeker.h"
#include "item.h"
#include "script.h"
// #include "field_name_box.h"
#include "constants/battle_frontier.h"
#include "constants/battle_setup.h"
#include "constants/event_objects.h"
#include "constants/game_stat.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "constants/map_types.h"
#include "constants/trainers.h"
// #include "constants/trainer_hill.h"
#include "constants/weather.h"
#include "fishing.h"
#include "wild_encounter.h"
#include "help_system.h"
#include "quest_log.h"

enum TransitionType
{
    TRANSITION_TYPE_NORMAL,
    TRANSITION_TYPE_CAVE,
    TRANSITION_TYPE_FLASH,
    TRANSITION_TYPE_WATER,
};

// this file's functions
static void DoBattlePikeWildBattle(void);
static void DoSafariBattle(void);
static void DoGhostBattle(void);
static void DoStandardWildBattle(bool32 isDouble);
static void CB2_EndWildBattle(void);
static void CB2_EndScriptedWildBattle(void);
static void CB2_EndMarowakBattle(void);
// static void TryUpdateGymLeaderRematchFromWild(void);
// static void TryUpdateGymLeaderRematchFromTrainer(void);
// static void CB2_GiveStarter(void);
// static void CB2_StartFirstBattle(void);
// static void CB2_EndFirstBattle(void);
// static void SaveChangesToPlayerParty(void);
// static void HandleBattleVariantEndParty(void);
static void CB2_EndTrainerBattle(void);
static bool32 IsPlayerDefeated(u32 battleOutcome);
// #if FREE_MATCH_CALL == FALSE
// static u16 GetRematchTrainerId(u16 trainerId);
// #endif //FREE_MATCH_CALL
// static void RegisterTrainerInMatchCall(void);
// static void HandleRematchVarsOnBattleEnd(void);
static const u8 *GetIntroSpeechOfApproachingTrainer(void);
static const u8 *GetTrainerCantBattleSpeech(void);

EWRAM_DATA TrainerBattleParameter gTrainerBattleParameter = {0};
EWRAM_DATA u16 gPartnerTrainerId = 0;
EWRAM_DATA static u8 *sTrainerBattleEndScript = NULL;
EWRAM_DATA static bool8 sShouldCheckTrainerBScript = FALSE;
EWRAM_DATA static u8 sNoOfPossibleTrainerRetScripts = 0;

// The first transition is used if the enemy Pokémon are lower level than our Pokémon.
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

// Battle Frontier (excluding Pyramid and Dome, which have their own tables below)
static const u8 sBattleTransitionTable_BattleFrontier[] =
{
    B_TRANSITION_FRONTIER_LOGO_WIGGLE,
    B_TRANSITION_FRONTIER_LOGO_WAVE,
    B_TRANSITION_FRONTIER_SQUARES,
    B_TRANSITION_FRONTIER_SQUARES_SCROLL,
    B_TRANSITION_FRONTIER_CIRCLES_MEET,
    B_TRANSITION_FRONTIER_CIRCLES_CROSS,
    B_TRANSITION_FRONTIER_CIRCLES_ASYMMETRIC_SPIRAL,
    B_TRANSITION_FRONTIER_CIRCLES_SYMMETRIC_SPIRAL,
    B_TRANSITION_FRONTIER_CIRCLES_MEET_IN_SEQ,
    B_TRANSITION_FRONTIER_CIRCLES_CROSS_IN_SEQ,
    B_TRANSITION_FRONTIER_CIRCLES_ASYMMETRIC_SPIRAL_IN_SEQ,
    B_TRANSITION_FRONTIER_CIRCLES_SYMMETRIC_SPIRAL_IN_SEQ
};

static const u8 sBattleTransitionTable_BattlePyramid[] =
{
    B_TRANSITION_FRONTIER_SQUARES,
    B_TRANSITION_FRONTIER_SQUARES_SCROLL,
    B_TRANSITION_FRONTIER_SQUARES_SPIRAL
};

static const u8 sBattleTransitionTable_BattleDome[] =
{
    B_TRANSITION_FRONTIER_LOGO_WIGGLE,
    B_TRANSITION_FRONTIER_SQUARES,
    B_TRANSITION_FRONTIER_SQUARES_SCROLL,
    B_TRANSITION_FRONTIER_SQUARES_SPIRAL
};

#define tState data[0]
#define tTransition data[1]

static void Task_BattleStart(u8 taskId)
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
            PrepareForFollowerNPCBattle();
            CleanupOverworldWindowsAndTilemaps();
            SetMainCallback2(CB2_InitBattle);
            RestartWildEncounterImmunitySteps();
            ClearPoisonStepCounter();
            DestroyTask(taskId);
        }
        break;
    }
}

static void CreateBattleStartTask(enum BattleTransition transition, u16 song)
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
    if (mapGroup == MAP_GROUP(MAP_POKEMON_TOWER_1F)
     && (mapNum == MAP_NUM(MAP_POKEMON_TOWER_1F)
      || mapNum == MAP_NUM(MAP_POKEMON_TOWER_2F)
      || mapNum == MAP_NUM(MAP_POKEMON_TOWER_3F)
      || mapNum == MAP_NUM(MAP_POKEMON_TOWER_4F)
      || mapNum == MAP_NUM(MAP_POKEMON_TOWER_5F)
      || mapNum == MAP_NUM(MAP_POKEMON_TOWER_6F)
      || mapNum == MAP_NUM(MAP_POKEMON_TOWER_7F))
     && !(CheckBagHasItem(ITEM_SILPH_SCOPE, 1)))
        return TRUE;
    else
        return FALSE;
}

void BattleSetup_StartWildBattle(void)
{
    if (GetSafariZoneFlag())
        DoSafariBattle();
    else if (CheckSilphScopeInPokemonTower(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum))
        DoGhostBattle();
    else
        DoStandardWildBattle(FALSE);
}

void BattleSetup_StartDoubleWildBattle(void)
{
    DoStandardWildBattle(TRUE);
}

void BattleSetup_StartBattlePikeWildBattle(void)
{
    DoBattlePikeWildBattle();
}

static void DoStandardWildBattle(bool32 isDouble)
{
    LockPlayerFieldControls();
    FreezeObjectEvents();
    StopPlayerAvatar();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = 0;
    if (IsNPCFollowerWildBattle())
    {
        gBattleTypeFlags |= BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER | BATTLE_TYPE_DOUBLE;
    }
    else if (isDouble)
        gBattleTypeFlags |= BATTLE_TYPE_DOUBLE;
    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
    {
        VarSet(VAR_TEMP_E, 0);
        gBattleTypeFlags |= BATTLE_TYPE_PYRAMID;
    }
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
    // IncrementDailyWildBattles();
    // TryUpdateGymLeaderRematchFromWild();
}

void DoStandardWildBattle_Debug(void)
{
    LockPlayerFieldControls();
    FreezeObjectEvents();
    StopPlayerAvatar();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = 0;
    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
    {
        VarSet(VAR_TEMP_PLAYING_PYRAMID_MUSIC, 0);
        gBattleTypeFlags |= BATTLE_TYPE_PYRAMID;
    }
    CreateBattleStartTask_Debug(GetWildBattleTransition(), 0);
    //IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    //IncrementGameStat(GAME_STAT_WILD_BATTLES);
    //IncrementDailyWildBattles();
    //TryUpdateGymLeaderRematchFromWild();
}

void BattleSetup_StartRoamerBattle(void)
{
    LockPlayerFieldControls();
    FreezeObjectEvents();
    StopPlayerAvatar();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_ROAMER;
    CreateBattleStartTask(GetWildBattleTransition(), MUS_VS_LEGEND);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
    // IncrementDailyWildBattles();
    // TryUpdateGymLeaderRematchFromWild();
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

static void DoBattlePikeWildBattle(void)
{
    LockPlayerFieldControls();
    FreezeObjectEvents();
    StopPlayerAvatar();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_PIKE;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
    // IncrementDailyWildBattles();
    // TryUpdateGymLeaderRematchFromWild();
}

static void DoTrainerBattle(void)
{
    CreateBattleStartTask(GetTrainerBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_TRAINER_BATTLES);
    // TryUpdateGymLeaderRematchFromTrainer();
}

static void DoBattlePyramidTrainerHillBattle(void)
{
    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
        CreateBattleStartTask(GetSpecialBattleTransition(B_TRANSITION_GROUP_B_PYRAMID), 0);
    else
        CreateBattleStartTask(GetSpecialBattleTransition(B_TRANSITION_GROUP_TRAINER_TOWER), 0);

    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_TRAINER_BATTLES);
    // TryUpdateGymLeaderRematchFromTrainer();
}

// Initiates battle where Wally catches Ralts
// void StartWallyTutorialBattle(void)
// {
//     CreateMaleMon(&gEnemyParty[0], SPECIES_RALTS, 5);
//     LockPlayerFieldControls();
//     gMain.savedCallback = CB2_ReturnToFieldContinueScriptPlayMapMusic;
//     gBattleTypeFlags = BATTLE_TYPE_CATCH_TUTORIAL;
//     CreateBattleStartTask(B_TRANSITION_SLICE, 0);
// }

void StartOldManTutorialBattle(void)
{
    CreateMaleMon(&gEnemyParty[0], SPECIES_WEEDLE, 5);
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_ReturnToFieldContinueScriptPlayMapMusic;
    gBattleTypeFlags = BATTLE_TYPE_CATCH_TUTORIAL;
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
    // IncrementDailyWildBattles();
    // TryUpdateGymLeaderRematchFromWild();
}

void BattleSetup_StartScriptedDoubleWildBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_DOUBLE;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
    // IncrementDailyWildBattles();
    // TryUpdateGymLeaderRematchFromWild();
}

void StartMarowakBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndMarowakBattle;
    gBattleTypeFlags = BATTLE_TYPE_GHOST;

    if (CheckBagHasItem(ITEM_SILPH_SCOPE, 1))
    {
        u32 personality = GetMonPersonality(SPECIES_MAROWAK, MON_FEMALE, NATURE_SERIOUS, RANDOM_UNOWN_LETTER);

        CreateMonWithIVsPersonality(&gEnemyParty[0], SPECIES_MAROWAK, 30, 31, personality);
    }

    CreateBattleStartTask(GetWildBattleTransition(), 0);
    SetMonData(&gEnemyParty[0], MON_DATA_NICKNAME, gText_Ghost);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void BattleSetup_StartLatiBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
    // IncrementDailyWildBattles();
    // TryUpdateGymLeaderRematchFromWild();
}

void BattleSetup_StartLegendaryBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;

    switch (GetMonData(&gEnemyParty[0], MON_DATA_SPECIES))
    {
    case SPECIES_GROUDON:
    case SPECIES_GROUDON_PRIMAL:
        CreateBattleStartTask(B_TRANSITION_GROUDON, MUS_VS_KYOGRE_GROUDON);
        break;
    case SPECIES_KYOGRE:
    case SPECIES_KYOGRE_PRIMAL:
        CreateBattleStartTask(B_TRANSITION_KYOGRE, MUS_VS_KYOGRE_GROUDON);
        break;
    case SPECIES_RAYQUAZA:
    case SPECIES_RAYQUAZA_MEGA:
        CreateBattleStartTask(B_TRANSITION_RAYQUAZA, MUS_VS_RAYQUAZA);
        break;
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
    case SPECIES_LUGIA:
    case SPECIES_HO_OH:
    default:
        CreateBattleStartTask(B_TRANSITION_BLUR, MUS_VS_LEGEND);
        break;
    case SPECIES_MEW:
        CreateBattleStartTask(B_TRANSITION_GRID_SQUARES, MUS_VS_MEW);
        break;
    }

    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
    // IncrementDailyWildBattles();
    // TryUpdateGymLeaderRematchFromWild();
}

void StartGroudonKyogreBattle(void)
{
    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;

    if (gGameVersion == VERSION_RUBY)
        CreateBattleStartTask(B_TRANSITION_ANGLED_WIPES, MUS_VS_KYOGRE_GROUDON); // GROUDON
    else
        CreateBattleStartTask(B_TRANSITION_RIPPLE, MUS_VS_KYOGRE_GROUDON); // KYOGRE

    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
    // IncrementDailyWildBattles();
    // TryUpdateGymLeaderRematchFromWild();
}

void StartRegiBattle(void)
{
    enum BattleTransition transitionId;
    u16 species;

    LockPlayerFieldControls();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;

    species = GetMonData(&gEnemyParty[0], MON_DATA_SPECIES);
    switch (species)
    {
    case SPECIES_REGIROCK:
        transitionId = B_TRANSITION_REGIROCK;
        break;
    case SPECIES_REGICE:
        transitionId = B_TRANSITION_REGICE;
        break;
    case SPECIES_REGISTEEL:
        transitionId = B_TRANSITION_REGISTEEL;
        break;
    default:
        transitionId = B_TRANSITION_GRID_SQUARES;
        break;
    }
    CreateBattleStartTask(transitionId, MUS_VS_REGI);

    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
    // IncrementDailyWildBattles();
    // TryUpdateGymLeaderRematchFromWild();
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
    CpuFill16(0, (void *)(BG_PLTT), BG_PLTT_SIZE);
    ResetOamRange(0, 128);

    if (IsNPCFollowerWildBattle())
    {
        RestorePartyAfterFollowerNPCBattle();
        if (FNPC_FLAG_HEAL_AFTER_FOLLOWER_BATTLE != 0
         && (FNPC_FLAG_HEAL_AFTER_FOLLOWER_BATTLE == FNPC_ALWAYS
         || FlagGet(FNPC_FLAG_HEAL_AFTER_FOLLOWER_BATTLE)))
            HealPlayerParty();
    }

    if (IsPlayerDefeated(gBattleOutcome) == TRUE && CurrentBattlePyramidLocation() == PYRAMID_LOCATION_NONE && !InBattlePike())
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
    CpuFill16(0, (void *)(BG_PLTT), BG_PLTT_SIZE);
    ResetOamRange(0, 128);

    if (IsPlayerDefeated(gBattleOutcome) == TRUE)
    {
        if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
            SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
        else
            SetMainCallback2(CB2_WhiteOut);
    }
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

enum BattleEnvironments BattleSetup_GetEnvironmentId(void)
{
    u16 tileBehavior;
    s16 x, y;

    if (ShouldUseFishingEnvironmentInBattle())
        GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    else
        PlayerGetDestCoords(&x, &y);

    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    if (MetatileBehavior_IsTallGrass(tileBehavior))
        return BATTLE_ENVIRONMENT_GRASS;
    if (MetatileBehavior_IsLongGrass(tileBehavior))
        return BATTLE_ENVIRONMENT_LONG_GRASS;
    if (MetatileBehavior_IsSandOrShallowFlowingWater(tileBehavior))
        return BATTLE_ENVIRONMENT_SAND;

    switch (gMapHeader.mapType)
    {
    case MAP_TYPE_TOWN:
    case MAP_TYPE_CITY:
    case MAP_TYPE_ROUTE:
        break;
    case MAP_TYPE_UNDERGROUND:
        if (MetatileBehavior_IsIndoorEncounter(tileBehavior))
            return BATTLE_ENVIRONMENT_BUILDING;
        if (MetatileBehavior_IsSurfable(tileBehavior))
            return BATTLE_ENVIRONMENT_POND;
        return BATTLE_ENVIRONMENT_CAVE;
    case MAP_TYPE_INDOOR:
    case MAP_TYPE_SECRET_BASE:
        return BATTLE_ENVIRONMENT_BUILDING;
    case MAP_TYPE_UNDERWATER:
        return BATTLE_ENVIRONMENT_UNDERWATER;
    case MAP_TYPE_OCEAN_ROUTE:
        if (MetatileBehavior_IsSurfable(tileBehavior))
            return BATTLE_ENVIRONMENT_WATER;
        return BATTLE_ENVIRONMENT_PLAIN;
    }
    if (MetatileBehavior_IsDeepWaterTerrain(tileBehavior))
        return BATTLE_ENVIRONMENT_WATER;
    if (MetatileBehavior_IsSurfable(tileBehavior))
        return BATTLE_ENVIRONMENT_POND;
    if (MetatileBehavior_IsMountain(tileBehavior))
        return BATTLE_ENVIRONMENT_MOUNTAIN;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
    {
        if (MetatileBehavior_GetBridgeType(tileBehavior))
            return BATTLE_ENVIRONMENT_POND;

        if (MetatileBehavior_IsBridge(tileBehavior) == TRUE)
            return BATTLE_ENVIRONMENT_WATER;
    }
    if (GetSavedWeather() == WEATHER_SANDSTORM)
        return BATTLE_ENVIRONMENT_SAND;

    return BATTLE_ENVIRONMENT_PLAIN;
}

static enum TransitionType GetBattleTransitionTypeByMap(void)
{
    u16 tileBehavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    if (GetFlashLevel())
        return TRANSITION_TYPE_FLASH;

    if (MetatileBehavior_IsSurfable(tileBehavior))
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
    int i;

    for (i = 0; i < PARTY_SIZE; i++)
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

enum BattleTransition GetWildBattleTransition(void)
{
    u8 transitionType = GetBattleTransitionTypeByMap();
    u8 enemyLevel = GetMonData(&gEnemyParty[0], MON_DATA_LEVEL);
    u8 playerLevel = GetSumOfPlayerPartyLevel(1);

    if (enemyLevel < playerLevel)
    {
        if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
            return B_TRANSITION_BLUR;
        else
            return sBattleTransitionTable_Wild[transitionType][0];
    }
    else
    {
        if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
            return B_TRANSITION_GRID_SQUARES;
        else
            return sBattleTransitionTable_Wild[transitionType][1];
    }
}

enum BattleTransition GetTrainerBattleTransition(void)
{
    u8 minPartyCount = 1;
    u8 transitionType;
    u8 enemyLevel;
    u8 playerLevel;
    u32 trainerId = SanitizeTrainerId(TRAINER_BATTLE_PARAM.opponentA);
    enum TrainerClassID trainerClass = GetTrainerClassFromId(TRAINER_BATTLE_PARAM.opponentA);

    if (DoesTrainerHaveMugshot(trainerId))
        return B_TRANSITION_MUGSHOT;

    if (trainerClass == TRAINER_CLASS_TEAM_MAGMA
        || trainerClass == TRAINER_CLASS_MAGMA_LEADER
        || trainerClass == TRAINER_CLASS_MAGMA_ADMIN)
        return B_TRANSITION_MAGMA;

    if (trainerClass == TRAINER_CLASS_TEAM_AQUA
        || trainerClass == TRAINER_CLASS_AQUA_LEADER
        || trainerClass == TRAINER_CLASS_AQUA_ADMIN)
        return B_TRANSITION_AQUA;

    switch (GetTrainerBattleType(trainerId))
    {
    case TRAINER_BATTLE_TYPE_SINGLES:
        minPartyCount = 1;
        break;
    case TRAINER_BATTLE_TYPE_DOUBLES:
        minPartyCount = 2; // double battles always at least have 2 Pokémon.
        break;
    }

    transitionType = GetBattleTransitionTypeByMap();
    enemyLevel = GetSumOfEnemyPartyLevel(trainerId, minPartyCount);
    playerLevel = GetSumOfPlayerPartyLevel(minPartyCount);

    if (enemyLevel < playerLevel)
        return sBattleTransitionTable_Trainer[transitionType][0];
    else
        return sBattleTransitionTable_Trainer[transitionType][1];
}

#define RANDOM_TRANSITION(table) (table[Random() % ARRAY_COUNT(table)])
enum BattleTransition GetSpecialBattleTransition(enum BattleTransitionGroup id)
{
    u16 var;
    u8 enemyLevel = GetMonData(&gEnemyParty[0], MON_DATA_LEVEL);
    u8 playerLevel = GetSumOfPlayerPartyLevel(1);

    if (enemyLevel < playerLevel)
    {
        switch (id)
        {
        case B_TRANSITION_GROUP_TRAINER_TOWER:
        case B_TRANSITION_GROUP_SECRET_BASE:
        case B_TRANSITION_GROUP_E_READER:
            return B_TRANSITION_POKEBALLS_TRAIL;
        case B_TRANSITION_GROUP_B_PYRAMID:
            return RANDOM_TRANSITION(sBattleTransitionTable_BattlePyramid);
        case B_TRANSITION_GROUP_B_DOME:
            return RANDOM_TRANSITION(sBattleTransitionTable_BattleDome);
        default:
            break;
        }

        if (VarGet(VAR_FRONTIER_BATTLE_MODE) != FRONTIER_MODE_LINK_MULTIS)
            return RANDOM_TRANSITION(sBattleTransitionTable_BattleFrontier);
    }
    else
    {
        switch (id)
        {
        case B_TRANSITION_GROUP_TRAINER_TOWER:
        case B_TRANSITION_GROUP_SECRET_BASE:
        case B_TRANSITION_GROUP_E_READER:
            return B_TRANSITION_BIG_POKEBALL;
        case B_TRANSITION_GROUP_B_PYRAMID:
            return RANDOM_TRANSITION(sBattleTransitionTable_BattlePyramid);
        case B_TRANSITION_GROUP_B_DOME:
            return RANDOM_TRANSITION(sBattleTransitionTable_BattleDome);
        default:
            break;
        }

        if (VarGet(VAR_FRONTIER_BATTLE_MODE) != FRONTIER_MODE_LINK_MULTIS)
            return RANDOM_TRANSITION(sBattleTransitionTable_BattleFrontier);
    }

    var = gSaveBlock2Ptr->frontier.trainerIds[gSaveBlock2Ptr->frontier.curChallengeBattleNum * 2 + 0]
        + gSaveBlock2Ptr->frontier.trainerIds[gSaveBlock2Ptr->frontier.curChallengeBattleNum * 2 + 1];

    return sBattleTransitionTable_BattleFrontier[var % ARRAY_COUNT(sBattleTransitionTable_BattleFrontier)];
}

static u16 GetTrainerAFlag(void)
{
    return TRAINER_FLAGS_START + TRAINER_BATTLE_PARAM.opponentA;
}

static u16 GetTrainerBFlag(void)
{
    return TRAINER_FLAGS_START + TRAINER_BATTLE_PARAM.opponentB;
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
    TRAINER_BATTLE_PARAM.opponentA = 0;
    TRAINER_BATTLE_PARAM.opponentB = 0;
}

void InitTrainerBattleParameter(void)
{
    memset(gTrainerBattleParameter.data, 0, sizeof(TrainerBattleParameter));
    sTrainerBattleEndScript = NULL;
}

void TrainerBattleLoadArgs(const u8 *data)
{
    InitTrainerBattleParameter();
    memcpy(gTrainerBattleParameter.data, data, sizeof(TrainerBattleParameter));
    sTrainerBattleEndScript = (u8*)data + sizeof(TrainerBattleParameter);
}

void TrainerBattleLoadArgsTrainerA(const u8 *data)
{
    TrainerBattleParameter *temp = (TrainerBattleParameter*)data;

    TRAINER_BATTLE_PARAM.playMusicA = temp->params.playMusicA;
    TRAINER_BATTLE_PARAM.objEventLocalIdA = temp->params.objEventLocalIdA;
    TRAINER_BATTLE_PARAM.opponentA = temp->params.opponentA;
    TRAINER_BATTLE_PARAM.introTextA = temp->params.introTextA;
    TRAINER_BATTLE_PARAM.defeatTextA = temp->params.defeatTextA;
    TRAINER_BATTLE_PARAM.battleScriptRetAddrA = temp->params.battleScriptRetAddrA;
}

void TrainerBattleLoadArgsTrainerB(const u8 *data)
{
    TrainerBattleParameter *temp = (TrainerBattleParameter*)data;

    TRAINER_BATTLE_PARAM.playMusicB = temp->params.playMusicB;
    TRAINER_BATTLE_PARAM.objEventLocalIdB = temp->params.objEventLocalIdB;
    TRAINER_BATTLE_PARAM.opponentB = temp->params.opponentB;
    TRAINER_BATTLE_PARAM.introTextB = temp->params.introTextB;
    TRAINER_BATTLE_PARAM.defeatTextB = temp->params.defeatTextB;
    TRAINER_BATTLE_PARAM.battleScriptRetAddrB = temp->params.battleScriptRetAddrB;
}

// loads trainer A parameter to trainer B. Used for second trainer in trainer_see.c
void TrainerBattleLoadArgsSecondTrainer(const u8 *data)
{
    TrainerBattleParameter *temp = (TrainerBattleParameter*)data;

    TRAINER_BATTLE_PARAM.playMusicB = temp->params.playMusicA;
    TRAINER_BATTLE_PARAM.objEventLocalIdB = temp->params.objEventLocalIdA;
    TRAINER_BATTLE_PARAM.opponentB = temp->params.opponentA;
    TRAINER_BATTLE_PARAM.introTextB = temp->params.introTextA;
    TRAINER_BATTLE_PARAM.defeatTextB = temp->params.defeatTextA;
    TRAINER_BATTLE_PARAM.battleScriptRetAddrB = temp->params.battleScriptRetAddrA;
}

void SetMapVarsToTrainerA(void)
{
    if (TRAINER_BATTLE_PARAM.objEventLocalIdA != LOCALID_NONE)
    {
        gSpecialVar_LastTalked = TRAINER_BATTLE_PARAM.objEventLocalIdA;
        gSelectedObjectEvent = GetObjectEventIdByLocalIdAndMap(TRAINER_BATTLE_PARAM.objEventLocalIdA, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    }
}

void SetMapVarsToTrainerB(void)
{
    if (TRAINER_BATTLE_PARAM.objEventLocalIdB != LOCALID_NONE)
    {
        gSpecialVar_LastTalked = TRAINER_BATTLE_PARAM.objEventLocalIdB;
        gSelectedObjectEvent = GetObjectEventIdByLocalIdAndMap(TRAINER_BATTLE_PARAM.objEventLocalIdB, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    }
}

// expects parameters have been loaded correctly with TrainerBattleLoadArgs
const u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data)
{
    switch (TRAINER_BATTLE_PARAM.mode)
    {
    case TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT:
        return EventScript_DoNoIntroTrainerBattle;
    case TRAINER_BATTLE_DOUBLE:
        SetMapVarsToTrainerA();
        return EventScript_TryDoDoubleTrainerBattle;
    case TRAINER_BATTLE_CONTINUE_SCRIPT:
        if (gApproachingTrainerId == 0)
        {
            SetMapVarsToTrainerA();
        }
        return EventScript_TryDoNormalTrainerBattle;
    case TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC:
        SetMapVarsToTrainerA();
        return EventScript_TryDoNormalTrainerBattle;
    case TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE:
    case TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC:
        SetMapVarsToTrainerA();
        return EventScript_TryDoDoubleTrainerBattle;
#if FREE_MATCH_CALL == FALSE
    case TRAINER_BATTLE_REMATCH_DOUBLE:
        QL_FinishRecordingScene();
        SetMapVarsToTrainerA();
        TRAINER_BATTLE_PARAM.opponentA = GetRematchTrainerId(TRAINER_BATTLE_PARAM.opponentA);
        return EventScript_TryDoDoubleRematchBattle;
    case TRAINER_BATTLE_REMATCH:
        QL_FinishRecordingScene();
        SetMapVarsToTrainerA();
        TRAINER_BATTLE_PARAM.opponentA = GetRematchTrainerId(TRAINER_BATTLE_PARAM.opponentA);
        return EventScript_TryDoRematchBattle;
#endif //FREE_MATCH_CALL
    case TRAINER_BATTLE_EARLY_RIVAL:
        SetMapVarsToTrainerA();
        return EventScript_DoNoIntroTrainerBattle;
    case TRAINER_BATTLE_TWO_TRAINERS_NO_INTRO:
        gNoOfApproachingTrainers = 2; // set TWO_OPPONENTS gBattleTypeFlags
        gApproachingTrainerId = 1; // prevent trainer approach
        return EventScript_DoNoIntroTrainerBattle;
    default:
        if (gApproachingTrainerId == 0)
        {
            SetMapVarsToTrainerA();
        }
        return EventScript_TryDoNormalTrainerBattle;
    }
}

const u8* BattleSetup_ConfigureFacilityTrainerBattle(u8 facility, const u8* scriptEndPtr)
{
    sTrainerBattleEndScript = (u8*)scriptEndPtr;

    switch (facility)
    {
    case FACILITY_BATTLE_PYRAMID:
        if (gApproachingTrainerId == 0)
        {
            SetMapVarsToTrainerA();
            TRAINER_BATTLE_PARAM.opponentA = LocalIdToPyramidTrainerId(gSpecialVar_LastTalked);
        }
        else
        {
            TRAINER_BATTLE_PARAM.opponentB = LocalIdToPyramidTrainerId(gSpecialVar_LastTalked);
        }
        return EventScript_TryDoNormalTrainerBattle;
    default:
        return sTrainerBattleEndScript;
    }
}

void ConfigureAndSetUpOneTrainerBattle(u8 trainerObjEventId, const u8 *trainerScript)
{
    gSelectedObjectEvent = trainerObjEventId;
    gSpecialVar_LastTalked = gObjectEvents[trainerObjEventId].localId;
    TrainerBattleLoadArgs(trainerScript + 1);
    BattleSetup_ConfigureTrainerBattle(trainerScript + 1);
    ScriptContext_SetupScript(EventScript_StartTrainerApproach);
    LockPlayerFieldControls();
}

void ConfigureTwoTrainersBattle(u8 trainerObjEventId, const u8 *trainerScript)
{
    gSelectedObjectEvent = trainerObjEventId;
    gSpecialVar_LastTalked = gObjectEvents[trainerObjEventId].localId;

    if (gApproachingTrainerId == 0)
        TrainerBattleLoadArgs(trainerScript + 1);
    else
        TrainerBattleLoadArgsSecondTrainer(trainerScript + 1);

    BattleSetup_ConfigureTrainerBattle(trainerScript + 1);
}

void SetUpTwoTrainersBattle(void)
{
    ScriptContext_SetupScript(EventScript_StartTrainerApproach);
    LockPlayerFieldControls();
}

#define OPCODE_OFFSET 1
bool32 GetTrainerFlagFromScriptPointer(const u8 *data)
{
    TrainerBattleParameter *temp = (TrainerBattleParameter*)(data + OPCODE_OFFSET);
    return FlagGet(TRAINER_FLAGS_START + temp->params.opponentA);
}
#undef OPCODE_OFFSET

// Set trainer's movement type so they stop and remain facing that direction
// Note: Only for trainers who are spoken to directly
//       For trainers who spot the player this is handled by PlayerFaceApproachingTrainer
void SetTrainerFacingDirection(void)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[gSelectedObjectEvent];
    SetTrainerMovementType(objectEvent, GetTrainerFacingDirectionMovementType(objectEvent->facingDirection));
}

u8 GetTrainerBattleMode(void)
{
    return TRAINER_BATTLE_PARAM.mode;
}

u16 GetRivalBattleFlags(void)
{
    return TRAINER_BATTLE_PARAM.rivalBattleFlags;
}

bool8 GetTrainerFlag(void)
{
    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
        return GetBattlePyramidTrainerFlag(gSelectedObjectEvent);
    else
        return FlagGet(GetTrainerAFlag());
}

static void SetBattledTrainersFlags(void)
{
    if (TRAINER_BATTLE_PARAM.opponentB != 0)
        FlagSet(GetTrainerBFlag());
    FlagSet(GetTrainerAFlag());
}

void SetBattledTrainerFlag(void)
{
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
    {
        if (FollowerNPCIsBattlePartner())
            gBattleTypeFlags = (BATTLE_TYPE_MULTI | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_INGAME_PARTNER | BATTLE_TYPE_TWO_OPPONENTS | BATTLE_TYPE_TRAINER);
        else
            gBattleTypeFlags = (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_TWO_OPPONENTS | BATTLE_TYPE_TRAINER);
    }
    else
    {
        if (FollowerNPCIsBattlePartner())
        {
            gBattleTypeFlags = (BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_TRAINER);
            TRAINER_BATTLE_PARAM.opponentB = 0xFFFF;
        }
        else
        {
            gBattleTypeFlags = (BATTLE_TYPE_TRAINER);
        }
    }

    if (GetTrainerBattleMode() == TRAINER_BATTLE_EARLY_RIVAL && GetRivalBattleFlags() & RIVAL_BATTLE_TUTORIAL)
        gBattleTypeFlags |= BATTLE_TYPE_FIRST_BATTLE;

    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
    {
        VarSet(VAR_TEMP_PLAYING_PYRAMID_MUSIC, 0);
        gBattleTypeFlags |= BATTLE_TYPE_PYRAMID;

        if (gNoOfApproachingTrainers == 2)
        {
            FillFrontierTrainersParties(1);
            ZeroMonData(&gEnemyParty[1]);
            ZeroMonData(&gEnemyParty[2]);
            ZeroMonData(&gEnemyParty[4]);
            ZeroMonData(&gEnemyParty[5]);
        }
        else
        {
            FillFrontierTrainerParty(1);
            ZeroMonData(&gEnemyParty[1]);
            ZeroMonData(&gEnemyParty[2]);
        }

        MarkApproachingPyramidTrainersAsBattled();
    }
    else if (GetTrainerBattleType(TRAINER_BATTLE_PARAM.opponentA) == TRAINER_BATTLE_TYPE_DOUBLES)
    {
        gBattleTypeFlags |= BATTLE_TYPE_DOUBLE;
    }

    sNoOfPossibleTrainerRetScripts = gNoOfApproachingTrainers;
    gNoOfApproachingTrainers = 0;
    sShouldCheckTrainerBScript = FALSE;
    gWhichTrainerToFaceAfterBattle = 0;
    gMain.savedCallback = CB2_EndTrainerBattle;

    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
        DoBattlePyramidTrainerHillBattle();
    else
        DoTrainerBattle();

    ScriptContext_Stop();
}

static void CB2_EndDebugBattle(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
    {
        for (u32 i = 0; i < 3; i++)
        {
            u16 monId = gSaveBlock2Ptr->frontier.selectedPartyMons[i] - 1;
            if (monId < PARTY_SIZE)
                SavePlayerPartyMon(gSaveBlock2Ptr->frontier.selectedPartyMons[i] - 1, &gPlayerParty[i]);
        }
        LoadPlayerParty();
    }
    SetMainCallback2(CB2_EndTrainerBattle);
}

void BattleSetup_StartTrainerBattle_Debug(void)
{
    sNoOfPossibleTrainerRetScripts = gNoOfApproachingTrainers;
    gNoOfApproachingTrainers = 0;
    sShouldCheckTrainerBScript = FALSE;
    gWhichTrainerToFaceAfterBattle = 0;
    gMain.savedCallback = CB2_EndDebugBattle;

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
            SavePlayerPartyMon(i, &gPlayerParty[j]);
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

    gIsDebugBattle = FALSE;
    if (FollowerNPCIsBattlePartner())
    {
        RestorePartyAfterFollowerNPCBattle();
        if (FNPC_FLAG_HEAL_AFTER_FOLLOWER_BATTLE != 0
         && (FNPC_FLAG_HEAL_AFTER_FOLLOWER_BATTLE == FNPC_ALWAYS
         || FlagGet(FNPC_FLAG_HEAL_AFTER_FOLLOWER_BATTLE)))
            HealPlayerParty();
    }

    if (GetTrainerBattleMode() == TRAINER_BATTLE_EARLY_RIVAL)
    {
        if (IsPlayerDefeated(gBattleOutcome) == TRUE)
        {
            gSpecialVar_Result = TRUE;
            if (GetRivalBattleFlags() & RIVAL_BATTLE_HEAL_AFTER)
            {
                HealPlayerParty();
            }
            else
            {
                SetMainCallback2(CB2_WhiteOut);
                return;
            }
        }
        else
        {
            gSpecialVar_Result = FALSE;
        }
        DowngradeBadPoison();
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
        SetBattledTrainerFlag();
        QuestLogEvents_HandleEndTrainerBattle();
    }
    else if (TRAINER_BATTLE_PARAM.opponentA == TRAINER_SECRET_BASE)
    {
        DowngradeBadPoison();
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
    }
    else if (IsPlayerDefeated(gBattleOutcome) == TRUE)
    {
        if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE || (!NoAliveMonsForPlayer()) || FlagGet(B_FLAG_NO_WHITEOUT))
            SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
        else
            SetMainCallback2(CB2_WhiteOut);
    }
    else if (DidPlayerForfeitNormalTrainerBattle())
    {
            SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
        DowngradeBadPoison();
        if (CurrentBattlePyramidLocation() == PYRAMID_LOCATION_NONE)
        {
            SetBattledTrainersFlags();
            QuestLogEvents_HandleEndTrainerBattle();
        }
    }
}

static void CB2_EndRematchBattle(void)
{
    if (TRAINER_BATTLE_PARAM.opponentA == TRAINER_SECRET_BASE)
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
        // RegisterTrainerInMatchCall();
        SetBattledTrainersFlags();
        // HandleRematchVarsOnBattleEnd();
        ClearRematchStateOfLastTalked();
        ResetDeferredLinkEvent();
        DowngradeBadPoison();
    }
}

void BattleSetup_StartRematchBattle(void)
{
    gBattleTypeFlags = BATTLE_TYPE_TRAINER;
    gMain.savedCallback = CB2_EndRematchBattle;
    DoTrainerBattle();
    ScriptContext_Stop();
}

void ShowTrainerIntroSpeech(void)
{
    if (CurrentBattlePyramidLocation() != PYRAMID_LOCATION_NONE)
    {
        if (gNoOfApproachingTrainers == 0 || gNoOfApproachingTrainers == 1)
            CopyPyramidTrainerSpeechBefore(LocalIdToPyramidTrainerId(gSpecialVar_LastTalked));
        else
            CopyPyramidTrainerSpeechBefore(LocalIdToPyramidTrainerId(gObjectEvents[gApproachingTrainers[gApproachingTrainerId].objectEventId].localId));

        ShowFieldMessageFromBuffer();
    }
    else
    {
        ShowFieldMessage(GetIntroSpeechOfApproachingTrainer());
    }
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
    if (sShouldCheckTrainerBScript)
    {
        sShouldCheckTrainerBScript = FALSE;
        if (TRAINER_BATTLE_PARAM.battleScriptRetAddrB != NULL)
        {
            gWhichTrainerToFaceAfterBattle = 1;
            return TRAINER_BATTLE_PARAM.battleScriptRetAddrB;
        }
    }
    else
    {
        if (TRAINER_BATTLE_PARAM.battleScriptRetAddrA != NULL)
        {
            gWhichTrainerToFaceAfterBattle = 0;
            return TRAINER_BATTLE_PARAM.battleScriptRetAddrA;
        }
    }

    return EventScript_TryGetTrainerScript;
}

void ShowTrainerCantBattleSpeech(void)
{
    ShowFieldMessage(GetTrainerCantBattleSpeech());
}

s32 FirstBattleTrainerIdToRematchTableId(const struct RematchData *table, u16 trainerId)
{
    s32 i;

    for (i = 0; i < REMATCH_TRAINER_COUNT; i++)
    {
        if (table[i].trainerIDs[0] == trainerId)
            return i;
    }

    return -1;
}

void PlayTrainerEncounterMusic(void)
{
    u16 trainerId;
    u16 music;

    if (gApproachingTrainerId == 0)
        trainerId = TRAINER_BATTLE_PARAM.opponentA;
    else
        trainerId = TRAINER_BATTLE_PARAM.opponentB;

    if (!QL_IS_PLAYBACK_STATE
     && TRAINER_BATTLE_PARAM.mode != TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC
     && TRAINER_BATTLE_PARAM.mode != TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC)
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
        return ReturnEmptyStringIfNull(TRAINER_BATTLE_PARAM.introTextA);
    else
        return ReturnEmptyStringIfNull(TRAINER_BATTLE_PARAM.introTextB);
}

const u8 *GetTrainerALoseText(void)
{
    const u8 *string = TRAINER_BATTLE_PARAM.defeatTextA;

    StringExpandPlaceholders(gStringVar4, ReturnEmptyStringIfNull(string));
    return gStringVar4;
}

const u8 *GetTrainerBLoseText(void)
{
    StringExpandPlaceholders(gStringVar4, ReturnEmptyStringIfNull(TRAINER_BATTLE_PARAM.defeatTextB));
    return gStringVar4;
}

const u8 *GetTrainerWonSpeech(void)
{
    StringExpandPlaceholders(gStringVar4, ReturnEmptyStringIfNull(TRAINER_BATTLE_PARAM.victoryText));
    return gStringVar4;
}

static const u8 *GetTrainerCantBattleSpeech(void)
{
    return ReturnEmptyStringIfNull(TRAINER_BATTLE_PARAM.cannotBattleText);
}

void ShouldTryGetTrainerScript(void)
{
    if (sNoOfPossibleTrainerRetScripts > 1)
    {
        sNoOfPossibleTrainerRetScripts = 0;
        sShouldCheckTrainerBScript = TRUE;
        gSpecialVar_Result = TRUE;
    }
    else
    {
        sShouldCheckTrainerBScript = FALSE;
        gSpecialVar_Result = FALSE;
    }
}

u16 CountMaxPossibleRematch(u16 trainerId)
{
    for (u32 i = 1; i < MAX_REMATCH_PARTIES; i++)
    {
        if (sRematches[trainerId].trainerIDs[i] == 0)
            return i;
    }
    return MAX_REMATCH_PARTIES - 1;
}

u16 CountBattledRematchTeams(u16 trainerId)
{
    if (HasTrainerBeenFought(sRematches[trainerId].trainerIDs[0]) != TRUE)
        return 0;

    for (u32 i = 1; i < MAX_REMATCH_PARTIES; i++)
    {
        if (sRematches[trainerId].trainerIDs[i] == 0)
            return i;
        if (!HasTrainerBeenFought(sRematches[trainerId].trainerIDs[i]))
            return i;
    }

    return MAX_REMATCH_PARTIES - 1;
}

void SetMultiTrainerBattle(struct ScriptContext *ctx)
{
    InitTrainerBattleParameter();

    TRAINER_BATTLE_PARAM.opponentA = ScriptReadHalfword(ctx);
    TRAINER_BATTLE_PARAM.defeatTextA = (u8*)ScriptReadWord(ctx);
    TRAINER_BATTLE_PARAM.opponentB = ScriptReadHalfword(ctx);
    TRAINER_BATTLE_PARAM.defeatTextB = (u8*)ScriptReadWord(ctx);
    gPartnerTrainerId = TRAINER_PARTNER(ScriptReadHalfword(ctx));
};

