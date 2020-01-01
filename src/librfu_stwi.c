#include "global.h"
#include "librfu.h"

static void STWI_intr_timer(void);
static u16 STWI_init(u8 request);
static s32 STWI_start_Command(void);
static void STWI_set_timer(u8 unk);
static void STWI_stop_timer(void);
static s32 STWI_restart_Command(void);
static s32 STWI_reset_ClockCounter(void);

void STWI_init_all(struct RfuIntrStruct *interruptStruct, IntrFunc *interrupt, bool8 copyInterruptToRam)
{
    // If we're copying our interrupt into RAM, DMA it to block1 and use
    // block2 for our RfuStruct, otherwise block1 holds the RfuStruct.
    // interrupt usually is a pointer to gIntrTable[1]
    if (copyInterruptToRam == TRUE)
    {
        *interrupt = (IntrFunc)interruptStruct->block1;
        DmaCopy16(3, &IntrSIO32, interruptStruct->block1, sizeof(interruptStruct->block1));
        gRfuState = &interruptStruct->block2;
    }
    else
    {
        *interrupt = IntrSIO32;
        gRfuState = (struct RfuStruct *)interruptStruct->block1;
    }
    gRfuState->rxPacket = &interruptStruct->rxPacketAlloc;
    gRfuState->txPacket = &interruptStruct->txPacketAlloc;
    gRfuState->msMode = 1;
    gRfuState->state = 0;
    gRfuState->reqLength = 0;
    gRfuState->reqNext = 0;
    gRfuState->ackLength = 0;
    gRfuState->ackNext = 0;
    gRfuState->ackActiveCommand = 0;
    gRfuState->timerState = 0;
    gRfuState->timerActive = 0;
    gRfuState->error = 0;
    gRfuState->recoveryCount = 0;
    gRfuState->unk_2c = 0;
    REG_RCNT = 0x100; // TODO: mystery bit? 
    REG_SIOCNT = SIO_INTR_ENABLE | SIO_32BIT_MODE | SIO_115200_BPS;
    STWI_init_Callback_M();
    STWI_init_Callback_S();
    IntrEnable(INTR_FLAG_SERIAL);
}

void STWI_init_timer(IntrFunc *interrupt, s32 timerSelect)
{
    *interrupt = STWI_intr_timer;
    gRfuState->timerSelect = timerSelect;
    IntrEnable(INTR_FLAG_TIMER0 << gRfuState->timerSelect);
}

void AgbRFU_SoftReset(void)
{
    vu16 *timerL;
    vu16 *timerH;

    REG_RCNT = 0x8000;
    REG_RCNT = 0x80A0; // all these bits are undocumented
    timerL = &REG_TMCNT_L(gRfuState->timerSelect);
    timerH = &REG_TMCNT_H(gRfuState->timerSelect);
    *timerH = 0;
    *timerL = 0;
    *timerH = TIMER_ENABLE | TIMER_1024CLK;
    while (*timerL <= 0x11)
        REG_RCNT = 0x80A2;
    *timerH = 3;
    REG_RCNT = 0x80A0;
    REG_SIOCNT = SIO_INTR_ENABLE | SIO_32BIT_MODE | SIO_115200_BPS;
    gRfuState->state = 0;
    gRfuState->reqLength = 0;
    gRfuState->reqNext = 0;
    gRfuState->reqActiveCommand = 0;
    gRfuState->ackLength = 0;
    gRfuState->ackNext = 0;
    gRfuState->ackActiveCommand = 0;
    gRfuState->timerState = 0;
    gRfuState->timerActive = 0;
    gRfuState->error = 0;
    gRfuState->msMode = 1;
    gRfuState->recoveryCount = 0;
    gRfuState->unk_2c = 0;
}

void STWI_set_MS_mode(u8 mode)
{
    gRfuState->msMode = mode;
}

u16 STWI_read_status(u8 index)
{
    switch (index)
    {
    case 0:
        return gRfuState->error;
    case 1:
        return gRfuState->msMode;
    case 2:
        return gRfuState->state;
    case 3:
        return gRfuState->reqActiveCommand;
    default:
        return 0xFFFF;
    }
}

void STWI_init_Callback_M(void)
{
    STWI_set_Callback_M(NULL);
}

void STWI_init_Callback_S(void)
{
    STWI_set_Callback_S(NULL);
}

