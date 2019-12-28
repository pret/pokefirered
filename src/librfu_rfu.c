#include "global.h"
#include "librfu.h"

void rfu_CB_defaultCallback(u8, u16);
void rfu_CB_reset(u8, u16);
void rfu_CB_configGameData(u8, u16);
void rfu_CB_stopMode(u8, u16);
void rfu_CB_startSearchChild(u8, u16);
void rfu_CB_pollAndEndSearchChild(u8, u16);
void rfu_CB_startSearchParent(u8, u16);
void rfu_CB_pollSearchParent(u8, u16);
void rfu_CB_pollConnectParent(u8, u16);
void rfu_CB_pollConnectParent(u8, u16);
s32 sub_81E349C(u8);
void rfu_enableREQCallback(bool8);
void rfu_STC_readChildList(void);
void rfu_STC_readParentCandidateList(void);
void rfu_STC_REQ_callback(u8, u16);
void rfu_STC_removeLinkData(u8, u8);
void rfu_STC_fastCopy(u8 **a1, u8 **a2, s32 a3);
void rfu_STC_clearLinkStatus(u8);
void rfu_NI_checkCommFailCounter(void);

extern const char _Str_RFU_MBOOT[];

struct RfuStruct *gRfuState;
ALIGNED(8) struct RfuSlotStatusUNI *gRfuSlotStatusUNI[4];
struct RfuSlotStatusNI *gRfuSlotStatusNI[4];
struct RfuLinkStatus *gRfuLinkStatus;
struct RfuStatic *gRfuStatic;
struct RfuFixed *gRfuFixed;
ALIGNED(8) struct Unk_3007470 gUnknown_3007470;

u16 rfu_initializeAPI(struct Unk_3001190 *unk0, u16 unk1, IntrFunc *interrupt, bool8 copyInterruptToRam)
{
    u16 i;
    u16 *dst;
    const u16 *src;
    u16 r3;

    // is in EWRAM? 
    if (((u32)unk0 & 0xF000000) == 0x2000000 && copyInterruptToRam)
        return 2;
    // is not 4-byte aligned? 
    if ((u32)unk0 & 3)
        return 2;
    // Nintendo pls, just use a ternary for once
    if (copyInterruptToRam)
    {
        // An assert/debug print may have existed before, ie
        // printf("%s %u < %u", "somefile.c:12345", unk1, num)
        // to push this into r3?
        r3 = 0xe64;
        if (unk1 < r3)
            return 1;
    }
    if (!copyInterruptToRam)
    {
        r3 = 0x504; // same as above, this should be r3 not r0
        if (unk1 < r3)
            return 1;
    }
    gRfuLinkStatus = &unk0->linkStatus;
    gRfuStatic = &unk0->static_;
    gRfuFixed = &unk0->fixed;
    gRfuSlotStatusNI[0] = &unk0->NI[0];
    gRfuSlotStatusUNI[0] = &unk0->UNI[0];
    for (i = 1; i < NELEMS(gRfuSlotStatusNI); ++i)
    {
        gRfuSlotStatusNI[i] = &gRfuSlotStatusNI[i - 1][1];
        gRfuSlotStatusUNI[i] = &gRfuSlotStatusUNI[i - 1][1];
    }
    // TODO: Is it possible to fix the following 2 statements? 
    // It's equivalent to: 
    // gRfuFixed->STWIBuffer = &unk0->intr;
    // STWI_init_all(&unk0->intr, interrupt, copyInterruptToRam);
    gRfuFixed->STWIBuffer = (struct RfuIntrStruct *)&gRfuSlotStatusUNI[3][1];
    STWI_init_all((struct RfuIntrStruct *)&gRfuSlotStatusUNI[3][1], interrupt, copyInterruptToRam);
    rfu_STC_clearAPIVariables();
    for (i = 0; i < NELEMS(gRfuSlotStatusNI); ++i)
    {
        gRfuSlotStatusNI[i]->recvBuffer = 0;
        gRfuSlotStatusNI[i]->recvBufferSize = 0;
        gRfuSlotStatusUNI[i]->recvBuffer = 0;
        gRfuSlotStatusUNI[i]->recvBufferSize = 0;
    }
    src = (const u16 *)((u32)&rfu_STC_fastCopy & ~1);
    dst = gRfuFixed->fastCopyBuffer;
    // rfu_REQ_changeMasterSlave is the function next to rfu_STC_fastCopy
    for (r3 = ((void *)rfu_REQ_changeMasterSlave - (void *)rfu_STC_fastCopy) / sizeof(u16), --r3; r3 != 0xFFFF; --r3)
        *dst++ = *src++;
    gRfuFixed->fastCopyPtr = (u8 *)gRfuFixed->fastCopyBuffer + 1;
    return 0;
}

