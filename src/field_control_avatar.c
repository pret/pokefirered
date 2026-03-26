#include "global.h"
#include "gflib.h"
#include "bike.h"
#include "coord_event_weather.h"
#include "daycare.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "fieldmap.h"
#include "field_control_avatar.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "field_poison.h"
#include "field_specials.h"
#include "item_menu.h"
#include "link.h"
#include "wonder_news.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "renewable_hidden_items.h"
#include "quest_log.h"
#include "safari_zone.h"
#include "script.h"
#include "start_menu.h"
#include "trainer_see.h"
#include "vs_seeker.h"
#include "wild_encounter.h"
#include "constants/songs.h"
#include "constants/event_bg.h"
#include "constants/event_objects.h"
#include "constants/maps.h"
#include "constants/metatile_behaviors.h"

#define SIGNPOST_POKECENTER 0
#define SIGNPOST_POKEMART 1
#define SIGNPOST_INDIGO_1 2
#define SIGNPOST_INDIGO_2 3
#define SIGNPOST_SCRIPTED 240
#define SIGNPOST_NA 255

static void QuestLogOverrideJoyVars(struct FieldInput *input, u16 *newKeys, u16 *heldKeys);
static void Task_QuestLogPlayback_OpenStartMenu(u8 taskId);
static void GetPlayerPosition(struct MapPosition * position);
static void GetInFrontOfPlayerPosition(struct MapPosition * position);
static u16 GetPlayerCurMetatileBehavior(void);
static bool8 TryStartInteractionScript(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
static const u8 *GetInteractionScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
static const u8 *GetInteractedObjectEventScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
static const u8 *GetInteractedBackgroundEventScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
static const struct BgEvent *GetBackgroundEventAtPosition(struct MapHeader *, u16, u16, u8);
static const u8 *GetInteractedMetatileScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
static const u8 *GetInteractedWaterScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
static bool8 TryStartStepBasedScript(struct MapPosition * position, u16 metatileBehavior, u16 playerDirection);
static bool8 TryStartCoordEventScript(struct MapPosition * position);
static bool8 TryStartMiscWalkingScripts(u16 metatileBehavior);
static bool8 TryStartStepCountScript(u16 metatileBehavior);
static void UpdateHappinessStepCounter(void);
static bool8 UpdatePoisonStepCounter(void);
static bool8 CheckStandardWildEncounter(u32 metatileAttributes);
static bool8 TrySetUpWalkIntoSignpostScript(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
static void SetUpWalkIntoSignScript(const u8 *script, u8 playerDirection);
static u8 GetFacingSignpostType(u16 metatileBehvaior, u8 direction);
static const u8 *GetSignpostScriptAtMapPosition(struct MapPosition * position);
static bool8 TryArrowWarp(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
static bool8 TryStartWarpEventScript(struct MapPosition * position, u16 metatileBehavior);
static bool8 IsWarpMetatileBehavior(u16 metatileBehavior);
static void SetupWarp(struct MapHeader * mapHeader, s8 warpId, struct MapPosition * position);
static bool8 IsArrowWarpMetatileBehavior(u16 metatileBehavior, u8 playerDirection);
static s8 GetWarpEventAtMapPosition(struct MapHeader * mapHeader, struct MapPosition * mapPosition);
static bool8 TryDoorWarp(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
static s8 GetWarpEventAtPosition(struct MapHeader * mapHeader, u16 x, u16 y, u8 z);
static const u8 *GetCoordEventScriptAtPosition(struct MapHeader * mapHeader, u16 x, u16 y, u8 z);

COMMON_DATA struct FieldInput gFieldInputRecord = {0};

void FieldClearPlayerInput(struct FieldInput *input)
{
    input->pressedAButton = FALSE;
    input->checkStandardWildEncounter = FALSE;
    input->pressedStartButton = FALSE;
    input->pressedSelectButton = FALSE;
    input->heldDirection = FALSE;
    input->heldDirection2 = FALSE;
    input->tookStep = FALSE;
    input->pressedBButton = FALSE;
    input->pressedRButton = FALSE;
    input->input_field_1_0 = FALSE;
    input->input_field_1_1 = FALSE;
    input->input_field_1_2 = FALSE;
    input->input_field_1_3 = FALSE;
    input->dpadDirection = 0;
}

void FieldGetPlayerInput(struct FieldInput *input, u16 newKeys, u16 heldKeys)
{
    u8 runningState = gPlayerAvatar.runningState;
    u8 tileTransitionState = gPlayerAvatar.tileTransitionState;
    bool8 forcedMove = MetatileBehavior_IsForcedMovementTile(GetPlayerCurMetatileBehavior());

    if (!ScriptContext_IsEnabled() && IsQuestLogInputDpad() == TRUE)
    {
        QuestLogOverrideJoyVars(input, &newKeys, &heldKeys);
    }
    if ((tileTransitionState == T_TILE_CENTER && forcedMove == FALSE) || tileTransitionState == T_NOT_MOVING)
    {
        if (GetPlayerSpeed() != PLAYER_SPEED_FASTEST)
        {
            if ((newKeys & START_BUTTON) && !(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_FORCED))
                input->pressedStartButton = TRUE;
            if (!QL_IS_PLAYBACK_STATE)
            {
                if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_FORCED))
                {
                    if (newKeys & SELECT_BUTTON)
                        input->pressedSelectButton = TRUE;
                    if (newKeys & A_BUTTON)
                        input->pressedAButton = TRUE;
                    if (newKeys & B_BUTTON)
                        input->pressedBButton = TRUE;
                    if (newKeys & R_BUTTON)
                        input->pressedRButton = TRUE;
                }
            }
        }

        if (!QL_IS_PLAYBACK_STATE)
        {
            if (heldKeys & (DPAD_UP | DPAD_DOWN | DPAD_LEFT | DPAD_RIGHT))
            {
                input->heldDirection = TRUE;
                input->heldDirection2 = TRUE;
            }
        }

    }

    if (forcedMove == FALSE)
    {
        if (tileTransitionState == T_TILE_CENTER && runningState == MOVING)
            input->tookStep = TRUE;
        if (forcedMove == FALSE && tileTransitionState == T_TILE_CENTER)
            input->checkStandardWildEncounter = TRUE;
    }

    if (!QL_IS_PLAYBACK_STATE)
    {
        if (heldKeys & DPAD_UP)
            input->dpadDirection = DIR_NORTH;
        else if (heldKeys & DPAD_DOWN)
            input->dpadDirection = DIR_SOUTH;
        else if (heldKeys & DPAD_LEFT)
            input->dpadDirection = DIR_WEST;
        else if (heldKeys & DPAD_RIGHT)
            input->dpadDirection = DIR_EAST;
    }
}

static void QuestLogOverrideJoyVars(struct FieldInput *input, u16 *newKeys, u16 *heldKeys)
{
    switch (GetRegisteredQuestLogInput())
    {
    case QL_INPUT_OFF:
        break;
    case QL_INPUT_UP:
        *heldKeys = *newKeys = DPAD_UP;
        break;
    case QL_INPUT_DOWN:
        *heldKeys = *newKeys = DPAD_DOWN;
        break;
    case QL_INPUT_LEFT:
        *heldKeys = *newKeys = DPAD_LEFT;
        break;
    case QL_INPUT_RIGHT:
        *heldKeys = *newKeys = DPAD_RIGHT;
        break;
    case QL_INPUT_L:
        *heldKeys = *newKeys = L_BUTTON;
        break;
    case QL_INPUT_R:
        *heldKeys = *newKeys = R_BUTTON;
        break;
    case QL_INPUT_START:
        *heldKeys = *newKeys = START_BUTTON;
        break;
    case QL_INPUT_SELECT:
        *heldKeys = *newKeys = SELECT_BUTTON;
        break;
    }
    ClearQuestLogInputIsDpadFlag();
    ClearQuestLogInput();
}

int ProcessPlayerFieldInput(struct FieldInput *input)
{
    struct MapPosition position;
    u8 playerDirection;
    u16 metatileBehavior;
    u32 metatileAttributes;

    ResetFacingNpcOrSignpostVars();
    playerDirection = GetPlayerFacingDirection();
    GetPlayerPosition(&position);
    metatileAttributes = MapGridGetMetatileAttributeAt(position.x, position.y, METATILE_ATTRIBUTES_ALL);
    metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);

    FieldClearPlayerInput(&gFieldInputRecord);
    gFieldInputRecord.dpadDirection = input->dpadDirection;

    if (CheckForTrainersWantingBattle() == TRUE)
        return TRUE;

    if (TryRunOnFrameMapScript() == TRUE)
        return TRUE;

    if (input->tookStep)
    {
        IncrementGameStat(GAME_STAT_STEPS);
        WonderNews_IncrementStepCounter();
        IncrementRenewableHiddenItemStepCounter();
        RunMassageCooldownStepCounter();
        IncrementResortGorgeousStepCounter();
        IncrementBirthIslandRockStepCount();
        if (TryStartStepBasedScript(&position, metatileBehavior, playerDirection) == TRUE)
        {
            gFieldInputRecord.tookStep = TRUE;
            return TRUE;
        }
    }
    if (input->checkStandardWildEncounter)
    {
        if (input->dpadDirection == 0 || input->dpadDirection == playerDirection)
        {
            GetInFrontOfPlayerPosition(&position);
            metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);
            if (TrySetUpWalkIntoSignpostScript(&position, metatileBehavior, playerDirection) == TRUE)
            {
                gFieldInputRecord.checkStandardWildEncounter = TRUE;
                return TRUE;
            }
            GetPlayerPosition(&position);
            metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);
        }
    }
    if (input->checkStandardWildEncounter && CheckStandardWildEncounter(metatileAttributes) == TRUE)
    {
        gFieldInputRecord.checkStandardWildEncounter = TRUE;
        return TRUE;
    }
    if (input->heldDirection && input->dpadDirection == playerDirection)
    {
        if (TryArrowWarp(&position, metatileBehavior, playerDirection) == TRUE)
        {
            gFieldInputRecord.heldDirection = TRUE;
            return TRUE;
        }
    }

    GetInFrontOfPlayerPosition(&position);
    metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);
    if (input->heldDirection && input->dpadDirection == playerDirection)
    {
        if (TrySetUpWalkIntoSignpostScript(&position, metatileBehavior, playerDirection) == TRUE)
        {
            gFieldInputRecord.heldDirection = TRUE;
            return TRUE;
        }
    }

    if (input->pressedAButton && TryStartInteractionScript(&position, metatileBehavior, playerDirection) == TRUE)
    {
        gFieldInputRecord.pressedAButton = TRUE;
        return TRUE;
    }

    if (input->heldDirection2 && input->dpadDirection == playerDirection)
    {
        if (TryDoorWarp(&position, metatileBehavior, playerDirection) == TRUE)
        {
            gFieldInputRecord.heldDirection2 = TRUE;
            return TRUE;
        }
    }

    if (input->pressedStartButton)
    {
        gFieldInputRecord.pressedStartButton = TRUE;
        FlagSet(FLAG_OPENED_START_MENU);
        PlaySE(SE_WIN_OPEN);
        ShowStartMenu();
        return TRUE;
    }
    if (input->pressedSelectButton && UseRegisteredKeyItemOnField() == TRUE)
    {
        gFieldInputRecord.pressedSelectButton = TRUE;
        return TRUE;
    }

    return FALSE;
}

