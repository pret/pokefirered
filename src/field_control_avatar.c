#include "global.h"
#include "gflib.h"
#include "bike.h"
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
#include "menews_jisan.h"
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

void sub_806CA4C(struct FieldInput *input, u16 *newKeys, u16 *heldKeys);
bool8 sub_80699D4(void);
void sub_806CDF8(u8 taskId);
void GetPlayerPosition(struct MapPosition * position);
void GetInFrontOfPlayerPosition(struct MapPosition * position);
u16 GetPlayerCurMetatileBehavior(void);
bool8 TryStartInteractionScript(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
const u8 *GetInteractionScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
const u8 *GetInteractedObjectEventScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
const u8 *GetInteractedBackgroundEventScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
const struct BgEvent *GetBackgroundEventAtPosition(struct MapHeader *, u16, u16, u8);
const u8 *GetInteractedMetatileScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
const u8 *GetInteractedWaterScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
bool8 TryStartStepBasedScript(struct MapPosition * position, u16 metatileBehavior, u16 playerDirection);
bool8 TryStartCoordEventScript(struct MapPosition * position);
bool8 TryStartMiscWalkingScripts(u16 metatileBehavior);
bool8 TryStartStepCountScript(u16 metatileBehavior);
void UpdateHappinessStepCounter(void);
bool8 UpdatePoisonStepCounter(void);
bool8 CheckStandardWildEncounter(u32 encounter);
bool8 sub_806D804(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
void sub_806D908(const u8 *script, u8 playerDirection);
u8 sub_806D898(u16 metatileBehvaior, u8 direction);
const u8 *sub_806D928(struct MapPosition * position);
bool8 TryArrowWarp(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
bool8 TryStartWarpEventScript(struct MapPosition * position, u16 metatileBehavior);
bool8 IsWarpMetatileBehavior(u16 metatileBehavior);
bool8 sub_806DB84(u16 metatileBehavior, u8 playerDirection);
void SetupWarp(struct MapHeader * mapHeader, s8 warpId, struct MapPosition * position);
bool8 IsArrowWarpMetatileBehavior(u16 metatileBehavior, u8 playerDirection);
s8 GetWarpEventAtMapPosition(struct MapHeader * mapHeader, struct MapPosition * mapPosition);
const u8 *GetCoordEventScriptAtPosition(struct MapHeader * mapHeader, u16 x, u16 y, u8 z);
bool8 TryDoorWarp(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);

struct FieldInput gUnknown_3005078;

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

    if (!ScriptContext1_IsScriptSetUp() && sub_806997C() == TRUE)
    {
        sub_806CA4C(input, &newKeys, &heldKeys);
    }
    if ((tileTransitionState == T_TILE_CENTER && forcedMove == FALSE) || tileTransitionState == T_NOT_MOVING)
    {
        if (GetPlayerSpeed() != 4)
        {
            if ((newKeys & START_BUTTON) && !(gPlayerAvatar.flags & 0x40))
                input->pressedStartButton = TRUE;
            if (gQuestLogState != QL_STATE_2 && gQuestLogState != QL_STATE_3)
            {
                if (!(gPlayerAvatar.flags & 0x40))
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

        if (gQuestLogState != QL_STATE_2 && gQuestLogState != QL_STATE_3)
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

    if (gQuestLogState != QL_STATE_2 && gQuestLogState != QL_STATE_3)
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

void sub_806CA4C(struct FieldInput *input, u16 *newKeys, u16 *heldKeys)
{
    switch (sub_80699B0())
    {
    case 0:
        break;
    case 1:
        *heldKeys = *newKeys = DPAD_UP;
        break;
    case 2:
        *heldKeys = *newKeys = DPAD_DOWN;
        break;
    case 3:
        *heldKeys = *newKeys = DPAD_LEFT;
        break;
    case 4:
        *heldKeys = *newKeys = DPAD_RIGHT;
        break;
    case 5:
        *heldKeys = *newKeys = L_BUTTON;
        break;
    case 6:
        *heldKeys = *newKeys = R_BUTTON;
        break;
    case 7:
        *heldKeys = *newKeys = START_BUTTON;
        break;
    case 8:
        *heldKeys = *newKeys = SELECT_BUTTON;
        break;
    }
    sub_8069970();
    sub_80699A4();
}

int ProcessPlayerFieldInput(struct FieldInput *input)
{
    struct MapPosition position;
    u8 playerDirection;
    u16 metatileBehavior;
    u32 r8;

    sub_8069A54();
    playerDirection = GetPlayerFacingDirection();
    GetPlayerPosition(&position);
    r8 = MapGridGetMetatileAttributeAt(position.x, position.y, 0xFF);
    metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);

    FieldClearPlayerInput(&gUnknown_3005078);
    gUnknown_3005078.dpadDirection = input->dpadDirection;

    if (CheckForTrainersWantingBattle() == TRUE)
        return TRUE;

    if (TryRunOnFrameMapScript() == TRUE)
        return TRUE;

    if (input->tookStep)
    {
        IncrementGameStat(GAME_STAT_STEPS);
        MENewsJisanStepCounter();
        IncrementRenewableHiddenItemStepCounter();
        RunMassageCooldownStepCounter();
        IncrementResortGorgeousStepCounter();
        IncrementBirthIslandRockStepCount();
        if (TryStartStepBasedScript(&position, metatileBehavior, playerDirection) == TRUE)
        {
            gUnknown_3005078.tookStep = TRUE;
            return TRUE;
        }
    }
    if (input->checkStandardWildEncounter)
    {
        if (input->dpadDirection == 0 || input->dpadDirection == playerDirection)
        {
            GetInFrontOfPlayerPosition(&position);
            metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);
            if (sub_806D804(&position, metatileBehavior, playerDirection) == TRUE)
            {
                gUnknown_3005078.checkStandardWildEncounter = TRUE;
                return TRUE;
            }
            GetPlayerPosition(&position);
            metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);
        }
    }
    if (input->checkStandardWildEncounter && CheckStandardWildEncounter(r8) == TRUE)
    {
        gUnknown_3005078.checkStandardWildEncounter = TRUE;
        return TRUE;
    }
    if (input->heldDirection && input->dpadDirection == playerDirection)
    {
        if (TryArrowWarp(&position, metatileBehavior, playerDirection) == TRUE)
        {
            gUnknown_3005078.heldDirection = TRUE;
            return TRUE;
        }
    }

    GetInFrontOfPlayerPosition(&position);
    metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);
    if (input->heldDirection && input->dpadDirection == playerDirection)
    {
        if (sub_806D804(&position, metatileBehavior, playerDirection) == TRUE)
        {
            gUnknown_3005078.heldDirection = TRUE;
            return TRUE;
        }
    }

    if (input->pressedAButton && TryStartInteractionScript(&position, metatileBehavior, playerDirection) == TRUE)
    {
        gUnknown_3005078.pressedAButton = TRUE;
        return TRUE;
    }

    if (input->heldDirection2 && input->dpadDirection == playerDirection)
    {
        if (TryDoorWarp(&position, metatileBehavior, playerDirection) == TRUE)
        {
            gUnknown_3005078.heldDirection2 = TRUE;
            return TRUE;
        }
    }

    if (input->pressedStartButton)
    {
        gUnknown_3005078.pressedStartButton = TRUE;
        FlagSet(FLAG_OPENED_START_MENU);
        PlaySE(SE_WIN_OPEN);
        ShowStartMenu();
        return TRUE;
    }
    if (input->pressedSelectButton && UseRegisteredKeyItemOnField() == TRUE)
    {
        gUnknown_3005078.pressedSelectButton = TRUE;
        return TRUE;
    }

    return FALSE;
}

void sub_806CD30(struct FieldInput * input)
{
    if (ScriptContext1_IsScriptSetUp() == TRUE)
    {
        if (gUnknown_20370A0 != 0)
            gUnknown_20370A0--;
        else if (sub_8069A04() == TRUE)
        {
            if (input->dpadDirection != 0 && GetPlayerFacingDirection() != input->dpadDirection)
            {
                if (sub_80699D4() == TRUE)
                    return;
                if (input->dpadDirection == DIR_NORTH)
                    sub_8069998(1);
                else if (input->dpadDirection == DIR_SOUTH)
                    sub_8069998(2);
                else if (input->dpadDirection == DIR_WEST)
                    sub_8069998(3);
                else if (input->dpadDirection == DIR_EAST)
                    sub_8069998(4);
                ScriptContext1_SetupScript(gUnknown_81A7ADB);
                ScriptContext2_Enable();
            }
            else if (input->pressedStartButton)
            {
                ScriptContext1_SetupScript(gUnknown_81A7ADB);
                ScriptContext2_Enable();
                if (!FuncIsActiveTask(sub_806CDF8))
                    CreateTask(sub_806CDF8, 8);
            }
        }
    }
}

void sub_806CDF8(u8 taskId)
{
    if (!ScriptContext2_IsEnabled())
    {
        PlaySE(SE_WIN_OPEN);
        ShowStartMenu();
        DestroyTask(taskId);
    }
}

void GetPlayerPosition(struct MapPosition *position)
{
    PlayerGetDestCoords(&position->x, &position->y);
    position->height = PlayerGetZCoord();
}

void GetInFrontOfPlayerPosition(struct MapPosition *position)
{
    s16 x, y;

    GetXYCoordsOneStepInFrontOfPlayer(&position->x, &position->y);
    PlayerGetDestCoords(&x, &y);
    if (MapGridGetZCoordAt(x, y) != 0)
        position->height = PlayerGetZCoord();
    else
        position->height = 0;
}

u16 GetPlayerCurMetatileBehavior(void)
{
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    return MapGridGetMetatileBehaviorAt(x, y);
}

bool8 TryStartInteractionScript(struct MapPosition *position, u16 metatileBehavior, u8 direction)
{
    const u8 *script = GetInteractionScript(position, metatileBehavior, direction);
    if (script == NULL)
        return FALSE;

    // Don't play interaction sound for certain scripts.
    if (script != PalletTown_PlayersHouse_2F_EventScript_PC
        && script != EventScript_PC)
        PlaySE(SE_SELECT);

    ScriptContext1_SetupScript(script);
    return TRUE;
}

const u8 *GetInteractionScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
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
        objectEventId = GetObjectEventIdByXYZ(position->x, position->y, position->height);
    else
        objectEventId = GetObjectEventIdByXYZ(position->x + gDirectionToVectors[direction].x, position->y + gDirectionToVectors[direction].y, position->height);

    if (objectEventId == OBJECT_EVENTS_COUNT || gObjectEvents[objectEventId].localId == OBJ_EVENT_ID_PLAYER)
        return NULL;

    for (i = 0; i < 4; i++)
    {
        if (gLinkPlayerObjectEvents[i].active == TRUE && gLinkPlayerObjectEvents[i].objEventId == objectEventId)
            return NULL;
    }

    gSelectedObjectEvent = objectEventId;
    gSpecialVar_LastTalked = gObjectEvents[objectEventId].localId;
    gSpecialVar_Facing = direction;
    return GetObjectEventScriptPointerByObjectEventId(objectEventId);
}

const u8 *GetInteractedObjectEventScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    u8 objectEventId;
    const u8 *script;

    objectEventId = GetObjectEventIdByXYZ(position->x, position->y, position->height);
    if (objectEventId == OBJECT_EVENTS_COUNT || gObjectEvents[objectEventId].localId == OBJ_EVENT_ID_PLAYER)
    {
        if (MetatileBehavior_IsCounter(metatileBehavior) != TRUE)
            return NULL;

        // Look for an object event on the other side of the counter.
        objectEventId = GetObjectEventIdByXYZ(position->x + gDirectionToVectors[direction].x, position->y + gDirectionToVectors[direction].y, position->height);
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

const u8 *GetInteractedBackgroundEventScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    u8 r2;
    const struct BgEvent *bgEvent = GetBackgroundEventAtPosition(&gMapHeader, position->x - 7, position->y - 7, position->height);

    if (bgEvent == NULL)
        return NULL;
    if (bgEvent->bgUnion.script == NULL)
        return EventScript_TestSignpostMsg;

    r2 = sub_806D898(metatileBehavior, direction);

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
        if (GetHiddenItemAttr((u32)bgEvent->bgUnion.script, HIDDEN_ITEM_UNDERFOOT) == TRUE)
            return NULL;
        gSpecialVar_0x8005 = GetHiddenItemAttr((u32)bgEvent->bgUnion.script, HIDDEN_ITEM_ID);
        gSpecialVar_0x8004 = GetHiddenItemAttr((u32)bgEvent->bgUnion.script, HIDDEN_ITEM_FLAG);
        gSpecialVar_0x8006 = GetHiddenItemAttr((u32)bgEvent->bgUnion.script, HIDDEN_ITEM_QUANTITY);
        if (FlagGet(gSpecialVar_0x8004) == TRUE)
            return NULL;
        gSpecialVar_Facing = direction;
        return EventScript_HiddenItemScript;
    }

    if (r2 != 0xFF)
        sub_8069A20();
    gSpecialVar_Facing = direction;
    return bgEvent->bgUnion.script;
}

