#include "global.h"
#include "gpu_regs.h"
#include "multiboot.h"
#include "graphics.h"
#include "main.h"
#include "sprite.h"
#include "task.h"
#include "scanline_effect.h"
#include "help_system.h"
#include "m4a.h"

enum {
    SCENE_ENSURE_CONNECT,
    SCENE_TURN_OFF_POWER,
    SCENE_TRANSMITTING,
    SCENE_FOLLOW_INSTRUCT,
    SCENE_TRANSMIT_FAILED,
    SCENE_BEGIN,
};

enum {
    STATE_BEGIN,
    STATE_CONNECT,
    STATE_TURN_OFF_POWER,
    STATE_UNUSED,
    STATE_INIT_MULTIBOOT,
    STATE_MULTIBOOT,
    STATE_TRANSMIT,
    STATE_SUCCEEDED,
    STATE_EXIT,
    STATE_FAILED,
    STATE_RETRY,
};

COMMON_DATA const void *gMultibootStart = NULL;
COMMON_DATA int gMultibootStatus = 0;
COMMON_DATA size_t gMultibootSize = 0;
COMMON_DATA struct MultiBootParam gMultibootParam = {0};

static void CB2_BerryFix(void);
static void Task_BerryFixMain(u8 taskId);

static const void *const sBerryFixGraphics[][3] = {
    [SCENE_ENSURE_CONNECT] = {
        gBerryFixGameboy_Gfx,
        gBerryFixGameboy_Tilemap,
        gBerryFixGameboy_Pal
    },
    [SCENE_TURN_OFF_POWER] = {
        gBerryFixGameboyLogo_Gfx,
        gBerryFixGameboyLogo_Tilemap,
        gBerryFixGameboyLogo_Pal
    },
    [SCENE_TRANSMITTING] = {
        gBerryFixGbaTransfer_Gfx,
        gBerryFixGbaTransfer_Tilemap,
        gBerryFixGbaTransfer_Pal
    },
    [SCENE_FOLLOW_INSTRUCT] = {
        gBerryFixGbaTransferHighlight_Gfx,
        gBerryFixGbaTransferHighlight_Tilemap,
        gBerryFixGbaTransferHighlight_Pal
    },
    [SCENE_TRANSMIT_FAILED] = {
        gBerryFixGbaTransferError_Gfx,
        gBerryFixGbaTransferError_Tilemap,
        gBerryFixGbaTransferError_Pal
    },
    [SCENE_BEGIN] = {
        gBerryFixWindow_Gfx,
        gBerryFixWindow_Tilemap,
        gBerryFixWindow_Pal
    },
};

extern const u8 gMultiBootProgram_BerryGlitchFix_Start[0x3BF4];
extern const u8 gMultiBootProgram_BerryGlitchFix_End[];

static void SetScene(int scene)
{
    REG_DISPCNT = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BLDCNT = 0;
    LZ77UnCompVram(sBerryFixGraphics[scene][0], (void *)BG_CHAR_ADDR(0));
    LZ77UnCompVram(sBerryFixGraphics[scene][1], (void *)BG_SCREEN_ADDR(31));
    CpuCopy16(sBerryFixGraphics[scene][2], (void *)BG_PLTT, 0x200);
    REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(31) | BGCNT_TXT256x256;
    REG_DISPCNT = DISPCNT_BG0_ON;
}

#define tState data[0]
#define tTimer data[1]

void CB2_InitBerryFixProgram(void)
{
    u8 taskId;
    DisableInterrupts(0xFFFF);
    EnableInterrupts(INTR_FLAG_VBLANK);
    m4aSoundVSyncOff();
    SetVBlankCallback(NULL);
    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)PLTT, PLTT_SIZE);
    ResetSpriteData();
    ResetTasks();
    ScanlineEffect_Stop();
    gHelpSystemEnabled = FALSE;
    taskId = CreateTask(Task_BerryFixMain, 0);
    gTasks[taskId].tState = STATE_BEGIN;
    SetMainCallback2(CB2_BerryFix);
}

static void CB2_BerryFix(void)
{
    RunTasks();
}

static void Task_BerryFixMain(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (tState)
    {
    case STATE_BEGIN:
        SetScene(SCENE_BEGIN);
        tState = STATE_CONNECT;
        break;
    case STATE_CONNECT:
        if (JOY_NEW(A_BUTTON))
        {
            SetScene(SCENE_ENSURE_CONNECT);
            tState = STATE_TURN_OFF_POWER;
        }
        break;
    case STATE_TURN_OFF_POWER:
        if (JOY_NEW(A_BUTTON))
        {
            SetScene(SCENE_TURN_OFF_POWER);
            tState = STATE_INIT_MULTIBOOT;
        }
        break;
    case STATE_INIT_MULTIBOOT:
        gMultibootStart = gMultiBootProgram_BerryGlitchFix_Start;
        gMultibootSize = gMultiBootProgram_BerryGlitchFix_End - gMultiBootProgram_BerryGlitchFix_Start;
        gMultibootParam.masterp = (void *)gMultiBootProgram_BerryGlitchFix_Start;
        gMultibootParam.server_type = MULTIBOOT_SERVER_TYPE_NORMAL;
        MultiBootInit(&gMultibootParam);
        tTimer = 0;
        tState = STATE_MULTIBOOT;
        break;
    case STATE_MULTIBOOT:
        if (gMultibootParam.probe_count == 0 && gMultibootParam.response_bit & 0x2 && gMultibootParam.client_bit & 0x2)
        {
            if (++tTimer > 180)
            {
                SetScene(SCENE_TRANSMITTING);
                MultiBootStartMaster(&gMultibootParam, gMultibootStart + MULTIBOOT_HEADER_SIZE, gMultibootSize - MULTIBOOT_HEADER_SIZE, 4, 1);
                tTimer = 0;
                tState = STATE_TRANSMIT;
            }
            else
            {
                gMultibootStatus = MultiBootMain(&gMultibootParam);
            }
        }
        else
        {
            tTimer = 0;
            gMultibootStatus = MultiBootMain(&gMultibootParam);
        }
        break;
    case STATE_TRANSMIT:
        gMultibootStatus = MultiBootMain(&gMultibootParam);
        if (MultiBootCheckComplete(&gMultibootParam))
        {
            SetScene(SCENE_FOLLOW_INSTRUCT);
            tState = STATE_SUCCEEDED;
        }
        else if (!(gMultibootParam.client_bit & 2))
        {
            tState = STATE_FAILED;
        }
        break;
    case STATE_SUCCEEDED:
        tState = STATE_EXIT;
        break;
    case STATE_EXIT:
        if (JOY_NEW(A_BUTTON))
        {
            DestroyTask(taskId);
            DoSoftReset();
        }
        break;
    case STATE_FAILED:
        SetScene(SCENE_TRANSMIT_FAILED);
        tState = STATE_RETRY;
        break;
    case STATE_RETRY:
        if (JOY_NEW(A_BUTTON))
            tState = STATE_BEGIN;
        break;
    }
}
