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

u32 sub_814490C(struct mevent_srv_sub *);
u32 sub_81449E0(struct mevent_srv_sub *);

u32 sub_8144844(struct mevent_srv_sub * svr)
{
    return svr->unk_20(svr);
}

u32 sub_8144850(struct mevent_srv_sub * svr)
{
    return svr->unk_24(svr);
}

void sub_814485C(struct mevent_srv_sub * svr, u32 a1, u32 a2)
{
    svr->unk_04 = a1;
    svr->unk_05 = a2;
    svr->unk_00 = 0;
    svr->unk_12 = 0;
    svr->unk_14 = 0;
    svr->unk_10 = 0;
    svr->unk_0A = 0;
    svr->unk_0C = 0;
    svr->unk_08 = 0;
    svr->unk_1C = NULL;
    svr->unk_18 = NULL;
    svr->unk_24 = sub_81449E0;
    svr->unk_20 = sub_814490C;
}

void sub_8144888(struct mevent_srv_sub * svr, u32 a1, void * a2, u32 a3)
{
    svr->unk_00 = 0;
    svr->unk_0E = a1;
    svr->unk_10 = 0;
    svr->unk_12 = 0;
    if (a3 != 0)
        svr->unk_14 = a3;
    else
        svr->unk_14 = ME_SEND_BUF_SIZE;
    svr->unk_1C = a2;
}

void sub_81448AC(struct mevent_srv_sub * svr, u32 a1, void * a2)
{
    svr->unk_00 = 0;
    svr->unk_06 = a1;
    svr->unk_08 = 0;
    svr->unk_0A = 0;
    svr->unk_0C = 0;
    svr->unk_18 = a2;
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

bool32 sub_814490C(struct mevent_srv_sub * svr)
{
    struct send_recv_buff buff;

    switch (svr->unk_00)
    {
        case 0:
            if (sub_81448D8(svr->unk_05))
            {
                sub_81448BC(svr->unk_05, &buff, sizeof(buff));
                svr->unk_0C = buff.unk4;
                svr->unk_0A = buff.unk2;
                if (svr->unk_0C > ME_SEND_BUF_SIZE)
                {
                    sub_80FA190();
                    return FALSE;
                }
                else if (svr->unk_06 != buff.unk0)
                {
                    sub_80FA190();
                    return FALSE;
                }
                else
                {
                    svr->unk_08 = 0;
                    sub_81448FC(svr->unk_05);
                    ++svr->unk_00;
                }
            }
            break;
        case 1:
            if (sub_81448D8(svr->unk_05))
            {
                size_t r3 = svr->unk_08 * 252;
                if (svr->unk_0C - r3 <= 252)
                {
                    sub_81448BC(svr->unk_05, svr->unk_18 + r3, svr->unk_0C - r3);
                    ++svr->unk_08;
                    ++svr->unk_00;
                }
                else
                {
                    sub_81448BC(svr->unk_05, svr->unk_18 + r3, 252);
                    ++svr->unk_08;
                }
                sub_81448FC(svr->unk_05);
            }
            break;
        case 2:
            if (CalcCRC16WithTable(svr->unk_18, svr->unk_0C) != svr->unk_0A)
            {
                sub_80FA190();
                return FALSE;
            }
            else
            {
                svr->unk_00 = 0;
                return TRUE;
            }
            break;

    }

    return FALSE;
}

bool32 sub_81449E0(struct mevent_srv_sub * svr)
{
    struct send_recv_buff buff;

    switch (svr->unk_00)
    {
        case 0:
            if (sub_800A4BC())
            {
                buff.unk0 = svr->unk_0E;
                buff.unk4 = svr->unk_14;
                buff.unk2 = CalcCRC16WithTable(svr->unk_1C, svr->unk_14);
                svr->unk_12 = buff.unk2;
                svr->unk_10 = 0;
                SendBlock(0, &buff, sizeof(buff));
                ++svr->unk_00;
            }
            break;
        case 1:
            if (sub_800A4BC())
            {
                if (sub_81448D8(svr->unk_04))
                {
                    size_t r3;
                    sub_81448FC(svr->unk_04);
                    r3 = 252 * svr->unk_10;
                    if (svr->unk_14 - r3 <= 252)
                    {
                        SendBlock(0, svr->unk_1C + r3, svr->unk_14 - r3);
                        ++svr->unk_10;
                        ++svr->unk_00;
                    }
                    else
                    {
                        SendBlock(0, svr->unk_1C + r3, 252);
                        ++svr->unk_10;
                    }
                }
            }
            break;
        case 2:
            if (sub_800A4BC())
            {
                if (CalcCRC16WithTable(svr->unk_1C, svr->unk_14) != svr->unk_12)
                    sub_80FA190();
                else
                    ++svr->unk_00;
            }
            break;
        case 3:
            if (sub_81448D8(svr->unk_04))
            {
                sub_81448FC(svr->unk_04);
                svr->unk_00 = 0;
                return TRUE;
            }
            break;
    }

    return FALSE;
}
