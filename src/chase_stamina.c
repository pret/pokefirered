#include "global.h"
#include "battle.h"
#include "chase_stamina.h"
#include "field_player_avatar.h"
#include "item.h"
#include "metatile_behavior.h"
#include "money.h"
#include "party_menu.h"
#include "pokemon.h"
#include "strings.h"
#include "wild_encounter.h"
#include "constants/battle.h"
#include "constants/map_types.h"

#define STAMINA_LEVEL_MIN 1
#define STAMINA_LEVEL_MAX 10
#define STAMINA_BASE_STEPS 30
#define STAMINA_STEPS_PER_LEVEL 15
#define STAMINA_UPGRADE_COST_BASE 1200
#define STAMINA_UPGRADE_COST_STEP 800

#define STAMINA_REGEN_DELAY_FRAMES 90
#define STAMINA_REGEN_TICK_FRAMES 16

#define CHASE_MAX_CHASERS 2
#define CHASE_BASE_STEPS 45
#define CHASE_EXTRA_STEPS_PER_CHASER 15
#define CHASE_REENGAGE_COUNTDOWN_MIN 3
#define CHASE_REENGAGE_COUNTDOWN_MAX 5
#define CHASE_SPECIES_VARIANCE_MAX 24
#define CHASE_AREA_ROUTE_BONUS 10
#define CHASE_AREA_UNDERGROUND_BONUS 18
#define CHASE_AREA_INDOOR_PENALTY 8
#define CHASE_STEPS_MIN 30
#define CHASE_STEPS_MAX 140

static EWRAM_DATA u8 sStaminaRegenDelay = 0;
static EWRAM_DATA u8 sStaminaRegenTick = 0;
static EWRAM_DATA u8 sActiveChasers = 0;
static EWRAM_DATA u16 sChaseStepsRemaining = 0;
static EWRAM_DATA u8 sChaseReengageStepCountdown = 0;
static EWRAM_DATA bool8 sPendingWildFirstMovePriority = FALSE;
static EWRAM_DATA bool8 sBattleUsesWildFirstMovePriority = FALSE;

static u8 GetStaminaLevel(void)
{
    if (gSaveBlock1Ptr->staminaLevel < STAMINA_LEVEL_MIN)
    {
        gSaveBlock1Ptr->staminaLevel = STAMINA_LEVEL_MIN;
        if (gSaveBlock1Ptr->staminaCurrent == 0)
            gSaveBlock1Ptr->staminaCurrent = STAMINA_BASE_STEPS;
    }
    if (gSaveBlock1Ptr->staminaLevel > STAMINA_LEVEL_MAX)
        gSaveBlock1Ptr->staminaLevel = STAMINA_LEVEL_MAX;
    return gSaveBlock1Ptr->staminaLevel;
}

u8 ChaseStamina_GetMax(void)
{
    return STAMINA_BASE_STEPS + (GetStaminaLevel() - 1) * STAMINA_STEPS_PER_LEVEL;
}

static void ClampCurrentStamina(void)
{
    u8 maxStamina = ChaseStamina_GetMax();

    if (gSaveBlock1Ptr->staminaCurrent > maxStamina)
        gSaveBlock1Ptr->staminaCurrent = maxStamina;
}

static void RefillStamina(void)
{
    gSaveBlock1Ptr->staminaCurrent = ChaseStamina_GetMax();
}

bool8 ChaseStamina_IsChaseActive(void)
{
    return sActiveChasers != 0 && sChaseStepsRemaining != 0;
}

static bool8 IsValidChaseEncounterContext(u32 metatileAttributes)
{
    u8 encounterType = ExtractMetatileAttribute(metatileAttributes, METATILE_ATTRIBUTE_ENCOUNTER_TYPE);

    if (encounterType == TILE_ENCOUNTER_LAND)
        return TRUE;

    if (encounterType == TILE_ENCOUNTER_WATER)
        return TRUE;

    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING)
     && MetatileBehavior_IsBridge(ExtractMetatileAttribute(metatileAttributes, METATILE_ATTRIBUTE_BEHAVIOR)))
        return TRUE;

    return FALSE;
}

static void EndChase(void)
{
    sActiveChasers = 0;
    sChaseStepsRemaining = 0;
    sChaseReengageStepCountdown = 0;
}

static void ResetChaseReengageStepCountdown(void)
{
    sChaseReengageStepCountdown = 0;
}

