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
    WIN_OPTIONS
};

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
static void sub_8088DE0(u8 selection);

extern const u16 gUnknown_83CC304[];		//sOptionsMenuItemCounts
extern const struct BgTemplate gUnknown_83CC2D8[];
extern const u8 gUnknown_83CC360[];
extern const u16 gUnknown_83CC2E4[];
extern const struct WindowTemplate gUnknown_83CC2B8[];
extern const u8 gUnknown_83CC363[];
extern const u8 gUnknown_83CC330[];
extern const u8 gUnknown_83CC33C[];
extern const u8 gUnknown_83CC344[];
extern const u8 gUnknown_83CC34C[];
extern const u8 gUnknown_83CC354[];
extern const u8 gUnknown_8419E52[];
extern const u8 gUnknown_8419DCC[];
extern const u8* gUnknown_83CC314[MENUITEM_COUNT];
extern const u8 gUnknown_8419E57[];

struct OptionsMenu
{
    /*0x00*/ u16 option[7];
    /*0x0E*/ u16 unkE;
    /*0x10*/ u8 state3;
    /*0x11*/ u8 state;
    /*0x12*/ u8 state2;
    /*0x13*/ u8 unk13;
};

EWRAM_DATA struct OptionsMenu *sOptionsMenu = {0};


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
    int i;
    
    if (gMain.savedCallback == NULL)
        gMain.savedCallback = CB2_ReturnToStartMenu;
    sOptionsMenu = AllocZeroed(sizeof(struct OptionsMenu));
    sOptionsMenu->state3 = 0;
    sOptionsMenu->state2 = 0;
    sOptionsMenu->state = 0;
    sOptionsMenu->unkE = 0;
    sOptionsMenu->option[MENUITEM_TEXTSPEED] = gSaveBlock2Ptr->optionsTextSpeed;
    sOptionsMenu->option[MENUITEM_BATTLESCENE] = gSaveBlock2Ptr->optionsBattleSceneOff;
    sOptionsMenu->option[MENUITEM_BATTLESTYLE] = gSaveBlock2Ptr->optionsBattleStyle;
    sOptionsMenu->option[MENUITEM_SOUND] = gSaveBlock2Ptr->optionsSound;
    sOptionsMenu->option[MENUITEM_BUTTONMODE] = gSaveBlock2Ptr->optionsButtonMode;
    sOptionsMenu->option[MENUITEM_FRAMETYPE] = gSaveBlock2Ptr->optionsWindowFrameType;
    
    for (i = 0; i < MENUITEM_COUNT-2; i++)
    {
        if (sOptionsMenu->option[i] > gUnknown_83CC304[i]-1)
            sOptionsMenu->option[i] = 0;        
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
    int i;
    switch (sOptionsMenu->state)
    {
    case 0:
        sub_8088430();
        sOptionsMenu->state++;
        break;
    case 1:
        sub_8088530();
        sOptionsMenu->state++;
        break;
    case 2:
        sub_80886D4();
        sOptionsMenu->state++;
        break;
    case 3:
        if (!(sub_80886F0()));
            return;
        sOptionsMenu->state++;
        break;
    case 4:
        sub_8088BD0();
        sOptionsMenu->state++;
        break;
    case 5:
        sub_8088C0C();
        sOptionsMenu->state++;
        break;
    case 6:
        sub_8088D8C();
        sOptionsMenu->state++;
        break;
    case 7:
        for (i = 0; i < MENUITEM_COUNT; i++)
            sub_80889A8(i);
        sOptionsMenu->state++;
        break;
    case 8:
        sub_8088DE0(sOptionsMenu->unkE);
        sOptionsMenu->state++;
        break;
    case 9:
        sub_8088680();
        sOptionsMenu->state++;
        break;
    default:
        sub_8088514();
        return;
    }
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
    InitBgsFromTemplates(0, gUnknown_83CC2D8, 3);	//3 -> ARRAY_COUNT(gUnknown_83CC2D8)
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitWindows(gUnknown_83CC2B8);
    DeactivateAllTextPrinters();
    SetGpuReg(REG_OFFSET_BLDCNT, 193);
    SetGpuReg(REG_OFFSET_BLDY, 2);
    SetGpuReg(REG_OFFSET_WININ, 1);
    SetGpuReg(REG_OFFSET_WINOUT, 27);
    SetGpuReg(0, 0x3040);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
};

