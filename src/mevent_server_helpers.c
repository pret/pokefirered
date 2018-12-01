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

static u32 mevent_receive_func(struct mevent_srv_sub *);
static u32 mevent_send_func(struct mevent_srv_sub *);

u32 mevent_srv_sub_recv(struct mevent_srv_sub * svr)
{
    return svr->recvFunc(svr);
}

u32 mevent_srv_sub_send(struct mevent_srv_sub * svr)
{
    return svr->sendFunc(svr);
}

void mevent_srv_sub_init(struct mevent_srv_sub * svr, u32 sendPlayerNo, u32 recvPlayerNo)
{
    svr->sendPlayerNo = sendPlayerNo;
    svr->recvPlayerNo = recvPlayerNo;
    svr->seqno = 0;
    svr->sendCRC = 0;
    svr->sendSize = 0;
    svr->sendCounter = 0;
    svr->recvCRC = 0;
    svr->recvSize = 0;
    svr->recvCounter = 0;
    svr->sendBfr = NULL;
    svr->recvBfr = NULL;
    svr->sendFunc = mevent_send_func;
    svr->recvFunc = mevent_receive_func;
}

void mevent_srv_sub_init_send(struct mevent_srv_sub * svr, u32 a1, const void * src, u32 size)
{
    svr->seqno = 0;
    svr->sendIdent = a1;
    svr->sendCounter = 0;
    svr->sendCRC = 0;
    if (size != 0)
        svr->sendSize = size;
    else
        svr->sendSize = ME_SEND_BUF_SIZE;
    svr->sendBfr = src;
}

void mevent_srv_sub_init_recv(struct mevent_srv_sub * svr, u32 ident, void * dest)
{
    svr->seqno = 0;
    svr->recvIdent = ident;
    svr->recvCounter = 0;
    svr->recvCRC = 0;
    svr->recvSize = 0;
    svr->recvBfr = dest;
}

static void mevent_recv_block(u32 recv_idx, void * dest, size_t size)
{
    memcpy(dest, gBlockRecvBuffer[recv_idx], size);
}

static bool32 mevent_has_received(u32 recv_idx)
{
    if ((GetBlockReceivedStatus() >> recv_idx) & 1)
        return TRUE;
    else
        return FALSE;
}

static void mevent_reset_recv(u32 recv_idx)
{
    ResetBlockReceivedFlag(recv_idx);
}

static bool32 mevent_receive_func(struct mevent_srv_sub * svr)
{
    struct send_recv_header header;

    switch (svr->seqno)
    {
        case 0:
            if (mevent_has_received(svr->recvPlayerNo))
            {
                mevent_recv_block(svr->recvPlayerNo, &header, sizeof(header));
                svr->recvSize = header.size;
                svr->recvCRC = header.crc;
                if (svr->recvSize > ME_SEND_BUF_SIZE)
                {
                    sub_80FA190();
                    return FALSE;
                }
                else if (svr->recvIdent != header.ident)
                {
                    sub_80FA190();
                    return FALSE;
                }
                else
                {
                    svr->recvCounter = 0;
                    mevent_reset_recv(svr->recvPlayerNo);
                    ++svr->seqno;
                }
            }
            break;
        case 1:
            if (mevent_has_received(svr->recvPlayerNo))
            {
                size_t r3 = svr->recvCounter * 252;
                if (svr->recvSize - r3 <= 252)
                {
                    mevent_recv_block(svr->recvPlayerNo, svr->recvBfr + r3, svr->recvSize - r3);
                    ++svr->recvCounter;
                    ++svr->seqno;
                }
                else
                {
                    mevent_recv_block(svr->recvPlayerNo, svr->recvBfr + r3, 252);
                    ++svr->recvCounter;
                }
                mevent_reset_recv(svr->recvPlayerNo);
            }
            break;
        case 2:
            if (CalcCRC16WithTable(svr->recvBfr, svr->recvSize) != svr->recvCRC)
            {
                sub_80FA190();
                return FALSE;
            }
            else
            {
                svr->seqno = 0;
                return TRUE;
            }
            break;

    }

    return FALSE;
}

static bool32 mevent_send_func(struct mevent_srv_sub * svr)
{
    struct send_recv_header header;

    switch (svr->seqno)
    {
        case 0:
            if (sub_800A4BC())
            {
                header.ident = svr->sendIdent;
                header.size = svr->sendSize;
                header.crc = CalcCRC16WithTable(svr->sendBfr, svr->sendSize);
                svr->sendCRC = header.crc;
                svr->sendCounter = 0;
                SendBlock(0, &header, sizeof(header));
                ++svr->seqno;
            }
            break;
        case 1:
            if (sub_800A4BC())
            {
                if (mevent_has_received(svr->sendPlayerNo))
                {
                    size_t r3;
                    mevent_reset_recv(svr->sendPlayerNo);
                    r3 = 252 * svr->sendCounter;
                    if (svr->sendSize - r3 <= 252)
                    {
                        SendBlock(0, svr->sendBfr + r3, svr->sendSize - r3);
                        ++svr->sendCounter;
                        ++svr->seqno;
                    }
                    else
                    {
                        SendBlock(0, svr->sendBfr + r3, 252);
                        ++svr->sendCounter;
                    }
                }
            }
            break;
        case 2:
            if (sub_800A4BC())
            {
                if (CalcCRC16WithTable(svr->sendBfr, svr->sendSize) != svr->sendCRC)
                    sub_80FA190();
                else
                    ++svr->seqno;
            }
            break;
        case 3:
            if (mevent_has_received(svr->sendPlayerNo))
            {
                mevent_reset_recv(svr->sendPlayerNo);
                svr->seqno = 0;
                return TRUE;
            }
            break;
    }

    return FALSE;
}
