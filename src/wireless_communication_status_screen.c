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

enum {
    COLOR_NONE,
    COLOR_NORMAL,
    COLOR_TOTAL,
    COLOR_TITLE,
    COLOR_UNUSED,
};

enum {
    GROUPTYPE_NONE = -1,
    GROUPTYPE_TRADE,
    GROUPTYPE_BATTLE,
    GROUPTYPE_UNION,
    GROUPTYPE_TOTAL,
    NUM_GROUPTYPES
};

static struct
{
    u32 groupCounts[NUM_GROUPTYPES];
    u32 prevGroupCounts[NUM_GROUPTYPES];
    u32 activities[NUM_TASK_DATA];
    u8 taskId;
    u8 rfuTaskId;
    u8 filler[10];
} * sStatusScreen;

static void CB2_InitWirelessCommunicationScreen(void);
static void Task_WirelessCommunicationScreen(u8 taskId);
static void WCSS_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 palIdx);
static bool32 UpdateCommunicationCounts(u32 * counts, u32 * lastCounts, u32 * activities, u8 taskId);

static const u16 sPalettes[][16] = {
    INCBIN_U16("graphics/wireless_status_screen/default.gbapal"),
    {}, // All black. Never read
    INCBIN_U16("graphics/wireless_status_screen/anim_00.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_01.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_02.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_03.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_04.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_05.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_06.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_07.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_08.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_09.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_10.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_11.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_12.gbapal"),
    INCBIN_U16("graphics/wireless_status_screen/anim_13.gbapal")
};
static const u32 sBgTiles_Gfx[] = INCBIN_U32("graphics/wireless_status_screen/bg.4bpp.lz");
static const u16 sBgTiles_Tilemap[] = INCBIN_U16("graphics/wireless_status_screen/bg.bin");

static const struct BgTemplate sBgTemplates[] = {
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
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 0,
        .width = 24,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 0x001
    }, {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 4,
        .width = 22,
        .height = 15,
        .paletteNum = 15,
        .baseBlock = 0x049
    }, {
        .bg = 0,
        .tilemapLeft = 25,
        .tilemapTop = 4,
        .width = 2,
        .height = 15,
        .paletteNum = 15,
        .baseBlock = 0x193
    }, DUMMY_WIN_TEMPLATE
};

// Unused
static const u8 *const sPlayersTextPtrs[] = {
    gText_Dynamic0Players,
    gText_Dynamic1Players,
    gText_Dynamic2Players,
    gText_Dynamic3Players
};

static const u8 *const sHeaderTexts[NUM_GROUPTYPES + 1] = {
    [0]                    = gText_WirelessCommunicationStatus,
    [GROUPTYPE_TRADE + 1]  = gText_PeopleTrading,
    [GROUPTYPE_BATTLE + 1] = gText_PeopleBattling,
    [GROUPTYPE_UNION + 1]  = gText_PeopleInUnionRoom,
    [GROUPTYPE_TOTAL + 1]  = gText_PeopleCommunicating
};

