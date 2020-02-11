#include "global.h"
#include "link.h"
#include "ereader_helpers.h"

enum {
    EREADER_XFR_STATE_INIT,
    EREADER_XFR_STATE_HANDSHAKE,
    EREADER_XFR_STATE_START,
    EREADER_XFR_STATE_TRANSFER,
};

struct SendRecvMgr
{
    u8 sendOrRecv;
    u8 state;
    u8 field_02;
    u8 field_03;
    u8 field_04;
    u32 * dataptr;
    int cursor;
    int size;
    u32 checksum;
};

static bool16 DetermineSendRecvState(u8);
static void SetUpTransferManager(size_t, const void *, void *);
static void StartTm3(void);
static void EnableSio(void);
static void DisableTm3(void);
static void GetKeyInput(void);

static struct SendRecvMgr sSendRecvMgr;
static u16 sJoyNewOrRepeated;
static u16 sJoyNew;
static u16 sSendRecvStatus;
static u16 sCounter1;
static u32 sCounter2;
static u16 sSavedIme;
static u16 sSavedIe;
static u16 sSavedTm3Cnt;
static u16 sSavedSioCnt;
static u16 sSavedSioCnt;
static u16 sSavedRCnt;

int EReader_Send(size_t r6, const void * r5)
{
    int result;
    EReaderHelper_SaveRegsState();

    while (1)
    {
        GetKeyInput();
        if (TEST_BUTTON(sJoyNew, B_BUTTON))
            gShouldAdvanceLinkState = 2;

        sSendRecvStatus = EReaderHandleTransfer(1, r6, r5, NULL);
        if ((sSendRecvStatus & 0x13) == 0x10)
        {
            result = 0;
            break;
        }
        else if (sSendRecvStatus & 8)
        {
            result = 1;
            break;
        }
        else if (sSendRecvStatus & 4)
        {
            result = 2;
            break;
        }
        else
        {
            gShouldAdvanceLinkState = 0;
            VBlankIntrWait();
        }
    }

    CpuFill32(0, &sSendRecvMgr, sizeof(sSendRecvMgr));
    EReaderHelper_RestoreRegsState();
    return result;
}

int EReader_Recv(void * r5)
{
    int result;
    EReaderHelper_SaveRegsState();

    while (1)
    {
        GetKeyInput();
        if (TEST_BUTTON(sJoyNew, B_BUTTON))
            gShouldAdvanceLinkState = 2;

        sSendRecvStatus = EReaderHandleTransfer(0, 0, NULL, r5);
        if ((sSendRecvStatus & 0x13) == 0x10)
        {
            result = 0;
            break;
        }
        else if (sSendRecvStatus & 8)
        {
            result = 1;
            break;
        }
        else if (sSendRecvStatus & 4)
        {
            result = 2;
            break;
        }
        else
        {
            gShouldAdvanceLinkState = 0;
            VBlankIntrWait();
        }
    }

    CpuFill32(0, &sSendRecvMgr, sizeof(sSendRecvMgr));
    EReaderHelper_RestoreRegsState();
    return result;
}

