#include "global.h"
#include "malloc.h"
#include "decompress.h"
#include "util.h"
#include "link.h"
#include "link_rfu.h"
#include "overworld.h"
#include "script.h"
#include "battle_tower.h"
#include "mystery_event_script.h"
#include "mevent.h"
#include "mevent_server.h"

extern u16 gBlockRecvBuffer[][128];

struct mevent_srv_ish
{
    u32 unk_00;
    u32 unk_04;
    u32 mainseqno;
    u32 unk_0C;
    u32 unk_10;
    void * unk_14;
    void * unk_18;
    void * unk_1C;
    void * unk_20;
    struct mevent_srv_sub unk_24;
};

struct mevent_cmd
{
    u32 instr;
    bool32 flag;
    u32 parameter;
};

EWRAM_DATA struct mevent_srv_ish * gUnknown_203F3C0 = NULL;

void mevent_srv_ish_init(struct mevent_srv_ish *, u32, u32);
u32 mevent_srv_ish_exec(struct mevent_srv_ish *);
void sub_8144BC0(struct mevent_srv_ish *);
extern const u8 gUnknown_84687E0[];

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

void mevent_srv_ish_init(struct mevent_srv_ish * svr, u32 a1, u32 a2)
{
    svr->unk_00 = 0;
    svr->mainseqno = 0;
    svr->unk_0C = 0;
    svr->unk_14 = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->unk_18 = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->unk_1C = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->unk_20 = AllocZeroed(0x40);
    sub_814485C(&svr->unk_24, a1, a2);
}

void sub_8144BC0(struct mevent_srv_ish * svr)
{
    Free(svr->unk_14);
    Free(svr->unk_18);
    Free(svr->unk_1C);
    Free(svr->unk_20);
}

void sub_8144BE4(struct mevent_srv_ish * svr)
{
    memcpy(svr->unk_1C, svr->unk_18, ME_SEND_BUF_SIZE);
    svr->unk_10 = 0;
}

void sub_8144C00(struct mevent_srv_ish * svr, u32 a1, u32 a2)
{
    CpuFill32(0, svr->unk_14, ME_SEND_BUF_SIZE);
    *(u32 *)svr->unk_14 = a2;
    sub_8144888(&svr->unk_24, a1, svr->unk_14, 4);
}

// funcs in array gUnknown_8466F60

u32 sub_8144C34(struct mevent_srv_ish * svr)
{
    memcpy(svr->unk_1C, gUnknown_84687E0, ME_SEND_BUF_SIZE);
    svr->unk_10 = 0;
    svr->mainseqno = 4;
    svr->unk_0C = 0;
    return 0;
}

u32 sub_8144C5C(struct mevent_srv_ish * svr)
{
    return 6;
}

u32 sub_8144C60(struct mevent_srv_ish * svr)
{
    if (sub_8144844(&svr->unk_24))
    {
        svr->mainseqno = 4;
        svr->unk_0C = 0;
    }
    return 1;
}

u32 sub_8144C80(struct mevent_srv_ish * svr)
{
    if (sub_8144850(&svr->unk_24))
    {
        svr->mainseqno = 4;
        svr->unk_0C = 0;
    }
    return 1;
}

