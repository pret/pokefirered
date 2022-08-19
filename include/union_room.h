#ifndef GUARD_UNION_ROOM_H
#define GUARD_UNION_ROOM_H

#include "global.h"
#include "link_rfu.h"

// Return value of IsRequestedTypeAndSpeciesInPlayerParty
#define UR_TRADE_MATCH  0
#define UR_TRADE_NOTYPE 1
#define UR_TRADE_NOEGG  2

#define UROOM_MAX_GROUP_COUNT 8
#define UROOM_MAX_PARTY_SIZE  5

struct UnionGnameUnamePair
{
    struct RfuGameData gname;
    u8 ALIGNED(4) uname[PLAYER_NAME_LENGTH + 1];
};

struct UnkStruct_x1C
{
    struct UnionGnameUnamePair gname_uname;
    u8 active:1;
};

struct UnkStruct_x20
{
    struct UnionGnameUnamePair gname_uname;
    u16 field_18;
    u8 groupScheduledAnim:2;
    bool8 field_1A_1:1;
    u8 field_1B;
    u32 field_1C; // unused
};

// These arrays are dynamically allocated but must be
// represented as structs to match.
// Don't ask me why.

// FIXME: Find a way around this.

struct UnkStruct_Main0
{
    struct UnkStruct_x20 arr[0];
};

struct UnkStruct_Main4
{
    struct UnkStruct_x1C arr[0];
};

struct UnkStruct_Leader
{
    struct UnkStruct_Main0 * field_0;
    struct UnkStruct_Main4 * field_4;
    struct UnkStruct_Main0 * field_8;
    u8 state;
    u8 textState;
    u8 delayTimerAfterOk;
    u8 listWindowId;
    u8 bButtonCancelWindowId;
    u8 nPlayerModeWindowId;
    u8 listTaskId;
    u8 playerCount;
    u8 messageWindowId;
    u8 field_15;
    u8 field_16;
    u8 listenTaskId;
    u8 activity;
    u8 field_19;
    u16 field_1A;
};

struct UnkStruct_Group
{
    struct UnkStruct_Main0 * field_0;
    struct UnkStruct_Main4 * field_4;
    u8 state;
    u8 textState;
    u8 field_A; // unused
    u8 listWindowId;
    u8 bButtonCancelWindowId;
    u8 playerNameAndIdWindowId;
    u8 listTaskId;
    u8 leaderId;
    u8 field_10;
    u8 listenTaskId;
    u8 cardOrNews;
    u8 field_13; // referenced but never set
    u8 refreshTimer;
    u8 delayBeforePrint;
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
    /* 0x000 */ struct UnkStruct_Main0 * field_0;
    /* 0x004 */ struct UnkStruct_Main4 * field_4;
    /* 0x008 */ struct UnkStruct_Main0 * field_8;
    /* 0x00C */ struct UnkStruct_Main4 * field_C;
    /* 0x010 */ u16 field_10;
    /* 0x012 */ u16 field_12;
    /* 0x014 */ u8 state;
    /* 0x015 */ u8 stateAfterPrint;
    /* 0x016 */ u8 textState;
    /* 0x017 */ u8 field_17;
    /* 0x018 */ u8 field_18;
    /* 0x019 */ u8 field_19;
    /* 0x01A */ u8 field_1A;
    /* 0x01B */ u8 topListMenuWindowId;
    /* 0x01C */ u8 topListMenuListMenuId;
    /* 0x01D */ u8 tradeBoardSelectWindowId;
    /* 0x01E */ u8 tradeBoardDetailsWindowId;
    /* 0x01F */ u8 field_1F;
    /* 0x020 */ u8 field_20;
    /* 0x021 */ u8 spriteIds[40];
    /* 0x049 */ u8 field_49;
    /* 0x04A */ u8 tradeBoardListMenuId;

        // For communication with potential link partners
    /* 0x04C */ u16 playerSendBuffer[6];
    /* 0x058 */ u8 activityRequestStrbufs[4][11];
    /* 0x084 */ u16 partnerYesNoResponse;
    /* 0x086 */ u16 recvActivityRequest[3];  // activity[, species, level]
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

extern struct RfuGameCompatibilityData gPartnerTgtGnameSub;
extern u16 gUnionRoomOfferedSpecies;
extern u8 gUnionRoomRequestedMonType;

void StartUnionRoomBattle(u16 battleFlags);
u8 UnionRoom_CreateTask_CallCB2ReturnFromLinkTrade(void);

#endif //GUARD_UNION_ROOM_H