void rfu_STC_clearAPIVariables(void)
{
    u16 IMEBackup = REG_IME;
    u8 i, r4;

    REG_IME = 0;
    r4 = gRfuStatic->flags;
    CpuFill16(0, gRfuStatic, sizeof(struct RfuStatic));
    gRfuStatic->flags = r4 & 8;
    CpuFill16(0, gRfuLinkStatus, sizeof(struct RfuLinkStatus));
    gRfuLinkStatus->watchInterval = 4;
    gRfuStatic->nowWatchInterval = 0;
    gRfuLinkStatus->connMode = 0xFF;
    rfu_clearAllSlot();
    gRfuStatic->SCStartFlag = 0;
    for (i = 0; i < NELEMS(gRfuStatic->cidBak); ++i)
        gRfuStatic->cidBak[i] = 0;
    REG_IME = IMEBackup;
}

void rfu_REQ_PARENT_resumeRetransmitAndChange(void)
{
    STWI_set_Callback_M(rfu_STC_REQ_callback);
    STWI_send_ResumeRetransmitAndChangeREQ();
}

u16 rfu_UNI_PARENT_getDRAC_ACK(u8 *ackFlag)
{
    struct RfuIntrStruct *buf;
    *ackFlag = 0;
    if (gRfuLinkStatus->connMode != 1)
        return 0x300;
    buf = rfu_getSTWIRecvBuffer();
    switch (buf->rxPacketAlloc.rfuPacket8.data[0])
    {
    case 40:
    case 54:
        if (buf->rxPacketAlloc.rfuPacket8.data[1] == 0)
            *ackFlag = gRfuLinkStatus->connSlotFlag;
        else
            *ackFlag = buf->rxPacketAlloc.rfuPacket8.data[4];
        return 0;
    default:
        return 0x10;
    }
}

void rfu_setTimerInterrupt(u8 which, IntrFunc *intr)
{
    STWI_init_timer(intr, which);
}

struct RfuIntrStruct *rfu_getSTWIRecvBuffer(void)
{
    return gRfuFixed->STWIBuffer;
}

void rfu_setMSCCallback(void (*callback)(u16))
{
    STWI_set_Callback_S(callback);
}

void rfu_setREQCallback(void (*callback)(u16, u16))
{
    gRfuFixed->reqCallback = callback;
    rfu_enableREQCallback(callback != NULL);
}

void rfu_enableREQCallback(bool8 enable)
{
    if (enable)
        gRfuStatic->flags |= 8;
    else
        gRfuStatic->flags &= 0xF7;
}

void rfu_STC_REQ_callback(u8 r5, u16 reqResult)
{
    STWI_set_Callback_M(rfu_CB_defaultCallback);
    gRfuStatic->reqResult = reqResult;
    if (gRfuStatic->flags & 8)
        gRfuFixed->reqCallback(r5, reqResult);
}

void rfu_CB_defaultCallback(u8 r0, u16 reqResult)
{
    s32 r5;
    u8 i;

    if (r0 == 0xFF)
    {
        if (gRfuStatic->flags & 8)
            gRfuFixed->reqCallback(r0, reqResult);
        r5 = gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag;
        for (i = 0; i < 4; ++i)
            if ((r5 >> i) & 1)
                rfu_STC_removeLinkData(i, 1);
        gRfuLinkStatus->connMode = 0xFF;
    }
}

u16 rfu_waitREQComplete(void)
{
    STWI_poll_CommandEnd();
    return gRfuStatic->reqResult;
}

void rfu_REQ_RFUStatus(void)
{
    STWI_set_Callback_M(rfu_STC_REQ_callback);
    STWI_send_SystemStatusREQ();
}

