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

EWRAM_DATA struct mevent_srv_ish * s_mevent_srv_ish_ptr = NULL;
EWRAM_DATA struct mevent_srv_common * s_mevent_srv_common_ptr = NULL;

static void mevent_srv_ish_init(struct mevent_srv_ish *, u32, u32);
static u32 mevent_srv_ish_exec(struct mevent_srv_ish *);
static void mevent_srv_ish_free_resources(struct mevent_srv_ish *);
static void mevent_srv_init_common(struct mevent_srv_common *, const void *, u32, u32);
static void mevent_srv_free_resources(struct mevent_srv_common *);
static u32 mevent_srv_exec_common(struct mevent_srv_common *);

extern const u8 gUnknown_84687E0[];
extern const struct mevent_cmd gUnknown_8468B6C[];
extern const struct mevent_cmd gUnknown_8468BCC[];

void mevent_srv_ish_do_init(void)
{
    s_mevent_srv_ish_ptr = AllocZeroed(sizeof(struct mevent_srv_ish));
    mevent_srv_ish_init(s_mevent_srv_ish_ptr, 1, 0);
}

u32 mevent_srv_ish_do_exec(u16 * a0)
{
    u32 result;
    if (s_mevent_srv_ish_ptr == NULL)
        return 6;
    result = mevent_srv_ish_exec(s_mevent_srv_ish_ptr);
    if (result == 6)
    {
        *a0 = s_mevent_srv_ish_ptr->param;
        mevent_srv_ish_free_resources(s_mevent_srv_ish_ptr);
        Free(s_mevent_srv_ish_ptr);
        s_mevent_srv_ish_ptr = NULL;
    }
    return result;
}

void mevent_srv_ish_inc_flag(void)
{
    s_mevent_srv_ish_ptr->flag++;
}

void * mevent_srv_ish_get_buffer(void)
{
    return s_mevent_srv_ish_ptr->buffer;
}

void mevent_srv_ish_set_param(u32 a0)
{
    s_mevent_srv_ish_ptr->param = a0;
}

static void mevent_srv_ish_init(struct mevent_srv_ish * svr, u32 sendPlayerNo, u32 recvPlayerNo)
{
    svr->unk_00 = 0;
    svr->mainseqno = 0;
    svr->flag = 0;
    svr->sendBuffer = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->recvBuffer = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->cmdBuffer = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->buffer = AllocZeroed(0x40);
    mevent_srv_sub_init(&svr->manager, sendPlayerNo, recvPlayerNo);
}

static void mevent_srv_ish_free_resources(struct mevent_srv_ish * svr)
{
    Free(svr->sendBuffer);
    Free(svr->recvBuffer);
    Free(svr->cmdBuffer);
    Free(svr->buffer);
}

static void mevent_srv_ish_jmp_buffer(struct mevent_srv_ish * svr)
{
    memcpy(svr->cmdBuffer, svr->recvBuffer, ME_SEND_BUF_SIZE);
    svr->cmdidx = 0;
}

static void mevent_srv_ish_send_word(struct mevent_srv_ish * svr, u32 ident, u32 word)
{
    CpuFill32(0, svr->sendBuffer, ME_SEND_BUF_SIZE);
    *(u32 *)svr->sendBuffer = word;
    mevent_srv_sub_init_send(&svr->manager, ident, svr->sendBuffer, sizeof(u32));
}

static u32 ish_mainseq_0(struct mevent_srv_ish * svr)
{
    // init
    memcpy(svr->cmdBuffer, gUnknown_84687E0, ME_SEND_BUF_SIZE);
    svr->cmdidx = 0;
    svr->mainseqno = 4;
    svr->flag = 0;
    return 0;
}

static u32 ish_mainseq_1(struct mevent_srv_ish * svr)
{
    // done
    return 6;
}

static u32 ish_mainseq_2(struct mevent_srv_ish * svr)
{
    // do recv
    if (mevent_srv_sub_recv(&svr->manager))
    {
        svr->mainseqno = 4;
        svr->flag = 0;
    }
    return 1;
}

static u32 ish_mainseq_3(struct mevent_srv_ish * svr)
{
    // do send
    if (mevent_srv_sub_send(&svr->manager))
    {
        svr->mainseqno = 4;
        svr->flag = 0;
    }
    return 1;
}

