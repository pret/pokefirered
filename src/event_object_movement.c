#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "field_camera.h"
#include "field_control_avatar.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "quest_log.h"
#include "random.h"
#include "script.h"
#include "trainer_see.h"
#include "trig.h"
#include "constants/maps.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/trainer_types.h"
#include "constants/union_room.h"

static void MoveCoordsInDirection(u32, s16 *, s16 *, s16, s16);
static bool8 ObjectEventExecSingleMovementAction(struct ObjectEvent *, struct Sprite *);
static u8 GetCollisionInDirection(struct ObjectEvent *, u8);
static u32 GetCopyDirection(u8, u32, u32);
static void TryEnableObjectEventAnim(struct ObjectEvent *, struct Sprite *);
static void ObjectEventExecHeldMovementAction(struct ObjectEvent *, struct Sprite *);
static void UpdateObjectEventSpriteAnimPause(struct ObjectEvent *, struct Sprite *);
static bool8 IsCoordOutsideObjectEventMovementRange(struct ObjectEvent *, s16, s16);
static bool8 IsMetatileDirectionallyImpassable(struct ObjectEvent *, s16, s16, u8);
static bool8 DoesObjectCollideWithObjectAt(struct ObjectEvent *, s16, s16);
static void CalcWhetherObjectIsOffscreen(struct ObjectEvent *, struct Sprite *);
static void UpdateObjEventSpriteVisibility(struct ObjectEvent *, struct Sprite *);
static void ObjectEventUpdateMetatileBehaviors(struct ObjectEvent *);
static void GetGroundEffectFlags_Reflection(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_TallGrassOnSpawn(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_LongGrassOnSpawn(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_SandHeap(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_ShallowFlowingWater(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_ShortGrass(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_HotSprings(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_TallGrassOnBeginStep(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_LongGrassOnBeginStep(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_Tracks(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_Puddle(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_Ripple(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_Seaweed(struct ObjectEvent *, u32 *);
static void GetGroundEffectFlags_JumpLanding(struct ObjectEvent *, u32 *);
static u8 ObjectEventCheckForReflectiveSurface(struct ObjectEvent *);
static u8 GetReflectionTypeByMetatileBehavior(u32);
static void InitObjectPriorityByElevation(struct Sprite *sprite, u8 elevation);
static void ObjectEventUpdateSubpriority(struct ObjectEvent *, struct Sprite *);
static void DoTracksGroundEffect_None(struct ObjectEvent *, struct Sprite *, u8);
static void DoTracksGroundEffect_Footprints(struct ObjectEvent *, struct Sprite *, u8);
static void DoTracksGroundEffect_BikeTireTracks(struct ObjectEvent *, struct Sprite *, u8);
static void DoRippleFieldEffect(struct ObjectEvent *, struct Sprite *);
static void DoGroundEffects_OnSpawn(struct ObjectEvent *, struct Sprite *);
static void DoGroundEffects_OnBeginStep(struct ObjectEvent *, struct Sprite *);
static void DoGroundEffects_OnFinishStep(struct ObjectEvent *, struct Sprite *);
static void CreateReflectionEffectSprites(void);
static u8 GetObjectEventIdByLocalId(u8);
static u8 GetObjectEventIdByLocalIdAndMapInternal(u8, u8, u8);
static bool8 GetAvailableObjectEventId(u16, u8, u8, u8 *);
static void SetObjectEventDynamicGraphicsId(struct ObjectEvent *);
static void RemoveObjectEventInternal(struct ObjectEvent *);
static u16 GetObjectEventFlagIdByObjectEventId(u8);
static void UpdateObjectEventVisibility(struct ObjectEvent *, struct Sprite *);
static void MakeObjectTemplateFromObjectEventTemplate(const struct ObjectEventTemplate *, struct SpriteTemplate *, const struct SubspriteTable **);
static void GetObjectEventMovingCameraOffset(s16 *, s16 *);
static const struct ObjectEventTemplate *GetObjectEventTemplateByLocalIdAndMap(u8, u8, u8);
static void LoadObjectEventPalette(u16);
static void RemoveObjectEventIfOutsideView(struct ObjectEvent *);
static void SpawnObjectEventOnReturnToField(u8 objectEventId, s16 x, s16 y);
static void SetPlayerAvatarObjectEventIdAndObjectId(u8, u8);
static void ResetObjectEventFldEffData(struct ObjectEvent *);
static u8 TryLoadObjectPalette(const struct SpritePalette *spritePalette);
static u8 FindObjectEventPaletteIndexByTag(u16);
static bool8 ObjectEventDoesElevationMatch(struct ObjectEvent *, u8);
static bool8 IsElevationMismatchAt(u8 elevation, s16 x, s16 y);
static bool8 AreElevationsCompatible(u8 a, u8 b);
static void ObjectCB_CameraObject(struct Sprite *);
static void CameraObject_0(struct Sprite *);
static void CameraObject_1(struct Sprite *);
static void CameraObject_2(struct Sprite *);
static const struct ObjectEventTemplate *FindObjectEventTemplateByLocalId(u8 localId, const struct ObjectEventTemplate *templates, u8 count);
static void ClearObjectEventMovement(struct ObjectEvent *, struct Sprite *);
static void ObjectEventSetSingleMovement(struct ObjectEvent *, struct Sprite *, u8);
static bool8 ShouldInitObjectEventStateFromTemplate(const struct ObjectEventTemplate *, u8, s16, s16);
static bool8 TemplateIsObstacleAndWithinView(const struct ObjectEventTemplate *, s16, s16);
static bool8 TemplateIsObstacleAndVisibleFromConnectingMap(const struct ObjectEventTemplate *, s16, s16);
static void SetHideObstacleFlag(const struct ObjectEventTemplate *);
static bool8 MovementType_Disguise_Callback(struct ObjectEvent *, struct Sprite *);
static bool8 MovementType_Buried_Callback(struct ObjectEvent *, struct Sprite *);
static u8 MovementType_RaiseHandAndStop_Callback(struct ObjectEvent *, struct Sprite *);
static u8 MovementType_RaiseHandAndJump_Callback(struct ObjectEvent *, struct Sprite *);
static u8 MovementType_RaiseHandAndSwim_Callback(struct ObjectEvent *, struct Sprite *);
static void QuestLogObjectEventExecHeldMovementAction(struct ObjectEvent *, struct Sprite *);
static void VirtualObject_UpdateAnim(struct Sprite *sprite);
static void MovementType_None(struct Sprite *);
static void MovementType_LookAround(struct Sprite *);
static void MovementType_WanderAround(struct Sprite *);
static void MovementType_WanderUpAndDown(struct Sprite *);
static void MovementType_WanderLeftAndRight(struct Sprite *);
static void MovementType_FaceDirection(struct Sprite *);
static void MovementType_FaceDownAndUp(struct Sprite *);
static void MovementType_FaceLeftAndRight(struct Sprite *);
static void MovementType_FaceUpAndLeft(struct Sprite *);
static void MovementType_FaceUpAndRight(struct Sprite *);
static void MovementType_FaceDownAndLeft(struct Sprite *);
static void MovementType_FaceDownAndRight(struct Sprite *);
static void MovementType_FaceDownUpAndLeft(struct Sprite *);
static void MovementType_FaceDownUpAndRight(struct Sprite *);
static void MovementType_FaceUpRightAndLeft(struct Sprite *);
static void MovementType_FaceDownRightAndLeft(struct Sprite *);
static void MovementType_RotateCounterclockwise(struct Sprite *);
static void MovementType_RotateClockwise(struct Sprite *);
static void MovementType_WalkBackAndForth(struct Sprite *);
static void MovementType_WalkSequenceUpRightLeftDown(struct Sprite *);
static void MovementType_WalkSequenceRightLeftDownUp(struct Sprite *);
static void MovementType_WalkSequenceDownUpRightLeft(struct Sprite *);
static void MovementType_WalkSequenceLeftDownUpRight(struct Sprite *);
static void MovementType_WalkSequenceUpLeftRightDown(struct Sprite *);
static void MovementType_WalkSequenceLeftRightDownUp(struct Sprite *);
static void MovementType_WalkSequenceDownUpLeftRight(struct Sprite *);
static void MovementType_WalkSequenceRightDownUpLeft(struct Sprite *);
static void MovementType_WalkSequenceLeftUpDownRight(struct Sprite *);
static void MovementType_WalkSequenceUpDownRightLeft(struct Sprite *);
static void MovementType_WalkSequenceRightLeftUpDown(struct Sprite *);
static void MovementType_WalkSequenceDownRightLeftUp(struct Sprite *);
static void MovementType_WalkSequenceRightUpDownLeft(struct Sprite *);
static void MovementType_WalkSequenceUpDownLeftRight(struct Sprite *);
static void MovementType_WalkSequenceLeftRightUpDown(struct Sprite *);
static void MovementType_WalkSequenceDownLeftRightUp(struct Sprite *);
static void MovementType_WalkSequenceUpLeftDownRight(struct Sprite *);
static void MovementType_WalkSequenceDownRightUpLeft(struct Sprite *);
static void MovementType_WalkSequenceLeftDownRightUp(struct Sprite *);
static void MovementType_WalkSequenceRightUpLeftDown(struct Sprite *);
static void MovementType_WalkSequenceUpRightDownLeft(struct Sprite *);
static void MovementType_WalkSequenceDownLeftUpRight(struct Sprite *);
static void MovementType_WalkSequenceLeftUpRightDown(struct Sprite *);
static void MovementType_WalkSequenceRightDownLeftUp(struct Sprite *);
static void MovementType_CopyPlayer(struct Sprite *);
static void MovementType_TreeDisguise(struct Sprite *);
static void MovementType_MountainDisguise(struct Sprite *);
static void MovementType_CopyPlayerInGrass(struct Sprite *);
static void MovementType_Buried(struct Sprite *);
static void MovementType_WalkInPlace(struct Sprite *);
static void MovementType_WalkInPlaceFast(struct Sprite *);
static void MovementType_JogInPlace(struct Sprite *);
static void MovementType_Invisible(struct Sprite *);
static void MovementType_RaiseHandAndStop(struct Sprite *);
static void MovementType_RaiseHandAndJump(struct Sprite *);
static void MovementType_RaiseHandAndSwim(struct Sprite *);
static void MovementType_WanderAroundSlower(struct Sprite *);

enum {
    MOVE_SPEED_NORMAL, // walking
    MOVE_SPEED_FAST_1, // running / surfing / sliding (ice tile)
    MOVE_SPEED_FAST_2, // water current / bicycle
    MOVE_SPEED_FASTER, // going down cycling road on bicycle
    MOVE_SPEED_FASTEST,
};

enum {
    JUMP_DISTANCE_IN_PLACE,
    JUMP_DISTANCE_NORMAL,
    JUMP_DISTANCE_FAR,
};

#define movement_type_def(setup, table)                                                          \
static u8 setup##_callback(struct ObjectEvent *, struct Sprite *);                               \
void setup(struct Sprite *sprite)                                                                \
{                                                                                                \
    UpdateObjectEventCurrentMovement(&gObjectEvents[sprite->data[0]], sprite, setup##_callback); \
}                                                                                                \
static u8 setup##_callback(struct ObjectEvent *objectEvent, struct Sprite *sprite)               \
{                                                                                                \
    return table[sprite->data[1]](objectEvent, sprite);                                          \
}

#define movement_type_empty_callback(setup)                                                      \
static u8 setup##_callback(struct ObjectEvent *, struct Sprite *);                               \
void setup(struct Sprite *sprite)                                                                \
{                                                                                                \
    UpdateObjectEventCurrentMovement(&gObjectEvents[sprite->data[0]], sprite, setup##_callback); \
}                                                                                                \
static u8 setup##_callback(struct ObjectEvent *objectEvent, struct Sprite *sprite)               \
{                                                                                                \
    return 0;                                                                                    \
}

EWRAM_DATA u8 sCurrentReflectionType = 0;
EWRAM_DATA u16 sCurrentSpecialObjectPaletteTag = 0;

const u8 gReflectionEffectPaletteMap[16] = {
    [PALSLOT_PLAYER]                 = PALSLOT_PLAYER_REFLECTION,
    [PALSLOT_PLAYER_REFLECTION]      = PALSLOT_PLAYER_REFLECTION,
    [PALSLOT_NPC_1]                  = PALSLOT_NPC_1_REFLECTION,
    [PALSLOT_NPC_2]                  = PALSLOT_NPC_2_REFLECTION,
    [PALSLOT_NPC_3]                  = PALSLOT_NPC_3_REFLECTION,
    [PALSLOT_NPC_4]                  = PALSLOT_NPC_4_REFLECTION,
    [PALSLOT_NPC_1_REFLECTION]       = PALSLOT_NPC_1_REFLECTION,
    [PALSLOT_NPC_2_REFLECTION]       = PALSLOT_NPC_2_REFLECTION,
    [PALSLOT_NPC_3_REFLECTION]       = PALSLOT_NPC_3_REFLECTION,
    [PALSLOT_NPC_4_REFLECTION]       = PALSLOT_NPC_4_REFLECTION,
    [PALSLOT_NPC_SPECIAL]            = PALSLOT_NPC_SPECIAL_REFLECTION,
    [PALSLOT_NPC_SPECIAL_REFLECTION] = PALSLOT_NPC_SPECIAL_REFLECTION
};

static const struct SpriteTemplate gCameraSpriteTemplate = {
    .tileTag = 0, 
    .paletteTag = TAG_NONE,
    .oam = &gDummyOamData, 
    .anims = gDummySpriteAnimTable, 
    .images = NULL, 
    .affineAnims = gDummySpriteAffineAnimTable, 
    .callback = ObjectCB_CameraObject
};

void (*const gCameraObjectFuncs[])(struct Sprite *) = {
    CameraObject_0,
    CameraObject_1,
    CameraObject_2,
};

#include "data/object_events/object_event_graphics.h"

static void (*const sMovementTypeCallbacks[MOVEMENT_TYPES_COUNT])(struct Sprite *) = {
    [MOVEMENT_TYPE_NONE]                                  = MovementType_None,
    [MOVEMENT_TYPE_LOOK_AROUND]                           = MovementType_LookAround,
    [MOVEMENT_TYPE_WANDER_AROUND]                         = MovementType_WanderAround,
    [MOVEMENT_TYPE_WANDER_UP_AND_DOWN]                    = MovementType_WanderUpAndDown,
    [MOVEMENT_TYPE_WANDER_DOWN_AND_UP]                    = MovementType_WanderUpAndDown,
    [MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT]                 = MovementType_WanderLeftAndRight,
    [MOVEMENT_TYPE_WANDER_RIGHT_AND_LEFT]                 = MovementType_WanderLeftAndRight,
    [MOVEMENT_TYPE_FACE_UP]                               = MovementType_FaceDirection,
    [MOVEMENT_TYPE_FACE_DOWN]                             = MovementType_FaceDirection,
    [MOVEMENT_TYPE_FACE_LEFT]                             = MovementType_FaceDirection,
    [MOVEMENT_TYPE_FACE_RIGHT]                            = MovementType_FaceDirection,
    [MOVEMENT_TYPE_PLAYER]                                = MovementType_Player,
    [MOVEMENT_TYPE_BERRY_TREE_GROWTH]                     = NULL,
    [MOVEMENT_TYPE_FACE_DOWN_AND_UP]                      = MovementType_FaceDownAndUp,
    [MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT]                   = MovementType_FaceLeftAndRight,
    [MOVEMENT_TYPE_FACE_UP_AND_LEFT]                      = MovementType_FaceUpAndLeft,
    [MOVEMENT_TYPE_FACE_UP_AND_RIGHT]                     = MovementType_FaceUpAndRight,
    [MOVEMENT_TYPE_FACE_DOWN_AND_LEFT]                    = MovementType_FaceDownAndLeft,
    [MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT]                   = MovementType_FaceDownAndRight,
    [MOVEMENT_TYPE_FACE_DOWN_UP_AND_LEFT]                 = MovementType_FaceDownUpAndLeft,
    [MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT]                = MovementType_FaceDownUpAndRight,
    [MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT]                = MovementType_FaceUpRightAndLeft,
    [MOVEMENT_TYPE_FACE_DOWN_LEFT_AND_RIGHT]              = MovementType_FaceDownRightAndLeft,
    [MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE]               = MovementType_RotateCounterclockwise,
    [MOVEMENT_TYPE_ROTATE_CLOCKWISE]                      = MovementType_RotateClockwise,
    [MOVEMENT_TYPE_WALK_UP_AND_DOWN]                      = MovementType_WalkBackAndForth,
    [MOVEMENT_TYPE_WALK_DOWN_AND_UP]                      = MovementType_WalkBackAndForth,
    [MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT]                   = MovementType_WalkBackAndForth,
    [MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT]                   = MovementType_WalkBackAndForth,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN]      = MovementType_WalkSequenceUpRightLeftDown,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_DOWN_UP]      = MovementType_WalkSequenceRightLeftDownUp,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_RIGHT_LEFT]      = MovementType_WalkSequenceDownUpRightLeft,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_UP_RIGHT]      = MovementType_WalkSequenceLeftDownUpRight,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_RIGHT_DOWN]      = MovementType_WalkSequenceUpLeftRightDown,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_DOWN_UP]      = MovementType_WalkSequenceLeftRightDownUp,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_LEFT_RIGHT]      = MovementType_WalkSequenceDownUpLeftRight,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_UP_LEFT]      = MovementType_WalkSequenceRightDownUpLeft,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_DOWN_RIGHT]      = MovementType_WalkSequenceLeftUpDownRight,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_RIGHT_LEFT]      = MovementType_WalkSequenceUpDownRightLeft,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_UP_DOWN]      = MovementType_WalkSequenceRightLeftUpDown,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_LEFT_UP]      = MovementType_WalkSequenceDownRightLeftUp,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_DOWN_LEFT]      = MovementType_WalkSequenceRightUpDownLeft,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_LEFT_RIGHT]      = MovementType_WalkSequenceUpDownLeftRight,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_UP_DOWN]      = MovementType_WalkSequenceLeftRightUpDown,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_RIGHT_UP]      = MovementType_WalkSequenceDownLeftRightUp,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT]      = MovementType_WalkSequenceUpLeftDownRight,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT]      = MovementType_WalkSequenceDownRightUpLeft,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP]      = MovementType_WalkSequenceLeftDownRightUp,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_LEFT_DOWN]      = MovementType_WalkSequenceRightUpLeftDown,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_DOWN_LEFT]      = MovementType_WalkSequenceUpRightDownLeft,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT]      = MovementType_WalkSequenceDownLeftUpRight,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN]      = MovementType_WalkSequenceLeftUpRightDown,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP]      = MovementType_WalkSequenceRightDownLeftUp,
    [MOVEMENT_TYPE_COPY_PLAYER]                           = MovementType_CopyPlayer,
    [MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE]                  = MovementType_CopyPlayer,
    [MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE]          = MovementType_CopyPlayer,
    [MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE]                 = MovementType_CopyPlayer,
    [MOVEMENT_TYPE_TREE_DISGUISE]                         = MovementType_TreeDisguise,
    [MOVEMENT_TYPE_MOUNTAIN_DISGUISE]                     = MovementType_MountainDisguise,
    [MOVEMENT_TYPE_COPY_PLAYER_IN_GRASS]                  = MovementType_CopyPlayerInGrass,
    [MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE_IN_GRASS]         = MovementType_CopyPlayerInGrass,
    [MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE_IN_GRASS] = MovementType_CopyPlayerInGrass,
    [MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE_IN_GRASS]        = MovementType_CopyPlayerInGrass,
    [MOVEMENT_TYPE_BURIED]                                = MovementType_Buried,
    [MOVEMENT_TYPE_WALK_IN_PLACE_DOWN]                    = MovementType_WalkInPlace,
    [MOVEMENT_TYPE_WALK_IN_PLACE_UP]                      = MovementType_WalkInPlace,
    [MOVEMENT_TYPE_WALK_IN_PLACE_LEFT]                    = MovementType_WalkInPlace,
    [MOVEMENT_TYPE_WALK_IN_PLACE_RIGHT]                   = MovementType_WalkInPlace,
    [MOVEMENT_TYPE_WALK_IN_PLACE_FAST_DOWN]               = MovementType_WalkInPlaceFast,
    [MOVEMENT_TYPE_WALK_IN_PLACE_FAST_UP]                 = MovementType_WalkInPlaceFast,
    [MOVEMENT_TYPE_WALK_IN_PLACE_FAST_LEFT]               = MovementType_WalkInPlaceFast,
    [MOVEMENT_TYPE_WALK_IN_PLACE_FAST_RIGHT]              = MovementType_WalkInPlaceFast,
    [MOVEMENT_TYPE_JOG_IN_PLACE_DOWN]                     = MovementType_JogInPlace,
    [MOVEMENT_TYPE_JOG_IN_PLACE_UP]                       = MovementType_JogInPlace,
    [MOVEMENT_TYPE_JOG_IN_PLACE_LEFT]                     = MovementType_JogInPlace,
    [MOVEMENT_TYPE_JOG_IN_PLACE_RIGHT]                    = MovementType_JogInPlace,
    [MOVEMENT_TYPE_INVISIBLE]                             = MovementType_Invisible,
    [MOVEMENT_TYPE_RAISE_HAND_AND_STOP]                   = MovementType_RaiseHandAndStop,
    [MOVEMENT_TYPE_RAISE_HAND_AND_JUMP]                   = MovementType_RaiseHandAndJump,
    [MOVEMENT_TYPE_RAISE_HAND_AND_SWIM]                   = MovementType_RaiseHandAndSwim,
    [MOVEMENT_TYPE_WANDER_AROUND_SLOWER]                  = MovementType_WanderAroundSlower,
};

static const bool8 gRangedMovementTypes[MOVEMENT_TYPES_COUNT] = {
    [MOVEMENT_TYPE_WANDER_AROUND] = TRUE,
    [MOVEMENT_TYPE_WANDER_UP_AND_DOWN] = TRUE,
    [MOVEMENT_TYPE_WANDER_DOWN_AND_UP] = TRUE,
    [MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT] = TRUE,
    [MOVEMENT_TYPE_WANDER_RIGHT_AND_LEFT] = TRUE,
    [MOVEMENT_TYPE_WALK_UP_AND_DOWN] = TRUE,
    [MOVEMENT_TYPE_WALK_DOWN_AND_UP] = TRUE,
    [MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT] = TRUE,
    [MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_DOWN_UP] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_RIGHT_LEFT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_UP_RIGHT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_RIGHT_DOWN] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_DOWN_UP] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_LEFT_RIGHT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_UP_LEFT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_DOWN_RIGHT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_RIGHT_LEFT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_UP_DOWN] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_LEFT_UP] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_DOWN_LEFT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_LEFT_RIGHT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_UP_DOWN] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_RIGHT_UP] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_LEFT_DOWN] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_DOWN_LEFT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN] = TRUE,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP] = TRUE,
    [MOVEMENT_TYPE_COPY_PLAYER] = TRUE,
    [MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE] = TRUE,
    [MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE] = TRUE,
    [MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE] = TRUE,
    [MOVEMENT_TYPE_COPY_PLAYER_IN_GRASS] = TRUE,
    [MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE_IN_GRASS] = TRUE,
    [MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE_IN_GRASS] = TRUE,
    [MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE_IN_GRASS] = TRUE,
    [MOVEMENT_TYPE_WANDER_AROUND_SLOWER] = TRUE,
};

static const u8 gInitialMovementTypeFacingDirections[MOVEMENT_TYPES_COUNT] = {
    [MOVEMENT_TYPE_NONE] = DIR_SOUTH,
    [MOVEMENT_TYPE_LOOK_AROUND] = DIR_SOUTH,
    [MOVEMENT_TYPE_WANDER_AROUND] = DIR_SOUTH,
    [MOVEMENT_TYPE_WANDER_UP_AND_DOWN] = DIR_NORTH,
    [MOVEMENT_TYPE_WANDER_DOWN_AND_UP] = DIR_SOUTH,
    [MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT] = DIR_WEST,
    [MOVEMENT_TYPE_WANDER_RIGHT_AND_LEFT] = DIR_EAST,
    [MOVEMENT_TYPE_FACE_UP] = DIR_NORTH,
    [MOVEMENT_TYPE_FACE_DOWN] = DIR_SOUTH,
    [MOVEMENT_TYPE_FACE_LEFT] = DIR_WEST,
    [MOVEMENT_TYPE_FACE_RIGHT] = DIR_EAST,
    [MOVEMENT_TYPE_PLAYER] = DIR_SOUTH,
    [MOVEMENT_TYPE_BERRY_TREE_GROWTH] = DIR_SOUTH,
    [MOVEMENT_TYPE_FACE_DOWN_AND_UP] = DIR_SOUTH,
    [MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT] = DIR_WEST,
    [MOVEMENT_TYPE_FACE_UP_AND_LEFT] = DIR_NORTH,
    [MOVEMENT_TYPE_FACE_UP_AND_RIGHT] = DIR_NORTH,
    [MOVEMENT_TYPE_FACE_DOWN_AND_LEFT] = DIR_SOUTH,
    [MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT] = DIR_SOUTH,
    [MOVEMENT_TYPE_FACE_DOWN_UP_AND_LEFT] = DIR_SOUTH,
    [MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT] = DIR_SOUTH,
    [MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT] = DIR_NORTH,
    [MOVEMENT_TYPE_FACE_DOWN_LEFT_AND_RIGHT] = DIR_SOUTH,
    [MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE] = DIR_SOUTH,
    [MOVEMENT_TYPE_ROTATE_CLOCKWISE] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_UP_AND_DOWN] = DIR_NORTH,
    [MOVEMENT_TYPE_WALK_DOWN_AND_UP] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT] = DIR_WEST,
    [MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT] = DIR_EAST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN] = DIR_NORTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_DOWN_UP] = DIR_EAST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_RIGHT_LEFT] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_UP_RIGHT] = DIR_WEST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_RIGHT_DOWN] = DIR_NORTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_DOWN_UP] = DIR_WEST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_LEFT_RIGHT] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_UP_LEFT] = DIR_EAST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_DOWN_RIGHT] = DIR_WEST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_RIGHT_LEFT] = DIR_NORTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_UP_DOWN] = DIR_EAST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_LEFT_UP] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_DOWN_LEFT] = DIR_EAST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_LEFT_RIGHT] = DIR_NORTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_UP_DOWN] = DIR_WEST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_RIGHT_UP] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT] = DIR_NORTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP] = DIR_WEST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_LEFT_DOWN] = DIR_EAST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_DOWN_LEFT] = DIR_NORTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN] = DIR_WEST,
    [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP] = DIR_EAST,
    [MOVEMENT_TYPE_COPY_PLAYER] = DIR_NORTH,
    [MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE] = DIR_SOUTH,
    [MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE] = DIR_WEST,
    [MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE] = DIR_EAST,
    [MOVEMENT_TYPE_TREE_DISGUISE] = DIR_SOUTH,
    [MOVEMENT_TYPE_MOUNTAIN_DISGUISE] = DIR_SOUTH,
    [MOVEMENT_TYPE_COPY_PLAYER_IN_GRASS] = DIR_NORTH,
    [MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE_IN_GRASS] = DIR_SOUTH,
    [MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE_IN_GRASS] = DIR_WEST,
    [MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE_IN_GRASS] = DIR_EAST,
    [MOVEMENT_TYPE_BURIED] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_IN_PLACE_DOWN] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_IN_PLACE_UP] = DIR_NORTH,
    [MOVEMENT_TYPE_WALK_IN_PLACE_LEFT] = DIR_WEST,
    [MOVEMENT_TYPE_WALK_IN_PLACE_RIGHT] = DIR_EAST,
    [MOVEMENT_TYPE_WALK_IN_PLACE_FAST_DOWN] = DIR_SOUTH,
    [MOVEMENT_TYPE_WALK_IN_PLACE_FAST_UP] = DIR_NORTH,
    [MOVEMENT_TYPE_WALK_IN_PLACE_FAST_LEFT] = DIR_WEST,
    [MOVEMENT_TYPE_WALK_IN_PLACE_FAST_RIGHT] = DIR_EAST,
    [MOVEMENT_TYPE_JOG_IN_PLACE_DOWN] = DIR_SOUTH,
    [MOVEMENT_TYPE_JOG_IN_PLACE_UP] = DIR_NORTH,
    [MOVEMENT_TYPE_JOG_IN_PLACE_LEFT] = DIR_WEST,
    [MOVEMENT_TYPE_JOG_IN_PLACE_RIGHT] = DIR_EAST,
    [MOVEMENT_TYPE_INVISIBLE] = DIR_SOUTH,
    [MOVEMENT_TYPE_RAISE_HAND_AND_STOP] = DIR_SOUTH,
    [MOVEMENT_TYPE_RAISE_HAND_AND_JUMP] = DIR_SOUTH,
    [MOVEMENT_TYPE_RAISE_HAND_AND_SWIM] = DIR_SOUTH,
    [MOVEMENT_TYPE_WANDER_AROUND_SLOWER] = DIR_SOUTH,
};

#define OBJ_EVENT_PAL_TAG_PLAYER_RED                  0x1100
#define OBJ_EVENT_PAL_TAG_PLAYER_RED_REFLECTION       0x1101
#define OBJ_EVENT_PAL_TAG_BRIDGE_REFLECTION           0x1102
#define OBJ_EVENT_PAL_TAG_NPC_BLUE                    0x1103
#define OBJ_EVENT_PAL_TAG_NPC_PINK                    0x1104
#define OBJ_EVENT_PAL_TAG_NPC_GREEN                   0x1105
#define OBJ_EVENT_PAL_TAG_NPC_WHITE                   0x1106
#define OBJ_EVENT_PAL_TAG_NPC_BLUE_REFLECTION         0x1107
#define OBJ_EVENT_PAL_TAG_NPC_PINK_REFLECTION         0x1108
#define OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION        0x1109
#define OBJ_EVENT_PAL_TAG_NPC_WHITE_REFLECTION        0x110A
#define OBJ_EVENT_PAL_TAG_RS_QUINTY_PLUMP             0x110B
#define OBJ_EVENT_PAL_TAG_RS_QUINTY_PLUMP_REFLECTION  0x110C
#define OBJ_EVENT_PAL_TAG_RS_TRUCK                    0x110D
#define OBJ_EVENT_PAL_TAG_RS_MACHOKE                  0x110E
#define OBJ_EVENT_PAL_TAG_RS_POOCHYENA                0x110F
#define OBJ_EVENT_PAL_TAG_PLAYER_GREEN                0x1110
#define OBJ_EVENT_PAL_TAG_PLAYER_GREEN_REFLECTION     0x1111
#define OBJ_EVENT_PAL_TAG_RS_MOVING_BOX               0x1112
#define OBJ_EVENT_PAL_TAG_METEORITE                   0x1113
#define OBJ_EVENT_PAL_TAG_SEAGALLOP                   0x1114
#define OBJ_EVENT_PAL_TAG_SS_ANNE                     0x1115
#define OBJ_EVENT_PAL_TAG_RS_PLAYER_UNDERWATER        0x1116
#define OBJ_EVENT_PAL_TAG_RS_KYOGRE                   0x1117
#define OBJ_EVENT_PAL_TAG_RS_KYOGRE_REFLECTION        0x1118
#define OBJ_EVENT_PAL_TAG_RS_GROUDON                  0x1119
#define OBJ_EVENT_PAL_TAG_RS_GROUDON_REFLECTION       0x111A
#define OBJ_EVENT_PAL_TAG_RS_SUBMARINE_SHADOW         0x111B
#define OBJ_EVENT_PAL_TAG_NONE                        0x11FF

#include "data/object_events/object_event_graphics_info_pointers.h"
#include "data/field_effects/field_effect_object_template_pointers.h"
#include "data/object_events/object_event_pic_tables.h"
#include "data/object_events/object_event_anims.h"
#include "data/object_events/base_oam.h"
#include "data/object_events/object_event_subsprites.h"
#include "data/object_events/object_event_graphics_info.h"

static const struct SpritePalette sObjectEventSpritePalettes[] = {
    {gObjectEventPal_NpcBlue,                 OBJ_EVENT_PAL_TAG_NPC_BLUE},
    {gObjectEventPal_NpcPink,                 OBJ_EVENT_PAL_TAG_NPC_PINK},
    {gObjectEventPal_NpcGreen,                OBJ_EVENT_PAL_TAG_NPC_GREEN},
    {gObjectEventPal_NpcWhite,                OBJ_EVENT_PAL_TAG_NPC_WHITE},
    {gObjectEventPal_NpcBlueReflection,       OBJ_EVENT_PAL_TAG_NPC_BLUE_REFLECTION},
    {gObjectEventPal_NpcPinkReflection,       OBJ_EVENT_PAL_TAG_NPC_PINK_REFLECTION},
    {gObjectEventPal_NpcGreenReflection,      OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION},
    {gObjectEventPal_NpcWhiteReflection,      OBJ_EVENT_PAL_TAG_NPC_WHITE_REFLECTION},
    {gObjectEventPal_Player,                  OBJ_EVENT_PAL_TAG_PLAYER_RED},
    {gObjectEventPal_PlayerReflection,        OBJ_EVENT_PAL_TAG_PLAYER_RED_REFLECTION},
    {gObjectEventPal_BridgeReflection,        OBJ_EVENT_PAL_TAG_BRIDGE_REFLECTION},
    {gObjectEventPal_RSQuintyPlump,           OBJ_EVENT_PAL_TAG_RS_QUINTY_PLUMP},
    {gObjectEventPal_RSQuintyPlumpReflection, OBJ_EVENT_PAL_TAG_RS_QUINTY_PLUMP_REFLECTION},
    {gObjectEventPal_Player,                  OBJ_EVENT_PAL_TAG_PLAYER_GREEN},
    {gObjectEventPal_PlayerReflection,        OBJ_EVENT_PAL_TAG_PLAYER_GREEN_REFLECTION},
    {gObjectEventPal_Meteorite,               OBJ_EVENT_PAL_TAG_METEORITE},
    {gObjectEventPal_SSAnne,                  OBJ_EVENT_PAL_TAG_SS_ANNE},
    {gObjectEventPal_Seagallop,               OBJ_EVENT_PAL_TAG_SEAGALLOP},
    {},
};

