#include "global.h"
#include "gpu_regs.h"
#include "scanline_effect.h"
#include "text_window_graphics.h"
#include "menu.h"
#include "menu_helpers.h"
#include "task.h"
#include "palette.h"
#include "overworld.h"
#include "malloc.h"
#include "help_system.h"
#include "main.h"
#include "bg.h"
#include "window.h"
#include "text.h"
#include "text_window.h"
#include "string_util.h"
#include "strings.h"
#include "field_fadetransition.h"
#include "gba/m4a_internal.h"

// Menu items
enum
{
    MENUITEM_TEXTSPEED = 0,
    MENUITEM_BATTLESCENE,
    MENUITEM_BATTLESTYLE,
    MENUITEM_SOUND,
    MENUITEM_BUTTONMODE,
    MENUITEM_FRAMETYPE,
    MENUITEM_CANCEL,
    MENUITEM_COUNT
};

// Window Ids
enum
{
    WIN_TEXT_OPTION,
    WIN_OPTIONS
};

// RAM sumbols
struct OptionMenu
{
    /*0x00*/ u16 option[MENUITEM_COUNT];
    /*0x0E*/ u16 unkE;
    /*0x10*/ u8 state3;
    /*0x11*/ u8 state;
    /*0x12*/ u8 state2;
    /*0x13*/ u8 unk13;
};

EWRAM_DATA struct OptionMenu *sOptionMenuPtr = NULL;

//Function Declarataions
static void CB2_InitOptionMenu(void);
static void VBlankCB_OptionMenu(void);
static void OptionMenu_InitCallbacks(void);
static void OptionMenu_SetVBlankCallback(void);
static void CB2_OptionMenu(void);
static void SetOptionMenuTask(void);
static void InitOptionMenuBg(void);
static void OptionMenu_PickSwitchCancel(void);
static void OptionMenu_ResetSpriteData(void);
static bool8 LoadOptionMenuPalette(void);
static void Task_OptionMenu(u8 taskId);
static u8 OptionMenu_ProcessInput(void);
static void BufferOptionMenuString(u8 selection);
static void CloseAndSaveOptionMenu(u8 taskId);
static void PrintOptionMenuHeader(void);
static void sub_8088C0C(void);
static void LoadOptionMenuItemNames(void);
static void sub_8088DE0(u16 selection);

// Data Definitions
static const struct WindowTemplate sOptionMenuWinTemplates[] =
{
    {
        .bg = 1,
        .tilemapLeft = 2,
        .tilemapTop = 3,
        .width = 26,
        .height = 2,
        .paletteNum = 1,
        .baseBlock = 2
    },
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 7,
        .width = 26,
        .height = 12,
        .paletteNum = 1,
        .baseBlock = 0x36
    },
    {
        .bg = 2,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 30,
        .height = 2,
        .paletteNum = 0xF,
        .baseBlock = 0x16e
    },
    DUMMY_WIN_TEMPLATE
};

static const struct BgTemplate sOptionMenuBgTemplates[] =
{
   {
       .bg = 1,
       .charBaseIndex = 1,
       .mapBaseIndex = 30,
       .screenSize = 0,
       .paletteMode = 0,
       .priority = 0,
       .baseTile = 0
   },
   {
       .bg = 0,
       .charBaseIndex = 1,
       .mapBaseIndex = 31,
       .screenSize = 0,
       .paletteMode = 0,
       .priority = 1,
       .baseTile = 0
   },
   {
       .bg = 2,
       .charBaseIndex = 1,
       .mapBaseIndex = 29,
       .screenSize = 0,
       .paletteMode = 0,
       .priority = 2,
       .baseTile = 0
   },
};

static const u16 sOptionMenuPalette[] = INCBIN_U16("graphics/misc/unk_83cc2e4.gbapal");
static const u16 sOptionMenuItemCounts[MENUITEM_COUNT] = {3, 2, 2, 2, 3, 10, 0};

