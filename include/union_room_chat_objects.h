#ifndef GUARD_UNION_ROOM_CHAT_OBJECTS_H
#define GUARD_UNION_ROOM_CHAT_OBJECTS_H

bool32 UnionRoomChat_TryAllocSpriteWork(void);
void UnionRoomChat_FreeSpriteWork(void);
void UnionRoomChat_CreateSelectorCursorObj(void);
void UnionRoomChat_ToggleSelectorCursorObjVisibility(bool32 invisible);
void UnionRoomChat_MoveSelectorCursorObj(void);
void UnionRoomChat_UpdateObjPalCycle(u32 idx);
void UnionRoomChat_SetSelectorCursorClosedImage(void);
bool32 UnionRoomChat_AnimateSelectorCursorReopen(void);
void UnionRoomChat_SpawnTextEntryPointerSprites(void);
void CreatePageSwitchUISprites(void);
void UpdateVisibleUnionRoomChatIcon(void);

#endif //GUARD_UNION_ROOM_CHAT_OBJECTS_H