u32 rfu_getRFUStatus(u8 *status)
{
    if (gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[0] != 0x93)
        return 0x10;
    if (STWI_poll_CommandEnd() == 0)
        *status = gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[7];
    else
        *status = 0xFF;
    return 0;
}

s32 rfu_MBOOT_CHILD_inheritanceLinkStatus(void)
{
    const char *s1 = _Str_RFU_MBOOT;
    char *s2 = (char *)0x30000F0;
    u16 checksum;
    u16 *r2;
    u8 i;

    while (*s1 != '\0')
        if (*s1++ != *s2++)
            return 1;
    r2 = (u16 *)0x3000000;
    checksum = 0;
    for (i = 0; i < 90; ++i)
        checksum += *r2++;
    if (checksum != *(u16 *)0x30000FA)
        return 1;
    CpuCopy16((u16 *)0x3000000, gRfuLinkStatus, sizeof(struct RfuLinkStatus));
    gRfuStatic->flags |= 0x80;
    return 0;
}

void rfu_REQ_stopMode(void)
{
    vu32 *timerReg;

    if (REG_IME == 0)
    {
        rfu_STC_REQ_callback(61, 6);
        gRfuState->error = 6;
    }
    else
    {
        AgbRFU_SoftReset();
        rfu_STC_clearAPIVariables();
        if (sub_81E349C(8) == 0x8001)
        {
            timerReg = &REG_TMCNT(gRfuState->timerSelect);
            *timerReg = 0;
            *timerReg = (TIMER_ENABLE | TIMER_1024CLK) << 16;
            while (*timerReg << 16 < 262 << 16)
                ;
            *timerReg = 0;
            STWI_set_Callback_M(rfu_CB_stopMode);
            STWI_send_StopModeREQ();
        }
        else
        {
            REG_SIOCNT = SIO_MULTI_MODE;
            rfu_STC_REQ_callback(61, 0);
        }
    }
}

void rfu_CB_stopMode(u8 a1, u16 reqResult)
{
    if (reqResult == 0)
        REG_SIOCNT = SIO_MULTI_MODE;
    rfu_STC_REQ_callback(a1, reqResult);
}

s32 rfu_REQBN_softReset_and_checkID(void)
{
    s32 r2;

    if (REG_IME == 0)
        return -1;
    AgbRFU_SoftReset();
    rfu_STC_clearAPIVariables();
    if ((r2 = sub_81E349C(30)) == 0)
        REG_SIOCNT = SIO_MULTI_MODE;
    return r2;
}

void rfu_REQ_reset(void)
{
    STWI_set_Callback_M(rfu_CB_reset);
    STWI_send_ResetREQ();
}

void rfu_CB_reset(u8 a1, u16 reqResult)
{
    if (reqResult == 0)
        rfu_STC_clearAPIVariables();
    rfu_STC_REQ_callback(a1, reqResult);
}

void rfu_REQ_configSystem(u16 r4, u8 r5, u8 r6)
{
    STWI_set_Callback_M(rfu_STC_REQ_callback);
    STWI_send_SystemConfigREQ((r4 & 3) | 0x3C, r5, r6);
    if (r6 == 0)
    {
        gRfuStatic->unk_1a = 1;
    }
    else
    {
        u16 IMEBackup = REG_IME;

        REG_IME = 0;
        gRfuStatic->unk_1a = Div(600, r6);
        REG_IME = IMEBackup;
    }
}

void rfu_REQ_configGameData(u8 r6, u16 r2, const u8 *r4, const u8 *r7)
{
    u8 sp[16];
    u8 i;
    u8 r3;
    const u8 *r5 = r4;
    const u8 *r1;

    sp[0] = r2;
    sp[1] = r2 >> 8;
    if (r6 != 0)
        sp[1] = (r2 >> 8) | 0x80;
    for (i = 2; i < 15; ++i)
        sp[i] = *r4++;
    r3 = 0;
    r1 = r7;
    for (i = 0; i < 8; ++i)
    {
        r3 += *r1++;
        r3 += *r5++;
    }
    sp[15] = ~r3;
    if (r6 != 0)
        sp[14] = 0;
    STWI_set_Callback_M(rfu_CB_configGameData);
    STWI_send_GameConfigREQ(sp, r7);
}