static const u16 sPlayerReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_PLAYER_RED_REFLECTION,
    OBJ_EVENT_PAL_TAG_PLAYER_RED_REFLECTION,
    OBJ_EVENT_PAL_TAG_PLAYER_RED_REFLECTION,
    OBJ_EVENT_PAL_TAG_PLAYER_RED_REFLECTION,
};

static const u16 sUnusedPlayerReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_PLAYER_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_PLAYER_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_PLAYER_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_PLAYER_GREEN_REFLECTION,
};

static const u16 sPlayerUnderwaterReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_RS_PLAYER_UNDERWATER,
    OBJ_EVENT_PAL_TAG_RS_PLAYER_UNDERWATER,
    OBJ_EVENT_PAL_TAG_RS_PLAYER_UNDERWATER,
    OBJ_EVENT_PAL_TAG_RS_PLAYER_UNDERWATER,
};

static const struct PairedPalettes gPlayerReflectionPaletteSets[] = {
    {OBJ_EVENT_PAL_TAG_PLAYER_RED,           sPlayerReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_PLAYER_GREEN,         sPlayerReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_RS_PLAYER_UNDERWATER, sPlayerUnderwaterReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_NONE, NULL},
};

static const u16 sRSQuintyPlumpReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_RS_QUINTY_PLUMP_REFLECTION,
    OBJ_EVENT_PAL_TAG_RS_QUINTY_PLUMP_REFLECTION,
    OBJ_EVENT_PAL_TAG_RS_QUINTY_PLUMP_REFLECTION,
    OBJ_EVENT_PAL_TAG_RS_QUINTY_PLUMP_REFLECTION,
};

static const u16 sRSTruckReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_RS_TRUCK,
    OBJ_EVENT_PAL_TAG_RS_TRUCK,
    OBJ_EVENT_PAL_TAG_RS_TRUCK,
    OBJ_EVENT_PAL_TAG_RS_TRUCK,
};

static const u16 sRSMachokeReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_RS_MACHOKE,
    OBJ_EVENT_PAL_TAG_RS_MACHOKE,
    OBJ_EVENT_PAL_TAG_RS_MACHOKE,
    OBJ_EVENT_PAL_TAG_RS_MACHOKE,
};

static const u16 sRSMovingBoxReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_RS_MOVING_BOX,
    OBJ_EVENT_PAL_TAG_RS_MOVING_BOX,
    OBJ_EVENT_PAL_TAG_RS_MOVING_BOX,
    OBJ_EVENT_PAL_TAG_RS_MOVING_BOX,
};

static const u16 sMeteoriteReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_METEORITE,
    OBJ_EVENT_PAL_TAG_METEORITE,
    OBJ_EVENT_PAL_TAG_METEORITE,
    OBJ_EVENT_PAL_TAG_METEORITE,
};

static const u16 sSeagallopReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_SEAGALLOP,
    OBJ_EVENT_PAL_TAG_SEAGALLOP,
    OBJ_EVENT_PAL_TAG_SEAGALLOP,
    OBJ_EVENT_PAL_TAG_SEAGALLOP,
};

static const u16 sRSSubmarineShadowReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_RS_SUBMARINE_SHADOW,
    OBJ_EVENT_PAL_TAG_RS_SUBMARINE_SHADOW,
    OBJ_EVENT_PAL_TAG_RS_SUBMARINE_SHADOW,
    OBJ_EVENT_PAL_TAG_RS_SUBMARINE_SHADOW,
};

static const u16 sRSKyogreReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_RS_KYOGRE_REFLECTION,
    OBJ_EVENT_PAL_TAG_RS_KYOGRE_REFLECTION,
    OBJ_EVENT_PAL_TAG_RS_KYOGRE_REFLECTION,
    OBJ_EVENT_PAL_TAG_RS_KYOGRE_REFLECTION,
};

static const u16 sRSGroudonReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_RS_GROUDON_REFLECTION,
    OBJ_EVENT_PAL_TAG_RS_GROUDON_REFLECTION,
    OBJ_EVENT_PAL_TAG_RS_GROUDON_REFLECTION,
    OBJ_EVENT_PAL_TAG_RS_GROUDON_REFLECTION,
};

static const u16 sGreenNPCReflectionPaletteTags[] = {
    OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION,
};

static const struct PairedPalettes gSpecialObjectReflectionPaletteSets[] = {
    {OBJ_EVENT_PAL_TAG_PLAYER_RED,          sPlayerReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_PLAYER_GREEN,        sPlayerReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_RS_QUINTY_PLUMP,     sRSQuintyPlumpReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_RS_TRUCK,            sRSTruckReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_RS_MACHOKE,          sRSMachokeReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_RS_MOVING_BOX,       sRSMovingBoxReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_METEORITE,           sMeteoriteReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_SEAGALLOP,           sSeagallopReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_RS_KYOGRE,           sRSKyogreReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_RS_GROUDON,          sRSGroudonReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_NPC_GREEN,           sGreenNPCReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_RS_SUBMARINE_SHADOW, sRSSubmarineShadowReflectionPaletteTags},
    {OBJ_EVENT_PAL_TAG_NONE, NULL},
};

static const u16 sObjectPaletteTags0[] = {
    OBJ_EVENT_PAL_TAG_PLAYER_RED,
    OBJ_EVENT_PAL_TAG_PLAYER_RED_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_BLUE,
    OBJ_EVENT_PAL_TAG_NPC_PINK,
    OBJ_EVENT_PAL_TAG_NPC_GREEN,
    OBJ_EVENT_PAL_TAG_NPC_WHITE,
    OBJ_EVENT_PAL_TAG_NPC_BLUE_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_PINK_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_WHITE_REFLECTION,
};

static const u16 sObjectPaletteTags1[] = {
    OBJ_EVENT_PAL_TAG_PLAYER_RED,
    OBJ_EVENT_PAL_TAG_PLAYER_GREEN,
    OBJ_EVENT_PAL_TAG_NPC_BLUE,
    OBJ_EVENT_PAL_TAG_NPC_PINK,
    OBJ_EVENT_PAL_TAG_NPC_GREEN,
    OBJ_EVENT_PAL_TAG_NPC_WHITE,
    OBJ_EVENT_PAL_TAG_NPC_BLUE_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_PINK_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_WHITE_REFLECTION,
};

static const u16 sObjectPaletteTags2[] = {
    OBJ_EVENT_PAL_TAG_PLAYER_RED,
    OBJ_EVENT_PAL_TAG_PLAYER_RED_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_BLUE,
    OBJ_EVENT_PAL_TAG_NPC_PINK,
    OBJ_EVENT_PAL_TAG_NPC_GREEN,
    OBJ_EVENT_PAL_TAG_NPC_WHITE,
    OBJ_EVENT_PAL_TAG_NPC_BLUE_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_PINK_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_WHITE_REFLECTION,
};

static const u16 sObjectPaletteTags3[] = {
    OBJ_EVENT_PAL_TAG_PLAYER_RED,
    OBJ_EVENT_PAL_TAG_PLAYER_RED_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_BLUE,
    OBJ_EVENT_PAL_TAG_NPC_PINK,
    OBJ_EVENT_PAL_TAG_NPC_GREEN,
    OBJ_EVENT_PAL_TAG_NPC_WHITE,
    OBJ_EVENT_PAL_TAG_NPC_BLUE_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_PINK_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_GREEN_REFLECTION,
    OBJ_EVENT_PAL_TAG_NPC_WHITE_REFLECTION,
};

static const u16 *const gObjectPaletteTagSets[] = {
    sObjectPaletteTags0,
    sObjectPaletteTags1,
    sObjectPaletteTags2,
    sObjectPaletteTags3,
};

//#include "data/object_events/berry_tree_graphics_tables.h"
#include "data/field_effects/field_effect_objects.h"

static const s16 gMovementDelaysMedium[] = {32, 64,  96, 128};
static const s16 gMovementDelaysLong[] =   {32, 64, 128, 192};
static const s16 gMovementDelaysShort[] =  {32, 48,  64,  80};

#include "data/object_events/movement_type_func_tables.h"

static const u8 sFaceDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_STD_FACE_SOUTH,
    [DIR_SOUTH]     = ANIM_STD_FACE_SOUTH,
    [DIR_NORTH]     = ANIM_STD_FACE_NORTH,
    [DIR_WEST]      = ANIM_STD_FACE_WEST,
    [DIR_EAST]      = ANIM_STD_FACE_EAST,
    [DIR_SOUTHWEST] = ANIM_STD_FACE_SOUTH,
    [DIR_SOUTHEAST] = ANIM_STD_FACE_SOUTH,
    [DIR_NORTHWEST] = ANIM_STD_FACE_NORTH,
    [DIR_NORTHEAST] = ANIM_STD_FACE_NORTH,
};

static const u8 sMoveDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_STD_GO_SOUTH,
    [DIR_SOUTH]     = ANIM_STD_GO_SOUTH,
    [DIR_NORTH]     = ANIM_STD_GO_NORTH,
    [DIR_WEST]      = ANIM_STD_GO_WEST,
    [DIR_EAST]      = ANIM_STD_GO_EAST,
    [DIR_SOUTHWEST] = ANIM_STD_GO_SOUTH,
    [DIR_SOUTHEAST] = ANIM_STD_GO_SOUTH,
    [DIR_NORTHWEST] = ANIM_STD_GO_NORTH,
    [DIR_NORTHEAST] = ANIM_STD_GO_NORTH,
};

static const u8 sMoveDirectionFastAnimNums[] = {
    [DIR_NONE]      = ANIM_STD_GO_FAST_SOUTH,
    [DIR_SOUTH]     = ANIM_STD_GO_FAST_SOUTH,
    [DIR_NORTH]     = ANIM_STD_GO_FAST_NORTH,
    [DIR_WEST]      = ANIM_STD_GO_FAST_WEST,
    [DIR_EAST]      = ANIM_STD_GO_FAST_EAST,
    [DIR_SOUTHWEST] = ANIM_STD_GO_FAST_SOUTH,
    [DIR_SOUTHEAST] = ANIM_STD_GO_FAST_SOUTH,
    [DIR_NORTHWEST] = ANIM_STD_GO_FAST_NORTH,
    [DIR_NORTHEAST] = ANIM_STD_GO_FAST_NORTH,
};

static const u8 sMoveDirectionFasterAnimNums[] = {
    [DIR_NONE]      = ANIM_STD_GO_FASTER_SOUTH,
    [DIR_SOUTH]     = ANIM_STD_GO_FASTER_SOUTH,
    [DIR_NORTH]     = ANIM_STD_GO_FASTER_NORTH,
    [DIR_WEST]      = ANIM_STD_GO_FASTER_WEST,
    [DIR_EAST]      = ANIM_STD_GO_FASTER_EAST,
    [DIR_SOUTHWEST] = ANIM_STD_GO_FASTER_SOUTH,
    [DIR_SOUTHEAST] = ANIM_STD_GO_FASTER_SOUTH,
    [DIR_NORTHWEST] = ANIM_STD_GO_FASTER_NORTH,
    [DIR_NORTHEAST] = ANIM_STD_GO_FASTER_NORTH,
};

static const u8 sMoveDirectionFastestAnimNums[] = {
    [DIR_NONE]      = ANIM_STD_GO_FASTEST_SOUTH,
    [DIR_SOUTH]     = ANIM_STD_GO_FASTEST_SOUTH,
    [DIR_NORTH]     = ANIM_STD_GO_FASTEST_NORTH,
    [DIR_WEST]      = ANIM_STD_GO_FASTEST_WEST,
    [DIR_EAST]      = ANIM_STD_GO_FASTEST_EAST,
    [DIR_SOUTHWEST] = ANIM_STD_GO_FASTEST_SOUTH,
    [DIR_SOUTHEAST] = ANIM_STD_GO_FASTEST_SOUTH,
    [DIR_NORTHWEST] = ANIM_STD_GO_FASTEST_NORTH,
    [DIR_NORTHEAST] = ANIM_STD_GO_FASTEST_NORTH,
};

static const u8 sJumpSpecialDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_GET_ON_OFF_POKEMON_SOUTH,
    [DIR_SOUTH]     = ANIM_GET_ON_OFF_POKEMON_SOUTH,
    [DIR_NORTH]     = ANIM_GET_ON_OFF_POKEMON_NORTH,
    [DIR_WEST]      = ANIM_GET_ON_OFF_POKEMON_WEST,
    [DIR_EAST]      = ANIM_GET_ON_OFF_POKEMON_EAST,
    [DIR_SOUTHWEST] = ANIM_GET_ON_OFF_POKEMON_SOUTH,
    [DIR_SOUTHEAST] = ANIM_GET_ON_OFF_POKEMON_SOUTH,
    [DIR_NORTHWEST] = ANIM_GET_ON_OFF_POKEMON_NORTH,
    [DIR_NORTHEAST] = ANIM_GET_ON_OFF_POKEMON_NORTH,
};

static const u8 sAcroBunnyHopBackWheelDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_BUNNY_HOP_BACK_WHEEL_SOUTH,
    [DIR_SOUTH]     = ANIM_BUNNY_HOP_BACK_WHEEL_SOUTH,
    [DIR_NORTH]     = ANIM_BUNNY_HOP_BACK_WHEEL_NORTH,
    [DIR_WEST]      = ANIM_BUNNY_HOP_BACK_WHEEL_WEST,
    [DIR_EAST]      = ANIM_BUNNY_HOP_BACK_WHEEL_EAST,
    [DIR_SOUTHWEST] = ANIM_BUNNY_HOP_BACK_WHEEL_SOUTH,
    [DIR_SOUTHEAST] = ANIM_BUNNY_HOP_BACK_WHEEL_SOUTH,
    [DIR_NORTHWEST] = ANIM_BUNNY_HOP_BACK_WHEEL_NORTH,
    [DIR_NORTHEAST] = ANIM_BUNNY_HOP_BACK_WHEEL_NORTH,
};

static const u8 sAcroBunnyHopFrontWheelDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_BUNNY_HOP_FRONT_WHEEL_SOUTH,
    [DIR_SOUTH]     = ANIM_BUNNY_HOP_FRONT_WHEEL_SOUTH,
    [DIR_NORTH]     = ANIM_BUNNY_HOP_FRONT_WHEEL_NORTH,
    [DIR_WEST]      = ANIM_BUNNY_HOP_FRONT_WHEEL_WEST,
    [DIR_EAST]      = ANIM_BUNNY_HOP_FRONT_WHEEL_EAST,
    [DIR_SOUTHWEST] = ANIM_BUNNY_HOP_FRONT_WHEEL_SOUTH,
    [DIR_SOUTHEAST] = ANIM_BUNNY_HOP_FRONT_WHEEL_SOUTH,
    [DIR_NORTHWEST] = ANIM_BUNNY_HOP_FRONT_WHEEL_NORTH,
    [DIR_NORTHEAST] = ANIM_BUNNY_HOP_FRONT_WHEEL_NORTH,
};

static const u8 sAcroStandingWheelieBackWheelDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_STANDING_WHEELIE_BACK_WHEEL_SOUTH,
    [DIR_SOUTH]     = ANIM_STANDING_WHEELIE_BACK_WHEEL_SOUTH,
    [DIR_NORTH]     = ANIM_STANDING_WHEELIE_BACK_WHEEL_NORTH,
    [DIR_WEST]      = ANIM_STANDING_WHEELIE_BACK_WHEEL_WEST,
    [DIR_EAST]      = ANIM_STANDING_WHEELIE_BACK_WHEEL_EAST,
    [DIR_SOUTHWEST] = ANIM_STANDING_WHEELIE_BACK_WHEEL_SOUTH,
    [DIR_SOUTHEAST] = ANIM_STANDING_WHEELIE_BACK_WHEEL_SOUTH,
    [DIR_NORTHWEST] = ANIM_STANDING_WHEELIE_BACK_WHEEL_NORTH,
    [DIR_NORTHEAST] = ANIM_STANDING_WHEELIE_BACK_WHEEL_NORTH,
};

static const u8 sSpinDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_SPIN_SOUTH,
    [DIR_SOUTH]     = ANIM_SPIN_SOUTH,
    [DIR_NORTH]     = ANIM_SPIN_NORTH,
    [DIR_WEST]      = ANIM_SPIN_WEST,
    [DIR_EAST]      = ANIM_SPIN_EAST,
    [DIR_SOUTHWEST] = ANIM_SPIN_SOUTH,
    [DIR_SOUTHEAST] = ANIM_SPIN_NORTH,
    [DIR_NORTHWEST] = ANIM_SPIN_WEST,
    [DIR_NORTHEAST] = ANIM_SPIN_EAST,
};

static const u8 sAcroStandingWheelieFrontWheelDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_STANDING_WHEELIE_FRONT_WHEEL_SOUTH,
    [DIR_SOUTH]     = ANIM_STANDING_WHEELIE_FRONT_WHEEL_SOUTH,
    [DIR_NORTH]     = ANIM_STANDING_WHEELIE_FRONT_WHEEL_NORTH,
    [DIR_WEST]      = ANIM_STANDING_WHEELIE_FRONT_WHEEL_WEST,
    [DIR_EAST]      = ANIM_STANDING_WHEELIE_FRONT_WHEEL_EAST,
    [DIR_SOUTHWEST] = ANIM_STANDING_WHEELIE_FRONT_WHEEL_SOUTH,
    [DIR_SOUTHEAST] = ANIM_STANDING_WHEELIE_FRONT_WHEEL_SOUTH,
    [DIR_NORTHWEST] = ANIM_STANDING_WHEELIE_FRONT_WHEEL_NORTH,
    [DIR_NORTHEAST] = ANIM_STANDING_WHEELIE_FRONT_WHEEL_NORTH,
};

static const u8 sAcroMovingWheelieDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_MOVING_WHEELIE_SOUTH,
    [DIR_SOUTH]     = ANIM_MOVING_WHEELIE_SOUTH,
    [DIR_NORTH]     = ANIM_MOVING_WHEELIE_NORTH,
    [DIR_WEST]      = ANIM_MOVING_WHEELIE_WEST,
    [DIR_EAST]      = ANIM_MOVING_WHEELIE_EAST,
    [DIR_SOUTHWEST] = ANIM_MOVING_WHEELIE_SOUTH,
    [DIR_SOUTHEAST] = ANIM_MOVING_WHEELIE_SOUTH,
    [DIR_NORTHWEST] = ANIM_MOVING_WHEELIE_NORTH,
    [DIR_NORTHEAST] = ANIM_MOVING_WHEELIE_NORTH,
};

static const u8 sFishingDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_TAKE_OUT_ROD_SOUTH,
    [DIR_SOUTH]     = ANIM_TAKE_OUT_ROD_SOUTH,
    [DIR_NORTH]     = ANIM_TAKE_OUT_ROD_NORTH,
    [DIR_WEST]      = ANIM_TAKE_OUT_ROD_WEST,
    [DIR_EAST]      = ANIM_TAKE_OUT_ROD_EAST,
    [DIR_SOUTHWEST] = ANIM_TAKE_OUT_ROD_SOUTH,
    [DIR_SOUTHEAST] = ANIM_TAKE_OUT_ROD_SOUTH,
    [DIR_NORTHWEST] = ANIM_TAKE_OUT_ROD_NORTH,
    [DIR_NORTHEAST] = ANIM_TAKE_OUT_ROD_NORTH,
};

static const u8 sFishingNoCatchDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_PUT_AWAY_ROD_SOUTH,
    [DIR_SOUTH]     = ANIM_PUT_AWAY_ROD_SOUTH,
    [DIR_NORTH]     = ANIM_PUT_AWAY_ROD_NORTH,
    [DIR_WEST]      = ANIM_PUT_AWAY_ROD_WEST,
    [DIR_EAST]      = ANIM_PUT_AWAY_ROD_EAST,
    [DIR_SOUTHWEST] = ANIM_PUT_AWAY_ROD_SOUTH,
    [DIR_SOUTHEAST] = ANIM_PUT_AWAY_ROD_SOUTH,
    [DIR_NORTHWEST] = ANIM_PUT_AWAY_ROD_NORTH,
    [DIR_NORTHEAST] = ANIM_PUT_AWAY_ROD_NORTH,
};

static const u8 sFishingBiteDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_HOOKED_POKEMON_SOUTH,
    [DIR_SOUTH]     = ANIM_HOOKED_POKEMON_SOUTH,
    [DIR_NORTH]     = ANIM_HOOKED_POKEMON_NORTH,
    [DIR_WEST]      = ANIM_HOOKED_POKEMON_WEST,
    [DIR_EAST]      = ANIM_HOOKED_POKEMON_EAST,
    [DIR_SOUTHWEST] = ANIM_HOOKED_POKEMON_SOUTH,
    [DIR_SOUTHEAST] = ANIM_HOOKED_POKEMON_SOUTH,
    [DIR_NORTHWEST] = ANIM_HOOKED_POKEMON_NORTH,
    [DIR_NORTHEAST] = ANIM_HOOKED_POKEMON_NORTH,
};

static const u8 sRunningDirectionAnimNums[] = {
    [DIR_NONE]      = ANIM_RUN_SOUTH,
    [DIR_SOUTH]     = ANIM_RUN_SOUTH,
    [DIR_NORTH]     = ANIM_RUN_NORTH,
    [DIR_WEST]      = ANIM_RUN_WEST,
    [DIR_EAST]      = ANIM_RUN_EAST,
    [DIR_SOUTHWEST] = ANIM_RUN_SOUTH,
    [DIR_SOUTHEAST] = ANIM_RUN_SOUTH,
    [DIR_NORTHWEST] = ANIM_RUN_NORTH,
    [DIR_NORTHEAST] = ANIM_RUN_NORTH,
};

static const u8 sTrainerFacingDirectionMovementTypes[] = {
    [DIR_NONE]      = MOVEMENT_TYPE_FACE_DOWN,
    [DIR_SOUTH]     = MOVEMENT_TYPE_FACE_DOWN,
    [DIR_NORTH]     = MOVEMENT_TYPE_FACE_UP,
    [DIR_WEST]      = MOVEMENT_TYPE_FACE_LEFT,
    [DIR_EAST]      = MOVEMENT_TYPE_FACE_RIGHT,
    [DIR_SOUTHWEST] = MOVEMENT_TYPE_FACE_DOWN,
    [DIR_SOUTHEAST] = MOVEMENT_TYPE_FACE_DOWN,
    [DIR_NORTHWEST] = MOVEMENT_TYPE_FACE_UP,
    [DIR_NORTHEAST] = MOVEMENT_TYPE_FACE_UP,
};

bool8 (*const gOppositeDirectionBlockedMetatileFuncs[])(u8) = {
    MetatileBehavior_IsSouthBlocked,
    MetatileBehavior_IsNorthBlocked,
    MetatileBehavior_IsWestBlocked,
    MetatileBehavior_IsEastBlocked
};

bool8 (*const gDirectionBlockedMetatileFuncs[])(u8) = {
    MetatileBehavior_IsNorthBlocked,
    MetatileBehavior_IsSouthBlocked,
    MetatileBehavior_IsEastBlocked,
    MetatileBehavior_IsWestBlocked
};

static const struct Coords16 sDirectionToVectors[] = {
    [DIR_NONE]      = { 0,  0},
    [DIR_SOUTH]     = { 0,  1},
    [DIR_NORTH]     = { 0, -1},
    [DIR_WEST]      = {-1,  0},
    [DIR_EAST]      = { 1,  0},
    [DIR_SOUTHWEST] = {-1,  1},
    [DIR_SOUTHEAST] = { 1,  1},
    [DIR_NORTHWEST] = {-1, -1},
    [DIR_NORTHEAST] = { 1, -1},
};

static const u8 sFaceDirectionMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_FACE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_FACE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_FACE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_FACE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_FACE_RIGHT,
};

static const u8 sFaceDirectionFastMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_FACE_DOWN_FAST,
    [DIR_SOUTH] = MOVEMENT_ACTION_FACE_DOWN_FAST,
    [DIR_NORTH] = MOVEMENT_ACTION_FACE_UP_FAST,
    [DIR_WEST]  = MOVEMENT_ACTION_FACE_LEFT_FAST,
    [DIR_EAST]  = MOVEMENT_ACTION_FACE_RIGHT_FAST,
};

static const u8 sWalkSlowestMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_SLOWEST_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_SLOWEST_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_SLOWEST_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_SLOWEST_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_SLOWEST_RIGHT,
};

static const u8 sWalkSlowerMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_SLOWER_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_SLOWER_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_SLOWER_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_SLOWER_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_SLOWER_RIGHT,
};

static const u8 sWalkSlowMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_SLOW_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_SLOW_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_SLOW_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_SLOW_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_SLOW_RIGHT,
};

static const u8 sWalkNormalMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_NORMAL_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_NORMAL_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_NORMAL_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_NORMAL_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_NORMAL_RIGHT,
};

static const u8 sWalkFastMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_FAST_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_FAST_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_FAST_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_FAST_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_FAST_RIGHT,
};

static const u8 sGlideMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_GLIDE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_GLIDE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_GLIDE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_GLIDE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_GLIDE_RIGHT,
};

static const u8 sRideWaterCurrentMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_RIDE_WATER_CURRENT_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_RIDE_WATER_CURRENT_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_RIDE_WATER_CURRENT_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_RIDE_WATER_CURRENT_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_RIDE_WATER_CURRENT_RIGHT,
};

static const u8 sWalkFasterMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_FASTER_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_FASTER_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_FASTER_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_FASTER_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_FASTER_RIGHT,
};

static const u8 sSlideMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_SLIDE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_SLIDE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_SLIDE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_SLIDE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_SLIDE_RIGHT,
};

static const u8 sPlayerRunMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_PLAYER_RUN_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_PLAYER_RUN_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_PLAYER_RUN_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_PLAYER_RUN_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_PLAYER_RUN_RIGHT,
};

static const u8 sPlayerRunSlowMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_PLAYER_RUN_DOWN_SLOW,
    [DIR_SOUTH] = MOVEMENT_ACTION_PLAYER_RUN_DOWN_SLOW,
    [DIR_NORTH] = MOVEMENT_ACTION_PLAYER_RUN_UP_SLOW,
    [DIR_WEST]  = MOVEMENT_ACTION_PLAYER_RUN_LEFT_SLOW,
    [DIR_EAST]  = MOVEMENT_ACTION_PLAYER_RUN_RIGHT_SLOW,
};

static const u8 sSpinMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_SPIN_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_SPIN_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_SPIN_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_SPIN_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_SPIN_RIGHT,
};

static const u8 sJump2MovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_JUMP_2_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_JUMP_2_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_JUMP_2_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_JUMP_2_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_JUMP_2_RIGHT,
};

static const u8 sJumpInPlaceMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_JUMP_IN_PLACE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT,
};

static const u8 sJumpInPlaceTurnAroundMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_JUMP_IN_PLACE_UP_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_JUMP_IN_PLACE_UP_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT_RIGHT,
};

static const u8 sJumpMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_JUMP_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_JUMP_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_JUMP_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_JUMP_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_JUMP_RIGHT,
};

static const u8 sJumpSpecialMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_JUMP_SPECIAL_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_JUMP_SPECIAL_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_JUMP_SPECIAL_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_JUMP_SPECIAL_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_JUMP_SPECIAL_RIGHT,
};

static const u8 sJumpSpecialWithEffectMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_JUMP_SPECIAL_WITH_EFFECT_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_JUMP_SPECIAL_WITH_EFFECT_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_JUMP_SPECIAL_WITH_EFFECT_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_JUMP_SPECIAL_WITH_EFFECT_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_JUMP_SPECIAL_WITH_EFFECT_RIGHT,
};

static const u8 sWalkInPlaceSlowMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_RIGHT,
};

static const u8 sWalkInPlaceNormalMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_RIGHT,
};

static const u8 sWalkInPlaceFastMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_IN_PLACE_FAST_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_IN_PLACE_FAST_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_IN_PLACE_FAST_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_IN_PLACE_FAST_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_IN_PLACE_FAST_RIGHT,
};

static const u8 sWalkInPlaceFasterMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_RIGHT,
};

static const u8 sAcroWheelieFaceDirectionMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_ACRO_WHEELIE_FACE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_ACRO_WHEELIE_FACE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_ACRO_WHEELIE_FACE_RIGHT,
};

static const u8 sAcroPopWheelieFaceDirectionMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_ACRO_POP_WHEELIE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_ACRO_POP_WHEELIE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_ACRO_POP_WHEELIE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_ACRO_POP_WHEELIE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_ACRO_POP_WHEELIE_RIGHT,
};

static const u8 sAcroEndWheelieFaceDirectionMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_RIGHT,
};

static const u8 sAcroWheelieHopFaceDirectionMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_RIGHT,
};

static const u8 sAcroWheelieHopMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_ACRO_WHEELIE_HOP_RIGHT,
};

static const u8 sAcroWheelieJumpMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_RIGHT,
};

static const u8 sAcroWheelieInPlaceMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_RIGHT,
};

static const u8 sAcroPopWheelieMoveMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_RIGHT,
};

static const u8 sAcroWheelieMoveMovementActions[] = {
    [DIR_NONE]  = MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_DOWN,
    [DIR_SOUTH] = MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_DOWN,
    [DIR_NORTH] = MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_UP,
    [DIR_WEST]  = MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_LEFT,
    [DIR_EAST]  = MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_RIGHT,
};

static const u8 gOppositeDirections[] = {
    DIR_NORTH,
    DIR_SOUTH,
    DIR_EAST,
    DIR_WEST,
    DIR_NORTHEAST,
    DIR_NORTHWEST,
    DIR_SOUTHEAST,
    DIR_SOUTHWEST,
};

static const u8 sPlayerDirectionsForCopy[][4] = {
    {2, 1, 4, 3},
    {1, 2, 3, 4},
    {3, 4, 2, 1},
    {4, 3, 1, 2}
};

static const u8 sPlayerDirectionToCopyDirection[][4] = {
    {2, 1, 4, 3},
    {1, 2, 3, 4},
    {4, 3, 1, 2},
    {3, 4, 2, 1}
};

#include "data/object_events/movement_action_func_tables.h"

static void ClearObjectEvent(struct ObjectEvent *objectEvent)
{
    *objectEvent = (struct ObjectEvent){};
    objectEvent->localId = 0xFF;
    objectEvent->mapNum = MAP_NUM(UNDEFINED);
    objectEvent->mapGroup = MAP_GROUP(UNDEFINED);
    objectEvent->movementActionId = MOVEMENT_ACTION_NONE;
}

static void ClearAllObjectEvents(void)
{
    u8 i;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
        ClearObjectEvent(&gObjectEvents[i]);
}

void ResetObjectEvents(void)
{
    ClearLinkPlayerObjectEvents();
    ClearAllObjectEvents();
    ClearPlayerAvatarInfo();
    CreateReflectionEffectSprites();
}

static void CreateReflectionEffectSprites(void)
{
    u8 spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_REFLECTION_DISTORTION], 0, 0, 31);
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    gSprites[spriteId].invisible = TRUE;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_REFLECTION_DISTORTION], 0, 0, 31);
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], 1);
    gSprites[spriteId].invisible = TRUE;
}

u8 GetFirstInactiveObjectEventId(void)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (!gObjectEvents[i].active)
            break;
    }

    return i;
}

u8 GetObjectEventIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroupId)
{
    if (localId < OBJ_EVENT_ID_PLAYER)
    {
        return GetObjectEventIdByLocalIdAndMapInternal(localId, mapNum, mapGroupId);
    }
    return GetObjectEventIdByLocalId(localId);
}

bool8 TryGetObjectEventIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroupId, u8 *objectEventId)
{
    *objectEventId = GetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroupId);
    if (*objectEventId == OBJECT_EVENTS_COUNT)
        return TRUE;
    else
        return FALSE;
}

u8 GetObjectEventIdByXY(s16 x, s16 y)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active && gObjectEvents[i].currentCoords.x == x && gObjectEvents[i].currentCoords.y == y)
            break;
    }

    return i;
}

static u8 GetObjectEventIdByLocalIdAndMapInternal(u8 localId, u8 mapNum, u8 mapGroupId)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active && gObjectEvents[i].localId == localId && gObjectEvents[i].mapNum == mapNum && gObjectEvents[i].mapGroup == mapGroupId)
            return i;
    }

    return OBJECT_EVENTS_COUNT;
}

static u8 GetObjectEventIdByLocalId(u8 localId)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active && gObjectEvents[i].localId == localId)
            return i;
    }

    return OBJECT_EVENTS_COUNT;
}

