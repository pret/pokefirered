#ifndef GUARD_GLOBAL_FIELDMAP_H
#define GUARD_GLOBAL_FIELDMAP_H

#define OBJECT_EVENTS_COUNT 16

enum
{
    CONNECTION_SOUTH = 1,
    CONNECTION_NORTH,
    CONNECTION_WEST,
    CONNECTION_EAST,
    CONNECTION_DIVE,
    CONNECTION_EMERGE
};

typedef void (*TilesetCB)(void);

#define METATILE_ID(tileset, name) (METATILE_##tileset##_##name)

struct Tileset
{
    /*0x00*/ bool8 isCompressed;
    /*0x01*/ bool8 isSecondary;
    /*0x04*/ void *tiles;
    /*0x08*/ void *palettes;
    /*0x0c*/ void *metatiles;
    /*0x10*/ TilesetCB callback;
    /*0x14*/ void *metatileAttributes;
};

struct MapLayout
{
    /*0x00*/ s32 width;
    /*0x04*/ s32 height;
    /*0x08*/ u16 *border;
    /*0x0c*/ u16 *map;
    /*0x10*/ struct Tileset *primaryTileset;
    /*0x14*/ struct Tileset *secondaryTileset;
    /*0x18*/ u8 unk18;
    /*0x19*/ u8 unk19;
};

struct BackupMapLayout
{
    s32 Xsize;
    s32 Ysize;
    u16 *map;
};

union __attribute__((packed)) ObjectEventRange {
    u8 as_byte;
    struct __attribute__((packed)) {
        u8 x:4;
        u8 y:4;
    } __attribute__((aligned (1))) as_nybbles;
} __attribute__((aligned (1)));

struct ObjectEventTemplate
{
    /*0x00*/ u8 localId;
    /*0x01*/ u8 graphicsId;
    /*0x02*/ u8 unk2;
    /*0x04*/ s16 x;
    /*0x06*/ s16 y;
    /*0x08*/ u8 elevation;
    /*0x09*/ u8 movementType;
    /*0x0A*/ u16 movementRangeX:4;
             u16 movementRangeY:4;
    /*0x0C*/ u16 trainerType;
    /*0x0E*/ u16 trainerRange_berryTreeId;
    /*0x10*/ const u8 *script;
    /*0x14*/ u16 flagId;
};  /*size = 0x18*/

struct WarpEvent
{
    s16 x, y;
    s8 warpId;
    u8 mapGroup;
    u8 mapNum;
    u8 unk7;
};

struct CoordEvent
{
    s16 x, y;
    u8 unk4;
    u8 filler_5;
    u16 trigger;
    u16 index;
    u8 filler_A[0x2];
    u8 *script;
};

struct HiddenItemStruct
{
    u32 itemId:16;
    u32 hiddenItemId:8; // flag offset to determine flag lookup
    u32 quantity:7;
    u32 isUnderfoot:1;
};

union BgUnion
{ // carried over from diego's FR/LG work, seems to be the same struct
    // in gen 3, "kind" (0x3 in BgEvent struct) determines the method to read the union.
    u8 *script;

    // hidden item type probably
    struct HiddenItemStruct hiddenItemStr;
    u32 hiddenItem;

    // secret base type
    u32 secretBaseId;

};

struct BgEvent
{
    u16 x, y;
    u8 unk4;
    u8 kind;
    // 0x2 padding for the union beginning.
    union BgUnion bgUnion;
};

struct MapEvents
{
    u8 objectEventCount;
    u8 warpCount;
    u8 coordEventCount;
    u8 bgEventCount;

    struct ObjectEventTemplate *objectEvents;
    struct WarpEvent *warps;
    struct CoordEvent *coordEvents;
    struct BgEvent *bgEvents;
};

struct MapConnection
{
 /*0x00*/ u8 direction;
 /*0x04*/ u32 offset;
 /*0x08*/ u8 mapGroup;
 /*0x09*/ u8 mapNum;
};

struct MapConnections
{
    s32 count;
    struct MapConnection *connections;
};

struct MapHeader
{
    /* 0x00 */ struct MapLayout *mapLayout;
    /* 0x04 */ struct MapEvents *events;
    /* 0x08 */ u8 *mapScripts;
    /* 0x0C */ struct MapConnections *connections;
    /* 0x10 */ u16 music;
    /* 0x12 */ u16 mapLayoutId;
    /* 0x14 */ u8 regionMapSectionId;
    /* 0x15 */ u8 cave;
    /* 0x16 */ u8 weather;
    /* 0x17 */ u8 mapType;
    /* 0x18 */ u8 filler_18;
    /* 0x19 */ u8 escapeRope;
    /* 0x1A */ s8 flags;
    /* 0x1B */ u8 battleType;
};

