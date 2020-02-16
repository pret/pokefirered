#ifndef GUARD_UNION_ROOM_PLAYER_AVATAR_H
#define GUARD_UNION_ROOM_PLAYER_AVATAR_H

#include "union_room.h"

u8 ZeroUnionObjWork(struct UnionObj * ptr);
void DeleteUnionObjWorkAndStopTask(void);
void CreateGroupMemberObjectsInvisible(u8 *spriteIds, s32 group);
void DestroyGroupMemberObjects(u8 *spriteIds);
void MakeGroupAssemblyAreasPassable(void);
void ScheduleUnionRoomPlayerRefresh(struct UnkStruct_URoom *uroom_p);
void HandleUnionRoomPlayerRefresh(struct UnkStruct_URoom *uroom_p);
bool32 RfuUnionTool_GetGroupAndMemberInFrontOfPlayer(struct UnkStruct_Main0 *main0_p, s16 *member_p, s16 *group_p, u8 *spriteIds);
void UpdateUnionGroupMemberFacing(u32 member, u32 group, struct UnkStruct_Main0 *main0_p);

#endif //GUARD_UNION_ROOM_PLAYER_AVATAR_H