void FieldInput_HandleCancelSignpost(struct FieldInput * input)
{
    if (ScriptContext_IsEnabled() == TRUE)
    {
        if (gWalkAwayFromSignInhibitTimer != 0)
            gWalkAwayFromSignInhibitTimer--;
        else if (CanWalkAwayToCancelMsgBox() == TRUE)
        {
            if (input->dpadDirection != 0 && GetPlayerFacingDirection() != input->dpadDirection)
            {
                if (IsMsgBoxWalkawayDisabled() == TRUE)
                    return;
                if (input->dpadDirection == DIR_NORTH)
                    RegisterQuestLogInput(QL_INPUT_UP);
                else if (input->dpadDirection == DIR_SOUTH)
                    RegisterQuestLogInput(QL_INPUT_DOWN);
                else if (input->dpadDirection == DIR_WEST)
                    RegisterQuestLogInput(QL_INPUT_LEFT);
                else if (input->dpadDirection == DIR_EAST)
                    RegisterQuestLogInput(QL_INPUT_RIGHT);
                ScriptContext_SetupScript(EventScript_CancelMessageBox);
                LockPlayerFieldControls();
            }
            else if (input->pressedStartButton)
            {
                ScriptContext_SetupScript(EventScript_CancelMessageBox);
                LockPlayerFieldControls();
                if (!FuncIsActiveTask(Task_QuestLogPlayback_OpenStartMenu))
                    CreateTask(Task_QuestLogPlayback_OpenStartMenu, 8);
            }
        }
    }
}

