#include "global.h"
#include "gflib.h"
#include "bike.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "fieldmap.h"
#include "field_control_avatar.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "item_menu.h"
#include "link.h"
#include "menews_jisan.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "renewable_hidden_items.h"
#include "quest_log.h"
#include "script.h"
#include "start_menu.h"
#include "trainer_see.h"
#include "constants/songs.h"
#include "constants/event_objects.h"

void sub_806CA4C(struct FieldInput *input, u16 *newKeys, u16 *heldKeys);
bool8 sub_80699D4(void);
void sub_806CDF8(u8 taskId);
void GetPlayerPosition(struct MapPosition * position);
void GetInFrontOfPlayerPosition(struct MapPosition * position);
u16 GetPlayerCurMetatileBehavior(void);
bool8 TryStartStepBasedScript(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
bool8 TryArrowWarp(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
bool8 TryDoorWarp(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
bool8 TryStartInteractionScript(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
const u8 *GetInteractionScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
const u8 *GetInteractedObjectEventScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
const u8 *GetInteractedBackgroundEventScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
const u8 *GetInteractedMetatileScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
const u8 *GetInteractedWaterScript(struct MapPosition * position, u8 metatileBehavior, u8 playerDirection);
bool8 sub_806D804(struct MapPosition * position, u16 metatileBehavior, u8 playerDirection);
bool8 CheckStandardWildEncounter(u32 encounter);

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
