#include "global.h"
#include "battle.h"
#include "chase_overworld.h"
#include "chase_stamina.h"
#include "fieldmap.h"
#include "field_player_avatar.h"
#include "field_camera.h"
#include "item.h"
#include "metatile_behavior.h"
#include "money.h"
#include "overworld.h"
#include "party_menu.h"
#include "pokemon.h"
#include "random.h"
#include "string_util.h"
#include "strings.h"
#include "wild_encounter.h"
#include "battle_anim.h"
#include "event_data.h"
#include "field_message_box.h"
#include "script.h"
#include "overworld_hud.h"
#include "palette.h"
#include "constants/battle.h"
#include "constants/flags.h"
#include "constants/map_types.h"

#define STAMINA_LEVEL_MIN 1
#define STAMINA_LEVEL_MAX 10
#define STAMINA_BASE_STEPS 30
#define STAMINA_STEPS_PER_LEVEL 15
#define STAMINA_UPGRADE_COST_BASE 1200
#define STAMINA_UPGRADE_COST_STEP 800

#define STAMINA_REGEN_DELAY_FRAMES 45
#define STAMINA_REGEN_TICK_FRAMES 8
#define STAMINA_EXHAUSTED_COOLDOWN_FRAMES 120

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

#define CHASE_FAILURE_REMINDER_THRESHOLD 2
typedef enum
{
    CHASE_END_FEEDBACK_NONE,
    CHASE_END_FEEDBACK_ESCAPED,
    CHASE_END_FEEDBACK_ENDED,
} ChaseEndFeedback;
#define CHASE_START_TOAST_DURATION_FRAMES 90

static const u8 sChaseStartToastText[] = _("Something is chasing you!");

static EWRAM_DATA u8 sStaminaRegenDelay = 0;
static EWRAM_DATA u8 sStaminaRegenTick = 0;
static EWRAM_DATA u8 sStaminaExhaustedCooldownFrames = 0;
static EWRAM_DATA u8 sActiveChasers = 0;
static EWRAM_DATA u16 sChaseStepsRemaining = 0;
static EWRAM_DATA u8 sChaseReengageStepCountdown = 0;
static EWRAM_DATA bool8 sPendingWildFirstMovePriority = FALSE;
static EWRAM_DATA bool8 sBattleUsesWildFirstMovePriority = FALSE;
static EWRAM_DATA bool8 sPendingChaseTutorialMessage = FALSE;
static EWRAM_DATA bool8 sPendingChaseReminderMessage = FALSE;
static EWRAM_DATA u8 sConsecutiveChaseFailures = 0;
static EWRAM_DATA u8 sPendingChaseEndFeedback = CHASE_END_FEEDBACK_NONE;

static bool8 IsMapTypeChaseCompatible(u8 mapType);
static void QueueChaseTutorialIfNeeded(void);
static void QueueChaseFailureReminderIfNeeded(void);
static void TryShowPendingChaseMessage(void);

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

static bool8 IsTileChaseEncounterEligible(u8 encounterType, u8 metatileBehavior)
{
    if (encounterType == TILE_ENCOUNTER_LAND)
        return TRUE;

    if (encounterType == TILE_ENCOUNTER_WATER)
        return TRUE;

    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING)
     && MetatileBehavior_IsBridge(metatileBehavior))
        return TRUE;

    return FALSE;
}

static bool8 IsCurrentTileChaseEncounterEligible(void)
{
    s16 x;
    s16 y;
    u8 encounterType;
    u8 metatileBehavior;

    PlayerGetDestCoords(&x, &y);
    encounterType = MapGridGetMetatileAttributeAt(x, y, METATILE_ATTRIBUTE_ENCOUNTER_TYPE);
    metatileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    return IsTileChaseEncounterEligible(encounterType, metatileBehavior);
}

static bool8 IsValidChaseEncounterContext(u32 metatileAttributes)
{
    u8 encounterType = ExtractMetatileAttribute(metatileAttributes, METATILE_ATTRIBUTE_ENCOUNTER_TYPE);
    u8 metatileBehavior = ExtractMetatileAttribute(metatileAttributes, METATILE_ATTRIBUTE_BEHAVIOR);

    return IsTileChaseEncounterEligible(encounterType, metatileBehavior);
}

