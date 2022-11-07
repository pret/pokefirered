#include "global.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "rfu_union_tool.h"
#include "script.h"
#include "task.h"
#include "constants/event_object_movement.h"
#include "constants/union_room.h"
#include "constants/event_objects.h"

static EWRAM_DATA struct UnionObj * UnionObjWork = NULL;
static EWRAM_DATA u32 sUnionObjRefreshTimer = 0;

static u8 StartUnionObjAnimTask(void);
static u32 RfuUnionGroupMemberIsInvisible(u32 group, u32 member);
static void UnionPartnerObjectSetFacing(s32 member, s32 group, u8 direction);

static const u8 sUnionObjectEventGfxIds[][10] = {
    [MALE]   = {
        OBJ_EVENT_GFX_COOLTRAINER_M,
        OBJ_EVENT_GFX_BLACKBELT,
        OBJ_EVENT_GFX_CAMPER,
        OBJ_EVENT_GFX_YOUNGSTER,
        OBJ_EVENT_GFX_BOY,
        OBJ_EVENT_GFX_BUG_CATCHER,
        OBJ_EVENT_GFX_MAN,
        OBJ_EVENT_GFX_ROCKER
    },
    [FEMALE] = {
        OBJ_EVENT_GFX_COOLTRAINER_F,
        OBJ_EVENT_GFX_CHANNELER,
        OBJ_EVENT_GFX_PICNICKER,
        OBJ_EVENT_GFX_LASS,
        OBJ_EVENT_GFX_WOMAN_1,
        OBJ_EVENT_GFX_BATTLE_GIRL,
        OBJ_EVENT_GFX_WOMAN_2,
        OBJ_EVENT_GFX_BEAUTY
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

static const u8 sUnionGroupMemberFacings[] = {
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

// Unused
static const u16 sHidePlayerFlags[] = {
    FLAG_HIDE_UNION_ROOM_PLAYER_1,
    FLAG_HIDE_UNION_ROOM_PLAYER_2,
    FLAG_HIDE_UNION_ROOM_PLAYER_3,
    FLAG_HIDE_UNION_ROOM_PLAYER_4,
    FLAG_HIDE_UNION_ROOM_PLAYER_5,
    FLAG_HIDE_UNION_ROOM_PLAYER_6,
    FLAG_HIDE_UNION_ROOM_PLAYER_7,
    FLAG_HIDE_UNION_ROOM_PLAYER_8
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

static void GetUnionRoomPlayerFacingCoords(u32 group, u32 member, s32 * xp, s32 * yp)
{
    *xp = sUnionPartnerCoords[group][0] + sFacingDirectionOffsets[member][0] + 7;
    *yp = sUnionPartnerCoords[group][1] + sFacingDirectionOffsets[member][1] + 7;
}

static bool32 IsUnionRoomPlayerFacingTileAt(u32 group, u32 member, s32 x, s32 y)
{
    if (sUnionPartnerCoords[group][0] + sFacingDirectionOffsets[member][0] + 7 != x)
    {
        return FALSE;
    }
    else if (sUnionPartnerCoords[group][1] + sFacingDirectionOffsets[member][1] + 7 != y)
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
    if (!ArePlayerFieldControlsLocked())
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

static bool32 AnimateUnionRoomPlayerSpawn(s8 * state_p, u32 playerIdx, struct UnionObj * ptr)
{
    s16 x, y;

    switch (*state_p)
    {
    case 0:
        if (!is_walking_or_running())
        {
            break;
        }
        PlayerGetDestCoords(&x, &y);
        if (IsUnionRoomPlayerFacingTileAt(playerIdx, 0, x, y) == TRUE)
        {
            break;
        }
        player_get_pos_including_state_based_drift(&x, &y);
        if (IsUnionRoomPlayerFacingTileAt(playerIdx, 0, x, y) == TRUE)
        {
            break;
        }
        SetUnionRoomPlayerGfx(playerIdx, ptr->gfxId);
        CreateUnionRoomPlayerObjectEvent(playerIdx);
        ShowUnionRoomPlayer(playerIdx);
        (*state_p)++;
        // fallthrough
    case 3: // incorrect?
        if (SetUnionRoomPlayerEnterExitMovement(playerIdx, sMovement_UnionPlayerEnter) == 1)
        {
            (*state_p)++;
        }
        break;
    case 2:
        if (TryReleaseUnionRoomPlayerObjectEvent(playerIdx))
        {
            *state_p = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static bool32 SpawnGroupLeader(u32 playerIdx, u32 gender, u32 idMod256)
{
    struct UnionObj * ptr = &UnionObjWork[playerIdx];
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 561)
    ptr->schedAnim = UNION_ROOM_SPAWN_IN;
    ptr->gfxId = GetUnionRoomPlayerGraphicsId(gender, idMod256);
    if (ptr->state == 0)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static bool32 DespawnGroupLeader(u32 playerIdx)
{
    struct UnionObj * ptr = &UnionObjWork[playerIdx];
    AGB_ASSERT_EX(UnionObjWork != NULL, ABSPATH("rfu_union_tool.c"), 577)
    ptr->schedAnim = UNION_ROOM_SPAWN_OUT;
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
        if (ptr->schedAnim == UNION_ROOM_SPAWN_IN)
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
        if (!RfuUnionGroupMemberIsInvisible(playerIdx, 0) && ptr->schedAnim == 2)
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
        if (ptr->schedAnim == UNION_ROOM_SPAWN_OUT)
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
    ptr->schedAnim = UNION_ROOM_SPAWN_NONE;
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

static void DestroyAnimateUnionObjsTask(void)
{
    u8 taskId = FindTaskIdByFunc(Task_AnimateUnionObjs);
    if (taskId < NUM_TASKS)
    {
        DestroyTask(taskId);
    }
}

void DeleteUnionObjWorkAndStopTask(void)
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
    DestroyAnimateUnionObjsTask();
}

void CreateGroupMemberObjectsInvisible(u8 * sprite_ids, s32 group)
{
    s32 i;

    for (i = 0; i < 5; i++)
    {
        s32 obj_id = 5 * group + i;
        sprite_ids[obj_id] = CreateVirtualObject(OBJ_EVENT_GFX_MAN, obj_id - 0x38, sUnionPartnerCoords[group][0] + sFacingDirectionOffsets[i][0], sUnionPartnerCoords[group][1] + sFacingDirectionOffsets[i][1], 3, 1);
        SetVirtualObjectInvisibility(obj_id - 0x38, TRUE);
    }
}

void DestroyGroupMemberObjects(u8 *spriteIds)
{
    s32 i;
    for (i = 0; i < 40; i++)
    {
        DestroySprite(&gSprites[spriteIds[i]]);
    }
}

void MakeGroupAssemblyAreasPassable(void)
{
    s32 i, j, x, y;
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 5; j++)
        {
            GetUnionRoomPlayerFacingCoords(i, j, &x, &y);
            MapGridSetMetatileImpassabilityAt(x, y, FALSE);
        }
    }
}

static u8 UnionPartnerObjectGetFacing(u32 member, u32 group, struct GFtgtGname * gname)
{
    if (member != 0)
    {
        return sUnionGroupMemberFacings[member];
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

static u32 RfuUnionGroupMemberIsInvisible(u32 group, u32 member)
{
    return IsVirtualObjectInvisible(5 * group + member - 0x38);
}

static void SpawnGroupMember(u32 groupNo, u32 memberNo, u8 direction, struct GFtgtGname * gname)
{
    s32 x, y;
    s32 objId = 5 * groupNo + memberNo;
    if (RfuUnionGroupMemberIsInvisible(groupNo, memberNo) == TRUE)
    {
        SetVirtualObjectInvisibility(objId - 0x38, FALSE);
        SetVirtualObjectSpriteAnim(objId - 0x38, UNION_ROOM_SPAWN_IN);
    }
    SetVirtualObjectGraphics(objId - 0x38, direction);
    UnionPartnerObjectSetFacing(memberNo, groupNo, UnionPartnerObjectGetFacing(memberNo, groupNo, gname));
    GetUnionRoomPlayerFacingCoords(groupNo, memberNo, &x, &y);
    MapGridSetMetatileImpassabilityAt(x, y, TRUE);
}

static void DespawnGroupMember(u32 group, u32 member)
{
    s32 x, y;
    SetVirtualObjectSpriteAnim(5 * group + member - 0x38, UNION_ROOM_SPAWN_OUT);
    GetUnionRoomPlayerFacingCoords(group, member, &x, &y);
    MapGridSetMetatileImpassabilityAt(x, y, FALSE);
}

static void AssembleGroup(u32 group, struct GFtgtGname * gname)
{
    s16 x, y, x2, y2;
    s32 i;

    PlayerGetDestCoords(&x, &y);
    player_get_pos_including_state_based_drift(&x2, &y2);
    if (IsVirtualObjectInvisible(5 * group - 0x38) == TRUE)
    {
        if (IsUnionRoomPlayerFacingTileAt(group, 0, x, y) == TRUE || IsUnionRoomPlayerFacingTileAt(group, 0, x2, y2) == TRUE)
        {
            return;
        }
        SpawnGroupMember(group, 0, GetUnionRoomPlayerGraphicsId(gname->playerGender, gname->unk_00.playerTrainerId[0]), gname);
    }
    for (i = 1; i < 5; i++)
    {
        if (gname->child_sprite_gender[i - 1] == 0)
        {
            DespawnGroupMember(group, i);
        }
        else if (IsUnionRoomPlayerFacingTileAt(group, i, x, y) == FALSE && IsUnionRoomPlayerFacingTileAt(group, i, x2, y2) == FALSE)
        {
            SpawnGroupMember(group, i, GetUnionRoomPlayerGraphicsId((gname->child_sprite_gender[i - 1] >> 3) & 1, gname->child_sprite_gender[i - 1] & 7), gname);
        }
    }
}

static void SpawnGroupLeaderAndMembers(u32 group, struct GFtgtGname * gname)
{
    u32 i;
    switch (gname->activity)
    {
    case 0x40:
    case 0x54:
        SpawnGroupLeader(group, gname->playerGender, gname->unk_00.playerTrainerId[0]);
        for (i = 0; i < 5; i++)
        {
            DespawnGroupMember(group, i);
        }
        break;
    case 0x41:
    case 0x44:
    case 0x45:
    case 0x48:
    case 0x51:
    case 0x52:
    case 0x53:
        DespawnGroupLeader(group);
        AssembleGroup(group, gname);
        break;
    default:
        AGB_ASSERT_EX(0, ABSPATH("rfu_union_tool.c"), 979)
    }
}

static void DespawnGroupLeaderAndMembers(u32 group, struct GFtgtGname * gname)
{
    s32 i;
    DespawnGroupLeader(group);
    for (i = 0; i < 5; i++)
    {
        DespawnGroupMember(group, i);
    }
}

static void UpdateUnionRoomPlayerSprites(struct UnkStruct_URoom * groups)
{
    s32 i;
    struct UnkStruct_x20 * x20_p;
    sUnionObjRefreshTimer = 0;
    for (i = 0, x20_p = groups->field_0->arr; i < 8; i++)
    {
        if (x20_p[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
        {
            SpawnGroupLeaderAndMembers(i, &x20_p[i].gname_uname.gname);
        }
        else if (x20_p[i].groupScheduledAnim == UNION_ROOM_SPAWN_OUT)
        {
            DespawnGroupLeaderAndMembers(i, &x20_p[i].gname_uname.gname);
        }
    }
}

void ScheduleUnionRoomPlayerRefresh(struct UnkStruct_URoom *uroom_p)
{
    sUnionObjRefreshTimer = 300;
}

void HandleUnionRoomPlayerRefresh(struct UnkStruct_URoom *uroom_p)
{
    if (++sUnionObjRefreshTimer > 300)
    {
        UpdateUnionRoomPlayerSprites(uroom_p);
    }
}

bool32 RfuUnionTool_GetGroupAndMemberInFrontOfPlayer(struct UnkStruct_Main0 *main0_p, s16 *member_p, s16 *group_p, u8 *spriteIds)
{
    s16 x, y;
    s32 i, j;
    struct UnkStruct_x20 * x20_p;
    if (!is_walking_or_running())
    {
        return FALSE;
    }
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    for (i = 0, x20_p = main0_p->arr; i < 8; i++)
    {
        for (j = 0; j < 5; j++)
        {
            s32 objId = 5 * i + j;
            if (x != sUnionPartnerCoords[i][0] + sFacingDirectionOffsets[j][0] + 7)
            {
                continue;
            }
            if (y != sUnionPartnerCoords[i][1] + sFacingDirectionOffsets[j][1] + 7)
            {
                continue;
            }
            if (IsVirtualObjectInvisible(objId - 0x38) != FALSE)
            {
                continue;
            }
            if (IsVirtualObjectAnimating(objId - 0x38) != FALSE)
            {
                continue;
            }
            if (x20_p[i].groupScheduledAnim != UNION_ROOM_SPAWN_IN)
            {
                continue;
            }
            UnionPartnerObjectSetFacing(j, i, sOppositeFacingDirection[GetPlayerFacingDirection()]);
            *member_p = j;
            *group_p = i;
            return TRUE;
        }
    }
    return FALSE;
}

static void UnionPartnerObjectSetFacing(s32 member, s32 group, u8 direction)
{
    TurnVirtualObject(5 * group - 0x38 + member, direction);
}

void UpdateUnionGroupMemberFacing(u32 member, u32 group, struct UnkStruct_Main0 *main0_p)
{
    return UnionPartnerObjectSetFacing(member, group, UnionPartnerObjectGetFacing(member, group, &main0_p->arr[group].gname_uname.gname));
}
