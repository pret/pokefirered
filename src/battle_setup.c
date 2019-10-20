#include "global.h"
#include "task.h"
#include "help_system.h"
#include "overworld.h"
#include "item.h"
#include "sound.h"
#include "pokemon.h"
#include "load_save.h"
#include "safari_zone.h"
#include "quest_log.h"
#include "script.h"
#include "script_pokemon_util_80A0058.h"
#include "strings.h"
#include "string_util.h"
#include "event_data.h"
#include "unk_8159F40.h"
#include "map_obj_80688E4.h"
#include "metatile_behavior.h"
#include "event_scripts.h"
#include "fldeff.h"
#include "fieldmap.h"
#include "field_control_avatar.h"
#include "field_player_avatar.h"
#include "field_screen_effect.h"
#include "field_message_box.h"
#include "field_map_obj.h"
#include "vs_seeker.h"
#include "battle.h"
#include "battle_setup.h"
#include "battle_transition.h"
#include "constants/battle_setup.h"
#include "constants/flags.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/pokemon.h"
#include "constants/trainers.h"
#include "constants/trainer_classes.h"
#include "constants/map_types.h"

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

void BattleSetup_StartSafariBattle(void);
void BattleSetup_StartGhostBattle(void);
void BattleSetup_StandardWildBattle(void);
void CB2_EndWildBattle(void);
u8 GetWildBattleTransition(void);
void CB2_EndSafariBattle(void);
u8 GetTrainerBattleTransition(void);
void CB2_EndScriptedWildBattle(void);
void CB2_EndMarowakBattle(void);
bool32 IsPlayerDefeated(u32 battleOutcome);
void CB2_EndTrainerBattle(void);
const u8 *GetIntroSpeechOfApproachingTrainer(void);
const u8 *GetTrainerCantBattleSpeech(void);

EWRAM_DATA u16 sTrainerBattleMode = 0;
EWRAM_DATA u16 gTrainerBattleOpponent_A = 0;
EWRAM_DATA u16 sTrainerEventObjectLocalId = 0;
EWRAM_DATA u8 *sTrainerAIntroSpeech = NULL;
EWRAM_DATA u8 *sTrainerADefeatSpeech = NULL;
EWRAM_DATA u8 *sTrainerBDefeatSpeech = NULL;
EWRAM_DATA u8 *sTrainerCannotBattleSpeech = NULL;
EWRAM_DATA u8 *sTrainerBattleEndScript = NULL;
EWRAM_DATA u8 *sTrainerABattleScriptRetAddr = NULL;
EWRAM_DATA u16 gUnknown_20386CC = 0;

extern const u8 sBattleTransitionTable_Wild[][2];
extern const u8 sBattleTransitionTable_Trainer[][2];
extern const struct TrainerBattleParameter sOrdinaryBattleParams[];
extern const struct TrainerBattleParameter sOrdinaryNoIntroBattleParams[];
extern const struct TrainerBattleParameter sDoubleBattleParams[];
extern const struct TrainerBattleParameter sContinueScriptBattleParams[];
extern const struct TrainerBattleParameter sContinueScriptDoubleBattleParams[];
extern const struct TrainerBattleParameter gUnknown_83C6A20[];

#define tState data[0]
#define tTransition data[1]

