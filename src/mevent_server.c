#include "global.h"
#include "malloc.h"
#include "util.h"
#include "link.h"
#include "link_rfu.h"
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
    u32 unk_1C;
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

EWRAM_DATA struct mevent_srv_ish * gUnknown_203F3C0 = NULL;

u32 sub_814490C(struct mevent_srv_sub *);
u32 sub_81449E0(struct mevent_srv_sub *);

u32 sub_8144844(struct mevent_srv_sub * srv)
{
    return srv->unk_20(srv);
}

u32 sub_8144850(struct mevent_srv_sub * srv)
{
    return srv->unk_24(srv);
}

void sub_814485C(struct mevent_srv_sub * srv, u8 a1, u8 a2)
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
    srv->unk_1C = 0;
    srv->unk_18 = NULL;
    srv->unk_24 = sub_81449E0;
    srv->unk_20 = sub_814490C;
}

void sub_8144888(struct mevent_srv_sub * srv, u16 a1, u32 a2, u32 a3)
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

void sub_81448AC(struct mevent_srv_sub * srv, u16 a1, void * a2)
{
    srv->unk_00 = 0;
    srv->unk_06 = a1;
    srv->unk_08 = 0;
    srv->unk_0A = 0;
    srv->unk_0C = 0;
    srv->unk_18 = a2;
}

void sub_81448BC(u32 recv_idx, u16 * dest, size_t size)
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
    u16 buff[4];
    switch (srv->unk_00)
    {
        case 0:
            if (sub_81448D8(srv->unk_05))
            {
                u16 * r4;
                sub_81448BC(srv->unk_05, (r4 = buff), sizeof(buff));
                srv->unk_0C = r4[2];
                srv->unk_0A = r4[1];
                if (srv->unk_0C > 0x400)
                {
                    sub_80FA190();
                    return FALSE;
                }
                else if (srv->unk_06 != buff[0])
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