//sub_8088680
static void sub_8088680(void)
{
    s32 x;
    x = 0xE4 - GetStringWidth(0, gUnknown_8419E57, 0);
    FillWindowPixelBuffer(WIN_OPTIONS, 0xFF); 
    AddTextPrinterParameterized3(2, 0, x, 0, gUnknown_83CC360, 0, gUnknown_8419E57);
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
    switch (sOptionsMenu->state2)
    {
    case 0:
        LoadBgTiles(1, GetUserFrameGraphicsInfo(sOptionsMenu->option[6])->tiles, 0x120, 0x1AA);
        break;
    case 1:
        LoadPalette(GetUserFrameGraphicsInfo(sOptionsMenu->option[6])->palette, 0x20, 0x20);
        break;
    case 2:
        LoadPalette(gUnknown_83CC2E4, 0x10, 0x20);
        LoadPalette(stdpal_get(2), 0xF0, 0x20);
        break;
    case 3:
        sub_814FDA0(1, 0x1B3, 0x30);
        break;
    default:
        return TRUE;
    }
    sOptionsMenu->state2++;
    return FALSE;
}


//sub_8088780
static void sub_8088780(u8 taskId)
{
    switch (sOptionsMenu->state3)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, RGB_BLACK);
        sub_8088444();
        sOptionsMenu->state3++;
        break;
    case 2:
        if (sub_80BF72C)
            return;
        switch (sub_80888C0())
        {
        case 0:
            return;
        case 1:
            sOptionsMenu->state3++;
            break;
        case 2:
            LoadBgTiles(1, GetUserFrameGraphicsInfo(sOptionsMenu->option[6])->tiles, 0x120, 0x1AA);
            LoadPalette(GetUserFrameGraphicsInfo(sOptionsMenu->option[6])->palette, 0x20, 0x20);
            sub_80889A8(sOptionsMenu->unkE);
            return;
        case 3:
            sub_8088DE0(sOptionsMenu->unkE);
            return;
        case 4:
            sub_80889A8(sOptionsMenu->unkE);
            return;
        default:
            return;
        }
    case 3:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, RGB_BLACK);
        sOptionsMenu->state3++;
        break;
    case 1:
    case 4:
        if (gPaletteFade.active)
            return;
        sOptionsMenu->state3++;
        return;
    case 5:
        sub_8088B00(taskId);
        return;
    default:
        return;
    }
}