static void Task_QuestLogPlayback_OpenStartMenu(u8 taskId)
{
    if (!ArePlayerFieldControlsLocked())
    {
        PlaySE(SE_WIN_OPEN);
        ShowStartMenu();
        DestroyTask(taskId);
    }
}

static void GetPlayerPosition(struct MapPosition *position)
{
    PlayerGetDestCoords(&position->x, &position->y);
    position->elevation = PlayerGetElevation();
}

static void GetInFrontOfPlayerPosition(struct MapPosition *position)
{
    s16 x, y;

    GetXYCoordsOneStepInFrontOfPlayer(&position->x, &position->y);
    PlayerGetDestCoords(&x, &y);
    if (MapGridGetElevationAt(x, y) != 0)
        position->elevation = PlayerGetElevation();
    else
        position->elevation = 0;
}

static u16 GetPlayerCurMetatileBehavior(void)
{
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    return MapGridGetMetatileBehaviorAt(x, y);
}

static bool8 TryStartInteractionScript(struct MapPosition *position, u16 metatileBehavior, u8 direction)
{
    const u8 *script = GetInteractionScript(position, metatileBehavior, direction);
    if (script == NULL)
        return FALSE;

    // Don't play interaction sound for certain scripts.
    if (script != PalletTown_PlayersHouse_2F_EventScript_PC
        && script != EventScript_PC)
        PlaySE(SE_SELECT);

    ScriptContext_SetupScript(script);
    return TRUE;
}

static const u8 *GetInteractionScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    const u8 *script = GetInteractedObjectEventScript(position, metatileBehavior, direction);
    if (script != NULL)
        return script;

    script = GetInteractedBackgroundEventScript(position, metatileBehavior, direction);
    if (script != NULL)
        return script;

    script = GetInteractedMetatileScript(position, metatileBehavior, direction);
    if (script != NULL)
        return script;

    script = GetInteractedWaterScript(position, metatileBehavior, direction);
    if (script != NULL)
        return script;

    return NULL;
}

const u8 *GetInteractedLinkPlayerScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    u8 objectEventId;
    s32 i;

    if (!MetatileBehavior_IsCounter(MapGridGetMetatileBehaviorAt(position->x, position->y)))
        objectEventId = GetObjectEventIdByPosition(position->x, position->y, position->elevation);
    else
        objectEventId = GetObjectEventIdByPosition(position->x + gDirectionToVectors[direction].x, position->y + gDirectionToVectors[direction].y, position->elevation);

    if (objectEventId == OBJECT_EVENTS_COUNT || gObjectEvents[objectEventId].localId == OBJ_EVENT_ID_PLAYER)
        return NULL;

    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        if (gLinkPlayerObjectEvents[i].active == TRUE && gLinkPlayerObjectEvents[i].objEventId == objectEventId)
            return NULL;
    }

    gSelectedObjectEvent = objectEventId;
    gSpecialVar_LastTalked = gObjectEvents[objectEventId].localId;
    gSpecialVar_Facing = direction;
    return GetObjectEventScriptPointerByObjectEventId(objectEventId);
}

static const u8 *GetInteractedObjectEventScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    u8 objectEventId;
    const u8 *script;

    objectEventId = GetObjectEventIdByPosition(position->x, position->y, position->elevation);
    if (objectEventId == OBJECT_EVENTS_COUNT || gObjectEvents[objectEventId].localId == OBJ_EVENT_ID_PLAYER)
    {
        if (MetatileBehavior_IsCounter(metatileBehavior) != TRUE)
            return NULL;

        // Look for an object event on the other side of the counter.
        objectEventId = GetObjectEventIdByPosition(position->x + gDirectionToVectors[direction].x, position->y + gDirectionToVectors[direction].y, position->elevation);
        if (objectEventId == OBJECT_EVENTS_COUNT || gObjectEvents[objectEventId].localId == OBJ_EVENT_ID_PLAYER)
            return NULL;
    }

    if (InUnionRoom() == TRUE && !ObjectEventCheckHeldMovementStatus(&gObjectEvents[objectEventId]))
        return NULL;

    gSelectedObjectEvent = objectEventId;
    gSpecialVar_LastTalked = gObjectEvents[objectEventId].localId;
    gSpecialVar_Facing = direction;

    script = GetObjectEventScriptPointerByObjectEventId(objectEventId);

    script = GetRamScript(gSpecialVar_LastTalked, script);
    return script;
}

static const u8 *GetInteractedBackgroundEventScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    u8 signpostType;
    const struct BgEvent *bgEvent = GetBackgroundEventAtPosition(&gMapHeader, position->x - MAP_OFFSET, position->y - MAP_OFFSET, position->elevation);

    if (bgEvent == NULL)
        return NULL;
    if (bgEvent->bgUnion.script == NULL)
        return EventScript_TestSignpostMsg;

    signpostType = GetFacingSignpostType(metatileBehavior, direction);

    switch (bgEvent->kind)
    {
    case BG_EVENT_PLAYER_FACING_ANY:
    default:
        break;
    case BG_EVENT_PLAYER_FACING_NORTH:
        if (direction != DIR_NORTH)
            return NULL;
        break;
    case BG_EVENT_PLAYER_FACING_SOUTH:
        if (direction != DIR_SOUTH)
            return NULL;
        break;
    case BG_EVENT_PLAYER_FACING_EAST:
        if (direction != DIR_EAST)
            return NULL;
        break;
    case BG_EVENT_PLAYER_FACING_WEST:
        if (direction != DIR_WEST)
            return NULL;
        break;
    case 5:
    case 6:
    case BG_EVENT_HIDDEN_ITEM:
        if (GetHiddenItemAttr(bgEvent->bgUnion.hiddenItem, HIDDEN_ITEM_UNDERFOOT) == TRUE)
            return NULL;
        gSpecialVar_0x8005 = GetHiddenItemAttr(bgEvent->bgUnion.hiddenItem, HIDDEN_ITEM_ITEM);
        gSpecialVar_0x8004 = GetHiddenItemAttr(bgEvent->bgUnion.hiddenItem, HIDDEN_ITEM_FLAG);
        gSpecialVar_0x8006 = GetHiddenItemAttr(bgEvent->bgUnion.hiddenItem, HIDDEN_ITEM_QUANTITY);
        if (FlagGet(gSpecialVar_0x8004) == TRUE)
            return NULL;
        gSpecialVar_Facing = direction;
        return EventScript_HiddenItemScript;
    }

    if (signpostType != SIGNPOST_NA)
        MsgSetSignpost();
    gSpecialVar_Facing = direction;
    return bgEvent->bgUnion.script;
}

static const u8 *GetInteractedMetatileScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    gSpecialVar_Facing = direction;
    if (MetatileBehavior_IsPC(metatileBehavior) == TRUE)
        return EventScript_PC;
    if (MetatileBehavior_IsRegionMap(metatileBehavior) == TRUE)
        return EventScript_WallTownMap;
    if (MetatileBehavior_IsBookshelf(metatileBehavior) == TRUE)
        return EventScript_Bookshelf;
    if (MetatileBehavior_IsPokeMartShelf(metatileBehavior) == TRUE)
        return EventScript_PokeMartShelf;
    if (MetatileBehavior_IsFood(metatileBehavior) == TRUE)
        return EventScript_Food;
    if (MetatileBehavior_IsImpressiveMachine(metatileBehavior) == TRUE)
        return EventScript_ImpressiveMachine;
    if (MetatileBehavior_IsBlueprints(metatileBehavior) == TRUE)
        return EventScript_Blueprints;
    if (MetatileBehavior_IsVideoGame(metatileBehavior) == TRUE)
        return EventScript_VideoGame;
    if (MetatileBehavior_IsBurglary(metatileBehavior) == TRUE)
        return EventScript_Burglary;
    if (MetatileBehavior_IsComputer(metatileBehavior) == TRUE)
        return EventScript_Computer;
    if (MetatileBehavior_IsTrainerTowerMonitor(metatileBehavior) == TRUE)
        return TrainerTower_EventScript_ShowTime;
    if (MetatileBehavior_IsPlayerFacingTVScreen(metatileBehavior, direction) == TRUE)
        return EventScript_PlayerFacingTVScreen;
    if (MetatileBehavior_IsCabinet(metatileBehavior) == TRUE)
        return EventScript_Cabinet;
    if (MetatileBehavior_IsKitchen(metatileBehavior) == TRUE)
        return EventScript_Kitchen;
    if (MetatileBehavior_IsDresser(metatileBehavior) == TRUE)
        return EventScript_Dresser;
    if (MetatileBehavior_IsSnacks(metatileBehavior) == TRUE)
        return EventScript_Snacks;
    if (MetatileBehavior_IsPainting(metatileBehavior) == TRUE)
        return EventScript_Painting;
    if (MetatileBehavior_IsPowerPlantMachine(metatileBehavior) == TRUE)
        return EventScript_PowerPlantMachine;
    if (MetatileBehavior_IsTelephone(metatileBehavior) == TRUE)
        return EventScript_Telephone;
    if (MetatileBehavior_IsAdvertisingPoster(metatileBehavior) == TRUE)
        return EventScript_AdvertisingPoster;
    if (MetatileBehavior_IsTastyFood(metatileBehavior) == TRUE)
        return EventScript_TastyFood;
    if (MetatileBehavior_IsTrashBin(metatileBehavior) == TRUE)
        return EventScript_TrashBin;
    if (MetatileBehavior_IsCup(metatileBehavior) == TRUE)
        return EventScript_Cup;
    if (MetatileBehavior_IsPolishedWindow(metatileBehavior) == TRUE)
        return EventScript_PolishedWindow;
    if (MetatileBehavior_IsBeautifulSkyWindow(metatileBehavior) == TRUE)
        return EventScript_BeautifulSkyWindow;
    if (MetatileBehavior_IsBlinkingLights(metatileBehavior) == TRUE)
        return EventScript_BlinkingLights;
    if (MetatileBehavior_IsNeatlyLinedUpTools(metatileBehavior) == TRUE)
        return EventScript_NeatlyLinedUpTools;
    if (MetatileBehavior_IsPlayerFacingCableClubWirelessMonitor(metatileBehavior, direction) == TRUE)
        return CableClub_EventScript_ShowWirelessCommunicationScreen;
    if (MetatileBehavior_IsQuestionnaire(metatileBehavior) == TRUE)
        return EventScript_Questionnaire;
    if (MetatileBehavior_IsPlayerFacingBattleRecords(metatileBehavior, direction) == TRUE)
        return CableClub_EventScript_ShowBattleRecords;
    if (MetatileBehavior_IsIndigoPlateauSign1(metatileBehavior) == TRUE)
    {
        MsgSetSignpost();
        return EventScript_Indigo_UltimateGoal;
    }
    if (MetatileBehavior_IsIndigoPlateauSign2(metatileBehavior) == TRUE)
    {
        MsgSetSignpost();
        return EventScript_Indigo_HighestAuthority;
    }
    if (MetatileBehavior_IsPlayerFacingPokeMartSign(metatileBehavior, direction) == TRUE)
    {
        MsgSetSignpost();
        return EventScript_PokemartSign;
    }
    if (MetatileBehavior_IsPlayerFacingPokemonCenterSign(metatileBehavior, direction) == TRUE)
    {
        MsgSetSignpost();
        return EventScript_PokecenterSign;
    }
    return NULL;
}