const u8 *GetInteractedMetatileScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    gSpecialVar_Facing = direction;
    if (MetatileBehavior_IsPC(metatileBehavior) == TRUE)
        return EventScript_PC;
    if (MetatileBehavior_IsRegionMap(metatileBehavior) == TRUE)
        return EventScript_WallTownMap;
    if (MetatileBehavior_IsBookshelf(metatileBehavior) == TRUE)
        return gUnknown_81A7606;
    if (MetatileBehavior_IsPokeMartShelf(metatileBehavior) == TRUE)
        return gUnknown_81A760F;
    if (MetatileBehavior_IsFood(metatileBehavior) == TRUE)
        return gUnknown_81A7618;
    if (MetatileBehavior_IsImpressiveMachine(metatileBehavior) == TRUE)
        return gUnknown_81A7633;
    if (MetatileBehavior_IsBlueprints(metatileBehavior) == TRUE)
        return gUnknown_81A763C;
    if (MetatileBehavior_IsVideoGame(metatileBehavior) == TRUE)
        return gUnknown_81A7621;
    if (MetatileBehavior_IsBurglary(metatileBehavior) == TRUE)
        return gUnknown_81A7645;
    if (MetatileBehavior_IsComputer(metatileBehavior) == TRUE)
        return gUnknown_81A762A;
    if (MetatileBehavior_IsMBA3(metatileBehavior) == TRUE)
        return TrainerTower_EventScript_ShowTime;
    if (MetatileBehavior_IsPlayerFacingTVScreen(metatileBehavior, direction) == TRUE)
        return gUnknown_81A764E;
    if (MetatileBehavior_IsCabinet(metatileBehavior) == TRUE)
        return gUnknown_81A7657;
    if (MetatileBehavior_IsKitchen(metatileBehavior) == TRUE)
        return gUnknown_81A7660;
    if (MetatileBehavior_IsDresser(metatileBehavior) == TRUE)
        return gUnknown_81A7669;
    if (MetatileBehavior_IsSnacks(metatileBehavior) == TRUE)
        return gUnknown_81A7672;
    if (MetatileBehavior_IsPainting(metatileBehavior) == TRUE)
        return gUnknown_81A767B;
    if (MetatileBehavior_IsPowerPlantMachine(metatileBehavior) == TRUE)
        return gUnknown_81A7684;
    if (MetatileBehavior_IsTelephone(metatileBehavior) == TRUE)
        return gUnknown_81A768D;
    if (MetatileBehavior_IsAdvertisingPoster(metatileBehavior) == TRUE)
        return gUnknown_81A7696;
    if (MetatileBehavior_IsTastyFood(metatileBehavior) == TRUE)
        return gUnknown_81A769F;
    if (MetatileBehavior_IsTrashBin(metatileBehavior) == TRUE)
        return gUnknown_81A76A8;
    if (MetatileBehavior_IsCup(metatileBehavior) == TRUE)
        return gUnknown_81A76B1;
    if (MetatileBehavior_ReturnFalse_19(metatileBehavior) == TRUE)
        return gUnknown_81A76BA;
    if (MetatileBehavior_ReturnFalse_20(metatileBehavior) == TRUE)
        return gUnknown_81A76C3;
    if (MetatileBehavior_IsBlinkingLights(metatileBehavior) == TRUE)
        return gUnknown_81A76CC;
    if (MetatileBehavior_IsMB9F(metatileBehavior) == TRUE)
        return gUnknown_81A76D5;
    if (MetatileBehavior_IsPlayerFacingMB_8D(metatileBehavior, direction) == TRUE)
        return CableClub_EventScript_81BBFD8;
    if (MetatileBehavior_IsQuestionnaire(metatileBehavior) == TRUE)
        return EventScript_Questionnaire;
    if (MetatileBehavior_IsPlayerFacingBattleRecords(metatileBehavior, direction) == TRUE)
        return CableClub_EventScript_ShowBattleRecords;
    if (MetatileBehavior_IsIndigoPlateauMark(metatileBehavior) == TRUE)
    {
        sub_8069A20();
        return gUnknown_81A76F0;
    }
    if (MetatileBehavior_IsIndigoPlateauMark2(metatileBehavior) == TRUE)
    {
        sub_8069A20();
        return gUnknown_81A76F9;
    }
    if (MetatileBehavior_IsPlayerFacingPokeMartSign(metatileBehavior, direction) == TRUE)
    {
        sub_8069A20();
        return gUnknown_81A76DE;
    }
    if (MetatileBehavior_IsPlayerFacingPokemonCenterSign(metatileBehavior, direction) == TRUE)
    {
        sub_8069A20();
        return gUnknown_81A76E7;
    }
    return NULL;
}

