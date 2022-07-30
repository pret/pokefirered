#include "global.h"
#include "gflib.h"
#include "task.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "m4a.h"
#include "dynamic_placeholder_text_util.h"
#include "overworld.h"
#include "strings.h"
#include "menu.h"
#include "librfu.h"
#include "link_rfu.h"
#include "union_room.h"
#include "constants/songs.h"
#include "constants/union_room.h"

struct WirelessCommunicationStatusScreenStruct
{
    u32 counts[4];
    u32 lastCounts[4];
    u32 activities[16];
    u8 taskId;
    u8 rfuTaskId;
    u8 filler_62[0xA];
};

static struct WirelessCommunicationStatusScreenStruct * sWCSS;

static void CB2_InitWirelessCommunicationScreen(void);
static void Task_WirelessCommunicationScreen(u8 taskId);
static void WCSS_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 palIdx);
static bool32 UpdateCommunicationCounts(u32 * counts, u32 * lastCounts, u32 * activities, u8 taskId);

static const u16 sWCSS_Palettes[][16] = {
    INCBIN_U16("graphics/misc/unk_846f4d0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f4f0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f510.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f530.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f550.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f570.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f590.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f5b0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f5d0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f5f0.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f610.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f630.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f650.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f670.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f690.gbapal"),
    INCBIN_U16("graphics/misc/unk_846f6b0.gbapal")
};

static const u32 sBgTilesGfx[] = INCBIN_U32("graphics/misc/unk_846f6d0.4bpp.lz");
static const u16 sBgTilemap[] = INCBIN_U16("graphics/misc/unk_846f8e0.bin");

static const struct BgTemplate sBGTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex =  8,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x03,
        .tilemapTop = 0x00,
        .width = 0x18,
        .height = 0x03,
        .paletteNum = 0x0f,
        .baseBlock = 0x0001
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x03,
        .tilemapTop = 0x04,
        .width = 0x16,
        .height = 0x0f,
        .paletteNum = 0x0f,
        .baseBlock = 0x0049
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x19,
        .tilemapTop = 0x04,
        .width = 0x02,
        .height = 0x0f,
        .paletteNum = 0x0f,
        .baseBlock = 0x0193
    }, DUMMY_WIN_TEMPLATE
};

static const u8 *const gUnknown_846FA9C[] = {
    gUnknown_841E2B4,
    gUnknown_841E2BF,
    gUnknown_841E2C9,
    gUnknown_841E2D4
};

static const u8 *const sHeaderTextPtrs[] = {
    gText_WirelessCommunicationStatus,
    gText_PeopleTrading,
    gText_PeopleBattling,
    gText_PeopleInUnionRoom,
    gText_PeopleCommunicating
};

static const u8 sCountParams[][3] = {
    // activity,         count idx, by
    // by=0 means count all
    // UB: no check for count idx == -1
    {ACTIVITY_BATTLE,            1, 2},
    {ACTIVITY_DBLBATTLE,         1, 2},
    {ACTIVITY_MLTBATTLE,         1, 4},
    {ACTIVITY_TRADE,             0, 2},
    {ACTIVITY_WCARD2,            3, 2},
    {ACTIVITY_WNEWS2,            3, 2},
    {ACTIVITY_PJUMP,             4, 0},
    {ACTIVITY_BCRUSH,            4, 0},
    {ACTIVITY_BPICK,             4, 0},
    {ACTIVITY_SEARCH,           -1, 0},
    {ACTIVITY_SPINTRADE,         0, 0},
    {ACTIVITY_ITEMTRADE,        -1, 0},
    {0x0f,                       4, 0},
    {0x10,                      -1, 0},
    {0x40,                       2, 1},
    {ACTIVITY_BATTLE | 0x40,     2, 2},
    {ACTIVITY_TRADE | 0x40,      2, 2},
    {ACTIVITY_CHAT | 0x40,       2, 0},
    {ACTIVITY_CARD | 0x40,       2, 2},
    {20 | 0x40,                  2, 1},
    {19 | 0x40,                  2, 2},
    {ACTIVITY_ACCEPT | 0x40,     2, 1},
    {ACTIVITY_DECLINE | 0x40,    2, 1}
};