static const u8 *GetInteractedWaterScript(struct MapPosition *unused1, u8 metatileBehavior, u8 direction)
{
    if (MetatileBehavior_IsFastWater(metatileBehavior) == TRUE && PartyHasMonWithSurf() == TRUE)
        return EventScript_CurrentTooFast;
    if (FlagGet(FLAG_BADGE05_GET) == TRUE && PartyHasMonWithSurf() == TRUE && IsPlayerFacingSurfableFishableWater() == TRUE)
        return EventScript_UseSurf;

    if (MetatileBehavior_IsWaterfall(metatileBehavior) == TRUE)
    {
        if (FlagGet(FLAG_BADGE07_GET) == TRUE && IsPlayerSurfingNorth() == TRUE)
            return EventScript_Waterfall;
        else
            return EventScript_CantUseWaterfall;
    }
    return NULL;
}

static bool8 TryStartStepBasedScript(struct MapPosition *position, u16 metatileBehavior, u16 direction)
{
    if (TryStartCoordEventScript(position) == TRUE)
        return TRUE;
    if (TryStartWarpEventScript(position, metatileBehavior) == TRUE)
        return TRUE;
    if (TryStartMiscWalkingScripts(metatileBehavior) == TRUE)
        return TRUE;
    if (TryStartStepCountScript(metatileBehavior) == TRUE)
        return TRUE;
    if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_FORCED) && !MetatileBehavior_IsForcedMovementTile(metatileBehavior) && UpdateRepelCounter() == TRUE)
        return TRUE;
    return FALSE;
}

static bool8 TryStartCoordEventScript(struct MapPosition *position)
{
    const u8 *script = GetCoordEventScriptAtPosition(&gMapHeader, position->x - MAP_OFFSET, position->y - MAP_OFFSET, position->elevation);

    if (script == NULL)
        return FALSE;
    ScriptContext_SetupScript(script);
    return TRUE;
}

static bool8 TryStartMiscWalkingScripts(u16 metatileBehavior)
{
    // Dummied
    return FALSE;
}

static bool8 TryStartStepCountScript(u16 metatileBehavior)
{
    if (InUnionRoom() == TRUE)
        return FALSE;
    if (gQuestLogState == QL_STATE_PLAYBACK)
        return FALSE;

    UpdateHappinessStepCounter();

    if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_FORCED) && !MetatileBehavior_IsForcedMovementTile(metatileBehavior))
    {
        if (UpdateVsSeekerStepCounter() == TRUE)
        {
            ScriptContext_SetupScript(EventScript_VsSeekerChargingDone);
            return TRUE;
        }
        else if (UpdatePoisonStepCounter() == TRUE)
        {
            ScriptContext_SetupScript(EventScript_FieldPoison);
            return TRUE;
        }
        else if (ShouldEggHatch())
        {
            IncrementGameStat(GAME_STAT_HATCHED_EGGS);
            ScriptContext_SetupScript(EventScript_EggHatch);
            return TRUE;
        }
    }
    if (SafariZoneTakeStep() == TRUE)
        return TRUE;
    return FALSE;
}

static void Unref_ClearHappinessStepCounter(void)
{
    VarSet(VAR_HAPPINESS_STEP_COUNTER, 0);
}

static void UpdateHappinessStepCounter(void)
{
    u16 *ptr = GetVarPointer(VAR_HAPPINESS_STEP_COUNTER);
    int i;

    (*ptr)++;
    (*ptr) %= 128;
    if (*ptr == 0)
    {
        struct Pokemon *mon = gPlayerParty;
        for (i = 0; i < PARTY_SIZE; i++)
        {
            AdjustFriendship(mon, FRIENDSHIP_EVENT_WALKING);
            mon++;
        }
    }
}

