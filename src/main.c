#include "global.h"

#include "gba/flash_internal.h"

#include "dma3.h"
#include "gpu_regs.h"
#include "malloc.h"

#include "battle_controllers.h"
#include "crt0.h"
#include "help_system.h"
#include "intro.h"
#include "link.h"
#include "link_rfu.h"
#include "load_save.h"
#include "m4a.h"
#include "menu.h"
#include "overworld.h"
#include "play_time.h"
#include "quest_log.h"
#include "random.h"
#include "rtc.h"
#include "save_failed_screen.h"
#include "scanline_effect.h"
#include "sound.h"
#include "test_runner.h"
#include "trainer_tower.h"

static void VBlankIntr(void);
static void HBlankIntr(void);
static void VCountIntr(void);
static void SerialIntr(void);
static void IntrDummy(void);

// Defined in the linker script so that the test build can override it.
extern void gInitialMainCB2(void);

const u8 gGameVersion = GAME_VERSION;
const u8 gGameLanguage = GAME_LANGUAGE;

const char BuildDateTime[] = "2004 07 20 09:30";

const IntrFunc gIntrTableTemplate[] =
{
    VCountIntr, // V-count interrupt
    SerialIntr, // Serial interrupt
    Timer3Intr, // Timer 3 interrupt
    HBlankIntr, // H-blank interrupt
    VBlankIntr, // V-blank interrupt
    IntrDummy,  // Timer 0 interrupt
    IntrDummy,  // Timer 1 interrupt
    IntrDummy,  // Timer 2 interrupt
    IntrDummy,  // DMA 0 interrupt
    IntrDummy,  // DMA 1 interrupt
    IntrDummy,  // DMA 2 interrupt
    IntrDummy,  // DMA 3 interrupt
    IntrDummy,  // Key interrupt
    IntrDummy,  // Game Pak interrupt
};

#define INTR_COUNT ((int)(sizeof(gIntrTableTemplate)/sizeof(IntrFunc)))

u16 gKeyRepeatStartDelay;
u8 gLinkTransferringData;
struct Main gMain;
u16 gKeyRepeatContinueDelay;
u8 gSoftResetDisabled;
IntrFunc gIntrTable[INTR_COUNT];
bool8 gLinkVSyncDisabled;
u8 gPcmDmaCounter;
void *gAgbMainLoop_sp;

// These variables are not defined in RS or Emerald, and are never read.
// They were likely used to debug the audio engine and VCount interrupt.
u8 sVcountAfterSound;
u8 sVcountAtIntr;
u8 sVcountBeforeSound;

static IntrFunc * const sTimerIntrFunc = gIntrTable + 0x7;

EWRAM_DATA u8 gDecompressionBuffer[0x4000] = {0};
EWRAM_DATA u16 gTrainerId = 0;

static void UpdateLinkAndCallCallbacks(void);
static void InitMainCallbacks(void);
static void CallCallbacks(void);
static void ReadKeys(void);
void InitIntrHandlers(void);
static void WaitForVBlank(void);
void EnableVCountIntrAtLine150(void);

#define B_START_SELECT (B_BUTTON | START_BUTTON | SELECT_BUTTON)

void AgbMain()
{
    *(vu16 *)BG_PLTT = RGB_WHITE;
    InitGpuRegManager();
    REG_WAITCNT = WAITCNT_PREFETCH_ENABLE | WAITCNT_WS0_S_1 | WAITCNT_WS0_N_3;
    InitKeys();
    InitIntrHandlers();
    m4aSoundInit();
    EnableVCountIntrAtLine150();
    InitRFU();
    RtcInit();
    CheckForFlashMemory();
    InitMainCallbacks();
    InitMapMusic();
    ClearDma3Requests();
    ResetBgs();
    InitHeap(gHeap, HEAP_SIZE);
    SetDefaultFontsPointer();

    gSoftResetDisabled = FALSE;
    gHelpSystemEnabled = FALSE;

    SetNotInSaveFailedScreen();

#ifndef NDEBUG
#if (LOG_HANDLER == LOG_HANDLER_MGBA_PRINT)
    (void) MgbaOpen();
#elif (LOG_HANDLER == LOG_HANDLER_AGB_PRINT)
    AGBPrintInit();
#endif
#endif

    if (gFlashMemoryPresent != TRUE)
        SetMainCallback2(NULL);

    gLinkTransferringData = FALSE;
    gAgbMainLoop_sp = __builtin_frame_address(0);
    AgbMainLoop();
}

