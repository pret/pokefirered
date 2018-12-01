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

EWRAM_DATA struct mevent_srv_ish * gUnknown_203F3C0 = NULL;
EWRAM_DATA struct mevent_srv_common * gUnknown_203F3C4 = NULL;

static void mevent_srv_ish_init(struct mevent_srv_ish *, u32, u32);
static u32 mevent_srv_ish_exec(struct mevent_srv_ish *);
static void sub_8144BC0(struct mevent_srv_ish *);
static void mevent_srv_init_common(struct mevent_srv_common *, const void *, u32, u32);
static void mevent_srv_free_resources(struct mevent_srv_common *);
static u32 sub_8145600(struct mevent_srv_common *);

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

static void mevent_srv_ish_init(struct mevent_srv_ish * svr, u32 a1, u32 a2)
{
    svr->unk_00 = 0;
    svr->mainseqno = 0;
    svr->unk_0C = 0;
    svr->unk_14 = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->unk_18 = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->cmdBuffer = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->unk_20 = AllocZeroed(0x40);
    mevent_srv_sub_init(&svr->unk_24, a1, a2);
}

static void sub_8144BC0(struct mevent_srv_ish * svr)
{
    Free(svr->unk_14);
    Free(svr->unk_18);
    Free(svr->cmdBuffer);
    Free(svr->unk_20);
}

static void sub_8144BE4(struct mevent_srv_ish * svr)
{
    memcpy(svr->cmdBuffer, svr->unk_18, ME_SEND_BUF_SIZE);
    svr->cmdidx = 0;
}

static void sub_8144C00(struct mevent_srv_ish * svr, u32 a1, u32 a2)
{
    CpuFill32(0, svr->unk_14, ME_SEND_BUF_SIZE);
    *(u32 *)svr->unk_14 = a2;
    mevent_srv_sub_init_send(&svr->unk_24, a1, svr->unk_14, 4);
}

static u32 ish_mainseq_0(struct mevent_srv_ish * svr)
{
    // init
    memcpy(svr->cmdBuffer, gUnknown_84687E0, ME_SEND_BUF_SIZE);
    svr->cmdidx = 0;
    svr->mainseqno = 4;
    svr->unk_0C = 0;
    return 0;
}

static u32 ish_mainseq_1(struct mevent_srv_ish * svr)
{
    // done
    return 6;
}

static u32 ish_mainseq_2(struct mevent_srv_ish * svr)
{

    if (mevent_srv_sub_recv(&svr->unk_24))
    {
        svr->mainseqno = 4;
        svr->unk_0C = 0;
    }
    return 1;
}

static u32 ish_mainseq_3(struct mevent_srv_ish * svr)
{
    if (mevent_srv_sub_send(&svr->unk_24))
    {
        svr->mainseqno = 4;
        svr->unk_0C = 0;
    }
    return 1;
}

