#include "global.h"
#include "malloc.h"
#include "decompress.h"
#include "util.h"
#include "link.h"
#include "link_rfu.h"
#include "overworld.h"
#include "script.h"
#include "battle_tower.h"
#include "mevent.h"

extern u16 gBlockRecvBuffer[][128];

struct mevent_srv_sub
{
    s32 unk_00;
    u8 unk_04;
    u8 unk_05;
    u16 unk_06;
    u16 unk_08;
    u16 unk_0A;
    u16 unk_0C;
    u16 unk_0E;
    u16 unk_10;
    u16 unk_12;
    u16 unk_14;
    void * unk_18;
    void * unk_1C;
    u32 (*unk_20)(struct mevent_srv_sub *);
    u32 (*unk_24)(struct mevent_srv_sub *);
};

struct mevent_srv_ish
{
    u32 unk_00;
    u32 unk_04;
    u32 unk_08;
    u32 unk_0C;
    u32 unk_10;
    void * unk_14;
    void * unk_18;
    void * unk_1C;
    void * unk_20;
    struct mevent_srv_sub unk_24;
};

struct send_recv_buff
{
    u16 unk0;
    u16 unk2;
    u16 unk4;
};

EWRAM_DATA struct mevent_srv_ish * gUnknown_203F3C0 = NULL;

u32 sub_814490C(struct mevent_srv_sub *);
u32 sub_81449E0(struct mevent_srv_sub *);
void mevent_srv_ish_init(struct mevent_srv_ish *, u32, u32);
u32 mevent_srv_ish_exec(struct mevent_srv_ish *);
void sub_8144BC0(struct mevent_srv_ish *);

extern u8 gUnknown_84687E0[0x400];

u32 sub_8144844(struct mevent_srv_sub * srv)
{
    return srv->unk_20(srv);
}

u32 sub_8144850(struct mevent_srv_sub * srv)
{
    return srv->unk_24(srv);
}

void sub_814485C(struct mevent_srv_sub * srv, u32 a1, u32 a2)
{
    srv->unk_04 = a1;
    srv->unk_05 = a2;
    srv->unk_00 = 0;
    srv->unk_12 = 0;
    srv->unk_14 = 0;
    srv->unk_10 = 0;
    srv->unk_0A = 0;
    srv->unk_0C = 0;
    srv->unk_08 = 0;
    srv->unk_1C = NULL;
    srv->unk_18 = NULL;
    srv->unk_24 = sub_81449E0;
    srv->unk_20 = sub_814490C;
}

void sub_8144888(struct mevent_srv_sub * srv, u32 a1, void * a2, u32 a3)
{
    srv->unk_00 = 0;
    srv->unk_0E = a1;
    srv->unk_10 = 0;
    srv->unk_12 = 0;
    if (a3 != 0)
        srv->unk_14 = a3;
    else
        srv->unk_14 = 0x400;
    srv->unk_1C = a2;
}

void sub_81448AC(struct mevent_srv_sub * srv, u32 a1, void * a2)
{
    srv->unk_00 = 0;
    srv->unk_06 = a1;
    srv->unk_08 = 0;
    srv->unk_0A = 0;
    srv->unk_0C = 0;
    srv->unk_18 = a2;
}

void sub_81448BC(u32 recv_idx, void * dest, size_t size)
{
    memcpy(dest, gBlockRecvBuffer[recv_idx], size);
}

bool32 sub_81448D8(u32 recv_idx)
{
    if ((GetBlockReceivedStatus() >> recv_idx) & 1)
        return TRUE;
    else
        return FALSE;
}

void sub_81448FC(u32 recv_idx)
{
    ResetBlockReceivedFlag(recv_idx);
}