static const u8 *const sOptionMenuItemsNames[MENUITEM_COUNT] =
{
    [MENUITEM_TEXTSPEED]   = gText_TextSpeed,
    [MENUITEM_BATTLESCENE] = gText_BattleScene,
    [MENUITEM_BATTLESTYLE] = gText_BattleStyle,
    [MENUITEM_SOUND]       = gText_Sound,
    [MENUITEM_BUTTONMODE]  = gText_ButtonMode,
    [MENUITEM_FRAMETYPE]   = gText_Frame,
    [MENUITEM_CANCEL]      = gText_OptionMenuCancel,
};

static const u8 *const sTextSpeedOptions[] =
{
    gText_TextSpeedSlow, 
    gText_TextSpeedMid, 
    gText_TextSpeedFast
};

static const u8 *const sBattleSceneOptions[] =
{
    gText_BattleSceneOn, 
    gText_BattleSceneOff
};

static const u8 *const sBattleStyleOptions[] =
{
    gText_BattleStyleShift,
    gText_BattleStyleSet
};

static const u8 *const sSoundOptions[] =
{
    gText_SoundMono, 
    gText_SoundStereo
};

static const u8 *const sButtonTypeOptions[] =
{
    gText_ButtonTypeNormal, 
	gText_ButtonTypeLR,
    gText_ButtonTypeLEqualsA
};

static const u8 sOptionMenuPickSwitchCancelTextColor[] = {TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY};
static const u8 sOptionMenuTextColor[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_RED, TEXT_COLOR_RED};

// Functions
static void CB2_InitOptionMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_OptionMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_OptionsMenuFromStartMenu(void)
{
    u8 i;
    
    if (gMain.savedCallback == NULL)
        gMain.savedCallback = CB2_ReturnToStartMenu;
    sOptionMenuPtr = AllocZeroed(sizeof(struct OptionMenu));
    sOptionMenuPtr->state3 = 0;
    sOptionMenuPtr->state2 = 0;
    sOptionMenuPtr->state = 0;
    sOptionMenuPtr->unkE = 0;
    sOptionMenuPtr->option[MENUITEM_TEXTSPEED] = gSaveBlock2Ptr->optionsTextSpeed;
    sOptionMenuPtr->option[MENUITEM_BATTLESCENE] = gSaveBlock2Ptr->optionsBattleSceneOff;
    sOptionMenuPtr->option[MENUITEM_BATTLESTYLE] = gSaveBlock2Ptr->optionsBattleStyle;
    sOptionMenuPtr->option[MENUITEM_SOUND] = gSaveBlock2Ptr->optionsSound;
    sOptionMenuPtr->option[MENUITEM_BUTTONMODE] = gSaveBlock2Ptr->optionsButtonMode;
    sOptionMenuPtr->option[MENUITEM_FRAMETYPE] = gSaveBlock2Ptr->optionsWindowFrameType;
    
    for (i = 0; i < MENUITEM_COUNT-1; i++)
    {
        if (sOptionMenuPtr->option[i] > (sOptionMenuItemCounts[i])-1)
            sOptionMenuPtr->option[i] = 0;
    }
    HelpSystem_SetSomeVariable2(0xD);
    SetMainCallback2(CB2_OptionMenu);
}

static void OptionMenu_InitCallbacks(void)
{
    SetVBlankCallback(0);
    SetHBlankCallback(0);
}

static void OptionMenu_SetVBlankCallback(void)
{
    SetVBlankCallback(VBlankCB_OptionMenu);
}

static void CB2_OptionMenu(void)
{
    u8 i, state;
    state = sOptionMenuPtr->state;
    switch (state)
    {
    case 0:
        OptionMenu_InitCallbacks();
        break;
    case 1:
        InitOptionMenuBg();
        break;
    case 2:
        OptionMenu_ResetSpriteData();
        break;
    case 3:
        if (LoadOptionMenuPalette() != TRUE)
            return;
        break;
    case 4:
        PrintOptionMenuHeader();
        break;
    case 5:
        sub_8088C0C();
        break;
    case 6:
        LoadOptionMenuItemNames();
        break;
    case 7:
        for (i = 0; i < MENUITEM_COUNT; i++)
            BufferOptionMenuString(i);
        break;
    case 8:
        sub_8088DE0(sOptionMenuPtr->unkE);
        break;
    case 9:
        OptionMenu_PickSwitchCancel();
        break;
    default:
        SetOptionMenuTask();
    }
    sOptionMenuPtr->state++;
}

