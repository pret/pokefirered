#include "global.h"
#include "librfu.h"

static void sio32intr_clock_master(void);
static void sio32intr_clock_slave(void);
static u16 handshake_wait(u16 slot);
static void STWI_set_timer_in_RAM(u8 count);
static void STWI_stop_timer_in_RAM(void);
static void STWI_init_slave(void);
static void Callback_Dummy_M(int reqCommandId, int error, void (*callbackM)());
static void Callback_Dummy_S(u16 reqCommandId, void (*callbackS)(u16));
static void Callback_Dummy_ID(void (*callbackId)(void));

void IntrSIO32(void)
{
    if (gSTWIStatus->state == 10)
    {
        if (gSTWIStatus->callbackID != NULL)
            Callback_Dummy_ID(gSTWIStatus->callbackID);
    }
    else
    {
        if (gSTWIStatus->msMode == AGB_CLK_MASTER)
            sio32intr_clock_master();
        else
            sio32intr_clock_slave();
    }
}

static void sio32intr_clock_master(void)
{
    u32 regSIODATA32;
    u32 ackLen;

    STWI_set_timer_in_RAM(80);
    regSIODATA32 = REG_SIODATA32;

    if (gSTWIStatus->state == 0)
    {
        if (regSIODATA32 == 0x80000000)
        {
            if (gSTWIStatus->reqNext <= gSTWIStatus->reqLength)
            {
                REG_SIODATA32 = ((u32*)gSTWIStatus->txPacket->rfuPacket8.data)[gSTWIStatus->reqNext];
                gSTWIStatus->reqNext++;
            }
            else
            {
                gSTWIStatus->state = 1;
                REG_SIODATA32 = 0x80000000;
            }
        }
        else
        {
            STWI_stop_timer_in_RAM();
            STWI_set_timer_in_RAM(130);
            return;
        }
    }
    else if (gSTWIStatus->state == 1)
    {
        if ((regSIODATA32 & 0xFFFF0000) == 0x99660000)
        {
            gSTWIStatus->ackNext = 0;
            ((u32*)gSTWIStatus->rxPacket)[gSTWIStatus->ackNext] = regSIODATA32;
            gSTWIStatus->ackNext++;
            gSTWIStatus->ackActiveCommand = regSIODATA32;
            gSTWIStatus->ackLength = ackLen = regSIODATA32 >> 8;
            if ((ackLen = gSTWIStatus->ackLength) >= gSTWIStatus->ackNext)
            {
                gSTWIStatus->state = 2;
                REG_SIODATA32 = 0x80000000;
            }
            else
            {
                gSTWIStatus->state = 3;
            }
        }
        else
        {
            STWI_stop_timer_in_RAM();
            STWI_set_timer_in_RAM(130);
            return;
        }
    }
    else if (gSTWIStatus->state == 2)
    {
        ((u32*)gSTWIStatus->rxPacket)[gSTWIStatus->ackNext] = regSIODATA32;
        gSTWIStatus->ackNext++;
        if (gSTWIStatus->ackLength < gSTWIStatus->ackNext)
            gSTWIStatus->state = 3;
        else
            REG_SIODATA32 = 0x80000000;
    }

    if (handshake_wait(1) == 1)
        return;

    REG_SIOCNT = 0x500B;

    if (handshake_wait(0) == 1)
        return;

    STWI_stop_timer_in_RAM();

    if (gSTWIStatus->state == 3)
    {
        if (
            gSTWIStatus->ackActiveCommand == (0x80 | ID_MS_CHANGE_REQ)
         || gSTWIStatus->ackActiveCommand == (0x80 | ID_DATA_TX_AND_CHANGE_REQ)
         || gSTWIStatus->ackActiveCommand == (0x80 | ID_UNK35_REQ)
         || gSTWIStatus->ackActiveCommand == (0x80 | ID_RESUME_RETRANSMIT_AND_CHANGE_REQ)
        )
        {

            gSTWIStatus->msMode = 0;
            REG_SIODATA32 = 0x80000000;
            REG_SIOCNT = 0x5002;
            REG_SIOCNT = 0x5082;
            gSTWIStatus->state = 5;
        }
        else
        {

            if (gSTWIStatus->ackActiveCommand == 238)
            {
                REG_SIOCNT = 0x5003;
                gSTWIStatus->state = 4;
                gSTWIStatus->error = ERR_REQ_CMD_ACK_REJECTION;
            }
            else
            {
                REG_SIOCNT = 0x5003;
                gSTWIStatus->state = 4;
            }
        }
        gSTWIStatus->unk_2c = 0;
        if (gSTWIStatus->callbackM != NULL)
            Callback_Dummy_M(gSTWIStatus->reqActiveCommand, gSTWIStatus->error, gSTWIStatus->callbackM);
    }
    else
    {
        REG_SIOCNT = 0x5003;
        REG_SIOCNT = 0x5083;
    }
}