static u8 InitObjectEventStateFromTemplate(const struct ObjectEventTemplate *template, u8 mapNum, u8 mapGroup)
{
    struct ObjectEvent *objectEvent;
    const struct MapHeader *mapHeader;
    u8 objectEventId;
    s16 x;
    s16 y;
    bool8 isClone = FALSE;
    u8 localId = 0;
    s16 x2 = 0;
    s16 y2 = 0;
    s16 x3 = 0;
    s16 y3 = 0;
    
    if (template->kind == OBJ_KIND_CLONE)
    {
        isClone = TRUE;
        localId = template->objUnion.clone.targetLocalId;
        mapNum = template->objUnion.clone.targetMapNum;
        mapGroup = template->objUnion.clone.targetMapGroup;
        x2 = template->x;
        y2 = template->y;
        x3 = template->x;
        y3 = template->y;
        mapHeader = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);
        template = &(mapHeader->events->objectEvents[localId - 1]);
    }

    if (GetAvailableObjectEventId(template->localId, mapNum, mapGroup, &objectEventId))
        return OBJECT_EVENTS_COUNT;

    if (!ShouldInitObjectEventStateFromTemplate(template, isClone, x3, y3))
        return OBJECT_EVENTS_COUNT;

    objectEvent = &gObjectEvents[objectEventId];
    ClearObjectEvent(objectEvent);
    if (isClone)
    {
        x = x2 + MAP_OFFSET;
        y = y2 + MAP_OFFSET;
    }
    else
    {
        x = template->x + MAP_OFFSET;
        y = template->y + MAP_OFFSET;
    }
    objectEvent->active = TRUE;
    objectEvent->triggerGroundEffectsOnMove = TRUE;
    objectEvent->graphicsId = template->graphicsId;
    objectEvent->movementType = template->objUnion.normal.movementType;
    objectEvent->localId = template->localId;
    objectEvent->mapNum = mapNum;
    objectEvent->mapGroup = mapGroup;
    objectEvent->initialCoords.x = x;
    objectEvent->initialCoords.y = y;
    objectEvent->currentCoords.x = x;
    objectEvent->currentCoords.y = y;
    objectEvent->previousCoords.x = x;
    objectEvent->previousCoords.y = y;
    objectEvent->currentElevation = template->objUnion.normal.elevation;
    objectEvent->previousElevation = template->objUnion.normal.elevation;
    objectEvent->rangeX = template->objUnion.normal.movementRangeX;
    objectEvent->rangeY = template->objUnion.normal.movementRangeY;
    objectEvent->trainerType = template->objUnion.normal.trainerType;
    objectEvent->trainerRange_berryTreeId = template->objUnion.normal.trainerRange_berryTreeId;
    objectEvent->mapNum = mapNum; // oops (yes this is required for matching)
    objectEvent->previousMovementDirection = gInitialMovementTypeFacingDirections[template->objUnion.normal.movementType];
    SetObjectEventDirection(objectEvent, objectEvent->previousMovementDirection);
    SetObjectEventDynamicGraphicsId(objectEvent);
    if (gRangedMovementTypes[objectEvent->movementType])
    {
        if (objectEvent->rangeX == 0)
            objectEvent->rangeX++;
        if (objectEvent->rangeY == 0)
            objectEvent->rangeY++;
    }
    return objectEventId;
}

static bool8 ShouldInitObjectEventStateFromTemplate(const struct ObjectEventTemplate *template, bool8 isClone, s16 x, s16 y)
{
    if (isClone && !TemplateIsObstacleAndWithinView(template, x, y))
        return FALSE;

    if (!TemplateIsObstacleAndVisibleFromConnectingMap(template, x, y))
        return FALSE;
    
    return TRUE;
}

static bool8 TemplateIsObstacleAndWithinView(const struct ObjectEventTemplate *template, s16 x, s16 y)
{
    if (template->graphicsId == OBJ_EVENT_GFX_CUT_TREE || template->graphicsId == OBJ_EVENT_GFX_ROCK_SMASH_ROCK)
    {
        if (gSaveBlock1Ptr->pos.x < x)
        {
            if (gSaveBlock1Ptr->pos.x + (MAP_OFFSET + 1) < x)
                return TRUE;
            if (gSaveBlock1Ptr->pos.y - (MAP_OFFSET - 1) <= y && gSaveBlock1Ptr->pos.y + (MAP_OFFSET - 1) >= y)
                return FALSE;
        }
        else
        {
            if (gSaveBlock1Ptr->pos.x - (MAP_OFFSET + 1) > x)
                return TRUE;

            if (gSaveBlock1Ptr->pos.y - (MAP_OFFSET - 1) <= y && gSaveBlock1Ptr->pos.y + (MAP_OFFSET - 1) >= y)
                return FALSE;
        }
    }
    return TRUE;
}

static bool8 TemplateIsObstacleAndVisibleFromConnectingMap(const struct ObjectEventTemplate *template, s16 unused1, s16 unused2)
{
    if (IsMapTypeOutdoors(GetCurrentMapType()))
    {
        s32 width = VMap.Xsize - MAP_OFFSET_W - 1;
        s32 height = VMap.Ysize - MAP_OFFSET_H - 1;

        if (template->graphicsId == OBJ_EVENT_GFX_CUT_TREE || template->graphicsId == OBJ_EVENT_GFX_ROCK_SMASH_ROCK)
        {
            if (gSaveBlock1Ptr->pos.x == 0 && template->x <= (MAP_OFFSET + 1))
            {
                SetHideObstacleFlag(template);
                return FALSE;
            }

            if (gSaveBlock1Ptr->pos.x == width && template->x >= width - (MAP_OFFSET + 1))
            {
                SetHideObstacleFlag(template);
                return FALSE;
            }

            if (gSaveBlock1Ptr->pos.y == 0 && template->y <= (MAP_OFFSET - 1))
            {
                SetHideObstacleFlag(template);
                return FALSE;
            }

            if (gSaveBlock1Ptr->pos.y == height && template->y >= height - (MAP_OFFSET - 1))
            {
                SetHideObstacleFlag(template);
                return FALSE;
            }
        }
    }
    return TRUE;
}

static void SetHideObstacleFlag(const struct ObjectEventTemplate *template)
{
    if (template->flagId >= FLAG_TEMP_11 && template->flagId <= FLAG_TEMP_1F)
        FlagSet(template->flagId);
}

u8 Unref_TryInitLocalObjectEvent(u8 localId)
{
    u8 i;
    u8 objectEventCount;
    struct ObjectEventTemplate *template;

    if (gMapHeader.events == NULL)
        return OBJECT_EVENTS_COUNT;

    objectEventCount = gMapHeader.events->objectEventCount;
    
    for (i = 0; i < objectEventCount; i++)
    {
        template = &gSaveBlock1Ptr->objectEventTemplates[i];
        if (template->localId == localId && !FlagGet(template->flagId))
            return InitObjectEventStateFromTemplate(template, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    }

    return OBJECT_EVENTS_COUNT;
}

static bool8 GetAvailableObjectEventId(u16 localId, u8 mapNum, u8 mapGroup, u8 *objectEventId)
// Looks for an empty slot.
// Returns FALSE and the location of the available slot
// in *objectEventId.
// If no slots are available, or if the object is already
// loaded, returns TRUE.
{
    u8 i = 0;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (!gObjectEvents[i].active)
            break;
        if (gObjectEvents[i].localId == localId && gObjectEvents[i].mapNum == mapNum && gObjectEvents[i].mapGroup == mapGroup)
            return TRUE;
    }
    if (i >= OBJECT_EVENTS_COUNT)
        return TRUE;
    *objectEventId = i;
    do
    {
        if (gObjectEvents[i].active && gObjectEvents[i].localId == localId && gObjectEvents[i].mapNum == mapNum && gObjectEvents[i].mapGroup == mapGroup)
            return TRUE;
        i++;
    } while (i < OBJECT_EVENTS_COUNT);
    return FALSE;
}

static void RemoveObjectEvent(struct ObjectEvent *objectEvent)
{
    objectEvent->active = FALSE;
    RemoveObjectEventInternal(objectEvent);
}

void RemoveObjectEventByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 objectEventId;
    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
    {
        FlagSet(GetObjectEventFlagIdByObjectEventId(objectEventId));
        RemoveObjectEvent(&gObjectEvents[objectEventId]);
    }
}

static void RemoveObjectEventInternal(struct ObjectEvent *objectEvent)
{
    struct SpriteFrameImage image;
    image.size = GetObjectEventGraphicsInfo(objectEvent->graphicsId)->size;
    gSprites[objectEvent->spriteId].images = &image;
    DestroySprite(&gSprites[objectEvent->spriteId]);
}

void Unref_RemoveAllObjectEventsExceptPlayer(void)
{
    u8 i;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (i != gPlayerAvatar.objectEventId)
            RemoveObjectEvent(&gObjectEvents[i]);
    }
}

static u8 TrySetupObjectEventSprite(const struct ObjectEventTemplate *objectEventTemplate, struct SpriteTemplate *spriteTemplate, u8 mapNum, u8 mapGroup, s16 cameraX, s16 cameraY)
{
    u8 spriteId;
    u8 objectEventId;
    struct Sprite *sprite;
    struct ObjectEvent *objectEvent;
    const struct ObjectEventGraphicsInfo *graphicsInfo;

    objectEventId = InitObjectEventStateFromTemplate(objectEventTemplate, mapNum, mapGroup);
    if (objectEventId == OBJECT_EVENTS_COUNT)
        return OBJECT_EVENTS_COUNT;

    objectEvent = &gObjectEvents[objectEventId];
    graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
    if (graphicsInfo->paletteSlot == PALSLOT_PLAYER)
        LoadPlayerObjectReflectionPalette(graphicsInfo->paletteTag, graphicsInfo->paletteSlot);
    else if (graphicsInfo->paletteSlot == PALSLOT_NPC_SPECIAL)
        LoadSpecialObjectReflectionPalette(graphicsInfo->paletteTag, graphicsInfo->paletteSlot);


    if (objectEvent->movementType == MOVEMENT_TYPE_INVISIBLE)
        objectEvent->invisible = TRUE;

    *(u16 *)&spriteTemplate->paletteTag = TAG_NONE;
    spriteId = CreateSprite(spriteTemplate, 0, 0, 0);
    if (spriteId == MAX_SPRITES)
    {
        gObjectEvents[objectEventId].active = FALSE;
        return OBJECT_EVENTS_COUNT;
    }

    sprite = &gSprites[spriteId];
    GetMapCoordsFromSpritePos(objectEvent->currentCoords.x + cameraX, objectEvent->currentCoords.y + cameraY, &sprite->x, &sprite->y);
    sprite->centerToCornerVecX = -(graphicsInfo->width >> 1);
    sprite->centerToCornerVecY = -(graphicsInfo->height >> 1);
    sprite->x += 8;
    sprite->y += 16 + sprite->centerToCornerVecY;
    sprite->oam.paletteNum = graphicsInfo->paletteSlot;
    sprite->coordOffsetEnabled = TRUE;
    sprite->data[0] = objectEventId;
    objectEvent->spriteId = spriteId;
    objectEvent->inanimate = graphicsInfo->inanimate;
    if (!objectEvent->inanimate)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(objectEvent->facingDirection));

    SetObjectSubpriorityByElevation(objectEvent->previousElevation, sprite, 1);
    UpdateObjectEventVisibility(objectEvent, sprite);
    return objectEventId;
}

static u8 TrySpawnObjectEventTemplate(const struct ObjectEventTemplate *objectEventTemplate, u8 mapNum, u8 mapGroup, s16 cameraX, s16 cameraY)
{
    u8 objectEventId;
    struct SpriteTemplate spriteTemplate;
    struct SpriteFrameImage spriteFrameImage;
    const struct ObjectEventGraphicsInfo *graphicsInfo;
    const struct SubspriteTable *subspriteTables = NULL;

    graphicsInfo = GetObjectEventGraphicsInfo(objectEventTemplate->graphicsId);
    MakeObjectTemplateFromObjectEventTemplate(objectEventTemplate, &spriteTemplate, &subspriteTables);
    spriteFrameImage.size = graphicsInfo->size;
    spriteTemplate.images = &spriteFrameImage;
    objectEventId = TrySetupObjectEventSprite(objectEventTemplate, &spriteTemplate, mapNum, mapGroup, cameraX, cameraY);
    if (objectEventId == OBJECT_EVENTS_COUNT)
        return OBJECT_EVENTS_COUNT;

    gSprites[gObjectEvents[objectEventId].spriteId].images = graphicsInfo->images;
    if (subspriteTables)
        SetSubspriteTables(&gSprites[gObjectEvents[objectEventId].spriteId], subspriteTables);

    return objectEventId;
}

u8 SpawnSpecialObjectEvent(struct ObjectEventTemplate *objectEventTemplate)
{
    s16 cameraX;
    s16 cameraY;

    GetObjectEventMovingCameraOffset(&cameraX, &cameraY);
    return TrySpawnObjectEventTemplate(objectEventTemplate, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, cameraX, cameraY);
}

int SpawnSpecialObjectEventParameterized(u8 graphicsId, u8 movementBehavior, u8 localId, s16 x, s16 y, u8 elevation)
{
    struct ObjectEventTemplate objectEventTemplate;

    x -= MAP_OFFSET;
    y -= MAP_OFFSET;
    objectEventTemplate.localId = localId;
    objectEventTemplate.graphicsId = graphicsId;
    objectEventTemplate.kind = OBJ_KIND_NORMAL;
    objectEventTemplate.x = x;
    objectEventTemplate.y = y;
    objectEventTemplate.objUnion.normal.elevation = elevation;
    objectEventTemplate.objUnion.normal.movementType = movementBehavior;
    objectEventTemplate.objUnion.normal.movementRangeX = 0;
    objectEventTemplate.objUnion.normal.movementRangeY = 0;
    objectEventTemplate.objUnion.normal.trainerType = TRAINER_TYPE_NONE;
    objectEventTemplate.objUnion.normal.trainerRange_berryTreeId = 0;
    return SpawnSpecialObjectEvent(&objectEventTemplate);
}

u8 TrySpawnObjectEvent(u8 localId, u8 mapNum, u8 mapGroup)
{
    const struct ObjectEventTemplate *objectEventTemplate;
    s16 cameraX, cameraY;

    objectEventTemplate = GetObjectEventTemplateByLocalIdAndMap(localId, mapNum, mapGroup);
    if (!objectEventTemplate)
        return OBJECT_EVENTS_COUNT;

    GetObjectEventMovingCameraOffset(&cameraX, &cameraY);
    return TrySpawnObjectEventTemplate(objectEventTemplate, mapNum, mapGroup, cameraX, cameraY);
}

void CopyObjectGraphicsInfoToSpriteTemplate(u16 graphicsId, void (*callback)(struct Sprite *), struct SpriteTemplate *spriteTemplate, const struct SubspriteTable **subspriteTables)
{
    const struct ObjectEventGraphicsInfo *graphicsInfo = GetObjectEventGraphicsInfo(graphicsId);

    spriteTemplate->tileTag = graphicsInfo->tileTag;
    spriteTemplate->paletteTag = graphicsInfo->paletteTag;
    spriteTemplate->oam = graphicsInfo->oam;
    spriteTemplate->anims = graphicsInfo->anims;
    spriteTemplate->images = graphicsInfo->images;
    spriteTemplate->affineAnims = graphicsInfo->affineAnims;
    
    do
    {
        if (ScriptContext_IsEnabled() != TRUE && QL_GetPlaybackState() == QL_PLAYBACK_STATE_RUNNING)
            spriteTemplate->callback = QL_UpdateObject;
        else
            spriteTemplate->callback = callback;
    } while (0);
    
    *subspriteTables = graphicsInfo->subspriteTables;
}

static void CopyObjectGraphicsInfoToSpriteTemplate_WithMovementType(u16 graphicsId, u16 movementType, struct SpriteTemplate *spriteTemplate, const struct SubspriteTable **subspriteTables)
{
    CopyObjectGraphicsInfoToSpriteTemplate(graphicsId, sMovementTypeCallbacks[movementType], spriteTemplate, subspriteTables);
}

static void MakeObjectTemplateFromObjectEventTemplate(const struct ObjectEventTemplate *objectEventTemplate, struct SpriteTemplate *spriteTemplate, const struct SubspriteTable **subspriteTables)
{
    CopyObjectGraphicsInfoToSpriteTemplate_WithMovementType(objectEventTemplate->graphicsId, objectEventTemplate->objUnion.normal.movementType, spriteTemplate, subspriteTables);
}

// Used to create a sprite using a graphicsId associated with object events.
u8 CreateObjectGraphicsSprite(u16 graphicsId, SpriteCallback callback, s16 x, s16 y, u8 subpriority)
{
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables;
    u8 spriteId;

    CopyObjectGraphicsInfoToSpriteTemplate(graphicsId, callback, &spriteTemplate, &subspriteTables);
    if (spriteTemplate.paletteTag != TAG_NONE)
        LoadObjectEventPalette(spriteTemplate.paletteTag);

    spriteId = CreateSprite(&spriteTemplate, x, y, subpriority);
    if (spriteId != MAX_SPRITES && subspriteTables != NULL)
    {
        SetSubspriteTables(&gSprites[spriteId], subspriteTables);
        gSprites[spriteId].subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
    }
    return spriteId;
}

#define sVirtualObjId   data[0]
#define sVirtualObjElev data[1]

u8 CreateVirtualObject(u8 graphicsId, u8 virtualObjId, s16 x, s16 y, u8 elevation, u8 direction)
{
    u8 spriteId;
    struct Sprite *sprite;
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables;
    const struct ObjectEventGraphicsInfo *graphicsInfo;

    graphicsInfo = GetObjectEventGraphicsInfo(graphicsId);
    CopyObjectGraphicsInfoToSpriteTemplate(graphicsId, SpriteCB_VirtualObject, &spriteTemplate, &subspriteTables);
    *(u16 *)&spriteTemplate.paletteTag = TAG_NONE;
    x += MAP_OFFSET;
    y += MAP_OFFSET;
    SetSpritePosToOffsetMapCoords(&x, &y, 8, 16);
    spriteId = CreateSpriteAtEnd(&spriteTemplate, x, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->centerToCornerVecX = -(graphicsInfo->width >> 1);
        sprite->centerToCornerVecY = -(graphicsInfo->height >> 1);
        sprite->y += sprite->centerToCornerVecY;
        sprite->oam.paletteNum = graphicsInfo->paletteSlot;
        sprite->coordOffsetEnabled = TRUE;
        sprite->sVirtualObjId = virtualObjId;
        sprite->sVirtualObjElev = elevation;
        if (graphicsInfo->paletteSlot == PALSLOT_NPC_SPECIAL)
            LoadSpecialObjectReflectionPalette(graphicsInfo->paletteTag, graphicsInfo->paletteSlot);

        if (subspriteTables != NULL)
        {
            SetSubspriteTables(sprite, subspriteTables);
            sprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
        }
        InitObjectPriorityByElevation(sprite, elevation);
        SetObjectSubpriorityByElevation(elevation, sprite, 1);
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(direction));
    }
    return spriteId;
}

u8 CreateFameCheckerObject(u8 graphicsId, u8 localId, s16 x, s16 y)
{
    u8 spriteId;
    struct Sprite *sprite;
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables;
    const struct ObjectEventGraphicsInfo *graphicsInfo;

    graphicsInfo = GetObjectEventGraphicsInfo(graphicsId);
    CopyObjectGraphicsInfoToSpriteTemplate(graphicsId, SpriteCallbackDummy, &spriteTemplate, &subspriteTables);
    *(u16 *)&spriteTemplate.paletteTag = TAG_NONE;

    spriteId = CreateSpriteAtEnd(&spriteTemplate, x, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->centerToCornerVecY = -(graphicsInfo->height >> 1);
        sprite->y += sprite->centerToCornerVecY;
        sprite->oam.paletteNum = graphicsInfo->paletteSlot;
        sprite->data[0] = localId;
        if (graphicsInfo->paletteSlot == PALSLOT_NPC_SPECIAL)
            LoadSpecialObjectReflectionPalette(graphicsInfo->paletteTag, graphicsInfo->paletteSlot);

        if (subspriteTables != NULL)
        {
            SetSubspriteTables(sprite, subspriteTables);
            sprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
        }
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(DIR_SOUTH));
    }
    return spriteId;
}

void TrySpawnObjectEvents(s16 cameraX, s16 cameraY)
{
    u8 i;
    u8 objectCount;

    if (gMapHeader.events != NULL)
    {
        s16 left = gSaveBlock1Ptr->pos.x - 2;
        s16 right = gSaveBlock1Ptr->pos.x + MAP_OFFSET_W + 2;
        s16 top = gSaveBlock1Ptr->pos.y;
        s16 bottom = gSaveBlock1Ptr->pos.y + MAP_OFFSET_H + 2;

        objectCount = gMapHeader.events->objectEventCount;

        for (i = 0; i < objectCount; i++)
        {
            struct ObjectEventTemplate *template = &gSaveBlock1Ptr->objectEventTemplates[i];
            s16 npcX = template->x + MAP_OFFSET;
            s16 npcY = template->y + MAP_OFFSET;

            if (top <= npcY && bottom >= npcY && left <= npcX && right >= npcX
                && !FlagGet(template->flagId))
                TrySpawnObjectEventTemplate(template, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, cameraX, cameraY);
        }
    }
}

void RemoveObjectEventsOutsideView(void)
{
    u8 i, j;
    bool8 isActiveLinkPlayer;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        for (j = 0, isActiveLinkPlayer = FALSE; j < NELEMS(gLinkPlayerObjectEvents); j++)
        {
            if (gLinkPlayerObjectEvents[j].active && i == gLinkPlayerObjectEvents[j].objEventId)
                isActiveLinkPlayer = TRUE;
        }
        if (!isActiveLinkPlayer)
        {
            struct ObjectEvent *objectEvent = &gObjectEvents[i];

            if (objectEvent->active && !objectEvent->isPlayer)
                RemoveObjectEventIfOutsideView(objectEvent);
        }
    }
}

static void RemoveObjectEventIfOutsideView(struct ObjectEvent *objectEvent)
{
    s16 left =   gSaveBlock1Ptr->pos.x - 2;
    s16 right =  gSaveBlock1Ptr->pos.x + MAP_OFFSET_W + 2;
    s16 top =    gSaveBlock1Ptr->pos.y;
    s16 bottom = gSaveBlock1Ptr->pos.y + MAP_OFFSET_H + 2;

    if (objectEvent->currentCoords.x >= left && objectEvent->currentCoords.x <= right
     && objectEvent->currentCoords.y >= top && objectEvent->currentCoords.y <= bottom)
        return;
    if (objectEvent->initialCoords.x >= left && objectEvent->initialCoords.x <= right
     && objectEvent->initialCoords.y >= top && objectEvent->initialCoords.y <= bottom)
        return;
    RemoveObjectEvent(objectEvent);
}

void SpawnObjectEventsOnReturnToField(s16 x, s16 y)
{
    u8 i;

    ClearPlayerAvatarInfo();
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active)
            SpawnObjectEventOnReturnToField(i, x, y);
    }
    CreateReflectionEffectSprites();
}

static void SpawnObjectEventOnReturnToField(u8 objectEventId, s16 x, s16 y)
{
    u8 spriteId;
    struct Sprite *sprite;
    struct ObjectEvent *objectEvent;
    struct SpriteTemplate spriteTemplate;
    struct SpriteFrameImage spriteFrameImage;
    const struct SubspriteTable *subspriteTables;
    const struct ObjectEventGraphicsInfo *graphicsInfo;

#define i spriteId
    for (i = 0; i < NELEMS(gLinkPlayerObjectEvents); i++)
    {
        if (gLinkPlayerObjectEvents[i].active && objectEventId == gLinkPlayerObjectEvents[i].objEventId)
            return;
    }
#undef i

    objectEvent = &gObjectEvents[objectEventId];
    objectEvent++;objectEvent--; // fakematch
    subspriteTables = NULL;
    graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
    spriteFrameImage.size = graphicsInfo->size;
    CopyObjectGraphicsInfoToSpriteTemplate_WithMovementType(objectEvent->graphicsId, objectEvent->movementType, &spriteTemplate, &subspriteTables);
    spriteTemplate.images = &spriteFrameImage;

    *(u16 *)&spriteTemplate.paletteTag = TAG_NONE;
    if (graphicsInfo->paletteSlot == PALSLOT_PLAYER)
        LoadPlayerObjectReflectionPalette(graphicsInfo->paletteTag, graphicsInfo->paletteSlot);

    if (graphicsInfo->paletteSlot >= PALSLOT_NPC_SPECIAL)
        LoadSpecialObjectReflectionPalette(graphicsInfo->paletteTag, graphicsInfo->paletteSlot);

    *(u16 *)&spriteTemplate.paletteTag = TAG_NONE;
    spriteId = CreateSprite(&spriteTemplate, 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        GetMapCoordsFromSpritePos(x + objectEvent->currentCoords.x, y + objectEvent->currentCoords.y, &sprite->x, &sprite->y);
        sprite->centerToCornerVecX = -(graphicsInfo->width >> 1);
        sprite->centerToCornerVecY = -(graphicsInfo->height >> 1);
        sprite->x += 8;
        sprite->y += 16 + sprite->centerToCornerVecY;
        sprite->images = graphicsInfo->images;
        if (objectEvent->movementType == MOVEMENT_TYPE_PLAYER)
        {
            SetPlayerAvatarObjectEventIdAndObjectId(objectEventId, spriteId);
            objectEvent->warpArrowSpriteId = CreateWarpArrowSprite();
        }
        if (subspriteTables != NULL)
            SetSubspriteTables(sprite, subspriteTables);

        sprite->oam.paletteNum = graphicsInfo->paletteSlot;
        sprite->coordOffsetEnabled = TRUE;
        sprite->data[0] = objectEventId;
        objectEvent->spriteId = spriteId;
        if (!objectEvent->inanimate && objectEvent->movementType != MOVEMENT_TYPE_PLAYER)
            StartSpriteAnim(sprite, GetFaceDirectionAnimNum(objectEvent->facingDirection));

        ResetObjectEventFldEffData(objectEvent);
        SetObjectSubpriorityByElevation(objectEvent->previousElevation, sprite, 1);
    }
}

static void ResetObjectEventFldEffData(struct ObjectEvent *objectEvent)
{
    objectEvent->singleMovementActive = FALSE;
    objectEvent->triggerGroundEffectsOnMove = TRUE;
    objectEvent->hasShadow = FALSE;
    objectEvent->hasReflection = FALSE;
    objectEvent->inShortGrass = FALSE;
    objectEvent->inShallowFlowingWater = FALSE;
    objectEvent->inSandPile = FALSE;
    objectEvent->inHotSprings = FALSE;
    ObjectEventClearHeldMovement(objectEvent);
}

static void SetPlayerAvatarObjectEventIdAndObjectId(u8 objectEventId, u8 spriteId)
{
    gPlayerAvatar.objectEventId = objectEventId;
    gPlayerAvatar.spriteId = spriteId;
    gPlayerAvatar.gender = GetPlayerAvatarGenderByGraphicsId(gObjectEvents[objectEventId].graphicsId);
    SetPlayerAvatarExtraStateTransition(gObjectEvents[objectEventId].graphicsId, PLAYER_AVATAR_FLAG_CONTROLLABLE);
}

void ObjectEventSetGraphicsId(struct ObjectEvent *objectEvent, u8 graphicsId)
{
    const struct ObjectEventGraphicsInfo *graphicsInfo;
    struct Sprite *sprite;
    u8 var;
    u8 var3;

    graphicsInfo = GetObjectEventGraphicsInfo(graphicsId);
    sprite = &gSprites[objectEvent->spriteId];
    if (graphicsInfo->paletteSlot == PALSLOT_PLAYER)
        PatchObjectPalette(graphicsInfo->paletteTag, graphicsInfo->paletteSlot);

    if (graphicsInfo->paletteSlot == PALSLOT_NPC_SPECIAL)
        LoadSpecialObjectReflectionPalette(graphicsInfo->paletteTag, graphicsInfo->paletteSlot);
    
    var = sprite->images->size / TILE_SIZE_4BPP;
    if (!sprite->usingSheet)
    {
        FreeSpriteTilesIfNotUsingSheet(sprite);
    }
    sprite->oam.shape = graphicsInfo->oam->shape;
    sprite->oam.size = graphicsInfo->oam->size;
    sprite->images = graphicsInfo->images;
    sprite->anims = graphicsInfo->anims;
    sprite->subspriteTables = graphicsInfo->subspriteTables;
    sprite->oam.paletteNum = graphicsInfo->paletteSlot;
    if (!sprite->usingSheet)
    {
        s32 var2;
        var3 = sprite->images->size / TILE_SIZE_4BPP;
        var2 = AllocSpriteTiles(var3);
        if (var2 == -1)
        {
            var2 = AllocSpriteTiles(var);    
        }
        sprite->oam.tileNum = var2;
    }
    objectEvent->inanimate = graphicsInfo->inanimate;
    objectEvent->graphicsId = graphicsId;  
    SetSpritePosToMapCoords(objectEvent->currentCoords.x, objectEvent->currentCoords.y, &sprite->x, &sprite->y);
    sprite->centerToCornerVecX = -(graphicsInfo->width >> 1);
    sprite->centerToCornerVecY = -(graphicsInfo->height >> 1);
    sprite->x += 8;
    sprite->y += 16 + sprite->centerToCornerVecY;
    if (objectEvent->trackedByCamera)
    {
        CameraObjectReset1();
    }
}

void ObjectEventSetGraphicsIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, u8 graphicsId)
{
    u8 objectEventId;

    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
    {
        ObjectEventSetGraphicsId(&gObjectEvents[objectEventId], graphicsId);
    }
}

void ObjectEventTurn(struct ObjectEvent *objectEvent, u8 direction)
{
    SetObjectEventDirection(objectEvent, direction);
    if (!objectEvent->inanimate)
    {
        StartSpriteAnim(&gSprites[objectEvent->spriteId], GetFaceDirectionAnimNum(objectEvent->facingDirection));
        SeekSpriteAnim(&gSprites[objectEvent->spriteId], 0);
    }
}

void ObjectEventTurnByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, u8 direction)
{
    u8 objectEventId;

    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
    {
        ObjectEventTurn(&gObjectEvents[objectEventId], direction);
    }
}

void PlayerObjectTurn(struct PlayerAvatar *playerAvatar, u8 direction)
{
    ObjectEventTurn(&gObjectEvents[playerAvatar->objectEventId], direction);
}

const struct ObjectEventGraphicsInfo *GetObjectEventGraphicsInfo(u8 graphicsId)
{
    if (graphicsId >= OBJ_EVENT_GFX_VARS)
        graphicsId = VarGetObjectEventGraphicsId(graphicsId - OBJ_EVENT_GFX_VARS);
    
    if (graphicsId >= NUM_OBJ_EVENT_GFX)
        graphicsId = OBJ_EVENT_GFX_LITTLE_BOY;
    
    return gObjectEventGraphicsInfoPointers[graphicsId];
}

static void SetObjectEventDynamicGraphicsId(struct ObjectEvent *objectEvent)
{
    if (objectEvent->graphicsId >= OBJ_EVENT_GFX_VARS)
    {
        objectEvent->graphicsId = VarGetObjectEventGraphicsId(objectEvent->graphicsId - OBJ_EVENT_GFX_VARS);
    }
}

void SetObjectInvisibility(u8 localId, u8 mapNum, u8 mapGroup, u8 state)
{
    u8 objectEventId;

    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
    {
        gObjectEvents[objectEventId].invisible = state;
    }
}

void ObjectEventGetLocalIdAndMap(struct ObjectEvent *objectEvent, void *localId, void *mapNum, void *mapGroup)
{
    *(u8 *)(localId) = objectEvent->localId;
    *(u8 *)(mapNum) = objectEvent->mapNum;
    *(u8 *)(mapGroup) = objectEvent->mapGroup;
}

void EnableObjectGroundEffectsByXY(s16 x, s16 y)
{
    u8 objectEventId;
    struct ObjectEvent *objectEvent;

    objectEventId = GetObjectEventIdByXY(x, y);
    if (objectEventId != OBJECT_EVENTS_COUNT)
    {
        objectEvent = &gObjectEvents[objectEventId];
        objectEvent->triggerGroundEffectsOnMove = TRUE;
    }
}

void SetObjectSubpriority(u8 localId, u8 mapNum, u8 mapGroup, u8 subpriority)
{
    u8 objectEventId;
    struct ObjectEvent *objectEvent;
    struct Sprite *sprite;

    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
    {
        objectEvent = &gObjectEvents[objectEventId];
        sprite = &gSprites[objectEvent->spriteId];
        objectEvent->fixedPriority = TRUE;
        sprite->subpriority = subpriority;
    }
}

void ResetObjectSubpriority(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 objectEventId;
    struct ObjectEvent *objectEvent;

    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
    {
        objectEvent = &gObjectEvents[objectEventId];
        objectEvent->fixedPriority = FALSE;
        objectEvent->triggerGroundEffectsOnMove = TRUE;
    }
}

void SetObjectPositionByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    u8 objectEventId;
    struct Sprite *sprite;

    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
    {
        sprite = &gSprites[gObjectEvents[objectEventId].spriteId];
        sprite->x2 = x;
        sprite->y2 = y;
    }
}

void FreeAndReserveObjectSpritePalettes(void)
{
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = OBJ_PALSLOT_COUNT;
}

static void LoadObjectEventPalette(u16 paletteTag)
{
    u16 i = FindObjectEventPaletteIndexByTag(paletteTag);

#ifdef BUGFIX
    if (sObjectEventSpritePalettes[i].tag != OBJ_EVENT_PAL_TAG_NONE)
#else
    if (i != OBJ_EVENT_PAL_TAG_NONE) // always true
#endif
    {
        TryLoadObjectPalette(&sObjectEventSpritePalettes[i]);
    }
}

// Unused
void LoadObjectEventPaletteSet(u16 *paletteTags)
{
    u8 i;

    for (i = 0; paletteTags[i] != OBJ_EVENT_PAL_TAG_NONE; i++)
    {
        LoadObjectEventPalette(paletteTags[i]);
    }
}

