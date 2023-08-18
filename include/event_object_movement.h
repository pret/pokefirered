#ifndef GUARD_EVENT_OBJECT_MOVEMENT_H
#define GUARD_EVENT_OBJECT_MOVEMENT_H

// Palette slots for overworld NPCs.
// The same standard set of palettes for overworld objects are normally always loaded at the same
// time while walking around the overworld. The only exceptions are the palettes for the player and
// the "special" NPC, which can be swapped out. This also means that e.g. two "special" NPCs
// with competing palettes cannot be properly loaded at the same time.
enum {
    PALSLOT_PLAYER,
    PALSLOT_PLAYER_REFLECTION,
    PALSLOT_NPC_1,
    PALSLOT_NPC_2,
    PALSLOT_NPC_3,
    PALSLOT_NPC_4,
    PALSLOT_NPC_1_REFLECTION,
    PALSLOT_NPC_2_REFLECTION,
    PALSLOT_NPC_3_REFLECTION,
    PALSLOT_NPC_4_REFLECTION,
    PALSLOT_NPC_SPECIAL,
    PALSLOT_NPC_SPECIAL_REFLECTION,
    OBJ_PALSLOT_COUNT
    // the remaining sprite palette slots (12-15) are used by field effects, the interface, etc.
};

enum SpinnerRunnerFollowPatterns
{
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

struct StepAnimTable
{
    const union AnimCmd *const *anims;
    u8 animPos[4];
};

typedef void (*MovementAction)(u8 direction);

#define GROUND_EFFECT_FLAG_TALL_GRASS_ON_SPAWN   (1 << 0)
#define GROUND_EFFECT_FLAG_TALL_GRASS_ON_MOVE    (1 << 1)
#define GROUND_EFFECT_FLAG_LONG_GRASS_ON_SPAWN   (1 << 2)
#define GROUND_EFFECT_FLAG_LONG_GRASS_ON_MOVE    (1 << 3)
#define GROUND_EFFECT_FLAG_ICE_REFLECTION        (1 << 4)
#define GROUND_EFFECT_FLAG_REFLECTION            (1 << 5)
#define GROUND_EFFECT_FLAG_SHALLOW_FLOWING_WATER (1 << 6)
#define GROUND_EFFECT_FLAG_SAND                  (1 << 7)
#define GROUND_EFFECT_FLAG_DEEP_SAND             (1 << 8)
#define GROUND_EFFECT_FLAG_RIPPLES               (1 << 9)
#define GROUND_EFFECT_FLAG_PUDDLE                (1 << 10)
#define GROUND_EFFECT_FLAG_SAND_PILE             (1 << 11)
#define GROUND_EFFECT_FLAG_LAND_IN_TALL_GRASS    (1 << 12)
#define GROUND_EFFECT_FLAG_LAND_IN_LONG_GRASS    (1 << 13)
#define GROUND_EFFECT_FLAG_LAND_IN_SHALLOW_WATER (1 << 14)
#define GROUND_EFFECT_FLAG_LAND_IN_DEEP_WATER    (1 << 15)
#define GROUND_EFFECT_FLAG_LAND_ON_NORMAL_GROUND (1 << 16)
#define GROUND_EFFECT_FLAG_SHORT_GRASS           (1 << 17)
#define GROUND_EFFECT_FLAG_HOT_SPRINGS           (1 << 18)
#define GROUND_EFFECT_FLAG_SEAWEED               (1 << 19)

struct PairedPalettes
{
    u16 tag;
    const u16 *data;
};

// Exported RAM declarations

// Exported ROM declarations

u8 GetObjectEventIdByLocalIdAndMap(u8, u8, u8);
bool8 TryGetObjectEventIdByLocalIdAndMap(u8, u8, u8, u8 *);
u8 GetObjectEventIdByXY(s16, s16);
void SetObjectEventDirection(struct ObjectEvent *, u8);
void RemoveObjectEventByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup);
u16 GetBoulderRevealFlagByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup);
void LoadPlayerObjectReflectionPalette(u16, u8);
void LoadSpecialObjectReflectionPalette(u16, u8);
void TryMoveObjectEventToMapCoords(u8, u8, u8, s16, s16);
void PatchObjectPalette(u16, u8);
void SpawnObjectEventsOnReturnToField(s16 x, s16 y);
void GetMapCoordsFromSpritePos(s16, s16, s16 *, s16 *);
u8 GetFaceDirectionAnimNum(u8);
void SetSpritePosToOffsetMapCoords(s16 *, s16 *, s16, s16);
void ObjectEventClearHeldMovement(struct ObjectEvent *);
void ObjectEventClearHeldMovementIfActive(struct ObjectEvent *);
u8 CreateVirtualObject(u8 graphicsId, u8 virtualObjId, s16 x, s16 y, u8 elevation, u8 direction);
u8 CreateObjectGraphicsSprite(u16 graphicsId, SpriteCallback callback, s16 x, s16 y, u8 subpriority);
u8 TrySpawnObjectEvent(u8 localId, u8 mapNum, u8 mapGroup);
int SpawnSpecialObjectEventParameterized(u8, u8, u8, s16, s16, u8);
u8 SpawnSpecialObjectEvent(struct ObjectEventTemplate *);
void CameraObjectReset1(void);
void CameraObjectReset2(void);
void ObjectEventSetGraphicsId(struct ObjectEvent *, u8);
void ObjectEventTurn(struct ObjectEvent *, u8);
void ObjectEventTurnByLocalIdAndMap(u8, u8, u8, u8);
void ObjectEventForceSetHeldMovement(struct ObjectEvent *, u8);
const struct ObjectEventGraphicsInfo *GetObjectEventGraphicsInfo(u8);
void SetObjectInvisibility(u8 localId, u8 mapNum, u8 mapGroup, u8 state);
void FreeAndReserveObjectSpritePalettes(void);
void SetObjectPositionByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
void ResetObjectSubpriority(u8 localId, u8 mapNum, u8 mapGroup);
void SetObjectSubpriority(u8 localId, u8 mapNum, u8 mapGroup, u8 subpriority);
void ObjectEventGetLocalIdAndMap(struct ObjectEvent *objectEvent, void *localId, void *mapNum, void *mapGroup);
void ShiftObjectEventCoords(struct ObjectEvent *, s16, s16);
void TryOverrideObjectEventTemplateCoords(u8, u8, u8);
void UpdateObjectEventCurrentMovement(struct ObjectEvent *, struct Sprite *, bool8(struct ObjectEvent *, struct Sprite *));
u8 ObjectEventFaceOppositeDirection(struct ObjectEvent *, u8);
u8 GetOppositeDirection(u8);
u8 GetWalkInPlaceFasterMovementAction(u32);
u8 GetStepInPlaceDelay8AnimId(u32);
u8 GetWalkInPlaceNormalMovementAction(u32);
u8 GetWalkInPlaceSlowMovementAction(u32);
u8 GetWalkInPlaceFastMovementAction(u32);
u8 GetCollisionAtCoords(struct ObjectEvent *, s16, s16, u32);
void MoveCoords(u8, s16 *, s16 *);
bool8 ObjectEventIsHeldMovementActive(struct ObjectEvent *);
u8 ObjectEventClearHeldMovementIfFinished(struct ObjectEvent *);
u8 GetObjectEventIdByPosition(u16 x, u16 y, u8 elevation);
void QL_UpdateObjectEventCurrentMovement(struct ObjectEvent *, struct Sprite *);
bool8 ObjectEventSetHeldMovement(struct ObjectEvent *, u8);
void ShiftStillObjectEventCoords(struct ObjectEvent *);
void OverrideMovementTypeForObjectEvent(const struct ObjectEvent *, u8);
void SetTrainerMovementType(struct ObjectEvent *, u8);
u8 GetFishingDirectionAnimNum(u8 direction);
u8 GetFishingNoCatchDirectionAnimNum(u8 a0);
void ObjectEventSetGraphicsId(struct ObjectEvent *objectEvent, u8 a1);
u8 CreateFameCheckerObject(u8 graphicsId, u8 localId, s16 x, s16 y);
void InitObjectEventPalettes(u8 mode);
bool8 ObjectEventIsMovementOverridden(struct ObjectEvent *objectEvent);
u8 ObjectEventCheckHeldMovementStatus(struct ObjectEvent *objectEvent);
u8 GetWalkNormalMovementAction(u32);
u8 GetWalkFastMovementAction(u32);
u8 GetWalkFasterMovementAction(u32);
u8 GetWalkSlowerMovementAction(u32 direction);
u8 GetTrainerFacingDirectionMovementType(u8 direction);
u8 GetFaceDirectionMovementAction(u32);
u8 GetFaceDirectionFastMovementAction(u32);
void CameraObjectSetFollowedObjectId(u8 objectId);
void UnfreezeObjectEvents(void);
u8 GetSlideMovementAction(u32);
u8 GetJumpInPlaceMovementAction(u32);
u8 GetJumpMovementAction(u32);
u8 GetJump2MovementAction(u32);
bool8 UpdateWalkSlowerAnim(struct Sprite *sprite);
void SetJumpSpriteData(struct Sprite *, u8, u8, u8);
u8 DoJumpSpriteMovement(struct Sprite *);
u8 DoJumpSpecialSpriteMovement(struct Sprite *);
void TurnVirtualObject(u8 virtualObjId, u8 direction);
const u8 *GetObjectEventScriptPointerByObjectEventId(u8 objectEventId);
u8 GetFirstInactiveObjectEventId(void);
u8 GetCollisionFlagsAtCoords(struct ObjectEvent * objectEvent, s16 x, s16 y, u8 direction);
void OverrideTemplateCoordsForObjectEvent(const struct ObjectEvent *objectEvent);
void CancelPlayerForcedMovement(void);
void FreezeObjectEvents(void);
bool8 FreezeObjectEvent(struct ObjectEvent *);
void UnfreezeObjectEvent(struct ObjectEvent *);
void FreezeObjectEventsExceptOne(u8 objEventId);
void SetVirtualObjectGraphics(u8 virtualObjId, u8 direction);
void SetVirtualObjectInvisibility(u8 virtualObjId, bool32 invisible);
bool32 IsVirtualObjectInvisible(u8 virtualObjId);
void SetVirtualObjectSpriteAnim(u8 virtualObjId, u8 animNo);
bool32 IsVirtualObjectAnimating(u8 virtualObjId);
u8 GetJumpSpecialMovementAction(u32 direction);
void EnableObjectGroundEffectsByXY(s16 x, s16 y);
void MoveObjectEventToMapCoords(struct ObjectEvent *objectEvent, s16 x, s16 y);
u8 CreateCopySpriteAt(struct Sprite *sprite, s16 x, s16 y, u8 subpriority);
u16 GetObjectPaletteTag(u8 paletteIndex);
void SetSpritePosToMapCoords(s16 x, s16 y, s16 *x2, s16 *y2);
void UpdateObjectEventSpriteInvisibility(struct Sprite *sprite, bool8 invisible);
u8 ElevationToPriority(u8 elevation);
void ObjectEventUpdateElevation(struct ObjectEvent *pObject);
void SetObjectSubpriorityByElevation(u8 elevation, struct Sprite *sprite, u8 offset);
void CopyObjectGraphicsInfoToSpriteTemplate(u16 graphicsId, void (*callback)(struct Sprite *), struct SpriteTemplate *spriteTemplate, const struct SubspriteTable **subspriteTables);
u8 AddCameraObject(u8 trackedSpriteId);
void UpdateObjectEventsForCameraUpdate(s16 x, s16 y);
void SpriteCB_VirtualObject(struct Sprite *);
void SetMovementDelay(struct Sprite *, s16);
bool8 WaitForMovementDelay(struct Sprite *);
void SetSpriteDataForNormalStep(struct Sprite *, u8, u8);
bool8 NpcTakeStep(struct Sprite *sprite);
void SetWalkSlowerSpriteData(struct Sprite *, u8);
void SetWalkSlowestSpriteData(struct Sprite *, u8);
bool8 UpdateWalkSlowestAnim(struct Sprite *sprite);
void SetWalkSlowSpriteData(struct Sprite *, u8);
bool8 UpdateWalkSlowAnim(struct Sprite *sprite);
void DoShadowFieldEffect(struct ObjectEvent *);
void SetRunSlowSpriteData(struct Sprite *, u8);
bool8 UpdateRunSlowAnim(struct Sprite *sprite);
void SetAndStartSpriteAnim(struct Sprite *, u8, u8);
bool8 SpriteAnimEnded(struct Sprite *);
u8 ObjectEventGetHeldMovementActionId(struct ObjectEvent *objectEvent);
u8 GetMoveDirectionAnimNum(u8 direction);