void rfu_CB_configGameData(u8 ip, u16 r7)
{
    s32 r2, r3;
    u8 *r4;
    u8 i;
    u8 *r1;

    if (r7 == 0)
    {
        r1 = gRfuState->txPacket->rfuPacket8.data;
        r2 = gRfuLinkStatus->my.serialNum = r1[4];
        gRfuLinkStatus->my.serialNum = (r1[5] << 8) | r2;
        r4 = &r1[6];
        if (gRfuLinkStatus->my.serialNum & 0x8000)
        {
            gRfuLinkStatus->my.serialNum = gRfuLinkStatus->my.serialNum ^ 0x8000;
            gRfuLinkStatus->my.multibootFlag = 1;
        }
        else
        {
            gRfuLinkStatus->my.multibootFlag = 0;
        }
        for (i = 0; i < NELEMS(gRfuLinkStatus->my.gname) - 2; ++i)
            gRfuLinkStatus->my.gname[i] = *r4++;
        ++r4;
        for (i = 0; i < NELEMS(gRfuLinkStatus->my.uname) - 1; ++i)
            gRfuLinkStatus->my.uname[i] = *r4++;
    }
    rfu_STC_REQ_callback(ip, r7);
}

void rfu_REQ_startSearchChild(void)
{
    u16 r1;
    
    STWI_set_Callback_M(rfu_CB_defaultCallback);
    STWI_send_SystemStatusREQ();
    r1 = STWI_poll_CommandEnd();
    if (r1 == 0)
    {
        if (gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[7] == 0)
            rfu_STC_clearLinkStatus(1);
    }
    else
    {
        rfu_STC_REQ_callback(25, r1);
    }
    STWI_set_Callback_M(rfu_CB_startSearchChild);
    STWI_send_SC_StartREQ();
}

void rfu_CB_startSearchChild(u8 r3, u16 reqResult)
{
    if (reqResult == 0)
        gRfuStatic->SCStartFlag = 1;
    rfu_STC_REQ_callback(r3, reqResult);
}

void rfu_STC_clearLinkStatus(u8 r4)
{
    u8 i;
    
    rfu_clearAllSlot();
    if (r4 != 0)
    {
        CpuFill16(0, gRfuLinkStatus->partner, sizeof(gRfuLinkStatus->partner));
        gRfuLinkStatus->findParentCount = 0;
    }
    for (i = 0; i < NELEMS(gRfuLinkStatus->strength); ++i)
        gRfuLinkStatus->strength[i] = 0;
    gRfuLinkStatus->connCount = 0;
    gRfuLinkStatus->connSlotFlag = 0;
    gRfuLinkStatus->linkLossSlotFlag = 0;
    gRfuLinkStatus->getNameFlag = 0;
}

void rfu_REQ_pollSearchChild(void)
{
    STWI_set_Callback_M(rfu_CB_pollAndEndSearchChild);
    STWI_send_SC_PollingREQ();
}

void rfu_REQ_endSearchChild(void)
{
    STWI_set_Callback_M(rfu_CB_pollAndEndSearchChild);
    STWI_send_SC_EndREQ();
}

void rfu_CB_pollAndEndSearchChild(u8 r4, u16 reqResult)
{
    if (reqResult == 0)
        rfu_STC_readChildList();
    if (r4 == 26)
    {
        if (gRfuLinkStatus->my.id == 0)
        {
            STWI_set_Callback_M(rfu_CB_defaultCallback);
            STWI_send_SystemStatusREQ();
            if (STWI_poll_CommandEnd() == 0)
                gRfuLinkStatus->my.id = *(u16 *)&gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket32.data[0];
        }
    }
    else if (r4 == 27)
    {
        if (gRfuLinkStatus->connMode == 255)
            gRfuLinkStatus->my.id = 0;
        gRfuStatic->SCStartFlag = 0;
    }
    rfu_STC_REQ_callback(r4, reqResult);
}

