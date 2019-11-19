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
    MENUITEM_COUNT,
};
// Window Ids
enum
{
    WIN_TEXT_OPTION,
    WIN_OPTIONS,
};

static const struct WindowTemplate sOptionMenuWinTemplates[] =    //3CC2B8
{
    {
        .bg = 1,
        .tilemapLeft = 2,
        .tilemapTop = 3,
        .width = 26,
        .height = 2,
        .paletteNum = 1,
        .baseBlock = 2,
    },
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 7,
        .width = 26,
        .height = 12,
        .paletteNum = 1,
        .baseBlock = 0x36,
    },
	{
		.bg = 2,
		.tilemapLeft = 0,
		.tilemapTop = 0,
		.width = 30,
		.height = 2,
		.paletteNum = 0xF,
		.baseBlock = 0x16e,
	},
    DUMMY_WIN_TEMPLATE,
};
static const struct BgTemplate sOptionMenuBgTemplates[] =    //3CC2D8
{
   {
       .bg = 1,
       .charBaseIndex = 1,
       .mapBaseIndex = 30,
       .screenSize = 0,
       .paletteMode = 0,
       .priority = 0,
       .baseTile = 0,
   },
   {
       .bg = 0,
       .charBaseIndex = 1,
       .mapBaseIndex = 31,
       .screenSize = 0,
       .paletteMode = 0,
       .priority = 1,
       .baseTile = 0,
   },
   {
	   .bg = 2,
	   .charBaseIndex = 1,
	   .mapBaseIndex = 29,
	   .screenSize = 0,
	   .paletteMode = 0,
	   .priority = 2,
	   .baseTile = 0,
   },
};
static const u16 sOptionsMenuPalette[] = INCBIN_U16("graphics/misc/unk_83cc2e4.gbapal");	//3CC2E4
static const u16 sOptionsMenuItemCounts[MENUITEM_COUNT] = {3, 2, 2, 2, 3, 10, 0};    //3CC304
static const u8 *const sOptionMenuItemsNames[MENUITEM_COUNT] =     //3CC314
{
    [MENUITEM_TEXTSPEED]   = gText_TextSpeed,
    [MENUITEM_BATTLESCENE] = gText_BattleScene,
    [MENUITEM_BATTLESTYLE] = gText_BattleStyle,
    [MENUITEM_SOUND]       = gText_Sound,
    [MENUITEM_BUTTONMODE]  = gText_ButtonMode,
    [MENUITEM_FRAMETYPE]   = gText_Frame,
    [MENUITEM_CANCEL]      = gText_OptionMenuCancel,
};
static const u8 *const sTextSpeedOptions[] =	//3CC330
{
	gText_TextSpeedSlow, 
	gText_TextSpeedMid, 
	gText_TextSpeedFast
};
static const u8 *const sBattleSceneOptions[] = 	//3CC33C
{
	gText_BattleSceneOn, 
	gText_BattleSceneOff
};
static const u8 *const sBattleStyleOptions[] = //3CC344
{
	gText_BattleStyleShift,
	gText_BattleStyleSet
};
static const u8 *const sSoundOptions[] = 		//3CC34C
{
	gText_SoundMono, 
	gText_SoundStereo
};
static const u8 *const sButtonTypeOptions[] = 	//3CC354
{
	gText_ButtonTypeNormal, 
	gText_ButtonTypeLEqualsA,
	gText_ButtonTypeLR,
};
static const u8 sOptionsMenuPickSwitchCancelTextColor[] = {TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY};	//3CC360
static const u8 sOptionsMenuTextColor[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_RED, TEXT_COLOR_RED};	//3CC363


//This file's functions
static void sub_808835C(void);
static void sub_8088374(void);
static void sub_8088430(void);
static void sub_8088444(void);
static void sub_8088454(void);
static void sub_8088514(void);
static void sub_8088530(void);
static void sub_8088680(void);
static void sub_80886D4(void);
static bool8 sub_80886F0(void);
static void sub_8088780(u8 taskId);
static u8 sub_80888C0(void);
static void sub_80889A8(u8 selection);
static void sub_8088B00(u8 taskId);
static void sub_8088BD0(void);
static void sub_8088C0C(void);
static void sub_8088D8C(void);
static void sub_8088DE0(u16 selection);