void AgbMainLoop(void)
{
    for (;;)
    {
        ReadKeys();

        if (gSoftResetDisabled == FALSE
         && (gMain.heldKeysRaw & A_BUTTON)
         && (gMain.heldKeysRaw & B_START_SELECT) == B_START_SELECT)
        {
            rfu_REQ_stopMode();
            rfu_waitREQComplete();
            DoSoftReset();
        }

        if (Overworld_SendKeysToLinkIsRunning() == TRUE)
        {
            gLinkTransferringData = TRUE;
            UpdateLinkAndCallCallbacks();
            gLinkTransferringData = FALSE;
        }
        else
        {
            gLinkTransferringData = FALSE;
            UpdateLinkAndCallCallbacks();

            if (Overworld_RecvKeysFromLinkIsRunning() == 1)
            {
                gMain.newKeys = 0;
                ClearSpriteCopyRequests();
                gLinkTransferringData = TRUE;
                UpdateLinkAndCallCallbacks();
                gLinkTransferringData = FALSE;
            }
        }

        PlayTimeCounter_Update();
        MapMusicMain();
        WaitForVBlank();
    }
}

static void UpdateLinkAndCallCallbacks(void)
{
    if (!HandleLinkConnection())
        CallCallbacks();
}

static void InitMainCallbacks(void)
{
    gMain.vblankCounter1 = 0;
    gTrainerTowerVBlankCounter = NULL;
    gMain.vblankCounter2 = 0;
    gMain.callback1 = NULL;
    SetMainCallback2(gInitialMainCB2);
    gSaveBlock2Ptr = &gSaveblock2.block;
    gSaveBlock1Ptr = &gSaveblock1.block;
    gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
}

static void CallCallbacks(void)
{
// #if TESTING || DEBUG_BATTLE_MENU == TRUE // test framework not working with help system
//     if (!RunSaveFailedScreen())
// #else
//     if (!RunSaveFailedScreen() && !RunHelpSystemCallback())
// #endif
    if (!RunSaveFailedScreen())
    {
        if (gMain.callback1)
            gMain.callback1();

        if (gMain.callback2)
            gMain.callback2();
    }
}

void SetMainCallback2(MainCallback callback)
{
    gMain.callback2 = callback;
    gMain.state = 0;
}

void StartTimer1(void)
{
    REG_TM2CNT_L = 0;
    REG_TM2CNT_H = TIMER_ENABLE | TIMER_COUNTUP;
    REG_TM1CNT_H = TIMER_ENABLE;
}

void SeedRngAndSetTrainerId(void)
{
    u32 val;

    REG_TM1CNT_H = 0;
    REG_TM2CNT_H = 0;
    val = ((u32)REG_TM2CNT_L) << 16;
    val |= REG_TM1CNT_L;
    SeedRng(val);
    gTrainerId = Random();
}

u16 GetGeneratedTrainerIdLower(void)
{
    return gTrainerId;
}

void EnableVCountIntrAtLine150(void)
{
    u16 gpuReg = (GetGpuReg(REG_OFFSET_DISPSTAT) & 0xFF) | (150 << 8);
    SetGpuReg(REG_OFFSET_DISPSTAT, gpuReg | DISPSTAT_VCOUNT_INTR);
    EnableInterrupts(INTR_FLAG_VCOUNT);
}

void InitKeys(void)
{
    gKeyRepeatContinueDelay = 5;
    gKeyRepeatStartDelay = 40;

    gMain.heldKeys = 0;
    gMain.newKeys = 0;
    gMain.newAndRepeatedKeys = 0;
    gMain.heldKeysRaw = 0;
    gMain.newKeysRaw = 0;
}

static void ReadKeys(void)
{
    u16 keyInput = REG_KEYINPUT ^ KEYS_MASK;
    gMain.newKeysRaw = keyInput & ~gMain.heldKeysRaw;
    gMain.newKeys = gMain.newKeysRaw;
    gMain.newAndRepeatedKeys = gMain.newKeysRaw;

    // BUG: Key repeat won't work when pressing L using L=A button mode
    // because it compares the raw key input with the remapped held keys.
    // Note that newAndRepeatedKeys is never remapped either.

    if (keyInput != 0 && gMain.heldKeys == keyInput)
    {
        gMain.keyRepeatCounter--;

        if (gMain.keyRepeatCounter == 0)
        {
            gMain.newAndRepeatedKeys = keyInput;
            gMain.keyRepeatCounter = gKeyRepeatContinueDelay;
        }
    }
    else
    {
        // If there is no input or the input has changed, reset the counter.
        gMain.keyRepeatCounter = gKeyRepeatStartDelay;
    }

    gMain.heldKeysRaw = keyInput;
    gMain.heldKeys = gMain.heldKeysRaw;

    // Remap L to A if the L=A option is enabled.
    if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_L_EQUALS_A)
    {
        if (JOY_NEW(L_BUTTON))
            gMain.newKeys |= A_BUTTON;

        if (JOY_HELD(L_BUTTON))
            gMain.heldKeys |= A_BUTTON;
    }

    if (JOY_NEW(gMain.watchedKeysMask))
        gMain.watchedKeysPressed = TRUE;
}