void Task_BattleStart(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        if (!FldEffPoison_IsActive())
        {
        	HelpSystem_Disable();
            BT_StartOnField(tTransition);
            ++tState;
        }
        break;
    case 1:
        if (BT_IsDone() == TRUE)
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

void CreateBattleStartTask(u8 transition, u16 song) // song == 0 means default music for current map
{
    u8 taskId = CreateTask(Task_BattleStart, 1);

    gTasks[taskId].tTransition = transition;
    PlayMapChosenOrBattleBGM(song);
}

bool8 CheckSilphScopeInPokemonTower(u16 mapGroup, u16 mapNum)
{
    if (mapGroup == MAP_GROUP(POKEMON_TOWER_1F)
     && ((u16)(mapNum - MAP_NUM(POKEMON_TOWER_1F)) <= 6)
     && !(CheckBagHasItem(ITEM_SILPH_SCOPE, 1)))
        return TRUE;
    else
        return FALSE;
}

void BattleSetup_StartWildBattle(void)
{
    if (GetSafariZoneFlag())
        BattleSetup_StartSafariBattle();
    else if (CheckSilphScopeInPokemonTower(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum))
        BattleSetup_StartGhostBattle();
    else
        BattleSetup_StandardWildBattle();
}

void BattleSetup_StandardWildBattle(void)
{
    ScriptContext2_Enable();
    FreezeEventObjects();
    sub_805C780();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = 0;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void BattleSetup_StartRoamerBattle(void)
{
    ScriptContext2_Enable();
    FreezeEventObjects();
    sub_805C780();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_ROAMER;
    CreateBattleStartTask(GetWildBattleTransition(), MUS_VS_DEN);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void BattleSetup_StartSafariBattle(void)
{
    ScriptContext2_Enable();
    FreezeEventObjects();
    sub_805C780();
    gMain.savedCallback = CB2_EndSafariBattle;
    gBattleTypeFlags = BATTLE_TYPE_SAFARI;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
}

void BattleSetup_StartGhostBattle(void)
{
    ScriptContext2_Enable();
    FreezeEventObjects();
    sub_805C780();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_GHOST;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    SetMonData(&gEnemyParty[0], MON_DATA_NICKNAME, gUnknown_841D148);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void DoTrainerBattle(void)
{
    CreateBattleStartTask(GetTrainerBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_TRAINER_BATTLES);
}

void BattleSetup_StartOldManTutorialBattle(void)
{
    CreateMaleMon(&gEnemyParty[0], SPECIES_WEEDLE, 5);
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_ReturnToFieldContinueScriptPlayMapMusic;
    gBattleTypeFlags = BATTLE_TYPE_OLDMAN_TUTORIAL;
    CreateBattleStartTask(B_TRANSITION_SLICED_SCREEN, 0);
}

void BattleSetup_StartScriptedWildBattle(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_PALACE;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void BattleSetup_StartMarowakBattle(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndMarowakBattle;
    if (CheckBagHasItem(ITEM_SILPH_SCOPE, 1))
    {
        gBattleTypeFlags = BATTLE_TYPE_GHOST | BATTLE_TYPE_LEGENDARY;
        CreateMonWithGenderNatureLetter(gEnemyParty, SPECIES_MAROWAK, 30, 31, MON_FEMALE, NATURE_SERIOUS, 0);
    }
    else
    {
        gBattleTypeFlags = BATTLE_TYPE_GHOST;
    }
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    SetMonData(&gEnemyParty[0], MON_DATA_NICKNAME, gUnknown_841D148);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void sub_807F998(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void BattleSetup_StartLegendaryBattle(void)
{
    u16 species;
    
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY | BATTLE_TYPE_ARENA;
    species = GetMonData(&gEnemyParty[0], MON_DATA_SPECIES);
    switch (species)
    {
    case SPECIES_MEWTWO:
        CreateBattleStartTask(B_TRANSITION_BLUR, MUS_VS_MYU2);
        break;
    case SPECIES_DEOXYS:
        CreateBattleStartTask(B_TRANSITION_BLUR, MUS_VS_DEO);
        break;
    case SPECIES_MOLTRES:
    case SPECIES_ARTICUNO:
    case SPECIES_ZAPDOS:
    case SPECIES_HO_OH:
    case SPECIES_LUGIA:
        CreateBattleStartTask(B_TRANSITION_BLUR, MUS_VS_DEN);
        break;
    default:
        CreateBattleStartTask(B_TRANSITION_BLUR, MUS_BATTLE20);
        break;
    }
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void BattleSetup_StartIceCaveBattle(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY | BATTLE_TYPE_KYOGRE_GROUDON;
    if (gGameVersion == VERSION_FIRE_RED)
        CreateBattleStartTask(B_TRANSITION_BLACK_DOODLES, MUS_BATTLE20);
    else // pointless, exactly the same
        CreateBattleStartTask(B_TRANSITION_BLACK_DOODLES, MUS_BATTLE20);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

void sub_807FABC(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY | BATTLE_TYPE_REGI;
    CreateBattleStartTask(B_TRANSITION_BLUR, MUS_BATTLE20);
    IncrementGameStat(GAME_STAT_TOTAL_BATTLES);
    IncrementGameStat(GAME_STAT_WILD_BATTLES);
}

// not used
void sub_807FAF8(void)
{
    LoadPlayerParty();
    CB2_EndWildBattle();
}

//not used
void sub_807FB08(void)
{
    ScriptContext2_Enable();
    FreezeEventObjects();
    sub_805C780();
    gMain.savedCallback = sub_807FAF8;
    SavePlayerParty();
    sub_8159F40();
    CreateBattleStartTask(GetWildBattleTransition(), 0);
}

void CB2_EndWildBattle(void)
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
        gFieldCallback = sub_807E3EC;
    }
}

void CB2_EndScriptedWildBattle(void)
{
    CpuFill16(0, (void *)BG_PLTT, BG_PLTT_SIZE);
    ResetOamRange(0, 128);
    if (IsPlayerDefeated(gBattleOutcome) == TRUE)
        SetMainCallback2(CB2_WhiteOut);
    else
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

void CB2_EndMarowakBattle(void)
{
    CpuFill16(0, (void *)BG_PLTT, BG_PLTT_SIZE);
    ResetOamRange(0, 128);
    if (IsPlayerDefeated(gBattleOutcome))
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        if (gBattleOutcome == B_OUTCOME_WON)
            gSpecialVar_Result = 0;
        else
            gSpecialVar_Result = 1;
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
    }
}

u8 BattleSetup_GetTerrainId(void)
{
    u16 tileBehavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
    if (MetatileBehavior_IsTallGrass_2(tileBehavior))
        return BATTLE_TERRAIN_GRASS;
    if (MetatileBehavior_IsLongGrass(tileBehavior))
        return BATTLE_TERRAIN_LONG_GRASS;
    if (MetatileBehavior_IsSandOrDeepSand(tileBehavior))
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
    if (MetatileBehavior_IsDeepSemiDeepOrSplashingWater(tileBehavior))
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

u8 GetBattleTransitionTypeByMap(void)
{
    u16 tileBehavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
    if (Overworld_GetFlashLevel())
        return B_TRANSITION_HORIZONTAL_CORRUGATE;
    if (!MetatileBehavior_IsSurfable(tileBehavior))
    {
        switch (gMapHeader.mapType)
        {
        case MAP_TYPE_UNDERGROUND:
            return B_TRANSITION_DISTORTED_WAVE;
        case MAP_TYPE_UNDERWATER:
            return B_TRANSITION_BIG_POKEBALL;
        default:
            return B_TRANSITION_BLUR;
        }
    }
    return B_TRANSITION_BIG_POKEBALL;
}

u16 GetSumOfPlayerPartyLevel(u8 numMons)
{
    u8 sum = 0;
    s32 i;

    for (i = 0; i < PARTY_SIZE; ++i)
    {
        u32 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);

        if (species != SPECIES_EGG && species != SPECIES_NONE && GetMonData(&gPlayerParty[i], MON_DATA_HP) != 0)
        {
            sum += GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
            if (--numMons == 0)
                break;
        }
    }
    return sum;
}

u8 GetSumOfEnemyPartyLevel(u16 opponentId, u8 numMons)
{
    u8 i;
    u8 sum;
    u32 count = numMons;

    if (gTrainers[opponentId].partySize < count)
        count = gTrainers[opponentId].partySize;
    sum = 0;
    switch (gTrainers[opponentId].partyFlags)
    {
    case 0:
        {
            const struct TrainerMonNoItemDefaultMoves *party;

            party = gTrainers[opponentId].party.NoItemDefaultMoves;
            for (i = 0; i < count; ++i)
                sum += party[i].lvl;
        }
        break;
    case F_TRAINER_PARTY_CUSTOM_MOVESET:
        {
            const struct TrainerMonNoItemCustomMoves *party;

            party = gTrainers[opponentId].party.NoItemCustomMoves;
            for (i = 0; i < count; ++i)
                sum += party[i].lvl;
        }
        break;
    case F_TRAINER_PARTY_HELD_ITEM:
        {
            const struct TrainerMonItemDefaultMoves *party;

            party = gTrainers[opponentId].party.ItemDefaultMoves;
            for (i = 0; i < count; ++i)
                sum += party[i].lvl;
        }
        break;
    case F_TRAINER_PARTY_CUSTOM_MOVESET | F_TRAINER_PARTY_HELD_ITEM:
        {
            const struct TrainerMonItemCustomMoves *party;

            party = gTrainers[opponentId].party.ItemCustomMoves;
            for (i = 0; i < count; ++i)
                sum += party[i].lvl;
        }
        break;
    }
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

    if (gTrainerBattleOpponent_A == TRAINER_SECRET_BASE)
        return B_TRANSITION_BLUE;
    if (gTrainers[gTrainerBattleOpponent_A].trainerClass == CLASS_ELITE_FOUR_2)
    {
        if (gTrainerBattleOpponent_A == 410 || gTrainerBattleOpponent_A == 735) // TODO: replace these with enums
            return B_TRANSITION_LORELEI;
        if (gTrainerBattleOpponent_A == 411 || gTrainerBattleOpponent_A == 736)
            return B_TRANSITION_BRUNO;
        if (gTrainerBattleOpponent_A == 412 || gTrainerBattleOpponent_A == 737)
            return B_TRANSITION_AGATHA;
        if (gTrainerBattleOpponent_A == 413 || gTrainerBattleOpponent_A == 738)
            return B_TRANSITION_LANCE;
        return B_TRANSITION_BLUE;
    }
    if (gTrainers[gTrainerBattleOpponent_A].trainerClass == CLASS_CHAMPION_2)
        return B_TRANSITION_BLUE;
    if (gTrainers[gTrainerBattleOpponent_A].doubleBattle == TRUE)
        minPartyCount = 2; // double battles always at least have 2 pokemon.
    else
        minPartyCount = 1;
    transitionType = GetBattleTransitionTypeByMap();
    enemyLevel = GetSumOfEnemyPartyLevel(gTrainerBattleOpponent_A, minPartyCount);
    playerLevel = GetSumOfPlayerPartyLevel(minPartyCount);
    if (enemyLevel < playerLevel)
        return sBattleTransitionTable_Trainer[transitionType][0];
    else
        return sBattleTransitionTable_Trainer[transitionType][1];
}

u8 sub_8080060(void)
{
    u8 enemyLevel = GetMonData(&gEnemyParty[0], MON_DATA_LEVEL);
    u8 playerLevel = GetSumOfPlayerPartyLevel(1);

    if (enemyLevel < playerLevel)
        return 4;
    else
        return 3;
}

u32 TrainerBattleLoadArg32(const u8 *ptr)
{
    return T1_READ_32(ptr);
}

u16 TrainerBattleLoadArg16(const u8 *ptr)
{
    return T1_READ_16(ptr);
}

u8 TrainerBattleLoadArg8(const u8 *ptr)
{
    return T1_READ_8(ptr);
}

u16 GetTrainerAFlag(void)
{
    return FLAG_TRAINER_FLAG_START + gTrainerBattleOpponent_A;
}

bool32 IsPlayerDefeated(u32 battleOutcome)
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

void InitTrainerBattleVariables(void)
{
    sTrainerBattleMode = 0;
    gTrainerBattleOpponent_A = 0;
    sTrainerEventObjectLocalId = 0;
    sTrainerAIntroSpeech = NULL;
    sTrainerADefeatSpeech = NULL;
    sTrainerBDefeatSpeech = NULL;
    sTrainerCannotBattleSpeech = NULL;
    sTrainerBattleEndScript = NULL;
    sTrainerABattleScriptRetAddr = NULL;
    gUnknown_20386CC = 0;
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

static inline void SetPtr(const void *ptr, const void* value)
{
    *(const void **)(ptr) = value;
}

void TrainerBattleLoadArgs(const struct TrainerBattleParameter *specs, const u8 *data)
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

void SetMapVarsToTrainer(void)
{
    if (sTrainerEventObjectLocalId != 0)
    {
        gSpecialVar_LastTalked = sTrainerEventObjectLocalId;
        gSelectedEventObject = GetFieldObjectIdByLocalIdAndMap(sTrainerEventObjectLocalId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    }
}

const u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data)
{
    InitTrainerBattleVariables();
    sTrainerBattleMode = TrainerBattleLoadArg8(data);
    switch (sTrainerBattleMode)
    {
    case TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT:
        TrainerBattleLoadArgs(sOrdinaryNoIntroBattleParams, data);
        return EventScript_DoTrainerBattle;
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
        sub_811231C();
        TrainerBattleLoadArgs(sDoubleBattleParams, data);
        SetMapVarsToTrainer();
        gTrainerBattleOpponent_A = GetRematchTrainerId(gTrainerBattleOpponent_A);
        return EventScript_TryDoDoubleRematchBattle;
    case TRAINER_BATTLE_REMATCH:
        sub_811231C();
        TrainerBattleLoadArgs(sOrdinaryBattleParams, data);
        SetMapVarsToTrainer();
        gTrainerBattleOpponent_A = GetRematchTrainerId(gTrainerBattleOpponent_A);
        return EventScript_TryDoRematchBattle;
    case TRAINER_BATTLE_TUTORIAL:
        TrainerBattleLoadArgs(gUnknown_83C6A20, data);
        return EventScript_DoTrainerBattle;
    default:
        TrainerBattleLoadArgs(sOrdinaryBattleParams, data);
        SetMapVarsToTrainer();
        return EventScript_TryDoNormalTrainerBattle;
    }
}

void ConfigureAndSetUpOneTrainerBattle(u8 trainerEventObjId, const u8 *trainerScript)
{
    gSelectedEventObject = trainerEventObjId;
    gSpecialVar_LastTalked = gMapObjects[trainerEventObjId].localId;
    BattleSetup_ConfigureTrainerBattle(trainerScript + 1);
    ScriptContext1_SetupScript(gUnknown_81A4EB4);
    ScriptContext2_Enable();
}

bool32 GetTrainerFlagFromScriptPointer(const u8 *data)
{
    u32 flag = TrainerBattleLoadArg16(data + 2);

    return FlagGet(FLAG_TRAINER_FLAG_START + flag);
}

void SetUpTrainerMovement(void)
{
    struct MapObject *eventObject = &gMapObjects[gSelectedEventObject];

    SetTrainerMovementType(eventObject, GetTrainerFacingDirectionMovementType(eventObject->facingDirection));
}

u8 GetTrainerBattleMode(void)
{
    return sTrainerBattleMode;
}

u16 sub_80803D8(void)
{
    return gUnknown_20386CC;
}

u16 GetTrainerFlag(void)
{
    return FlagGet(GetTrainerAFlag());
}

void SetBattledTrainerFlag(void)
{
    FlagSet(GetTrainerAFlag());
}

// not used
void SetBattledTrainerFlag2(void)
{
    FlagSet(GetTrainerAFlag());
}

bool8 HasTrainerBeenFought(u16 trainerId)
{
    return FlagGet(FLAG_TRAINER_FLAG_START + trainerId);
}

void SetTrainerFlag(u16 trainerId)
{
    FlagSet(FLAG_TRAINER_FLAG_START + trainerId);
}

void ClearTrainerFlag(u16 trainerId)
{
    FlagClear(FLAG_TRAINER_FLAG_START + trainerId);
}

void BattleSetup_StartTrainerBattle(void)
{
    gBattleTypeFlags = BATTLE_TYPE_TRAINER;
    if (GetTrainerBattleMode() == TRAINER_BATTLE_TUTORIAL
     && sub_80803D8() & 3)
        gBattleTypeFlags |= BATTLE_TYPE_FIRST_BATTLE;
    gMain.savedCallback = CB2_EndTrainerBattle;
    DoTrainerBattle();
    ScriptContext1_Stop();
}

void CB2_EndTrainerBattle(void)
{
    if (sTrainerBattleMode == TRAINER_BATTLE_TUTORIAL)
    {
        if (IsPlayerDefeated(gBattleOutcome) == TRUE)
        {
            gSpecialVar_Result = 1;
            if (gUnknown_20386CC & 1)
            {
                sp000_heal_pokemon();
            }
            else
            {
                SetMainCallback2(CB2_WhiteOut);
                return;
            }
            SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
            SetBattledTrainerFlag();
            sub_81139BC();
        }
        else
        {
            gSpecialVar_Result = 0;
            SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
            SetBattledTrainerFlag();
            sub_81139BC();
        }

    }
    else
    {
        if (gTrainerBattleOpponent_A == TRAINER_SECRET_BASE)
        {
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
            sub_81139BC();
        }
    }
}

void CB2_EndRematchBattle(void)
{
    if (gTrainerBattleOpponent_A == TRAINER_SECRET_BASE)
    {
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
        sub_810CDE8();
        sub_81138F8();
    }
}

void BattleSetup_StartRematchBattle(void)
{
    gBattleTypeFlags = BATTLE_TYPE_TRAINER;
    gMain.savedCallback = CB2_EndRematchBattle;
    DoTrainerBattle();
    ScriptContext1_Stop();
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
        return gUnknown_81C555B;
}

const u8 *BattleSetup_GetTrainerPostBattleScript(void)
{
    if (sTrainerABattleScriptRetAddr != NULL)
        return sTrainerABattleScriptRetAddr;
    else
        return gUnknown_81C555B;
}

void ShowTrainerCantBattleSpeech(void)
{
    ShowFieldMessage(GetTrainerCantBattleSpeech());
}

void SetUpTrainerEncounterMusic(void)
{
    u16 music;

    if ((u8)(gUnknown_203ADFA - 2) > 1
     && sTrainerBattleMode != TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC
     && sTrainerBattleMode != TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC)
    {
        switch (GetTrainerEncounterMusicId(gTrainerBattleOpponent_A))
        {
        case 1: // TODO: replace these with enums
        case 2:
        case 9:
            music = MUS_SHOUJO;
            break;
        case 0:
        case 4:
        case 5:
        case 8:
        case 10:
        case 11:
        case 12:
        case 13:
            music = MUS_SHOUNEN;
            break;
        default:
            music = MUS_ROCKET;
            break;
        }
        PlayNewMapMusic(music);
    }
}

const u8 *ReturnEmptyStringIfNull(const u8 *string)
{
    if (string == NULL)
        return gString_Dummy;
    else
        return string;
}

const u8 *GetIntroSpeechOfApproachingTrainer(void)
{
    return ReturnEmptyStringIfNull(sTrainerAIntroSpeech);
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

const u8 *GetTrainerCantBattleSpeech(void)
{
    return ReturnEmptyStringIfNull(sTrainerCannotBattleSpeech);
}