static u8 TryLoadObjectPalette(const struct SpritePalette *spritePalette)
{
    if (IndexOfSpritePaletteTag(spritePalette->tag) != 0xFF)
    {
        // Already loaded
        return 0xFF;
    }
    return LoadSpritePalette(spritePalette);
}

void PatchObjectPalette(u16 paletteTag, u8 paletteSlot)
{
    u8 paletteIndex = FindObjectEventPaletteIndexByTag(paletteTag);

    LoadPalette(sObjectEventSpritePalettes[paletteIndex].data, OBJ_PLTT_ID(paletteSlot), PLTT_SIZE_4BPP);
    ApplyGlobalFieldPaletteTint(paletteSlot);
}

void PatchObjectPaletteRange(const u16 *paletteTags, u8 minSlot, u8 maxSlot)
{
    while (minSlot < maxSlot)
    {
        PatchObjectPalette(*paletteTags, minSlot);
        paletteTags++;
        minSlot++;
    }
}

static u8 FindObjectEventPaletteIndexByTag(u16 tag)
{
    u8 i;

    for (i = 0; sObjectEventSpritePalettes[i].tag != OBJ_EVENT_PAL_TAG_NONE; i++)
    {
        if (sObjectEventSpritePalettes[i].tag == tag)
        {
            return i;
        }
    }
    return 0xFF;
}

void LoadPlayerObjectReflectionPalette(u16 tag, u8 slot)
{
    u8 i;

    PatchObjectPalette(tag, slot);
    for (i = 0; gPlayerReflectionPaletteSets[i].tag != OBJ_EVENT_PAL_TAG_NONE; i++)
    {
        if (gPlayerReflectionPaletteSets[i].tag == tag)
        {
            PatchObjectPalette(gPlayerReflectionPaletteSets[i].data[sCurrentReflectionType], gReflectionEffectPaletteMap[slot]);
            return;
        }
    }
}

void LoadSpecialObjectReflectionPalette(u16 tag, u8 slot)
{
    u8 i;

    sCurrentSpecialObjectPaletteTag = tag;
    PatchObjectPalette(tag, slot);
    for (i = 0; gSpecialObjectReflectionPaletteSets[i].tag != OBJ_EVENT_PAL_TAG_NONE; i++)
    {
        if (gSpecialObjectReflectionPaletteSets[i].tag == tag)
        {
            PatchObjectPalette(gSpecialObjectReflectionPaletteSets[i].data[sCurrentReflectionType], gReflectionEffectPaletteMap[slot]);
            return;
        }
    }
}

// Unused
static u8 GetReflectionEffectPaletteSlot(u8 slot)
{
    return gReflectionEffectPaletteMap[slot];
}

// Unused
void IncrementObjectEventCoords(struct ObjectEvent *objectEvent, s16 x, s16 y)
{
    objectEvent->previousCoords.x = objectEvent->currentCoords.x;
    objectEvent->previousCoords.y = objectEvent->currentCoords.y;
    objectEvent->currentCoords.x += x;
    objectEvent->currentCoords.y += y;
}

void ShiftObjectEventCoords(struct ObjectEvent *objectEvent, s16 x, s16 y)
{
    objectEvent->previousCoords.x = objectEvent->currentCoords.x;
    objectEvent->previousCoords.y = objectEvent->currentCoords.y;
    objectEvent->currentCoords.x = x;
    objectEvent->currentCoords.y = y;
}

static void SetObjectEventCoords(struct ObjectEvent *objectEvent, s16 x, s16 y)
{
    objectEvent->previousCoords.x = x;
    objectEvent->previousCoords.y = y;
    objectEvent->currentCoords.x = x;
    objectEvent->currentCoords.y = y;
}

void MoveObjectEventToMapCoords(struct ObjectEvent *objectEvent, s16 x, s16 y)
{
    struct Sprite *sprite;
    const struct ObjectEventGraphicsInfo *graphicsInfo;

    sprite = &gSprites[objectEvent->spriteId];
    graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
    SetObjectEventCoords(objectEvent, x, y);
    SetSpritePosToMapCoords(objectEvent->currentCoords.x, objectEvent->currentCoords.y, &sprite->x, &sprite->y);
    sprite->centerToCornerVecX = -(graphicsInfo->width >> 1);
    sprite->centerToCornerVecY = -(graphicsInfo->height >> 1);
    sprite->x += 8;
    sprite->y += 16 + sprite->centerToCornerVecY;
    ResetObjectEventFldEffData(objectEvent);
    if (objectEvent->trackedByCamera)
        CameraObjectReset1();
}

void TryMoveObjectEventToMapCoords(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    u8 objectEventId;
    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
    {
        x += MAP_OFFSET;
        y += MAP_OFFSET;
        MoveObjectEventToMapCoords(&gObjectEvents[objectEventId], x, y);
    }
}

void ShiftStillObjectEventCoords(struct ObjectEvent *objectEvent)
{
    ShiftObjectEventCoords(objectEvent, objectEvent->currentCoords.x, objectEvent->currentCoords.y);
}

void UpdateObjectEventCoordsForCameraUpdate(void)
{
    u8 i;
    s16 dx;
    s16 dy;

    if (gCamera.active)
    {
        dx = gCamera.x;
        dy = gCamera.y;
        for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
        {
            if (gObjectEvents[i].active)
            {
                gObjectEvents[i].initialCoords.x -= dx;
                gObjectEvents[i].initialCoords.y -= dy;
                gObjectEvents[i].currentCoords.x -= dx;
                gObjectEvents[i].currentCoords.y -= dy;
                gObjectEvents[i].previousCoords.x -= dx;
                gObjectEvents[i].previousCoords.y -= dy;
            }
        }
    }
}

u8 GetObjectEventIdByPosition(u16 x, u16 y, u8 elevation)
{
    u8 i;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active)
        {
            if (gObjectEvents[i].currentCoords.x == x
             && gObjectEvents[i].currentCoords.y == y
             && ObjectEventDoesElevationMatch(&gObjectEvents[i], elevation))
                return i;
        }
    }
    return OBJECT_EVENTS_COUNT;
}

static bool8 ObjectEventDoesElevationMatch(struct ObjectEvent *objectEvent, u8 elevation)
{
    if (objectEvent->currentElevation != 0 && elevation != 0 && objectEvent->currentElevation != elevation)
        return FALSE;

    return TRUE;
}

void UpdateObjectEventsForCameraUpdate(s16 x, s16 y)
{
    UpdateObjectEventCoordsForCameraUpdate();
    TrySpawnObjectEvents(x, y);
    RemoveObjectEventsOutsideView();
}

u8 AddCameraObject(u8 linkedSpriteId)
{
    u8 spriteId = CreateSprite(&gCameraSpriteTemplate, 0, 0, 4);

    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].data[0] = linkedSpriteId;
    return spriteId;
}

static void ObjectCB_CameraObject(struct Sprite *sprite)
{
    void (*callbacks[NELEMS(gCameraObjectFuncs)])(struct Sprite *);

    memcpy(callbacks, gCameraObjectFuncs, sizeof gCameraObjectFuncs);
    callbacks[sprite->data[1]](sprite);
}

static void CameraObject_0(struct Sprite *sprite)
{
    sprite->x = gSprites[sprite->data[0]].x;
    sprite->y = gSprites[sprite->data[0]].y;
    sprite->invisible = TRUE;
    sprite->data[1] = 1;
    CameraObject_1(sprite);
}

static void CameraObject_1(struct Sprite *sprite)
{
    s16 x = gSprites[sprite->data[0]].x;
    s16 y = gSprites[sprite->data[0]].y;

    sprite->data[2] = x - sprite->x;
    sprite->data[3] = y - sprite->y;
    sprite->x = x;
    sprite->y = y;
}

static void CameraObject_2(struct Sprite *sprite)
{
    sprite->x = gSprites[sprite->data[0]].x;
    sprite->y = gSprites[sprite->data[0]].y;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
}

static struct Sprite *FindCameraObject(void)
{
    u8 i;

    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (gSprites[i].inUse && gSprites[i].callback == ObjectCB_CameraObject)
        {
            return &gSprites[i];
        }
    }
    return NULL;
}

void CameraObjectReset1(void)
{
    struct Sprite *cameraObject;

    cameraObject = FindCameraObject();
    if (cameraObject != NULL)
    {
        cameraObject->data[1] = 0;
        cameraObject->callback(cameraObject);
    }
}

void CameraObjectSetFollowedObjectId(u8 objectId)
{
    struct Sprite *cameraObject;

    cameraObject = FindCameraObject();
    if (cameraObject != NULL)
    {
        cameraObject->data[0] = objectId;
        CameraObjectReset1();
    }
}

u8 CameraObjectGetFollowedObjectId(void)
{
    struct Sprite *cameraObject;

    cameraObject = FindCameraObject();
    if (cameraObject == NULL)
    {
        return MAX_SPRITES;
    }
    return cameraObject->data[0];
}

void CameraObjectReset2(void)
{
    struct Sprite *cameraObject = FindCameraObject();
#ifdef UBFIX
    if (cameraObject == NULL)
        return;
#endif
    cameraObject->data[1] = 2;
}

u8 CopySprite(struct Sprite *sprite, s16 x, s16 y, u8 subpriority)
{
    u8 i;

    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (!gSprites[i].inUse)
        {
            gSprites[i] = *sprite;
            gSprites[i].x = x;
            gSprites[i].y = y;
            gSprites[i].subpriority = subpriority;
            break;
        }
    }
    return i;
}

u8 CreateCopySpriteAt(struct Sprite *sprite, s16 x, s16 y, u8 subpriority)
{
    s16 i;

    for (i = MAX_SPRITES - 1; i > -1; i--)
    {
        if (!gSprites[i].inUse)
        {
            gSprites[i] = *sprite;
            gSprites[i].x = x;
            gSprites[i].y = y;
            gSprites[i].subpriority = subpriority;
            return i;
        }
    }
    return MAX_SPRITES;
}

void SetObjectEventDirection(struct ObjectEvent *objectEvent, u8 direction)
{
    s8 d2;
    objectEvent->previousMovementDirection = objectEvent->facingDirection;
    if (!objectEvent->facingDirectionLocked)
    {
        d2 = direction;
        objectEvent->facingDirection = d2;
    }
    objectEvent->movementDirection = direction;
}

static const u8 *GetObjectEventScriptPointerByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    return GetObjectEventTemplateByLocalIdAndMap(localId, mapNum, mapGroup)->script;
}

const u8 *GetObjectEventScriptPointerByObjectEventId(u8 objectEventId)
{
    return GetObjectEventScriptPointerByLocalIdAndMap(gObjectEvents[objectEventId].localId, gObjectEvents[objectEventId].mapNum, gObjectEvents[objectEventId].mapGroup);
}

static u16 GetObjectEventFlagIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    const struct ObjectEventTemplate *obj = GetObjectEventTemplateByLocalIdAndMap(localId, mapNum, mapGroup);
#ifdef UBFIX
    // BUG: The function may return NULL, and attempting to read from NULL may freeze the game using modern compilers.
    if (obj == NULL)
        return 0;
#endif // UBFIX
    return obj->flagId;
}

static u16 GetObjectEventFlagIdByObjectEventId(u8 objectEventId)
{
    return GetObjectEventFlagIdByLocalIdAndMap(gObjectEvents[objectEventId].localId, gObjectEvents[objectEventId].mapNum, gObjectEvents[objectEventId].mapGroup);
}

// Unused
u8 GetObjectTrainerTypeByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 objectEventId;

    if (TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
        return 0xFF;

    return gObjectEvents[objectEventId].trainerType;
}

u16 GetBoulderRevealFlagByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    // Pushable boulder object events store the flag to reveal the boulder
    // on the floor below in their trainer type field.
    return GetObjectEventTemplateByLocalIdAndMap(localId, mapNum, mapGroup)->objUnion.normal.trainerType;
}

// Unused
u8 GetObjectTrainerTypeByObjectEventId(u8 objectEventId)
{
    return gObjectEvents[objectEventId].trainerType;
}

// Unused
u8 GetObjectEventBerryTreeIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 objectEventId;

    if (TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
        return 0xFF;

    return gObjectEvents[objectEventId].trainerRange_berryTreeId;
}

// Unused
u8 GetObjectEventBerryTreeId(u8 objectEventId)
{
    return gObjectEvents[objectEventId].trainerRange_berryTreeId;
}

static const struct ObjectEventTemplate *GetObjectEventTemplateByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    const struct ObjectEventTemplate *templates;
    const struct MapHeader *mapHeader;
    u8 count;

    if (gSaveBlock1Ptr->location.mapNum == mapNum && gSaveBlock1Ptr->location.mapGroup == mapGroup)
    {
        templates = gSaveBlock1Ptr->objectEventTemplates;
        count = gMapHeader.events->objectEventCount;
    }
    else
    {
        mapHeader = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);
        templates = mapHeader->events->objectEvents;
        count = mapHeader->events->objectEventCount;
    }
    return FindObjectEventTemplateByLocalId(localId, templates, count);
}

static const struct ObjectEventTemplate *FindObjectEventTemplateByLocalId(u8 localId, const struct ObjectEventTemplate *templates, u8 count)
{
    u8 i;

    for (i = 0; i < count; i++)
    {
        if (templates[i].localId == localId)
        {
            return &templates[i];
        }
    }
    return NULL;
}

struct ObjectEventTemplate *GetBaseTemplateForObjectEvent(const struct ObjectEvent *objectEvent)
{
    int i;

    if (objectEvent->mapNum != gSaveBlock1Ptr->location.mapNum || objectEvent->mapGroup != gSaveBlock1Ptr->location.mapGroup)
    {
        return NULL;
    }
    for (i = 0; i < OBJECT_EVENT_TEMPLATES_COUNT; i++)
    {
        if ((objectEvent->localId == gSaveBlock1Ptr->objectEventTemplates[i].localId)
         && (objectEvent->mapNum == gSaveBlock1Ptr->location.mapNum)
         && (objectEvent->mapGroup == gSaveBlock1Ptr->location.mapGroup))
            return &gSaveBlock1Ptr->objectEventTemplates[i];
    }
    return NULL;
}

void OverrideTemplateCoordsForObjectEvent(const struct ObjectEvent *objectEvent)
{
    struct ObjectEventTemplate *objectEventTemplate;

    objectEventTemplate = GetBaseTemplateForObjectEvent(objectEvent);
    if (objectEventTemplate != NULL)
    {
        objectEventTemplate->x = objectEvent->currentCoords.x - MAP_OFFSET;
        objectEventTemplate->y = objectEvent->currentCoords.y - MAP_OFFSET;
    }
}

void OverrideMovementTypeForObjectEvent(const struct ObjectEvent *objectEvent, u8 movementType)
{
    struct ObjectEventTemplate *objectEventTemplate;

    objectEventTemplate = GetBaseTemplateForObjectEvent(objectEvent);
    if (objectEventTemplate != NULL)
    {
        objectEventTemplate->objUnion.normal.movementType = movementType;
    }
}

void TryOverrideObjectEventTemplateCoords(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 objectEventId;
    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
        OverrideTemplateCoordsForObjectEvent(&gObjectEvents[objectEventId]);
}

void InitObjectEventPalettes(u8 palSlot)
{
    FreeAndReserveObjectSpritePalettes();
    sCurrentSpecialObjectPaletteTag = OBJ_EVENT_PAL_TAG_NONE;
    sCurrentReflectionType = palSlot;
    if (palSlot == 1)
    {
        PatchObjectPaletteRange(gObjectPaletteTagSets[sCurrentReflectionType], 0, 6);
        gReservedSpritePaletteCount = 8;
    }
    else
    {
        PatchObjectPaletteRange(gObjectPaletteTagSets[sCurrentReflectionType], 0, 10);
    }
}

u16 GetObjectPaletteTag(u8 palSlot)
{
    u8 i;

    if (palSlot < 10)
    {
        return gObjectPaletteTagSets[sCurrentReflectionType][palSlot];
    }
    for (i = 0; gSpecialObjectReflectionPaletteSets[i].tag != OBJ_EVENT_PAL_TAG_NONE; i++)
    {
        if (gSpecialObjectReflectionPaletteSets[i].tag == sCurrentSpecialObjectPaletteTag)
        {
            return gSpecialObjectReflectionPaletteSets[i].data[sCurrentReflectionType];
        }
    }
    return OBJ_EVENT_PAL_TAG_NONE;
}

movement_type_empty_callback(MovementType_None)
movement_type_def(MovementType_WanderAround, gMovementTypeFuncs_WanderAround)
movement_type_def(MovementType_WanderAroundSlower, gMovementTypeFuncs_WanderAroundSlower)

static bool8 MovementType_WanderAround_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_WanderAround_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_WanderAround_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (!ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        return FALSE;
    }
    SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
    sprite->data[1] = 3;
    return TRUE;
}

static bool8 MovementType_WanderAround_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_WanderAround_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[4];
    u8 chosenDirection;

    memcpy(directions, gStandardDirections, sizeof directions);
    chosenDirection = directions[Random() & 3];
    SetObjectEventDirection(objectEvent, chosenDirection);
    sprite->data[1] = 5;
    if (GetCollisionInDirection(objectEvent, chosenDirection))
        sprite->data[1] = 1;

    return TRUE;
}

static bool8 MovementType_WanderAround_Step5(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkNormalMovementAction(objectEvent->movementDirection));
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 6;
    return TRUE;
}

static bool8 MovementType_WanderAround_Step5Slower(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkSlowerMovementAction(objectEvent->movementDirection));
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 6;
    return TRUE;
}

static bool8 MovementType_WanderAround_Step6(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 1;
    }
    return FALSE;
}

bool8 ObjectEventIsTrainerAndCloseToPlayer(struct ObjectEvent *objectEvent)
{
    s16 playerX;
    s16 playerY;
    s16 objX;
    s16 objY;
    s16 minX;
    s16 maxX;
    s16 minY;
    s16 maxY;

    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH))
        return FALSE;
    if (objectEvent->trainerType != TRAINER_TYPE_NORMAL && objectEvent->trainerType != TRAINER_TYPE_BURIED)
        return FALSE;
    PlayerGetDestCoords(&playerX, &playerY);
    objX = objectEvent->currentCoords.x;
    objY = objectEvent->currentCoords.y;
    minX = objX - objectEvent->trainerRange_berryTreeId;
    minY = objY - objectEvent->trainerRange_berryTreeId;
    maxX = objX + objectEvent->trainerRange_berryTreeId;
    maxY = objY + objectEvent->trainerRange_berryTreeId;
    if (minX > playerX || maxX < playerX || minY > playerY || maxY < playerY)
    {
        return FALSE;
    }
    return TRUE;
}

static u8 GetVectorDirection(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    if (absdx > absdy)
    {
        direction = DIR_EAST;
        if (dx < 0)
        {
            direction = DIR_WEST;
        }
    }
    else
    {
        direction = DIR_SOUTH;
        if (dy < 0)
        {
            direction = DIR_NORTH;
        }
    }
    return direction;
}

static u8 GetLimitedVectorDirection_SouthNorth(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = DIR_SOUTH;
    if (dy < 0)
    {
        direction = DIR_NORTH;
    }
    return direction;
}

static u8 GetLimitedVectorDirection_WestEast(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = DIR_EAST;
    if (dx < 0)
    {
        direction = DIR_WEST;
    }
    return direction;
}

static u8 GetLimitedVectorDirection_WestNorth(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = GetVectorDirection(dx, dy, absdx, absdy);
    if (direction == DIR_SOUTH)
    {
        direction = GetLimitedVectorDirection_WestEast(dx, dy, absdx, absdy);
        if (direction == DIR_EAST)
        {
            direction = DIR_NORTH;
        }
    }
    else if (direction == DIR_EAST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(dx, dy, absdx, absdy);
        if (direction == DIR_SOUTH)
        {
            direction = DIR_NORTH;
        }
    }
    return direction;
}

static u8 GetLimitedVectorDirection_EastNorth(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = GetVectorDirection(dx, dy, absdx, absdy);
    if (direction == DIR_SOUTH)
    {
        direction = GetLimitedVectorDirection_WestEast(dx, dy, absdx, absdy);
        if (direction == DIR_WEST)
        {
            direction = DIR_NORTH;
        }
    }
    else if (direction == DIR_WEST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(dx, dy, absdx, absdy);
        if (direction == DIR_SOUTH)
        {
            direction = DIR_NORTH;
        }
    }
    return direction;
}

static u8 GetLimitedVectorDirection_WestSouth(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = GetVectorDirection(dx, dy, absdx, absdy);
    if (direction == DIR_NORTH)
    {
        direction = GetLimitedVectorDirection_WestEast(dx, dy, absdx, absdy);
        if (direction == DIR_EAST)
        {
            direction = DIR_SOUTH;
        }
    }
    else if (direction == DIR_EAST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(dx, dy, absdx, absdy);
        if (direction == DIR_NORTH)
        {
            direction = DIR_SOUTH;
        }
    }
    return direction;
}

static u8 GetLimitedVectorDirection_EastSouth(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = GetVectorDirection(dx, dy, absdx, absdy);
    if (direction == DIR_NORTH)
    {
        direction = GetLimitedVectorDirection_WestEast(dx, dy, absdx, absdy);
        if (direction == DIR_WEST)
        {
            direction = DIR_SOUTH;
        }
    }
    else if (direction == DIR_WEST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(dx, dy, absdx, absdy);
        if (direction == DIR_NORTH)
        {
            direction = DIR_SOUTH;
        }
    }
    return direction;
}

static u8 GetLimitedVectorDirection_SouthNorthWest(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = GetVectorDirection(dx, dy, absdx, absdy);
    if (direction == DIR_EAST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(dx, dy, absdx, absdy);
    }
    return direction;
}

static u8 GetLimitedVectorDirection_SouthNorthEast(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = GetVectorDirection(dx, dy, absdx, absdy);
    if (direction == DIR_WEST)
    {
        direction = GetLimitedVectorDirection_SouthNorth(dx, dy, absdx, absdy);
    }
    return direction;
}

static u8 GetLimitedVectorDirection_NorthWestEast(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = GetVectorDirection(dx, dy, absdx, absdy);
    if (direction == DIR_SOUTH)
    {
        direction = GetLimitedVectorDirection_WestEast(dx, dy, absdx, absdy);
    }
    return direction;
}

static u8 GetLimitedVectorDirection_SouthWestEast(s16 dx, s16 dy, s16 absdx, s16 absdy)
{
    u8 direction;

    direction = GetVectorDirection(dx, dy, absdx, absdy);
    if (direction == DIR_NORTH)
    {
        direction = GetLimitedVectorDirection_WestEast(dx, dy, absdx, absdy);
    }
    return direction;
}

u8 TryGetTrainerEncounterDirection(struct ObjectEvent *objectEvent, u8 movementType)
{
    s16 dx, dy;
    s16 absdx, absdy;

    if (!ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        return 0;
    }
    PlayerGetDestCoords(&dx, &dy);
    dx -= objectEvent->currentCoords.x;
    dy -= objectEvent->currentCoords.y;
    absdx = dx;
    absdy = dy;
    if (absdx < 0)
    {
        absdx = -absdx;
    }
    if (absdy < 0)
    {
        absdy = -absdy;
    }
    return gGetVectorDirectionFuncs[movementType](dx, dy, absdx, absdy);
}

movement_type_def(MovementType_LookAround, gMovementTypeFuncs_LookAround)

static bool8 MovementType_LookAround_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_LookAround_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_LookAround_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_LookAround_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_LookAround_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gStandardDirections, sizeof directions);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_ANY);
    if (direction == DIR_NONE)
        direction = directions[Random() & 3];

    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_WanderUpAndDown, gMovementTypeFuncs_WanderUpAndDown)

static bool8 MovementType_WanderUpAndDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_WanderUpAndDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_WanderUpAndDown_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (!ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        return FALSE;
    }
    SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
    sprite->data[1] = 3;
    return TRUE;
}

static bool8 MovementType_WanderUpAndDown_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_WanderUpAndDown_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUpAndDownDirections, sizeof directions);
    direction = directions[Random() & 1];
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 5;
    if (GetCollisionInDirection(objectEvent, direction))
        sprite->data[1] = 1;

    return TRUE;
}

static bool8 MovementType_WanderUpAndDown_Step5(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkNormalMovementAction(objectEvent->movementDirection));
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 6;
    return TRUE;
}

static bool8 MovementType_WanderUpAndDown_Step6(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 1;
    }
    return FALSE;
}

movement_type_def(MovementType_WanderLeftAndRight, gMovementTypeFuncs_WanderLeftAndRight)

static bool8 MovementType_WanderLeftAndRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_WanderLeftAndRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_WanderLeftAndRight_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (!ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        return FALSE;
    }
    SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
    sprite->data[1] = 3;
    return TRUE;
}

static bool8 MovementType_WanderLeftAndRight_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_WanderLeftAndRight_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gLeftAndRightDirections, sizeof directions);
    direction = directions[Random() & 1];
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 5;
    if (GetCollisionInDirection(objectEvent, direction))
        sprite->data[1] = 1;

    return TRUE;
}

static bool8 MovementType_WanderLeftAndRight_Step5(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkNormalMovementAction(objectEvent->movementDirection));
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 6;
    return TRUE;
}

static bool8 MovementType_WanderLeftAndRight_Step6(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 1;
    }
    return FALSE;
}

movement_type_def(MovementType_FaceDirection, gMovementTypeFuncs_FaceDirection)

static bool8 MovementType_FaceDirection_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceDirection_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        sprite->data[1] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceDirection_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->singleMovementActive = FALSE;
    return FALSE;
}

movement_type_def(MovementType_FaceDownAndUp, gMovementTypeFuncs_FaceDownAndUp)

static bool8 MovementType_FaceDownAndUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceDownAndUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceDownAndUp_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownAndUp_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownAndUp_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUpAndDownDirections, sizeof gUpAndDownDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_NORTH_SOUTH);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_FaceLeftAndRight, gMovementTypeFuncs_FaceLeftAndRight)

static bool8 MovementType_FaceLeftAndRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceLeftAndRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceLeftAndRight_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysMedium[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceLeftAndRight_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceLeftAndRight_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gLeftAndRightDirections, sizeof gLeftAndRightDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_EAST_WEST);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_FaceUpAndLeft, gMovementTypeFuncs_FaceUpAndLeft)

static bool8 MovementType_FaceUpAndLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceUpAndLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceUpAndLeft_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceUpAndLeft_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceUpAndLeft_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUpAndLeftDirections, sizeof gUpAndLeftDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_NORTH_WEST);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_FaceUpAndRight, gMovementTypeFuncs_FaceUpAndRight)

static bool8 MovementType_FaceUpAndRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceUpAndRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceUpAndRight_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceUpAndRight_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceUpAndRight_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUpAndRightDirections, sizeof gUpAndRightDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_NORTH_EAST);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_FaceDownAndLeft, gMovementTypeFuncs_FaceDownAndLeft)

static bool8 MovementType_FaceDownAndLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceDownAndLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceDownAndLeft_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownAndLeft_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownAndLeft_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gDownAndLeftDirections, sizeof gDownAndLeftDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_SOUTH_WEST);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_FaceDownAndRight, gMovementTypeFuncs_FaceDownAndRight)

static bool8 MovementType_FaceDownAndRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceDownAndRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceDownAndRight_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownAndRight_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownAndRight_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gDownAndRightDirections, sizeof gDownAndRightDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_SOUTH_EAST);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 1];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_FaceDownUpAndLeft, gMovementTypeFuncs_FaceDownUpAndLeft)

static bool8 MovementType_FaceDownUpAndLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceDownUpAndLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceDownUpAndLeft_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownUpAndLeft_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownUpAndLeft_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gDownUpAndLeftDirections, sizeof gDownUpAndLeftDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_NORTH_SOUTH_WEST);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 3];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_FaceDownUpAndRight, gMovementTypeFuncs_FaceDownUpAndRight)

static bool8 MovementType_FaceDownUpAndRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceDownUpAndRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceDownUpAndRight_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownUpAndRight_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownUpAndRight_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gDownUpAndRightDirections, sizeof gDownUpAndRightDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_NORTH_SOUTH_EAST);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 3];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_FaceUpRightAndLeft, gMovementTypeFuncs_FaceUpLeftAndRight)

static bool8 MovementType_FaceUpLeftAndRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceUpLeftAndRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceUpLeftAndRight_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceUpLeftAndRight_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceUpLeftAndRight_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUpLeftAndRightDirections, sizeof gUpLeftAndRightDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_NORTH_EAST_WEST);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 3];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_FaceDownRightAndLeft, gMovementTypeFuncs_FaceDownLeftAndRight)

static bool8 MovementType_FaceDownLeftAndRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_FaceDownLeftAndRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_FaceDownLeftAndRight_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, gMovementDelaysShort[Random() & 3]);
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownLeftAndRight_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 4;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_FaceDownLeftAndRight_Step4(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gDownLeftAndRightDirections, sizeof gDownLeftAndRightDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_SOUTH_EAST_WEST);
    if (direction == DIR_NONE)
    {
        direction = directions[Random() & 3];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_RotateCounterclockwise, gMovementTypeFuncs_RotateCounterclockwise)

static bool8 MovementType_RotateCounterclockwise_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_RotateCounterclockwise_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, 48);
        sprite->data[1] = 2;
    }
    return FALSE;
}

static bool8 MovementType_RotateCounterclockwise_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_RotateCounterclockwise_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[5];
    memcpy(directions, gCounterclockwiseDirections, sizeof gCounterclockwiseDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_ANY);
    if (direction == DIR_NONE)
    {
        direction = directions[objectEvent->facingDirection];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 0;
    return TRUE;
}

movement_type_def(MovementType_RotateClockwise, gMovementTypeFuncs_RotateClockwise)

static bool8 MovementType_RotateClockwise_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_RotateClockwise_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        SetMovementDelay(sprite, 48);
        sprite->data[1] = 2;
    }
    return FALSE;
}

static bool8 MovementType_RotateClockwise_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (WaitForMovementDelay(sprite) || ObjectEventIsTrainerAndCloseToPlayer(objectEvent))
    {
        sprite->data[1] = 3;
    }
    return FALSE;
}

static bool8 MovementType_RotateClockwise_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[5];
    memcpy(directions, gClockwiseDirections, sizeof gClockwiseDirections);
    direction = TryGetTrainerEncounterDirection(objectEvent, RUNFOLLOW_ANY);
    if (direction == DIR_NONE)
    {
        direction = directions[objectEvent->facingDirection];
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 0;
    return TRUE;
}

movement_type_def(MovementType_WalkBackAndForth, gMovementTypeFuncs_WalkBackAndForth)

static bool8 MovementType_WalkBackAndForth_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_WalkBackAndForth_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 direction;

    direction = gInitialMovementTypeFacingDirections[objectEvent->movementType];
    if (objectEvent->directionSequenceIndex)
    {
        direction = GetOppositeDirection(direction);
    }
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_WalkBackAndForth_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    bool8 collision;
    u8 movementActionId;

    if (objectEvent->directionSequenceIndex && objectEvent->initialCoords.x == objectEvent->currentCoords.x && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 0;
        SetObjectEventDirection(objectEvent, GetOppositeDirection(objectEvent->movementDirection));
    }
    collision = GetCollisionInDirection(objectEvent, objectEvent->movementDirection);
    movementActionId = GetWalkNormalMovementAction(objectEvent->movementDirection);
    if (collision == COLLISION_OUTSIDE_RANGE)
    {
        objectEvent->directionSequenceIndex++;
        SetObjectEventDirection(objectEvent, GetOppositeDirection(objectEvent->movementDirection));
        movementActionId = GetWalkNormalMovementAction(objectEvent->movementDirection);
        collision = GetCollisionInDirection(objectEvent, objectEvent->movementDirection);
    }

    if (collision)
        movementActionId = GetWalkInPlaceNormalMovementAction(objectEvent->facingDirection);

    ObjectEventSetSingleMovement(objectEvent, sprite, movementActionId);
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 3;
    return TRUE;
}

static bool8 MovementType_WalkBackAndForth_Step3(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 1;
    }
    return FALSE;
}

static bool8 MovementType_WalkSequence_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    sprite->data[1] = 1;
    return TRUE;
}

bool8 MoveNextDirectionInSequence(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 *route)
{
    u8 collision;
    u8 movementActionId;

    if (objectEvent->directionSequenceIndex == 3 && objectEvent->initialCoords.x == objectEvent->currentCoords.x && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
        objectEvent->directionSequenceIndex = 0;

    SetObjectEventDirection(objectEvent, route[objectEvent->directionSequenceIndex]);
    movementActionId = GetWalkNormalMovementAction(objectEvent->movementDirection);
    collision = GetCollisionInDirection(objectEvent, objectEvent->movementDirection);
    if (collision == COLLISION_OUTSIDE_RANGE)
    {
        objectEvent->directionSequenceIndex++;
        SetObjectEventDirection(objectEvent, route[objectEvent->directionSequenceIndex]);
        movementActionId = GetWalkNormalMovementAction(objectEvent->movementDirection);
        collision = GetCollisionInDirection(objectEvent, objectEvent->movementDirection);
    }

    if (collision)
        movementActionId = GetWalkInPlaceNormalMovementAction(objectEvent->facingDirection);

    ObjectEventSetSingleMovement(objectEvent, sprite, movementActionId);
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 MovementType_WalkSequence_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 1;
    }
    return FALSE;
}