// Exported data declarations

extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[];
extern const struct SpritePalette gSpritePalette_GeneralFieldEffect1;
extern const struct SpriteTemplate * const gFieldEffectObjectTemplatePointers[];
extern const struct OamData gObjectEventBaseOam_32x32;
extern const u16 gFieldEffectObjectPic_CutGrass[];
extern const u16 gFieldEffectPal_CutGrass[];
extern const u8 gReflectionEffectPaletteMap[];
u8 GetLedgeJumpDirection(s16 x, s16 y, u8 direction);
u8 GetGlideMovementAction(u32 direction);
u8 GetRideWaterCurrentMovementAction(u32 direction);
u8 GetPlayerRunMovementAction(u32 direction);
u8 GetPlayerRunSlowMovementAction(u32 direction);
u8 GetWalkSlowMovementAction(u32 direction);
u8 GetSpinMovementAction(u32 direction);
u8 GetAcroWheelieFaceDirectionMovementAction(u32 direction);
u8 GetAcroPopWheelieFaceDirectionMovementAction(u32 direction);
u8 GetAcroEndWheelieFaceDirectionMovementAction(u32 direction);
u8 GetAcroWheelieHopFaceDirectionMovementAction(u32 direction);
u8 GetAcroWheelieHopMovementAction(u32 direction);
u8 GetAcroPopWheelieMoveMovementAction(u32 direction);
u8 GetAcroWheelieJumpMovementAction(u32 direction);
u8 GetJumpInPlaceTurnAroundMovementAction(u32 direction);
u8 GetAcroWheelieInPlaceMovementAction(u32 direction);
u8 GetAcroPopWheelieMoveMovementAction(u32 direction);
u8 GetAcroWheelieMoveMovementAction(u32 direction);
u8 GetJumpSpecialWithEffectMovementAction(u32 direction);
u8 GetFishingBiteDirectionAnimNum(u8 direction);
void TrySpawnObjectEvents(s16 cameraX, s16 cameraY);
void ResetObjectEvents(void);

#endif // GUARD_EVENT_OBJECT_MOVEMENT_H