void rfu_STC_readChildList(void)
{
    u32 r5;
    u8 r8 = gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[1];
    u8 *r4;
    u8 i;
    u8 sp[4];
    u8 r2;

    if (r8 != 0)
    {
        r5 = gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket32.data[0];
        STWI_set_Callback_M(rfu_CB_defaultCallback);
        STWI_send_LinkStatusREQ();
        if (STWI_poll_CommandEnd() == 0)
        {
            r4 = &gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[4];
            for (i = 0; i < NELEMS(sp); ++i)
                sp[i] = *r4++;
        }
        gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket32.data[0] = r5;
    }
    for (r4 = &gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[4];
         r8 != 0;
         r4 += 4)
    {
        r2 = r4[2];
        if (r2 < 4 && !((gRfuLinkStatus->connSlotFlag >> r2) & 1) && !((gRfuLinkStatus->linkLossSlotFlag >> r2) & 1))
        {
            if (sp[r2] != 0)
                ++gRfuStatic->lsFixedCount[r2];
            if (gRfuStatic->lsFixedCount[r2] >= 4)
            {
                gRfuStatic->lsFixedCount[r2] = 0;
                gRfuLinkStatus->strength[r2] = 0xFF;
                gRfuLinkStatus->connSlotFlag |= 1 << r2;
                ++gRfuLinkStatus->connCount;
                gRfuLinkStatus->partner[r2].id = *(u16 *)r4;
                gRfuLinkStatus->partner[r2].slot = r2;
                gRfuLinkStatus->connMode = 1;
                gRfuStatic->flags &= 0x7F;
                gRfuStatic->cidBak[r2] = gRfuLinkStatus->partner[r2].id;
            }
        }
        --r8;
    }
}

void rfu_REQ_startSearchParent(void)
{
    STWI_set_Callback_M(rfu_CB_startSearchParent);
    STWI_send_SP_StartREQ();
}

void rfu_CB_startSearchParent(u8 r5, u16 reqResult)
{
    if (reqResult == 0)
        rfu_STC_clearLinkStatus(0);
    rfu_STC_REQ_callback(r5, reqResult);
}

void rfu_REQ_pollSearchParent(void)
{
    STWI_set_Callback_M(rfu_CB_pollSearchParent);
    STWI_send_SP_PollingREQ();
}

void rfu_CB_pollSearchParent(u8 r5, u16 reqResult)
{
    if (reqResult == 0)
        rfu_STC_readParentCandidateList();
    rfu_STC_REQ_callback(r5, reqResult);
}

void rfu_REQ_endSearchParent(void)
{
    STWI_set_Callback_M(rfu_STC_REQ_callback);
    STWI_send_SP_EndREQ();
}

void rfu_STC_readParentCandidateList(void)
{
    u8 r7, r6, r5, r4, r3;
    u8 *r1, *r2;
    struct RfuTgtData *r4_;

    CpuFill16(0, gRfuLinkStatus->partner, sizeof(gRfuLinkStatus->partner));
    r2 = &gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[0];
    r7 = r2[1];
    r2 += 4;
    gRfuLinkStatus->findParentCount = 0;
    for (r6 = 0; r6 < 4 && r7 != 0; ++r6)
    {
        r7 -= 7;
        r1 = r2 + 6;
        r2 += 19;
        r5 = ~*r2;
        ++r2;
        r4 = 0;
        for (r3 = 0; r3 < 8; ++r3)
        {
            r4 += *r2++;
            r4 += *r1++;
        }
        if (r4 == r5)
        {
            r2 -= 28;
            r4_ = &gRfuLinkStatus->partner[gRfuLinkStatus->findParentCount];
            r4_->id = *(u16 *)r2;
            r2 += 2;
            r4_->slot = *r2;
            r2 += 2;
            r4_->serialNum = *(u16 *)r2 & 0x7FFF;
            if (*(u16 *)r2 & 0x8000)
                r4_->multibootFlag = 1;
            else
                r4_->multibootFlag = 0;
            r2 += 2;
            for (r3 = 0; r3 < NELEMS(r4_->gname) - 2; ++r3)
                r4_->gname[r3] = *r2++;
            ++r2;
            for (r3 = 0; r3 < NELEMS(r4_->uname) - 1; ++r3)
                r4_->uname[r3] = *r2++;
            ++gRfuLinkStatus->findParentCount;
        }
    }
}

void rfu_REQ_startConnectParent(u16 r4)
{
    u16 r3 = 0;
    u8 i;
    for (i = 0; i < NELEMS(gRfuLinkStatus->partner) && gRfuLinkStatus->partner[i].id != r4; ++i)
        ;
    if (i == 4)
        r3 = 256;
    if (r3 == 0)
    {
        gRfuStatic->tryPid = r4;
        STWI_set_Callback_M(rfu_STC_REQ_callback);
        STWI_send_CP_StartREQ(r4);
    }
    else
    {
        rfu_STC_REQ_callback(31, r3);
    }
}