struct OptionsMenu
{
    /*0x00*/ u16 option[MENUITEM_COUNT];    //0,2,4,6,8,a,c
    /*0x0E*/ u16 unkE;
    /*0x10*/ u8 state3;
    /*0x11*/ u8 state;
    /*0x12*/ u8 state2;
    /*0x13*/ u8 unk13;
};

EWRAM_DATA struct OptionsMenu *sOptionsMenuPtr = {0};



//CB2_InitOptionsMenu
static void sub_808835C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}


//VBlankCB_OptionsMenu
static void sub_8088374(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}


//sub_8088388
void CB2_OptionsMenuFromStartMenu(void)
{
    u8 i;
    
    if (gMain.savedCallback == NULL)
        gMain.savedCallback = CB2_ReturnToStartMenu;
    sOptionsMenuPtr = AllocZeroed(sizeof(struct OptionsMenu));
    sOptionsMenuPtr->state3 = 0;
    sOptionsMenuPtr->state2 = 0;
    sOptionsMenuPtr->state = 0;
    sOptionsMenuPtr->unkE = 0;
    sOptionsMenuPtr->option[MENUITEM_TEXTSPEED] = gSaveBlock2Ptr->optionsTextSpeed;
    sOptionsMenuPtr->option[MENUITEM_BATTLESCENE] = gSaveBlock2Ptr->optionsBattleSceneOff;
    sOptionsMenuPtr->option[MENUITEM_BATTLESTYLE] = gSaveBlock2Ptr->optionsBattleStyle;
    sOptionsMenuPtr->option[MENUITEM_SOUND] = gSaveBlock2Ptr->optionsSound;
    sOptionsMenuPtr->option[MENUITEM_BUTTONMODE] = gSaveBlock2Ptr->optionsButtonMode;
    sOptionsMenuPtr->option[MENUITEM_FRAMETYPE] = gSaveBlock2Ptr->optionsWindowFrameType;
    
    for (i = 0; i < MENUITEM_COUNT-1; i++)
    {
        if (sOptionsMenuPtr->option[i] > (sOptionsMenuItemCounts[i])-1)
            sOptionsMenuPtr->option[i] = 0;
    }
    HelpSystem_SetSomeVariable2(0xD);
    SetMainCallback2(sub_8088454);
}


//sub_8088430
static void sub_8088430(void)
{
    SetVBlankCallback(0);
    SetHBlankCallback(0);
}


//sub_8088444
static void sub_8088444(void)
{
    SetVBlankCallback(sub_8088374);
}

//sub_8088454
static void sub_8088454(void)
{
    u8 i, state;
    state = sOptionsMenuPtr->state;
    switch (state)
    {
    case 0:
        sub_8088430();
        break;
    case 1:
        sub_8088530();
        break;
    case 2:
        sub_80886D4();
        break;
    case 3:
        if (sub_80886F0() != TRUE)    //silly matching quirk
            return;
        break;
    case 4:
        sub_8088BD0();
        break;
    case 5:
        sub_8088C0C();
        break;
    case 6:
        sub_8088D8C();
        break;
    case 7:
        for (i = 0; i < MENUITEM_COUNT; i++)
            sub_80889A8(i);
        break;
    case 8:
        sub_8088DE0(sOptionsMenuPtr->unkE);
        break;
    case 9:
        sub_8088680();
        break;
    default:
        sub_8088514();
    }
    sOptionsMenuPtr->state++;
}

//sub_8088514
static void sub_8088514(void)
{
    CreateTask(sub_8088780, 0);
    SetMainCallback2(sub_808835C);
}


//sub_8088530
static void sub_8088530(void)
{
    void * dest = (void *) VRAM;
    DmaClearLarge16(3, dest, VRAM_SIZE, 0x1000);
    
    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);    
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sOptionMenuBgTemplates, ARRAY_COUNT(sOptionMenuBgTemplates));
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
    SetGpuReg(REG_OFFSET_BLDCNT, 0xC1);
    SetGpuReg(REG_OFFSET_BLDY, 2);
    SetGpuReg(REG_OFFSET_WININ, 1);
    SetGpuReg(REG_OFFSET_WINOUT, 0x27);
    SetGpuReg(0, 0x3040);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
};

//sub_8088680
static void sub_8088680(void)
{
    s32 x;
    x = 0xE4 - GetStringWidth(0, gText_PickSwitchCancel, 0);
    FillWindowPixelBuffer(2, 0xFF); 
    AddTextPrinterParameterized3(2, 0, x, 0, sOptionsMenuPickSwitchCancelTextColor, 0, gText_PickSwitchCancel);
    PutWindowTilemap(2);
    CopyWindowToVram(2, 3);
}


