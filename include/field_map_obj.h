#ifndef GUARD_FIELD_MAP_OBJ_H
#define GUARD_FIELD_MAP_OBJ_H

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
u8 GetFieldObjectIdByLocalIdAndMap(u8, u8, u8);
bool8 TryGetFieldObjectIdByLocalIdAndMap(u8, u8, u8, u8 *);
u8 GetFieldObjectIdByXY(s16, s16);
void FieldObjectSetDirection(struct MapObject *, u8);
u8 sub_808D4F4(void);
void RemoveFieldObjectByLocalIdAndMap(u8, u8, u8);
void npc_load_two_palettes__no_record(u16, u8);
void npc_load_two_palettes__and_record(u16, u8);
void sub_805F7C4(u8, u8, u8, s16, s16);
void pal_patch_for_npc(u16, u8);
void sub_808E16C(s16, s16);
void sub_808F28C(u8 localId, u8 mapNum, u8 mapGroup, u8 decorCat);
void sub_8092FF0(s16, s16, s16 *, s16 *);
u8 FieldObjectDirectionToImageAnimId(u8);
void sub_80930E0(s16 *, s16 *, s16, s16);
void FieldObjectClearAnim(struct MapObject *);
void FieldObjectClearAnimIfSpecialAnimActive(struct MapObject *);
void SpawnFieldObjectsInView(s16, s16);
u8 sprite_new(u8, u8, s16, s16, u8, u8);
u8 AddPseudoEventObject(u16, SpriteCallback, s16, s16, u8);
u8 show_sprite(u8, u8, u8);
u8 SpawnSpecialFieldObjectParameterized(u8, u8, u8, s16, s16, u8);
u8 SpawnSpecialFieldObject(struct MapObjectTemplate *);
void sub_8093038(s16, s16, s16 *, s16 *);
void CameraObjectReset1(void);
void CameraObjectReset2(void);
void FieldObjectSetGraphicsId(struct MapObject *, u8);
void FieldObjectTurn(struct MapObject *, u8);
void FieldObjectTurnByLocalIdAndMap(u8, u8, u8, u8);
void FieldObjectForceSetSpecialAnim(struct MapObject *, u8);
u8 sub_8064270(u8 a0);
const struct MapObjectGraphicsInfo *GetFieldObjectGraphicsInfo(u8);
void npc_by_local_id_and_map_set_field_1_bit_x20(u8, u8, u8, u8);
void gpu_pal_allocator_reset__manage_upper_four(void);
void sub_808E82C(u8, u8, u8, s16, s16);
void sub_805F400(u8, u8, u8);
void sub_805F3A8(u8, u8, u8, u8);
void sub_808E75C(s16, s16);
void FieldObjectGetLocalIdAndMap(struct MapObject *, u8 *, u8 *, u8 *);
void npc_coords_shift(struct MapObject *, s16, s16);
void sub_808EB08(struct MapObject *, s16, s16);
void sub_805FE94(u8, u8, u8);
void FieldObjectStep(struct MapObject *, struct Sprite *, bool8(struct MapObject *, struct Sprite *));
u8 FieldObjectFaceOppositeDirection(struct MapObject *, u8);
u8 GetOppositeDirection(u8);
u8 GetStepInPlaceDelay4AnimId(u32);
u8 GetStepInPlaceDelay8AnimId(u32);
u8 GetStepInPlaceDelay16AnimId(u32);
u8 GetStepInPlaceDelay32AnimId(u32);
u8 npc_block_way(struct MapObject *, s16, s16, u32);
void MoveCoords(u8, s16 *, s16 *);
bool8 FieldObjectIsSpecialAnimActive(struct MapObject *);
u8 FieldObjectClearHeldMovementIfFinished(struct MapObject *);
u8 GetFieldObjectIdByXYZ(u16 x, u16 y, u8 z);
void sub_8063E28(struct MapObject *, struct Sprite *);
void FieldObjectSetHeldMovement(struct MapObject *, u8);
void npc_coords_shift_still(struct MapObject *);
void sub_805FE7C(struct MapObject *, u8);
void SetTrainerMovementType(struct MapObject *, u8);
u8 sub_80634F0(u8 direction);
u8 sub_8063500(u8 a0);
void EventObjectSetGraphicsId(struct MapObject *mapObject, u8 a1);
u8 sub_805EB44(u8, u8, s16, s16);
void npc_paltag_set_load(u8 mode);
bool8 FieldObjectIsMovementOverridden(struct MapObject *mapObject);
u8 FieldObjectCheckHeldMovementStatus(struct MapObject *mapObject);
u8 sub_8063F84(u8 direction);
u8 GetTrainerFacingDirectionMovementType(u8 direction);


// Exported data declarations

extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[];
extern const struct SpritePalette gUnknown_83A5348;
extern const struct SpriteTemplate * const gUnknown_83A0010[];

#endif //GUARD_FIELD_MAP_OBJ_H