static void SetOptionMenuTask(void)
{
    CreateTask(Task_OptionMenu, 0);
    SetMainCallback2(CB2_InitOptionMenu);
}

static void InitOptionMenuBg(void)
{
    void * dest = (void *) VRAM;
    DmaClearLarge16(3, dest, VRAM_SIZE, 0x1000);    
    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);    
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sOptionMenuBgTemplates, NELEMS(sOptionMenuBgTemplates));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitWindows(sOptionMenuWinTemplates);
    DeactivateAllTextPrinters();
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_EFFECT_LIGHTEN);
    SetGpuReg(REG_OFFSET_BLDY, BLDCNT_TGT1_BG1);
    SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG0 | WINOUT_WIN01_BG1 | WINOUT_WIN01_BG2 | WINOUT_WIN01_CLR);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
};

static void OptionMenu_PickSwitchCancel(void)
{
    s32 x;
    x = 0xE4 - GetStringWidth(0, gText_PickSwitchCancel, 0);
    FillWindowPixelBuffer(2, PIXEL_FILL(15)); 
    AddTextPrinterParameterized3(2, 0, x, 0, sOptionMenuPickSwitchCancelTextColor, 0, gText_PickSwitchCancel);
    PutWindowTilemap(2);
    CopyWindowToVram(2, 3);
}

static void OptionMenu_ResetSpriteData(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetTasks();
    ScanlineEffect_Stop();
}

static bool8 LoadOptionMenuPalette(void)
{
    switch (sOptionMenuPtr->state2)
    {
    case 0:
        LoadBgTiles(1, GetUserFrameGraphicsInfo(sOptionMenuPtr->option[MENUITEM_FRAMETYPE])->tiles, 0x120, 0x1AA);
        break;
    case 1:
        LoadPalette(GetUserFrameGraphicsInfo(sOptionMenuPtr->option[MENUITEM_FRAMETYPE])->palette, 0x20, 0x20);
        break;
    case 2:
        LoadPalette(sOptionMenuPalette, 0x10, 0x20);
        LoadPalette(stdpal_get(2), 0xF0, 0x20);
        break;
    case 3:
        sub_814FDA0(1, 0x1B3, 0x30);
        break;
    default:
        return TRUE;
    }
    sOptionMenuPtr->state2++;
    return FALSE;
}

static void Task_OptionMenu(u8 taskId)
{
    switch (sOptionMenuPtr->state3)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, RGB_BLACK);
        OptionMenu_SetVBlankCallback();
        sOptionMenuPtr->state3++;
        break;
    case 2:
        if (sub_80BF72C() == TRUE)    //cast to bool32 to remove the lsl/lsr 0x18 after func call
            break;
        switch (OptionMenu_ProcessInput())
        {
        case 0:
            break;
        case 1:
            sOptionMenuPtr->state3++;
            break;
        case 2:
            LoadBgTiles(1, GetUserFrameGraphicsInfo(sOptionMenuPtr->option[MENUITEM_FRAMETYPE])->tiles, 0x120, 0x1AA);
            LoadPalette(GetUserFrameGraphicsInfo(sOptionMenuPtr->option[MENUITEM_FRAMETYPE])->palette, 0x20, 0x20);
            BufferOptionMenuString(sOptionMenuPtr->unkE);
            break;
        case 3:
            sub_8088DE0(sOptionMenuPtr->unkE);
            break;
        case 4:
            BufferOptionMenuString(sOptionMenuPtr->unkE);
            break;
        }
        break;
    case 3:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, RGB_BLACK);
        sOptionMenuPtr->state3++;
        break;
    case 1:
    case 4:
        if (gPaletteFade.active)
            return;
        sOptionMenuPtr->state3++;
        break;
    case 5:
        CloseAndSaveOptionMenu(taskId);
        break;
    }
}