static void sio32intr_clock_slave(void)
{
    u32 regSIODATA32;
    u32 r0;
    register u32 reqLen asm("r2");

    gSTWIStatus->timerActive = 0;
    STWI_set_timer_in_RAM(100);
    if (handshake_wait(0) == 1)
        return;
    REG_SIOCNT = 0x500A;
    regSIODATA32 = REG_SIODATA32;
    if (gSTWIStatus->state == 5)
    {
        ((u32*)gSTWIStatus->rxPacket)[0] = regSIODATA32;
        gSTWIStatus->reqNext = 1;
        r0 = 0x99660000;
        if ((regSIODATA32 >> 16) == (r0 >> 16))
        {
            gSTWIStatus->reqLength = reqLen = regSIODATA32 >> 8;
            gSTWIStatus->reqActiveCommand = regSIODATA32;
            if (gSTWIStatus->reqLength == 0)
            {
                if (
                    gSTWIStatus->reqActiveCommand == 0x0027
                 || gSTWIStatus->reqActiveCommand == 0x0028
                 || gSTWIStatus->reqActiveCommand == 0x0029
                 || gSTWIStatus->reqActiveCommand == 0x0036
                )
                {
                    gSTWIStatus->ackActiveCommand = gSTWIStatus->reqActiveCommand + 0x80;
                    ((u32*)gSTWIStatus->txPacket)[0] = 0x99660000 + gSTWIStatus->ackActiveCommand;
                    gSTWIStatus->ackLength = 0;
                }
                else
                {
                    ((u32*)gSTWIStatus->txPacket)[0] = 0x996601EE;
                    if (gSTWIStatus->reqActiveCommand >= 0x10 && gSTWIStatus->reqActiveCommand <= 0x3D)
                    {
                        ((u32*)gSTWIStatus->txPacket)[1] = 1;
                    }
                    else
                    {
                        ((u32*)gSTWIStatus->txPacket)[1] = 2;
                    }
                    gSTWIStatus->ackLength = 1;
                    gSTWIStatus->error = 3;
                }
                REG_SIODATA32 = ((u32*)gSTWIStatus->txPacket)[0];
                gSTWIStatus->ackNext = 1;
                gSTWIStatus->state = 7;
            }
            else
            {
                REG_SIODATA32 = 0x80000000;
                gSTWIStatus->reqNext = 1;
                gSTWIStatus->state = 6;
            }
        }
        else
        {
            STWI_stop_timer_in_RAM();
            STWI_set_timer_in_RAM(100);
            return;
        }
    }
    else if (gSTWIStatus->state == 6)
    {
        ((u32*)gSTWIStatus->rxPacket)[gSTWIStatus->reqNext] = regSIODATA32;
        gSTWIStatus->reqNext++;
        if (gSTWIStatus->reqLength < gSTWIStatus->reqNext)
        {
            if (
                gSTWIStatus->reqActiveCommand == 0x0028
             || gSTWIStatus->reqActiveCommand == 0x0029
             || gSTWIStatus->reqActiveCommand == 0x0036
            )
            {
                gSTWIStatus->ackActiveCommand = gSTWIStatus->reqActiveCommand + 0x80;
                ((u32*)gSTWIStatus->txPacket)[0] = 0x99660000 | gSTWIStatus->ackActiveCommand;
                gSTWIStatus->ackLength = 0;
            }
            else
            {
                ((u32*)gSTWIStatus->txPacket)[0] = 0x996601EE;
                if (gSTWIStatus->reqActiveCommand >= 0x10 && gSTWIStatus->reqActiveCommand <= 0x3D)
                {
                    ((u32*)gSTWIStatus->txPacket)[1] = 1;
                }
                else
                {
                    ((u32*)gSTWIStatus->txPacket)[1] = 2;
                }
                gSTWIStatus->ackLength = 1;
                gSTWIStatus->error = 3;
            }
            REG_SIODATA32 = ((u32*)gSTWIStatus->txPacket)[0];
            gSTWIStatus->ackNext = 1;
            gSTWIStatus->state = 7;
        }
        else
        {
            REG_SIODATA32 = 0x80000000;
        }
    }
    else if (gSTWIStatus->state == 7)
    {
        if (regSIODATA32 == 0x80000000)
        {
            if (gSTWIStatus->ackLength < gSTWIStatus->ackNext)
            {
                gSTWIStatus->state = 8;
            }
            else
            {
                REG_SIODATA32 = ((u32*)gSTWIStatus->txPacket)[gSTWIStatus->ackNext];
                gSTWIStatus->ackNext++;
            }
        }
        else
        {
            STWI_stop_timer_in_RAM();
            STWI_set_timer_in_RAM(100);
            return;
        }
    }
    if (handshake_wait(1) == 1)
        return;
    if (gSTWIStatus->state == 8)
    {
        REG_SIOCNT = 0x5002;
        STWI_stop_timer_in_RAM();
        if (gSTWIStatus->error == 3)
        {
            STWI_init_slave();
            if (gSTWIStatus->callbackS != NULL)
            {
                Callback_Dummy_S(0x1EE, gSTWIStatus->callbackS);
            }
        }
        else
        {
            REG_SIODATA32 = 0;
            REG_SIOCNT = 0;
            REG_SIOCNT = 0x5003;
            gSTWIStatus->msMode = AGB_CLK_MASTER;
            gSTWIStatus->state = 0;
            if (gSTWIStatus->callbackS != NULL)
            {
                Callback_Dummy_S((gSTWIStatus->reqLength << 8) | (gSTWIStatus->reqActiveCommand), gSTWIStatus->callbackS);
            }
        }
    }
    else
    {
        REG_IME = 0;
        if (REG_TM0CNT_H & 0x80)
        {
            if (!(REG_TM0CNT_H & 0x03))
            {
                while (REG_TM0CNT_L > 0xFF9B);
            }
            else
            {
                while (REG_TM0CNT_L > 0xFFFE);
            }
        }
        REG_SIOCNT = 0x5002;
        REG_SIOCNT = 0x5082;
        REG_IME = 1;
    }
}

