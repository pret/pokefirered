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

struct mevent_srv_common
{
    u32 unk_00;
    u32 unk_04;
    u32 mainseqno;
    u32 unk_0C;
    const void * unk_10;
    void * unk_14;
    void * unk_18;
    void * unk_1C;
    void * unk_20;
    u8 filler_24[0x14];
    struct mevent_srv_sub unk_38;
};

EWRAM_DATA struct mevent_srv_common * gUnknown_203F3C4 = NULL;

void mevent_srv_init_common(struct mevent_srv_common *, const void *, u32, u32);
void mevent_srv_free_resources(struct mevent_srv_common *);
u32 sub_8145600(struct mevent_srv_common *);

extern const u8 gUnknown_8468B6C[];
extern const u8 gUnknown_8468BCC[];

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

void mevent_srv_init_common(struct mevent_srv_common * svr, const void * a1, u32 a2, u32 a3)
{
    svr->unk_00 = 0;
    svr->mainseqno = 0;
    svr->unk_18 = AllocZeroed(332);
    svr->unk_1C = AllocZeroed(444);
    svr->unk_14 = AllocZeroed(ME_SEND_BUF_SIZE);
    svr->unk_20 = AllocZeroed(100);
    svr->unk_10 = a1;
    svr->unk_0C = 0;
    sub_814485C(&svr->unk_38, a2, a3);
}

void mevent_srv_free_resources(struct mevent_srv_common * svr)
{
    Free(svr->unk_18);
    Free(svr->unk_1C);
    Free(svr->unk_14);
    Free(svr->unk_20);
}

const char gUnknown_8466F80[] = "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c";
const char gUnknown_8466FB8[] = "size <= ME_SEND_BUF_SIZE";
const char gUnknown_8466FD4[] = "cmd->parameter == NULL";
const char gUnknown_8466FEC[] = "cmd->flag == FALSE";
const char gUnknown_8467000[] = "cmd->flag == FALSE && cmd->parameter == NULL";

void sub_814501C(struct mevent_srv_common * svr, u32 a1, void * a2, u32 size)
{
    // AGB_ASSERT_EX(size <= ME_SEND_BUF_SIZE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent_server.c", 257);
    size <= ME_SEND_BUF_SIZE ? NULL : AGBAssert(gUnknown_8466F80, 257, gUnknown_8466FB8, 1);
    sub_8144888(&svr->unk_38, a1, a2, size);
}