movement_type_def(MovementType_WalkSequenceUpRightLeftDown, gMovementTypeFuncs_WalkSequenceUpRightLeftDown)

u8 MovementType_WalkSequenceUpRightLeftDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gUpRightLeftDownDirections)];
    memcpy(directions, gUpRightLeftDownDirections, sizeof(gUpRightLeftDownDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightLeftDownUp, gMovementTypeFuncs_WalkSequenceRightLeftDownUp)

u8 MovementType_WalkSequenceRightLeftDownUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gRightLeftDownUpDirections)];
    memcpy(directions, gRightLeftDownUpDirections, sizeof(gRightLeftDownUpDirections));
    if (objectEvent->directionSequenceIndex == 1 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownUpRightLeft, gMovementTypeFuncs_WalkSequenceDownUpRightLeft)

u8 MovementType_WalkSequenceDownUpRightLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gDownUpRightLeftDirections)];
    memcpy(directions, gDownUpRightLeftDirections, sizeof(gDownUpRightLeftDirections));
    if (objectEvent->directionSequenceIndex == 1 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftDownUpRight, gMovementTypeFuncs_WalkSequenceLeftDownUpRight)

u8 MovementType_WalkSequenceLeftDownUpRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gLeftDownUpRightDirections)];
    memcpy(directions, gLeftDownUpRightDirections, sizeof(gLeftDownUpRightDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpLeftRightDown, gMovementTypeFuncs_WalkSequenceUpLeftRightDown)

u8 MovementType_WalkSequenceUpLeftRightDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gUpLeftRightDownDirections)];
    memcpy(directions, gUpLeftRightDownDirections, sizeof(gUpLeftRightDownDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftRightDownUp, gMovementTypeFuncs_WalkSequenceLeftRightDownUp)

u8 MovementType_WalkSequenceLeftRightDownUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gLeftRightDownUpDirections)];
    memcpy(directions, gLeftRightDownUpDirections, sizeof(gLeftRightDownUpDirections));
    if (objectEvent->directionSequenceIndex == 1 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownUpLeftRight, gMovementTypeFuncs_WalkSequenceDownUpLeftRight)

u8 MovementType_WalkSequenceDownUpLeftRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gStandardDirections)];
    memcpy(directions, gStandardDirections, sizeof(gStandardDirections));
    if (objectEvent->directionSequenceIndex == 1 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightDownUpLeft, gMovementTypeFuncs_WalkSequenceRightDownUpLeft)

u8 MovementType_WalkSequenceRightDownUpLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gRightDownUpLeftDirections)];
    memcpy(directions, gRightDownUpLeftDirections, sizeof(gRightDownUpLeftDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftUpDownRight, gMovementTypeFuncs_WalkSequenceLeftUpDownRight)

u8 MovementType_WalkSequenceLeftUpDownRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gLeftUpDownRightDirections)];
    memcpy(directions, gLeftUpDownRightDirections, sizeof(gLeftUpDownRightDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpDownRightLeft, gMovementTypeFuncs_WalkSequenceUpDownRightLeft)

u8 MovementType_WalkSequenceUpDownRightLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gUpDownRightLeftDirections)];
    memcpy(directions, gUpDownRightLeftDirections, sizeof(gUpDownRightLeftDirections));
    if (objectEvent->directionSequenceIndex == 1 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightLeftUpDown, gMovementTypeFuncs_WalkSequenceRightLeftUpDown)

u8 MovementType_WalkSequenceRightLeftUpDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gRightLeftUpDownDirections)];
    memcpy(directions, gRightLeftUpDownDirections, sizeof(gRightLeftUpDownDirections));
    if (objectEvent->directionSequenceIndex == 1 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownRightLeftUp, gMovementTypeFuncs_WalkSequenceDownRightLeftUp)

u8 MovementType_WalkSequenceDownRightLeftUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gDownRightLeftUpDirections)];
    memcpy(directions, gDownRightLeftUpDirections, sizeof(gDownRightLeftUpDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightUpDownLeft, gMovementTypeFuncs_WalkSequenceRightUpDownLeft)

u8 MovementType_WalkSequenceRightUpDownLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gRightUpDownLeftDirections)];
    memcpy(directions, gRightUpDownLeftDirections, sizeof(gRightUpDownLeftDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpDownLeftRight, gMovementTypeFuncs_WalkSequenceUpDownLeftRight)

u8 MovementType_WalkSequenceUpDownLeftRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gUpDownLeftRightDirections)];
    memcpy(directions, gUpDownLeftRightDirections, sizeof(gUpDownLeftRightDirections));
    if (objectEvent->directionSequenceIndex == 1 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftRightUpDown, gMovementTypeFuncs_WalkSequenceLeftRightUpDown)

u8 MovementType_WalkSequenceLeftRightUpDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gLeftRightUpDownDirections)];
    memcpy(directions, gLeftRightUpDownDirections, sizeof(gLeftRightUpDownDirections));
    if (objectEvent->directionSequenceIndex == 1 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 2;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownLeftRightUp, gMovementTypeFuncs_WalkSequenceDownLeftRightUp)

u8 MovementType_WalkSequenceDownLeftRightUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gDownLeftRightUpDirections)];
    memcpy(directions, gDownLeftRightUpDirections, sizeof(gDownLeftRightUpDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpLeftDownRight, gMovementTypeFuncs_WalkSequenceUpLeftDownRight)

u8 MovementType_WalkSequenceUpLeftDownRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gUpLeftDownRightDirections)];
    memcpy(directions, gUpLeftDownRightDirections, sizeof(gUpLeftDownRightDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownRightUpLeft, gMovementTypeFuncs_WalkSequenceDownRightUpLeft)

u8 MovementType_WalkSequenceDownRightUpLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gDownRightUpLeftDirections)];
    memcpy(directions, gDownRightUpLeftDirections, sizeof(gDownRightUpLeftDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftDownRightUp, gMovementTypeFuncs_WalkSequenceLeftDownRightUp)

u8 MovementType_WalkSequenceLeftDownRightUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gLeftDownRightUpDirections)];
    memcpy(directions, gLeftDownRightUpDirections, sizeof(gLeftDownRightUpDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightUpLeftDown, gMovementTypeFuncs_WalkSequenceRightUpLeftDown)

u8 MovementType_WalkSequenceRightUpLeftDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gRightUpLeftDownDirections)];
    memcpy(directions, gRightUpLeftDownDirections, sizeof(gRightUpLeftDownDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceUpRightDownLeft, gMovementTypeFuncs_WalkSequenceUpRightDownLeft)

u8 MovementType_WalkSequenceUpRightDownLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gUpRightDownLeftDirections)];
    memcpy(directions, gUpRightDownLeftDirections, sizeof(gUpRightDownLeftDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceDownLeftUpRight, gMovementTypeFuncs_WalkSequenceDownLeftUpRight)

u8 MovementType_WalkSequenceDownLeftUpRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gDownLeftUpRightDirections)];
    memcpy(directions, gDownLeftUpRightDirections, sizeof(gDownLeftUpRightDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.y == objectEvent->currentCoords.y)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceLeftUpRightDown, gMovementTypeFuncs_WalkSequenceLeftUpRightDown)

u8 MovementType_WalkSequenceLeftUpRightDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gLeftUpRightDownDirections)];
    memcpy(directions, gLeftUpRightDownDirections, sizeof(gLeftUpRightDownDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_WalkSequenceRightDownLeftUp, gMovementTypeFuncs_WalkSequenceRightDownLeftUp)

u8 MovementType_WalkSequenceRightDownLeftUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 directions[sizeof(gRightDownLeftUpDirections)];
    memcpy(directions, gRightDownLeftUpDirections, sizeof(gRightDownLeftUpDirections));
    if (objectEvent->directionSequenceIndex == 2 && objectEvent->initialCoords.x == objectEvent->currentCoords.x)
    {
        objectEvent->directionSequenceIndex = 3;
    }
    return MoveNextDirectionInSequence(objectEvent, sprite, directions);
}

movement_type_def(MovementType_CopyPlayer, gMovementTypeFuncs_CopyPlayer)

static bool8 MovementType_CopyPlayer_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    if (objectEvent->directionSequenceIndex == 0)
    {
        objectEvent->directionSequenceIndex = GetPlayerFacingDirection();
    }
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_CopyPlayer_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (gObjectEvents[gPlayerAvatar.objectEventId].movementActionId == MOVEMENT_ACTION_NONE || gPlayerAvatar.tileTransitionState == T_TILE_CENTER)
    {
        return FALSE;
    }
    return gCopyPlayerMovementFuncs[PlayerGetCopyableMovement()](objectEvent, sprite, GetPlayerMovementDirection(), NULL);
}

static bool8 MovementType_CopyPlayer_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        objectEvent->singleMovementActive = FALSE;
        sprite->data[1] = 1;
    }
    return FALSE;
}

static bool8 CopyablePlayerMovement_None(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    return FALSE;
}

static bool8 CopyablePlayerMovement_FaceDirection(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(GetCopyDirection(gInitialMovementTypeFacingDirections[objectEvent->movementType], objectEvent->directionSequenceIndex, playerDirection)));
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 CopyablePlayerMovement_GoSpeed0(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = GetCopyDirection(gInitialMovementTypeFacingDirections[objectEvent->movementType], objectEvent->directionSequenceIndex, direction);
    ObjectEventMoveDestCoords(objectEvent, direction, &x, &y);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkNormalMovementAction(direction));
    if (GetCollisionAtCoords(objectEvent, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(direction));
    }
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 CopyablePlayerMovement_GoSpeed1(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = GetCopyDirection(gInitialMovementTypeFacingDirections[objectEvent->movementType], objectEvent->directionSequenceIndex, direction);
    ObjectEventMoveDestCoords(objectEvent, direction, &x, &y);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkFastMovementAction(direction));
    if (GetCollisionAtCoords(objectEvent, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(direction));
    }
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 CopyablePlayerMovement_GoSpeed2(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = GetCopyDirection(gInitialMovementTypeFacingDirections[objectEvent->movementType], objectEvent->directionSequenceIndex, direction);
    ObjectEventMoveDestCoords(objectEvent, direction, &x, &y);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkFasterMovementAction(direction));
    if (GetCollisionAtCoords(objectEvent, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(direction));
    }
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 CopyablePlayerMovement_Slide(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = GetCopyDirection(gInitialMovementTypeFacingDirections[objectEvent->movementType], objectEvent->directionSequenceIndex, direction);
    ObjectEventMoveDestCoords(objectEvent, direction, &x, &y);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetSlideMovementAction(direction));
    if (GetCollisionAtCoords(objectEvent, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(direction));
    }
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 cph_IM_DIFFERENT(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;

    direction = playerDirection;
    direction = GetCopyDirection(gInitialMovementTypeFacingDirections[objectEvent->movementType], objectEvent->directionSequenceIndex, direction);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetJumpInPlaceMovementAction(direction));
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 CopyablePlayerMovement_GoSpeed4(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = GetCopyDirection(gInitialMovementTypeFacingDirections[objectEvent->movementType], objectEvent->directionSequenceIndex, direction);
    ObjectEventMoveDestCoords(objectEvent, direction, &x, &y);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetJumpMovementAction(direction));
    if (GetCollisionAtCoords(objectEvent, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(direction));
    }
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

static bool8 CopyablePlayerMovement_Jump(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 playerDirection, bool8 tileCallback(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = GetCopyDirection(gInitialMovementTypeFacingDirections[objectEvent->movementType], objectEvent->directionSequenceIndex, direction);
    x = objectEvent->currentCoords.x;
    y = objectEvent->currentCoords.y;
    MoveCoordsInDirection(direction, &x, &y, 2, 2);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetJump2MovementAction(direction));
    if (GetCollisionAtCoords(objectEvent, x, y, direction) || (tileCallback != NULL && !tileCallback(MapGridGetMetatileBehaviorAt(x, y))))
    {
        ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(direction));
    }
    objectEvent->singleMovementActive = TRUE;
    sprite->data[1] = 2;
    return TRUE;
}

movement_type_def(MovementType_CopyPlayerInGrass, gMovementTypeFuncs_CopyPlayerInGrass)

static bool8 MovementType_CopyPlayerInGrass_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (gObjectEvents[gPlayerAvatar.objectEventId].movementActionId == MOVEMENT_ACTION_NONE || gPlayerAvatar.tileTransitionState == T_TILE_CENTER)
    {
        return FALSE;
    }
    return gCopyPlayerMovementFuncs[PlayerGetCopyableMovement()](objectEvent, sprite, GetPlayerMovementDirection(), MetatileBehavior_IsPokeGrass);
}

static void MovementType_TreeDisguise(struct Sprite *sprite)
{
    struct ObjectEvent *objectEvent;

    objectEvent = &gObjectEvents[sprite->data[0]];
    if (objectEvent->directionSequenceIndex == 0 || (objectEvent->directionSequenceIndex == 1 && !sprite->data[7]))
    {
        ObjectEventGetLocalIdAndMap(objectEvent, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
        objectEvent->fieldEffectSpriteId = FieldEffectStart(FLDEFF_TREE_DISGUISE);
        objectEvent->directionSequenceIndex = 1;
        sprite->data[7]++;
    }
    UpdateObjectEventCurrentMovement(&gObjectEvents[sprite->data[0]], sprite, MovementType_Disguise_Callback);
}

static bool8 MovementType_Disguise_Callback(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    return FALSE;
}

static void MovementType_MountainDisguise(struct Sprite *sprite)
{
    struct ObjectEvent *objectEvent;

    objectEvent = &gObjectEvents[sprite->data[0]];
    if (objectEvent->directionSequenceIndex == 0 || (objectEvent->directionSequenceIndex == 1 && !sprite->data[7]))
    {
        ObjectEventGetLocalIdAndMap(objectEvent, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
        objectEvent->fieldEffectSpriteId = FieldEffectStart(FLDEFF_MOUNTAIN_DISGUISE);
        objectEvent->directionSequenceIndex = 1;
        sprite->data[7]++;
    }
    UpdateObjectEventCurrentMovement(&gObjectEvents[sprite->data[0]], sprite, MovementType_Disguise_Callback);
}

static void MovementType_Buried(struct Sprite *sprite)
{
    if (!sprite->data[7])
    {
        gObjectEvents[sprite->data[0]].fixedPriority = TRUE;
        sprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
        sprite->oam.priority = 3;
        sprite->data[7]++;
    }
    UpdateObjectEventCurrentMovement(&gObjectEvents[sprite->data[0]], sprite, MovementType_Buried_Callback);
}

static bool8 MovementType_Buried_Callback(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return gMovementTypeFuncs_Buried[sprite->data[1]](objectEvent, sprite);
}

static bool8 MovementType_Buried_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    return FALSE;
}

static bool8 MovementType_MoveInPlace_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        sprite->data[1] = 0;
    }
    return FALSE;
}

movement_type_def(MovementType_WalkInPlace, gMovementTypeFuncs_WalkInPlace)

static bool8 MovementType_WalkInPlace_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkInPlaceNormalMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_WalkInPlaceFast, gMovementTypeFuncs_WalkInPlaceFast)

static bool8 MovementType_WalkInPlaceFast_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkInPlaceFastMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_JogInPlace, gMovementTypeFuncs_JogInPlace)

static bool8 MovementType_JogInPlace_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetWalkInPlaceFasterMovementAction(objectEvent->facingDirection));
    sprite->data[1] = 1;
    return TRUE;
}

movement_type_def(MovementType_Invisible, gMovementTypeFuncs_Invisible)

static bool8 MovementType_Invisible_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, GetFaceDirectionMovementAction(objectEvent->facingDirection));
    objectEvent->invisible = TRUE;
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_Invisible_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        sprite->data[1] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_Invisible_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->singleMovementActive = FALSE;
    return FALSE;
}

void MovementType_RaiseHandAndStop(struct Sprite *sprite)
{
    UpdateObjectEventCurrentMovement(&gObjectEvents[sprite->data[0]], sprite, MovementType_RaiseHandAndStop_Callback);
}

void MovementType_RaiseHandAndJump(struct Sprite *sprite)
{
    UpdateObjectEventCurrentMovement(&gObjectEvents[sprite->data[0]], sprite, MovementType_RaiseHandAndJump_Callback);
}

void MovementType_RaiseHandAndSwim(struct Sprite *sprite)
{
    UpdateObjectEventCurrentMovement(&gObjectEvents[sprite->data[0]], sprite, MovementType_RaiseHandAndSwim_Callback);
}

static u8 MovementType_RaiseHandAndStop_Callback(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return gMovementTypeFuncs_RaiseHandAndStop[sprite->data[1]](objectEvent, sprite);
}

static u8 MovementType_RaiseHandAndJump_Callback(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return gMovementTypeFuncs_RaiseHandAndJump[sprite->data[1]](objectEvent, sprite);
}

static u8 MovementType_RaiseHandAndSwim_Callback(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return gMovementTypeFuncs_RaiseHandAndSwim[sprite->data[1]](objectEvent, sprite);
}

static bool8 MovementType_RaiseHandAndStop_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, MOVEMENT_ACTION_RAISE_HAND_AND_STOP);
    sprite->data[1] = 1;
    return TRUE;
}

static bool8 MovementType_RaiseHandAndStop_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        sprite->data[1] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementType_RaiseHandAndStop_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->singleMovementActive = FALSE;
    return FALSE;
}

static bool8 MovementType_RaiseHandAndJump_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, MOVEMENT_ACTION_RAISE_HAND_AND_JUMP);
    sprite->data[1] = 1;
    return FALSE;
}

static bool8 MovementType_RaiseHandAndSwim_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ClearObjectEventMovement(objectEvent, sprite);
    ObjectEventSetSingleMovement(objectEvent, sprite, MOVEMENT_ACTION_RAISE_HAND_AND_SWIM);
    sprite->data[1] = 1;
    return FALSE;
}

static bool8 MovementType_RaiseHandAndMove_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (ObjectEventExecSingleMovementAction(objectEvent, sprite))
    {
        sprite->data[1] = 0;
    }
    return FALSE;
}

static void ClearObjectEventMovement(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->singleMovementActive = FALSE;
    objectEvent->heldMovementActive = FALSE;
    objectEvent->heldMovementFinished = FALSE;
    objectEvent->movementActionId = MOVEMENT_ACTION_NONE;
    sprite->data[1] = 0;
}

u8 GetFaceDirectionAnimNum(u8 direction)
{
    return sFaceDirectionAnimNums[direction];
}

u8 GetMoveDirectionAnimNum(u8 direction)
{
    return sMoveDirectionAnimNums[direction];
}

static u8 GetMoveDirectionFastAnimNum(u8 direction)
{
    return sMoveDirectionFastAnimNums[direction];
}

static u8 GetMoveDirectionFasterAnimNum(u8 direction)
{
    return sMoveDirectionFasterAnimNums[direction];
}

static u8 GetMoveDirectionFastestAnimNum(u8 direction)
{
    return sMoveDirectionFastestAnimNums[direction];
}

u8 GetJumpSpecialDirectionAnimNum(u8 direction)
{
    return sJumpSpecialDirectionAnimNums[direction];
}

u8 GetAcroWheelieDirectionAnimNum(u8 direction)
{
    return sAcroBunnyHopBackWheelDirectionAnimNums[direction];
}

u8 GetAcroBunnyHopFrontWheelDirectionAnimNum(u8 direction)
{
    return sAcroBunnyHopFrontWheelDirectionAnimNums[direction];
}

u8 GetAcroEndWheelieDirectionAnimNum(u8 direction)
{
    return sAcroStandingWheelieBackWheelDirectionAnimNums[direction];
}

u8 GetSpinDirectionAnimNum(u8 direction)
{
    return sSpinDirectionAnimNums[direction];
}

u8 GetAcroUnusedActionDirectionAnimNum(u8 direction)
{
    return sAcroStandingWheelieFrontWheelDirectionAnimNums[direction];
}

u8 GetAcroWheeliePedalDirectionAnimNum(u8 direction)
{
    return sAcroMovingWheelieDirectionAnimNums[direction];
}

u8 GetFishingDirectionAnimNum(u8 direction)
{
    return sFishingDirectionAnimNums[direction];
}

u8 GetFishingNoCatchDirectionAnimNum(u8 direction)
{
    return sFishingNoCatchDirectionAnimNums[direction];
}

u8 GetFishingBiteDirectionAnimNum(u8 direction)
{
    return sFishingBiteDirectionAnimNums[direction];
}

u8 GetRunningDirectionAnimNum(u8 direction)
{
    return sRunningDirectionAnimNums[direction];
}

static const struct StepAnimTable *GetStepAnimTable(const union AnimCmd *const *anims)
{
    const struct StepAnimTable *stepTable;

    for (stepTable = sStepAnimTables; stepTable->anims != NULL; stepTable++)
        if (stepTable->anims == anims)
            return stepTable;

    return NULL;
}

void SetStepAnimHandleAlternation(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 animNum)
{
    const struct StepAnimTable *stepTable;

    if (!objectEvent->inanimate)
    {
        sprite->animNum = animNum;
        stepTable = GetStepAnimTable(sprite->anims);
        if (stepTable != NULL)
        {
            if (sprite->animCmdIndex == stepTable->animPos[0])
                sprite->animCmdIndex = stepTable->animPos[3];
            else if (sprite->animCmdIndex == stepTable->animPos[1])
                sprite->animCmdIndex = stepTable->animPos[2];
        }
        SeekSpriteAnim(sprite, sprite->animCmdIndex);
    }
}

void SetStepAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 animNum)
{
    const struct StepAnimTable *stepTable;

    if (!objectEvent->inanimate)
    {
        u8 animPos;

        sprite->animNum = animNum;
        stepTable = GetStepAnimTable(sprite->anims);
        if (stepTable != NULL)
        {
            animPos = stepTable->animPos[1];
            if (sprite->animCmdIndex <= stepTable->animPos[0])
                animPos = stepTable->animPos[0];

            SeekSpriteAnim(sprite, animPos);
        }
    }
}

// file boundary?

u8 GetDirectionToFace(s16 x1, s16 y1, s16 x2, s16 y2)
{
    if (x1 > x2)
    {
        return DIR_WEST;
    }
    if (x1 < x2)
    {
        return DIR_EAST;
    }
    if (y1 > y2)
    {
        return DIR_NORTH;
    }
    return DIR_SOUTH;
}

void SetTrainerMovementType(struct ObjectEvent *objectEvent, u8 movementType)
{
    objectEvent->movementType = movementType;
    objectEvent->directionSequenceIndex = 0;
    objectEvent->playerCopyableMovement = 0;
    gSprites[objectEvent->spriteId].callback = sMovementTypeCallbacks[movementType];
    gSprites[objectEvent->spriteId].data[1] = 0;
}

u8 GetTrainerFacingDirectionMovementType(u8 direction)
{
    return sTrainerFacingDirectionMovementTypes[direction];
}

static u8 GetCollisionInDirection(struct ObjectEvent *objectEvent, u8 direction)
{
    s16 x;
    s16 y;
    x = objectEvent->currentCoords.x;
    y = objectEvent->currentCoords.y;
    MoveCoords(direction, &x, &y);
    return GetCollisionAtCoords(objectEvent, x, y, direction);
}

u8 GetCollisionAtCoords(struct ObjectEvent *objectEvent, s16 x, s16 y, u32 dir)
{
    u8 direction = dir;
    if (IsCoordOutsideObjectEventMovementRange(objectEvent, x, y))
        return COLLISION_OUTSIDE_RANGE;
    else if (MapGridGetCollisionAt(x, y) || GetMapBorderIdAt(x, y) == CONNECTION_INVALID || IsMetatileDirectionallyImpassable(objectEvent, x, y, direction))
        return COLLISION_IMPASSABLE;
    else if (objectEvent->trackedByCamera && !CanCameraMoveInDirection(direction))
        return COLLISION_IMPASSABLE;
    else if (IsElevationMismatchAt(objectEvent->currentElevation, x, y))
        return COLLISION_ELEVATION_MISMATCH;
    else if (DoesObjectCollideWithObjectAt(objectEvent, x, y))
        return COLLISION_OBJECT_EVENT;
    return COLLISION_NONE;
}

u8 GetCollisionFlagsAtCoords(struct ObjectEvent *objectEvent, s16 x, s16 y, u8 direction)
{
    u8 flags = 0;

    if (IsCoordOutsideObjectEventMovementRange(objectEvent, x, y))
        flags |= 1;
    if (MapGridGetCollisionAt(x, y) || GetMapBorderIdAt(x, y) == CONNECTION_INVALID || IsMetatileDirectionallyImpassable(objectEvent, x, y, direction) || (objectEvent->trackedByCamera && !CanCameraMoveInDirection(direction)))
        flags |= 2;
    if (IsElevationMismatchAt(objectEvent->currentElevation, x, y))
        flags |= 4;
    if (DoesObjectCollideWithObjectAt(objectEvent, x, y))
        flags |= 8;
    return flags;
}

static bool8 IsCoordOutsideObjectEventMovementRange(struct ObjectEvent *objectEvent, s16 x, s16 y)
{
    s16 left;
    s16 right;
    s16 top;
    s16 bottom;

    if (objectEvent->rangeX != 0)
    {
        left = objectEvent->initialCoords.x - objectEvent->rangeX;
        right = objectEvent->initialCoords.x + objectEvent->rangeX;
        if (left > x || right < x)
        {
            return TRUE;
        }
    }
    if (objectEvent->rangeY != 0)
    {
        top = objectEvent->initialCoords.y - objectEvent->rangeY;
        bottom = objectEvent->initialCoords.y + objectEvent->rangeY;
        if (top > y || bottom < y)
        {
            return TRUE;
        }
    }
    return FALSE;
}

static bool8 IsMetatileDirectionallyImpassable(struct ObjectEvent *objectEvent, s16 x, s16 y, u8 direction)
{
    if (gOppositeDirectionBlockedMetatileFuncs[direction - 1](objectEvent->currentMetatileBehavior)
        || gDirectionBlockedMetatileFuncs[direction - 1](MapGridGetMetatileBehaviorAt(x, y)))
    {
        return TRUE;
    }
    return FALSE;
}

static bool8 DoesObjectCollideWithObjectAt(struct ObjectEvent *objectEvent, s16 x, s16 y)
{
    u8 i;
    struct ObjectEvent *curObject;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        curObject = &gObjectEvents[i];
        if (curObject->active && curObject != objectEvent)
        {
            if ((curObject->currentCoords.x == x && curObject->currentCoords.y == y) || (curObject->previousCoords.x == x && curObject->previousCoords.y == y))
            {
                if (AreElevationsCompatible(objectEvent->currentElevation, curObject->currentElevation))
                    return TRUE;
            }
        }
    }
    return FALSE;
}

bool8 IsBerryTreeSparkling(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 objectEventId;

    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId)
        && gSprites[gObjectEvents[objectEventId].spriteId].data[7] & 2)
    {
        return TRUE;
    }

    return FALSE;
}

static void SetBerryTreeJustPicked(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 objectEventId;

    if (!TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId))
        gSprites[gObjectEvents[objectEventId].spriteId].data[7] |= 0x04;
}

void MoveCoords(u8 direction, s16 *x, s16 *y)
{
    *x += sDirectionToVectors[direction].x;
    *y += sDirectionToVectors[direction].y;
}

// Unused
static void MoveCoordsInMapCoordIncrement(u8 direction, s16 *x, s16 *y)
{
    *x += sDirectionToVectors[direction].x << 4;
    *y += sDirectionToVectors[direction].y << 4;
}

static void MoveCoordsInDirection(u32 dir, s16 *x, s16 *y, s16 deltaX, s16 deltaY)
{
    u8 direction = dir;
    s16 dx2 = (u16)deltaX;
    s16 dy2 = (u16)deltaY;
    if (sDirectionToVectors[direction].x > 0)
        *x += dx2;
    if (sDirectionToVectors[direction].x < 0)
        *x -= dx2;
    if (sDirectionToVectors[direction].y > 0)
        *y += dy2;
    if (sDirectionToVectors[direction].y < 0)
        *y -= dy2;
}

void GetMapCoordsFromSpritePos(s16 x, s16 y, s16 *destX, s16 *destY)
{
    *destX = (x - gSaveBlock1Ptr->pos.x) << 4;
    *destY = (y - gSaveBlock1Ptr->pos.y) << 4;
    *destX -= gTotalCameraPixelOffsetX;
    *destY -= gTotalCameraPixelOffsetY;
}

void SetSpritePosToMapCoords(s16 mapX, s16 mapY, s16 *destX, s16 *destY)
{
    s16 dx = -gTotalCameraPixelOffsetX - gFieldCamera.x;
    s16 dy = -gTotalCameraPixelOffsetY - gFieldCamera.y;
    if (gFieldCamera.x > 0)
        dx += 1 << 4;

    if (gFieldCamera.x < 0)
        dx -= 1 << 4;

    if (gFieldCamera.y > 0)
        dy += 1 << 4;

    if (gFieldCamera.y < 0)
        dy -= 1 << 4;

    *destX = ((mapX - gSaveBlock1Ptr->pos.x) << 4) + dx;
    *destY = ((mapY - gSaveBlock1Ptr->pos.y) << 4) + dy;
}

void SetSpritePosToOffsetMapCoords(s16 *x, s16 *y, s16 dx, s16 dy)
{
    SetSpritePosToMapCoords(*x, *y, x, y);
    *x += dx;
    *y += dy;
}

static void GetObjectEventMovingCameraOffset(s16 *x, s16 *y)
{
    *x = 0;
    *y = 0;
    if (gFieldCamera.x > 0)
    {
        (*x)++;
    }
    if (gFieldCamera.x < 0)
    {
        (*x)--;
    }
    if (gFieldCamera.y > 0)
    {
        (*y)++;
    }
    if (gFieldCamera.y < 0)
    {
        (*y)--;
    }
}

void ObjectEventMoveDestCoords(struct ObjectEvent *objectEvent, u32 direction, s16 *x, s16 *y)
{
    u8 newDirn = direction;
    *x = objectEvent->currentCoords.x;
    *y = objectEvent->currentCoords.y;
    MoveCoords(newDirn, x, y);
}

bool8 ObjectEventIsMovementOverridden(struct ObjectEvent *objectEvent)
{
    if (objectEvent->singleMovementActive || objectEvent->heldMovementActive)
        return TRUE;

    return FALSE;
}

bool8 ObjectEventIsHeldMovementActive(struct ObjectEvent *objectEvent)
{
    if (objectEvent->heldMovementActive && objectEvent->movementActionId != MOVEMENT_ACTION_NONE)
        return TRUE;

    return FALSE;
}

bool8 ObjectEventSetHeldMovement(struct ObjectEvent *objectEvent, u8 movementActionId)
{
    if (QL_GetPlaybackState() == QL_PLAYBACK_STATE_RUNNING)
        ObjectEventClearHeldMovementIfActive(objectEvent);
    else if (ObjectEventIsMovementOverridden(objectEvent))
        return TRUE;

    UnfreezeObjectEvent(objectEvent);
    objectEvent->movementActionId = movementActionId;
    objectEvent->heldMovementActive = TRUE;
    objectEvent->heldMovementFinished = FALSE;
    gSprites[objectEvent->spriteId].data[2] = 0;
    return FALSE;
}

void ObjectEventForceSetHeldMovement(struct ObjectEvent *objectEvent, u8 movementActionId)
{
    ObjectEventClearHeldMovementIfActive(objectEvent);
    ObjectEventSetHeldMovement(objectEvent, movementActionId);
}

void ObjectEventClearHeldMovementIfActive(struct ObjectEvent *objectEvent)
{
    if (objectEvent->heldMovementActive)
        ObjectEventClearHeldMovement(objectEvent);
}

void ObjectEventClearHeldMovement(struct ObjectEvent *objectEvent)
{
    objectEvent->movementActionId = MOVEMENT_ACTION_NONE;
    objectEvent->heldMovementActive = FALSE;
    objectEvent->heldMovementFinished = FALSE;
    gSprites[objectEvent->spriteId].data[1] = 0;
    gSprites[objectEvent->spriteId].data[2] = 0;
}

u8 ObjectEventCheckHeldMovementStatus(struct ObjectEvent *objectEvent)
{
    if (objectEvent->heldMovementActive)
        return objectEvent->heldMovementFinished;

    return 16;
}

u8 ObjectEventClearHeldMovementIfFinished(struct ObjectEvent *objectEvent)
{
    u8 heldMovementStatus = ObjectEventCheckHeldMovementStatus(objectEvent);
    if (heldMovementStatus != 0 && heldMovementStatus != 16)
        ObjectEventClearHeldMovementIfActive(objectEvent);

    return heldMovementStatus;
}

u8 ObjectEventGetHeldMovementActionId(struct ObjectEvent *objectEvent)
{
    if (objectEvent->heldMovementActive)
        return objectEvent->movementActionId;

    return MOVEMENT_ACTION_NONE;
}

void UpdateObjectEventCurrentMovement(struct ObjectEvent *objectEvent, struct Sprite *sprite, bool8 (*callback)(struct ObjectEvent *, struct Sprite *))
{
    DoGroundEffects_OnSpawn(objectEvent, sprite);
    TryEnableObjectEventAnim(objectEvent, sprite);

    if (ObjectEventIsHeldMovementActive(objectEvent))
        ObjectEventExecHeldMovementAction(objectEvent, sprite);
    else if (!objectEvent->frozen)
        while (callback(objectEvent, sprite));

    DoGroundEffects_OnBeginStep(objectEvent, sprite);
    DoGroundEffects_OnFinishStep(objectEvent, sprite);
    UpdateObjectEventSpriteAnimPause(objectEvent, sprite);
    UpdateObjectEventVisibility(objectEvent, sprite);
    ObjectEventUpdateSubpriority(objectEvent, sprite);
}

