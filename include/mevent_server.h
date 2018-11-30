#ifndef GUARD_MEVENT_SERVER_H
#define GUARD_MEVENT_SERVER_H

#include "global.h"

#define ME_SEND_BUF_SIZE 0x400

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

struct send_recv_buff
{
    u16 unk0;
    u16 unk2;
    u16 unk4;
};

u32 sub_8144844(struct mevent_srv_sub * svr);
u32 sub_8144850(struct mevent_srv_sub * svr);
void sub_814485C(struct mevent_srv_sub * svr, u32 a1, u32 a2);
void sub_8144888(struct mevent_srv_sub * svr, u32 a1, void * a2, u32 size);
void sub_81448AC(struct mevent_srv_sub * svr, u32 a1, void * a2);

#endif //GUARD_MEVENT_SERVER_H
