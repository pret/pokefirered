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
    u32 unk_04;
    u32 mainseqno;
    u32 unk_0C;
    u32 cmdidx;
    void * unk_14;
    void * unk_18;
    struct mevent_cmd_ish * cmdBuffer;
    void * unk_20;
    struct mevent_srv_sub unk_24;
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
    u32 unk_04;
    u32 mainseqno;
    u32 cmdidx;
    const struct mevent_cmd * cmdBuffer;
    void * unk_14;
    struct MEventBuffer_32E0_Sub * unk_18;
    struct MEventBuffer_3120_Sub * unk_1C;
    struct MEventStruct_Unk1442CC * unk_20;
    void * unk_24;
    u32 unk_28;
    void * unk_2C;
    u32 unk_30;
    void * unk_34;
    struct mevent_srv_sub unk_38;
};

u32 mevent_srv_sub_recv(struct mevent_srv_sub * svr);
u32 mevent_srv_sub_send(struct mevent_srv_sub * svr);
void mevent_srv_sub_init(struct mevent_srv_sub * svr, u32 sendPlayerNo, u32 recvPlayerNo);
void mevent_srv_sub_init_send(struct mevent_srv_sub * svr, u32 ident, const void * src, u32 size);
void mevent_srv_sub_init_recv(struct mevent_srv_sub * svr, u32 ident, void * dest);

void sub_8144AEC(void);
u32 sub_8144B0C(u16 * a0);
void sub_8144B48(void);
void * sub_8144B58(void);
void sub_8144B64(u32 a0);
void sub_8144F1C(void);
void sub_8144F40(void);
u32 sub_8144F64(u16 * a0);

extern const u8 gUnknown_84687E0[];
extern const u8 gUnknown_8468B6C[];
extern const u8 gUnknown_8468BCC[];

#endif //GUARD_MEVENT_SERVER_H