bool32 sub_814490C(struct mevent_srv_sub * srv)
{
    struct send_recv_buff buff;

    switch (srv->unk_00)
    {
        case 0:
            if (sub_81448D8(srv->unk_05))
            {
                sub_81448BC(srv->unk_05, &buff, sizeof(buff));
                srv->unk_0C = buff.unk4;
                srv->unk_0A = buff.unk2;
                if (srv->unk_0C > 0x400)
                {
                    sub_80FA190();
                    return FALSE;
                }
                else if (srv->unk_06 != buff.unk0)
                {
                    sub_80FA190();
                    return FALSE;
                }
                else
                {
                    srv->unk_08 = 0;
                    sub_81448FC(srv->unk_05);
                    ++srv->unk_00;
                }
            }
            break;
        case 1:
            if (sub_81448D8(srv->unk_05))
            {
                size_t r3 = srv->unk_08 * 252;
                if (srv->unk_0C - r3 <= 252)
                {
                    sub_81448BC(srv->unk_05, srv->unk_18 + r3, srv->unk_0C - r3);
                    ++srv->unk_08;
                    ++srv->unk_00;
                }
                else
                {
                    sub_81448BC(srv->unk_05, srv->unk_18 + r3, 252);
                    ++srv->unk_08;
                }
                sub_81448FC(srv->unk_05);
            }
            break;
        case 2:
            if (CalcCRC16WithTable(srv->unk_18, srv->unk_0C) != srv->unk_0A)
            {
                sub_80FA190();
                return FALSE;
            }
            else
            {
                srv->unk_00 = 0;
                return TRUE;
            }
            break;

    }

    return FALSE;
}

bool32 sub_81449E0(struct mevent_srv_sub * srv)
{
    struct send_recv_buff buff;

    switch (srv->unk_00)
    {
        case 0:
            if (sub_800A4BC())
            {
                buff.unk0 = srv->unk_0E;
                buff.unk4 = srv->unk_14;
                buff.unk2 = CalcCRC16WithTable(srv->unk_1C, srv->unk_14);
                srv->unk_12 = buff.unk2;
                srv->unk_10 = 0;
                SendBlock(0, &buff, sizeof(buff));
                ++srv->unk_00;
            }
            break;
        case 1:
            if (sub_800A4BC())
            {
                if (sub_81448D8(srv->unk_04))
                {
                    size_t r3;
                    sub_81448FC(srv->unk_04);
                    r3 = 252 * srv->unk_10;
                    if (srv->unk_14 - r3 <= 252)
                    {
                        SendBlock(0, srv->unk_1C + r3, srv->unk_14 - r3);
                        ++srv->unk_10;
                        ++srv->unk_00;
                    }
                    else
                    {
                        SendBlock(0, srv->unk_1C + r3, 252);
                        ++srv->unk_10;
                    }
                }
            }
            break;
        case 2:
            if (sub_800A4BC())
            {
                if (CalcCRC16WithTable(srv->unk_1C, srv->unk_14) != srv->unk_12)
                    sub_80FA190();
                else
                    ++srv->unk_00;
            }
            break;
        case 3:
            if (sub_81448D8(srv->unk_04))
            {
                sub_81448FC(srv->unk_04);
                srv->unk_00 = 0;
                return TRUE;
            }
            break;
    }

    return FALSE;
}

void sub_8144AEC(void)
{
    gUnknown_203F3C0 = AllocZeroed(sizeof(struct mevent_srv_ish));
    mevent_srv_ish_init(gUnknown_203F3C0, 1, 0);
}

u32 sub_8144B0C(u16 * a0)
{
    u32 result;
    if (gUnknown_203F3C0 == NULL)
        return 6;
    result = mevent_srv_ish_exec(gUnknown_203F3C0);
    if (result == 6)
    {
        *a0 = gUnknown_203F3C0->unk_04;
        sub_8144BC0(gUnknown_203F3C0);
        Free(gUnknown_203F3C0);
        gUnknown_203F3C0 = NULL;
    }
    return result;
}

void sub_8144B48(void)
{
    gUnknown_203F3C0->unk_0C++;
}

void * sub_8144B58(void)
{
    return gUnknown_203F3C0->unk_20;
}

void sub_8144B64(u32 a0)
{
    gUnknown_203F3C0->unk_04 = a0;
}

void mevent_srv_ish_init(struct mevent_srv_ish * srv, u32 a1, u32 a2)
{
    srv->unk_00 = 0;
    srv->unk_08 = 0;
    srv->unk_0C = 0;
    srv->unk_14 = AllocZeroed(0x400);
    srv->unk_18 = AllocZeroed(0x400);
    srv->unk_1C = AllocZeroed(0x400);
    srv->unk_20 = AllocZeroed(0x40);
    sub_814485C(&srv->unk_24, a1, a2);
}

void sub_8144BC0(struct mevent_srv_ish * srv)
{
    Free(srv->unk_14);
    Free(srv->unk_18);
    Free(srv->unk_1C);
    Free(srv->unk_20);
}

