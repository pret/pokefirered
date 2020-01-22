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

EWRAM_DATA struct UnionObj * UnionObjWork = NULL;
EWRAM_DATA u32 gUnknown_203B088 = 0;

u8 sub_811BA18(void);
u32 sub_811BBC8(u32 playerIdx, u32 arg1);
void sub_811C008(s32 arg0, s32 arg1, u8 arg2);

const u8 gUnknown_84570D8[][10] = {
    {0x29, 0x36, 0x27, 0x12, 0x13, 0x14, 0x19, 0x1A},
    {0x2A, 0x3A, 0x28, 0x16, 0x17, 0x18, 0x1C, 0x1D}
};

const s16 gUnknown_84570EC[][2] = {
    {0x4, 0x6},
    {0xd, 0x8},
    {0xa, 0x6},
    {0x1, 0x8},
    {0xd, 0x4},
    {0x7, 0x4},
    {0x1, 0x4},
    {0x7, 0x8}
};

const s8 gUnknown_845710C[][2] = {
    { 0,  0},
    { 1,  0},
    { 0, -1},
    {-1,  0},
    { 0,  1}
};

const u8 gUnknown_8457116[] = {
    0x00, 0x02, 0x01, 0x04, 0x03
};

const u8 gUnknown_845711B[] = {
    0x01, 0x03, 0x01, 0x04, 0x02
};

const u8 gUnknown_8457120[] = {
    0x09, 0x08, 0x07, 0x02, 0x06, 0x05, 0x04, 0x03,
    0x63, 0x00, 0x64, 0x00, 0x65, 0x00, 0x66, 0x00,
    0x67, 0x00, 0x68, 0x00, 0x69, 0x00, 0x6A, 0x00
};

bool32 is_walking_or_running(void)
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

u8 sub_811B524(u32 a0, u32 a1)
{
    return gUnknown_84570D8[a0][a1 % 8];
}

void sub_811B53C(u32 a0, u32 a1, s32 * a2, s32 * a3)
{
    *a2 = gUnknown_84570EC[a0][0] + gUnknown_845710C[a1][0] + 7;
    *a3 = gUnknown_84570EC[a0][1] + gUnknown_845710C[a1][1] + 7;
}