static bool8 IsCurrentAreaValidForActiveChase(void)
{
    if (!IsMapTypeChaseCompatible(gMapHeader.mapType))
        return FALSE;

    // Town/city/indoor maps are safe/scripted hubs that terminate active chase.
    if (gMapHeader.mapType == MAP_TYPE_TOWN
     || gMapHeader.mapType == MAP_TYPE_CITY
     || gMapHeader.mapType == MAP_TYPE_INDOOR)
        return FALSE;

    return TRUE;
}

static void QueueChaseTutorialIfNeeded(void)
{
    if (FlagGet(FLAG_SYS_CHASE_TUTORIAL_SEEN))
        return;

    FlagSet(FLAG_SYS_CHASE_TUTORIAL_SEEN);
    sPendingChaseTutorialMessage = TRUE;
}

static void QueueChaseFailureReminderIfNeeded(void)
{
    if (FlagGet(FLAG_SYS_CHASE_FAILURE_REMINDER_SEEN))
        return;

    if (sConsecutiveChaseFailures < CHASE_FAILURE_REMINDER_THRESHOLD)
        return;

    FlagSet(FLAG_SYS_CHASE_FAILURE_REMINDER_SEEN);
    sPendingChaseReminderMessage = TRUE;
}

static void TryShowPendingChaseMessage(void)
{
    const u8 *message = NULL;

    if (ScriptContext_IsEnabled() || !IsFieldMessageBoxHidden())
        return;

    if (sPendingChaseTutorialMessage)
    {
        message = gText_ChaseTutorialIntro;
        sPendingChaseTutorialMessage = FALSE;
    }
    else if (sPendingChaseReminderMessage)
    {
        message = gText_ChaseTutorialReminder;
        sPendingChaseReminderMessage = FALSE;
    }

    if (message != NULL)
        ShowFieldMessage(message);
}

static bool8 ShouldSuppressChaseStartFeedback(void)
{
    if (ScriptContext_IsEnabled())
        return TRUE;

    return gPaletteFade.active;
}

static void TryShowChaseStartFeedback(void)
{
    if (ShouldSuppressChaseStartFeedback())
        return;

    OverworldHud_ShowToast(sChaseStartToastText, CHASE_START_TOAST_DURATION_FRAMES);
    PlaySE(SE_M_SCREECH);
    SetCameraPanning(0, 2);
}

static void EndChase(bool8 shouldQueueFeedback, u8 feedbackType)
{
    bool8 wasActive = ChaseStamina_IsChaseActive();

    sActiveChasers = 0;
    sChaseStepsRemaining = 0;
    sChaseReengageStepCountdown = 0;
    ChaseOverworld_OnChaseEnded();

    if (wasActive && shouldQueueFeedback && feedbackType != CHASE_END_FEEDBACK_NONE)
        sPendingChaseEndFeedback = feedbackType;
}

static void StartChase(u8 initialChasers, u16 initialSteps)
{
    bool8 wasActive = ChaseStamina_IsChaseActive();

    if (initialChasers == 0 || initialSteps == 0)
    {
        EndChase(FALSE, CHASE_END_FEEDBACK_NONE);
        return;
    }

    if (initialChasers > CHASE_MAX_CHASERS)
        initialChasers = CHASE_MAX_CHASERS;

    sActiveChasers = initialChasers;
    sChaseStepsRemaining = initialSteps;
    sChaseReengageStepCountdown = CHASE_REENGAGE_COUNTDOWN_MIN;
    sConsecutiveChaseFailures = 0;
    QueueChaseTutorialIfNeeded();

    if (!wasActive && ChaseStamina_IsChaseActive())
        TryShowChaseStartFeedback();
}

static bool8 IsMapTypeChaseCompatible(u8 mapType)
{
    switch (mapType)
    {
    case MAP_TYPE_ROUTE:
    case MAP_TYPE_OCEAN_ROUTE:
    case MAP_TYPE_TOWN:
    case MAP_TYPE_CITY:
    case MAP_TYPE_UNDERGROUND:
    case MAP_TYPE_INDOOR:
        return TRUE;
    }

    return FALSE;
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
    // The overworld chase sprite intentionally uses Meowth as a generic placeholder
    // for "a wild Pokémon is chasing you" and not a species-accurate representation.
    return SPECIES_MEOWTH;
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
    if (sStaminaExhaustedCooldownFrames != 0)
        return FALSE;

    return gSaveBlock1Ptr->staminaCurrent != 0;
}

