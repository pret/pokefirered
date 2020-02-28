#ifndef GUARD_EVENT_OBJECT_MOVEMENT_H
#define GUARD_EVENT_OBJECT_MOVEMENT_H

#include "global.h"

#define NUM_OBJECT_GRAPHICS_INFO 239
#define SPRITE_VAR 240

// Exported struct declarations

enum SpinnerRunnerFollowPatterns {
    RUNFOLLOW_ANY,
    RUNFOLLOW_NORTH_SOUTH,
    RUNFOLLOW_EAST_WEST,
    RUNFOLLOW_NORTH_WEST,
    RUNFOLLOW_NORTH_EAST,
    RUNFOLLOW_SOUTH_WEST,
    RUNFOLLOW_SOUTH_EAST,
    RUNFOLLOW_NORTH_SOUTH_WEST,
    RUNFOLLOW_NORTH_SOUTH_EAST,
    RUNFOLLOW_NORTH_EAST_WEST,
    RUNFOLLOW_SOUTH_EAST_WEST
};

// Exported RAM declarations

// Exported ROM declarations

void sub_808D438(void);
u8 GetObjectEventIdByLocalIdAndMap(u8, u8, u8);
bool8 TryGetObjectEventIdByLocalIdAndMap(u8, u8, u8, u8 *);
u8 GetObjectEventIdByXY(s16, s16);
void ObjectEventSetDirection(struct ObjectEvent *, u8);
u8 sub_808D4F4(void);
void RemoveObjectEventByLocalIdAndMap(u8, u8, u8);
void npc_load_two_palettes__no_record(u16, u8);
void npc_load_two_palettes__and_record(u16, u8);
void sub_805F7C4(u8, u8, u8, s16, s16);
void pal_patch_for_npc(u16, u8);
void sub_808E16C(s16, s16);
void sub_808F28C(u8 localId, u8 mapNum, u8 mapGroup, u8 decorCat);
void sub_8092FF0(s16, s16, s16 *, s16 *);
u8 ObjectEventDirectionToImageAnimId(u8);
void sub_80930E0(s16 *, s16 *, s16, s16);
void ObjectEventClearAnim(struct ObjectEvent *);
void ObjectEventClearAnimIfSpecialAnimActive(struct ObjectEvent *);
void SpawnObjectEventsInView(s16, s16);
u8 sprite_new(u8, u8, s16, s16, u8, u8);
u8 AddPseudoObjectEvent(u16, SpriteCallback, s16, s16, u8);
u8 TrySpawnObjectEvent(u8 localId, u8 mapNum, u8 mapGroup);
int SpawnSpecialObjectEventParameterized(u8, u8, u8, s16, s16, u8);
u8 SpawnSpecialObjectEvent(struct ObjectEventTemplate *);
void sub_8093038(s16, s16, s16 *, s16 *);
void CameraObjectReset1(void);
void CameraObjectReset2(void);
void ObjectEventSetGraphicsId(struct ObjectEvent *, u8);
void ObjectEventTurn(struct ObjectEvent *, u8);
void ObjectEventTurnByLocalIdAndMap(u8, u8, u8, u8);
void ObjectEventForceSetSpecialAnim(struct ObjectEvent *, u8);
u8 sub_8064270(u8 a0);
const struct ObjectEventGraphicsInfo *GetObjectEventGraphicsInfo(u8);
void npc_by_local_id_and_map_set_field_1_bit_x20(u8, u8, u8, u8);
void gpu_pal_allocator_reset__manage_upper_four(void);
void sub_808E82C(u8, u8, u8, s16, s16);
void sub_805F400(u8, u8, u8);
void sub_805F3A8(u8, u8, u8, u8);
void sub_808E75C(s16, s16);
void ObjectEventGetLocalIdAndMap(struct ObjectEvent * objectEvent, u8 *localId, u8 *mapNum, u8 *mapGroup);
void npc_coords_shift(struct ObjectEvent *, s16, s16);
void sub_808EB08(struct ObjectEvent *, s16, s16);
void sub_805FE94(u8, u8, u8);
void ObjectEventStep(struct ObjectEvent *, struct Sprite *, bool8(struct ObjectEvent *, struct Sprite *));
u8 ObjectEventFaceOppositeDirection(struct ObjectEvent *, u8);
u8 GetOppositeDirection(u8);
u8 GetStepInPlaceDelay4AnimId(u32);
u8 GetStepInPlaceDelay8AnimId(u32);
u8 GetStepInPlaceDelay16AnimId(u32);
u8 GetStepInPlaceDelay32AnimId(u32);
u8 GetCollisionAtCoords(struct ObjectEvent *, s16, s16, u32);
void MoveCoords(u8, s16 *, s16 *);
bool8 ObjectEventIsSpecialAnimActive(struct ObjectEvent *);
u8 ObjectEventClearHeldMovementIfFinished(struct ObjectEvent *);
u8 GetObjectEventIdByXYZ(u16 x, u16 y, u8 z);
void sub_8063E28(struct ObjectEvent *, struct Sprite *);
bool8 ObjectEventSetHeldMovement(struct ObjectEvent *, u8);
void npc_coords_shift_still(struct ObjectEvent *);
void TryOverrideTemplateCoordsForObjectEvent(struct ObjectEvent *, u8);
void SetTrainerMovementType(struct ObjectEvent *, u8);
u8 sub_80634F0(u8 direction);
u8 sub_8063500(u8 a0);
void ObjectEventSetGraphicsId(struct ObjectEvent *objectEvent, u8 a1);
u8 sub_805EB44(u8, u8, s16, s16);
void npc_paltag_set_load(u8 mode);
bool8 ObjectEventIsMovementOverridden(struct ObjectEvent *objectEvent);
u8 ObjectEventCheckHeldMovementStatus(struct ObjectEvent *objectEvent);
u8 GetWalkNormalMovementAction(u8 direction);
u8 GetTrainerFacingDirectionMovementType(u8 direction);
void CameraObjectSetFollowedObjectId(u8 spriteId);
void UnfreezeObjectEvents(void);
void TurnObjectEvent(u8, u8);
const u8 *GetObjectEventScriptPointerByObjectEventId(u8 objectEventId);
u8 GetIndexOfFirstInactiveObjectEvent(void);
u8 GetCollisionFlagsAtCoords(struct ObjectEvent * objectEvent, s16 x, s16 y, u8 direction);
u8 GetFaceDirectionMovementAction(u8 direction);
u8 GetJumpInPlaceMovementAction(u8 direction);
u8 sub_8063FB0(u8 direction);
void OverrideTemplateCoordsForObjectEvent(struct ObjectEvent *);
void sub_805C774(void);

void FreezeObjectEvents(void);
bool8 FreezeObjectEvent(struct ObjectEvent *);
void UnfreezeObjectEvent(struct ObjectEvent *);
void FreezeObjectEventsExceptOne(u8 objEventId);
void RfuUnionObjectSetFacingDirection(u8 objectEventId, u8 direction);
void RfuUnionObjectToggleInvisibility(u8 objectEventId, bool32 invisible);
bool32 RfuUnionObjectIsInvisible(u8 objectEventId);
void RfuUnionObjectStartWarp(u8 objectEventId, u8 animNo);
bool32 RfuUnionObjectIsWarping(u8 objectEventId);
u8 sub_8063F2C(u8 direction);

void sub_805F378(s16 x, s16 y);

// Exported data declarations

extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[];
extern const struct SpritePalette gUnknown_83A5348;
extern const struct SpriteTemplate * const gFieldEffectObjectTemplatePointers[];
extern const struct OamData gObjectEventBaseOam_32x32;
extern const struct UCoords16 gUnknown_83A64C8[];
extern const u16 gUnknown_8398648[];
extern const u16 gUnknown_8398688[];

#endif // GUARD_EVENT_OBJECT_MOVEMENT_H