void QL_UpdateObjectEventCurrentMovement(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    DoGroundEffects_OnSpawn(objectEvent, sprite);
    TryEnableObjectEventAnim(objectEvent, sprite);

    if (ObjectEventIsHeldMovementActive(objectEvent) && !sprite->animBeginning)
        QuestLogObjectEventExecHeldMovementAction(objectEvent, sprite);
    
    if (MetatileBehavior_IsIce_2(objectEvent->currentMetatileBehavior) == TRUE
        || MetatileBehavior_IsTrickHouseSlipperyFloor(objectEvent->currentMetatileBehavior) == TRUE)
        objectEvent->disableAnim = TRUE;
    else
        objectEvent->disableAnim = FALSE;

    DoGroundEffects_OnBeginStep(objectEvent, sprite);
    DoGroundEffects_OnFinishStep(objectEvent, sprite);
    UpdateObjectEventSpriteAnimPause(objectEvent, sprite);
    UpdateObjectEventVisibility(objectEvent, sprite);
    ObjectEventUpdateSubpriority(objectEvent, sprite);
}

#define dirn_to_anim(name, table)                   \
u8 name(u32 idx)                                    \
{                                                   \
    u8 direction;                                   \
    u8 animIds[sizeof(table)];                      \
    direction = idx;                                \
    memcpy(animIds, (table), sizeof(table));        \
    if (direction > DIR_EAST) direction = DIR_NONE; \
    return animIds[direction];                      \
}

dirn_to_anim(GetFaceDirectionMovementAction, sFaceDirectionMovementActions);
dirn_to_anim(GetFaceDirectionFastMovementAction, sFaceDirectionFastMovementActions);

u8 GetWalkSlowestMovementAction(u32 idx)
{
    u8 direction = idx;
    if (direction > DIR_EAST)
        direction = DIR_NONE;

    return sWalkSlowestMovementActions[direction];
}

dirn_to_anim(GetWalkSlowerMovementAction, sWalkSlowerMovementActions);
dirn_to_anim(GetWalkSlowMovementAction, sWalkSlowMovementActions);
dirn_to_anim(GetWalkNormalMovementAction, sWalkNormalMovementActions);
dirn_to_anim(GetWalkFastMovementAction, sWalkFastMovementActions);
dirn_to_anim(GetGlideMovementAction, sGlideMovementActions);
dirn_to_anim(GetRideWaterCurrentMovementAction, sRideWaterCurrentMovementActions);
dirn_to_anim(GetWalkFasterMovementAction, sWalkFasterMovementActions);
dirn_to_anim(GetSlideMovementAction, sSlideMovementActions);
dirn_to_anim(GetPlayerRunMovementAction, sPlayerRunMovementActions);
dirn_to_anim(GetPlayerRunSlowMovementAction, sPlayerRunSlowMovementActions);
dirn_to_anim(GetSpinMovementAction, sSpinMovementActions);
dirn_to_anim(GetJump2MovementAction, sJump2MovementActions);
dirn_to_anim(GetJumpInPlaceMovementAction, sJumpInPlaceMovementActions);
dirn_to_anim(GetJumpInPlaceTurnAroundMovementAction, sJumpInPlaceTurnAroundMovementActions);
dirn_to_anim(GetJumpMovementAction, sJumpMovementActions);
dirn_to_anim(GetJumpSpecialMovementAction, sJumpSpecialMovementActions);
dirn_to_anim(GetJumpSpecialWithEffectMovementAction, sJumpSpecialWithEffectMovementActions);
dirn_to_anim(GetWalkInPlaceSlowMovementAction, sWalkInPlaceSlowMovementActions);
dirn_to_anim(GetWalkInPlaceNormalMovementAction, sWalkInPlaceNormalMovementActions);
dirn_to_anim(GetWalkInPlaceFastMovementAction, sWalkInPlaceFastMovementActions);
dirn_to_anim(GetWalkInPlaceFasterMovementAction, sWalkInPlaceFasterMovementActions);

bool8 ObjectEventFaceOppositeDirection(struct ObjectEvent *objectEvent, u8 direction)
{
    return ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(GetOppositeDirection(direction)));
}

dirn_to_anim(GetAcroWheelieFaceDirectionMovementAction, sAcroWheelieFaceDirectionMovementActions);
dirn_to_anim(GetAcroPopWheelieFaceDirectionMovementAction, sAcroPopWheelieFaceDirectionMovementActions);
dirn_to_anim(GetAcroEndWheelieFaceDirectionMovementAction, sAcroEndWheelieFaceDirectionMovementActions);
dirn_to_anim(GetAcroWheelieHopFaceDirectionMovementAction, sAcroWheelieHopFaceDirectionMovementActions);
dirn_to_anim(GetAcroWheelieHopMovementAction, sAcroWheelieHopMovementActions);
dirn_to_anim(GetAcroWheelieJumpMovementAction, sAcroWheelieJumpMovementActions);
dirn_to_anim(GetAcroWheelieInPlaceMovementAction, sAcroWheelieInPlaceMovementActions);
dirn_to_anim(GetAcroPopWheelieMoveMovementAction, sAcroPopWheelieMoveMovementActions);
dirn_to_anim(GetAcroWheelieMoveMovementAction, sAcroWheelieMoveMovementActions);

u8 GetOppositeDirection(u8 direction)
{
    u8 directions[sizeof gOppositeDirections];

    memcpy(directions, gOppositeDirections, sizeof gOppositeDirections);
    if (direction < 1 || direction > (sizeof gOppositeDirections))
    {
        return direction;
    }
    return directions[direction - 1];
}

static u32 GetPlayerDirectionForCopy(u8 initDir, u8 moveDir)
{
    return sPlayerDirectionsForCopy[initDir - 1][moveDir - 1];
}

static u32 GetCopyDirection(u8 copyInitDir, u32 playerInitDir, u32 playerMoveDir)
{
    u32 dir;
    u8 _playerInitDir = playerInitDir;
    u8 _playerMoveDir = playerMoveDir;
    if (_playerInitDir == DIR_NONE || _playerMoveDir == DIR_NONE
      || _playerInitDir > DIR_EAST || _playerMoveDir > DIR_EAST)
        return DIR_NONE;

    dir = GetPlayerDirectionForCopy(_playerInitDir, playerMoveDir);
    return sPlayerDirectionToCopyDirection[copyInitDir - 1][dir - 1];
}

static void ObjectEventExecHeldMovementAction(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (sMovementActionFuncs[objectEvent->movementActionId][sprite->data[2]](objectEvent, sprite))
    {
        objectEvent->heldMovementFinished = TRUE;
    }
}

static void QuestLogObjectEventExecHeldMovementAction(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (sMovementActionFuncs[objectEvent->movementActionId][sprite->data[2]](objectEvent, sprite))
    {
        objectEvent->heldMovementFinished = TRUE;
        if (objectEvent->graphicsId == OBJ_EVENT_GFX_PUSHABLE_BOULDER)
            HandleBoulderFallThroughHole(objectEvent);
    }
}

static bool8 ObjectEventExecSingleMovementAction(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (sMovementActionFuncs[objectEvent->movementActionId][sprite->data[2]](objectEvent, sprite))
    {
        objectEvent->movementActionId = MOVEMENT_ACTION_NONE;
        sprite->data[2] = 0;
        return TRUE;
    }
    return FALSE;
}

static void ObjectEventSetSingleMovement(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 movementActionId)
{
    objectEvent->movementActionId = movementActionId;
    sprite->data[2] = 0;
    
    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_RECORDING)
        QuestLogRecordNPCStep(objectEvent->localId, objectEvent->mapNum, objectEvent->mapGroup, movementActionId);
}

static void FaceDirection(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    SetObjectEventDirection(objectEvent, direction);
    ShiftStillObjectEventCoords(objectEvent);
    SetStepAnim(objectEvent, sprite, GetMoveDirectionAnimNum(objectEvent->facingDirection));
    sprite->animPaused = TRUE;
    sprite->data[2] = 1;
}

static bool8 MovementAction_FaceDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    FaceDirection(objectEvent, sprite, DIR_SOUTH);
    return TRUE;
}

static bool8 MovementAction_FaceUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    FaceDirection(objectEvent, sprite, DIR_NORTH);
    return TRUE;
}

static bool8 MovementAction_FaceLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    FaceDirection(objectEvent, sprite, DIR_WEST);
    return TRUE;
}

static bool8 MovementAction_FaceRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    FaceDirection(objectEvent, sprite, DIR_EAST);
    return TRUE;
}

void InitNpcForMovement(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 speed)
{
    s16 x;
    s16 y;

    x = objectEvent->currentCoords.x;
    y = objectEvent->currentCoords.y;
    SetObjectEventDirection(objectEvent, direction);
    MoveCoords(direction, &x, &y);
    ShiftObjectEventCoords(objectEvent, x, y);
    SetSpriteDataForNormalStep(sprite, direction, speed);
    sprite->animPaused = FALSE;
    objectEvent->triggerGroundEffectsOnMove = TRUE;
    sprite->data[2] = 1;
}

void InitMovementNormal(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 speed)
{
    u8 (*functions[NELEMS(sDirectionAnimFuncsBySpeed)])(u8);
    memcpy(functions, sDirectionAnimFuncsBySpeed, sizeof sDirectionAnimFuncsBySpeed);
    InitNpcForMovement(objectEvent, sprite, direction, speed);
    SetStepAnimHandleAlternation(objectEvent, sprite, functions[speed](objectEvent->facingDirection));
}

void StartRunningAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    InitNpcForMovement(objectEvent, sprite, direction, MOVE_SPEED_FAST_1);
    SetStepAnimHandleAlternation(objectEvent, sprite, GetRunningDirectionAnimNum(objectEvent->facingDirection));
}

bool8 UpdateMovementNormal(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (NpcTakeStep(sprite))
    {
        ShiftStillObjectEventCoords(objectEvent);
        objectEvent->triggerGroundEffectsOnStop = TRUE;
        sprite->animPaused = TRUE;
        return TRUE;
    }
    return FALSE;
}

void InitNpcForWalkSlower(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    s16 x;
    s16 y;

    x = objectEvent->currentCoords.x;
    y = objectEvent->currentCoords.y;
    SetObjectEventDirection(objectEvent, direction);
    MoveCoords(direction, &x, &y);
    ShiftObjectEventCoords(objectEvent, x, y);
    SetWalkSlowerSpriteData(sprite, direction);
    sprite->animPaused = FALSE;
    objectEvent->triggerGroundEffectsOnMove = TRUE;
    sprite->data[2] = 1;
}

void InitWalkSlower(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    InitNpcForWalkSlower(objectEvent, sprite, direction);
    SetStepAnimHandleAlternation(objectEvent, sprite, GetMoveDirectionAnimNum(objectEvent->facingDirection));
}

bool8 UpdateWalkSlower(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlowerAnim(sprite))
    {
        ShiftStillObjectEventCoords(objectEvent);
        objectEvent->triggerGroundEffectsOnStop = TRUE;
        sprite->animPaused = TRUE;
        return TRUE;
    }
    return FALSE;
}

void InitNpcForWalkSlowest(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    s16 x;
    s16 y;

    x = objectEvent->currentCoords.x;
    y = objectEvent->currentCoords.y;
    SetObjectEventDirection(objectEvent, direction);
    MoveCoords(direction, &x, &y);
    ShiftObjectEventCoords(objectEvent, x, y);
    SetWalkSlowestSpriteData(sprite, direction);
    sprite->animPaused = FALSE;
    objectEvent->triggerGroundEffectsOnMove = TRUE;
    sprite->data[2] = 1;
}

void InitWalkSlowest(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    InitNpcForWalkSlowest(objectEvent, sprite, direction);
    SetStepAnimHandleAlternation(objectEvent, sprite, GetMoveDirectionAnimNum(objectEvent->facingDirection));
}

bool8 UpdateWalkSlowest(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlowestAnim(sprite))
    {
        ShiftStillObjectEventCoords(objectEvent);
        objectEvent->triggerGroundEffectsOnStop = TRUE;
        sprite->animPaused = TRUE;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowestDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlowest(objectEvent, sprite, DIR_SOUTH);
    return MovementAction_WalkSlowestDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowestDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlowest(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowestUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlowest(objectEvent, sprite, DIR_NORTH);
    return MovementAction_WalkSlowestUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowestUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlowest(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowestLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlowest(objectEvent, sprite, DIR_WEST);
    return MovementAction_WalkSlowestLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowestLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlowest(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowestRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlowest(objectEvent, sprite, DIR_EAST);
    return MovementAction_WalkSlowestRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowestRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlowest(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowerDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlower(objectEvent, sprite, DIR_SOUTH);
    return MovementAction_WalkSlowerDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowerDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlower(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowerUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlower(objectEvent, sprite, DIR_NORTH);
    return MovementAction_WalkSlowerUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowerUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlower(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowerLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlower(objectEvent, sprite, DIR_WEST);
    return MovementAction_WalkSlowerLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowerLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlower(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowerRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlower(objectEvent, sprite, DIR_EAST);
    return MovementAction_WalkSlowerRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowerRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlower(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

// InitNpcForWalkSlow, InitNpcForWalkSlower, InitNpcForWalkSlowest, and
// InitNpcForRunSlow are functionally equivalent
void InitNpcForWalkSlow(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    s16 x;
    s16 y;

    x = objectEvent->currentCoords.x;
    y = objectEvent->currentCoords.y;
    SetObjectEventDirection(objectEvent, direction);
    MoveCoords(direction, &x, &y);
    ShiftObjectEventCoords(objectEvent, x, y);
    SetWalkSlowSpriteData(sprite, direction);
    sprite->animPaused = FALSE;
    objectEvent->triggerGroundEffectsOnMove = TRUE;
    sprite->data[2] = 1;
}

// InitWalkSlow, InitWalkSlower, InitWalkSlowest, and InitRunSlow are
// functionally equivalent
void InitWalkSlow(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    InitNpcForWalkSlow(objectEvent, sprite, direction);
    SetStepAnimHandleAlternation(objectEvent, sprite, GetMoveDirectionAnimNum(objectEvent->facingDirection));
}

bool8 UpdateWalkSlow(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlowAnim(sprite))
    {
        ShiftStillObjectEventCoords(objectEvent);
        objectEvent->triggerGroundEffectsOnStop = TRUE;
        sprite->animPaused = TRUE;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlow(objectEvent, sprite, DIR_NORTH);
    return MovementAction_WalkSlowUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlow(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlow(objectEvent, sprite, DIR_SOUTH);
    return MovementAction_WalkSlowDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlow(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlow(objectEvent, sprite, DIR_WEST);
    return MovementAction_WalkSlowLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlow(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkSlowRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlow(objectEvent, sprite, DIR_EAST);
    return MovementAction_WalkSlowRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkSlowRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlow(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkNormalDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_SOUTH, MOVE_SPEED_NORMAL);
    return MovementAction_WalkNormalDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkNormalDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkNormalUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_NORTH, MOVE_SPEED_NORMAL);
    return MovementAction_WalkNormalUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkNormalUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkNormalLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_WEST, MOVE_SPEED_NORMAL);
    return MovementAction_WalkNormalLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkNormalLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkNormalRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_EAST, MOVE_SPEED_NORMAL);
    return MovementAction_WalkNormalRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkNormalRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

#define JUMP_HALFWAY  1
#define JUMP_FINISHED ((u8)-1)

enum {
    JUMP_TYPE_HIGH,
    JUMP_TYPE_LOW,
    JUMP_TYPE_NORMAL,
};

void InitJump(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 distance, u8 type)
{
    s16 displacements[NELEMS(sJumpInitDisplacements)];
    s16 x;
    s16 y;

    memcpy(displacements, sJumpInitDisplacements, sizeof sJumpInitDisplacements);
    x = 0;
    y = 0;
    SetObjectEventDirection(objectEvent, direction);
    MoveCoordsInDirection(direction, &x, &y, displacements[distance], displacements[distance]);
    ShiftObjectEventCoords(objectEvent, objectEvent->currentCoords.x + x, objectEvent->currentCoords.y + y);
    SetJumpSpriteData(sprite, direction, distance, type);
    sprite->data[2] = 1;
    sprite->animPaused = 0;
    objectEvent->triggerGroundEffectsOnMove = 1;
    objectEvent->disableCoveringGroundEffects = 1;
}

void InitJumpRegular(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 distance, u8 type)
{
    InitJump(objectEvent, sprite, direction, distance, type);
    SetStepAnimHandleAlternation(objectEvent, sprite, GetMoveDirectionAnimNum(objectEvent->facingDirection));
    DoShadowFieldEffect(objectEvent);
}

u8 UpdateJumpAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 callback(struct Sprite *))
{
    s16 displacements[NELEMS(sJumpDisplacements)];
    s16 x;
    s16 y;
    u8 result;

    memcpy(displacements, sJumpDisplacements, sizeof sJumpDisplacements);
    result = callback(sprite);
    if (result == JUMP_HALFWAY && displacements[sprite->data[4]] != 0)
    {
        x = 0;
        y = 0;
        MoveCoordsInDirection(objectEvent->movementDirection, &x, &y, displacements[sprite->data[4]], displacements[sprite->data[4]]);
        ShiftObjectEventCoords(objectEvent, objectEvent->currentCoords.x + x, objectEvent->currentCoords.y + y);
        objectEvent->triggerGroundEffectsOnMove = TRUE;
        objectEvent->disableCoveringGroundEffects = TRUE;
    }
    else if (result == JUMP_FINISHED)
    {
        ShiftStillObjectEventCoords(objectEvent);
        objectEvent->triggerGroundEffectsOnStop = TRUE;
        objectEvent->landingJump = TRUE;
        sprite->animPaused = TRUE;
    }
    return result;
}

u8 DoJumpAnimStep(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return UpdateJumpAnim(objectEvent, sprite, DoJumpSpriteMovement);
}

u8 DoJumpSpecialAnimStep(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return UpdateJumpAnim(objectEvent, sprite, DoJumpSpecialSpriteMovement);
}

bool8 DoJumpAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnimStep(objectEvent, sprite) == JUMP_FINISHED)
        return TRUE;

    return FALSE;
}

bool8 DoJumpSpecialAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpSpecialAnimStep(objectEvent, sprite) == JUMP_FINISHED)
        return TRUE;

    return FALSE;
}

bool8 DoJumpInPlaceAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    switch (DoJumpAnimStep(objectEvent, sprite))
    {
    case JUMP_FINISHED:
        return TRUE;
    case JUMP_HALFWAY:
        SetObjectEventDirection(objectEvent, GetOppositeDirection(objectEvent->movementDirection));
        SetStepAnim(objectEvent, sprite, GetMoveDirectionAnimNum(objectEvent->facingDirection));
    default:
        return FALSE;
    }
}

static bool8 MovementAction_Jump2Down_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_SOUTH, JUMP_DISTANCE_FAR, JUMP_TYPE_HIGH);
    return MovementAction_Jump2Down_Step1(objectEvent, sprite);
}

static bool8 MovementAction_Jump2Down_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_Jump2Up_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_NORTH, JUMP_DISTANCE_FAR, JUMP_TYPE_HIGH);
    return MovementAction_Jump2Up_Step1(objectEvent, sprite);
}

static bool8 MovementAction_Jump2Up_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_Jump2Left_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_WEST, JUMP_DISTANCE_FAR, JUMP_TYPE_HIGH);
    return MovementAction_Jump2Left_Step1(objectEvent, sprite);
}

static bool8 MovementAction_Jump2Left_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_Jump2Right_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_EAST, JUMP_DISTANCE_FAR, JUMP_TYPE_HIGH);
    return MovementAction_Jump2Right_Step1(objectEvent, sprite);
}

static bool8 MovementAction_Jump2Right_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void InitMovementDelay(struct Sprite *sprite, u16 duration)
{
    sprite->data[2] = 1;
    sprite->data[3] = duration;
}

static bool8 MovementAction_Delay_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (--sprite->data[3] == 0)
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_Delay1_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementDelay(sprite, 1);
    return MovementAction_Delay_Step1(objectEvent, sprite);
}

static bool8 MovementAction_Delay2_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementDelay(sprite, 2);
    return MovementAction_Delay_Step1(objectEvent, sprite);
}

static bool8 MovementAction_Delay4_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementDelay(sprite, 4);
    return MovementAction_Delay_Step1(objectEvent, sprite);
}

static bool8 MovementAction_Delay8_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementDelay(sprite, 8);
    return MovementAction_Delay_Step1(objectEvent, sprite);
}

static bool8 MovementAction_Delay16_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementDelay(sprite, 16);
    return MovementAction_Delay_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkFastDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_SOUTH, MOVE_SPEED_FAST_1);
    return MovementAction_WalkFastDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkFastDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkFastUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_NORTH, MOVE_SPEED_FAST_1);
    return MovementAction_WalkFastUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkFastUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkFastLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_WEST, MOVE_SPEED_FAST_1);
    return MovementAction_WalkFastLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkFastLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkFastRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_EAST, MOVE_SPEED_FAST_1);
    return MovementAction_WalkFastRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkFastRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 UpdateMovementGlide(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (NpcTakeStep(sprite))
    {
        ShiftStillObjectEventCoords(objectEvent);
        objectEvent->triggerGroundEffectsOnStop = TRUE;
        return TRUE;
    }
    return FALSE;
}

u8 MovementAction_GlideDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if(objectEvent->facingDirection != DIR_SOUTH)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(DIR_SOUTH));
    
    InitNpcForMovement(objectEvent, sprite, DIR_SOUTH, MOVE_SPEED_FAST_1);
    return MovementAction_GlideDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_GlideDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    AnimateSprite(sprite);
    if (UpdateMovementGlide(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

u8 MovementAction_GlideUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if(objectEvent->facingDirection != DIR_NORTH)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(DIR_NORTH));
    
    InitNpcForMovement(objectEvent, sprite, DIR_NORTH, MOVE_SPEED_FAST_1);
    return MovementAction_GlideUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_GlideUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    AnimateSprite(sprite);
    if (UpdateMovementGlide(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

u8 MovementAction_GlideLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if(objectEvent->facingDirection != DIR_WEST)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(DIR_WEST));
    
    InitNpcForMovement(objectEvent, sprite, DIR_WEST, MOVE_SPEED_FAST_1);
    return MovementAction_GlideLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_GlideLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    AnimateSprite(sprite);
    if (UpdateMovementGlide(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

u8 MovementAction_GlideRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if(objectEvent->facingDirection != DIR_EAST)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(DIR_EAST));
    
    InitNpcForMovement(objectEvent, sprite, DIR_EAST, MOVE_SPEED_FAST_1);
    return MovementAction_GlideRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_GlideRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    AnimateSprite(sprite);
    if (UpdateMovementGlide(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void FaceDirectionFast(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    SetObjectEventDirection(objectEvent, direction);
    ShiftStillObjectEventCoords(objectEvent);
    sprite->animPaused = FALSE;
    sprite->data[2] = 1;
}

u8 MovementAction_FaceDownFast_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if(objectEvent->facingDirection != DIR_SOUTH)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(DIR_SOUTH));
    
    AnimateSprite(sprite);
    FaceDirectionFast(objectEvent, sprite, DIR_SOUTH);
    return TRUE;
}

u8 MovementAction_FaceUpFast_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if(objectEvent->facingDirection != DIR_NORTH)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(DIR_NORTH));
    
    AnimateSprite(sprite);
    FaceDirectionFast(objectEvent, sprite, DIR_NORTH);
    return TRUE;
}

u8 MovementAction_FaceLeftFast_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if(objectEvent->facingDirection != DIR_WEST)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(DIR_WEST));
    
    AnimateSprite(sprite);
    FaceDirectionFast(objectEvent, sprite, DIR_WEST);
    return TRUE;
}

u8 MovementAction_FaceRightFast_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if(objectEvent->facingDirection != DIR_EAST)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(DIR_EAST));
    
    AnimateSprite(sprite);
    FaceDirectionFast(objectEvent, sprite, DIR_EAST);
    return TRUE;
}

void InitMoveInPlace(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 animNum, u16 duration)
{
    SetObjectEventDirection(objectEvent, direction);
    SetStepAnimHandleAlternation(objectEvent, sprite, animNum);
    sprite->animPaused = FALSE;
    sprite->data[2] = 1;
    sprite->data[3] = duration;
}

static bool8 MovementAction_WalkInPlace_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (--sprite->data[3] == 0)
    {
        sprite->data[2] = 2;
        sprite->animPaused = TRUE;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkInPlaceSlow_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (sprite->data[3] & 1)
        sprite->animDelayCounter++;

    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceSlowDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_SOUTH, GetMoveDirectionAnimNum(DIR_SOUTH), 32);
    return MovementAction_WalkInPlaceSlow_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceSlowUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_NORTH, GetMoveDirectionAnimNum(DIR_NORTH), 32);
    return MovementAction_WalkInPlaceSlow_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceSlowLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_WEST, GetMoveDirectionAnimNum(DIR_WEST), 32);
    return MovementAction_WalkInPlaceSlow_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceSlowRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_EAST, GetMoveDirectionAnimNum(DIR_EAST), 32);
    return MovementAction_WalkInPlaceSlow_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceNormalDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_SOUTH, GetMoveDirectionAnimNum(DIR_SOUTH), 16);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceNormalUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_NORTH, GetMoveDirectionAnimNum(DIR_NORTH), 16);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceNormalLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_WEST, GetMoveDirectionAnimNum(DIR_WEST), 16);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceNormalRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_EAST, GetMoveDirectionAnimNum(DIR_EAST), 16);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceFastDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_SOUTH, GetMoveDirectionFastAnimNum(DIR_SOUTH), 8);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceFastUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_NORTH, GetMoveDirectionFastAnimNum(DIR_NORTH), 8);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceFastLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_WEST, GetMoveDirectionFastAnimNum(DIR_WEST), 8);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceFastRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_EAST, GetMoveDirectionFastAnimNum(DIR_EAST), 8);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceFasterDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_SOUTH, GetMoveDirectionFasterAnimNum(DIR_SOUTH), 4);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceFasterUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_NORTH, GetMoveDirectionFasterAnimNum(DIR_NORTH), 4);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceFasterLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_WEST, GetMoveDirectionFasterAnimNum(DIR_WEST), 4);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkInPlaceFasterRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_EAST, GetMoveDirectionFasterAnimNum(DIR_EAST), 4);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RideWaterCurrentDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_SOUTH, MOVE_SPEED_FAST_2);
    return MovementAction_RideWaterCurrentDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RideWaterCurrentDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_RideWaterCurrentUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_NORTH, MOVE_SPEED_FAST_2);
    return MovementAction_RideWaterCurrentUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RideWaterCurrentUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_RideWaterCurrentLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_WEST, MOVE_SPEED_FAST_2);
    return MovementAction_RideWaterCurrentLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RideWaterCurrentLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_RideWaterCurrentRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_EAST, MOVE_SPEED_FAST_2);
    return MovementAction_RideWaterCurrentRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RideWaterCurrentRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkFasterDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_SOUTH, MOVE_SPEED_FASTER);
    return MovementAction_WalkFasterDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkFasterDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkFasterUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_NORTH, MOVE_SPEED_FASTER);
    return MovementAction_WalkFasterUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkFasterUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkFasterLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_WEST, MOVE_SPEED_FASTER);
    return MovementAction_WalkFasterLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkFasterLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkFasterRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_EAST, MOVE_SPEED_FASTER);
    return MovementAction_WalkFasterRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkFasterRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_SlideDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_SOUTH, MOVE_SPEED_FASTEST);
    return MovementAction_SlideDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_SlideDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_SlideUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_NORTH, MOVE_SPEED_FASTEST);
    return MovementAction_SlideUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_SlideUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_SlideLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_WEST, MOVE_SPEED_FASTEST);
    return MovementAction_SlideLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_SlideLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_SlideRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMovementNormal(objectEvent, sprite, DIR_EAST, MOVE_SPEED_FASTEST);
    return MovementAction_SlideRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_SlideRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_PlayerRunDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartRunningAnim(objectEvent, sprite, DIR_SOUTH);
    return MovementAction_PlayerRunDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_PlayerRunDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_PlayerRunUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartRunningAnim(objectEvent, sprite, DIR_NORTH);
    return MovementAction_PlayerRunUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_PlayerRunUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_PlayerRunLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartRunningAnim(objectEvent, sprite, DIR_WEST);
    return MovementAction_PlayerRunLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_PlayerRunLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_PlayerRunRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartRunningAnim(objectEvent, sprite, DIR_EAST);
    return MovementAction_PlayerRunRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_PlayerRunRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void InitNpcForRunSlow(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    s16 x;
    s16 y;

    x = objectEvent->currentCoords.x;
    y = objectEvent->currentCoords.y;
    SetObjectEventDirection(objectEvent, direction);
    MoveCoords(direction, &x, &y);
    ShiftObjectEventCoords(objectEvent, x, y);
    SetRunSlowSpriteData(sprite, direction);
    sprite->animPaused = FALSE;
    objectEvent->triggerGroundEffectsOnMove = TRUE;
    sprite->data[2] = 1;
}

void InitRunSlow(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    InitNpcForRunSlow(objectEvent, sprite, direction);
    SetStepAnimHandleAlternation(objectEvent, sprite, GetRunningDirectionAnimNum(objectEvent->facingDirection));
}

bool8 UpdateRunSlow(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateRunSlowAnim(sprite))
    {
        ShiftStillObjectEventCoords(objectEvent);
        objectEvent->triggerGroundEffectsOnStop = TRUE;
        sprite->animPaused = TRUE;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_RunDownSlow_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitRunSlow(objectEvent, sprite, DIR_SOUTH);
    return MovementAction_RunDownSlow_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RunDownSlow_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateRunSlow(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_RunUpSlow_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitRunSlow(objectEvent, sprite, DIR_NORTH);
    return MovementAction_RunUpSlow_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RunUpSlow_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateRunSlow(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_RunLeftSlow_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitRunSlow(objectEvent, sprite, DIR_WEST);
    return MovementAction_RunLeftSlow_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RunLeftSlow_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateRunSlow(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_RunRightSlow_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitRunSlow(objectEvent, sprite, DIR_SOUTH);
    return MovementAction_RunRightSlow_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RunRightSlow_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateRunSlow(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void StartSpriteAnimInDirection(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 animNum)
{
    SetAndStartSpriteAnim(sprite, animNum, 0);
    SetObjectEventDirection(objectEvent, direction);
    sprite->data[2] = 1;
}

static bool8 MovementAction_StartAnimInDirection_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, objectEvent->movementDirection, sprite->animNum);
    return FALSE;
}

static bool8 MovementAction_WaitSpriteAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (SpriteAnimEnded(sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void InitJumpSpecial(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    InitJump(objectEvent, sprite, direction, JUMP_DISTANCE_NORMAL, JUMP_TYPE_HIGH);
    StartSpriteAnim(sprite, GetJumpSpecialDirectionAnimNum(direction));
}

static bool8 MovementAction_JumpSpecialDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpSpecial(objectEvent, sprite, DIR_SOUTH);
    return MovementAction_JumpSpecialDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpSpecialDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpSpecialAnim(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        objectEvent->landingJump = FALSE;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpSpecialUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpSpecial(objectEvent, sprite, DIR_NORTH);
    return MovementAction_JumpSpecialUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpSpecialUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpSpecialAnim(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        objectEvent->landingJump = FALSE;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpSpecialLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpSpecial(objectEvent, sprite, DIR_WEST);
    return MovementAction_JumpSpecialLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpSpecialLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpSpecialAnim(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        objectEvent->landingJump = FALSE;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpSpecialRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpSpecial(objectEvent, sprite, DIR_EAST);
    return MovementAction_JumpSpecialRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpSpecialRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpSpecialAnim(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        objectEvent->landingJump = FALSE;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpSpecialWithEffectDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpSpecial(objectEvent, sprite, DIR_SOUTH);
    return MovementAction_JumpSpecialWithEffectDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpSpecialWithEffectDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpSpecialAnim(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpSpecialWithEffectUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpSpecial(objectEvent, sprite, DIR_NORTH);
    return MovementAction_JumpSpecialWithEffectUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpSpecialWithEffectUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpSpecialAnim(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpSpecialWithEffectLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpSpecial(objectEvent, sprite, DIR_WEST);
    return MovementAction_JumpSpecialWithEffectLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpSpecialWithEffectLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpSpecialAnim(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpSpecialWithEffectRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpSpecial(objectEvent, sprite, DIR_EAST);
    return MovementAction_JumpSpecialWithEffectRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpSpecialWithEffectRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpSpecialAnim(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_FacePlayer_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 playerObjectId;

    if (!TryGetObjectEventIdByLocalIdAndMap(OBJ_EVENT_ID_PLAYER, 0, 0, &playerObjectId))
    {
        FaceDirection(objectEvent, sprite, GetDirectionToFace(objectEvent->currentCoords.x, objectEvent->currentCoords.y, gObjectEvents[playerObjectId].currentCoords.x, gObjectEvents[playerObjectId].currentCoords.y));
    }
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_FaceAwayPlayer_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 playerObjectId;

    if (!TryGetObjectEventIdByLocalIdAndMap(OBJ_EVENT_ID_PLAYER, 0, 0, &playerObjectId))
    {
        FaceDirection(objectEvent, sprite, GetOppositeDirection(GetDirectionToFace(objectEvent->currentCoords.x, objectEvent->currentCoords.y, gObjectEvents[playerObjectId].currentCoords.x, gObjectEvents[playerObjectId].currentCoords.y)));
    }
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_LockFacingDirection_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->facingDirectionLocked = TRUE;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_UnlockFacingDirection_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->facingDirectionLocked = FALSE;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_JumpDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_SOUTH, JUMP_DISTANCE_NORMAL, JUMP_TYPE_NORMAL);
    return MovementAction_JumpDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_NORTH, JUMP_DISTANCE_NORMAL, JUMP_TYPE_NORMAL);
    return MovementAction_JumpUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_WEST, JUMP_DISTANCE_NORMAL, JUMP_TYPE_NORMAL);
    return MovementAction_JumpLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_EAST, JUMP_DISTANCE_NORMAL, JUMP_TYPE_NORMAL);
    return MovementAction_JumpRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpInPlaceDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_SOUTH, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_HIGH);
    return MovementAction_JumpInPlaceDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpInPlaceDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpInPlaceUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_NORTH, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_HIGH);
    return MovementAction_JumpInPlaceUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpInPlaceUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpInPlaceLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_WEST, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_HIGH);
    return MovementAction_JumpInPlaceLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpInPlaceLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpInPlaceRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_EAST, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_HIGH);
    return MovementAction_JumpInPlaceRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpInPlaceRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpInPlaceDownUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_SOUTH, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_NORMAL);
    return MovementAction_JumpInPlaceDownUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpInPlaceDownUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpInPlaceAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpInPlaceUpDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_NORTH, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_NORMAL);
    return MovementAction_JumpInPlaceUpDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpInPlaceUpDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpInPlaceAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpInPlaceLeftRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_WEST, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_NORMAL);
    return MovementAction_JumpInPlaceLeftRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpInPlaceLeftRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpInPlaceAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_JumpInPlaceRightLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitJumpRegular(objectEvent, sprite, DIR_EAST, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_NORMAL);
    return MovementAction_JumpInPlaceRightLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_JumpInPlaceRightLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpInPlaceAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_FaceOriginalDirection_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    FaceDirection(objectEvent, sprite, gInitialMovementTypeFacingDirections[objectEvent->movementType]);
    return TRUE;
}

static bool8 MovementAction_NurseJoyBowDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_SOUTH, ANIM_NURSE_BOW);
    return FALSE;
}