//OptionsMenu_ProcessInput
static u8 sub_80888C0(void)
{ 
    u16 current, selection;
    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
		selection = 2 * sOptionsMenu->unkE;
		current = sOptionsMenu->option[selection];
		
		if (current == gUnknown_83CC304[selection] - 1)
            sOptionsMenu->option[selection] = 0;
        else
            sOptionsMenu->option[selection] = current + 1;
        if (sOptionsMenu->unkE == MENUITEM_FRAMETYPE)
            return 2;
        else
            return 4;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        selection = 2*sOptionsMenu->unkE;
		current = sOptionsMenu->option[selection];
		if (current == 0)
            sOptionsMenu->option[selection] = gUnknown_83CC304[selection] - 1;
        else
            sOptionsMenu->option[selection] = current - 1;
        if (sOptionsMenu->unkE == MENUITEM_FRAMETYPE)
            return 2;
        else
            return 4;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        selection = sOptionsMenu->unkE;
		if (selection == MENUITEM_TEXTSPEED)
            sOptionsMenu->unkE = MENUITEM_CANCEL;
        else
            sOptionsMenu->unkE = selection - 1;
        return 3;        
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        selection = sOptionsMenu->unkE;
		if (selection == MENUITEM_CANCEL)
            sOptionsMenu->unkE = MENUITEM_TEXTSPEED;
        else
            sOptionsMenu->unkE = selection + 1;
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

/*
// must match with goto :( 
bool sub_80888C0()
{
    int v0; // r0@2
    _WORD *v1; // r3@2
    int v2; // r4@2
    __int16 v3; // r0@3
    int v4; // r3@8
    __int16 v5; // r0@8
    int v7; // r1@14
    signed __int16 v8; // r0@15
    int v9; // r0@18

    if (gMain.buttons4_new_and_keyrepeat & DPAD_RIGHT)
    {
        v0 = 2 * *(_WORD *)(sOptionsMenu + 14);
        v1 = (_WORD *)(sOptionsMenu + v0);
        v2 = *(_WORD *)(sOptionsMenu + v0);
        if ( v2 == *(_WORD *)((char *)&sOptionsMenuItemCounts + v0) - 1 )
            v3 = 0;
        else
            v3 = v2 + 1;
        *v1 = v3;
        if ( *(_WORD *)(sOptionsMenu + 14) != 5 )
            return 4;
        return 2;
    }
    if ( gMain.buttons4_new_and_keyrepeat & DPAD_LEFT )
    {
        v4 = 2 * *(_WORD *)(sOptionsMenu + 14);
        v5 = *(_WORD *)(sOptionsMenu + v4);
        if ( !*(_WORD *)(sOptionsMenu + v4) )
            v5 = *(_WORD *)((char *)&sOptionsMenuItemCounts + v4);
        *(_WORD *)(sOptionsMenu + v4) = v5 - 1;
        if ( *(_WORD *)(sOptionsMenu + 14) != 5 )
            return 4;
        return 2;
    }
    if ( gMain.buttons4_new_and_keyrepeat & 0x40 )
    {
        v7 = sOptionsMenu;
        if ( *(_WORD *)(sOptionsMenu + 14) )
            v8 = *(_WORD *)(sOptionsMenu + 14) - 1;
        else
            v8 = 6;
        goto LABEL_21;
    }
    if ( gMain.buttons4_new_and_keyrepeat & 0x80 )
    {
        v7 = sOptionsMenu;
        v9 = *(_WORD *)(sOptionsMenu + 14);
        if ( v9 == 6 )
        {
            *(_WORD *)(sOptionsMenu + 14) = 0;
            return 3;
        }
        v8 = v9 + 1;
LABEL_21:
        *(_WORD *)(v7 + 14) = v8;
        return 3;
    }
    return gMain.buttons3_new_remapped & 2 || gMain.buttons3_new_remapped & 1;
}
*/


//sub_80889A8
static void sub_80889A8(u8 selection)
{
    u8* dst;
    u8* str;
	u8* v8;
    u8 x, y;
    
    x = 0x82;
    memcpy(dst, gUnknown_83CC363, 3);
    y = ((GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT) - 1) * selection) + 2;
    FillWindowPixelRect(1, 1, x, y, 0x46, GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT));
    switch (selection)
    {
    case MENUITEM_TEXTSPEED:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, gUnknown_83CC330);
        break;
    case MENUITEM_BATTLESCENE:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, gUnknown_83CC33C);
        break;
    case MENUITEM_BATTLESTYLE:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, gUnknown_83CC344);
        break;
    case MENUITEM_SOUND:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, gUnknown_83CC34C);
        break;
    case MENUITEM_BUTTONMODE:
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, gUnknown_83CC354);
        break;
    case MENUITEM_FRAMETYPE:
        StringCopy(str, gUnknown_8419E52);
		ConvertIntToDecimalStringN(v8, sOptionsMenu->option[2*selection] + 1, 1, 2);
        StringAppendN(str, v8, 3);
        AddTextPrinterParameterized3(1, 2, x, y, dst, -1, str);
        break;
    default:
        break;
    }
    PutWindowTilemap(1);
    CopyWindowToVram(1, 3);
}