//sub_80886D4
static void sub_80886D4(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetTasks();
    ScanlineEffect_Stop();
}

//sub_80886F0
static bool8 sub_80886F0(void)
{
    switch (sOptionsMenuPtr->state2)
    {
    case 0:
        LoadBgTiles(1, GetUserFrameGraphicsInfo(sOptionsMenuPtr->option[MENUITEM_FRAMETYPE])->tiles, 0x120, 0x1AA);
        break;
    case 1:
        LoadPalette(GetUserFrameGraphicsInfo(sOptionsMenuPtr->option[MENUITEM_FRAMETYPE])->palette, 0x20, 0x20);
        break;
    case 2:
        LoadPalette(sOptionsMenuPalette, 0x10, 0x20);
        LoadPalette(stdpal_get(2), 0xF0, 0x20);
        break;
    case 3:
        sub_814FDA0(1, 0x1B3, 0x30);
        break;
    default:
        return TRUE;
    }
    sOptionsMenuPtr->state2++;
    return FALSE;
}



// I could not get this function to match. GOTO statements weren't even compiling correctly.
#ifdef NONMATCHING
static void sub_8088780(u8 taskId)
{
    u8 v2, v5;
    struct OptionsMenu v4;
    
    switch (sOptionsMenuPtr->state3)
    {
    case 0:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        sub_8088444();
        sOptionsMenuPtr->state3++;
        break;
    case 2:
        if ((bool32) sub_80BF72C() == TRUE)    //cast to bool32 to remove the lsl/lsr 0x18 after func call
            return;
        switch (sub_80888C0())
        {
        case 1:
            sOptionsMenuPtr->state3++;
            break;
        case 2:
            LoadBgTiles(1, GetUserFrameGraphicsInfo(sOptionsMenuPtr->option[MENUITEM_FRAMETYPE])->tiles, 0x120, 0x1AA);
            LoadPalette(GetUserFrameGraphicsInfo(sOptionsMenuPtr->option[MENUITEM_FRAMETYPE])->palette, 0x20, 0x20);
            sub_80889A8(sOptionsMenuPtr->unkE);
            sOptionsMenuPtr->state3++;
            break;
        case 3:
            sub_8088DE0(sOptionsMenuPtr->unkE);
            break;
        case 4:
            sub_80889A8(sOptionsMenuPtr->unkE);
            sOptionsMenuPtr->state3++;
            break;
        default:
            return;
        }
    case 3:
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        sOptionsMenuPtr->state3++;
    case 1:
    case 4:
        if (gPaletteFade.active)
            return;
        sOptionsMenuPtr->state3++;
    case 5:
        sub_8088B00(taskId);
        break;
    default:
        return;
    }
}
#else
NAKED
static void sub_8088780(u8 taskId)
{
    asm_unified("\tpush {r4,lr}\n"
                "\tsub sp, 0x4\n"
                "\tlsls r0, 24\n"
                "\tlsrs r2, r0, 24\n"
                "\tldr r1, _080887A0 @ =sOptionsMenuPtr\n"
                "\tldr r0, [r1]\n"
                "\tldrb r0, [r0, 0x10]\n"
                "\tadds r3, r1, 0\n"
                "\tcmp r0, 0x5\n"
                "\tbls _08088796\n"
                "\tb _080888B6\n"
                "_08088796:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _080887A4 @ =_080887A8\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_080887A0: .4byte sOptionsMenuPtr\n"
                "_080887A4: .4byte _080887A8\n"
                "\t.align 2, 0\n"
                "_080887A8:\n"
                "\t.4byte _080887C0\n"
                "\t.4byte _08088894\n"
                "\t.4byte _080887E0\n"
                "\t.4byte _08088878\n"
                "\t.4byte _08088894\n"
                "\t.4byte _080888B0\n"
                "_080887C0:\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0x10\n"
                "\tmovs r3, 0\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tbl sub_8088444\n"
                "\tldr r0, _080887DC @ =sOptionsMenuPtr\n"
                "\tldr r1, [r0]\n"
                "\tb _080888A2\n"
                "\t.align 2, 0\n"
                "_080887DC: .4byte sOptionsMenuPtr\n"
                "_080887E0:\n"
                "\tbl sub_80BF72C\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _080888B6\n"
                "\tbl sub_80888C0\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x4\n"
                "\tbhi _080888B6\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _08088800 @ =_08088804\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_08088800: .4byte _08088804\n"
                "\t.align 2, 0\n"
                "_08088804:\n"
                "\t.4byte _080888B6\n"
                "\t.4byte _08088818\n"
                "\t.4byte _08088824\n"
                "\t.4byte _08088858\n"
                "\t.4byte _08088868\n"
                "_08088818:\n"
                "\tldr r0, _08088820 @ =sOptionsMenuPtr\n"
                "\tldr r1, [r0]\n"
                "\tb _080888A2\n"
                "\t.align 2, 0\n"
                "_08088820: .4byte sOptionsMenuPtr\n"
                "_08088824:\n"
                "\tldr r4, _08088854 @ =sOptionsMenuPtr\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0xA]\n"
                "\tbl GetUserFrameGraphicsInfo\n"
                "\tldr r1, [r0]\n"
                "\tmovs r2, 0x90\n"
                "\tlsls r2, 1\n"
                "\tmovs r3, 0xD5\n"
                "\tlsls r3, 1\n"
                "\tmovs r0, 0x1\n"
                "\tbl LoadBgTiles\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0xA]\n"
                "\tbl GetUserFrameGraphicsInfo\n"
                "\tldr r0, [r0, 0x4]\n"
                "\tmovs r1, 0x20\n"
                "\tmovs r2, 0x20\n"
                "\tbl LoadPalette\n"
                "\tldr r0, [r4]\n"
                "\tb _0808886C\n"
                "\t.align 2, 0\n"
                "_08088854: .4byte sOptionsMenuPtr\n"
                "_08088858:\n"
                "\tldr r0, _08088864 @ =sOptionsMenuPtr\n"
                "\tldr r0, [r0]\n"
                "\tldrh r0, [r0, 0xE]\n"
                "\tbl sub_8088DE0\n"
                "\tb _080888B6\n"
                "\t.align 2, 0\n"
                "_08088864: .4byte sOptionsMenuPtr\n"
                "_08088868:\n"
                "\tldr r0, _08088874 @ =sOptionsMenuPtr\n"
                "\tldr r0, [r0]\n"
                "_0808886C:\n"
                "\tldrb r0, [r0, 0xE]\n"
                "\tbl sub_80889A8\n"
                "\tb _080888B6\n"
                "\t.align 2, 0\n"
                "_08088874: .4byte sOptionsMenuPtr\n"
                "_08088878:\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r0, _08088890 @ =sOptionsMenuPtr\n"
                "\tldr r1, [r0]\n"
                "\tb _080888A2\n"
                "\t.align 2, 0\n"
                "_08088890: .4byte sOptionsMenuPtr\n"
                "_08088894:\n"
                "\tldr r0, _080888AC @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _080888B6\n"
                "\tldr r1, [r3]\n"
                "_080888A2:\n"
                "\tldrb r0, [r1, 0x10]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1, 0x10]\n"
                "\tb _080888B6\n"
                "\t.align 2, 0\n"
                "_080888AC: .4byte gPaletteFade\n"
                "_080888B0:\n"
                "\tadds r0, r2, 0\n"
                "\tbl sub_8088B00\n"
                "_080888B6:\n"
                "\tadd sp, 0x4\n"
                "\tpop {r4}\n"
                "\tpop {r0}\n"
                "\tbx r0\n");
}
#endif   