struct ObjectEvent
{
    /*0x00*/ /* 0*/ u32 active:1;
             /* 1*/ u32 singleMovementActive:1;
             /* 2*/ u32 triggerGroundEffectsOnMove:1;
             /* 3*/ u32 triggerGroundEffectsOnStop:1;
             /* 4*/ u32 disableCoveringGroundEffects:1;
             /* 5*/ u32 landingJump:1;
             /* 6*/ u32 heldMovementActive:1;
             /* 7*/ u32 heldMovementFinished:1;
    /*0x01*/ /* 8*/ u32 frozen:1;
             /* 9*/ u32 facingDirectionLocked:1;
             /*10*/ u32 disableAnim:1;
             /*11*/ u32 enableAnim:1;
             /*12*/ u32 inanimate:1;
             /*13*/ u32 invisible:1;
             /*14*/ u32 offScreen:1;
             /*15*/ u32 trackedByCamera:1;
    /*0x02*/ /*16*/ u32 isPlayer:1;
             /*17*/ u32 hasReflection:1;
             /*18*/ u32 inShortGrass:1;
             /*19*/ u32 inShallowFlowingWater:1;
             /*20*/ u32 inSandPile:1;
             /*21*/ u32 inHotSprings:1;
             /*22*/ u32 hasShadow:1;
             /*23*/ u32 spriteAnimPausedBackup:1;
    /*0x03*/ /*24*/ u32 spriteAffineAnimPausedBackup:1;
             /*25*/ u32 disableJumpLandingGroundEffect:1;
             /*26*/ u32 fixedPriority:1;
             /*27*/ u32 hideReflection:1;
    /*0x04*/        u8 spriteId;
    /*0x05*/        u8 graphicsId;
    /*0x06*/        u8 animPattern;
    /*0x07*/        u8 trainerType;
    /*0x08*/        u8 localId;
    /*0x09*/        u8 mapNum;
    /*0x0A*/        u8 mapGroup;
    /*0x0B*/        u8 mapobj_unk_0B_0:4;
                    u8 elevation:4;
    /*0x0C*/        struct Coords16 initialCoords;
    /*0x10*/        struct Coords16 currentCoords;
    /*0x14*/        struct Coords16 previousCoords;
    /*0x18*/        u8 facingDirection:4;  //current direction?
    /*0x18*/        u8 placeholder18:4;
    /*0x19*/        union ObjectEventRange range;
    /*0x1A*/        u8 mapobj_unk_1A;
    /*0x1B*/        u8 mapobj_unk_1B;
    /*0x1C*/        u8 mapobj_unk_1C;
    /*0x1D*/        u8 trainerRange_berryTreeId;
    /*0x1E*/        u8 mapobj_unk_1E;
    /*0x1F*/        u8 mapobj_unk_1F;
    /*0x20*/        u8 mapobj_unk_20;
    /*0x21*/        u8 mapobj_unk_21;
    /*0x22*/        u8 animId;
    /*size = 0x24*/
};

struct ObjectEventGraphicsInfo
{
    /*0x00*/ u16 tileTag;
    /*0x02*/ u16 paletteTag1;
    /*0x04*/ u16 paletteTag2;
    /*0x06*/ u16 size;
    /*0x08*/ s16 width;
    /*0x0A*/ s16 height;
    /*0x0C*/ u8 paletteSlot:4;
             u8 shadowSize:2;
             u8 inanimate:1;
             u8 disableReflectionPaletteLoad:1;
    /*0x0D*/ u8 tracks;
    /*0x10*/ const struct OamData *oam;
    /*0x14*/ const struct SubspriteTable *subspriteTables;
    /*0x18*/ const union AnimCmd *const *anims;
    /*0x1C*/ const struct SpriteFrameImage *images;
    /*0x20*/ const union AffineAnimCmd *const *affineAnims;
};

#define PLAYER_AVATAR_FLAG_ON_FOOT   (1 << 0)
#define PLAYER_AVATAR_FLAG_MACH_BIKE (1 << 1)
#define PLAYER_AVATAR_FLAG_ACRO_BIKE (1 << 2)
#define PLAYER_AVATAR_FLAG_SURFING   (1 << 3)
#define PLAYER_AVATAR_FLAG_4         (1 << 4)
#define PLAYER_AVATAR_FLAG_5         (1 << 5)
#define PLAYER_AVATAR_FLAG_6         (1 << 6)
#define PLAYER_AVATAR_FLAG_DASH      (1 << 7)

enum
{
    ACRO_BIKE_NORMAL,
    ACRO_BIKE_TURNING,
    ACRO_BIKE_WHEELIE_STANDING,
    ACRO_BIKE_BUNNY_HOP,
    ACRO_BIKE_WHEELIE_MOVING,
    ACRO_BIKE_STATE5,
    ACRO_BIKE_STATE6,
};

enum
{
    COLLISION_LEDGE_JUMP = 6
};

struct PlayerAvatar /* 0x202E858 */
{
    /*0x00*/ u8 flags;
    /*0x01*/ u8 unk1; // used to be bike, but it's not that in Emerald and probably isn't here either. maybe transition flags?
    /*0x02*/ u8 runningState; // this is a static running state. 00 is not moving, 01 is turn direction, 02 is moving.
    /*0x03*/ u8 tileTransitionState; // this is a transition running state: 00 is not moving, 01 is transition between tiles, 02 means you are on the frame in which you have centered on a tile but are about to keep moving, even if changing directions. 2 is also used for a ledge hop, since you are transitioning.
    /*0x04*/ u8 spriteId;
    /*0x05*/ u8 objectEventId;
    /*0x06*/ u8 unk6;
    /*0x07*/ u8 gender;
    u8 acroBikeState;
    u8 unk9;
    u8 bikeFrameCounter;
    u8 unkB;
    u32 unkC;
    u32 unk10;
    u8 unk14[8];
    u8 unk1C[8];
    // TODO: rest of struct
};

struct Camera
{
    bool8 active:1;
    s32 x;
    s32 y;
};

extern struct ObjectEvent gObjectEvents[OBJECT_EVENTS_COUNT];
extern u8 gSelectedObjectEvent;
extern struct MapHeader gMapHeader;
extern struct PlayerAvatar gPlayerAvatar;
extern struct Camera gCamera;

#endif // GUARD_GLOBAL_FIELDMAP_H