static void CB2_RunWirelessCommunicationScreen(void)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        RunTasks();
        RunTextPrinters();
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
    }
}

static void VBlankCB_WirelessCommunicationScreen(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void ShowWirelessCommunicationScreen(void)
{
    SetMainCallback2(CB2_InitWirelessCommunicationScreen);
}

static void CB2_InitWirelessCommunicationScreen(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    sWCSS = AllocZeroed(sizeof(*sWCSS));
    SetVBlankCallback(NULL);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBGTemplates, NELEMS(sBGTemplates));
    SetBgTilemapBuffer(1, Alloc(0x800));
    SetBgTilemapBuffer(0, Alloc(0x800));
    DecompressAndLoadBgGfxUsingHeap(1, sBgTilesGfx, 0, 0, 0);
    CopyToBgTilemapBuffer(1, sBgTilemap, 0, 0);
    InitWindows(sWindowTemplates);
    DeactivateAllTextPrinters();
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    ScanlineEffect_Stop();
    m4aSoundVSyncOn();
    SetVBlankCallback(VBlankCB_WirelessCommunicationScreen);
    sWCSS->taskId = CreateTask(Task_WirelessCommunicationScreen, 0);
    sWCSS->rfuTaskId = CreateTask_ListenToWireless();
    sWCSS->lastCounts[3] = 1;
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    LoadPalette(sWCSS_Palettes, 0, 0x20);
    Menu_LoadStdPalAt(0xf0);
    DynamicPlaceholderTextUtil_Reset();
    FillBgTilemapBufferRect(0, 0x000, 0, 0, 32, 32, 0xF);
    CopyBgTilemapBufferToVram(1);
    SetMainCallback2(CB2_RunWirelessCommunicationScreen);
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void ExitWirelessCommunicationStatusScreen(void)
{
    s32 i;

    FreeAllWindowBuffers();
    for (i = 0; i < 2; i++)
    {
        Free(GetBgTilemapBuffer(i));
    }
    Free(sWCSS);
    SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

static void WCSS_CyclePalette(s16 * frameCtr_p, s16 * palIdx_p)
{
    s32 idx;
    (*frameCtr_p)++;
    if (*frameCtr_p > 5)
    {
        (*palIdx_p)++;
        if (*palIdx_p == 14)
        {
            *palIdx_p = 0;
        }
        *frameCtr_p = 0;
    }
    idx = *palIdx_p + 2;
    LoadPalette(sWCSS_Palettes[idx], 0, 16);
}

static void PrintHeaderTexts(void)
{
    s32 i;
    u32 width;

    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    FillWindowPixelBuffer(2, PIXEL_FILL(0));
    width = 0xC0 - GetStringWidth(3, sHeaderTextPtrs[0], 0);
    WCSS_AddTextPrinterParameterized(0, 3, sHeaderTextPtrs[0], width / 2, 6, 3);
    for (i = 0; i < 3; i++)
    {
        WCSS_AddTextPrinterParameterized(1, 3, sHeaderTextPtrs[i + 1], 0, 30 * i + 10, 1);
    }
    WCSS_AddTextPrinterParameterized(1, 3, sHeaderTextPtrs[i + 1], 0, 30 * i + 10, 2);
    PutWindowTilemap(0);
    CopyWindowToVram(0, COPYWIN_GFX);
    PutWindowTilemap(1);
    CopyWindowToVram(1, COPYWIN_GFX);
}

static void Task_WirelessCommunicationScreen(u8 taskId)
{
    s32 i;
    switch (gTasks[taskId].data[0])
    {
    case 0:
        PrintHeaderTexts();
        gTasks[taskId].data[0]++;
        break;
    case 1:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        ShowBg(1);
        CopyBgTilemapBufferToVram(0);
        ShowBg(0);
        gTasks[taskId].data[0]++;
        break;
    case 2:
        if (!gPaletteFade.active)
            gTasks[taskId].data[0]++;
        break;
    case 3:
        if (UpdateCommunicationCounts(sWCSS->counts, sWCSS->lastCounts, sWCSS->activities, sWCSS->rfuTaskId))
        {
            FillWindowPixelBuffer(2, PIXEL_FILL(0));
            for (i = 0; i < 4; i++)
            {
                ConvertIntToDecimalStringN(gStringVar4, sWCSS->counts[i], STR_CONV_MODE_RIGHT_ALIGN, 2);
                if (i != 3)
                    WCSS_AddTextPrinterParameterized(2, 3, gStringVar4, 4, 30 * i + 10, 1);
                else
                    WCSS_AddTextPrinterParameterized(2, 3, gStringVar4, 4, 100, 2);
            }
            PutWindowTilemap(2);
            CopyWindowToVram(2, COPYWIN_FULL);
        }
        if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gTasks[sWCSS->rfuTaskId].data[15] = 0xFF;
            gTasks[taskId].data[0]++;
        }
        WCSS_CyclePalette(&gTasks[taskId].data[7], &gTasks[taskId].data[8]);
        break;
    case 4:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        gTasks[taskId].data[0]++;
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            SetMainCallback2(ExitWirelessCommunicationStatusScreen);
            DestroyTask(taskId);
        }
        break;
    }
}