static u32 ish_mainseq_4(struct mevent_srv_ish * svr)
{
    // process command
    struct mevent_cmd_ish * cmd = &svr->cmdBuffer[svr->cmdidx];
    ++svr->cmdidx;
    switch (cmd->instr)
    {
        case 0:
            break;
        case 1:
            svr->param = cmd->parameter;
            svr->mainseqno = 1;
            svr->flag = 0;
            break;
        case 2:
            mevent_srv_sub_init_recv(&svr->manager, cmd->parameter, svr->recvBuffer);
            svr->mainseqno = 2;
            svr->flag = 0;
            break;
        case 3:
            svr->mainseqno = 3;
            svr->flag = 0;
            break;
        case 20:
            mevent_srv_sub_init_send(&svr->manager, 0x14, svr->sendBuffer, 0);
            svr->mainseqno = 3;
            svr->flag = 0;
            break;
        case 19:
            mevent_srv_ish_send_word(svr, 0x12, GetGameStat(cmd->parameter));
            svr->mainseqno = 3;
            svr->flag = 0;
            break;
        case 6:
            if (svr->param == 0)
                mevent_srv_ish_jmp_buffer(svr);
            break;
        case 7:
            if (svr->param == 1)
                mevent_srv_ish_jmp_buffer(svr);
            break;
        case 4:
            mevent_srv_ish_jmp_buffer(svr);
            break;
        case 5:
            memcpy(svr->buffer, svr->recvBuffer, 0x40);
            svr->mainseqno = 5;
            svr->flag = 0;
            return 2;
        case 11:
            memcpy(svr->buffer, svr->recvBuffer, 0x40);
            svr->mainseqno = 5;
            svr->flag = 0;
            return 3;
        case 12:
            memcpy(svr->buffer, svr->recvBuffer, 0x40);
            svr->mainseqno = 5;
            svr->flag = 0;
            return 5;
        case 13:
            svr->mainseqno = 5;
            svr->flag = 0;
            return 4;
        case 8:
            sub_81442CC(svr->sendBuffer);
            mevent_srv_sub_init_send(&svr->manager, 0x11, svr->sendBuffer, sizeof(struct MEventStruct_Unk1442CC));
            break;
        case 14:
            mevent_srv_ish_send_word(svr, 0x13, svr->param);
            break;
        case 10:
            sub_8143F68(svr->recvBuffer);
            break;
        case 9:
            if (!sub_8143EF4(svr->recvBuffer))
            {
                sub_8143DC8(svr->recvBuffer);
                mevent_srv_ish_send_word(svr, 0x13, 0);
            }
            else
                mevent_srv_ish_send_word(svr, 0x13, 1);
            break;
        case 15:
            svr->mainseqno = 6;
            svr->flag = 0;
            break;
        case 16:
            sub_8144254(svr->recvBuffer);
            break;
        case 17:
            sub_8069EA4(svr->recvBuffer, 1000);
            break;
        case 18:
            memcpy(gSaveBlock2Ptr->unk_4A0, svr->recvBuffer, 0xbc);
            ValidateEReaderTrainer();
            break;
        case 21:
            memcpy(gDecompressionBuffer, svr->recvBuffer, ME_SEND_BUF_SIZE);
            svr->mainseqno = 7;
            svr->flag = 0;
            break;
    }

    return 1;
}

static u32 ish_mainseq_5(struct mevent_srv_ish * svr)
{
    // wait flag
    if (svr->flag)
    {
        svr->mainseqno = 4;
        svr->flag = 0;
    }
    return 1;
}

static u32 ish_mainseq_6(struct mevent_srv_ish * svr)
{
    // ???
    switch (svr->flag)
    {
        case 0:
            sub_80DA89C(svr->recvBuffer);
            ++svr->flag;
            break;
        case 1:
            if (!sub_80DA8B0(&svr->param))
            {
                svr->mainseqno = 4;
                svr->flag = 0;
            }
            break;
    }
    return 1;
}