static u8 OptionMenu_ProcessInput(void)
{ 
    u16 current;
    u16* curr;
    if (JOY_REPT(DPAD_RIGHT))
    {
        current = sOptionMenuPtr->option[(sOptionMenuPtr->unkE)];
        if (current == (sOptionMenuItemCounts[sOptionMenuPtr->unkE] - 1))
            sOptionMenuPtr->option[sOptionMenuPtr->unkE] = 0;
        else
            sOptionMenuPtr->option[sOptionMenuPtr->unkE] = current + 1;
        if (sOptionMenuPtr->unkE == MENUITEM_FRAMETYPE)
            return 2;
        else
            return 4;
    }
    else if (JOY_REPT(DPAD_LEFT))
    {
        curr = &sOptionMenuPtr->option[sOptionMenuPtr->unkE];
        if (*curr == 0)
            *curr = sOptionMenuItemCounts[sOptionMenuPtr->unkE] - 1;
        else
            --*curr;
        
        if (sOptionMenuPtr->unkE == MENUITEM_FRAMETYPE)
            return 2;
        else
            return 4;
    }
    else if (JOY_REPT(DPAD_UP))
    {
        if (sOptionMenuPtr->unkE == MENUITEM_TEXTSPEED)
            sOptionMenuPtr->unkE = MENUITEM_CANCEL;
        else
            sOptionMenuPtr->unkE = sOptionMenuPtr->unkE - 1;
        return 3;        
    }
    else if (JOY_REPT(DPAD_DOWN))
    {
        if (sOptionMenuPtr->unkE == MENUITEM_CANCEL)
            sOptionMenuPtr->unkE = MENUITEM_TEXTSPEED;
        else
            sOptionMenuPtr->unkE = sOptionMenuPtr->unkE + 1;
        return 3;
    }
    else if (JOY_NEW(B_BUTTON) || JOY_NEW(A_BUTTON))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

#ifdef NONMATCHING    // could not get it to match perfectly, no idea how they put so many vars on the stack
static void BufferOptionMenuString(u8 selection)
{
    u8 dst[3];
    u8* str;
    u8* v8;
    u8 x, y;
    
    memcpy(&dst, sOptionMenuTextColor, 3);
    y = ((GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT) - 1) * selection) + 2;
    x = 0x82;
    FillWindowPixelRect(1, 1, x, y, 0x46, GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT));

    switch (selection)
    {
    case MENUITEM_TEXTSPEED:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, sTextSpeedOptions);
        break;
    case MENUITEM_BATTLESCENE:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, sBattleSceneOptions);
        break;
    case MENUITEM_BATTLESTYLE:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, sBattleStyleOptions);
        break;
    case MENUITEM_SOUND:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, sSoundOptions);
        break;
    case MENUITEM_BUTTONMODE:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, sButtonTypeOptions);
        break;
    case MENUITEM_FRAMETYPE:
        StringCopy(str, gText_FrameType);
        ConvertIntToDecimalStringN(v8, sOptionMenuPtr->option[2 * selection] + 1, 1, 2);
        StringAppendN(str, v8, 3);
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, str);
        break;
    default:
        break;
    }
    PutWindowTilemap(1);
    CopyWindowToVram(1, 3);
}
#else
NAKED
static void BufferOptionMenuString(u8 selection)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r8\n"
                "\tpush {r7}\n"
                "\tsub sp, 0x30\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tadd r4, sp, 0x2C\n"
                "\tldr r1, _08088A08 @ =sOptionMenuTextColor\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r2, 0x3\n"
                "\tbl memcpy\n"
                "\tmovs r0, 0x82\n"
                "\tmov r8, r0\n"
                "\tmovs r0, 0x2\n"
                "\tmovs r1, 0x1\n"
                "\tbl GetFontAttribute\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tsubs r0, 0x1\n"
                "\tmuls r0, r5\n"
                "\tadds r0, 0x2\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tmovs r0, 0x2\n"
                "\tmovs r1, 0x1\n"
                "\tbl GetFontAttribute\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmovs r1, 0x46\n"
                "\tstr r1, [sp]\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0x1\n"
                "\tmovs r2, 0x82\n"
                "\tadds r3, r7, 0\n"
                "\tbl FillWindowPixelRect\n"
                "\tadds r6, r4, 0\n"
                "\tcmp r5, 0x5\n"
                "\tbhi _08088ADE\n"
                "\tlsls r0, r5, 2\n"
                "\tldr r1, _08088A0C @ =_08088A10\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_08088A08: .4byte sOptionMenuTextColor\n"
                "_08088A0C: .4byte _08088A10\n"
                "\t.align 2, 0\n"
                "_08088A10:\n"
                "\t.4byte _08088A28\n"
                "\t.4byte _08088A38\n"
                "\t.4byte _08088A48\n"
                "\t.4byte _08088A58\n"
                "\t.4byte _08088A68\n"
                "\t.4byte _08088A9C\n"
                "_08088A28:\n"
                "\tstr r6, [sp]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tldr r2, _08088A34 @ =sTextSpeedOptions\n"
                "\tb _08088A72\n"
                "\t.align 2, 0\n"
                "_08088A34: .4byte sTextSpeedOptions\n"
                "_08088A38:\n"
                "\tstr r6, [sp]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tldr r2, _08088A44 @ =sBattleSceneOptions\n"
                "\tb _08088A72\n"
                "\t.align 2, 0\n"
                "_08088A44: .4byte sBattleSceneOptions\n"
                "_08088A48:\n"
                "\tstr r6, [sp]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tldr r2, _08088A54 @ =sBattleStyleOptions\n"
                "\tb _08088A72\n"
                "\t.align 2, 0\n"
                "_08088A54: .4byte sBattleStyleOptions\n"
                "_08088A58:\n"
                "\tstr r6, [sp]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tldr r2, _08088A64 @ =sSoundOptions\n"
                "\tb _08088A72\n"
                "\t.align 2, 0\n"
                "_08088A64: .4byte sSoundOptions\n"
                "_08088A68:\n"
                "\tstr r6, [sp]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tldr r2, _08088A94 @ =sButtonTypeOptions\n"
                "_08088A72:\n"
                "\tldr r0, _08088A98 @ =sOptionMenuPtr\n"
                "\tldr r0, [r0]\n"
                "\tlsls r1, r5, 1\n"
                "\tadds r0, r1\n"
                "\tldrh r0, [r0]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r2\n"
                "\tldr r0, [r0]\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0x2\n"
                "\tmov r2, r8\n"
                "\tadds r3, r7, 0\n"
                "\tbl AddTextPrinterParameterized3\n"
                "\tb _08088ADE\n"
                "\t.align 2, 0\n"
                "_08088A94: .4byte sButtonTypeOptions\n"
                "_08088A98: .4byte sOptionMenuPtr\n"
                "_08088A9C:\n"
                "\tldr r1, _08088AF8 @ =gText_FrameType\n"
                "\tadd r0, sp, 0xC\n"
                "\tbl StringCopy\n"
                "\tadd r4, sp, 0x20\n"
                "\tldr r0, _08088AFC @ =sOptionMenuPtr\n"
                "\tldr r0, [r0]\n"
                "\tlsls r1, r5, 1\n"
                "\tadds r0, r1\n"
                "\tldrh r1, [r0]\n"
                "\tadds r1, 0x1\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r2, 0x1\n"
                "\tmovs r3, 0x2\n"
                "\tbl ConvertIntToDecimalStringN\n"
                "\tadd r0, sp, 0xC\n"
                "\tadds r1, r4, 0\n"
                "\tmovs r2, 0x3\n"
                "\tbl StringAppendN\n"
                "\tstr r6, [sp]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tadd r0, sp, 0xC\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0x2\n"
                "\tmov r2, r8\n"
                "\tadds r3, r7, 0\n"
                "\tbl AddTextPrinterParameterized3\n"
                "_08088ADE:\n"
                "\tmovs r0, 0x1\n"
                "\tbl PutWindowTilemap\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0x3\n"
                "\tbl CopyWindowToVram\n"
                "\tadd sp, 0x30\n"
                "\tpop {r3}\n"
                "\tmov r8, r3\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_08088AF8: .4byte gText_FrameType\n"
                "_08088AFC: .4byte sOptionMenuPtr\n");
}
#endif