void rfu_REQ_pollConnectParent(void)
{
    STWI_set_Callback_M(rfu_CB_pollConnectParent);
    STWI_send_CP_PollingREQ();
}

void rfu_CB_pollConnectParent(u8 sp24, u16 sp28)
{
    u16 id;
    u8 slot;
    u8 r2, r5;
    struct RfuTgtData *r9;
    struct RfuTgtData sp;

    if (sp28 == 0)
    {
        id = gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket32.data[0];
        slot = gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[6];
        if (gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[7] == 0)
        {
            r2 = 1 << slot;
            if (!(r2 & gRfuLinkStatus->connSlotFlag))
            {
                gRfuLinkStatus->connSlotFlag |= r2;
                gRfuLinkStatus->linkLossSlotFlag &= ~r2;
                gRfuLinkStatus->my.id = id;
                ++gRfuLinkStatus->connCount;
                gRfuLinkStatus->connMode = 0;
                gRfuStatic->flags |= 0x80;
                for (r5 = 0; r5 < NELEMS(gRfuLinkStatus->partner); ++r5)
                {
                    if (gRfuLinkStatus->partner[r5].id == gRfuStatic->tryPid)
                    {
                        if (gRfuLinkStatus->findParentCount != 0)
                        {
                            r9 = &sp;
                            CpuCopy16(&gRfuLinkStatus->partner[r5], &sp, sizeof(struct RfuTgtData));
                            CpuFill16(0, gRfuLinkStatus->partner, sizeof(gRfuLinkStatus->partner));
                            gRfuLinkStatus->findParentCount = 0;
                        }
                        else
                        {
                            r9 = &gRfuLinkStatus->partner[r5];
                        }
                        break;
                    }
                }
                if (r5 < 4)
                {
                    CpuCopy16(r9, &gRfuLinkStatus->partner[slot], sizeof(struct RfuTgtData));
                    gRfuLinkStatus->partner[slot].slot = slot;
                }
            }
        }
    }
    rfu_STC_REQ_callback(sp24, sp28);
}

u16 rfu_getConnectParentStatus(u8 *status, u8 *r1)
{
    u8 r0, *r2;

    *status = 0xFF;
    r2 = gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data;
    r0 = r2[0] + 96;
    if (r0 <= 1)
    {
        r2 += 6;
        *r1 = r2[0];
        *status = r2[1];
        return 0;
    }
    return 0x10;
}

void rfu_REQ_endConnectParent(void)
{
    STWI_set_Callback_M(rfu_CB_pollConnectParent);
    STWI_send_CP_EndREQ();
    if (gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[6] < 4)
        gRfuStatic->linkEmergencyFlag[gRfuFixed->STWIBuffer->rxPacketAlloc.rfuPacket8.data[6]] = 0;
}

u16 rfu_syncVBlank(void)
{
    u8 r3, r4;
    s32 r5;

    rfu_NI_checkCommFailCounter();
    if (gRfuLinkStatus->connMode == 0xFF)
        return 0;
    if (gRfuStatic->nowWatchInterval != 0)
        --gRfuStatic->nowWatchInterval;
    r3 = rfu_getMasterSlave();
    if (!(gRfuStatic->flags & 2))
    {
        if (r3 == 0)
        {
            gRfuStatic->flags |= 4;
            gRfuStatic->watchdogTimer = 360;
        }
    }
    else if (r3 != 0)
    {
        gRfuStatic->flags &= 0xFB;
    }
    if (r3 != 0)
        gRfuStatic->flags &= 0xFD;
    else
        gRfuStatic->flags |= 2;
    if (!(gRfuStatic->flags & 4))
        return 0;
    if (gRfuStatic->watchdogTimer == 0)
    {
        gRfuStatic->flags &= 0xFB;
        r5 = gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag;
        for (r4 = 0; r4 < 4; ++r4)
            if ((r5 >> r4) & 1)
                rfu_STC_removeLinkData(r4, 1);
        gRfuLinkStatus->connMode = 0xFF;
        return 1;
    }
    --gRfuStatic->watchdogTimer;
    return 0;
}