u32 sub_8144CA0(struct mevent_srv_ish * svr)
{
    u32 * r2 = (u32 *)svr->unk_1C + 2 * svr->unk_10;
    ++svr->unk_10;
    switch (r2[0])
    {
        case 0:
            break;
        case 1:
            svr->unk_04 = r2[1];
            svr->mainseqno = 1;
            svr->unk_0C = 0;
            break;
        case 2:
            sub_81448AC(&svr->unk_24, r2[1], svr->unk_18);
            svr->mainseqno = 2;
            svr->unk_0C = 0;
            break;
        case 3:
            svr->mainseqno = 3;
            svr->unk_0C = 0;
            break;
        case 20:
            sub_8144888(&svr->unk_24, 0x14, svr->unk_14, 0);
            svr->mainseqno = 3;
            svr->unk_0C = 0;
            break;
        case 19:
            sub_8144C00(svr, 0x12, GetGameStat(r2[1]));
            svr->mainseqno = 3;
            svr->unk_0C = 0;
            break;
        case 6:
            if (svr->unk_04 == 0)
                sub_8144BE4(svr);
            break;
        case 7:
            if (svr->unk_04 == 1)
                sub_8144BE4(svr);
            break;
        case 4:
            sub_8144BE4(svr);
            break;
        case 5:
            memcpy(svr->unk_20, svr->unk_18, 0x40);
            svr->mainseqno = 5;
            svr->unk_0C = 0;
            return 2;
        case 11:
            memcpy(svr->unk_20, svr->unk_18, 0x40);
            svr->mainseqno = 5;
            svr->unk_0C = 0;
            return 3;
        case 12:
            memcpy(svr->unk_20, svr->unk_18, 0x40);
            svr->mainseqno = 5;
            svr->unk_0C = 0;
            return 5;
        case 13:
            svr->mainseqno = 5;
            svr->unk_0C = 0;
            return 4;
        case 8:
            sub_81442CC(svr->unk_14);
            sub_8144888(&svr->unk_24, 0x11, svr->unk_14, 0x64);
            break;
        case 14:
            sub_8144C00(svr, 0x13, svr->unk_04);
            break;
        case 10:
            sub_8143F68(svr->unk_18);
            break;
        case 9:
            if (!sub_8143EF4(svr->unk_18))
            {
                sub_8143DC8(svr->unk_18);
                sub_8144C00(svr, 0x13, 0);
            }
            else
                sub_8144C00(svr, 0x13, 1);
            break;
        case 15:
            svr->mainseqno = 6;
            svr->unk_0C = 0;
            break;
        case 16:
            sub_8144254(svr->unk_18);
            break;
        case 17:
            sub_8069EA4(svr->unk_18, 1000);
            break;
        case 18:
            memcpy(gSaveBlock2Ptr->unk_4A0, svr->unk_18, 0xbc);
            sub_80E7490();
            break;
        case 21:
            memcpy(gDecompressionBuffer, svr->unk_18, ME_SEND_BUF_SIZE);
            svr->mainseqno = 7;
            svr->unk_0C = 0;
            break;
    }

    return 1;
}

u32 sub_8144E6C(struct mevent_srv_ish * svr)
{
    if (svr->unk_0C)
    {
        svr->mainseqno = 4;
        svr->unk_0C = 0;
    }
    return 1;
}

u32 sub_8144E84(struct mevent_srv_ish * svr)
{
    switch (svr->unk_0C)
    {
        case 0:
            sub_80DA89C(svr->unk_18);
            ++svr->unk_0C;
            break;
        case 1:
            if (!sub_80DA8B0(&svr->unk_04))
            {
                svr->mainseqno = 4;
                svr->unk_0C = 0;
            }
            break;
    }
    return 1;
}

u32 sub_8144EBC(struct mevent_srv_ish * svr)
{
    u32 (*func)(u32 *, struct SaveBlock2 *, struct SaveBlock1 *) = (void *)gDecompressionBuffer;
    if (func(&svr->unk_04, gSaveBlock2Ptr, gSaveBlock1Ptr) == 1)
    {
        svr->mainseqno = 4;
        svr->unk_0C = 0;
    }
    return 1;
}

u32 mevent_srv_ish_exec(struct mevent_srv_ish * svr)
{
    u32 (*funcs[])(struct mevent_srv_ish *) = {
        sub_8144C34,
            sub_8144C5C,
            sub_8144C60,
            sub_8144C80,
            sub_8144CA0,
            sub_8144E6C,
            sub_8144E84,
            sub_8144EBC
    };
    return funcs[svr->mainseqno](svr);
}