//OptionsMenu_ProcessInput
static u8 sub_80888C0(void)
{ 
    u16 current;
    u16* curr;
    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        current = sOptionsMenuPtr->option[(sOptionsMenuPtr->unkE)];
        if (current == (sOptionsMenuItemCounts[sOptionsMenuPtr->unkE] - 1))
            sOptionsMenuPtr->option[sOptionsMenuPtr->unkE] = 0;
        else
            sOptionsMenuPtr->option[sOptionsMenuPtr->unkE] = current + 1;
        if (sOptionsMenuPtr->unkE == MENUITEM_FRAMETYPE)
            return 2;
        else
            return 4;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        curr = &sOptionsMenuPtr->option[sOptionsMenuPtr->unkE];
        if (*curr == 0)
            *curr = sOptionsMenuItemCounts[sOptionsMenuPtr->unkE] - 1;
        else
            --*(curr);
        
        if (sOptionsMenuPtr->unkE == MENUITEM_FRAMETYPE)
            return 2;
        else
            return 4;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (sOptionsMenuPtr->unkE == MENUITEM_TEXTSPEED)
            sOptionsMenuPtr->unkE = MENUITEM_CANCEL;
        else
            sOptionsMenuPtr->unkE = sOptionsMenuPtr->unkE - 1;
        return 3;        
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (sOptionsMenuPtr->unkE == MENUITEM_CANCEL)
            sOptionsMenuPtr->unkE = MENUITEM_TEXTSPEED;
        else
            sOptionsMenuPtr->unkE = sOptionsMenuPtr->unkE + 1;
        return 3;
    }
    else if ((gMain.newKeys & B_BUTTON) || (gMain.newKeys & A_BUTTON))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}


