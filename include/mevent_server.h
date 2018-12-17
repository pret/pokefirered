#ifndef GUARD_MEVENT_SERVER_H
#define GUARD_MEVENT_SERVER_H

#include "global.h"

#define ME_SEND_BUF_SIZE 0x400

struct mevent_srv_sub
{
    s32 seqno;
    u8 sendPlayerNo;
    u8 recvPlayerNo;
    u16 recvIdent;
    u16 recvCounter;
    u16 recvCRC;
    u16 recvSize;
    u16 sendIdent;
    u16 sendCounter;
    u16 sendCRC;
    u16 sendSize;
    void * recvBfr;
    const void * sendBfr;
    u32 (*recvFunc)(struct mevent_srv_sub *);
    u32 (*sendFunc)(struct mevent_srv_sub *);
};

struct send_recv_header
{
    u16 ident;
    u16 crc;
    u16 size;
};

struct mevent_cmd_ish
{
    u32 instr;
    u32 parameter;
};

struct mevent_srv_ish
{
    u32 unk_00;
    u32 param;
    u32 mainseqno;
    u32 flag;
    u32 cmdidx;
    void * sendBuffer;
    void * recvBuffer;
    struct mevent_cmd_ish * cmdBuffer;
    void * buffer;
    struct mevent_srv_sub manager;
};

struct mevent_cmd
{
    u32 instr;
    bool32 flag;
    void * parameter;
};

struct mevent_srv_common
{
    u32 unk_00;
    u32 param;
    u32 mainseqno;
    u32 cmdidx;
    const struct mevent_cmd * cmdBuffer;
    void * recvBuffer;
    struct MEventBuffer_32E0_Sub * mevent_32e0;
    struct MEventBuffer_3120_Sub * mevent_3120;
    struct MEventStruct_Unk1442CC * mevent_unk1442cc;
    void * sendBuffer1;
    u32 sendBuffer1Size;
    void * sendBuffer2;
    u32 sendBuffer2Size;
    u32 sendWord;
    struct mevent_srv_sub manager;
};

u32 mevent_srv_sub_recv(struct mevent_srv_sub * svr);
u32 mevent_srv_sub_send(struct mevent_srv_sub * svr);
void mevent_srv_sub_init(struct mevent_srv_sub * svr, u32 sendPlayerNo, u32 recvPlayerNo);
void mevent_srv_sub_init_send(struct mevent_srv_sub * svr, u32 ident, const void * src, u32 size);
void mevent_srv_sub_init_recv(struct mevent_srv_sub * svr, u32 ident, void * dest);

void mevent_srv_ish_do_init(void);
u32 mevent_srv_ish_do_exec(u16 * a0);
void mevent_srv_ish_inc_flag(void);
void * mevent_srv_ish_get_buffer(void);
void mevent_srv_ish_set_param(u32 a0);
void mevent_srv_common_do_init_1(void);
void mevent_srv_common_do_init_2(void);
u32 mevent_srv_init_do_exec(u16 * a0);

#endif //GUARD_MEVENT_SERVER_H