// The callback can take 2 or 3 arguments. 
void STWI_set_Callback_M(void *callbackM)
{
    gRfuState->callbackM = callbackM;
}

void STWI_set_Callback_S(void (*callbackS)(u16))
{
    gRfuState->callbackS = callbackS;
}

void STWI_set_CallbackUnk(void (*func)(void))
{
    gRfuState->unk_20 = func;
}

u16 STWI_poll_CommandEnd(void)
{
    while (gRfuState->unk_2c == TRUE)
        ;
    return gRfuState->error;
}

void STWI_send_ResetREQ(void)
{
    if (!STWI_init(RFU_RESET))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_LinkStatusREQ(void)
{
    if (!STWI_init(RFU_LINK_STATUS))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_VersionStatusREQ(void)
{
    if (!STWI_init(RFU_VERSION_STATUS))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_SystemStatusREQ(void)
{
    if (!STWI_init(RFU_SYSTEM_STATUS))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_SlotStatusREQ(void)
{
    if (!STWI_init(RFU_SLOT_STATUS))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_ConfigStatusREQ(void)
{
    if (!STWI_init(RFU_CONFIG_STATUS))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_GameConfigREQ(const u8 *unk1, const u8 *data)
{
    u8 *packetBytes;
    s32 i;

    if (!STWI_init(RFU_GAME_CONFIG))
    {
        gRfuState->reqLength = 6;
        // TODO: what is unk1
        packetBytes = gRfuState->txPacket->rfuPacket8.data;
        packetBytes += sizeof(u32);
        *(u16 *)packetBytes = *(u16 *)unk1;
        packetBytes += sizeof(u16);
        unk1 += sizeof(u16);
        for (i = 0; i < 14; ++i)
        {
            *packetBytes = *unk1;
            ++packetBytes;
            ++unk1;
        }
        for (i = 0; i < 8; ++i)
        {
            *packetBytes = *data;
            ++packetBytes;
            ++data;
        }
        STWI_start_Command();
    }
}

void STWI_send_SystemConfigREQ(u16 unk1, u8 unk2, u8 unk3)
{
    if (!STWI_init(RFU_SYSTEM_CONFIG))
    {
        u8 *packetBytes;

        gRfuState->reqLength = 1;
        packetBytes = gRfuState->txPacket->rfuPacket8.data;
        packetBytes += sizeof(u32);
        *packetBytes++ = unk3;
        *packetBytes++ = unk2;
        *(u16*)packetBytes = unk1;
        STWI_start_Command();
    }
}

void STWI_send_SC_StartREQ(void)
{
    if (!STWI_init(RFU_SC_START))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_SC_PollingREQ(void)
{
    if (!STWI_init(RFU_SC_POLLING))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_SC_EndREQ(void)
{
    if (!STWI_init(RFU_SC_END))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_SP_StartREQ(void)
{
    if (!STWI_init(RFU_SP_START))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_SP_PollingREQ(void)
{
    if (!STWI_init(RFU_SP_POLLING))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_SP_EndREQ(void)
{
    if (!STWI_init(RFU_SP_END))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_CP_StartREQ(u16 unk1)
{
    if (!STWI_init(RFU_CP_START))
    {
        gRfuState->reqLength = 1;
        gRfuState->txPacket->rfuPacket32.data[0] = unk1;
        STWI_start_Command();
    }
}

void STWI_send_CP_PollingREQ(void)
{
    if (!STWI_init(RFU_CP_POLLING))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_CP_EndREQ(void)
{
    if (!STWI_init(RFU_CP_END))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_DataTxREQ(const void *in, u8 size)
{
    if (!STWI_init(RFU_DATA_TX))
    {
        u8 reqLength = (size / sizeof(u32));
        if (size & (sizeof(u32) - 1))
            reqLength += 1;
        gRfuState->reqLength = reqLength;
        CpuCopy32(in, gRfuState->txPacket->rfuPacket32.data, gRfuState->reqLength * sizeof(u32));
        STWI_start_Command();
    }
}

void STWI_send_DataTxAndChangeREQ(const void *in, u8 size)
{
    if (!STWI_init(RFU_DATA_TX_AND_CHANGE))
    {
        u8 reqLength = (size / sizeof(u32));
        if (size & (sizeof(u32) - 1))
            reqLength += 1;
        gRfuState->reqLength = reqLength;
        CpuCopy32(in, gRfuState->txPacket->rfuPacket32.data, gRfuState->reqLength * sizeof(u32));
        STWI_start_Command();
    }
}

void STWI_send_DataRxREQ(void)
{
    if (!STWI_init(RFU_DATA_RX))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_MS_ChangeREQ(void)
{
    if (!STWI_init(RFU_MS_CHANGE))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_DataReadyAndChangeREQ(u8 unk)
{
    if (!STWI_init(RFU_DATA_READY_AND_CHANGE))
    {
        if (!unk)
        {
            gRfuState->reqLength = 0;
        }
        else
        {
            u8 *packetBytes;

            gRfuState->reqLength = 1;
            packetBytes = gRfuState->txPacket->rfuPacket8.data;
            packetBytes += sizeof(u32);
            *packetBytes++ = unk;
            *packetBytes++ = 0;
            *packetBytes++ = 0;
            *packetBytes = 0;
        }
        STWI_start_Command();
    }
}

void STWI_send_DisconnectedAndChangeREQ(u8 unk0, u8 unk1)
{
    if (!STWI_init(RFU_DISCONNECTED_AND_CHANGE))
    {
        u8 *packetBytes;

        gRfuState->reqLength = 1;
        packetBytes = gRfuState->txPacket->rfuPacket8.data;
        packetBytes += sizeof(u32);
        *packetBytes++ = unk0;
        *packetBytes++ = unk1;
        *packetBytes++ = 0;
        *packetBytes = 0;
        STWI_start_Command();
    }
}

void STWI_send_ResumeRetransmitAndChangeREQ(void)
{
    if (!STWI_init(RFU_RESUME_RETRANSMIT_AND_CHANGE))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_DisconnectREQ(u8 unk)
{
    if (!STWI_init(RFU_DISCONNECT))
    {
        gRfuState->reqLength = 1;
        gRfuState->txPacket->rfuPacket32.data[0] = unk;
        STWI_start_Command();
    }
}

void STWI_send_TestModeREQ(u8 unk0, u8 unk1)
{
    if (!STWI_init(RFU_TEST_MODE))
    {
        gRfuState->reqLength = 1;
        gRfuState->txPacket->rfuPacket32.data[0] = unk0 | (unk1 << 8);
        STWI_start_Command();
    }
}

void STWI_send_CPR_StartREQ(u16 unk0, u16 unk1, u8 unk2)
{
    u32 *packetData;
    u32 arg1;

    if (!STWI_init(RFU_CPR_START))
    {
        gRfuState->reqLength = 2;
        arg1 = unk1 | (unk0 << 16);
        packetData = gRfuState->txPacket->rfuPacket32.data;
        packetData[0] = arg1;
        packetData[1] = unk2;
        STWI_start_Command();
    }
}

void STWI_send_CPR_PollingREQ(void)
{
    if (!STWI_init(RFU_CPR_POLLING))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_CPR_EndREQ(void)
{
    if (!STWI_init(RFU_CPR_END))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

void STWI_send_StopModeREQ(void)
{
    if (!STWI_init(RFU_STOP_MODE))
    {
        gRfuState->reqLength = 0;
        STWI_start_Command();
    }
}

static void STWI_intr_timer(void)
{
    switch (gRfuState->timerState)
    {
    // TODO: Make an enum for these
    case 2:
        gRfuState->timerActive = 1;
        STWI_set_timer(50);
        break;
    case 1:
    case 4:
        STWI_stop_timer();
        STWI_restart_Command();
        break;
    case 3:
        gRfuState->timerActive = 1;
        STWI_stop_timer();
        STWI_reset_ClockCounter();
        if (gRfuState->callbackM != NULL)
            gRfuState->callbackM(255, 0);
        break;
    }
}

static void STWI_set_timer(u8 unk)
{
    vu16 *timerL;
    vu16 *timerH;

    timerL = &REG_TMCNT_L(gRfuState->timerSelect);
    timerH = &REG_TMCNT_H(gRfuState->timerSelect);
    REG_IME = 0;
    switch (unk)
    {
    case 50:
        *timerL = 0xFCCB;
        gRfuState->timerState = 1;
        break;
    case 80:
        *timerL = 0xFAE0;
        gRfuState->timerState = 2;
        break;
    case 100:
        *timerL = 0xF996;
        gRfuState->timerState = 3;
        break;
    case 130:
        *timerL = 0xF7AD;
        gRfuState->timerState = 4;
        break;
    }
    *timerH = TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_1024CLK;
    REG_IF = INTR_FLAG_TIMER0 << gRfuState->timerSelect;
    REG_IME = 1;
}

static void STWI_stop_timer(void)
{
    gRfuState->timerState = 0;
    REG_TMCNT_L(gRfuState->timerSelect) = 0;
    REG_TMCNT_H(gRfuState->timerSelect) = 0;
}

static u16 STWI_init(u8 request)
{
    if (!REG_IME)
    {
        gRfuState->error = 6;
        if (gRfuState->callbackM != NULL)
            gRfuState->callbackM(request, gRfuState->error);
        return TRUE;
    }
    else if (gRfuState->unk_2c == TRUE)
    {
        gRfuState->error = 2;
        gRfuState->unk_2c = FALSE;
        if (gRfuState->callbackM != NULL)
            gRfuState->callbackM(request, gRfuState->error);
        return TRUE;
    }
    else if(!gRfuState->msMode)
    {
        gRfuState->error = 4;
        if (gRfuState->callbackM != NULL)
            gRfuState->callbackM(request, gRfuState->error, gRfuState);
        return TRUE;
    }
    else
    {
        gRfuState->unk_2c = TRUE;
        gRfuState->reqActiveCommand = request;
        gRfuState->state = 0;
        gRfuState->reqLength = 0;
        gRfuState->reqNext = 0;
        gRfuState->ackLength = 0;
        gRfuState->ackNext = 0;
        gRfuState->ackActiveCommand = 0;
        gRfuState->timerState = 0;
        gRfuState->timerActive = 0;
        gRfuState->error = 0;
        gRfuState->recoveryCount = 0;
        REG_RCNT = 0x100;
        REG_SIOCNT = SIO_INTR_ENABLE | SIO_32BIT_MODE | SIO_115200_BPS;
        return FALSE;
    }
}

static s32 STWI_start_Command(void)
{
    u16 imeTemp;

    // equivalent to gRfuState->txPacket->rfuPacket32.command, 
    // but the cast here is required to avoid register issue
    *(u32 *)gRfuState->txPacket->rfuPacket8.data = 0x99660000 | (gRfuState->reqLength << 8) | gRfuState->reqActiveCommand;
    REG_SIODATA32 = gRfuState->txPacket->rfuPacket32.command;
    gRfuState->state = 0;
    gRfuState->reqNext = 1;
    imeTemp = REG_IME;
    REG_IME = 0;
    REG_IE |= (INTR_FLAG_TIMER0 << gRfuState->timerSelect);
    REG_IE |= INTR_FLAG_SERIAL;
    REG_IME = imeTemp;
    REG_SIOCNT = SIO_INTR_ENABLE | SIO_32BIT_MODE | SIO_MULTI_BUSY | SIO_115200_BPS;
    return 0;
}

static s32 STWI_restart_Command(void)
{
    if (gRfuState->recoveryCount <= 1)
    {
        ++gRfuState->recoveryCount;
        STWI_start_Command();
    }
    else
    {
        if (gRfuState->reqActiveCommand == RFU_MS_CHANGE || gRfuState->reqActiveCommand == RFU_DATA_TX_AND_CHANGE || gRfuState->reqActiveCommand == RFU_UNK35 || gRfuState->reqActiveCommand == RFU_RESUME_RETRANSMIT_AND_CHANGE)
        {
            gRfuState->error = 1;
            gRfuState->unk_2c = 0;
            if (gRfuState->callbackM != NULL)
                gRfuState->callbackM(gRfuState->reqActiveCommand, gRfuState->error);
        }
        else
        {
            gRfuState->error = 1;
            gRfuState->unk_2c = 0;
            if (gRfuState->callbackM != NULL)
                gRfuState->callbackM(gRfuState->reqActiveCommand, gRfuState->error);
            gRfuState->state = 4; // TODO: what's 4
        }
    }
    return 0;
}

static s32 STWI_reset_ClockCounter(void)
{
    gRfuState->state = 5; // TODO: what is 5
    gRfuState->reqLength = 0;
    gRfuState->reqNext = 0;
    REG_SIODATA32 = (1 << 31);
    REG_SIOCNT = 0;
    REG_SIOCNT = SIO_INTR_ENABLE | SIO_32BIT_MODE | SIO_115200_BPS;
    REG_SIOCNT = (SIO_INTR_ENABLE | SIO_32BIT_MODE | SIO_115200_BPS) + 0x7F;
    return 0;
}