static void RollChaseReengageStepCountdown(void)
{
    sChaseReengageStepCountdown = (Random() % (CHASE_REENGAGE_COUNTDOWN_MAX - CHASE_REENGAGE_COUNTDOWN_MIN + 1)) + CHASE_REENGAGE_COUNTDOWN_MIN;
}

static u16 GetChaseSpecies(void)
{
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        u16 species = GetMonData(&gEnemyParty[i], MON_DATA_SPECIES);

        if (species != SPECIES_NONE)
            return species;
    }

    return SPECIES_BULBASAUR;
}

static u16 GetAreaAdjustedChaseLength(u16 chaseLength)
{
    switch (gMapHeader.mapType)
    {
    case MAP_TYPE_ROUTE:
    case MAP_TYPE_OCEAN_ROUTE:
        chaseLength += CHASE_AREA_ROUTE_BONUS;
        break;
    case MAP_TYPE_UNDERGROUND:
        chaseLength += CHASE_AREA_UNDERGROUND_BONUS;
        break;
    case MAP_TYPE_INDOOR:
        if (chaseLength > CHASE_AREA_INDOOR_PENALTY)
            chaseLength -= CHASE_AREA_INDOOR_PENALTY;
        break;
    }

    return chaseLength;
}

static u16 GetChaseLengthForEncounter(void)
{
    u16 species = GetChaseSpecies();
    u16 chaseLength = CHASE_BASE_STEPS + sActiveChasers * CHASE_EXTRA_STEPS_PER_CHASER;

    chaseLength += species % CHASE_SPECIES_VARIANCE_MAX;
    chaseLength = GetAreaAdjustedChaseLength(chaseLength);

    if (chaseLength < CHASE_STEPS_MIN)
        chaseLength = CHASE_STEPS_MIN;
    if (chaseLength > CHASE_STEPS_MAX)
        chaseLength = CHASE_STEPS_MAX;

    return chaseLength;
}

static u32 GetStaminaUpgradeCost(u8 nextLevel)
{
    return STAMINA_UPGRADE_COST_BASE + (nextLevel - STAMINA_LEVEL_MIN) * STAMINA_UPGRADE_COST_STEP;
}

u8 ChaseStamina_GetCurrent(void)
{
    ClampCurrentStamina();
    return gSaveBlock1Ptr->staminaCurrent;
}

u8 ChaseStamina_GetActiveChasers(void)
{
    return sActiveChasers;
}

u16 ChaseStamina_GetChaseStepsRemaining(void)
{
    return sChaseStepsRemaining;
}

u16 PkmnCenterStaminaUpgrade_Preview(void)
{
    u8 level = GetStaminaLevel();
    u8 nextLevel;
    u32 cost;
    u32 souls;

    if (level >= STAMINA_LEVEL_MAX)
        return STAMINA_UPGRADE_FAIL_MAX;

    nextLevel = level + 1;
    cost = GetStaminaUpgradeCost(nextLevel);
    souls = GetMoney(&gSaveBlock1Ptr->money);
    ConvertIntToDecimalStringN(gStringVar1, cost, STR_CONV_MODE_LEFT_ALIGN, 10);
    ConvertIntToDecimalStringN(gStringVar2, nextLevel, STR_CONV_MODE_LEFT_ALIGN, 2);

    if (souls < cost)
        return STAMINA_UPGRADE_FAIL_NOT_ENOUGH_SOULS;

    return STAMINA_UPGRADE_SUCCESS;
}

u16 PkmnCenterStaminaUpgrade_Purchase(void)
{
    u8 level = GetStaminaLevel();
    u8 nextLevel;
    u32 cost;

    if (level >= STAMINA_LEVEL_MAX)
        return STAMINA_UPGRADE_FAIL_MAX;

    nextLevel = level + 1;
    cost = GetStaminaUpgradeCost(nextLevel);
    if (!IsEnoughMoney(&gSaveBlock1Ptr->money, cost))
        return STAMINA_UPGRADE_FAIL_NOT_ENOUGH_SOULS;

    RemoveMoney(&gSaveBlock1Ptr->money, cost);
    gSaveBlock1Ptr->staminaLevel = nextLevel;
    RefillStamina();
    return STAMINA_UPGRADE_SUCCESS;
}

bool8 ChaseStamina_CanUseRunStep(void)
{
    ClampCurrentStamina();
    return gSaveBlock1Ptr->staminaCurrent != 0;
}

