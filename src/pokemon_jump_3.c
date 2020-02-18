#include "global.h"
#include "link_rfu.h"
#include "pokemon_jump.h"

struct MonInfoPacket
{
    u8 id; // packet id
    u16 species;
    u32 personality;
    u32 otId;
};

void sub_8149A6C(struct PokemonJump1_MonInfo *arg0)
{
    struct MonInfoPacket packet;
    packet.id = 1,
    packet.species = arg0->species,
    packet.otId = arg0->otId,
    packet.personality = arg0->personality,
        RfuPrepareSend0x2f00(&packet);
}

bool32 sub_8149A90(int multiplayerId, struct PokemonJump1_MonInfo *arg0)
{
    struct MonInfoPacket packet;

    if ((gRecvCmds[multiplayerId][0] & 0xFF00) != 0x2F00)
        return FALSE;

    memcpy(&packet, &gRecvCmds[multiplayerId][1], sizeof(packet));
    if (packet.id == 1)
    {
        arg0->species = packet.species;
        arg0->otId = packet.otId;
        arg0->personality = packet.personality;
        return TRUE;
    }

    return FALSE;
}

struct UnkPacket2
{
    u8 id; // packet id
    u32 unk4;
    u32 unk8;
};

void sub_8149AE0(u32 arg0)
{
    struct UnkPacket2 packet;
    packet.id = 2;
    packet.unk4 = arg0;
    RfuPrepareSend0x2f00(&packet);
}

struct UnkPacket3
{
    u8 id; // packet id
    u8 unk1;
    u8 unk2;
    u8 unk3_0:5;
    u8 unk3_1:3;
    u16 unk4;
    u16 unk6;
    u32 unk8_0:15;
    u32 unk8_1:17;
};

void sub_8149AF8(struct PokemonJump1_82E4 *arg0, struct PokemonJump1Sub *arg1)
{
    struct UnkPacket3 packet;
    packet.id = 3;
    packet.unk8_1 = arg1->unk8;
    packet.unk3_0 = arg1->unk1;
    packet.unk1 = arg1->unk0;
    packet.unk6 = arg1->unk2;
    packet.unk8_0 = arg1->unk4;
    packet.unk2 = arg0->unk10;
    packet.unk3_1 = arg0->unk14;
    packet.unk4 = arg0->unkE;
    RfuPrepareSend0x2f00(&packet);
}

bool32 sub_8149B7C(struct PokemonJump1_82E4 *arg0, struct PokemonJump1Sub *arg1)
{
    struct UnkPacket3 packet;

    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00)
        return FALSE;

    memcpy(&packet, &gRecvCmds[0][1], sizeof(packet));
    if (packet.id != 3)
        return FALSE;

    arg1->unk8 = packet.unk8_1;
    arg1->unk1 = packet.unk3_0;
    arg1->unk0 = packet.unk1;
    arg1->unk2 = packet.unk6;
    arg1->unk4 = packet.unk8_0;
    arg0->unk10 = packet.unk2;
    arg0->unk14 = packet.unk3_1;
    arg0->unkE = packet.unk4;
    return TRUE;
}

struct UnkPacket4
{
    u8 id; // packet id
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u16 unk4;
    u8 unk6;
    u16 unk8;
};

void sub_8149BF4(struct PokemonJump1_82E4 *arg0, u8 arg1, u16 arg2)
{
    struct UnkPacket4 packet;
    packet.id = 4;
    packet.unk1 = arg0->unk10;
    packet.unk2 = arg0->unk14;
    packet.unk3 = arg0->unk18;
    packet.unk4 = arg0->unkE;
    packet.unk6 = arg1;
    packet.unk8 = arg2;
    RfuPrepareSend0x2f00(&packet);
}

bool32 sub_8149C24(struct PokemonJump1_82E4 *arg0, int multiplayerId, u8 *arg2, u16 *arg3)
{
    struct UnkPacket4 packet;

    if ((gRecvCmds[multiplayerId][0] & 0xFF00) != 0x2F00)
        return FALSE;

    memcpy(&packet, &gRecvCmds[multiplayerId][1], sizeof(packet));
    if (packet.id != 4)
        return FALSE;

    arg0->unk10 = packet.unk1;
    arg0->unk14 = packet.unk2;
    arg0->unk18 = packet.unk3;
    arg0->unkE = packet.unk4;
    *arg2 = packet.unk6;
    *arg3 = packet.unk8;
    return TRUE;
}

bool32 sub_8149C90(struct PokemonJump1_82E4 *arg0, int multiplayerId)
{
    struct UnkPacket4 packet;

    if ((gRecvCmds[multiplayerId][0] & 0xFF00) != 0x2F00)
        return FALSE;

    memcpy(&packet, &gRecvCmds[multiplayerId][1], sizeof(packet));
    if (packet.id != 4)
        return FALSE;

    arg0->unk10 = packet.unk1;
    arg0->unk14 = packet.unk2;
    arg0->unk18 = packet.unk3;
    arg0->unkE = packet.unk4;
    return TRUE;
}