void InitIntrHandlers(void)
{
    int i;

    for (i = 0; i < INTR_COUNT; i++)
        gIntrTable[i] = gIntrTableTemplate[i];

    INTR_VECTOR = IntrMain;

    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    SetSerialCallback(NULL);

    REG_IME = 1;

    EnableInterrupts(INTR_FLAG_VBLANK);
}

void SetVBlankCallback(IntrCallback callback)
{
    gMain.vblankCallback = callback;
}

void SetHBlankCallback(IntrCallback callback)
{
    gMain.hblankCallback = callback;
}

void SetVCountCallback(IntrCallback callback)
{
    gMain.vcountCallback = callback;
}

void SetSerialCallback(IntrCallback callback)
{
    gMain.serialCallback = callback;
}

extern void CopyBufferedValuesToGpuRegs(void);
extern void ProcessDma3Requests(void);

static void VBlankIntr(void)
{
    if (gWirelessCommType)
        RfuVSync();
    else if (!gLinkVSyncDisabled)
        LinkVSync();

    gMain.vblankCounter1++;

    if (gTrainerTowerVBlankCounter && *gTrainerTowerVBlankCounter < 0xFFFFFFFF)
        (*gTrainerTowerVBlankCounter)++;

    if (gMain.vblankCallback)
        gMain.vblankCallback();

    gMain.vblankCounter2++;

    CopyBufferedValuesToGpuRegs();
    ProcessDma3Requests();

    gPcmDmaCounter = gSoundInfo.pcmDmaCounter;

#ifndef NDEBUG
    sVcountBeforeSound = REG_VCOUNT;
#endif
    m4aSoundMain();
#ifndef NDEBUG
    sVcountAfterSound = REG_VCOUNT;
#endif

    TryReceiveLinkBattleData();

    if (!gTestRunnerEnabled && (!gMain.inBattle || !(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_RECORDED))))
        AdvanceRandom();
    // Random(); // old
    UpdateWirelessStatusIndicatorSprite();

    INTR_CHECK |= INTR_FLAG_VBLANK;
    gMain.intrCheck |= INTR_FLAG_VBLANK;
}

void InitFlashTimer(void)
{
    IntrFunc **func = (IntrFunc **)&sTimerIntrFunc;
    SetFlashTimerIntr(2, *func);
}

static void HBlankIntr(void)
{
    if (gMain.hblankCallback)
        gMain.hblankCallback();

    INTR_CHECK |= INTR_FLAG_HBLANK;
    gMain.intrCheck |= INTR_FLAG_HBLANK;
}

static void VCountIntr(void)
{
#ifndef NDEBUG
    sVcountAtIntr = REG_VCOUNT;
#endif
    m4aSoundVSync();
    INTR_CHECK |= INTR_FLAG_VCOUNT;
    gMain.intrCheck |= INTR_FLAG_VCOUNT;
}

static void SerialIntr(void)
{
    if (gMain.serialCallback)
        gMain.serialCallback();

    INTR_CHECK |= INTR_FLAG_SERIAL;
    gMain.intrCheck |= INTR_FLAG_SERIAL;
}

void RestoreSerialTimer3IntrHandlers(void)
{
    gIntrTable[1] = SerialIntr;
    gIntrTable[2] = Timer3Intr;
}

static void IntrDummy(void)
{}

static void WaitForVBlank(void)
{
    gMain.intrCheck &= ~INTR_FLAG_VBLANK;

    while (!(gMain.intrCheck & INTR_FLAG_VBLANK))
        ;
}

void SetTrainerTowerVBlankCounter(u32 *ptr)
{
    gTrainerTowerVBlankCounter = ptr;
}

void ClearTrainerTowerVBlankCounter(void)
{
    gTrainerTowerVBlankCounter = NULL;
}

void DoSoftReset(void)
{
    REG_IME = 0;
    m4aSoundVSyncOff();
    ScanlineEffect_Stop();
    DmaStop(1);
    DmaStop(2);
    DmaStop(3);
    SiiRtcProtect();
    SoftReset(RESET_ALL & ~RESET_SIO_REGS);
}

void ClearPokemonCrySongs(void)
{
    CpuFill16(0, gPokemonCrySongs, MAX_POKEMON_CRIES * sizeof(struct PokemonCrySong));
}