void sub_8144BE4(struct mevent_srv_ish * srv)
{
    memcpy(srv->unk_1C, srv->unk_18, 0x400);
    srv->unk_10 = 0;
}

void sub_8144C00(struct mevent_srv_ish * srv, u32 a1, u32 a2)
{
    CpuFill32(0, srv->unk_14, 0x400);
    *(u32 *)srv->unk_14 = a2;
    sub_8144888(&srv->unk_24, a1, srv->unk_14, 4);
}

// funcs in array gUnknown_8466F60

u32 sub_8144C34(struct mevent_srv_ish * srv)
{
    memcpy(srv->unk_1C, gUnknown_84687E0, sizeof(gUnknown_84687E0));
    srv->unk_10 = 0;
    srv->unk_08 = 4;
    srv->unk_0C = 0;
    return 0;
}

u32 sub_8144C5C(struct mevent_srv_ish * srv)
{
    return 6;
}

u32 sub_8144C60(struct mevent_srv_ish * srv)
{
    if (sub_8144844(&srv->unk_24))
    {
        srv->unk_08 = 4;
        srv->unk_0C = 0;
    }
    return 1;
}

u32 sub_8144C80(struct mevent_srv_ish * srv)
{
    if (sub_8144850(&srv->unk_24))
    {
        srv->unk_08 = 4;
        srv->unk_0C = 0;
    }
    return 1;
}

u32 sub_8144CA0(struct mevent_srv_ish * srv)
{
    u32 * r2 = (u32 *)srv->unk_1C + 2 * srv->unk_10;
    ++srv->unk_10;
    switch (r2[0])
    {
        case 0:
            break;
        case 1:
            srv->unk_04 = r2[1];
            srv->unk_08 = 1;
            srv->unk_0C = 0;
            break;
        case 2:
            sub_81448AC(&srv->unk_24, r2[1], srv->unk_18);
            srv->unk_08 = 2;
            srv->unk_0C = 0;
            break;
        case 3:
            srv->unk_08 = 3;
            srv->unk_0C = 0;
            break;
        case 20:
            sub_8144888(&srv->unk_24, 0x14, srv->unk_14, 0);
            srv->unk_08 = 3;
            srv->unk_0C = 0;
            break;
        case 19:
            sub_8144C00(srv, 0x12, GetGameStat(r2[1]));
            srv->unk_08 = 3;
            srv->unk_0C = 0;
            break;
        case 6:
            if (srv->unk_04 == 0)
                sub_8144BE4(srv);
            break;
        case 7:
            if (srv->unk_04 == 1)
                sub_8144BE4(srv);
            break;
        case 4:
            sub_8144BE4(srv);
            break;
        case 5:
            memcpy(srv->unk_20, srv->unk_18, 0x40);
            srv->unk_08 = 5;
            srv->unk_0C = 0;
            return 2;
        case 11:
            memcpy(srv->unk_20, srv->unk_18, 0x40);
            srv->unk_08 = 5;
            srv->unk_0C = 0;
            return 3;
        case 12:
            memcpy(srv->unk_20, srv->unk_18, 0x40);
            srv->unk_08 = 5;
            srv->unk_0C = 0;
            return 5;
        case 13:
            srv->unk_08 = 5;
            srv->unk_0C = 0;
            return 4;
        case 8:
            sub_81442CC(srv->unk_14);
            sub_8144888(&srv->unk_24, 0x11, srv->unk_14, 0x64);
            break;
        case 14:
            sub_8144C00(srv, 0x13, srv->unk_04);
            break;
        case 10:
            sub_8143F68(srv->unk_18);
            break;
        case 9:
            if (!sub_8143EF4(srv->unk_18))
            {
                sub_8143DC8(srv->unk_18);
                sub_8144C00(srv, 0x13, 0);
            }
            else
                sub_8144C00(srv, 0x13, 1);
            break;
        case 15:
            srv->unk_08 = 6;
            srv->unk_0C = 0;
            break;
        case 16:
            sub_8144254(srv->unk_18);
            break;
        case 17:
            sub_8069EA4(srv->unk_18, 1000);
            break;
        case 18:
            memcpy(gSaveBlock2Ptr->unk_4A0, srv->unk_18, 0xbc);
            sub_80E7490();
            break;
        case 21:
            memcpy(gDecompressionBuffer, srv->unk_18, 0x400);
            srv->unk_08 = 7;
            srv->unk_0C = 0;
            break;
    }

    return 1;
}
