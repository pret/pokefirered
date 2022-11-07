#ifndef GUARD_UNION_ROOM_PLAYER_AVATAR_H
#define GUARD_UNION_ROOM_PLAYER_AVATAR_H

#include "union_room.h"

u8 ZeroUnionObjWork(struct UnionRoomObject * ptr);
void DestroyUnionRoomPlayerObjects(void);
void CreateGroupMemberObjectsInvisible(u8 *spriteIds, s32 group);
void DestroyGroupMemberObjects(u8 *spriteIds);
void MakeGroupAssemblyAreasPassable(void);
void ScheduleUnionRoomPlayerRefresh(struct WirelessLink_URoom *uroom_p);
void HandleUnionRoomPlayerRefresh(struct WirelessLink_URoom *uroom_p);
bool32 TryInteractWithUnionRoomMember(struct RfuPlayerList *main0_p, s16 *member_p, s16 *group_p, u8 *spriteIds);
void UpdateUnionGroupMemberFacing(u32 member, u32 group, struct RfuPlayerList *main0_p);

#endif //GUARD_UNION_ROOM_PLAYER_AVATAR_H