//sub_8088B00
static void sub_8088B00(u8 taskId)
{
    gFieldCallback = sub_807DF64;
    SetMainCallback2(gMain.savedCallback);
    FreeAllWindowBuffers();
    
    gSaveBlock2Ptr->optionsTextSpeed = sOptionsMenu->option[MENUITEM_TEXTSPEED] & 0x7;
    gSaveBlock2Ptr->optionsBattleSceneOff = sOptionsMenu->option[MENUITEM_BATTLESCENE] & 0x1;
    gSaveBlock2Ptr->optionsBattleStyle = sOptionsMenu->option[MENUITEM_BATTLESTYLE] & 0x1;
    gSaveBlock2Ptr->optionsSound = sOptionsMenu->option[MENUITEM_SOUND] & 0x1;
    gSaveBlock2Ptr->optionsButtonMode = sOptionsMenu->option[MENUITEM_BUTTONMODE];
    gSaveBlock2Ptr->optionsWindowFrameType = sOptionsMenu->option[MENUITEM_FRAMETYPE];
    
    SetPokemonCryStereo(gSaveBlock2Ptr->optionsSound);
	Free(sOptionsMenu);
    sOptionsMenu = NULL;
	DestroyTask(taskId);
}


//sub_8088BD0
static void sub_8088BD0(void)
{
    FillWindowPixelBuffer(0, 0x11);
    AddTextPrinterParameterized(WIN_TEXT_OPTION, 2, gUnknown_8419DCC, 8, 1, TEXT_SPEED_FF, NULL);
    PutWindowTilemap(0);
    CopyWindowToVram(0, 3);
}


//sub_8088C0C
static void sub_8088C0C(void)
{
    FillBgTilemapBufferRect(1, 0x1B3, 1, 2, 1, 1, 3);
    FillBgTilemapBufferRect(1, 0x1B4, 2, 2, 0x1B, 1, 3);
    FillBgTilemapBufferRect(1, 0x1B5, 0x1C, 2, 1, 1, 3);
    FillBgTilemapBufferRect(1, 0x1B6, 1, 3, 1, 2, 3);
    FillBgTilemapBufferRect(1, 0x1B8, 1, 0x1C, 1, 2, 3);
	FillBgTilemapBufferRect(1, 0x1B9, 1, 5, 1, 1, 3);
    FillBgTilemapBufferRect(1, 0x1BA, 2, 5, 0x1B, 1, 3);
    FillBgTilemapBufferRect(1, 0x1BB, 0x1C, 5, 1, 1, 3);
    FillBgTilemapBufferRect(1, 0x1AA, 1, 6, 1, 1, 2);
    FillBgTilemapBufferRect(1, 0x1AB, 2, 6, 0x1A, 1, 2);
    FillBgTilemapBufferRect(1, 0x1AC, 0x1C, 6, 1, 1, 2);
    FillBgTilemapBufferRect(1, 0x1AD, 1, 7, 1, 0x10, 2);
	FillBgTilemapBufferRect(1, 0x1AF, 0x1C, 7, 1, 0x10, 2);
    FillBgTilemapBufferRect(1, 0x1B0, 1, 0x13, 1, 1, 2);
    FillBgTilemapBufferRect(1, 0x1B1, 2, 0x13, 0x1A, 1, 2);
    FillBgTilemapBufferRect(1, 0x1B2, 0x1C, 0x13, 1, 1, 2);
    CopyBgTilemapBufferToVram(1);
}


//sub_8088D8C
static void sub_8088D8C(void)
{
    int i;
    u8 attr;
    
    FillWindowPixelBuffer(1, 0x11);
    
    for (i = 0; i < MENUITEM_COUNT; i++)
    {
        attr = (((GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT))*i) + 2) - i;
        AddTextPrinterParameterized(1, 2, gUnknown_83CC314[i], 8, attr, 0xFF, 0);
    }
}


//sub_8088DE0
static void sub_8088DE0(u8 selection)
{
    u8 attr;
    attr = GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT);
    SetGpuReg(0x44, ((selection * (attr - 1) + 58) << 8) | (selection * (attr - 1) + 58 + attr));
    SetGpuReg(0x40, 4320);
}