void ClearPoisonStepCounter(void)
{
    VarSet(VAR_POISON_STEP_COUNTER, 0);
}

static bool8 UpdatePoisonStepCounter(void)
{
    u16 *ptr;

    if (gMapHeader.mapType != MAP_TYPE_SECRET_BASE)
    {
        ptr = GetVarPointer(VAR_POISON_STEP_COUNTER);
        (*ptr)++;
        (*ptr) %= 5;
        if (*ptr == 0)
        {
            switch (DoPoisonFieldEffect())
            {
            case FLDPSN_NONE:
                return FALSE;
            case FLDPSN_PSN:
                return FALSE;
            case FLDPSN_FNT:
                return TRUE;
            }
        }
    }
    return FALSE;
}

void RestartWildEncounterImmunitySteps(void)
{
    ResetEncounterRateModifiers();
}

static bool8 CheckStandardWildEncounter(u32 metatileAttributes)
{
    return TryStandardWildEncounter(metatileAttributes);
}

static bool8 TrySetUpWalkIntoSignpostScript(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection)
{
    u8 signpostType;
    const u8 * script;
    if (JOY_HELD(DPAD_LEFT | DPAD_RIGHT))
        return FALSE;
    if (playerDirection == DIR_EAST || playerDirection == DIR_WEST)
        return FALSE;

    signpostType = GetFacingSignpostType(metatileBehavior, playerDirection);
    if (signpostType == SIGNPOST_POKECENTER)
    {
        SetUpWalkIntoSignScript(EventScript_PokecenterSign, playerDirection);
        return TRUE;
    }
    else if (signpostType == SIGNPOST_POKEMART)
    {
        SetUpWalkIntoSignScript(EventScript_PokemartSign, playerDirection);
        return TRUE;
    }
    else if (signpostType == SIGNPOST_INDIGO_1)
    {
        SetUpWalkIntoSignScript(EventScript_Indigo_UltimateGoal, playerDirection);
        return TRUE;
    }
    else if (signpostType == SIGNPOST_INDIGO_2)
    {
        SetUpWalkIntoSignScript(EventScript_Indigo_HighestAuthority, playerDirection);
        return TRUE;
    }
    else
    {
        script = GetSignpostScriptAtMapPosition(position);
        if (script == NULL)
            return FALSE;
        if (signpostType != SIGNPOST_SCRIPTED)
            return FALSE;
        SetUpWalkIntoSignScript(script, playerDirection);
        return TRUE;
    }
}

static u8 GetFacingSignpostType(u16 metatileBehavior, u8 playerDirection)
{
    if (MetatileBehavior_IsPlayerFacingPokemonCenterSign(metatileBehavior, playerDirection) == TRUE)
        return SIGNPOST_POKECENTER;

    if (MetatileBehavior_IsPlayerFacingPokeMartSign(metatileBehavior, playerDirection) == TRUE)
        return SIGNPOST_POKEMART;

    if (MetatileBehavior_IsIndigoPlateauSign1(metatileBehavior) == TRUE)
        return SIGNPOST_INDIGO_1;

    if (MetatileBehavior_IsIndigoPlateauSign2(metatileBehavior) == TRUE)
        return SIGNPOST_INDIGO_2;

    if (MetatileBehavior_IsSignpost(metatileBehavior) == TRUE)
        return SIGNPOST_SCRIPTED;

    return SIGNPOST_NA;
}

static void SetUpWalkIntoSignScript(const u8 *script, u8 playerDirection)
{
    gSpecialVar_Facing = playerDirection;
    ScriptContext_SetupScript(script);
    SetWalkingIntoSignVars();
    MsgSetSignpost();
}

static const u8 *GetSignpostScriptAtMapPosition(struct MapPosition * position)
{
    const struct BgEvent * event = GetBackgroundEventAtPosition(&gMapHeader, position->x - MAP_OFFSET, position->y - MAP_OFFSET, position->elevation);
    if (event == NULL)
        return NULL;
    if (event->bgUnion.script != NULL)
        return event->bgUnion.script;
    return EventScript_TestSignpostMsg;
}