void ChaseStamina_ConsumeRunStep(void)
{
    u8 previousStamina = gSaveBlock1Ptr->staminaCurrent;

    if (gSaveBlock1Ptr->staminaCurrent != 0)
        gSaveBlock1Ptr->staminaCurrent--;

    if (previousStamina != 0 && gSaveBlock1Ptr->staminaCurrent == 0)
        sStaminaExhaustedCooldownFrames = STAMINA_EXHAUSTED_COOLDOWN_FRAMES;

    sStaminaRegenDelay = STAMINA_REGEN_DELAY_FRAMES;
    sStaminaRegenTick = 0;
}

void ChaseStamina_UpdateOverworldFrame(bool8 tookStep)
{
    ClampCurrentStamina();

    if (ChaseStamina_IsChaseActive() && !IsCurrentAreaValidForActiveChase())
        EndChase(TRUE, CHASE_END_FEEDBACK_ENDED);

    if (sStaminaExhaustedCooldownFrames != 0)
        sStaminaExhaustedCooldownFrames--;

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

    TryShowPendingChaseMessage();

    if (!tookStep)
        return;

    if (ChaseStamina_IsChaseActive())
    {
        sChaseStepsRemaining--;
        if (sChaseStepsRemaining == 0)
        {
            EndChase(TRUE, CHASE_END_FEEDBACK_ESCAPED);
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

    if (!IsCurrentTileChaseEncounterEligible())
        return FALSE;

    if (sActiveChasers >= 2)
    {
        u8 encounterCount = 2;

        if (GetMonsStateToDoubles() != PLAYER_HAS_TWO_USABLE_MONS)
            encounterCount = 1;

        if (!SweetScentWildEncounterWithCount(encounterCount))
            return FALSE;
    }
    else if (!SweetScentWildEncounter())
    {
        return FALSE;
    }

    sChaseReengageStepCountdown = 0;
    sPendingWildFirstMovePriority = TRUE;
    return TRUE;
}

bool8 ChaseStamina_ShouldSuppressRandomEncounters(void)
{
    if (ChaseStamina_IsChaseActive() && !IsCurrentAreaValidForActiveChase())
    {
        EndChase(TRUE, CHASE_END_FEEDBACK_ENDED);
        return FALSE;
    }

    // Once re-engage countdown expires, allow a regular encounter roll as a
    // fallback if a forced chase encounter cannot be generated this step.
    return ChaseStamina_IsChaseActive() && sChaseReengageStepCountdown != 0;
}


static bool8 IsEscapeLikeWildOutcome(u8 normalizedOutcome)
{
    switch (normalizedOutcome)
    {
    case B_OUTCOME_RAN:
    case B_OUTCOME_PLAYER_TELEPORTED:
    case B_OUTCOME_MON_TELEPORTED:
        // Start chase when the player successfully disengages from a wild battle.
        return TRUE;
    case B_OUTCOME_MON_FLED:
        // Wild-mon flee is not player-driven escape and should not initialize chase.
        return FALSE;
    }

    return FALSE;
}

void ChaseStamina_OnWildBattleEnded(u8 battleOutcome, u32 battleTypeFlags)
{
    bool8 wasChaseBattle = sBattleUsesWildFirstMovePriority;
    u8 normalizedOutcome = battleOutcome & ~B_OUTCOME_LINK_BATTLE_RAN;

    sBattleUsesWildFirstMovePriority = FALSE;

    if (battleTypeFlags & BATTLE_TYPE_TRAINER)
        return;

    if (!wasChaseBattle)
    {
        // Initialize a chase only when the player actively leaves a normal
        // wild battle (running or teleporting). Wild-forced endings such as
        // B_OUTCOME_MON_FLED do not indicate player pressure and should not
        // create a new chase state.
        if (IsEscapeLikeWildOutcome(normalizedOutcome)
         && !ChaseStamina_IsChaseActive())
            StartChase(1, CHASE_BASE_STEPS);
        return;
    }

    switch (normalizedOutcome)
    {
    case B_OUTCOME_RAN:
    case B_OUTCOME_PLAYER_TELEPORTED:
    {
        u16 chaseLength;

        if (sActiveChasers < CHASE_MAX_CHASERS)
            sActiveChasers++;

        chaseLength = GetChaseLengthForEncounter();
        if (sChaseStepsRemaining < chaseLength)
            sChaseStepsRemaining = chaseLength;
        RollChaseReengageStepCountdown();
        if (sConsecutiveChaseFailures < 255)
            sConsecutiveChaseFailures++;
        QueueChaseFailureReminderIfNeeded();
        break;
    }

    case B_OUTCOME_CAUGHT:
    case B_OUTCOME_WON:
    {
        if (sActiveChasers != 0)
            sActiveChasers--;
        sConsecutiveChaseFailures = 0;
        if (sActiveChasers == 0)
            EndChase(TRUE, CHASE_END_FEEDBACK_ENDED);
        break;
    }

    case B_OUTCOME_LOST:
    case B_OUTCOME_DREW:
    case B_OUTCOME_MON_FLED:
    case B_OUTCOME_NO_SAFARI_BALLS:
    case B_OUTCOME_FORFEITED:
    case B_OUTCOME_MON_TELEPORTED:
    case B_OUTCOME_LINK_BATTLE_RAN:
        // Forced-end and escape outcomes clear the chase to keep its state deterministic.
        sConsecutiveChaseFailures = 0;
        EndChase(FALSE, CHASE_END_FEEDBACK_NONE);
        break;

    default:
        // Any unknown outcome is treated as a forced end to avoid stale chase state.
        sConsecutiveChaseFailures = 0;
        EndChase(FALSE, CHASE_END_FEEDBACK_NONE);
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

enum ChaseTransitionResult ChaseStamina_OnMapTransition(const struct WarpData *from, const struct WarpData *to)
{
    const struct MapHeader *fromMap;
    const struct MapHeader *toMap;

    if (!ChaseStamina_IsChaseActive())
        return CHASE_TRANSITION_NO_ACTIVE_CHASE;

    if (from == NULL || to == NULL)
    {
        EndChase(TRUE, CHASE_END_FEEDBACK_ENDED);
        return CHASE_TRANSITION_ENDED_CONTEXT_CHANGE;
    }

    fromMap = Overworld_GetMapHeaderByGroupAndId(from->mapGroup, from->mapNum);
    toMap = Overworld_GetMapHeaderByGroupAndId(to->mapGroup, to->mapNum);
    if (fromMap == NULL || toMap == NULL)
    {
        EndChase(TRUE, CHASE_END_FEEDBACK_ENDED);
        return CHASE_TRANSITION_ENDED_CONTEXT_CHANGE;
    }

    if (from->mapGroup != to->mapGroup || from->mapNum != to->mapNum)
    {
        if (!IsMapTypeChaseCompatible(toMap->mapType))
        {
            EndChase(TRUE, CHASE_END_FEEDBACK_ENDED);
            return CHASE_TRANSITION_ENDED_SAFE_ZONE;
        }
    }

    if (IsMapTypeOutdoors(fromMap->mapType) != IsMapTypeOutdoors(toMap->mapType))
    {
        EndChase(TRUE, CHASE_END_FEEDBACK_ENDED);
        return CHASE_TRANSITION_ENDED_SAFE_ZONE;
    }

    if (fromMap->regionMapSectionId != toMap->regionMapSectionId)
    {
        EndChase(TRUE, CHASE_END_FEEDBACK_ENDED);
        return CHASE_TRANSITION_ENDED_SAFE_ZONE;
    }

    return CHASE_TRANSITION_PERSISTS;
}

const u8 *ChaseStamina_TryConsumeEndFeedback(void)
{
    const u8 *message = NULL;

    switch (sPendingChaseEndFeedback)
    {
    case CHASE_END_FEEDBACK_ESCAPED:
        message = gText_YouGotAway;
        break;
    case CHASE_END_FEEDBACK_ENDED:
        message = gText_TheChaseEnded;
        break;
    }

    sPendingChaseEndFeedback = CHASE_END_FEEDBACK_NONE;
    return message;
}