static bool8 MovementAction_EnableJumpLandingGroundEffect_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->disableJumpLandingGroundEffect = FALSE;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_DisableJumpLandingGroundEffect_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->disableJumpLandingGroundEffect = TRUE;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_DisableAnimation_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->inanimate = TRUE;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_RestoreAnimation_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->inanimate = GetObjectEventGraphicsInfo(objectEvent->graphicsId)->inanimate;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_SetInvisible_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->invisible = TRUE;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_SetVisible_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->invisible = FALSE;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_EmoteExclamationMark_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventGetLocalIdAndMap(objectEvent, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON);
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_EmoteQuestionMark_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventGetLocalIdAndMap(objectEvent, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_QUESTION_MARK_ICON);
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_EmoteX_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventGetLocalIdAndMap(objectEvent, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_X_ICON);
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_EmoteDoubleExclamationMark_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventGetLocalIdAndMap(objectEvent, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_DOUBLE_EXCL_MARK_ICON);
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_EmoteSmile_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    ObjectEventGetLocalIdAndMap(objectEvent, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_SMILEY_FACE_ICON);
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_RevealTrainer_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (objectEvent->movementType == MOVEMENT_TYPE_BURIED)
    {
        MovementAction_RevealTrainer_RunTrainerSeeFuncList(objectEvent);
        return FALSE;
    }
    if (objectEvent->movementType != MOVEMENT_TYPE_TREE_DISGUISE && objectEvent->movementType != MOVEMENT_TYPE_MOUNTAIN_DISGUISE)
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    StartRevealDisguise(objectEvent);
    sprite->data[2] = 1;
    return MovementAction_RevealTrainer_Step1(objectEvent, sprite);
}

static bool8 MovementAction_RevealTrainer_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateRevealDisguise(objectEvent))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_RockSmashBreak_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    SetAndStartSpriteAnim(sprite, ANIM_REMOVE_OBSTACLE, 0);
    sprite->data[2] = 1;
    return FALSE;
}

static bool8 MovementAction_RockSmashBreak_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (SpriteAnimEnded(sprite))
    {
        SetMovementDelay(sprite, 32);
        sprite->data[2] = 2;
    }
    return FALSE;
}

static bool8 MovementAction_RockSmashBreak_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->invisible ^= TRUE;
    if (WaitForMovementDelay(sprite))
    {
        objectEvent->invisible = TRUE;
        sprite->data[2] = 3;
    }
    return FALSE;
}

static bool8 MovementAction_CutTree_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    SetAndStartSpriteAnim(sprite, ANIM_REMOVE_OBSTACLE, 0);
    sprite->data[2] = 1;
    return FALSE;
}

static bool8 MovementAction_CutTree_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (SpriteAnimEnded(sprite))
    {
        SetMovementDelay(sprite, 32);
        sprite->data[2] = 2;
    }
    return FALSE;
}

static bool8 MovementAction_CutTree_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->invisible ^= TRUE;
    if (WaitForMovementDelay(sprite))
    {
        objectEvent->invisible = TRUE;
        sprite->data[2] = 3;
    }
    return FALSE;
}

static bool8 MovementAction_SetFixedPriority_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->fixedPriority = TRUE;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_ClearFixedPriority_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    objectEvent->fixedPriority = FALSE;
    sprite->data[2] = 1;
    return TRUE;
}

static bool8 MovementAction_InitAffineAnim_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
    InitSpriteAffineAnim(sprite);
    sprite->affineAnimPaused = TRUE;
    sprite->subspriteMode = SUBSPRITES_OFF;
    return TRUE;
}

static bool8 MovementAction_ClearAffineAnim_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    FreeOamMatrix(sprite->oam.matrixNum);
    sprite->oam.affineMode = ST_OAM_AFFINE_OFF;
    CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
    return TRUE;
}

static bool8 MovementAction_WalkDownStartAffine_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlower(objectEvent, sprite, DIR_SOUTH);
    sprite->affineAnimPaused = FALSE;
    StartSpriteAffineAnimIfDifferent(sprite, 0);
    return MovementAction_WalkDownStartAffine_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkDownStartAffine_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlower(objectEvent, sprite))
    {
        sprite->affineAnimPaused = TRUE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_WalkDownAffine_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitWalkSlower(objectEvent, sprite, DIR_SOUTH);
    sprite->affineAnimPaused = FALSE;
    ChangeSpriteAffineAnimIfDifferent(sprite, 1);
    return MovementAction_WalkDownAffine_Step1(objectEvent, sprite);
}

static bool8 MovementAction_WalkDownAffine_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateWalkSlower(objectEvent, sprite))
    {
        sprite->affineAnimPaused = TRUE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void AcroWheelieFaceDirection(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction)
{
    SetObjectEventDirection(objectEvent, direction);
    ShiftStillObjectEventCoords(objectEvent);
    SetStepAnim(objectEvent, sprite, GetAcroWheeliePedalDirectionAnimNum(direction));
    sprite->animPaused = TRUE;
    sprite->data[2] = 1;
}

static bool8 MovementAction_AcroWheelieFaceDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    AcroWheelieFaceDirection(objectEvent, sprite, DIR_SOUTH);
    return TRUE;
}

static bool8 MovementAction_AcroWheelieFaceUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    AcroWheelieFaceDirection(objectEvent, sprite, DIR_NORTH);
    return TRUE;
}

static bool8 MovementAction_AcroWheelieFaceLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    AcroWheelieFaceDirection(objectEvent, sprite, DIR_WEST);
    return TRUE;
}

static bool8 MovementAction_AcroWheelieFaceRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    AcroWheelieFaceDirection(objectEvent, sprite, DIR_EAST);
    return TRUE;
}

static bool8 MovementAction_AcroPopWheelieDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_SOUTH, GetAcroWheelieDirectionAnimNum(DIR_SOUTH));
    return FALSE;
}

static bool8 MovementAction_AcroPopWheelieUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_NORTH, GetAcroWheelieDirectionAnimNum(DIR_NORTH));
    return FALSE;
}

static bool8 MovementAction_AcroPopWheelieLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_WEST, GetAcroWheelieDirectionAnimNum(DIR_WEST));
    return FALSE;
}

static bool8 MovementAction_AcroPopWheelieRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_EAST, GetAcroWheelieDirectionAnimNum(DIR_EAST));
    return FALSE;
}

static bool8 MovementAction_AcroEndWheelieFaceDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_SOUTH, GetAcroEndWheelieDirectionAnimNum(DIR_SOUTH));
    return FALSE;
}

static bool8 MovementAction_AcroEndWheelieFaceUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_NORTH, GetAcroEndWheelieDirectionAnimNum(DIR_NORTH));
    return FALSE;
}

static bool8 MovementAction_AcroEndWheelieFaceLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_WEST, GetAcroEndWheelieDirectionAnimNum(DIR_WEST));
    return FALSE;
}

static bool8 MovementAction_AcroEndWheelieFaceRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_EAST, GetAcroEndWheelieDirectionAnimNum(DIR_EAST));
    return FALSE;
}

static bool8 MovementAction_UnusedAcroActionDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_SOUTH, GetAcroUnusedActionDirectionAnimNum(DIR_SOUTH));
    return FALSE;
}

static bool8 MovementAction_UnusedAcroActionUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_NORTH, GetAcroUnusedActionDirectionAnimNum(DIR_NORTH));
    return FALSE;
}

static bool8 MovementAction_UnusedAcroActionLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_WEST, GetAcroUnusedActionDirectionAnimNum(DIR_WEST));
    return FALSE;
}

static bool8 MovementAction_UnusedAcroActionRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnimInDirection(objectEvent, sprite, DIR_EAST, GetAcroUnusedActionDirectionAnimNum(DIR_EAST));
    return FALSE;
}

void InitAcroWheelieJump(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 distance, u8 type)
{
    InitJump(objectEvent, sprite, direction, distance, type);
    StartSpriteAnimIfDifferent(sprite, GetAcroWheelieDirectionAnimNum(direction));
    DoShadowFieldEffect(objectEvent);
}

static bool8 MovementAction_AcroWheelieHopFaceDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_SOUTH, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_LOW);
    return MovementAction_AcroWheelieHopFaceDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieHopFaceDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieHopFaceUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_NORTH, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_LOW);
    return MovementAction_AcroWheelieHopFaceUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieHopFaceUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieHopFaceLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_WEST, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_LOW);
    return MovementAction_AcroWheelieHopFaceLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieHopFaceLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieHopFaceRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_EAST, JUMP_DISTANCE_IN_PLACE, JUMP_TYPE_LOW);
    return MovementAction_AcroWheelieHopFaceRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieHopFaceRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieHopDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_SOUTH, JUMP_DISTANCE_NORMAL, JUMP_TYPE_LOW);
    return MovementAction_AcroWheelieHopDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieHopDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieHopUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_NORTH, JUMP_DISTANCE_NORMAL, JUMP_TYPE_LOW);
    return MovementAction_AcroWheelieHopUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieHopUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieHopLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_WEST, JUMP_DISTANCE_NORMAL, JUMP_TYPE_LOW);
    return MovementAction_AcroWheelieHopLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieHopLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieHopRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_EAST, JUMP_DISTANCE_NORMAL, JUMP_TYPE_LOW);
    return MovementAction_AcroWheelieHopRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieHopRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieJumpDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_SOUTH, JUMP_DISTANCE_FAR, JUMP_TYPE_HIGH);
    return MovementAction_AcroWheelieJumpDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieJumpDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieJumpUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_NORTH, JUMP_DISTANCE_FAR, JUMP_TYPE_HIGH);
    return MovementAction_AcroWheelieJumpUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieJumpUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieJumpLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_WEST, JUMP_DISTANCE_FAR, JUMP_TYPE_HIGH);
    return MovementAction_AcroWheelieJumpLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieJumpLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieJumpRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieJump(objectEvent, sprite, DIR_EAST, JUMP_DISTANCE_FAR, JUMP_TYPE_HIGH);
    return MovementAction_AcroWheelieJumpRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieJumpRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (DoJumpAnim(objectEvent, sprite))
    {
        objectEvent->hasShadow = FALSE;
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieInPlaceDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_SOUTH, GetAcroWheeliePedalDirectionAnimNum(DIR_SOUTH), 8);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieInPlaceUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_NORTH, GetAcroWheeliePedalDirectionAnimNum(DIR_NORTH), 8);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieInPlaceLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_WEST, GetAcroWheeliePedalDirectionAnimNum(DIR_WEST), 8);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieInPlaceRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitMoveInPlace(objectEvent, sprite, DIR_EAST, GetAcroWheeliePedalDirectionAnimNum(DIR_EAST), 8);
    return MovementAction_WalkInPlace_Step1(objectEvent, sprite);
}

void InitAcroPopWheelie(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 speed)
{
    InitNpcForMovement(objectEvent, sprite, direction, speed);
    StartSpriteAnim(sprite, GetAcroWheelieDirectionAnimNum(objectEvent->facingDirection));
    SeekSpriteAnim(sprite, 0);
}

static bool8 MovementAction_AcroPopWheelieMoveDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroPopWheelie(objectEvent, sprite, DIR_SOUTH, MOVE_SPEED_FAST_1);
    return MovementAction_AcroPopWheelieMoveDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroPopWheelieMoveDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroPopWheelieMoveUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroPopWheelie(objectEvent, sprite, DIR_NORTH, MOVE_SPEED_FAST_1);
    return MovementAction_AcroPopWheelieMoveUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroPopWheelieMoveUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroPopWheelieMoveLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroPopWheelie(objectEvent, sprite, DIR_WEST, MOVE_SPEED_FAST_1);
    return MovementAction_AcroPopWheelieMoveLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroPopWheelieMoveLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroPopWheelieMoveRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroPopWheelie(objectEvent, sprite, DIR_EAST, MOVE_SPEED_FAST_1);
    return MovementAction_AcroPopWheelieMoveRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroPopWheelieMoveRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void InitAcroWheelieMove(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 speed)
{
    InitNpcForMovement(objectEvent, sprite, direction, speed);
    SetStepAnimHandleAlternation(objectEvent, sprite, GetAcroWheeliePedalDirectionAnimNum(objectEvent->facingDirection));
}

static bool8 MovementAction_AcroWheelieMoveDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieMove(objectEvent, sprite, DIR_SOUTH, MOVE_SPEED_FAST_1);
    return MovementAction_AcroWheelieMoveDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieMoveDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieMoveUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieMove(objectEvent, sprite, DIR_NORTH, MOVE_SPEED_FAST_1);
    return MovementAction_AcroWheelieMoveUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieMoveUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieMoveLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieMove(objectEvent, sprite, DIR_WEST, MOVE_SPEED_FAST_1);
    return MovementAction_AcroWheelieMoveLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieMoveLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_AcroWheelieMoveRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitAcroWheelieMove(objectEvent, sprite, DIR_EAST, MOVE_SPEED_FAST_1);
    return MovementAction_AcroWheelieMoveRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_AcroWheelieMoveRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

void InitSpin(struct ObjectEvent *objectEvent, struct Sprite *sprite, u8 direction, u8 speed)
{
    InitNpcForMovement(objectEvent, sprite, direction, speed);
    SetStepAnimHandleAlternation(objectEvent, sprite, GetSpinDirectionAnimNum(objectEvent->facingDirection));
    SeekSpriteAnim(sprite, 0);
}

static bool8 MovementAction_SpinDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitSpin(objectEvent, sprite, DIR_SOUTH, MOVE_SPEED_FAST_1);
    return MovementAction_SpinDown_Step1(objectEvent, sprite);
}

static bool8 MovementAction_SpinDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_SpinUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitSpin(objectEvent, sprite, DIR_NORTH, MOVE_SPEED_FAST_1);
    return MovementAction_SpinUp_Step1(objectEvent, sprite);
}

static bool8 MovementAction_SpinUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_SpinLeft_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitSpin(objectEvent, sprite, DIR_WEST, MOVE_SPEED_FAST_1);
    return MovementAction_SpinLeft_Step1(objectEvent, sprite);
}

static bool8 MovementAction_SpinLeft_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_SpinRight_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    InitSpin(objectEvent, sprite, DIR_EAST, MOVE_SPEED_FAST_1);
    return MovementAction_SpinRight_Step1(objectEvent, sprite);
}

static bool8 MovementAction_SpinRight_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (UpdateMovementNormal(objectEvent, sprite))
    {
        sprite->data[2] = 2;
        return TRUE;
    }
    return FALSE;
}

static bool8 MovementAction_RaiseHand_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnim(sprite, ANIM_RAISE_HAND);
    sprite->animPaused = FALSE;
    objectEvent->disableAnim = FALSE;
    sprite->data[2] = 1;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
    sprite->data[6] = 0;
    sprite->data[7] = 0;
    return FALSE;
}

static bool8 MovementAction_RaiseHandAndStop_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return sprite->animEnded;
}

static bool8 MovementAction_RaiseHandAndJump_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    switch (sprite->data[7])
    {
    case 0:
        if((sprite->data[6] += 10) > 127)
        {
            sprite->data[6] = 0;
            sprite->data[5]++;
            sprite->data[7] = sprite->data[5];
            StartSpriteAnim(sprite, ANIM_STD_FACE_SOUTH);
            sprite->animPaused = FALSE;
            objectEvent->disableAnim = FALSE;
        }
        sprite->y2 = -(3 * gSineTable[sprite->data[6]] >> 7);
        objectEvent->singleMovementActive = sprite->y2 != 0;
        return FALSE;
    case 1:
        if (++sprite->data[4] > 16)
        {
            sprite->data[4] = 0;
            StartSpriteAnim(sprite, ANIM_RAISE_HAND);
            sprite->animPaused = FALSE;
            objectEvent->disableAnim = FALSE;
            sprite->data[7] = 0;
        }
        else
        {
            objectEvent->singleMovementActive = FALSE;
        }
        return FALSE;
    case 2:
        objectEvent->singleMovementActive = FALSE;
        if (++sprite->data[4] > 80)
        {
            sprite->data[4] = 0;
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    return FALSE;
}

static bool8 MovementAction_RaiseHandAndSwim_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    bool8 ret;
    sprite->data[7] = (sprite->data[7] + 4) & 0xFF;
    sprite->x2 = gSineTable[sprite->data[7]] >> 7;
    if (sprite->data[7] == 0)
        ret = TRUE;
    else
        ret = FALSE;
    return ret;
}

static bool8 MovementAction_ShakeHeadOrWalkInPlace_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    StartSpriteAnim(sprite, ANIM_SHAKE_HEAD_OR_WALK_IN_PLACE);
    sprite->animPaused = FALSE;
    objectEvent->disableAnim = FALSE;
    sprite->data[2] = 1;
    return FALSE;
}

static bool8 MovementAction_ShakeHeadOrWalkInPlace_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return sprite->animEnded;
}

u8 MovementAction_Finish(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return TRUE;
}

static bool8 MovementAction_PauseSpriteAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    sprite->animPaused = TRUE;
    return TRUE;
}

static bool8 MovementAction_FlyUp_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    sprite->y2 = 0;
    sprite->data[2]++;
    return FALSE;
}

static bool8 MovementAction_FlyUp_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    sprite->y2 -= 8;
    if (sprite->y2 == -160)
        sprite->data[2]++;
    return FALSE;
}

static bool8 MovementAction_FlyDown_Step0(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    sprite->y2 = -160;
    sprite->data[2]++;
    return FALSE;
}

static bool8 MovementAction_FlyDown_Step1(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    sprite->y2 += 8;
    if (sprite->y2 == 0)
        sprite->data[2]++;
    return FALSE;
}

u8 MovementAction_FlyUp_Step2(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    return TRUE;
}

static void UpdateObjectEventSpriteAnimPause(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (objectEvent->disableAnim)
    {
        sprite->animPaused = TRUE;
    }
}

static void TryEnableObjectEventAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    if (objectEvent->enableAnim)
    {
        sprite->animPaused = FALSE;
        objectEvent->disableAnim = FALSE;
        objectEvent->enableAnim = FALSE;
    }
}

static void UpdateObjectEventVisibility(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    CalcWhetherObjectIsOffscreen(objectEvent, sprite);
    UpdateObjEventSpriteVisibility(objectEvent, sprite);
}

static void CalcWhetherObjectIsOffscreen(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u16 x, y;
    u16 x2, y2;
    const struct ObjectEventGraphicsInfo *graphicsInfo;
    s16 var;

    objectEvent->offScreen = FALSE;
    graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
    if (sprite->coordOffsetEnabled)
    {
        x = sprite->x + sprite->x2 + sprite->centerToCornerVecX + gSpriteCoordOffsetX;
        y = sprite->y + sprite->y2 + sprite->centerToCornerVecY + gSpriteCoordOffsetY;
    }
    else
    {
        x = sprite->x + sprite->x2 + sprite->centerToCornerVecX;
        y = sprite->y + sprite->y2 + sprite->centerToCornerVecY;
    }
    x2 = graphicsInfo->width + (s16)x;
    y2 = graphicsInfo->height + (s16)y;
    
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(SSANNE_EXTERIOR)
         && gSaveBlock1Ptr->location.mapNum == MAP_NUM(SSANNE_EXTERIOR)
         && objectEvent->localId == 1)
    {
        var = -32;
    }
    else
    {
        var = -16;
    }
    if ((s16)x >= 256 || (s16)x2 < var)
    {
        objectEvent->offScreen = TRUE;
    }
    if ((s16)y >= 176 || (s16)y2 < -16)
    {
        objectEvent->offScreen = TRUE;
    }
}

static void UpdateObjEventSpriteVisibility(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    sprite->invisible = FALSE;
    if (objectEvent->invisible || objectEvent->offScreen)
    {
        sprite->invisible = TRUE;
    }
}

static void GetAllGroundEffectFlags_OnSpawn(struct ObjectEvent *objEvent, u32 *flags)
{
    ObjectEventUpdateMetatileBehaviors(objEvent);
    GetGroundEffectFlags_Reflection(objEvent, flags);
    GetGroundEffectFlags_TallGrassOnSpawn(objEvent, flags);
    GetGroundEffectFlags_LongGrassOnSpawn(objEvent, flags);
    GetGroundEffectFlags_SandHeap(objEvent, flags);
    GetGroundEffectFlags_ShallowFlowingWater(objEvent, flags);
    GetGroundEffectFlags_ShortGrass(objEvent, flags);
    GetGroundEffectFlags_HotSprings(objEvent, flags);
}

static void GetAllGroundEffectFlags_OnBeginStep(struct ObjectEvent *objEvent, u32 *flags)
{
    ObjectEventUpdateMetatileBehaviors(objEvent);
    GetGroundEffectFlags_Reflection(objEvent, flags);
    GetGroundEffectFlags_TallGrassOnBeginStep(objEvent, flags);
    GetGroundEffectFlags_LongGrassOnBeginStep(objEvent, flags);
    GetGroundEffectFlags_Tracks(objEvent, flags);
    GetGroundEffectFlags_SandHeap(objEvent, flags);
    GetGroundEffectFlags_ShallowFlowingWater(objEvent, flags);
    GetGroundEffectFlags_Puddle(objEvent, flags);
    GetGroundEffectFlags_ShortGrass(objEvent, flags);
    GetGroundEffectFlags_HotSprings(objEvent, flags);
}

static void GetAllGroundEffectFlags_OnFinishStep(struct ObjectEvent *objEvent, u32 *flags)
{
    ObjectEventUpdateMetatileBehaviors(objEvent);
    GetGroundEffectFlags_ShallowFlowingWater(objEvent, flags);
    GetGroundEffectFlags_SandHeap(objEvent, flags);
    GetGroundEffectFlags_Puddle(objEvent, flags);
    GetGroundEffectFlags_Ripple(objEvent, flags);
    GetGroundEffectFlags_ShortGrass(objEvent, flags);
    GetGroundEffectFlags_HotSprings(objEvent, flags);
    GetGroundEffectFlags_Seaweed(objEvent, flags);
    GetGroundEffectFlags_JumpLanding(objEvent, flags);
}

static void ObjectEventUpdateMetatileBehaviors(struct ObjectEvent *objEvent)
{
    objEvent->previousMetatileBehavior = MapGridGetMetatileBehaviorAt(objEvent->previousCoords.x, objEvent->previousCoords.y);
    objEvent->currentMetatileBehavior = MapGridGetMetatileBehaviorAt(objEvent->currentCoords.x, objEvent->currentCoords.y);
}

static void GetGroundEffectFlags_Reflection(struct ObjectEvent *objEvent, u32 *flags)
{
    u32 reflectionFlags[2] = { GROUND_EFFECT_FLAG_REFLECTION, GROUND_EFFECT_FLAG_ICE_REFLECTION };
    u8 type = ObjectEventCheckForReflectiveSurface(objEvent);

    if (type)
    {
        if (!objEvent->hasReflection)
        {
            objEvent->hasReflection = 0;
            objEvent->hasReflection = 1;
            *flags |= reflectionFlags[type - 1];
        }
    }
    else
    {
        objEvent->hasReflection = 0;
    }
}

static void GetGroundEffectFlags_TallGrassOnSpawn(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsTallGrass(objEvent->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_TALL_GRASS_ON_SPAWN;
}

static void GetGroundEffectFlags_TallGrassOnBeginStep(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsTallGrass(objEvent->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_TALL_GRASS_ON_MOVE;
}

static void GetGroundEffectFlags_LongGrassOnSpawn(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsLongGrass(objEvent->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_LONG_GRASS_ON_SPAWN;
}

static void GetGroundEffectFlags_LongGrassOnBeginStep(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsLongGrass(objEvent->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_LONG_GRASS_ON_MOVE;
}

static void GetGroundEffectFlags_Tracks(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsDeepSand(objEvent->previousMetatileBehavior))
    {
        *flags |= GROUND_EFFECT_FLAG_DEEP_SAND;
    }
    else if (MetatileBehavior_IsSand(objEvent->previousMetatileBehavior)
             || MetatileBehavior_IsFootprints(objEvent->previousMetatileBehavior))
    {
        *flags |= GROUND_EFFECT_FLAG_SAND;
    }
}

static void GetGroundEffectFlags_SandHeap(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsDeepSand(objEvent->currentMetatileBehavior)
        && MetatileBehavior_IsDeepSand(objEvent->previousMetatileBehavior))
    {
        if (!objEvent->inSandPile)
        {
            objEvent->inSandPile = 0;
            objEvent->inSandPile = 1;
            *flags |= GROUND_EFFECT_FLAG_SAND_PILE;
        }
    }
    else
    {
        objEvent->inSandPile = 0;
    }
}

static void GetGroundEffectFlags_ShallowFlowingWater(struct ObjectEvent *objEvent, u32 *flags)
{
    if ((MetatileBehavior_IsShallowFlowingWater(objEvent->currentMetatileBehavior)
         && MetatileBehavior_IsShallowFlowingWater(objEvent->previousMetatileBehavior))
        || (MetatileBehavior_IsPacifidlogLog(objEvent->currentMetatileBehavior)
            && MetatileBehavior_IsPacifidlogLog(objEvent->previousMetatileBehavior)))
    {
        if (!objEvent->inShallowFlowingWater)
        {
            objEvent->inShallowFlowingWater = 0;
            objEvent->inShallowFlowingWater = 1;
            *flags |= GROUND_EFFECT_FLAG_SHALLOW_FLOWING_WATER;
        }
    }
    else
    {
        objEvent->inShallowFlowingWater = 0;
    }
}

static void GetGroundEffectFlags_Puddle(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsPuddle(objEvent->currentMetatileBehavior)
        && MetatileBehavior_IsPuddle(objEvent->previousMetatileBehavior))
    {
        *flags |= GROUND_EFFECT_FLAG_PUDDLE;
    }
}

static void GetGroundEffectFlags_Ripple(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_HasRipples(objEvent->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_RIPPLES;
}

static void GetGroundEffectFlags_ShortGrass(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsShortGrass(objEvent->currentMetatileBehavior)
        && MetatileBehavior_IsShortGrass(objEvent->previousMetatileBehavior))
    {
        if (!objEvent->inShortGrass)
        {
            objEvent->inShortGrass = 0;
            objEvent->inShortGrass = 1;
            *flags |= GROUND_EFFECT_FLAG_SHORT_GRASS;
        }
    }
    else
    {
        objEvent->inShortGrass = 0;
    }
}

static void GetGroundEffectFlags_HotSprings(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsHotSprings(objEvent->currentMetatileBehavior)
        && MetatileBehavior_IsHotSprings(objEvent->previousMetatileBehavior))
    {
        if (!objEvent->inHotSprings)
        {
            objEvent->inHotSprings = 0;
            objEvent->inHotSprings = 1;
            *flags |= GROUND_EFFECT_FLAG_HOT_SPRINGS;
        }
    }
    else
    {
        objEvent->inHotSprings = 0;
    }
}

static void GetGroundEffectFlags_Seaweed(struct ObjectEvent *objEvent, u32 *flags)
{
    if (MetatileBehavior_IsSeaweed(objEvent->currentMetatileBehavior))
        *flags |= GROUND_EFFECT_FLAG_SEAWEED;
}

static void GetGroundEffectFlags_JumpLanding(struct ObjectEvent *objEvent, u32 *flags)
{
    typedef bool8 (*MetatileFunc)(u8);

    static const MetatileFunc metatileFuncs[] = {
        MetatileBehavior_IsTallGrass,
        MetatileBehavior_IsLongGrass,
        MetatileBehavior_IsPuddle,
        MetatileBehavior_IsSurfable,
        MetatileBehavior_IsShallowFlowingWater,
        MetatileBehavior_IsATile,
    };

    static const u32 jumpLandingFlags[] = {
        GROUND_EFFECT_FLAG_LAND_IN_TALL_GRASS,
        GROUND_EFFECT_FLAG_LAND_IN_LONG_GRASS,
        GROUND_EFFECT_FLAG_LAND_IN_SHALLOW_WATER,
        GROUND_EFFECT_FLAG_LAND_IN_DEEP_WATER,
        GROUND_EFFECT_FLAG_LAND_IN_SHALLOW_WATER,
        GROUND_EFFECT_FLAG_LAND_ON_NORMAL_GROUND,
    };

    if (objEvent->landingJump && !objEvent->disableJumpLandingGroundEffect)
    {
        u8 i;

        for (i = 0; i < NELEMS(metatileFuncs); i++)
        {
            if (metatileFuncs[i](objEvent->currentMetatileBehavior))
            {
                *flags |= jumpLandingFlags[i];
                return;
            }
        }
    }
}

static u8 ObjectEventCheckForReflectiveSurface(struct ObjectEvent *objEvent)
{
    const struct ObjectEventGraphicsInfo *info = GetObjectEventGraphicsInfo(objEvent->graphicsId);

    // ceil div by tile width?
    s16 width = 1;
    s16 height = 2;
    s16 i;
    s16 j;
    u8 result;
    u8 b;
    s16 one;

#define RETURN_REFLECTION_TYPE_AT(x, y)              \
    b = MapGridGetMetatileBehaviorAt(x, y);          \
    result = GetReflectionTypeByMetatileBehavior(b); \
    if (result != 0)                                 \
        return result;

    for (i = 0, one = 1; i < height; i++)
    {
        RETURN_REFLECTION_TYPE_AT(objEvent->currentCoords.x, objEvent->currentCoords.y + one + i)
        RETURN_REFLECTION_TYPE_AT(objEvent->previousCoords.x, objEvent->previousCoords.y + one + i)
        for (j = 1; j < width; j++)
        {
            RETURN_REFLECTION_TYPE_AT(objEvent->currentCoords.x + j, objEvent->currentCoords.y + one + i)
            RETURN_REFLECTION_TYPE_AT(objEvent->currentCoords.x - j, objEvent->currentCoords.y + one + i)
            RETURN_REFLECTION_TYPE_AT(objEvent->previousCoords.x + j, objEvent->previousCoords.y + one + i)
            RETURN_REFLECTION_TYPE_AT(objEvent->previousCoords.x - j, objEvent->previousCoords.y + one + i)
        }
    }
    return 0;

#undef RETURN_REFLECTION_TYPE_AT
}

static u8 GetReflectionTypeByMetatileBehavior(u32 behavior)
{
    if (MetatileBehavior_IsIce(behavior))
        return 1;
    else if (MetatileBehavior_IsReflective(behavior))
        return 2;
    else
        return 0;
}

u8 GetLedgeJumpDirection(s16 x, s16 y, u8 direction)
{
    static bool8 (*const ledgeBehaviorFuncs[])(u8) = {
        [DIR_SOUTH - 1] = MetatileBehavior_IsJumpSouth,
        [DIR_NORTH - 1] = MetatileBehavior_IsJumpNorth,
        [DIR_WEST - 1]  = MetatileBehavior_IsJumpWest,
        [DIR_EAST - 1]  = MetatileBehavior_IsJumpEast,
    };

    u8 behavior;
    u8 index = direction;

    if (index == DIR_NONE)
        return DIR_NONE;
    else if (index > DIR_EAST)
        index -= DIR_EAST;

    index--;
    behavior = MapGridGetMetatileBehaviorAt(x, y);

    if (ledgeBehaviorFuncs[index](behavior) == TRUE)
        return index + 1;

    return DIR_NONE;
}

static void SetObjectEventSpriteOamTableForLongGrass(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    if (objEvent->disableCoveringGroundEffects)
        return;

    if (!MetatileBehavior_IsLongGrass(objEvent->currentMetatileBehavior))
        return;

    if (!MetatileBehavior_IsLongGrass(objEvent->previousMetatileBehavior))
        return;

    sprite->subspriteTableNum = 4;

    if (ElevationToPriority(objEvent->previousElevation) == 1)
        sprite->subspriteTableNum = 5;
}

