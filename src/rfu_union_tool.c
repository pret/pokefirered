#include "global.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "event_object_80688E4.h"
#include "event_object_8097404.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "rfu_union_tool.h"
#include "script.h"
#include "task.h"
#include "constants/flags.h"
#include "constants/event_object_movement.h"
#include "constants/object_events.h"

static EWRAM_DATA struct UnionObj * UnionObjWork = NULL;
static EWRAM_DATA u32 sUnionObjRefreshTimer = 0;

static u8 StartUnionObjAnimTask(void);
static u32 sub_811BBC8(u32 playerIdx, u32 arg1);
static void UnionPartnerObjectSetFacing(s32 arg0, s32 arg1, u8 arg2);

static const u8 sUnionObjectEventGfxIds[][10] = {
    [MALE]   = {
        OBJECT_EVENT_GFX_COOLTRAINER_M,
        OBJECT_EVENT_GFX_BLACKBELT,
        OBJECT_EVENT_GFX_CAMPER,
        OBJECT_EVENT_GFX_YOUNGSTER,
        OBJECT_EVENT_GFX_BOY,
        OBJECT_EVENT_GFX_BUG_CATCHER,
        OBJECT_EVENT_GFX_MAN,
        OBJECT_EVENT_GFX_ROCKER
    },
    [FEMALE] = {
        OBJECT_EVENT_GFX_COOLTRAINER_F,
        OBJECT_EVENT_GFX_CHANNELER,
        OBJECT_EVENT_GFX_PICNICKER,
        OBJECT_EVENT_GFX_LASS,
        OBJECT_EVENT_GFX_WOMAN_1,
        OBJECT_EVENT_GFX_BATTLE_GIRL,
        OBJECT_EVENT_GFX_WOMAN_2,
        OBJECT_EVENT_GFX_BEAUTY
    }
};

static const s16 sUnionPartnerCoords[][2] = {
    { 4,  6},
    {13,  8},
    {10,  6},
    { 1,  8},
    {13,  4},
    { 7,  4},
    { 1,  4},
    { 7,  8}
};

static const s8 sFacingDirectionOffsets[][2] = {
    [DIR_NONE]  = { 0,  0},
    [DIR_SOUTH] = { 1,  0},
    [DIR_NORTH] = { 0, -1},
    [DIR_WEST]  = {-1,  0},
    [DIR_EAST]  = { 0,  1}
};

static const u8 sOppositeFacingDirection[] = {
    [DIR_NONE]  = DIR_NONE,
    [DIR_SOUTH] = DIR_NORTH,
    [DIR_NORTH] = DIR_SOUTH,
    [DIR_WEST]  = DIR_EAST,
    [DIR_EAST]  = DIR_WEST
};

static const u8 gUnknown_845711B[] = {
    DIR_SOUTH,
    DIR_WEST,
    DIR_SOUTH,
    DIR_EAST,
    DIR_NORTH
};

static const u8 sUnionRoomLocalIds[] = {
    9,
    8,
    7,
    2,
    6,
    5,
    4,
    3
};

static const u16 sUnref_8457128[] = {
    0x63,
    0x64,
    0x65,
    0x66,
    0x67,
    0x68,
    0x69,
    0x6A
};

