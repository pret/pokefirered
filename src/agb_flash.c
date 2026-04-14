#include "gba/gba.h"
#include "gba/flash_internal.h"

static u8 sTimerNum;
static u16 sTimerCount;
static vu16 *sTimerReg;
static u16 sSavedIme;

u8 gFlashTimeoutFlag = 0;
u8 (*PollFlashStatus)(u8 *) = NULL;

const u16 gFlashMaxTimeData[] =
{
      10, 65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK,
      10, 65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK,
    2000, 65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK,
    2000, 65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK,
};
const struct FlashType gFlashData = {
    131072, // ROM size
    {
        4096, // sector size
            12, // bit shift to multiply by sector size (4096 == 1 << 12)
            32, // number of sectors
            0  // appears to be unused
    },
    { 3, 1 }, // wait state setup data
    { { 0xCC, 0xCC } } // ID
};

u16 WaitForFlashWrite(u8 phase, u8 *addr, u8 lastData);
u16 ProgramFlashSector(u16 sectorNum, void *src);
u16 ProgramFlashByte(u16 sectorNum, u32 offset, u8 data);
u16 gFlashNumRemainingBytes = 0;
u16 EraseFlashChip(void);
u16 EraseFlashSector(u16 sectorNum);
const u16 *gFlashMaxTime = gFlashMaxTimeData;
const struct FlashType *gFlash = &gFlashData;

u16 WaitForFlashWrite(u8 phase, u8 *addr, u8 lastData)
{
    // stub
    return 0;
}

u16 EraseFlashChip(void)
{
    memset(FLASH_BASE, 0xFF, sizeof(FLASH_BASE));
    return 0;
}

u16 EraseFlashSector(u16 sectorNum)
{
    u8 clearBuffer[0x1000] = { 0xFF };
    return ProgramFlashSector(sectorNum, &clearBuffer[0]);
}

u16 ProgramFlashByte(u16 sectorNum, u32 offset, u8 data)
{
    FLASH_BASE[(sectorNum << gFlash->sector.shift) + offset] = data;
    return 0;
}

u16 ProgramFlashSector(u16 sectorNum, void *src)
{
    memcpy(&FLASH_BASE[sectorNum << gFlash->sector.shift], src, 0x1000);
    return 0;
}

u16 IdentifyFlash(void)
{
    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | WAITCNT_SRAM_8;
    return 0;
}

void SetReadFlash1(u16 *dest);

void SwitchFlashBank(u8 bankNum)
{
    FLASH_WRITE(0x5555, 0xAA);
    FLASH_WRITE(0x2AAA, 0x55);
    FLASH_WRITE(0x5555, 0xB0);
    FLASH_WRITE(0x0000, bankNum);
}

#define DELAY()                  \
do {                             \
    vu16 i;                      \
    for (i = 20000; i != 0; i--) \
        ;                        \
} while (0)



void FlashTimerIntr(void)
{
    if (sTimerCount != 0 && --sTimerCount == 0)
        gFlashTimeoutFlag = 1;
}

u16 SetFlashTimerIntr(u8 timerNum, void (**intrFunc)(void))
{
    if (timerNum >= 4)
        return 1;

    sTimerNum = timerNum;
    sTimerReg = &REG_TMCNT_L(sTimerNum);
    *intrFunc = FlashTimerIntr;
    return 0;
}

void StartFlashTimer(u8 phase)
{
    const u16 *maxTime = &gFlashMaxTime[phase * 3];
    sSavedIme = REG_IME;
    REG_IME = 0;
    sTimerReg[1] = 0;
    REG_IE |= (INTR_FLAG_TIMER0 << sTimerNum);
    gFlashTimeoutFlag = 0;
    sTimerCount = *maxTime++;
    *sTimerReg++ = *maxTime++;
    *sTimerReg-- = *maxTime++;
    REG_IF = (INTR_FLAG_TIMER0 << sTimerNum);
    REG_IME = 1;
}

void StopFlashTimer(void)
{
    REG_IME = 0;
    *sTimerReg++ = 0;
    *sTimerReg-- = 0;
    REG_IE &= ~(INTR_FLAG_TIMER0 << sTimerNum);
    REG_IME = sSavedIme;
}

u8 ReadFlash1(u8 *addr)
{
    return *addr;
}

void SetReadFlash1(u16 *dest)
{
    u16 *src;
    u16 i;

    PollFlashStatus = (u8 (*)(u8 *))((s32)dest + 1);

    src = (u16 *)ReadFlash1;
    src = (u16 *)((s32)src ^ 1);

    i = ((s32)SetReadFlash1 - (s32)ReadFlash1) >> 1;

    while (i != 0)
    {
        *dest++ = *src++;
        i--;
    }
}


// Using volatile here to make sure the flash memory will ONLY be read as bytes, to prevent any compiler optimizations.
void ReadFlash_Core(vu8 *src, u8 *dest, u32 size)
{
    while (size-- != 0)
    {
        *dest++ = *src++;
    }
}

void ReadFlash(u16 sectorNum, u32 offset, void *dest, u32 size)
{
    Platform_ReadFlash(sectorNum, offset, dest, size);
    return;
}

u32 VerifyFlashSector_Core(u8 *src, u8 *tgt, u32 size)
{
    return 0;
}

u32 VerifyFlashSector(u16 sectorNum, u8 *src)
{
    return 0; // return 0 if verified.
}

u32 VerifyFlashSectorNBytes(u16 sectorNum, u8 *src, u32 n)
{
    return 0; // return 0 if verified.
}

u32 ProgramFlashSectorAndVerify(u16 sectorNum, u8 *src)
{
    u8 i;
    u32 result;

    for (i = 0; i < 3; i++) // 3 attempts
    {
        result = ProgramFlashSector(sectorNum, src);
        if (result != 0)
            continue;

        result = VerifyFlashSector(sectorNum, src);
        if (result == 0)
            break;
    }

    return result; // return 0 if verified and programmed.
}

u32 ProgramFlashSectorAndVerifyNBytes(u16 sectorNum, void *dataSrc, u32 n)
{
    u8 i;
    u32 result;

    for (i = 0; i < 3; i++)
    {
        result = ProgramFlashSector(sectorNum, dataSrc);
        if (result != 0)
            continue;

        result = VerifyFlashSectorNBytes(sectorNum, dataSrc, n);
        if (result == 0)
            break;
    }

    return result;
}