void ChaseStamina_ConsumeRunStep(void)
{
    if (gSaveBlock1Ptr->staminaCurrent != 0)
        gSaveBlock1Ptr->staminaCurrent--;

    sStaminaRegenDelay = STAMINA_REGEN_DELAY_FRAMES;
    sStaminaRegenTick = 0;
}

void ChaseStamina_UpdateOverworldFrame(bool8 tookStep)
{
    ClampCurrentStamina();

    if (sStaminaRegenDelay != 0)
        sStaminaRegenDelay--;
    else if (gSaveBlock1Ptr->staminaCurrent < ChaseStamina_GetMax())
    {
        if (++sStaminaRegenTick >= STAMINA_REGEN_TICK_FRAMES)
        {
            sStaminaRegenTick = 0;
            gSaveBlock1Ptr->staminaCurrent++;
        }
    }

    if (!tookStep)
        return;

    if (ChaseStamina_IsChaseActive())
    {
        sChaseStepsRemaining--;
        if (sChaseStepsRemaining == 0)
        {
            EndChase();
        }
        else if (sChaseReengageStepCountdown != 0)
        {
            sChaseReengageStepCountdown--;
        }
    }
}

bool8 ChaseStamina_TryStartChaseEncounter(u32 metatileAttributes)
{
    if (!ChaseStamina_IsChaseActive())
        return FALSE;

    if (sChaseReengageStepCountdown != 0)
        return FALSE;

    if (!IsValidChaseEncounterContext(metatileAttributes))
        return FALSE;

    if (SweetScentWildEncounter())
    {
        ResetChaseReengageStepCountdown();
        sPendingWildFirstMovePriority = TRUE;
        return TRUE;
    }

    return FALSE;
}

bool8 ChaseStamina_ShouldSuppressRandomEncounters(void)
{
    return ChaseStamina_IsChaseActive();
}

void ChaseStamina_OnWildBattleEnded(u8 battleOutcome, u32 battleTypeFlags)
{
    bool8 wasChaseBattle = sBattleUsesWildFirstMovePriority;

    sBattleUsesWildFirstMovePriority = FALSE;

    if (battleTypeFlags & BATTLE_TYPE_TRAINER)
        return;

    if (!wasChaseBattle)
        return;

    switch (battleOutcome)
    {
    case B_OUTCOME_RAN:
    {
        u16 chaseLength;

        if (sActiveChasers < CHASE_MAX_CHASERS)
            sActiveChasers++;

        chaseLength = GetChaseLengthForEncounter();
        if (sChaseStepsRemaining < chaseLength)
            sChaseStepsRemaining = chaseLength;
        RollChaseReengageStepCountdown();
        break;
    }

    case B_OUTCOME_CAUGHT:
    case B_OUTCOME_WON:
    {
        if (sActiveChasers != 0)
            sActiveChasers--;
        if (sActiveChasers == 0)
            EndChase();
        break;
    }

    case B_OUTCOME_LOST:
    case B_OUTCOME_DREW:
    case B_OUTCOME_PLAYER_TELEPORTED:
    case B_OUTCOME_MON_FLED:
    case B_OUTCOME_NO_SAFARI_BALLS:
    case B_OUTCOME_FORFEITED:
    case B_OUTCOME_MON_TELEPORTED:
    case B_OUTCOME_LINK_BATTLE_RAN:
        // Forced-end and escape outcomes clear the chase to keep its state deterministic.
        EndChase();
        break;

    default:
        // Any unknown outcome is treated as a forced end to avoid stale chase state.
        EndChase();
        break;
    }
}

void ChaseStamina_OnBattleStart(void)
{
    sBattleUsesWildFirstMovePriority = sPendingWildFirstMovePriority;
    sPendingWildFirstMovePriority = FALSE;
}

bool8 ChaseStamina_ShouldPrioritizeWildOpponent(u8 battler1, u8 battler2)
{
    if (!sBattleUsesWildFirstMovePriority)
        return FALSE;
    if (gBattleResults.battleTurnCounter != 0)
        return FALSE;
    if (gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_DOUBLE))
        return FALSE;

    return (GetBattlerSide(battler1) == B_SIDE_PLAYER && GetBattlerSide(battler2) == B_SIDE_OPPONENT)
        || (GetBattlerSide(battler1) == B_SIDE_OPPONENT && GetBattlerSide(battler2) == B_SIDE_PLAYER);
}