static void WCSS_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 palIdx)
{
    u8 textColor[3];
    switch (palIdx)
    {
    case 0:
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_DARK_GRAY;
        textColor[2] = TEXT_COLOR_LIGHT_GRAY;
        break;
    case 1:
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_WHITE;
        textColor[2] = TEXT_COLOR_LIGHT_GRAY;
        break;
    case 2:
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_RED;
        textColor[2] = TEXT_COLOR_LIGHT_RED;
        break;
    case 3:
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_LIGHT_GREEN;
        textColor[2] = TEXT_COLOR_GREEN;
        break;
    case 4:
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_WHITE;
        textColor[2] = TEXT_COLOR_DARK_GRAY;
        break;
    // default: UB
    }
    AddTextPrinterParameterized4(windowId, fontId,x, y, fontId == 0 ? 0 : 1, 0, textColor, -1, str);
}

static u32 CountMembersInGroup(struct UnkStruct_x20 * unk20, u32 * counts)
{
    u32 activity = unk20->gname_uname.gname.activity;
    s32 i, j, k;

    for (i = 0; i < NELEMS(sCountParams); i++)
    {
        if (activity == sCountParams[i][0] && unk20->groupScheduledAnim == UNION_ROOM_SPAWN_IN)
        {
            if (sCountParams[i][2] == 0)
            {
                k = 0;
                for (j = 0; j < RFU_CHILD_MAX; j++)
                {
                    if (unk20->gname_uname.gname.child_sprite_gender[j] != 0) k++;
                }
                k++;
                counts[sCountParams[i][1]] += k;
            }
            else
            {
                counts[sCountParams[i][1]] += sCountParams[i][2];
            }
        }
    }

    return activity;
}

static bool32 HaveCountsChanged(const u32 * newCounts, const u32 * prevCounts)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (newCounts[i] != prevCounts[i])
            return TRUE;
    }

    return FALSE;
}

static bool32 UpdateCommunicationCounts(u32 * counts, u32 * lastCounts, u32 * activities, u8 taskId)
{
    bool32 activitiesUpdated = FALSE;
    u32 buffer[4] = {0, 0, 0, 0};
    struct UnkStruct_Group * group = (void *)gTasks[taskId].data;
    s32 i;

    for (i = 0; i < 16; i++)
    {
        u32 activity = CountMembersInGroup(&group->field_0->arr[i], buffer);
        if (activity != activities[i])
        {
            activities[i] = activity;
            activitiesUpdated = TRUE;
        }
    }

    if (HaveCountsChanged(buffer, lastCounts) == FALSE)
    {
        if (activitiesUpdated == TRUE)
            return TRUE;
        else
            return FALSE;
    }

    memcpy(counts, buffer, sizeof(buffer));
    memcpy(lastCounts, buffer, sizeof(buffer));
    counts[3] = counts[0] + counts[1] + counts[2];
    return TRUE;
}