static u32 ish_mainseq_4(struct mevent_srv_ish * svr)
{
    struct mevent_cmd_ish * cmd = &svr->cmdBuffer[svr->cmdidx];
    ++svr->cmdidx;
    switch (cmd->instr)
    {
        case 0:
            break;
        case 1:
            svr->unk_04 = cmd->parameter;
            svr->mainseqno = 1;
            svr->unk_0C = 0;
            break;
        case 2:
            mevent_srv_sub_init_recv(&svr->unk_24, cmd->parameter, svr->unk_18);
            svr->mainseqno = 2;
            svr->unk_0C = 0;
            break;
        case 3:
            svr->mainseqno = 3;
            svr->unk_0C = 0;
            break;
        case 20:
            mevent_srv_sub_init_send(&svr->unk_24, 0x14, svr->unk_14, 0);
            svr->mainseqno = 3;
            svr->unk_0C = 0;
            break;
        case 19:
            sub_8144C00(svr, 0x12, GetGameStat(cmd->parameter));
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
            mevent_srv_sub_init_send(&svr->unk_24, 0x11, svr->unk_14, 0x64);
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

static u32 ish_mainseq_5(struct mevent_srv_ish * svr)
{
    if (svr->unk_0C)
    {
        svr->mainseqno = 4;
        svr->unk_0C = 0;
    }
    return 1;
}

static u32 ish_mainseq_6(struct mevent_srv_ish * svr)
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

static u32 ish_mainseq_7(struct mevent_srv_ish * svr)
{
    u32 (*func)(u32 *, struct SaveBlock2 *, struct SaveBlock1 *) = (void *)gDecompressionBuffer;
    if (func(&svr->unk_04, gSaveBlock2Ptr, gSaveBlock1Ptr) == 1)
    {
        svr->mainseqno = 4;
        svr->unk_0C = 0;
    }
    return 1;
}

static u32 mevent_srv_ish_exec(struct mevent_srv_ish * svr)
{
    u32 (*funcs[])(struct mevent_srv_ish *) = {
        ish_mainseq_0,
        ish_mainseq_1,
        ish_mainseq_2,
        ish_mainseq_3,
        ish_mainseq_4,
        ish_mainseq_5,
        ish_mainseq_6,
        ish_mainseq_7
    };
    return funcs[svr->mainseqno](svr);
}

void sub_8144F1C(void)
{
    gUnknown_203F3C4 = AllocZeroed(sizeof(struct mevent_srv_common));
    mevent_srv_init_common(gUnknown_203F3C4, gUnknown_8468B6C, 0, 1);
}

void sub_8144F40(void)
{
    gUnknown_203F3C4 = AllocZeroed(sizeof(struct mevent_srv_common));
    mevent_srv_init_common(gUnknown_203F3C4, gUnknown_8468BCC, 0, 1);
}

u32 sub_8144F64(u16 * a0)
{
    u32 result;
    if (gUnknown_203F3C4 == NULL)
        return 3;
    result = sub_8145600(gUnknown_203F3C4);
    if (result == 3)
    {
        *a0 = gUnknown_203F3C4->unk_04;
        mevent_srv_free_resources(gUnknown_203F3C4);
        Free(gUnknown_203F3C4);
        gUnknown_203F3C4 = NULL;
    }
    return result;
}

static void mevent_srv_init_common(struct mevent_srv_common * svr, const void * a1, u32 a2, u32 a3)
{
    svr->unk_00 = 0;
    svr->mainseqno = 0;
    svr->unk_18 = AllocZeroed(332);
    svr->unk_1C = AllocZeroed(444);
    svr->unk_14 = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->unk_20 = AllocZeroed(100);
    svr->cmdBuffer = a1;
    svr->cmdidx = 0;
    mevent_srv_sub_init(&svr->unk_38, a2, a3);
}

static void mevent_srv_free_resources(struct mevent_srv_common * svr)
{
    Free(svr->unk_18);
    Free(svr->unk_1C);
    Free(svr->unk_14);
    Free(svr->unk_20);
}

static void sub_814501C(struct mevent_srv_common * svr, u32 a1, void * a2, u32 size)
{
     AGB_ASSERT_EX(size <= ME_SEND_BUF_SIZE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 257);
    mevent_srv_sub_init_send(&svr->unk_38, a1, a2, size);
}

static void * sub_814505C(void * a0, void * a1)
{
    if (a0 != NULL)
        return a0;
    else
        return a1;
}

static u32 sub_8145068(void * a0, void * a1)
{
    if (a1 < a0)
        return 0;
    else if (a1 == a0)
        return 1;
    else
        return 2;
}

static u32 sub_8145080(struct mevent_srv_common * svr)
{
    svr->mainseqno = 4;
    return 0;
}

static u32 sub_8145088(struct mevent_srv_common * svr)
{
    return 3;
}

static u32 sub_814508C(struct mevent_srv_common * svr)
{
    if (mevent_srv_sub_recv(&svr->unk_38))
        svr->mainseqno = 4;
    return 1;
}

static u32 sub_81450A8(struct mevent_srv_common * svr)
{
    if (mevent_srv_sub_send(&svr->unk_38))
        svr->mainseqno = 4;
    return 1;
}

static u32 sub_81450C4(struct mevent_srv_common * svr)
{
    const struct mevent_cmd * cmd = &svr->cmdBuffer[svr->cmdidx];
    void * ptr;
    svr->cmdidx++;

    switch (cmd->instr)
    {
        case 0:
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 354);
            svr->mainseqno = 1;
            svr->unk_04 = cmd->flag;
            break;
        case 1:
            svr->mainseqno = 3;
            break;
        case 2:
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 364);
            mevent_srv_sub_init_recv(&svr->unk_38, cmd->flag, svr->unk_14);
            svr->mainseqno = 2;
            break;
        case 3:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 370);
            svr->cmdidx = 0;
            svr->cmdBuffer = cmd->parameter;
            break;
        case 5:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 376);
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 377);
            memcpy(svr->unk_20, svr->unk_14, 100);
            break;
        case 6:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 382);
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 383);
            svr->unk_04 = sub_81443D4(svr->unk_20);
            break;
        case 4:
            if (svr->unk_04 == cmd->flag)
            {
                svr->cmdidx = 0;
                svr->cmdBuffer = cmd->parameter;
            }
            break;
        case 7:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 396);
            ptr = sub_814505C(cmd->parameter, svr->unk_18);
            svr->unk_04 = sub_8144418(ptr, svr->unk_20, ptr);
            break;
        case 8:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 402);
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 403);
            svr->unk_04 = *(u32 *)svr->unk_14;
            break;
        case 9:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 408);
            ptr = sub_814505C(cmd->parameter, &svr->unk_34);
            svr->unk_04 = sub_8144434(ptr, svr->unk_20, ptr);
            break;
        case 10:
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 415);
            svr->unk_04 = sub_81444B0(svr->unk_20, cmd->flag);
            break;
        case 11:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 420);
            svr->unk_04 = sub_8144474(svr->unk_20, cmd->parameter);
            break;
        case 12:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 426);
            svr->unk_04 = sub_8145068(cmd->parameter, *(void **)svr->unk_14);
            break;
        case 14:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 432);
            sub_814501C(svr, 0x17, sub_814505C(cmd->parameter, svr->unk_1C), 444);
            break;
        case 13:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 438);
            sub_814501C(svr, 0x16, sub_814505C(cmd->parameter, svr->unk_18), 332);
            break;
        case 16:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 444);
            sub_814501C(svr, 0x18, sub_814505C(cmd->parameter, &svr->unk_34), 4);
            break;
        case 15:
            if (cmd->parameter == NULL)
                sub_814501C(svr, 0x19, svr->unk_24, svr->unk_28);
            else
                sub_814501C(svr, 0x19, cmd->parameter, cmd->flag);
            break;
        case 18:
            if (cmd->parameter == NULL)
                sub_814501C(svr, 0x10, svr->unk_2C, svr->unk_30);
            else
                sub_814501C(svr, 0x10, cmd->parameter, cmd->flag);
            break;
        case 19:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 466);
            sub_814501C(svr, 0x1a, cmd->parameter, 188);
            break;
        case 20:
            sub_814501C(svr, 0x15, cmd->parameter, cmd->flag);
            break;
        case 17:
            sub_814501C(svr, 0x1c, cmd->parameter, cmd->flag);
            break;
        case 22:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 481);
            memcpy(svr->unk_18, cmd->parameter, 332);
            break;
        case 23:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 486);
            memcpy(svr->unk_1C, cmd->parameter, 444);
            break;
        case 21:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 491);
            svr->unk_34 = *(void **)cmd->parameter;
            break;
        case 24:
            svr->unk_24 = cmd->parameter;
            svr->unk_28 = cmd->flag;
            break;
        case 25:
            svr->unk_2C = cmd->parameter;
            svr->unk_30 = cmd->flag;
            break;
        case 26:
            AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 506);
            memcpy(svr->unk_18, sav1_get_mevent_buffer_1(), 332);
            sub_814410C(svr->unk_18);
            break;
        case 27:
            AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 512);
            memcpy(svr->unk_1C, sub_8143D58(), 444);
            break;
        case 28:
            AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 517);
            svr->unk_24 = sub_8069E48();
            break;
        case 29:
            sub_814501C(svr, 0x1b, cmd->parameter, cmd->flag);
            break;
    }

    return 1;
}

static u32 (*const func_tbl[])(struct mevent_srv_common *) = {
    sub_8145080,
    sub_8145088,
    sub_814508C,
    sub_81450A8,
    sub_81450C4
};

static u32 sub_8145600(struct mevent_srv_common * svr)
{
    u32 response;
    AGB_ASSERT_EX(svr->mainseqno < NELEMS(func_tbl), "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 546);
    response = func_tbl[svr->mainseqno](svr);
    AGB_ASSERT_EX(svr->mainseqno < NELEMS(func_tbl), "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 548);
    return response;
}