static void CloseAndSaveOptionMenu(u8 taskId)
{
    gFieldCallback = sub_807DF64;
    SetMainCallback2(gMain.savedCallback);
    FreeAllWindowBuffers();
    gSaveBlock2Ptr->optionsTextSpeed = (u8) sOptionMenuPtr->option[MENUITEM_TEXTSPEED];
    gSaveBlock2Ptr->optionsBattleSceneOff = (u8) sOptionMenuPtr->option[MENUITEM_BATTLESCENE];
    gSaveBlock2Ptr->optionsBattleStyle = (u8) sOptionMenuPtr->option[MENUITEM_BATTLESTYLE];
    gSaveBlock2Ptr->optionsSound = sOptionMenuPtr->option[MENUITEM_SOUND];
    gSaveBlock2Ptr->optionsButtonMode = (u8) sOptionMenuPtr->option[MENUITEM_BUTTONMODE];
    gSaveBlock2Ptr->optionsWindowFrameType = (u8) sOptionMenuPtr->option[MENUITEM_FRAMETYPE];
    SetPokemonCryStereo(gSaveBlock2Ptr->optionsSound);
    FREE_AND_SET_NULL(sOptionMenuPtr);
    DestroyTask(taskId);
}

static void PrintOptionMenuHeader(void)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    AddTextPrinterParameterized(WIN_TEXT_OPTION, 2, gText_MenuOption, 8, 1, TEXT_SPEED_FF, NULL);
    PutWindowTilemap(0);
    CopyWindowToVram(0, 3);
}