static bool8 TryArrowWarp(struct MapPosition *position, u16 metatileBehavior, u8 direction)
{
    s8 warpEventId = GetWarpEventAtMapPosition(&gMapHeader, position);
    u16 delay;

    if (warpEventId != -1)
    {
        if (IsArrowWarpMetatileBehavior(metatileBehavior, direction) == TRUE)
        {
            StoreInitialPlayerAvatarState();
            SetupWarp(&gMapHeader, warpEventId, position);
            DoWarp();
            return TRUE;
        }
        else if (IsDirectionalStairWarpMetatileBehavior(metatileBehavior, direction) == TRUE)
        {
            delay = 0;
            if (gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
            {
                SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
                delay = 12;
            }
            StoreInitialPlayerAvatarState();
            SetupWarp(&gMapHeader, warpEventId, position);
            DoStairWarp(metatileBehavior, delay);
            return TRUE;
        }
    }
    return FALSE;
}

static bool8 TryStartWarpEventScript(struct MapPosition *position, u16 metatileBehavior)
{
    s8 warpEventId = GetWarpEventAtMapPosition(&gMapHeader, position);

    if (warpEventId != -1 && IsWarpMetatileBehavior(metatileBehavior) == TRUE)
    {
        StoreInitialPlayerAvatarState();
        SetupWarp(&gMapHeader, warpEventId, position);
        if (MetatileBehavior_IsEscalator(metatileBehavior) == TRUE)
        {
            DoEscalatorWarp(metatileBehavior);
            return TRUE;
        }
        if (MetatileBehavior_IsLavaridgeB1FWarp(metatileBehavior) == TRUE)
        {
            DoLavaridgeGymB1FWarp();
            return TRUE;
        }
        if (MetatileBehavior_IsLavaridge1FWarp(metatileBehavior) == TRUE)
        {
            DoLavaridgeGym1FWarp();
            return TRUE;
        }
        if (MetatileBehavior_IsWarpPad(metatileBehavior) == TRUE)
        {
            DoTeleportWarp();
            return TRUE;
        }
        if (MetatileBehavior_IsUnionRoomWarp(metatileBehavior) == TRUE)
        {
            DoUnionRoomWarp();
            return TRUE;
        }
        if (MetatileBehavior_IsFallWarp(metatileBehavior) == TRUE)
        {
            ResetInitialPlayerAvatarState();
            ScriptContext_SetupScript(EventScript_DoFallWarp);
            return TRUE;
        }
        DoWarp();
        return TRUE;
    }
    return FALSE;
}

static bool8 IsWarpMetatileBehavior(u16 metatileBehavior)
{
    if (MetatileBehavior_IsWarpDoor(metatileBehavior) == TRUE)
        return TRUE;
    if (MetatileBehavior_IsLadder(metatileBehavior) == TRUE)
        return TRUE;
    if (MetatileBehavior_IsEscalator(metatileBehavior) == TRUE)
        return TRUE;
    if (MetatileBehavior_IsNonAnimDoor(metatileBehavior) == TRUE)
        return TRUE;
    if (MetatileBehavior_IsLavaridgeB1FWarp(metatileBehavior) == TRUE)
        return TRUE;
    if (MetatileBehavior_IsLavaridge1FWarp(metatileBehavior) == TRUE)
        return TRUE;
    if (MetatileBehavior_IsWarpPad(metatileBehavior) == TRUE)
        return TRUE;
    if (MetatileBehavior_IsFallWarp(metatileBehavior) == TRUE)
        return TRUE;
    if (MetatileBehavior_IsUnionRoomWarp(metatileBehavior) == TRUE)
        return TRUE;
    return FALSE;
}

bool8 IsDirectionalStairWarpMetatileBehavior(u16 metatileBehavior, u8 playerDirection)
{
    switch (playerDirection)
    {
    case DIR_WEST:
        if (MetatileBehavior_IsDirectionalUpLeftStairWarp(metatileBehavior))
            return TRUE;
        if (MetatileBehavior_IsDirectionalDownLeftStairWarp(metatileBehavior))
            return TRUE;
        break;
    case DIR_EAST:
        if (MetatileBehavior_IsDirectionalUpRightStairWarp(metatileBehavior))
            return TRUE;
        if (MetatileBehavior_IsDirectionalDownRightStairWarp(metatileBehavior))
            return TRUE;
        break;
    }
    return FALSE;
}

static bool8 IsArrowWarpMetatileBehavior(u16 metatileBehavior, u8 direction)
{
    switch (direction)
    {
    case DIR_NORTH:
        return MetatileBehavior_IsNorthArrowWarp(metatileBehavior);
    case DIR_SOUTH:
        return MetatileBehavior_IsSouthArrowWarp(metatileBehavior);
    case DIR_WEST:
        return MetatileBehavior_IsWestArrowWarp(metatileBehavior);
    case DIR_EAST:
        return MetatileBehavior_IsEastArrowWarp(metatileBehavior);
    }
    return FALSE;
}

static s8 GetWarpEventAtMapPosition(struct MapHeader *mapHeader, struct MapPosition *position)
{
    return GetWarpEventAtPosition(mapHeader, position->x - MAP_OFFSET, position->y - MAP_OFFSET, position->elevation);
}

static void SetupWarp(struct MapHeader *unused, s8 warpEventId, struct MapPosition *position)
{
    const struct WarpEvent *warpEvent;

    warpEvent = &gMapHeader.events->warps[warpEventId];

    if (warpEvent->mapNum == MAP_NUM(DYNAMIC))
    {
        SetWarpDestinationToDynamicWarp(warpEvent->warpId);
    }
    else
    {
        const struct MapHeader *mapHeader;

        SetWarpDestinationToMapWarp(warpEvent->mapGroup, warpEvent->mapNum, warpEvent->warpId);
        UpdateEscapeWarp(position->x, position->y);
        mapHeader = Overworld_GetMapHeaderByGroupAndId(warpEvent->mapGroup, warpEvent->mapNum);
        if (mapHeader->events->warps[warpEvent->warpId].mapNum == MAP_NUM(DYNAMIC))
            SetDynamicWarp(mapHeader->events->warps[warpEventId].warpId, gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum, warpEventId);
    }
}

static bool8 TryDoorWarp(struct MapPosition *position, u16 metatileBehavior, u8 direction)
{
    s8 warpEventId;

    if (direction == DIR_NORTH)
    {
        if (MetatileBehavior_IsWarpDoor(metatileBehavior) == TRUE)
        {
            warpEventId = GetWarpEventAtMapPosition(&gMapHeader, position);
            if (warpEventId != -1 && IsWarpMetatileBehavior(metatileBehavior) == TRUE)
            {
                StoreInitialPlayerAvatarState();
                SetupWarp(&gMapHeader, warpEventId, position);
                DoDoorWarp();
                return TRUE;
            }
        }
    }
    return FALSE;
}

static s8 GetWarpEventAtPosition(struct MapHeader *mapHeader, u16 x, u16 y, u8 elevation)
{
    s32 i;
    const struct WarpEvent *warpEvent = mapHeader->events->warps;
    u8 warpCount = mapHeader->events->warpCount;

    for (i = 0; i < warpCount; i++, warpEvent++)
    {
        if ((u16)warpEvent->x == x && (u16)warpEvent->y == y)
        {
            if (warpEvent->elevation == elevation || warpEvent->elevation == 0)
                return i;
        }
    }
    return -1;
}

static const u8 *TryRunCoordEventScript(const struct CoordEvent *coordEvent)
{
    if (coordEvent != NULL)
    {
        if (coordEvent->script == NULL)
        {
            DoCoordEventWeather(coordEvent->trigger);
            return NULL;
        }
        if (coordEvent->trigger == 0)
        {
            RunScriptImmediately(coordEvent->script);
            return NULL;
        }
        if (VarGet(coordEvent->trigger) == (u8)coordEvent->index)
            return coordEvent->script;
    }
    return NULL;
}

static const u8 *GetCoordEventScriptAtPosition(struct MapHeader *mapHeader, u16 x, u16 y, u8 elevation)
{
    s32 i;
    const struct CoordEvent *coordEvents = mapHeader->events->coordEvents;
    u8 coordEventCount = mapHeader->events->coordEventCount;

    for (i = 0; i < coordEventCount; i++)
    {
        if ((u16)coordEvents[i].x == x && (u16)coordEvents[i].y == y)
        {
            if (coordEvents[i].elevation == elevation || coordEvents[i].elevation == 0)
            {
                const u8 *script = TryRunCoordEventScript(&coordEvents[i]);
                if (script != NULL)
                    return script;
            }
        }
    }
    return NULL;
}

void HandleBoulderFallThroughHole(struct ObjectEvent * object)
{
    if (MapGridGetMetatileBehaviorAt(object->currentCoords.x, object->currentCoords.y) == MB_FALL_WARP)
    {
        PlaySE(SE_FALL);
        RemoveObjectEventByLocalIdAndMap(object->localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
        FlagClear(GetBoulderRevealFlagByLocalIdAndMap(object->localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup));
    }
}

void HandleBoulderActivateVictoryRoadSwitch(u16 x, u16 y)
{
    int i;
    const struct CoordEvent * events = gMapHeader.events->coordEvents;
    int n = gMapHeader.events->coordEventCount;

    if (MapGridGetMetatileBehaviorAt(x, y) == MB_STRENGTH_BUTTON)
    {
        for (i = 0; i < n; i++)
        {
            if (events[i].x + MAP_OFFSET == x && events[i].y + MAP_OFFSET == y)
            {
                QuestLog_CutRecording();
                ScriptContext_SetupScript(events[i].script);
                LockPlayerFieldControls();
            }
        }
    }
}

const u8 *GetCoordEventScriptAtMapPosition(struct MapPosition *position)
{
    return GetCoordEventScriptAtPosition(&gMapHeader, position->x - MAP_OFFSET, position->y - MAP_OFFSET, position->elevation);
}

static const struct BgEvent *GetBackgroundEventAtPosition(struct MapHeader *mapHeader, u16 x, u16 y, u8 elevation)
{
    u8 i;
    const struct BgEvent *bgEvents = mapHeader->events->bgEvents;
    u8 bgEventCount = mapHeader->events->bgEventCount;

    for (i = 0; i < bgEventCount; i++)
    {
        if ((u16)bgEvents[i].x == x && (u16)bgEvents[i].y == y)
        {
            if (bgEvents[i].elevation == elevation || bgEvents[i].elevation == 0)
                return &bgEvents[i];
        }
    }
    return NULL;
}

bool8 dive_warp(struct MapPosition *position, u16 metatileBehavior)
{
    if (gMapHeader.mapType == MAP_TYPE_UNDERWATER && !MetatileBehavior_IsUnableToEmerge(metatileBehavior))
    {
        if (SetDiveWarpEmerge(position->x - MAP_OFFSET, position->y - MAP_OFFSET))
        {
            StoreInitialPlayerAvatarState();
            DoDiveWarp();
            PlaySE(SE_M_DIVE);
            return TRUE;
        }
    }
    else if (MetatileBehavior_IsDiveable(metatileBehavior) == TRUE)
    {
        if (SetDiveWarpDive(position->x - MAP_OFFSET, position->y - MAP_OFFSET))
        {
            StoreInitialPlayerAvatarState();
            DoDiveWarp();
            PlaySE(SE_M_DIVE);
            return TRUE;
        }
    }
    return FALSE;
}

static u8 TrySetDiveWarp(void)
{
    s16 x, y;
    u8 metatileBehavior;

    PlayerGetDestCoords(&x, &y);
    metatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
    if (gMapHeader.mapType == MAP_TYPE_UNDERWATER && !MetatileBehavior_IsUnableToEmerge(metatileBehavior))
    {
        if (SetDiveWarpEmerge(x - MAP_OFFSET, y - MAP_OFFSET) == TRUE)
            return 1;
    }
    else if (MetatileBehavior_IsDiveable(metatileBehavior) == TRUE)
    {
        if (SetDiveWarpDive(x - MAP_OFFSET, y - MAP_OFFSET) == TRUE)
            return 2;
    }
    return 0;
}

static const u8 *GetObjectEventScriptPointerPlayerFacing(void)
{
    u8 direction;
    struct MapPosition position;

    direction = GetPlayerMovementDirection();
    GetInFrontOfPlayerPosition(&position);
    return GetInteractedObjectEventScript(&position, MapGridGetMetatileBehaviorAt(position.x, position.y), direction);
}

int SetCableClubWarp(void)
{
    struct MapPosition position;

    GetPlayerMovementDirection();  // unnecessary
    GetPlayerPosition(&position);
    MapGridGetMetatileBehaviorAt(position.x, position.y);  // unnecessary
    SetupWarp(&gMapHeader, GetWarpEventAtMapPosition(&gMapHeader, &position), &position);
    return 0;
}