static void CloseSerial(void)
{
    REG_IME = 0;
    REG_IE &= ~(INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
    REG_IME = 1;
    REG_SIOCNT = 0;
    REG_TM3CNT_H = 0;
    REG_IF = INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL;
}

static void OpenSerialMulti(void)
{
    REG_IME = 0;
    REG_IE &= ~(INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
    REG_IME = 1;
    REG_RCNT = 0;
    REG_SIOCNT = SIO_MULTI_MODE;
    REG_SIOCNT |= SIO_INTR_ENABLE | SIO_115200_BPS;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_SERIAL;
    REG_IME = 1;
    if (sSendRecvMgr.state == 0)
        CpuFill32(0, &sSendRecvMgr, sizeof(sSendRecvMgr));
}

static void OpenSerial32(void)
{
    REG_RCNT = 0;
    REG_SIOCNT = SIO_INTR_ENABLE | SIO_32BIT_MODE;
    REG_SIOCNT |= SIO_MULTI_SD;
    gShouldAdvanceLinkState = 0;
    sCounter1 = 0;
    sCounter2 = 0;
}

u16 EReaderHandleTransfer(u8 mode, size_t size, const void * data, void * recvBuffer)
{
    switch (sSendRecvMgr.state)
    {
    case 0:
        OpenSerialMulti();
        sSendRecvMgr.field_02 = 1;
        sSendRecvMgr.state = 1;
        break;
    case 1:
        if (DetermineSendRecvState(mode))
            EnableSio();
        if (gShouldAdvanceLinkState == 2)
        {
            sSendRecvMgr.field_04 = 2;
            sSendRecvMgr.state = 6;
        }
        break;
    case 2:
        OpenSerial32();
        SetUpTransferManager(size, data, recvBuffer);
        sSendRecvMgr.state = 3;
        // fallthrough
    case 3:
        if (gShouldAdvanceLinkState == 2)
        {
            sSendRecvMgr.field_04 = 2;
            sSendRecvMgr.state = 6;
        }
        else
        {
            sCounter1++;
            sCounter2++;
            if (sSendRecvMgr.sendOrRecv == 0 && sCounter2 > 60)
            {
                sSendRecvMgr.field_04 = 1;
                sSendRecvMgr.state = 6;
            }
            if (sSendRecvMgr.field_02 != 2)
            {
                if (sSendRecvMgr.sendOrRecv != 0 && sCounter1 > 2)
                {
                    EnableSio();
                    sSendRecvMgr.field_02 = 2;
                }
                else
                {
                    EnableSio();
                    sSendRecvMgr.field_02 = 2;
                }
            }
        }
        break;
    case 4:
        OpenSerialMulti();
        sSendRecvMgr.state = 5;
        break;
    case 5:
        if (sSendRecvMgr.sendOrRecv == 1 && sCounter1 > 2)
            EnableSio();
        if (++sCounter1 > 60)
        {
            sSendRecvMgr.field_04 = 1;
            sSendRecvMgr.state = 6;
        }
        break;
    case 6:
        if (sSendRecvMgr.field_02 != 0)
        {
            CloseSerial();
            sSendRecvMgr.field_02 = 0;
        }
        break;
    }
    return sSendRecvMgr.field_02 | (sSendRecvMgr.field_04 << 2) | (sSendRecvMgr.field_03 << 4);
}

static bool16 DetermineSendRecvState(u8 mode)
{
    bool16 resp;
    if ((*(vu32 *)REG_ADDR_SIOCNT & (SIO_MULTI_SI | SIO_MULTI_SD)) == SIO_MULTI_SD && mode)
        resp = sSendRecvMgr.sendOrRecv = TRUE;
    else
        resp = sSendRecvMgr.sendOrRecv = FALSE;
    return resp;
}

static void SetUpTransferManager(size_t size, const void * data, void * recvBuffer)
{
    if (sSendRecvMgr.sendOrRecv)
    {
        REG_SIOCNT |= SIO_38400_BPS;
        sSendRecvMgr.dataptr = (void *)data;
        REG_SIODATA32 = size;
        sSendRecvMgr.size = size / 4 + 1;
        StartTm3();
    }
    else
    {
        REG_SIOCNT |= SIO_9600_BPS;
        sSendRecvMgr.dataptr = recvBuffer;
    }
}

static void StartTm3(void)
{
    REG_TM3CNT_L = -601;
    REG_TM3CNT_H = TIMER_INTR_ENABLE;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_TIMER3;
    REG_IME = 1;
}

void EReaderHelper_Timer3Callback(void)
{
    DisableTm3();
    EnableSio();
}

void EReaderHelper_SerialCallback(void)
{
    u16 recv[4];
    u16 i;
    u16 cnt1;
    u16 cnt2;
    u32 recv32;

    switch (sSendRecvMgr.state)
    {
    case 1:
        REG_SIOMLT_SEND = 0xCCD0;
        *(u64 *)recv = REG_SIOMLT_RECV;
        for (i = 0, cnt1 = 0, cnt2 = 0; i < 4; i++)
        {
            if (recv[i] == 0xCCD0)
                cnt1++;
            else if (recv[i] != 0xFFFF)
                cnt2++;
        }
        if (cnt1 == 2 && cnt2 == 0)
            sSendRecvMgr.state = 2;
        break;
    case 3:
        recv32 = REG_SIODATA32;
        if (sSendRecvMgr.cursor == 0 && sSendRecvMgr.sendOrRecv == 0)
            sSendRecvMgr.size = recv32 / 4 + 1;
        if (sSendRecvMgr.sendOrRecv == 1)
        {
            if (sSendRecvMgr.cursor < sSendRecvMgr.size)
            {
                REG_SIODATA32 = sSendRecvMgr.dataptr[sSendRecvMgr.cursor];
                sSendRecvMgr.checksum += sSendRecvMgr.dataptr[sSendRecvMgr.cursor];
            }
            else
                REG_SIODATA32 = sSendRecvMgr.checksum;
        }
        else
        {
            if (sSendRecvMgr.cursor > 0 && sSendRecvMgr.cursor < sSendRecvMgr.size + 1)
            {
                sSendRecvMgr.dataptr[sSendRecvMgr.cursor - 1] = recv32;
                sSendRecvMgr.checksum += recv32;
            }
            else if (sSendRecvMgr.cursor != 0)
            {
                if (sSendRecvMgr.checksum == recv32)
                    sSendRecvMgr.field_03 = 1;
                else
                    sSendRecvMgr.field_03 = 2;
            }
            sCounter2 = 0;
        }
        sSendRecvMgr.cursor++;
        if (sSendRecvMgr.cursor < sSendRecvMgr.size + 2)
        {
            if (sSendRecvMgr.sendOrRecv != 0)
                REG_TM3CNT_H |= TIMER_ENABLE;
            else
                EnableSio();
        }
        else
        {
            sSendRecvMgr.state = 4;
            sCounter1 = 0;
        }
        break;
    case 5:
        if (sSendRecvMgr.sendOrRecv == 0)
            REG_SIODATA8 = sSendRecvMgr.field_03;
        *(vu64 *)recv = REG_SIOMLT_RECV;
        if (recv[1] == 1 || recv[1] == 2)
        {
            if (sSendRecvMgr.sendOrRecv == 1)
                sSendRecvMgr.field_03 = recv[1];
            sSendRecvMgr.state = 6;
        }
        break;
    }
}

static void EnableSio(void)
{
    REG_SIOCNT |= SIO_ENABLE;
}

static void DisableTm3(void)
{
    REG_TM3CNT_H &= ~TIMER_ENABLE;
    REG_TM3CNT_L = -601;
}

static void GetKeyInput(void)
{
    u16 rawKeys = REG_KEYINPUT ^ 0x3FF;
    sJoyNew = rawKeys & ~sJoyNewOrRepeated;
    sJoyNewOrRepeated = rawKeys;
}

void EReaderHelper_SaveRegsState(void)
{
    sSavedIme = REG_IME;
    sSavedIe = REG_IE;
    sSavedTm3Cnt = REG_TM3CNT_H;
    sSavedSioCnt = REG_SIOCNT;
    sSavedRCnt = REG_RCNT;
}

void EReaderHelper_RestoreRegsState(void)
{
    REG_IME = sSavedIme;
    REG_IE = sSavedIe;
    REG_TM3CNT_H = sSavedTm3Cnt;
    REG_SIOCNT = sSavedSioCnt;
    REG_RCNT = sSavedRCnt;
}

void EReaderHelper_ClearsSendRecvMgr(void)
{
    CpuFill32(0, &sSendRecvMgr, sizeof(sSendRecvMgr));
}
