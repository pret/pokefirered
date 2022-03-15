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

struct mevent_client_cmd
{
    u32 instr;
    u32 parameter;
};

// Client commands
#define CLI_RETURN(x)  {.instr =  1, .parameter = x}
#define CLI_RECEIVE(x) {.instr =  2, .parameter = x}
#define CLI_WAITSND    {.instr =  3, .parameter = 0}
#define CLI_JUMPBUF    {.instr =  4, .parameter = 0}
#define CLI_SNDHEAD    {.instr =  8, .parameter = 0}
#define CLI_VLDNEWS    {.instr =  9, .parameter = 0}
#define CLI_RECVSAV    {.instr = 10, .parameter = 0}
#define CLI_RECVBUF    {.instr = 12, .parameter = 0}
#define CLI_REQWORD    {.instr = 13, .parameter = 0}
#define CLI_SNDWORD    {.instr = 14, .parameter = 0}
#define CLI_RECVMON    {.instr = 16, .parameter = 0}
#define CLI_RECVRAM    {.instr = 17, .parameter = 0}
#define CLI_SENDALL    {.instr = 20, .parameter = 0}

struct mevent_client
{
    u32 unk_00;
    u32 param;
    u32 mainseqno;
    u32 flag;
    u32 cmdidx;
    void * sendBuffer;
    void * recvBuffer;
    struct mevent_client_cmd * cmdBuffer;
    void * buffer;
    struct mevent_srv_sub manager;
};

struct mevent_server_cmd
{
    u32 instr;
    bool32 flag;
    void * parameter;
};

// Server commands
#define SRV_RETURN(x)           {.instr =  0, .flag = x}
#define SRV_WAITSND             {.instr =  1}
#define SRV_RECV(x)             {.instr =  2, .flag = x}
#define SRV_BRANCH(y)           {.instr =  3, .parameter = (void *)y}
#define SRV_BRANCHIF(x, y)      {.instr =  4, .flag = x, .parameter = (void *)y}
#define SRV_READ_1442CC         {.instr =  5}
#define SRV_VALID_1442CC        {.instr =  6}
#define SRV_CHECK_1442CC_14     {.instr =  7}
#define SRV_READWORD            {.instr =  8}
#define SRV_SEND_CARD           {.instr = 13}
#define SRV_SEND_NEWS           {.instr = 14}
#define SRV_BUFFER_SEND         {.instr = 15}
#define SRV_SEND(x, y)          {.instr = 18, .flag = x, .parameter = (void *)y}
#define SRV_SENDSTR(x, y)       {.instr = 20, .flag = x, .parameter = (void *)y}
#define SRV_BUFFER_CARD         {.instr = 26}
#define SRV_BUFFER_NEWS         {.instr = 27}
#define SRV_RAM_SCRIPT_IF_VALID {.instr = 28}

struct mevent_srv_common
{
    u32 unk_00;
    u32 param;
    u32 mainseqno;
    u32 cmdidx;
    const struct mevent_server_cmd * cmdBuffer;
    void * recvBuffer;
    struct WonderCard * card;
    struct WonderNews * news;
    struct MEventClientHeaderStruct * mevent_unk1442cc;
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

void mevent_client_do_init(void);
u32 mevent_client_do_exec(u16 * a0);
void mevent_client_inc_flag(void);
void * mevent_client_get_buffer(void);
void mevent_client_set_param(u32 a0);
void mevent_srv_init_wnews(void);
void mevent_srv_new_wcard(void);
u32 mevent_srv_common_do_exec(u16 * a0);

#endif //GUARD_MEVENT_SERVER_H
