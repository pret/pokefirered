#ifndef GUARD_UNION_ROOM_H
#define GUARD_UNION_ROOM_H

#include "global.h"
#include "link_rfu.h"

struct UnkStruct_Shared
{
    struct GFtgtGname gname;
    u8 ALIGNED(4) playerName[PLAYER_NAME_LENGTH];
};

struct UnkStruct_x1C
{
    struct UnkStruct_Shared unk0;
    u8 unk18:1;
};

struct UnkStruct_x20
{
    struct UnkStruct_Shared unk;
    u16 field_18;
    u8 field_1A_0:2;
    u8 field_1A_1:1;
    u8 field_1B;
    u8 field_1D;
    u8 field_1E;
    u8 field_1F;
};

struct UnkStruct_Main0
{
    struct UnkStruct_x20 arr[8];
};

struct UnkStruct_Main4
{
    struct UnkStruct_x1C arr[5];
};

struct UnkStruct_Main8
{
    struct UnkStruct_x20 arr[5];
};

struct UnkStruct_Leader
{
    struct UnkStruct_Main0 *field_0;
    struct UnkStruct_Main4 *field_4;
    struct UnkStruct_Main8 *field_8;
    u8 state;
    u8 textState;
    u8 field_E;
    u8 listWindowId;
    u8 field_10;
    u8 field_11;
    u8 listTaskId;
    u8 field_13;
    u8 field_14;
    u8 field_15;
    u8 field_16;
    u8 field_17;
    u8 field_18;
    u8 field_19;
    u16 field_1A;
};

struct UnkStruct_Group
{
    struct UnkStruct_Main0 *field_0;
    struct UnkStruct_Main4 *field_4;
    u8 state;
    u8 textState;
    u8 field_A;
    u8 listWindowId;
    u8 field_C;
    u8 field_D;
    u8 listTaskId;
    u8 field_F;
    u8 field_10;
    u8 field_11;
    u8 field_12;
    u8 field_13;
    u8 field_14;
    u8 field_15;
};

struct UnionObj
{
    u8 state;
    u8 gfxId;
    s8 animState;
    u8 schedAnim;
};

struct UnkStruct_URoom
{
    /* 0x000 */ struct UnkStruct_Main0 *field_0;
    /* 0x004 */ struct UnkStruct_Main4 *field_4;
    /* 0x008 */ struct UnkStruct_Main0 *field_8;
    /* 0x00C */ struct UnkStruct_Main4 *field_C;
    /* 0x010 */ u16 field_10;
    /* 0x012 */ u16 field_12;
    /* 0x014 */ u8 state;
    /* 0x015 */ u8 stateAfterPrint;
    /* 0x016 */ u8 textState;
    /* 0x017 */ u8 field_17;
    /* 0x018 */ u8 field_18;
    /* 0x019 */ u8 field_19;
    /* 0x01A */ u8 field_1A;
    /* 0x01B */ u8 field_1B;
    /* 0x01C */ u8 field_1C;
    /* 0x01D */ u8 field_1D;
    /* 0x01E */ u8 field_1E;
    /* 0x01F */ u8 field_1F;
    /* 0x020 */ u8 field_20;
    /* 0x021 */ u8 spriteIds[40];
    /* 0x049 */ u8 field_49;
    /* 0x04A */ u8 field_4A;
    /* 0x04C */ u16 field_4C[6];
    /* 0x058 */ u8 field_58[4][11];
    /* 0x084 */ u16 field_98;
    /* 0x086 */ u16 field_9A[3];
    /* 0x08C */ struct UnionObj unionObjs[8];
    /* 0x0AC */ u8 trainerCardStrbufs[12][15];
    /* 0x160 */ u8 field_174[48];
    /* 0x190 */ u8 field_1A4[200];
};

union UnkUnion_Main
{
    struct UnkStruct_Leader * leader;
    struct UnkStruct_Group * group;
    struct UnkStruct_URoom * uRoom;
};

struct UnionRoomTrade
{
    u16 field_0;
    u16 type;
    u32 playerPersonality;
    u8 field_8;
    u8 field_9;
    u16 playerSpecies;
    u16 playerLevel;
    u16 species;
    u16 level;
    u16 field_12;
    u32 personality;
};

extern struct GFtgtGnameSub gUnknown_203B064;
extern u16 gUnionRoomOfferedSpecies;
extern u8 gUnionRoomRequestedMonType;

#endif //GUARD_UNION_ROOM_H