bool32 sub_811B58C(u32 a0, u32 a1, s32 a2, s32 a3)
{
    if (gUnknown_84570EC[a0][0] + gUnknown_845710C[a1][0] + 7 != a2)
    {
        return FALSE;
    }
    else if (gUnknown_84570EC[a0][1] + gUnknown_845710C[a1][1] + 7 != a3)
    {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

bool32 IsUnionRoomPlayerHidden(u32 player_idx)
{
    return FlagGet(FLAG_HIDE_UNION_ROOM_PLAYER_1 + player_idx);
}

void HideUnionRoomPlayer(u32 player_idx)
{
    FlagSet(FLAG_HIDE_UNION_ROOM_PLAYER_1 + player_idx);
}

void ShowUnionRoomPlayer(u32 player_idx)
{
    FlagClear(FLAG_HIDE_UNION_ROOM_PLAYER_1 + player_idx);
}

void SetUnionRoomPlayerGfx(u32 playerIdx, u32 gfxId)
{
    VarSet(VAR_OBJ_GFX_ID_0 + playerIdx, gfxId);
}

void CreateUnionRoomPlayerObjectEvent(u32 playerIdx)
{
    TrySpawnObjectEvent(gUnknown_8457120[playerIdx], gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
}

void RemoveUnionRoomPlayerObjectEvent(u32 playerIdx)
{
    RemoveObjectEventByLocalIdAndMap(gUnknown_8457120[playerIdx], gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
}

bool32 SetUnionRoomPlayerEnterExitMovement(u32 playerIdx, const u8 * movement)
{
    u8 objectId;
    struct ObjectEvent * object;
    if (TryGetObjectEventIdByLocalIdAndMap(gUnknown_8457120[playerIdx], gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &objectId))
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
bool32 sub_811B6E8(u32 playerIdx)
{
    u8 objectId;
    struct ObjectEvent * object;
    if (TryGetObjectEventIdByLocalIdAndMap(gUnknown_8457120[playerIdx], gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &objectId))
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

u8 sub_811B754(struct UnionObj * ptr)
{
    s32 i;

    gUnknown_203B088 = 0;
    UnionObjWork = ptr;
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 442)
    for (i = 0; i < 8; i++)
    {
        ptr[i].field_0 = 0;
        ptr[i].field_1 = 0;
        ptr[i].field_2 = 0;
        ptr[i].field_3 = 0;
    }
    return sub_811BA18();
}

const u8 gUnknown_845718D[2] = {
    MOVEMENT_ACTION_FLY_UP,
    MOVEMENT_ACTION_STEP_END
};

bool32 sub_811B7A8(s8 * a0, u32 playerIdx, struct UnionObj * ptr)
{
    switch (*a0)
    {
    case 0:
        if (SetUnionRoomPlayerEnterExitMovement(playerIdx, gUnknown_845718D) == TRUE)
        {
            HideUnionRoomPlayer(playerIdx);
            (*a0)++;
        }
        break;
    case 1:
        if (sub_811B6E8(playerIdx))
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

const u8 gUnknown_845718F[2] = {
    MOVEMENT_ACTION_FLY_DOWN,
    MOVEMENT_ACTION_STEP_END
};

bool32 sub_811B804(s8 * a0, u32 playerIdx, struct UnionObj * ptr)
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
        if (sub_811B58C(playerIdx, 0, x, y) == 1)
        {
            break;
        }
        player_get_pos_including_state_based_drift(&x, &y);
        if (sub_811B58C(playerIdx, 0, x, y) == 1)
        {
            break;
        }
        SetUnionRoomPlayerGfx(playerIdx, ptr->field_1);
        CreateUnionRoomPlayerObjectEvent(playerIdx);
        ShowUnionRoomPlayer(playerIdx);
        (*a0)++;
        // fallthrough
    case 3: // incorrect?
        if (SetUnionRoomPlayerEnterExitMovement(playerIdx, gUnknown_845718F) == 1)
        {
            (*a0)++;
        }
        break;
    case 2:
        if (sub_811B6E8(playerIdx))
        {
            *a0 = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

bool32 sub_811B8BC(u32 playerIdx, u32 a1, u32 a2)
{
    struct UnionObj * ptr = &UnionObjWork[playerIdx];
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 561)
    ptr->field_3 = 1;
    ptr->field_1 = sub_811B524(a1, a2);
    if (ptr->field_0 == 0)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool32 sub_811B90C(u32 playerIdx)
{
    struct UnionObj * ptr = &UnionObjWork[playerIdx];
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 577)
    ptr->field_3 = 2;
    if (ptr->field_0 == 1)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

void sub_811B94C(u32 playerIdx, struct UnionObj * ptr)
{
    switch (ptr->field_0)
    {
    case 0:
        if (ptr->field_3 == 1)
        {
            ptr->field_0 = 2;
            ptr->field_2 = 0;
        }
        else
        {
            break;
        }
        // fallthrough
    case 2:
        if (!sub_811BBC8(playerIdx, 0) && ptr->field_3 == 2)
        {
            ptr->field_0 = 0;
            ptr->field_2 = 0;
            RemoveUnionRoomPlayerObjectEvent(playerIdx);
            HideUnionRoomPlayer(playerIdx);
        }
        else if (sub_811B804(&ptr->field_2, playerIdx, ptr) == 1)
        {
            ptr->field_0 = 1;
        }
        break;
    case 1:
        if (ptr->field_3 == 2)
        {
            ptr->field_0 = 3;
            ptr->field_2 = 0;
        }
        else
        {
            break;
        }
        // fallthrough
    case 3:
        if (sub_811B7A8(&ptr->field_2, playerIdx, ptr) == 1)
        {
            ptr->field_0 = 0;
        }
        break;
    }
    ptr->field_3 = 0;
}

void sub_811B9D8(u8 taskId)
{
    s32 i;
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 643)
    for (i = 0; i < 8; i++)
    {
        sub_811B94C(i, &UnionObjWork[i]);
    }
}

u8 sub_811BA18(void)
{
    if (FuncIsActiveTask(sub_811B9D8) == TRUE)
    {
        AGB_ASSERT_EX(0, ABSPATH("rfu_union_tool.c"), 655)
        return NUM_TASKS;
    }
    else
    {
        return CreateTask(sub_811B9D8, 5);
    }
}

void sub_811BA5C(void)
{
    u8 taskId = FindTaskIdByFunc(sub_811B9D8);
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
        sp8[r5] = sprite_new(OBJECT_EVENT_GFX_MAN, r5 - 0x38, gUnknown_84570EC[r9][0] + gUnknown_845710C[r7][0], gUnknown_84570EC[r9][1] + gUnknown_845710C[r7][1], 3, 1);
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
            sub_811B53C(i, j, &x, &y);
            sub_8059024(x, y, 0);
        }
    }
}

u8 sub_811BBA0(u32 r1, u32 unused, struct GFtgtGname * r2)
{
    if (r1 != 0)
    {
        return gUnknown_845711B[r1];
    }
    else if (r2->unk_0a_0 == 0x45)
    {
        return 1;
    }
    else
    {
        return 4;
    }
}

u32 sub_811BBC8(u32 a0, u32 a1)
{
    return sub_806916C(5 * a0 + a1 - 0x38);
}

void sub_811BBE0(u32 r5, u32 r6, u8 r8, struct GFtgtGname * r9)
{
    s32 x, y;
    s32 r7 = 5 * r5 + r6;
    if (sub_811BBC8(r5, r6) == 1)
    {
        sub_8069124(r7 - 0x38, FALSE);
        sub_80691A4(r7 - 0x38, 1);
    }
    sub_8069094(r7 - 0x38, r8);
    sub_811C008(r6, r5, sub_811BBA0(r6, r5, r9));
    sub_811B53C(r5, r6, &x, &y);
    sub_8059024(x, y, 1);
}

void sub_811BC68(u32 a0, u32 a1)
{
    s32 x, y;
    sub_80691A4(5 * a0 + a1 - 0x38, 2);
    sub_811B53C(a0, a1, &x, &y);
    sub_8059024(x, y, 0);
}

void sub_811BCA0(u32 r7, struct GFtgtGname * r8)
{
    s16 x, y, x2, y2;
    s32 i;

    PlayerGetDestCoords(&x, &y);
    player_get_pos_including_state_based_drift(&x2, &y2);
    if (sub_806916C(5 * r7 - 0x38) == 1)
    {
        if (sub_811B58C(r7, 0, x, y) == 1 || sub_811B58C(r7, 0, x2, y2) == 1)
        {
            return;
        }
        sub_811BBE0(r7, 0, sub_811B524(r8->playerGender, r8->unk_00.playerTrainerId[0]), r8);
    }
    for (i = 1; i < 5; i++)
    {
        if (r8->unk_04[i - 1] == 0)
        {
            sub_811BC68(r7, i);
        }
        else if (sub_811B58C(r7, i, x, y) == 0 && sub_811B58C(r7, i, x2, y2) == 0)
        {
            sub_811BBE0(r7, i, sub_811B524((r8->unk_04[i - 1] >> 3) & 1, r8->unk_04[i - 1] & 7), r8);
        }
    }
}

void sub_811BDA8(u32 r5, struct GFtgtGname * r4)
{
    u32 i;
    switch (r4->unk_0a_0)
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