static bool32 is_walking_or_running(void)
{
    if (gPlayerAvatar.tileTransitionState == 2 || gPlayerAvatar.tileTransitionState == 0)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static u8 GetUnionRoomPlayerGraphicsId(u32 gender, u32 id)
{
    return sUnionObjectEventGfxIds[gender][id % 8];
}

static void GetUnionRoomPlayerFacingCoords(u32 id, u32 dirn, s32 * xp, s32 * yp)
{
    *xp = sUnionPartnerCoords[id][0] + sFacingDirectionOffsets[dirn][0] + 7;
    *yp = sUnionPartnerCoords[id][1] + sFacingDirectionOffsets[dirn][1] + 7;
}

static bool32 sub_811B58C(u32 id, u32 dirn, s32 x, s32 y)
{
    if (sUnionPartnerCoords[id][0] + sFacingDirectionOffsets[dirn][0] + 7 != x)
    {
        return FALSE;
    }
    else if (sUnionPartnerCoords[id][1] + sFacingDirectionOffsets[dirn][1] + 7 != y)
    {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static bool32 IsUnionRoomPlayerHidden(u32 player_idx)
{
    return FlagGet(FLAG_HIDE_UNION_ROOM_PLAYER_1 + player_idx);
}

static void HideUnionRoomPlayer(u32 player_idx)
{
    FlagSet(FLAG_HIDE_UNION_ROOM_PLAYER_1 + player_idx);
}

static void ShowUnionRoomPlayer(u32 player_idx)
{
    FlagClear(FLAG_HIDE_UNION_ROOM_PLAYER_1 + player_idx);
}

static void SetUnionRoomPlayerGfx(u32 playerIdx, u32 gfxId)
{
    VarSet(VAR_OBJ_GFX_ID_0 + playerIdx, gfxId);
}

static void CreateUnionRoomPlayerObjectEvent(u32 playerIdx)
{
    TrySpawnObjectEvent(sUnionRoomLocalIds[playerIdx], gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
}

static void RemoveUnionRoomPlayerObjectEvent(u32 playerIdx)
{
    RemoveObjectEventByLocalIdAndMap(sUnionRoomLocalIds[playerIdx], gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
}

static bool32 SetUnionRoomPlayerEnterExitMovement(u32 playerIdx, const u8 * movement)
{
    u8 objectId;
    struct ObjectEvent * object;
    if (TryGetObjectEventIdByLocalIdAndMap(sUnionRoomLocalIds[playerIdx], gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &objectId))
    {
        return FALSE;
    }
    object = &gObjectEvents[objectId];
    if (ObjectEventIsMovementOverridden(object))
    {
        return FALSE;
    }
    if (ObjectEventSetHeldMovement(object, *movement))
    {
        AGB_ASSERT_EX(0, ABSPATH("rfu_union_tool.c"), 387);
        return FALSE;
    }
    return TRUE;
}
static bool32 TryReleaseUnionRoomPlayerObjectEvent(u32 playerIdx)
{
    u8 objectId;
    struct ObjectEvent * object;
    if (TryGetObjectEventIdByLocalIdAndMap(sUnionRoomLocalIds[playerIdx], gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &objectId))
    {
        return TRUE;
    }
    object = &gObjectEvents[objectId];
    if (!ObjectEventClearHeldMovementIfFinished(object))
    {
        return FALSE;
    }
    if (!ScriptContext2_IsEnabled())
    {
        UnfreezeObjectEvent(object);
    }
    else
    {
        FreezeObjectEvent(object);
    }
    return TRUE;
}

u8 ZeroUnionObjWork(struct UnionObj * ptr)
{
    s32 i;

    sUnionObjRefreshTimer = 0;
    UnionObjWork = ptr;
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 442)
    for (i = 0; i < 8; i++)
    {
        ptr[i].state = 0;
        ptr[i].gfxId = 0;
        ptr[i].animState = 0;
        ptr[i].schedAnim = 0;
    }
    return StartUnionObjAnimTask();
}

static const u8 sMovement_UnionPlayerExit[2] = {
    MOVEMENT_ACTION_FLY_UP,
    MOVEMENT_ACTION_STEP_END
};

static bool32 AnimateUnionRoomPlayerDespawn(s8 * a0, u32 playerIdx, struct UnionObj * ptr)
{
    switch (*a0)
    {
    case 0:
        if (SetUnionRoomPlayerEnterExitMovement(playerIdx, sMovement_UnionPlayerExit) == TRUE)
        {
            HideUnionRoomPlayer(playerIdx);
            (*a0)++;
        }
        break;
    case 1:
        if (TryReleaseUnionRoomPlayerObjectEvent(playerIdx))
        {
            RemoveUnionRoomPlayerObjectEvent(playerIdx);
            HideUnionRoomPlayer(playerIdx);
            *a0 = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static const u8 sMovement_UnionPlayerEnter[2] = {
    MOVEMENT_ACTION_FLY_DOWN,
    MOVEMENT_ACTION_STEP_END
};

static bool32 AnimateUnionRoomPlayerSpawn(s8 * a0, u32 playerIdx, struct UnionObj * ptr)
{
    s16 x, y;

    switch (*a0)
    {
    case 0:
        if (!is_walking_or_running())
        {
            break;
        }
        PlayerGetDestCoords(&x, &y);
        if (sub_811B58C(playerIdx, 0, x, y) == TRUE)
        {
            break;
        }
        player_get_pos_including_state_based_drift(&x, &y);
        if (sub_811B58C(playerIdx, 0, x, y) == TRUE)
        {
            break;
        }
        SetUnionRoomPlayerGfx(playerIdx, ptr->gfxId);
        CreateUnionRoomPlayerObjectEvent(playerIdx);
        ShowUnionRoomPlayer(playerIdx);
        (*a0)++;
        // fallthrough
    case 3: // incorrect?
        if (SetUnionRoomPlayerEnterExitMovement(playerIdx, sMovement_UnionPlayerEnter) == 1)
        {
            (*a0)++;
        }
        break;
    case 2:
        if (TryReleaseUnionRoomPlayerObjectEvent(playerIdx))
        {
            *a0 = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static bool32 sub_811B8BC(u32 playerIdx, u32 a1, u32 a2)
{
    struct UnionObj * ptr = &UnionObjWork[playerIdx];
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 561)
    ptr->schedAnim = 1;
    ptr->gfxId = GetUnionRoomPlayerGraphicsId(a1, a2);
    if (ptr->state == 0)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static bool32 sub_811B90C(u32 playerIdx)
{
    struct UnionObj * ptr = &UnionObjWork[playerIdx];
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 577)
    ptr->schedAnim = 2;
    if (ptr->state == 1)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static void AnimateUnionObj(u32 playerIdx, struct UnionObj * ptr)
{
    switch (ptr->state)
    {
    case 0:
        if (ptr->schedAnim == 1)
        {
            ptr->state = 2;
            ptr->animState = 0;
        }
        else
        {
            break;
        }
        // fallthrough
    case 2:
        if (!sub_811BBC8(playerIdx, 0) && ptr->schedAnim == 2)
        {
            ptr->state = 0;
            ptr->animState = 0;
            RemoveUnionRoomPlayerObjectEvent(playerIdx);
            HideUnionRoomPlayer(playerIdx);
        }
        else if (AnimateUnionRoomPlayerSpawn(&ptr->animState, playerIdx, ptr) == TRUE)
        {
            ptr->state = 1;
        }
        break;
    case 1:
        if (ptr->schedAnim == 2)
        {
            ptr->state = 3;
            ptr->animState = 0;
        }
        else
        {
            break;
        }
        // fallthrough
    case 3:
        if (AnimateUnionRoomPlayerDespawn(&ptr->animState, playerIdx, ptr) == TRUE)
        {
            ptr->state = 0;
        }
        break;
    }
    ptr->schedAnim = 0;
}

static void Task_AnimateUnionObjs(u8 taskId)
{
    s32 i;
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 643)
    for (i = 0; i < 8; i++)
    {
        AnimateUnionObj(i, &UnionObjWork[i]);
    }
}

static u8 StartUnionObjAnimTask(void)
{
    if (FuncIsActiveTask(Task_AnimateUnionObjs) == TRUE)
    {
        AGB_ASSERT_EX(0, ABSPATH("rfu_union_tool.c"), 655)
        return NUM_TASKS;
    }
    else
    {
        return CreateTask(Task_AnimateUnionObjs, 5);
    }
}

static void sub_811BA5C(void)
{
    u8 taskId = FindTaskIdByFunc(Task_AnimateUnionObjs);
    if (taskId < NUM_TASKS)
    {
        DestroyTask(taskId);
    }
}

void sub_811BA78(void)
{
    s32 i;
    for (i = 0; i < 8; i++)
    {
        if (!IsUnionRoomPlayerHidden(i))
        {
            RemoveUnionRoomPlayerObjectEvent(i);
            HideUnionRoomPlayer(i);
        }
    }
    UnionObjWork = NULL;
    sub_811BA5C();
}

void sub_811BAAC(u8 * sp8, s32 r9)
{
    s32 r7;

    for (r7 = 0; r7 < 5; r7++)
    {
        s32 r5 = 5 * r9 + r7;
        sp8[r5] = sprite_new(OBJECT_EVENT_GFX_MAN, r5 - 0x38, sUnionPartnerCoords[r9][0] + sFacingDirectionOffsets[r7][0], sUnionPartnerCoords[r9][1] + sFacingDirectionOffsets[r7][1], 3, 1);
        sub_8069124(r5 - 0x38, TRUE);
    }
}

void sub_811BB40(u8 * r5)
{
    s32 i;
    for (i = 0; i < 40; i++)
    {
        DestroySprite(&gSprites[r5[i]]);
    }
}

void sub_811BB68(void)
{
    s32 i, j, x, y;
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 5; j++)
        {
            GetUnionRoomPlayerFacingCoords(i, j, &x, &y);
            sub_8059024(x, y, 0);
        }
    }
}

static u8 UnionPartnerObjectGetFacing(u32 r1, u32 unused, struct GFtgtGname * gname)
{
    if (r1 != 0)
    {
        return gUnknown_845711B[r1];
    }
    else if (gname->activity == 0x45)
    {
        return DIR_SOUTH;
    }
    else
    {
        return DIR_EAST;
    }
}

static u32 sub_811BBC8(u32 a0, u32 a1)
{
    return sub_806916C(5 * a0 + a1 - 0x38);
}

static void sub_811BBE0(u32 r5, u32 r6, u8 r8, struct GFtgtGname * gname)
{
    s32 x, y;
    s32 r7 = 5 * r5 + r6;
    if (sub_811BBC8(r5, r6) == 1)
    {
        sub_8069124(r7 - 0x38, FALSE);
        sub_80691A4(r7 - 0x38, 1);
    }
    sub_8069094(r7 - 0x38, r8);
    UnionPartnerObjectSetFacing(r6, r5, UnionPartnerObjectGetFacing(r6, r5, gname));
    GetUnionRoomPlayerFacingCoords(r5, r6, &x, &y);
    sub_8059024(x, y, 1);
}

static void sub_811BC68(u32 a0, u32 a1)
{
    s32 x, y;
    sub_80691A4(5 * a0 + a1 - 0x38, 2);
    GetUnionRoomPlayerFacingCoords(a0, a1, &x, &y);
    sub_8059024(x, y, 0);
}

static void sub_811BCA0(u32 r7, struct GFtgtGname * r8)
{
    s16 x, y, x2, y2;
    s32 i;

    PlayerGetDestCoords(&x, &y);
    player_get_pos_including_state_based_drift(&x2, &y2);
    if (sub_806916C(5 * r7 - 0x38) == 1)
    {
        if (sub_811B58C(r7, 0, x, y) == TRUE || sub_811B58C(r7, 0, x2, y2) == TRUE)
        {
            return;
        }
        sub_811BBE0(r7, 0, GetUnionRoomPlayerGraphicsId(r8->playerGender, r8->unk_00.playerTrainerId[0]), r8);
    }
    for (i = 1; i < 5; i++)
    {
        if (r8->unk_04[i - 1] == 0)
        {
            sub_811BC68(r7, i);
        }
        else if (sub_811B58C(r7, i, x, y) == FALSE && sub_811B58C(r7, i, x2, y2) == FALSE)
        {
            sub_811BBE0(r7, i, GetUnionRoomPlayerGraphicsId((r8->unk_04[i - 1] >> 3) & 1, r8->unk_04[i - 1] & 7), r8);
        }
    }
}

static void sub_811BDA8(u32 r5, struct GFtgtGname * r4)
{
    u32 i;
    switch (r4->activity)
    {
    case 0x40:
    case 0x54:
        sub_811B8BC(r5, r4->playerGender, r4->unk_00.playerTrainerId[0]);
        for (i = 0; i < 5; i++)
        {
            sub_811BC68(r5, i);
        }
        break;
    case 0x41:
    case 0x44:
    case 0x45:
    case 0x48:
    case 0x51:
    case 0x52:
    case 0x53:
        sub_811B90C(r5);
        sub_811BCA0(r5, r4);
        break;
    default:
        AGB_ASSERT_EX(0, ABSPATH("rfu_union_tool.c"), 979)
    }
}

static void sub_811BE6C(u32 r5, struct GFtgtGname * gname)
{
    s32 i;
    sub_811B90C(r5);
    for (i = 0; i < 5; i++)
    {
        sub_811BC68(r5, i);
    }
}

static void UpdateUnionRoomPlayerSprites(struct UnkStruct_URoom *r0)
{
    s32 i;
    struct UnkStruct_x20 * r4;
    sUnionObjRefreshTimer = 0;
    for (i = 0, r4 = r0->field_0->arr; i < 8; i++)
    {
        if (r4[i].tradeStatus == 1)
        {
            sub_811BDA8(i, &r4[i].unk.gname);
        }
        else if (r4[i].tradeStatus == 2)
        {
            sub_811BE6C(i, &r4[i].unk.gname);
        }
    }
}

void sub_811BECC(struct UnkStruct_URoom *unused)
{
    sUnionObjRefreshTimer = 300;
}

void sub_811BEDC(struct UnkStruct_URoom *r2)
{
    if (++sUnionObjRefreshTimer > 300)
    {
        UpdateUnionRoomPlayerSprites(r2);
    }
}

bool32 sub_811BF00(struct UnkStruct_Main0 *arg0, s16 *arg1, s16 *arg2, u8 *arg3)
{
    s16 x, y;
    s32 i, j;
    struct UnkStruct_x20 * r4;
    if (!is_walking_or_running())
    {
        return FALSE;
    }
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    for (i = 0, r4 = arg0->arr; i < 8; i++)
    {
        for (j = 0; j < 5; j++)
        {
            s32 r3 = 5 * i + j;
            if (x != sUnionPartnerCoords[i][0] + sFacingDirectionOffsets[j][0] + 7)
            {
                continue;
            }
            if (y != sUnionPartnerCoords[i][1] + sFacingDirectionOffsets[j][1] + 7)
            {
                continue;
            }
            if (sub_806916C(r3 - 0x38) != 0)
            {
                continue;
            }
            if (sub_8069294(r3 - 0x38) != 0)
            {
                continue;
            }
            if (r4[i].tradeStatus != 1)
            {
                continue;
            }
            UnionPartnerObjectSetFacing(j, i, sOppositeFacingDirection[GetPlayerFacingDirection()]);
            *arg1 = j;
            *arg2 = i;
            return TRUE;
        }
    }
    return FALSE;
}

static void UnionPartnerObjectSetFacing(s32 arg0, s32 arg1, u8 arg2)
{
    sub_8069058(5 * arg1 - 0x38 + arg0, arg2);
}

void sub_811C028(u32 arg0, u32 arg1, struct UnkStruct_Main0 *arg2)
{
    return UnionPartnerObjectSetFacing(arg0, arg1, UnionPartnerObjectGetFacing(arg0, arg1, &arg2->arr[arg1].unk.gname));
}