static void sub_8088C0C(void)
{
    u8 h;
    h = 2;
    
    FillBgTilemapBufferRect(1, 0x1B3, 1, 2, 1, 1, 3);
    FillBgTilemapBufferRect(1, 0x1B4, 2, 2, 0x1B, 1, 3);
    FillBgTilemapBufferRect(1, 0x1B5, 0x1C, 2, 1, 1, 3);
    FillBgTilemapBufferRect(1, 0x1B6, 1, 3, 1, h, 3);
    FillBgTilemapBufferRect(1, 0x1B8, 0x1C, 3, 1, h, 3);
    FillBgTilemapBufferRect(1, 0x1B9, 1, 5, 1, 1, 3);
    FillBgTilemapBufferRect(1, 0x1BA, 2, 5, 0x1B, 1, 3);
    FillBgTilemapBufferRect(1, 0x1BB, 0x1C, 5, 1, 1, 3);
    FillBgTilemapBufferRect(1, 0x1AA, 1, 6, 1, 1, h);
    FillBgTilemapBufferRect(1, 0x1AB, 2, 6, 0x1A, 1, h);
    FillBgTilemapBufferRect(1, 0x1AC, 0x1C, 6, 1, 1, h);
    FillBgTilemapBufferRect(1, 0x1AD, 1, 7, 1, 0x10, h);
    FillBgTilemapBufferRect(1, 0x1AF, 0x1C, 7, 1, 0x10, h);
    FillBgTilemapBufferRect(1, 0x1B0, 1, 0x13, 1, 1, h);
    FillBgTilemapBufferRect(1, 0x1B1, 2, 0x13, 0x1A, 1, h);
    FillBgTilemapBufferRect(1, 0x1B2, 0x1C, 0x13, 1, 1, h);
    CopyBgTilemapBufferToVram(1);
}

static void LoadOptionMenuItemNames(void)
{
    u8 i;
    
    FillWindowPixelBuffer(1, PIXEL_FILL(1));
    for (i = 0; i < MENUITEM_COUNT; i++)
    {
        AddTextPrinterParameterized(WIN_OPTIONS, 2, sOptionMenuItemsNames[i], 8, (u8) ((i * (GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT))) + 2) - i, TEXT_SPEED_FF, NULL);    
    }
}

static void sub_8088DE0(u16 selection)
{
    u16 v1, v2;
    
    v1 = GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT);
    v2 = selection * (v1 - 1) + 0x3A;
    SetGpuReg(REG_OFFSET_WIN0V, (v2 << 8) | (v2 + v1));
    SetGpuReg(REG_OFFSET_WIN0H, WINOUT_WINOBJ_OBJ | WIN_RANGE(0, 0xE0));
}
