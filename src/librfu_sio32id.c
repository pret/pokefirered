#include "librfu.h"

static void Sio32IDIntr(void);
static void Sio32IDInit(void);
static s32 Sio32IDMain(void);

struct RfuSIO32Id
{
    u8 unk0;
    u8 state;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8; // unused
    u16 lastId;
};

struct RfuSIO32Id gRfuSIO32Id;

static const u16 Sio32ConnectionData[] = { 0x494e, 0x544e, 0x4e45, 0x4f44 }; // NINTENDO
static const char Sio32IDLib_Var[] = "Sio32ID_030820";

s32 AgbRFU_checkID(u8 maxTries)
{
    u16 ieBak;
    vu16 *regTMCNTL;
    s32 id;

    // Interrupts must be enabled
    if (REG_IME == 0)
        return -1;
    ieBak = REG_IE;
    gSTWIStatus->state = 10;
    STWI_set_Callback_ID(Sio32IDIntr);
    Sio32IDInit();
    regTMCNTL = &REG_TMCNT_L(gSTWIStatus->timerSelect);
    maxTries *= 8;
    while (--maxTries != 0xFF)
    {
        id = Sio32IDMain();
        if (id != 0)
            break;
        regTMCNTL[1] = 0;
        regTMCNTL[0] = 0;
        regTMCNTL[1] = TIMER_1024CLK | TIMER_ENABLE;
        while (regTMCNTL[0] < 32)
            ;
        regTMCNTL[1] = 0;
        regTMCNTL[0] = 0;
    }
    REG_IME = 0;
    REG_IE = ieBak;
    REG_IME = 1;
    gSTWIStatus->state = 0;
    STWI_set_Callback_ID(NULL);
    return id;
}

static void Sio32IDInit(void)
{
    REG_IME = 0;
    REG_IE &= ~((8 << gSTWIStatus->timerSelect) | INTR_FLAG_SERIAL);
    REG_IME = 1;
    REG_RCNT = 0;
    REG_SIOCNT = SIO_32BIT_MODE;
    REG_SIOCNT |= SIO_INTR_ENABLE | SIO_ENABLE;
    CpuFill32(0, &gRfuSIO32Id, sizeof(struct RfuSIO32Id));
    REG_IF = INTR_FLAG_SERIAL;
}

static s32 Sio32IDMain(void)
{
    switch (gRfuSIO32Id.state)
    {
    case 0:
        gRfuSIO32Id.unk0 = 1;
        REG_SIOCNT |= SIO_38400_BPS;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_SERIAL;
        REG_IME = 1;
        gRfuSIO32Id.state = 1;
        *(vu8 *)&REG_SIOCNT |= SIO_ENABLE;
        break;
    case 1:
        if (gRfuSIO32Id.lastId == 0)
        {
            if (gRfuSIO32Id.unk0 == 1)
            {
                if (gRfuSIO32Id.unk2 == 0)
                {
                    REG_IME = 0;
                    REG_SIOCNT |= SIO_ENABLE;
                    REG_IME = 1;
                }
            }
            else if (gRfuSIO32Id.unk4 != RFU_ID && !gRfuSIO32Id.unk2)
            {
                REG_IME = 0;
                REG_IE &= ~INTR_FLAG_SERIAL;
                REG_IME = 1;
                REG_SIOCNT = 0;
                REG_SIOCNT = SIO_32BIT_MODE;
                REG_IF = INTR_FLAG_SERIAL;
                REG_SIOCNT |= SIO_INTR_ENABLE | SIO_ENABLE;
                REG_IME = 0;
                REG_IE |= INTR_FLAG_SERIAL;
                REG_IME = 1;
            }
            break;
        }
        else
        {
            gRfuSIO32Id.state = 2;
            // fallthrough
        }
    default:
        return gRfuSIO32Id.lastId;
    }
    return 0;
}

static void Sio32IDIntr(void)
{
    u32 regSIODATA32;
    u16 delay;
#ifndef NONMATCHING
    register u32 rfuSIO32IdUnk0_times_16 asm("r1");
    register u16 negRfuSIO32IdUnk6 asm("r0");
#else
    u32 rfuSIO32IdUnk0_times_16;
    u16 negRfuSIO32IdUnk6;
#endif

    regSIODATA32 = REG_SIODATA32;
    if (gRfuSIO32Id.unk0 != 1)
        REG_SIOCNT |= SIO_ENABLE;
    rfuSIO32IdUnk0_times_16 = 16 * gRfuSIO32Id.unk0; // to handle side effect of inline asm
    rfuSIO32IdUnk0_times_16 = (regSIODATA32 << rfuSIO32IdUnk0_times_16) >> 16;
    regSIODATA32 = (regSIODATA32 << 16 * (1 - gRfuSIO32Id.unk0)) >> 16;
    if (gRfuSIO32Id.lastId == 0)
    {
        if (rfuSIO32IdUnk0_times_16 == gRfuSIO32Id.unk6)
        {
            if (gRfuSIO32Id.unk2 > 3)
            {
                gRfuSIO32Id.lastId = regSIODATA32;
            }
            else if (rfuSIO32IdUnk0_times_16 == (u16)~gRfuSIO32Id.unk4)
            {
                negRfuSIO32IdUnk6 = ~gRfuSIO32Id.unk6;
                if (regSIODATA32 == negRfuSIO32IdUnk6)
                    ++gRfuSIO32Id.unk2;
            }
        }
        else
        {
            gRfuSIO32Id.unk2 = gRfuSIO32Id.lastId;
        }
    }
    if (gRfuSIO32Id.unk2 < 4)
        gRfuSIO32Id.unk4 = *(gRfuSIO32Id.unk2 + Sio32ConnectionData);
    else
        gRfuSIO32Id.unk4 = RFU_ID;
    gRfuSIO32Id.unk6 = ~regSIODATA32;
    REG_SIODATA32 = (gRfuSIO32Id.unk4 << 16 * (1 - gRfuSIO32Id.unk0))
                  + (gRfuSIO32Id.unk6 << 16 * gRfuSIO32Id.unk0);
    if (gRfuSIO32Id.unk0 == 1 && (gRfuSIO32Id.unk2 || regSIODATA32 == 0x494e))
    {
        for (delay = 0; delay < 600; ++delay)
            ;
        if (gRfuSIO32Id.lastId == 0)
            REG_SIOCNT |= SIO_ENABLE;
    }
}