const u8 *GetInteractedWaterScript(struct MapPosition *unused1, u8 metatileBehavior, u8 direction)
{
    if (MetatileBehavior_IsSemiDeepWater(metatileBehavior) == TRUE &&PartyHasMonWithSurf() == TRUE)
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

bool8 TryStartStepBasedScript(struct MapPosition *position, u16 metatileBehavior, u16 direction)
{
    if (TryStartCoordEventScript(position) == TRUE)
        return TRUE;
    if (TryStartWarpEventScript(position, metatileBehavior) == TRUE)
        return TRUE;
    if (TryStartMiscWalkingScripts(metatileBehavior) == TRUE)
        return TRUE;
    if (TryStartStepCountScript(metatileBehavior) == TRUE)
        return TRUE;
    if (!(gPlayerAvatar.flags & 0x40) && !MetatileBehavior_IsForcedMovementTile(metatileBehavior) && UpdateRepelCounter() == TRUE)
        return TRUE;
    return FALSE;
}

bool8 TryStartCoordEventScript(struct MapPosition *position)
{
    const u8 *script = GetCoordEventScriptAtPosition(&gMapHeader, position->x - 7, position->y - 7, position->height);

    if (script == NULL)
        return FALSE;
    ScriptContext1_SetupScript(script);
    return TRUE;
}

bool8 TryStartMiscWalkingScripts(u16 metatileBehavior)
{
    // Dummied
    return FALSE;
}

bool8 TryStartStepCountScript(u16 metatileBehavior)
{
    if (InUnionRoom() == TRUE)
        return FALSE;
    if (gQuestLogState == QL_STATE_2)
        return FALSE;

    UpdateHappinessStepCounter();

    if (!(gPlayerAvatar.flags & 0x40) && !MetatileBehavior_IsForcedMovementTile(metatileBehavior))
    {
        if (sub_810C4EC() == TRUE)
        {
            ScriptContext1_SetupScript(gUnknown_81A8CED);
            return TRUE;
        }
        else if (UpdatePoisonStepCounter() == TRUE)
        {
            ScriptContext1_SetupScript(EventScript_FieldPoison);
            return TRUE;
        }
        else if (ShouldEggHatch())
        {
            IncrementGameStat(GAME_STAT_HATCHED_EGGS);
            ScriptContext1_SetupScript(EventScript_EggHatch);
            return TRUE;
        }
    }
    if (SafariZoneTakeStep() == TRUE)
        return TRUE;
    return FALSE;
}

void Unref_ClearHappinessStepCounter(void)
{
    VarSet(VAR_HAPPINESS_STEP_COUNTER, 0);
}

void UpdateHappinessStepCounter(void)
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

bool8 UpdatePoisonStepCounter(void)
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

bool8 CheckStandardWildEncounter(u32 encounter)
{
    return TryStandardWildEncounter(encounter);
}

bool8 sub_806D804(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection)
{
    u8 r4;
    const u8 * script;
    if (JOY_HELD(DPAD_LEFT | DPAD_RIGHT))
        return FALSE;
    if (playerDirection == DIR_EAST || playerDirection == DIR_WEST)
        return FALSE;

    r4 = sub_806D898(metatileBehavior, playerDirection);
    if (r4 == 0)
    {
        sub_806D908(gUnknown_81A76E7, playerDirection);
        return TRUE;
    }
    else if (r4 == 1)
    {
        sub_806D908(gUnknown_81A76DE, playerDirection);
        return TRUE;
    }
    else if (r4 == 2)
    {
        sub_806D908(gUnknown_81A76F0, playerDirection);
        return TRUE;
    }
    else if (r4 == 3)
    {
        sub_806D908(gUnknown_81A76F9, playerDirection);
        return TRUE;
    }
    else
    {
        script = sub_806D928(position);
        if (script == NULL)
            return FALSE;
        if (r4 != 0xF0)
            return FALSE;
        sub_806D908(script, playerDirection);
        return TRUE;
    }
}

u8 sub_806D898(u16 metatileBehavior, u8 playerDirection)
{
    if (MetatileBehavior_IsPlayerFacingPokemonCenterSign(metatileBehavior, playerDirection) == TRUE)
        return 0;

    if (MetatileBehavior_IsPlayerFacingPokeMartSign(metatileBehavior, playerDirection) == TRUE)
        return 1;

    if (MetatileBehavior_IsIndigoPlateauMark(metatileBehavior) == TRUE)
        return 2;

    if (MetatileBehavior_IsIndigoPlateauMark2(metatileBehavior) == TRUE)
        return 3;

    if (MetatileBehavior_IsSignpost(metatileBehavior) == TRUE)
        return 0xF0;

    return 0xFF;
}

void sub_806D908(const u8 *script, u8 playerDirection)
{
    gSpecialVar_Facing = playerDirection;
    ScriptContext1_SetupScript(script);
    sub_80699E0();
    sub_8069A20();
}

const u8 *sub_806D928(struct MapPosition * position)
{
    const struct BgEvent * event = GetBackgroundEventAtPosition(&gMapHeader, position->x - 7, position->y - 7, position->height);
    if (event == NULL)
        return NULL;
    if (event->bgUnion.script != NULL)
        return event->bgUnion.script;
    return EventScript_TestSignpostMsg;
}

bool8 TryArrowWarp(struct MapPosition *position, u16 metatileBehavior, u8 direction)
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
        else if (sub_806DB84(metatileBehavior, direction) == TRUE)
        {
            delay = 0;
            if (gPlayerAvatar.flags & 6)
            {
                SetPlayerAvatarTransitionFlags(1);
                delay = 12;
            }
            StoreInitialPlayerAvatarState();
            SetupWarp(&gMapHeader, warpEventId, position);
            sub_807E4A0(metatileBehavior, delay);
            return TRUE;
        }
    }
    return FALSE;
}

bool8 TryStartWarpEventScript(struct MapPosition *position, u16 metatileBehavior)
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
            ScriptContext1_SetupScript(EventScript_1C1361);
            return TRUE;
        }
        DoWarp();
        return TRUE;
    }
    return FALSE;
}