//sub_80889A8
#ifdef NONMATCHING    // could not get it to match perfectly, no idea how they put so many vars on the stack
static void sub_80889A8(u8 selection)
{
    u8* dst;
    u8* str;
    u8* v8;
    u8 x, y;
    
    memcpy(&dst, sOptionsMenuTextColor, 3);
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
        ConvertIntToDecimalStringN(v8, sOptionsMenuPtr->option[2*selection] + 1, 1, 2);
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
static void sub_80889A8(u8 selection)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r8\n"
                "\tpush {r7}\n"
                "\tsub sp, 0x30\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tadd r4, sp, 0x2C\n"
                "\tldr r1, _08088A08 @ =sOptionsMenuTextColor\n"
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
                "_08088A08: .4byte sOptionsMenuTextColor\n"
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
                "\tldr r0, _08088A98 @ =sOptionsMenuPtr\n"
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
                "_08088A98: .4byte sOptionsMenuPtr\n"
                "_08088A9C:\n"
                "\tldr r1, _08088AF8 @ =gText_FrameType\n"
                "\tadd r0, sp, 0xC\n"
                "\tbl StringCopy\n"
                "\tadd r4, sp, 0x20\n"
                "\tldr r0, _08088AFC @ =sOptionsMenuPtr\n"
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
                "_08088AFC: .4byte sOptionsMenuPtr\n");
}
#endif


//sub_8088B00
static void sub_8088B00(u8 taskId)
{
    gFieldCallback = sub_807DF64;
    SetMainCallback2(gMain.savedCallback);
    FreeAllWindowBuffers();
    
    gSaveBlock2Ptr->optionsTextSpeed = (u8) sOptionsMenuPtr->option[MENUITEM_TEXTSPEED];
    gSaveBlock2Ptr->optionsBattleSceneOff = (u8) sOptionsMenuPtr->option[MENUITEM_BATTLESCENE];
    gSaveBlock2Ptr->optionsBattleStyle = (u8) sOptionsMenuPtr->option[MENUITEM_BATTLESTYLE];
    gSaveBlock2Ptr->optionsSound = sOptionsMenuPtr->option[MENUITEM_SOUND];
    gSaveBlock2Ptr->optionsButtonMode = (u8) sOptionsMenuPtr->option[MENUITEM_BUTTONMODE];
    gSaveBlock2Ptr->optionsWindowFrameType = (u8) sOptionsMenuPtr->option[MENUITEM_FRAMETYPE];
    SetPokemonCryStereo(gSaveBlock2Ptr->optionsSound);
    Free(sOptionsMenuPtr);
    sOptionsMenuPtr = NULL;
    DestroyTask(taskId);
}

    
    
//sub_8088BD0
static void sub_8088BD0(void)
{
    FillWindowPixelBuffer(0, 0x11);
    AddTextPrinterParameterized(WIN_TEXT_OPTION, 2, gText_MenuOptionOption, 8, 1, TEXT_SPEED_FF, NULL);
    PutWindowTilemap(0);
    CopyWindowToVram(0, 3);
}


//sub_8088C0C
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

//sub_8088D8C
static void sub_8088D8C(void)
{
    u8 i;
    
    FillWindowPixelBuffer(1, 0x11);
    for (i = 0; i < MENUITEM_COUNT; i++)
    {
        AddTextPrinterParameterized(1, 2, sOptionMenuItemsNames[i], 8, (u8) ((i*(GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT))) + 2) - i, 0xFF, 0);    
    }
}


//sub_8088DE0
static void sub_8088DE0(u16 selection)
{
    u16 v1, v2;
    
    v1 = GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT);
    v2 = selection * (v1 - 1) + 0x3A;
    SetGpuReg(0x44, (v2 << 8) | (v2 + v1));
    SetGpuReg(0x40, 0x10E0);
}