static u16 handshake_wait(u16 slot)
{
    do
    {
        if ((gSTWIStatus->timerActive & 0xFF) == 1)
        {
            gSTWIStatus->timerActive = 0;
            return 1;
        }
    } while ((REG_SIOCNT & 4) != (slot << 2));
    return 0;
}

static void STWI_set_timer_in_RAM(u8 count)
{
    vu16* regTMCNTL = (vu16*)(REG_ADDR_TMCNT_L + gSTWIStatus->timerSelect * 4);
    vu16* regTMCNTH = (vu16*)(REG_ADDR_TMCNT_H + gSTWIStatus->timerSelect * 4);
    REG_IME = 0;
    switch (count)
    {
    case 50:
        *regTMCNTL = -0x335;
        gSTWIStatus->timerState = 1;
        break;
    case 80:
        *regTMCNTL = -0x520;
        gSTWIStatus->timerState = 2;
        break;
    case 100:
        *regTMCNTL = -0x66a;
        gSTWIStatus->timerState = 3;
        break;
    case 130:
        *regTMCNTL = -0x853;
        gSTWIStatus->timerState = 4;
        break;
    }
    *regTMCNTH = TIMER_ENABLE | TIMER_64CLK | TIMER_256CLK | TIMER_INTR_ENABLE;
    REG_IF = INTR_FLAG_TIMER0 << gSTWIStatus->timerSelect;
    REG_IME = 1;
}

static void STWI_stop_timer_in_RAM(void)
{
    gSTWIStatus->timerState = 0;
    REG_TMCNT_L(gSTWIStatus->timerSelect) = 0;
    REG_TMCNT_H(gSTWIStatus->timerSelect) = 0;
}

static void STWI_init_slave(void)
{
    gSTWIStatus->state = 5;
    gSTWIStatus->msMode = 0;
    gSTWIStatus->reqLength = 0;
    gSTWIStatus->reqNext = 0;
    gSTWIStatus->reqActiveCommand = 0;
    gSTWIStatus->ackLength = 0;
    gSTWIStatus->ackNext = 0;
    gSTWIStatus->ackActiveCommand = 0;
    gSTWIStatus->timerState = 0;
    gSTWIStatus->timerActive = 0;
    gSTWIStatus->error = 0;
    gSTWIStatus->recoveryCount = 0;
    REG_SIOCNT = 0x5082;
}

NAKED
static void Callback_Dummy_M(int reqCommandId, int error, void (*callbackM)())
{
    asm("bx r2");
}

NAKED
static void Callback_Dummy_S(u16 reqCommandId, void (*callbackS)(u16))
{
    asm("bx r1");
}

NAKED
static void Callback_Dummy_ID(void (*callbackId)(void))
{
    asm("bx r0");
}