// Activity, group type, number of players
// 0 players means the number of players can change and should be counted dynamically
// GROUPTYPE_TOTAL have no unique group and are simply counted in the total of "people communicating".
// A handful use NUM_GROUPTYPES, which is invalid, and are changed to GROUPTYPE_TOTAL in Emerald.
// UB: GROUPTYPE_NONE (-1) can potentially be used as an index into a u8[4] in CountPlayersInGroupAndGetActivity.
static const u8 sActivityGroupInfo[][3] = {
    {ACTIVITY_BATTLE_SINGLE,                  GROUPTYPE_BATTLE, 2},
    {ACTIVITY_BATTLE_DOUBLE,                  GROUPTYPE_BATTLE, 2},
    {ACTIVITY_BATTLE_MULTI,                   GROUPTYPE_BATTLE, 4},
    {ACTIVITY_TRADE,                          GROUPTYPE_TRADE,  2},
    {ACTIVITY_WONDER_CARD,                    GROUPTYPE_TOTAL,  2},
    {ACTIVITY_WONDER_NEWS,                    GROUPTYPE_TOTAL,  2},
    {ACTIVITY_POKEMON_JUMP,                   NUM_GROUPTYPES,   0},
    {ACTIVITY_BERRY_CRUSH,                    NUM_GROUPTYPES,   0},
    {ACTIVITY_BERRY_PICK,                     NUM_GROUPTYPES,   0},
    {ACTIVITY_SEARCH,                         GROUPTYPE_NONE,   0},
    {ACTIVITY_SPIN_TRADE,                     GROUPTYPE_TRADE,  0},
    {ACTIVITY_ITEM_TRADE,                     GROUPTYPE_NONE,   0},
    {ACTIVITY_RECORD_CORNER,                  NUM_GROUPTYPES,   0},
    {ACTIVITY_BERRY_BLENDER,                  GROUPTYPE_NONE,   0},
    {ACTIVITY_NONE | IN_UNION_ROOM,           GROUPTYPE_UNION,  1},
    {ACTIVITY_BATTLE_SINGLE | IN_UNION_ROOM,  GROUPTYPE_UNION,  2},
    {ACTIVITY_TRADE | IN_UNION_ROOM,          GROUPTYPE_UNION,  2},
    {ACTIVITY_CHAT | IN_UNION_ROOM,           GROUPTYPE_UNION,  0},
    {ACTIVITY_CARD | IN_UNION_ROOM,           GROUPTYPE_UNION,  2},
    {ACTIVITY_PLYRTALK | IN_UNION_ROOM,       GROUPTYPE_UNION,  1},
    {ACTIVITY_NPCTALK | IN_UNION_ROOM,        GROUPTYPE_UNION,  2},
    {ACTIVITY_ACCEPT | IN_UNION_ROOM,         GROUPTYPE_UNION,  1},
    {ACTIVITY_DECLINE | IN_UNION_ROOM,        GROUPTYPE_UNION,  1}
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
    sStatusScreen = AllocZeroed(sizeof(*sStatusScreen));
    SetVBlankCallback(NULL);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, ARRAY_COUNT(sBgTemplates));
    SetBgTilemapBuffer(1, Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(0, Alloc(BG_SCREEN_SIZE));
    DecompressAndLoadBgGfxUsingHeap(1, sBgTiles_Gfx, 0, 0, 0);
    CopyToBgTilemapBuffer(1, sBgTiles_Tilemap, 0, 0);
    InitWindows(sWindowTemplates);
    DeactivateAllTextPrinters();
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    ScanlineEffect_Stop();
    m4aSoundVSyncOn();
    SetVBlankCallback(VBlankCB_WirelessCommunicationScreen);
    sStatusScreen->taskId = CreateTask(Task_WirelessCommunicationScreen, 0);
    sStatusScreen->rfuTaskId = CreateTask_ListenToWireless();
    sStatusScreen->prevGroupCounts[3] = 1;
    ChangeBgX(0, 0, BG_COORD_SET);
    ChangeBgY(0, 0, BG_COORD_SET);
    ChangeBgX(1, 0, BG_COORD_SET);
    ChangeBgY(1, 0, BG_COORD_SET);
    LoadPalette(sPalettes, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
    Menu_LoadStdPalAt(BG_PLTT_ID(15));
    DynamicPlaceholderTextUtil_Reset();
    FillBgTilemapBufferRect(0, 0x000, 0, 0, 32, 32, 15);
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
    for (i = 0; i < (int)ARRAY_COUNT(sBgTemplates); i++)
        Free(GetBgTilemapBuffer(i));
    Free(sStatusScreen);
    SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

// Cycle through palettes that relocate various shades of blue to create the wave effect at the bottom of the screen.
static void CyclePalette(s16 * counter, s16 * palIdx)
{
    s32 idx;
    if (++(*counter) > 5)
    {
        if (++(*palIdx) == (int)ARRAY_COUNT(sPalettes) - 2)
            *palIdx = 0;
        *counter = 0;
    }
    idx = *palIdx + 2; // +2 skips over default.pal and the empty black palette after it
    LoadPalette(sPalettes[idx], BG_PLTT_ID(0), PLTT_SIZEOF(8));
}

static void PrintHeaderTexts(void)
{
    s32 i;
    u32 width;

    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    FillWindowPixelBuffer(2, PIXEL_FILL(0));

    // Print title
    width = 192 - GetStringWidth(FONT_NORMAL_COPY_2, sHeaderTexts[0], 0);
    WCSS_AddTextPrinterParameterized(0, FONT_NORMAL_COPY_2, sHeaderTexts[0], width / 2, 6, COLOR_TITLE);

    // Print label for each group (excluding total)
    for (i = 0; i < NUM_GROUPTYPES - 1; i++)
        WCSS_AddTextPrinterParameterized(1, FONT_NORMAL_COPY_2, sHeaderTexts[i + 1], 0, 30 * i + 10, COLOR_NORMAL);

    // Print label for total
    WCSS_AddTextPrinterParameterized(1, FONT_NORMAL_COPY_2, sHeaderTexts[i + 1], 0, 30 * i + 10, COLOR_TOTAL);

    PutWindowTilemap(0);
    CopyWindowToVram(0, COPYWIN_GFX);
    PutWindowTilemap(1);
    CopyWindowToVram(1, COPYWIN_GFX);
}

#define tState data[0]

static void Task_WirelessCommunicationScreen(u8 taskId)
{
    s32 i;
    switch (gTasks[taskId].tState)
    {
    case 0:
        PrintHeaderTexts();
        gTasks[taskId].tState++;
        break;
    case 1:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        ShowBg(1);
        CopyBgTilemapBufferToVram(0);
        ShowBg(0);
        gTasks[taskId].tState++;
        break;
    case 2:
        if (!gPaletteFade.active)
            gTasks[taskId].tState++;
        break;
    case 3:
        if (UpdateCommunicationCounts(sStatusScreen->groupCounts, sStatusScreen->prevGroupCounts, sStatusScreen->activities, sStatusScreen->rfuTaskId))
        {
            FillWindowPixelBuffer(2, PIXEL_FILL(0));
            for (i = 0; i < NUM_GROUPTYPES; i++)
            {
                ConvertIntToDecimalStringN(gStringVar4, sStatusScreen->groupCounts[i], STR_CONV_MODE_RIGHT_ALIGN, 2);
                if (i != GROUPTYPE_TOTAL)
                    WCSS_AddTextPrinterParameterized(2, FONT_NORMAL_COPY_2, gStringVar4, 4, 30 * i + 10, COLOR_NORMAL);
                else
                    WCSS_AddTextPrinterParameterized(2, FONT_NORMAL_COPY_2, gStringVar4, 4, 100, COLOR_TOTAL);
            }
            PutWindowTilemap(2);
            CopyWindowToVram(2, COPYWIN_FULL);
        }
        if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gTasks[sStatusScreen->rfuTaskId].data[15] = 0xFF;
            gTasks[taskId].tState++;
        }
        CyclePalette(&gTasks[taskId].data[7], &gTasks[taskId].data[8]);
        break;
    case 4:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        gTasks[taskId].tState++;
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

static void WCSS_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 mode)
{
    u8 textColor[3];
    switch (mode)
    {
    case COLOR_NONE: // Unused. Default to usual text colors
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_DARK_GRAY;
        textColor[2] = TEXT_COLOR_LIGHT_GRAY;
        break;
    case COLOR_NORMAL:
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_WHITE;
        textColor[2] = TEXT_COLOR_LIGHT_GRAY;
        break;
    case COLOR_TOTAL:
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_RED;
        textColor[2] = TEXT_COLOR_LIGHT_RED;
        break;
    case COLOR_TITLE:
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_LIGHT_GREEN;
        textColor[2] = TEXT_COLOR_GREEN;
        break;
    case COLOR_UNUSED:
        textColor[0] = TEXT_COLOR_TRANSPARENT;
        textColor[1] = TEXT_COLOR_WHITE;
        textColor[2] = TEXT_COLOR_DARK_GRAY;
        break;
    // default: UB
    }
    AddTextPrinterParameterized4(windowId, fontId, x, y, fontId == FONT_SMALL ? 0 : 1, 0, textColor, TEXT_SKIP_DRAW, str);
}

static u32 CountPlayersInGroupAndGetActivity(struct RfuPlayer * player, u32 * groupCounts)
{
    u32 activity = player->rfu.data.activity;
    s32 i, j, k;

    #define group_activity(i) (sActivityGroupInfo[(i)][0])
    #define group_type(i)     (sActivityGroupInfo[(i)][1])
    #define group_players(i)  (sActivityGroupInfo[(i)][2])

    for (i = 0; i < ARRAY_COUNT(sActivityGroupInfo); i++)
    {
        if (activity == group_activity(i) && player->groupScheduledAnim == UNION_ROOM_SPAWN_IN)
        {
            if (group_players(i) == 0)
            {
                k = 0;
                for (j = 0; j < RFU_CHILD_MAX; j++)
                    if (player->rfu.data.partnerInfo[j] != 0) k++;
                k++;
                groupCounts[group_type(i)] += k;
            }
            else
            {
                groupCounts[group_type(i)] += group_players(i);
            }
        }
    }

    return activity;

    #undef group_activity
    #undef group_type
    #undef group_players
}

static bool32 HaveCountsChanged(const u32 * curCounts, const u32 * prevCounts)
{
    s32 i;

    for (i = 0; i < NUM_GROUPTYPES; i++)
    {
        if (curCounts[i] != prevCounts[i])
            return TRUE;
    }

    return FALSE;
}

static bool32 UpdateCommunicationCounts(u32 * groupCounts, u32 * prevGroupCounts, u32 * activities, u8 taskId)
{
    bool32 activitiesUpdated = FALSE;
    u32 groupCountBuffer[NUM_GROUPTYPES] = {0, 0, 0, 0};
    struct WirelessLink_Group * group = (void *)gTasks[taskId].data;
    s32 i;

    for (i = 0; i < NUM_TASK_DATA; i++)
    {
        u32 activity = CountPlayersInGroupAndGetActivity(&group->playerList->players[i], groupCountBuffer);
        if (activity != activities[i])
        {
            activities[i] = activity;
            activitiesUpdated = TRUE;
        }
    }

    if (!HaveCountsChanged(groupCountBuffer, prevGroupCounts))
    {
        if (activitiesUpdated == TRUE)
            return TRUE;
        else
            return FALSE;
    }

    memcpy(groupCounts,     groupCountBuffer, sizeof(groupCountBuffer));
    memcpy(prevGroupCounts, groupCountBuffer, sizeof(groupCountBuffer));
    
    groupCounts[GROUPTYPE_TOTAL] = groupCounts[GROUPTYPE_TRADE]
                                 + groupCounts[GROUPTYPE_BATTLE]
                                 + groupCounts[GROUPTYPE_UNION]
                            #ifdef BUGFIX
                                 + groupCounts[GROUPTYPE_TOTAL] // Missing count for activities not in above groups
                            #endif
                                 ;
    return TRUE;
}