static u32 ish_mainseq_7(struct mevent_srv_ish * svr)
{
    // exec arbitrary code
    u32 (*func)(u32 *, struct SaveBlock2 *, struct SaveBlock1 *) = (void *)gDecompressionBuffer;
    if (func(&svr->param, gSaveBlock2Ptr, gSaveBlock1Ptr) == 1)
    {
        svr->mainseqno = 4;
        svr->flag = 0;
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

void mevent_srv_common_do_init_1(void)
{
    s_mevent_srv_common_ptr = AllocZeroed(sizeof(struct mevent_srv_common));
    mevent_srv_init_common(s_mevent_srv_common_ptr, gUnknown_8468B6C, 0, 1);
}

void mevent_srv_common_do_init_2(void)
{
    s_mevent_srv_common_ptr = AllocZeroed(sizeof(struct mevent_srv_common));
    mevent_srv_init_common(s_mevent_srv_common_ptr, gUnknown_8468BCC, 0, 1);
}

u32 mevent_srv_init_do_exec(u16 * a0)
{
    u32 result;
    if (s_mevent_srv_common_ptr == NULL)
        return 3;
    result = mevent_srv_exec_common(s_mevent_srv_common_ptr);
    if (result == 3)
    {
        *a0 = s_mevent_srv_common_ptr->param;
        mevent_srv_free_resources(s_mevent_srv_common_ptr);
        Free(s_mevent_srv_common_ptr);
        s_mevent_srv_common_ptr = NULL;
    }
    return result;
}

static void mevent_srv_init_common(struct mevent_srv_common * svr, const void * cmdBuffer, u32 sendPlayerNo, u32 recvPlayerNo)
{
    svr->unk_00 = 0;
    svr->mainseqno = 0;
    svr->mevent_32e0 = AllocZeroed(sizeof(struct MEventBuffer_32E0_Sub));
    svr->mevent_3120 = AllocZeroed(sizeof(struct MEventBuffer_3120_Sub));
    svr->recvBuffer = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->mevent_unk1442cc = AllocZeroed(sizeof(struct MEventStruct_Unk1442CC));
    svr->cmdBuffer = cmdBuffer;
    svr->cmdidx = 0;
    mevent_srv_sub_init(&svr->manager, sendPlayerNo, recvPlayerNo);
}

static void mevent_srv_free_resources(struct mevent_srv_common * svr)
{
    Free(svr->mevent_32e0);
    Free(svr->mevent_3120);
    Free(svr->recvBuffer);
    Free(svr->mevent_unk1442cc);
}

static void mevent_srv_common_init_send(struct mevent_srv_common * svr, u32 ident, const void * src, u32 size)
{
     AGB_ASSERT_EX(size <= ME_SEND_BUF_SIZE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 257);
    mevent_srv_sub_init_send(&svr->manager, ident, src, size);
}

static void * mevent_first_if_not_null_else_second(void * a0, void * a1)
{
    if (a0 != NULL)
        return a0;
    else
        return a1;
}

static u32 mevent_compare_pointers(void * a0, void * a1)
{
    if (a1 < a0)
        return 0;
    else if (a1 == a0)
        return 1;
    else
        return 2;
}

static u32 common_mainseq_0(struct mevent_srv_common * svr)
{
    // start
    svr->mainseqno = 4;
    return 0;
}

static u32 common_mainseq_1(struct mevent_srv_common * svr)
{
    // done
    return 3;
}

static u32 common_mainseq_2(struct mevent_srv_common * svr)
{
    // do recv
    if (mevent_srv_sub_recv(&svr->manager))
        svr->mainseqno = 4;
    return 1;
}

static u32 common_mainseq_3(struct mevent_srv_common * svr)
{
    // do send
    if (mevent_srv_sub_send(&svr->manager))
        svr->mainseqno = 4;
    return 1;
}

static u32 common_mainseq_4(struct mevent_srv_common * svr)
{
    // process command
    const struct mevent_cmd * cmd = &svr->cmdBuffer[svr->cmdidx];
    void * ptr;
    svr->cmdidx++;

    switch (cmd->instr)
    {
        case 0:
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 354);
            svr->mainseqno = 1;
            svr->param = cmd->flag;
            break;
        case 1:
            svr->mainseqno = 3;
            break;
        case 2:
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 364);
            mevent_srv_sub_init_recv(&svr->manager, cmd->flag, svr->recvBuffer);
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
            memcpy(svr->mevent_unk1442cc, svr->recvBuffer, sizeof(struct MEventStruct_Unk1442CC));
            break;
        case 6:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 382);
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 383);
            svr->param = sub_81443D4(svr->mevent_unk1442cc);
            break;
        case 4:
            if (svr->param == cmd->flag)
            {
                svr->cmdidx = 0;
                svr->cmdBuffer = cmd->parameter;
            }
            break;
        case 7:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 396);
            ptr = mevent_first_if_not_null_else_second(cmd->parameter, svr->mevent_32e0);
            svr->param = sub_8144418(ptr, svr->mevent_unk1442cc, ptr);
            break;
        case 8:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 402);
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 403);
            svr->param = *(u32 *)svr->recvBuffer;
            break;
        case 9:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 408);
            ptr = mevent_first_if_not_null_else_second(cmd->parameter, &svr->sendWord);
            svr->param = sub_8144434(ptr, svr->mevent_unk1442cc, ptr);
            break;
        case 10:
            AGB_ASSERT_EX(cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 415);
            svr->param = sub_81444B0(svr->mevent_unk1442cc, cmd->flag);
            break;
        case 11:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 420);
            svr->param = sub_8144474(svr->mevent_unk1442cc, cmd->parameter);
            break;
        case 12:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 426);
            svr->param = mevent_compare_pointers(cmd->parameter, *(void **)svr->recvBuffer);
            break;
        case 14:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 432);
            mevent_srv_common_init_send(svr, 0x17, mevent_first_if_not_null_else_second(cmd->parameter, svr->mevent_3120), sizeof(struct MEventBuffer_3120_Sub));
            break;
        case 13:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 438);
            mevent_srv_common_init_send(svr, 0x16, mevent_first_if_not_null_else_second(cmd->parameter, svr->mevent_32e0), sizeof(struct MEventBuffer_32E0_Sub));
            break;
        case 16:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 444);
            mevent_srv_common_init_send(svr, 0x18, mevent_first_if_not_null_else_second(cmd->parameter, &svr->sendWord), 4);
            break;
        case 15:
            if (cmd->parameter == NULL)
                mevent_srv_common_init_send(svr, 0x19, svr->sendBuffer1, svr->sendBuffer1Size);
            else
                mevent_srv_common_init_send(svr, 0x19, cmd->parameter, cmd->flag);
            break;
        case 18:
            if (cmd->parameter == NULL)
                mevent_srv_common_init_send(svr, 0x10, svr->sendBuffer2, svr->sendBuffer2Size);
            else
                mevent_srv_common_init_send(svr, 0x10, cmd->parameter, cmd->flag);
            break;
        case 19:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 466);
            mevent_srv_common_init_send(svr, 0x1a, cmd->parameter, 188);
            break;
        case 20:
            mevent_srv_common_init_send(svr, 0x15, cmd->parameter, cmd->flag);
            break;
        case 17:
            mevent_srv_common_init_send(svr, 0x1c, cmd->parameter, cmd->flag);
            break;
        case 22:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 481);
            memcpy(svr->mevent_32e0, cmd->parameter, 332);
            break;
        case 23:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 486);
            memcpy(svr->mevent_3120, cmd->parameter, 444);
            break;
        case 21:
            AGB_ASSERT_EX(cmd->flag == FALSE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 491);
            svr->sendWord = *(u32 *)cmd->parameter;
            break;
        case 24:
            svr->sendBuffer1 = cmd->parameter;
            svr->sendBuffer1Size = cmd->flag;
            break;
        case 25:
            svr->sendBuffer2 = cmd->parameter;
            svr->sendBuffer2Size = cmd->flag;
            break;
        case 26:
            AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 506);
            memcpy(svr->mevent_32e0, GetSavedWonderCard(), 332);
            sub_814410C(svr->mevent_32e0);
            break;
        case 27:
            AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 512);
            memcpy(svr->mevent_3120, GetSavedWonderNews(), 444);
            break;
        case 28:
            AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 517);
            svr->sendBuffer1 = sub_8069E48();
            break;
        case 29:
            mevent_srv_common_init_send(svr, 0x1b, cmd->parameter, cmd->flag);
            break;
    }

    return 1;
}

static u32 (*const func_tbl[])(struct mevent_srv_common *) = {
    common_mainseq_0,
    common_mainseq_1,
    common_mainseq_2,
    common_mainseq_3,
    common_mainseq_4
};

static u32 mevent_srv_exec_common(struct mevent_srv_common * svr)
{
    u32 response;
    AGB_ASSERT_EX(svr->mainseqno < NELEMS(func_tbl), "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 546);
    response = func_tbl[svr->mainseqno](svr);
    AGB_ASSERT_EX(svr->mainseqno < NELEMS(func_tbl), "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 548);
    return response;
}