static bool8 IsElevationMismatchAt(u8 elevation, s16 x, s16 y)
{
    u8 mapElevation;

    if (elevation == 0)
        return FALSE;

    mapElevation = MapGridGetElevationAt(x, y);

    if (mapElevation == 0 || mapElevation == 15)
        return FALSE;

    if (mapElevation != elevation)
        return TRUE;

    return FALSE;
}

static const u8 sElevationToSubpriority[] = {
    115, 115, 83, 115, 83, 115, 83, 115, 83, 115, 83, 115, 83, 0, 0, 115
};

static const u8 sElevationToPriority[] = {
    2, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 2
};

// 1 = Above player sprite
// 2 = Below player sprite
static const u8 sElevationToSubspriteTableNum[] = {
    1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 1,
};

static void UpdateObjectEventElevationAndPriority(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    if (objEvent->fixedPriority)
        return;

    ObjectEventUpdateElevation(objEvent);

    sprite->subspriteTableNum = sElevationToSubspriteTableNum[objEvent->previousElevation];
    sprite->oam.priority = sElevationToPriority[objEvent->previousElevation];
}

static void InitObjectPriorityByElevation(struct Sprite *sprite, u8 elevation)
{
    sprite->subspriteTableNum = sElevationToSubspriteTableNum[elevation];
    sprite->oam.priority = sElevationToPriority[elevation];
}

u8 ElevationToPriority(u8 elevation)
{
    return sElevationToPriority[elevation];
}

void ObjectEventUpdateElevation(struct ObjectEvent *objEvent)
{
    u8 curElevation = MapGridGetElevationAt(objEvent->currentCoords.x, objEvent->currentCoords.y);
    u8 prevElevation = MapGridGetElevationAt(objEvent->previousCoords.x, objEvent->previousCoords.y);

    if (curElevation == 15 || prevElevation == 15)
        return;

    objEvent->currentElevation = curElevation;

    if (curElevation != 0 && curElevation != 15)
        objEvent->previousElevation = curElevation;
}

void SetObjectSubpriorityByElevation(u8 elevation, struct Sprite *sprite, u8 subpriority)
{
    s32 tmp = sprite->centerToCornerVecY;
    u32 tmpa = *(u16 *)&sprite->y;
    u32 tmpb = *(u16 *)&gSpriteCoordOffsetY;
    s32 tmp2 = (tmpa - tmp) + tmpb;
    u16 tmp3 = (0x10 - ((((u32)tmp2 + 8) & 0xFF) >> 4)) * 2;
    sprite->subpriority = tmp3 + sElevationToSubpriority[elevation] + subpriority;
}

static void ObjectEventUpdateSubpriority(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    if (objEvent->fixedPriority)
        return;

    SetObjectSubpriorityByElevation(objEvent->previousElevation, sprite, 1);
}

static bool8 AreElevationsCompatible(u8 a, u8 b)
{
    if (a == 0 || b == 0)
        return TRUE;

    if (a != b)
        return FALSE;

    return TRUE;
}

void GroundEffect_SpawnOnTallGrass(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = objEvent->previousElevation;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = objEvent->localId << 8 | objEvent->mapNum;
    gFieldEffectArguments[5] = objEvent->mapGroup;
    gFieldEffectArguments[6] = (u8)gSaveBlock1Ptr->location.mapNum << 8 | (u8)gSaveBlock1Ptr->location.mapGroup;
    gFieldEffectArguments[7] = 1;
    FieldEffectStart(FLDEFF_TALL_GRASS);
}

void GroundEffect_StepOnTallGrass(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = objEvent->previousElevation;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = objEvent->localId << 8 | objEvent->mapNum;
    gFieldEffectArguments[5] = objEvent->mapGroup;
    gFieldEffectArguments[6] = (u8)gSaveBlock1Ptr->location.mapNum << 8 | (u8)gSaveBlock1Ptr->location.mapGroup;
    gFieldEffectArguments[7] = 0;
    FieldEffectStart(FLDEFF_TALL_GRASS);
}

void GroundEffect_SpawnOnLongGrass(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = objEvent->previousElevation;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = objEvent->localId << 8 | objEvent->mapNum;
    gFieldEffectArguments[5] = objEvent->mapGroup;
    gFieldEffectArguments[6] = (u8)gSaveBlock1Ptr->location.mapNum << 8 | (u8)gSaveBlock1Ptr->location.mapGroup;
    gFieldEffectArguments[7] = 1;
    FieldEffectStart(FLDEFF_LONG_GRASS);
}

void GroundEffect_StepOnLongGrass(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = objEvent->previousElevation;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = (objEvent->localId << 8) | objEvent->mapNum;
    gFieldEffectArguments[5] = objEvent->mapGroup;
    gFieldEffectArguments[6] = (u8)gSaveBlock1Ptr->location.mapNum << 8 | (u8)gSaveBlock1Ptr->location.mapGroup;
    gFieldEffectArguments[7] = 0;
    FieldEffectStart(FLDEFF_LONG_GRASS);
}

void GroundEffect_WaterReflection(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    SetUpReflection(objEvent, sprite, 0);
}

void GroundEffect_IceReflection(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    SetUpReflection(objEvent, sprite, 1);
}

void GroundEffect_FlowingWater(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    StartFieldEffectForObjectEvent(FLDEFF_FEET_IN_FLOWING_WATER, objEvent);
}

static void (*const sGroundEffectTracksFuncs[])(struct ObjectEvent *objEvent, struct Sprite *sprite, u8 a) = {
    DoTracksGroundEffect_None,
    DoTracksGroundEffect_Footprints,
    DoTracksGroundEffect_BikeTireTracks,
};

void GroundEffect_SandTracks(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    const struct ObjectEventGraphicsInfo *info = GetObjectEventGraphicsInfo(objEvent->graphicsId);
    sGroundEffectTracksFuncs[info->tracks](objEvent, sprite, 0);
}

void GroundEffect_DeepSandTracks(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    const struct ObjectEventGraphicsInfo *info = GetObjectEventGraphicsInfo(objEvent->graphicsId);
    sGroundEffectTracksFuncs[info->tracks](objEvent, sprite, 1);
}

static void DoTracksGroundEffect_None(struct ObjectEvent *objEvent, struct Sprite *sprite, u8 a)
{
}

static void DoTracksGroundEffect_Footprints(struct ObjectEvent *objEvent, struct Sprite *sprite, u8 a)
{
    // First half-word is a Field Effect script id. (gFieldEffectScriptPointers)
    u16 sandFootprints_FieldEffectData[2] = {
        FLDEFF_SAND_FOOTPRINTS,
        FLDEFF_DEEP_SAND_FOOTPRINTS
    };

    gFieldEffectArguments[0] = objEvent->previousCoords.x;
    gFieldEffectArguments[1] = objEvent->previousCoords.y;
    gFieldEffectArguments[2] = 149;
    gFieldEffectArguments[3] = 2;
    gFieldEffectArguments[4] = objEvent->facingDirection;
    FieldEffectStart(sandFootprints_FieldEffectData[a]);
}

static void DoTracksGroundEffect_BikeTireTracks(struct ObjectEvent *objEvent, struct Sprite *sprite, u8 a)
{
    //  Specifies which bike track shape to show next.
    //  For example, when the bike turns from up to right, it will show
    //  a track that curves to the right.
    //  Each 4-byte row corresponds to the initial direction of the bike, and
    //  each byte in that row is for the next direction of the bike in the order
    //  of down, up, left, right.
    static const u8 bikeTireTracks_Transitions[4][4] = {
        1, 2, 7, 8,
        1, 2, 6, 5,
        5, 8, 3, 4,
        6, 7, 3, 4,
    };

    if (objEvent->currentCoords.x != objEvent->previousCoords.x || objEvent->currentCoords.y != objEvent->previousCoords.y)
    {
        gFieldEffectArguments[0] = objEvent->previousCoords.x;
        gFieldEffectArguments[1] = objEvent->previousCoords.y;
        gFieldEffectArguments[2] = 149;
        gFieldEffectArguments[3] = 2;
        gFieldEffectArguments[4] =
            bikeTireTracks_Transitions[objEvent->previousMovementDirection][objEvent->facingDirection - 5];
        FieldEffectStart(FLDEFF_BIKE_TIRE_TRACKS);
    }
}

void GroundEffect_Ripple(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    DoRippleFieldEffect(objEvent, sprite);
}

void GroundEffect_StepOnPuddle(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    StartFieldEffectForObjectEvent(FLDEFF_SPLASH, objEvent);
}

void GroundEffect_SandHeap(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    StartFieldEffectForObjectEvent(FLDEFF_SAND_PILE, objEvent);
}

void GroundEffect_JumpOnTallGrass(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    u8 spriteId;

    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = objEvent->previousElevation;
    gFieldEffectArguments[3] = 2;
    FieldEffectStart(FLDEFF_JUMP_TALL_GRASS);

    spriteId = FindTallGrassFieldEffectSpriteId(
        objEvent->localId,
        objEvent->mapNum,
        objEvent->mapGroup,
        objEvent->currentCoords.x,
        objEvent->currentCoords.y);

    if (spriteId == MAX_SPRITES)
        GroundEffect_SpawnOnTallGrass(objEvent, sprite);
}

void GroundEffect_JumpOnLongGrass(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = objEvent->previousElevation;
    gFieldEffectArguments[3] = 2;
    FieldEffectStart(FLDEFF_JUMP_LONG_GRASS);
}

void GroundEffect_JumpOnShallowWater(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = objEvent->previousElevation;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_JUMP_SMALL_SPLASH);
}

void GroundEffect_JumpOnWater(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = objEvent->previousElevation;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_JUMP_BIG_SPLASH);
}

void GroundEffect_JumpLandingDust(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = objEvent->previousElevation;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_DUST);
}

void GroundEffect_ShortGrass(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    StartFieldEffectForObjectEvent(FLDEFF_SHORT_GRASS, objEvent);
}

void GroundEffect_HotSprings(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    StartFieldEffectForObjectEvent(FLDEFF_HOT_SPRINGS_WATER, objEvent);
}

void GroundEffect_Seaweed(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    FieldEffectStart(FLDEFF_BUBBLES);
}

static void (*const sGroundEffectFuncs[])(struct ObjectEvent *objEvent, struct Sprite *sprite) = {
    GroundEffect_SpawnOnTallGrass,
    GroundEffect_StepOnTallGrass,
    GroundEffect_SpawnOnLongGrass,
    GroundEffect_StepOnLongGrass,
    GroundEffect_WaterReflection,
    GroundEffect_IceReflection,
    GroundEffect_FlowingWater,
    GroundEffect_SandTracks,
    GroundEffect_DeepSandTracks,
    GroundEffect_Ripple,
    GroundEffect_StepOnPuddle,
    GroundEffect_SandHeap,
    GroundEffect_JumpOnTallGrass,
    GroundEffect_JumpOnLongGrass,
    GroundEffect_JumpOnShallowWater,
    GroundEffect_JumpOnWater,
    GroundEffect_JumpLandingDust,
    GroundEffect_ShortGrass,
    GroundEffect_HotSprings,
    GroundEffect_Seaweed
};

static void DoFlaggedGroundEffects(struct ObjectEvent *objEvent, struct Sprite *sprite, u32 flags)
{
    u8 i;

    if (objEvent->localId == OBJ_EVENT_ID_CAMERA && objEvent->invisible)
        return;

    for (i = 0; i < NELEMS(sGroundEffectFuncs); i++, flags >>= 1)
        if (flags & 1)
            sGroundEffectFuncs[i](objEvent, sprite);
}

void filters_out_some_ground_effects(struct ObjectEvent *objEvent, u32 *flags)
{
    if (objEvent->disableCoveringGroundEffects)
    {
        objEvent->inShortGrass = 0;
        objEvent->inSandPile = 0;
        objEvent->inShallowFlowingWater = 0;
        objEvent->inHotSprings = 0;
        *flags &= ~(GROUND_EFFECT_FLAG_HOT_SPRINGS
                  | GROUND_EFFECT_FLAG_SHORT_GRASS
                  | GROUND_EFFECT_FLAG_SAND_PILE
                  | GROUND_EFFECT_FLAG_SHALLOW_FLOWING_WATER
                  | GROUND_EFFECT_FLAG_TALL_GRASS_ON_MOVE);
    }
}

void FilterOutStepOnPuddleGroundEffectIfJumping(struct ObjectEvent *objEvent, u32 *flags)
{
    if (objEvent->landingJump)
        *flags &= ~GROUND_EFFECT_FLAG_PUDDLE;
}

static void DoGroundEffects_OnSpawn(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    u32 flags;

    if (objEvent->triggerGroundEffectsOnMove)
    {
        flags = 0;
        UpdateObjectEventElevationAndPriority(objEvent, sprite);
        GetAllGroundEffectFlags_OnSpawn(objEvent, &flags);
        SetObjectEventSpriteOamTableForLongGrass(objEvent, sprite);
        DoFlaggedGroundEffects(objEvent, sprite, flags);
        objEvent->triggerGroundEffectsOnMove = 0;
        objEvent->disableCoveringGroundEffects = 0;
    }
}

static void DoGroundEffects_OnBeginStep(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    u32 flags;

    if (objEvent->triggerGroundEffectsOnMove)
    {
        flags = 0;
        UpdateObjectEventElevationAndPriority(objEvent, sprite);
        GetAllGroundEffectFlags_OnBeginStep(objEvent, &flags);
        SetObjectEventSpriteOamTableForLongGrass(objEvent, sprite);
        filters_out_some_ground_effects(objEvent, &flags);
        DoFlaggedGroundEffects(objEvent, sprite, flags);
        objEvent->triggerGroundEffectsOnMove = 0;
        objEvent->disableCoveringGroundEffects = 0;
    }
}

static void DoGroundEffects_OnFinishStep(struct ObjectEvent *objEvent, struct Sprite *sprite)
{
    u32 flags;

    if (objEvent->triggerGroundEffectsOnStop)
    {
        flags = 0;
        UpdateObjectEventElevationAndPriority(objEvent, sprite);
        GetAllGroundEffectFlags_OnFinishStep(objEvent, &flags);
        SetObjectEventSpriteOamTableForLongGrass(objEvent, sprite);
        FilterOutStepOnPuddleGroundEffectIfJumping(objEvent, &flags);
        DoFlaggedGroundEffects(objEvent, sprite, flags);
        objEvent->triggerGroundEffectsOnStop = 0;
        objEvent->landingJump = 0;
    }
}

bool8 FreezeObjectEvent(struct ObjectEvent *objectEvent)
{
    if (objectEvent->heldMovementActive || objectEvent->frozen)
        return TRUE;
    objectEvent->frozen = TRUE;
    objectEvent->spriteAnimPausedBackup = gSprites[objectEvent->spriteId].animPaused;
    objectEvent->spriteAffineAnimPausedBackup = gSprites[objectEvent->spriteId].affineAnimPaused;
    gSprites[objectEvent->spriteId].animPaused = TRUE;
    gSprites[objectEvent->spriteId].affineAnimPaused = TRUE;
    return FALSE;
}

void FreezeObjectEvents(void)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active && i != gPlayerAvatar.objectEventId)
            FreezeObjectEvent(&gObjectEvents[i]);
    }
}

void FreezeObjectEventsExceptOne(u8 noFreeze)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (i != noFreeze && gObjectEvents[i].active && i != gPlayerAvatar.objectEventId)
            FreezeObjectEvent(&gObjectEvents[i]);
    }
}

void UnfreezeObjectEvent(struct ObjectEvent *objectEvent)
{
    if (objectEvent->active && objectEvent->frozen)
    {
        objectEvent->frozen = FALSE;
        gSprites[objectEvent->spriteId].animPaused = objectEvent->spriteAnimPausedBackup;
        gSprites[objectEvent->spriteId].affineAnimPaused = objectEvent->spriteAffineAnimPausedBackup;
    }
}

void UnfreezeObjectEvents(void)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active)
            UnfreezeObjectEvent(&gObjectEvents[i]);
    }
}

#define tDirection data[3]
#define tSpeed     data[4]
#define tStepNo    data[5]

static void Step1(struct Sprite *sprite, u8 direction)
{
    sprite->x += sDirectionToVectors[direction].x;
    sprite->y += sDirectionToVectors[direction].y;
}

static void Step2(struct Sprite *sprite, u8 direction)
{
    sprite->x += 2 * (u16)sDirectionToVectors[direction].x;
    sprite->y += 2 * (u16)sDirectionToVectors[direction].y;
}

static void Step3(struct Sprite *sprite, u8 direction)
{
    sprite->x += 2 * (u16)sDirectionToVectors[direction].x + (u16)sDirectionToVectors[direction].x;
    sprite->y += 2 * (u16)sDirectionToVectors[direction].y + (u16)sDirectionToVectors[direction].y;
}

static void Step4(struct Sprite *sprite, u8 direction)
{
    sprite->x += 4 * (u16)sDirectionToVectors[direction].x;
    sprite->y += 4 * (u16)sDirectionToVectors[direction].y;
}

static void Step8(struct Sprite *sprite, u8 direction)
{
    sprite->x += 8 * (u16)sDirectionToVectors[direction].x;
    sprite->y += 8 * (u16)sDirectionToVectors[direction].y;
}

void SetSpriteDataForNormalStep(struct Sprite *sprite, u8 direction, u8 speed)
{
    sprite->tDirection = direction;
    sprite->tSpeed = speed;
    sprite->tStepNo = 0;
}

typedef void (*SpriteStepFunc)(struct Sprite *sprite, u8 direction);

static const SpriteStepFunc sSpeedNormalStepFuncs[] = {
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1
};

static const SpriteStepFunc sSpeedFast1StepFuncs[] = {
    Step2,
    Step2,
    Step2,
    Step2,
    Step2,
    Step2,
    Step2,
    Step2
};

static const SpriteStepFunc sSpeedFast2StepFuncs[] = {
    Step2,
    Step3,
    Step3,
    Step2,
    Step3,
    Step3
};

static const SpriteStepFunc sSpeedFasterStepFuncs[] = {
    Step4,
    Step4,
    Step4,
    Step4
};

static const SpriteStepFunc sSpeedFastestStepFuncs[] = {
    Step8,
    Step8
};

static const SpriteStepFunc *const sNpcStepFuncTables[] = {
    [MOVE_SPEED_NORMAL]  = sSpeedNormalStepFuncs,
    [MOVE_SPEED_FAST_1]  = sSpeedFast1StepFuncs,
    [MOVE_SPEED_FAST_2]  = sSpeedFast2StepFuncs,
    [MOVE_SPEED_FASTER]  = sSpeedFasterStepFuncs,
    [MOVE_SPEED_FASTEST] = sSpeedFastestStepFuncs,
};

static const s16 sStepTimes[] = {
    [MOVE_SPEED_NORMAL]  = NELEMS(sSpeedNormalStepFuncs),
    [MOVE_SPEED_FAST_1]  = NELEMS(sSpeedFast1StepFuncs),
    [MOVE_SPEED_FAST_2]  = NELEMS(sSpeedFast2StepFuncs),
    [MOVE_SPEED_FASTER]  = NELEMS(sSpeedFasterStepFuncs),
    [MOVE_SPEED_FASTEST] = NELEMS(sSpeedFastestStepFuncs),
};

bool8 NpcTakeStep(struct Sprite *sprite)
{
    if (sprite->tStepNo >= sStepTimes[sprite->tSpeed])
        return FALSE;

    sNpcStepFuncTables[sprite->tSpeed][sprite->tStepNo](sprite, sprite->tDirection);

    sprite->tStepNo++;

    if (sprite->tStepNo < sStepTimes[sprite->tSpeed])
        return FALSE;

    return TRUE;
}

#undef tSpeed

#define tDelay     data[4]

void SetWalkSlowerSpriteData(struct Sprite *sprite, u8 direction)
{
    sprite->tDirection = direction;
    sprite->tDelay = 0;
    sprite->tStepNo = 0;
}

bool8 UpdateWalkSlowerAnim(struct Sprite *sprite)
{
    if (!(sprite->tDelay & 1))
    {
        Step1(sprite, sprite->tDirection);
        sprite->tStepNo++;
    }

    sprite->tDelay++;

    if (sprite->tStepNo > 15)
        return TRUE;
    else
        return FALSE;
}

// SetWalkSlowSpriteData, SetWalkSlowerSpriteData, SetWalkSlowestSpriteData,
// and SetRunSlowSpriteData are functionally equivalent
void SetWalkSlowSpriteData(struct Sprite *sprite, u8 direction)
{
    sprite->tDirection = direction;
    sprite->tDelay = 0;
    sprite->tStepNo = 0;
}

bool8 UpdateWalkSlowAnim(struct Sprite *sprite)
{
    if (++sprite->tDelay < 3)
    {
        Step1(sprite, sprite->tDirection);
        sprite->tStepNo++;
    }
    else
        sprite->tDelay = 0;

    if (sprite->tStepNo > 15)
        return TRUE;
    else
        return FALSE;
}

void SetWalkSlowestSpriteData(struct Sprite *sprite, u8 direction)
{
    sprite->tDirection = direction;
    sprite->tDelay = 0;
    sprite->tStepNo = 0;
}

bool8 UpdateWalkSlowestAnim(struct Sprite *sprite)
{
    if (++sprite->tDelay > 9)
    {
        sprite->tDelay = 0;
        Step1(sprite, sprite->tDirection);
        sprite->tStepNo++;
    }

    if (sprite->tStepNo > 15)
        return TRUE;
    else
        return FALSE;
}

void SetRunSlowSpriteData(struct Sprite *sprite, u8 direction)
{
    sprite->tDirection = direction;
    sprite->tDelay = 0;
    sprite->tStepNo = 0;
}

bool8 UpdateRunSlowAnim(struct Sprite *sprite)
{
    if ((++sprite->tDelay) & 1)
    {
        Step1(sprite, sprite->tDirection);
        sprite->tStepNo++;
    }
    else
    {
        Step2(sprite, sprite->tDirection);
        sprite->tStepNo += 2;
    }

    if (sprite->tStepNo > 15)
        return TRUE;
    else
        return FALSE;
}

#undef tStepNo
#undef tDelay

static const s8 sJumpY_High[] = {
     -4,  -6,  -8, -10, -11, -12, -12, -12,
    -11, -10,  -9,  -8,  -6,  -4,   0,   0
};

static const s8 sJumpY_Low[] = {
    0,   -2,  -3,  -4,  -5,  -6,  -6,  -6,
    -5,  -5,  -4,  -3,  -2,   0,   0,   0
};

static const s8 sJumpY_Normal[] = {
    -2,  -4,  -6,  -8,  -9, -10, -10, -10,
    -9,  -8,  -6,  -5,  -3,  -2,   0,   0
};

#define sJumpDistance  data[4]
#define sJumpType      data[5]
#define sTimer         data[6]

static const s8 *const sJumpYTable[] = {
    [JUMP_TYPE_HIGH]   = sJumpY_High,
    [JUMP_TYPE_LOW]    = sJumpY_Low,
    [JUMP_TYPE_NORMAL] = sJumpY_Normal,
};

static s16 GetJumpY(s16 i, u8 type)
{
    return sJumpYTable[type][i];
}

void SetJumpSpriteData(struct Sprite *sprite, u8 direction, u8 distance, u8 type)
{
    sprite->tDirection = direction;
    sprite->sJumpDistance = distance;
    sprite->sJumpType = type;
    sprite->sTimer = 0;
}

u8 DoJumpSpriteMovement(struct Sprite *sprite)
{
    s16 distanceToTime[] = {
        [JUMP_DISTANCE_IN_PLACE] = 16,
        [JUMP_DISTANCE_NORMAL]   = 16,
        [JUMP_DISTANCE_FAR]      = 32,
    };
    u8 distanceToShift[] = {
        [JUMP_DISTANCE_IN_PLACE] = 0,
        [JUMP_DISTANCE_NORMAL]   = 0,
        [JUMP_DISTANCE_FAR]      = 1,
    };
    u8 jumpPhase = 0;

    if (sprite->sJumpDistance != JUMP_DISTANCE_IN_PLACE)
        Step1(sprite, sprite->tDirection);

    sprite->y2 = GetJumpY(sprite->sTimer >> distanceToShift[sprite->sJumpDistance], sprite->sJumpType);

    sprite->sTimer++;

    if (sprite->sTimer == (distanceToTime[sprite->sJumpDistance] >> 1))
        jumpPhase = JUMP_HALFWAY;

    if (sprite->sTimer >= distanceToTime[sprite->sJumpDistance])
    {
        sprite->y2 = 0;
        jumpPhase = JUMP_FINISHED;
    }

    return jumpPhase;
}

u8 DoJumpSpecialSpriteMovement(struct Sprite *sprite)
{
    s16 duration[3] = {0x20, 0x20, 0x40};
    u8 shifts[3] = {1, 1, 2};
    u8 jumpPhase = 0;

    if (sprite->sJumpDistance != JUMP_DISTANCE_IN_PLACE && !(sprite->sTimer & 1))
        Step1(sprite, sprite->tDirection);

    sprite->y2 = GetJumpY(sprite->sTimer >> shifts[sprite->sJumpDistance], sprite->sJumpType);

    sprite->sTimer++;

    if (sprite->sTimer == (duration[sprite->sJumpDistance] >> 1))
        jumpPhase = JUMP_HALFWAY;

    if (sprite->sTimer >= duration[sprite->sJumpDistance])
    {
        sprite->y2 = 0;
        jumpPhase = JUMP_FINISHED;
    }

    return jumpPhase;
}

#undef sTimer
#undef sJumpType
#undef sJumpDistance
#undef tDirection

#define tDelay data[3]

void SetMovementDelay(struct Sprite *sprite, s16 delay)
{
    sprite->tDelay = delay;
}

bool8 WaitForMovementDelay(struct Sprite *sprite)
{
    sprite->tDelay--;

    if (sprite->tDelay == 0)
        return TRUE;
    else
        return FALSE;
}

#undef tDelay

void SetAndStartSpriteAnim(struct Sprite *sprite, u8 animNum, u8 animCmdIndex)
{
    sprite->animNum = animNum;
    sprite->animPaused = FALSE;
    SeekSpriteAnim(sprite, animCmdIndex);
}

bool8 SpriteAnimEnded(struct Sprite *sprite)
{
    if (sprite->animEnded)
        return TRUE;
    else
        return FALSE;
}

void UpdateObjectEventSpriteInvisibility(struct Sprite *sprite, bool8 invisible)
{
    u16 x, y;
    s16 x2, y2;

    sprite->invisible = invisible;

    if (sprite->coordOffsetEnabled)
    {
        x = sprite->x + sprite->x2 + sprite->centerToCornerVecX + gSpriteCoordOffsetX;
        y = sprite->y + sprite->y2 + sprite->centerToCornerVecY + gSpriteCoordOffsetY;
    }
    else
    {
        x = sprite->x + sprite->x2 + sprite->centerToCornerVecX;
        y = sprite->y + sprite->y2 + sprite->centerToCornerVecY;
    }

    x2 = x - (sprite->centerToCornerVecX >> 1);
    y2 = y - (sprite->centerToCornerVecY >> 1);

    if ((s16)x >= DISPLAY_WIDTH + 16 || x2 < -16)
        sprite->invisible = TRUE;
    if ((s16)y >= DISPLAY_HEIGHT + 16 || y2 < -16)
        sprite->invisible = TRUE;
}

#define sInvisible     data[2]
#define sAnimNum       data[3]
#define sAnimState     data[4]

void SpriteCB_VirtualObject(struct Sprite *sprite)
{
    VirtualObject_UpdateAnim(sprite);
    SetObjectSubpriorityByElevation(sprite->sVirtualObjElev, sprite, 1);
    UpdateObjectEventSpriteInvisibility(sprite, sprite->sInvisible);
}

// Unused
static void DestroyVirtualObjects(void)
{
    s32 i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        struct Sprite *sprite = &gSprites[i];
        if (sprite->inUse && sprite->callback == SpriteCB_VirtualObject)
            DestroySprite(sprite);
    }
}

static int GetVirtualObjectSpriteId(u8 virtualObjId)
{
    int i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        struct Sprite *sprite = &gSprites[i];
        if (sprite->inUse && sprite->callback == SpriteCB_VirtualObject && (u8)sprite->sVirtualObjId == virtualObjId)
            return i;
    }
    return MAX_SPRITES;
}

void TurnVirtualObject(u8 virtualObjId, u8 direction)
{
    u8 animNum;
    u8 spriteId = GetVirtualObjectSpriteId(virtualObjId);
    if (spriteId != MAX_SPRITES)
    {
        struct Sprite *sprite = &gSprites[spriteId];
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(direction));
    }
}

void SetVirtualObjectGraphics(u8 virtualObjId, u8 direction)
{
    int spriteId = GetVirtualObjectSpriteId(virtualObjId);
    if (spriteId != MAX_SPRITES)
    {
        struct Sprite *sprite = &gSprites[spriteId];
        const struct ObjectEventGraphicsInfo *info = GetObjectEventGraphicsInfo(direction);
        u16 baseBlock = sprite->oam.tileNum;
        sprite->oam = *info->oam;
        sprite->oam.tileNum = baseBlock;
        sprite->oam.paletteNum = info->paletteSlot;
        sprite->images = info->images;
        if (info->subspriteTables == NULL)
        {
            sprite->subspriteTables = NULL;
            sprite->subspriteTableNum = 0;
            sprite->subspriteMode = SUBSPRITES_OFF;
        }
        else
        {
            SetSubspriteTables(sprite, info->subspriteTables);
            sprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
        }
        StartSpriteAnim(sprite, 0);
    }
}

void SetVirtualObjectInvisibility(u8 virtualObjId, bool32 invisible)
{
    u8 spriteId = GetVirtualObjectSpriteId(virtualObjId);
    if (spriteId != MAX_SPRITES)
    {
        if (invisible)
            gSprites[spriteId].sInvisible = TRUE;
        else
            gSprites[spriteId].sInvisible = FALSE;
    }
}

bool32 IsVirtualObjectInvisible(u8 virtualObjId)
{
    u8 spriteId = GetVirtualObjectSpriteId(virtualObjId);
    if (spriteId == MAX_SPRITES)
        return FALSE;
    return gSprites[spriteId].sInvisible == TRUE;
}

void SetVirtualObjectSpriteAnim(u8 virtualObjId, u8 animNo)
{
    u8 spriteId = GetVirtualObjectSpriteId(virtualObjId);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].sAnimNum = animNo;
        gSprites[spriteId].sAnimState = 0;
    }
}

static void MoveUnionRoomObjectUp(struct Sprite *sprite)
{
    switch (sprite->sAnimState)
    {
    case 0:
        sprite->y2 = 0;
        sprite->sAnimState++;
        // fallthrough
    case 1:
        if ((sprite->y2 -= 8) == -DISPLAY_HEIGHT)
        {
            sprite->y2 = 0;
            sprite->sInvisible = TRUE;
            sprite->sAnimNum = 0;
            sprite->sAnimState = 0;
        }
        break;
    }
}

static void MoveUnionRoomObjectDown(struct Sprite *sprite)
{
    switch (sprite->sAnimState)
    {
    case 0:
        sprite->y2 = -DISPLAY_HEIGHT;
        sprite->sAnimState++;
        // fallthrough
    case 1:
        if ((sprite->y2 += 8) == 0)
        {
            sprite->sAnimNum = 0;
            sprite->sAnimState = 0;
        }
        break;
    }
}

static void VirtualObject_UpdateAnim(struct Sprite *sprite)
{
    switch (sprite->sAnimNum)
    {
    case UNION_ROOM_SPAWN_NONE:
        break;
    case UNION_ROOM_SPAWN_IN:
        MoveUnionRoomObjectDown(sprite);
        break;
    case UNION_ROOM_SPAWN_OUT:
        MoveUnionRoomObjectUp(sprite);
        break;
    default:
        sprite->sAnimNum = 0;
        AGB_ASSERT_EX(0, ABSPATH("evobjmv.c"), 13331);
    }
}

bool32 IsVirtualObjectAnimating(u8 virtualObjId)
{
    u8 spriteId = GetVirtualObjectSpriteId(virtualObjId);
    if (spriteId == MAX_SPRITES)
        return FALSE;
    if (gSprites[spriteId].sAnimNum)
        return TRUE;
    else
        return FALSE;
}

#undef sVirtualObjId
#undef sVirtualObjElev
#undef sInvisible
#undef sAnimNum
#undef sAnimState

u32 StartFieldEffectForObjectEvent(u8 fieldEffectId, struct ObjectEvent *objectEvent)
{
    ObjectEventGetLocalIdAndMap(objectEvent, (u8 *)&gFieldEffectArguments[0], (u8 *)&gFieldEffectArguments[1], (u8 *)&gFieldEffectArguments[2]);
    return FieldEffectStart(fieldEffectId);
}

void DoShadowFieldEffect(struct ObjectEvent *objectEvent)
{
    if (!objectEvent->hasShadow)
    {
        objectEvent->hasShadow = TRUE;
        StartFieldEffectForObjectEvent(FLDEFF_SHADOW, objectEvent);
    }
}

static void DoRippleFieldEffect(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    const struct ObjectEventGraphicsInfo *graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
    gFieldEffectArguments[0] = sprite->x;
    gFieldEffectArguments[1] = sprite->y + (graphicsInfo->height >> 1) - 2;
    gFieldEffectArguments[2] = 151;
    gFieldEffectArguments[3] = 3;
    FieldEffectStart(FLDEFF_RIPPLE);
}
