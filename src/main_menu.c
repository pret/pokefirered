#include "global.h"
#include "gflib.h"
#include "scanline_effect.h"
#include "decompress.h"
#include "graphics.h"
#include "task.h"
#include "save.h"
#include "event_data.h"
#include "field_effect.h"
#include "menu.h"
#include "option_menu.h"
#include "map_name_popup.h"
#include "region_map.h"
#include "field_player_avatar.h"
#include "event_object_movement.h"
#include "pokemon_icon.h"
#include "pokedex_screen.h"
#include "link.h"
#include "oak_speech.h"
#include "palette.h"
#include "pokeball.h"
#include "overworld.h"
#include "strings.h"
#include "title_screen.h"
#include "pokedex.h"
#include "text_window.h"
#include "text_window_graphics.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "main.h"
#include "naming_screen.h"
#include "string_util.h"


enum menuAction
{
	NEWGAME,
	CONTINUE,
	OPTION,
};

enum MainMenuType
{
    MAIN_MENU_NEWGAME = 0,
    MAIN_MENU_CONTINUE,
};

enum MainMenuWindow
{
    MAIN_MENU_WINDOW_TEXT = 0,
    MAIN_MENU_WINDOW_ERROR,
    MAIN_MENU_WINDOW_COUNT,
};

#define tMenuType  data[0]
#define tCursorPos data[1]

#define tUnused8         data[8]
#define tMGErrorMsgState data[9]
#define tMGErrorType     data[10]

#define FLAG_POKEDEX_GET  0x829
#define FLAG_BADGE_01_GET 0x820
#define FLAG_BADGE_08_GET 0x827

static bool32 MainMenuGpuInit(u8 a0);
static void Task_SetWin0BldRegsAndCheckSaveFile(u8 taskId);
static void PrintSaveErrorStatus(u8 taskId, const u8 *str);
static void Task_SaveErrorStatus_RunPrinterThenWaitButton(u8 taskId);
static void Task_SetWin0BldRegsNoSaveFileCheck(u8 taskId);
static void Task_WaitFadeAndPrintMainMenuText(u8 taskId);
static void Task_PrintMainMenuText(u8 taskId);
static void Task_WaitDma3AndFadeIn(u8 taskId);
static void Task_UpdateVisualSelection(u8 taskId);
static void Task_HandleMenuInput(u8 taskId);
static void PrintMessageOnWindow4(const u8 *str);
static void Task_ExecuteMainMenuSelection(u8 taskId);
static void Task_ReturnToTileScreen(u8 taskId);
static void MoveWindowByMenuTypeAndCursorPos(u8 menuType, u8 cursorPos);
static bool8 HandleMenuInput(u8 taskId);
static void PrintContinueStats(void);
static void PrintPlayerName(void);
static void PrintPlayTime(void);
static void PrintDexCount(void);
static void PrintBadgeCount(void);
static void PrintLocation(void);
static void PrintTeam(void);
static void DestroyAllSprites(void);
static void LoadOverWorld(u8 anim);
static void LoadMonIcon(u8 anim);
static void LoadUserFrameToBg(u8 bgId);
static void SetStdFrame0OnBg(u8 bgId);
static void PrintMainMenuItem(const u8 *string, u8 left, u8 top, u8 text_color);
static void MainMenu_DrawWindow(const struct WindowTemplate * template);
static void MainMenu_EraseWindow(const struct WindowTemplate * template);
static const u8 sTextColor1[] = { 1, 2, 3 };

static const struct WindowTemplate sMainMenuWindowTemplates[] = {
    [MAIN_MENU_WINDOW_TEXT] = {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 30,
        .height = 20,
        .paletteNum = 2,
        .baseBlock = 0
    }, 
    [MAIN_MENU_WINDOW_ERROR] = {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 15,
        .width = 24,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 16
    }, 
    [MAIN_MENU_WINDOW_COUNT] = DUMMY_WIN_TEMPLATE
};

static const struct BgTemplate sMainMenuBGTemplate[] = {
    {
        .bg = 0,		//Text
        .charBaseIndex = 2, //2 * 0x4000 = 0x8000
        .mapBaseIndex = 31,  // 31 * 0x800 = 0xF800
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0,
    }, {
        .bg = 1,		//BG
        .charBaseIndex = 0,
        .mapBaseIndex = 29,  // 29 * 0x800 = 0xE800
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0,
    }, {
        .bg = 2,		//BG
        .charBaseIndex = 1, // 1 * 0x4000 = 0x4000
        .mapBaseIndex = 30,  // 30 * 0x800 = 0xF000
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0,
    }
};

static void CB2_MainMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_MainMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_InitMainMenu(void)
{
    MainMenuGpuInit(FALSE);
}

static void CB2_InitMainMenuFromOptions(void)
{
    MainMenuGpuInit(TRUE);
}

static bool32 MainMenuGpuInit(u8 a0)
{
    u8 taskId;
    SetVBlankCallback(NULL);
	SetHBlankCallback(NULL);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BG2CNT, 0);
    SetGpuReg(REG_OFFSET_BG1CNT, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, -4);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    DmaClearLarge16(3, (void*)(VRAM), VRAM_SIZE, 0x1000);
    DmaClear32(3, OAM, OAM_SIZE);
    DmaClear16(3, PLTT, PLTT_SIZE);
    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetPaletteFade();
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sMainMenuBGTemplate, NELEMS(sMainMenuBGTemplate));
    InitWindows(sMainMenuWindowTemplates);
    DeactivateAllTextPrinters();
	LoadPalette(gPalMainMenuBG, 0, 32);
	LoadPalette(gPalMainMenuNoSel, 16, 96);
	LoadPalette(gPalMainMenuSel, 16, 32);
	LoadPalette(sMainMenuTextPal, 240, 10);
	if (gSaveBlock2Ptr->playerGender != MALE)
    {
		LoadPalette(sMainMenuTextFemalePal, 243, 4);
    }
    SetGpuReg(REG_OFFSET_WIN0H, 0);
    SetGpuReg(REG_OFFSET_WIN0V, 0);
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, 0);
	SetGpuReg(REG_OFFSET_BLDCNT, 0x0);
	SetGpuReg(REG_OFFSET_BLDALPHA, 0x10);
    SetGpuReg(REG_OFFSET_BLDY, 0);
	LZ77UnCompVram(gTilesMainMenuBG1, (void *)VRAM);
	LZ77UnCompVram(gTilesMainMenuBG2, (void *)(VRAM + 0x4000));
	LZ77UnCompVram(gMapMainMenuBG2, (void *)(VRAM + 0xF000));    
    SetMainCallback2(CB2_MainMenu);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    taskId = CreateTask(Task_SetWin0BldRegsAndCheckSaveFile, 0);
    gTasks[taskId].tCursorPos = 0;
    gTasks[taskId].tUnused8 = a0;
    return FALSE;
}

static void Task_SetWin0BldRegsAndCheckSaveFile(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetGpuReg(REG_OFFSET_BLDY, 7);
        switch (gSaveFileStatus)
        {
        case SAVE_STATUS_OK:
            LoadUserFrameToBg(0);
			gTasks[taskId].tMenuType = MAIN_MENU_CONTINUE;
            gTasks[taskId].func = Task_SetWin0BldRegsNoSaveFileCheck;
            break;
        case SAVE_STATUS_INVALID:
            SetStdFrame0OnBg(0);
            gTasks[taskId].tMenuType = MAIN_MENU_NEWGAME;
				    PrintSaveErrorStatus(taskId, gText_SaveFileHasBeenDeleted);
            break;
        case SAVE_STATUS_ERROR:
            SetStdFrame0OnBg(0);
            gTasks[taskId].tMenuType = MAIN_MENU_CONTINUE;
			    	PrintSaveErrorStatus(taskId, gText_SaveFileCorrupted);
          	gTasks[taskId].tMenuType = MAIN_MENU_CONTINUE;
            break;
        case SAVE_STATUS_EMPTY:
        default:
            LoadUserFrameToBg(0);
            gTasks[taskId].tMenuType = MAIN_MENU_NEWGAME;
            gTasks[taskId].func = Task_SetWin0BldRegsNoSaveFileCheck;
            break;
        case SAVE_STATUS_NO_FLASH:
            SetStdFrame0OnBg(0);
            gTasks[taskId].tMenuType = MAIN_MENU_NEWGAME;
          	PrintSaveErrorStatus(taskId, gText_1MSubCircuitBoardNotInstalled);
            break;
        }
    }
}

static void PrintSaveErrorStatus(u8 taskId, const u8 *str)
{
    PrintMessageOnWindow4(str);
    gTasks[taskId].func = Task_SaveErrorStatus_RunPrinterThenWaitButton;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFFFF);
 	  ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    SetVBlankCallback(VBlankCB_MainMenu);
}

static void Task_SaveErrorStatus_RunPrinterThenWaitButton(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        RunTextPrinters();
        if (!IsTextPrinterActive(MAIN_MENU_WINDOW_ERROR) && JOY_NEW(A_BUTTON))
        {
            ClearWindowTilemap(MAIN_MENU_WINDOW_ERROR);
            MainMenu_EraseWindow(&sMainMenuWindowTemplates[MAIN_MENU_WINDOW_ERROR]);
            LoadUserFrameToBg(1);
            if (gTasks[taskId].tMenuType == MAIN_MENU_NEWGAME)
                gTasks[taskId].func = Task_SetWin0BldRegsNoSaveFileCheck;
            else
                gTasks[taskId].func = Task_PrintMainMenuText;
        }
    }
}

static void Task_SetWin0BldRegsNoSaveFileCheck(u8 taskId)
{
    if (!gPaletteFade.active)
    {
		gTasks[taskId].func = Task_WaitFadeAndPrintMainMenuText;
    }
}

static void Task_WaitFadeAndPrintMainMenuText(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        Task_PrintMainMenuText(taskId);
    }
}

static void Task_PrintMainMenuText(u8 taskId)
{
    SetGpuReg(REG_OFFSET_WIN0H, 0);
    SetGpuReg(REG_OFFSET_WIN0V, 0);
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG2);
	SetGpuReg(REG_OFFSET_BLDY, 0);
	FillWindowPixelBuffer(0, 0);
    switch (gTasks[taskId].tMenuType)
    {
    case MAIN_MENU_NEWGAME:
    default:
   		LZ77UnCompVram(gMapMainMenuNewGame, (void *)(VRAM + 0xE800));
	  	PrintMainMenuItem(gText_NewGame, 24, 12, 2);
		PrintMainMenuItem(gText_Options, 24, 36, 2);
      break;
    case MAIN_MENU_CONTINUE:
  		LZ77UnCompVram(gMapMainMenuContinue, (void *)(VRAM + 0xE800));      
		PrintMainMenuItem(gText_Continue, 24, 12, 2);
		PrintMainMenuItem(gText_NewGame, 24, 116, 2);
		PrintMainMenuItem(gText_Options, 24, 140, 2);
  		PrintContinueStats();
      break;
    }
	PutWindowTilemap(0);
	CopyWindowToVram(0, 3);
    gTasks[taskId].func = Task_WaitDma3AndFadeIn;
}

static void Task_WaitDma3AndFadeIn(u8 taskId)
{
    if (WaitDma3Request(-1) != -1)
    {
        gTasks[taskId].func = Task_UpdateVisualSelection;
        if (gTasks[taskId].tUnused8 == TRUE)
			BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
		else
			BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFF7F);
        ShowBg(0);
        ShowBg(1);
        ShowBg(2);
        SetVBlankCallback(VBlankCB_MainMenu);
    }
}

static void Task_UpdateVisualSelection(u8 taskId)
{
    MoveWindowByMenuTypeAndCursorPos(gTasks[taskId].tMenuType, gTasks[taskId].tCursorPos);
    gTasks[taskId].func = Task_HandleMenuInput;
}

static void Task_HandleMenuInput(u8 taskId)
{
    if (!gPaletteFade.active && HandleMenuInput(taskId))
    {
        gTasks[taskId].func = Task_UpdateVisualSelection;
    }
}

static void Task_ExecuteMainMenuSelection(u8 taskId)
{
    u8 menuAction;
    if (!gPaletteFade.active)
    {
        switch (gTasks[taskId].tMenuType)
        {
        default:
        case MAIN_MENU_NEWGAME:
            switch (gTasks[taskId].tCursorPos)
            {
            default:
            case 0:
                menuAction = NEWGAME;
                break;
            case 1:
                menuAction = OPTION;
                break;
            }
            break;
        case MAIN_MENU_CONTINUE:
            switch (gTasks[taskId].tCursorPos)
            {
            default:
            case 0:
                menuAction = CONTINUE;
                break;
            case 1:
                menuAction = NEWGAME;
                break;
            case 2:
                menuAction = OPTION;
                break;
            }
            break;
        }
        switch (menuAction)
        {
        default:
        case NEWGAME:
            gExitStairsMovementDisabled = 0;
            FreeAllWindowBuffers();
            DestroyTask(taskId);
            StartNewGameScene();
            break;
        case CONTINUE:
            gPlttBufferUnfaded[0] = RGB_BLACK;
            gPlttBufferFaded[0] = RGB_BLACK;
            gExitStairsMovementDisabled = 0;
			SetMainCallback2(CB2_ContinueSavedGame);	//Remove Quest Log
			DestroyTask(taskId);						//Remove Quest Log
            break;
		case OPTION:
			gMain.savedCallback = CB2_InitMainMenuFromOptions;
			SetMainCallback2(CB2_OptionsMenuFromStartMenu); //New OptionMenu
			DestroyTask(taskId);
			break;
        }
    }
}

static void Task_ReturnToTileScreen(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitTitleScreen);
        DestroyTask(taskId);
    }
}

static void MoveWindowByMenuTypeAndCursorPos(u8 menuType, u8 cursorPos)
{
    LoadPalette(gPalMainMenuNoSel, 16, 96);
	switch (menuType)
    {
    default:
    case MAIN_MENU_NEWGAME:
        switch (cursorPos)
        {
        case 0:
        default:
            LoadPalette(gPalMainMenuSel, 16, 32);
            break;
        case 1:
            LoadPalette(gPalMainMenuSel, 32, 32);
            break;
        }
        break;
    case MAIN_MENU_CONTINUE:
        switch (cursorPos)
        {
        case 0:
        default:
            LoadPalette(gPalMainMenuSel, 16, 32);
			DestroyAllSprites();
			LoadOverWorld(1);
			LoadMonIcon(1);
            break;
        case 1:
            LoadPalette(gPalMainMenuSel, 32, 32);
			DestroyAllSprites();
			LoadOverWorld(0);
			LoadMonIcon(0);
            break;
       case 2:
            LoadPalette(gPalMainMenuSel, 48, 32);
            break;
        }
        break;
    }
}

static bool8 HandleMenuInput(u8 taskId)
{
	u8 menuItemCount;

	switch (gTasks[taskId].tMenuType)
	{
        case MAIN_MENU_NEWGAME:
        default:
            menuItemCount = 2;
            break;
        case MAIN_MENU_CONTINUE:
            menuItemCount = 3;
		break;
    }

	if (JOY_NEW(A_BUTTON) || JOY_NEW(START_BUTTON))
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gTasks[taskId].func = Task_ExecuteMainMenuSelection;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, 240));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 160));
        gTasks[taskId].func = Task_ReturnToTileScreen;
    }
    else if (JOY_NEW(DPAD_UP) && gTasks[taskId].tCursorPos > 0)
    {
        gTasks[taskId].tCursorPos--;
        return TRUE;
    }
    else if (JOY_NEW(DPAD_DOWN) && gTasks[taskId].tCursorPos < menuItemCount - 1)
    {
        gTasks[taskId].tCursorPos++;
        return TRUE;
    }

    return FALSE;
}

static void PrintMessageOnWindow4(const u8 *str)
{
    FillWindowPixelBuffer(MAIN_MENU_WINDOW_TEXT, PIXEL_FILL(0));
    FillWindowPixelBuffer(MAIN_MENU_WINDOW_ERROR, PIXEL_FILL(1));
    MainMenu_DrawWindow(&sMainMenuWindowTemplates[MAIN_MENU_WINDOW_ERROR]);
    AddTextPrinterParameterized3(MAIN_MENU_WINDOW_ERROR, 2, 0, 2, sTextColor1, 2, str);
    PutWindowTilemap(MAIN_MENU_WINDOW_ERROR);
    CopyWindowToVram(MAIN_MENU_WINDOW_ERROR, COPYWIN_GFX);
}

static void PrintContinueStats(void)
{
    PrintPlayerName();
    PrintDexCount();
    PrintPlayTime();
    PrintBadgeCount();
	PrintLocation();
	PrintTeam();
	LoadOverWorld(1);
	LoadMonIcon(1);
}

static void PrintPlayerName(void)
{
	PrintMainMenuItem(gSaveBlock2Ptr->playerName, 24, 29, 2);
}

static void PrintPlayTime(void)
{
	u8 strbuf[13];
	u8 time[8];
  u8 *timePtr;
  timePtr = ConvertIntToDecimalStringN(time, gSaveBlock2Ptr->playTimeHours, STR_CONV_MODE_LEFT_ALIGN, 3);
  *timePtr++ = CHAR_COLON;
  ConvertIntToDecimalStringN(timePtr, gSaveBlock2Ptr->playTimeMinutes, STR_CONV_MODE_LEADING_ZEROS, 2);
	
	StringCopy(strbuf, gText_Time);
	StringAppend(strbuf, time);
	PrintMainMenuItem(strbuf, 56, 42, 0);
}

static void PrintDexCount(void)
{
	u16 dexcount;
    u8 dexCount[3];
    u8 strbuf[20];
    u8 *ptr;

    if (FlagGet(FLAG_POKEDEX_GET) == TRUE)
    {
		StringCopy(strbuf, gText_Pokedex);
        if (IsNationalPokedexEnabled())
            dexcount = GetNationalPokedexCount(FLAG_GET_CAUGHT);
        else
            dexcount = GetKantoPokedexCount(FLAG_GET_CAUGHT);
		ConvertIntToDecimalStringN(dexCount, dexcount, STR_CONV_MODE_LEFT_ALIGN, 3);
		StringAppend(strbuf, dexCount);
		PrintMainMenuItem(strbuf, 56, 55, 0);
    }
}

static void PrintBadgeCount(void)
{
    u8 badgecount = 0;
	u8 strbuf[20];
	u8 badgeCount[2];
	u16 i;

    for (i = FLAG_BADGE_01_GET; i <= FLAG_BADGE_08_GET; i++)
    {
        if (FlagGet(i))
            badgecount++;
    }
	if (badgecount)
	{
		
		StringCopy(strbuf, gText_Badges);
		ConvertIntToDecimalStringN(badgeCount, badgecount, STR_CONV_MODE_LEADING_ZEROS, 1);
		StringAppend(strbuf, badgeCount);
		PrintMainMenuItem(strbuf, 56, 68, 0);
	}
}

static void PrintLocation(void)
{
	GetMapName(gStringVar4, Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum)->regionMapSectionId, 2);
	PrintMainMenuItem(gStringVar4, 120, 28, 2);
}

static void PrintTeam(void)
{
	PrintMainMenuItem(gText_Team, 24, 56, 0);
	
}

static void DestroyAllSprites(void)
{
	ResetSpriteData();
	FreeSpriteTileRanges();
	FreeAllSpritePalettes();
}

static void LoadOverWorld(u8 anim)
{
    u8 rivalGfxId;
    u8 spriteId;

    rivalGfxId = GetRivalAvatarGraphicsIdByStateIdAndGender(PLAYER_AVATAR_STATE_NORMAL, gSaveBlock2Ptr->playerGender);
    spriteId = CreateObjectGraphicsSprite(rivalGfxId, SpriteCallbackDummy, 40, 60, 0);
    gSprites[spriteId].oam.priority = 0;
	if (anim == 0)
		StartSpriteAnim(&gSprites[spriteId], 0);
	else
		StartSpriteAnim(&gSprites[spriteId], 4);
}

static void LoadMonIcon(u8 anim)
{
	u8 i;
	u8 spriteId;
	u32 personality;
	u16 species;
	
	for (i = 0; i < gPlayerPartyCount; i++)
	{
		LoadMonIconPalettes();
		species = GetMonData(&gPlayerParty[i] , MON_DATA_SPECIES, NULL);
		personality = GetMonData(&gPlayerParty[i] , MON_DATA_PERSONALITY, NULL);
		if (anim == 0)
		{
			spriteId = CreateMonIcon(species, SpriteCallbackDummy, 32 * i + 40, 90, 0, personality, 1);
		}else{
			spriteId = CreateMonIcon(species, SpriteCB_MonIcon, 32 * i + 40, 90, 0, personality, 1);
		}
		StartSpriteAnim(&gSprites[spriteId], 0);
	}
}

static void LoadUserFrameToBg(u8 bgId)
{
    LoadBgTiles(bgId, GetUserWindowGraphics(gSaveBlock2Ptr->optionsWindowFrameType)->tiles, 0x120, 0x1B1);
    LoadPalette(GetUserWindowGraphics(gSaveBlock2Ptr->optionsWindowFrameType)->palette, 0xE0, 0x20);
    MainMenu_EraseWindow(&sMainMenuWindowTemplates[MAIN_MENU_WINDOW_ERROR]);
}

static void SetStdFrame0OnBg(u8 bgId)
{
    LoadStdWindowGfx(MAIN_MENU_WINDOW_ERROR, 0x1B1, 0xE0);
    MainMenu_EraseWindow(&sMainMenuWindowTemplates[MAIN_MENU_WINDOW_ERROR]);
}

static void PrintMainMenuItem(const u8 *string, u8 left, u8 top, u8 text_color)
{
    u8 color[20];

    if (text_color <= 2)
    {
        switch (text_color)
        {
            case 0:
				color[0] = 0;
				color[1] = 6;
				color[2] = 2;
                break;
            case 1:
				color[0] = 0;
				color[1] = 3;
				color[2] = 4;
                break;
            case 2:
				color[0] = 0;
				color[1] = 1;
				color[2] = 6;
                break;
            default:
                break;
        }
    }
	AddTextPrinterParameterized3(0, 1, left, top + 1, color, 0xFF, string);
	CopyWindowToVram(0, 2);
}

static void MainMenu_DrawWindow(const struct WindowTemplate * windowTemplate)
{
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B1, windowTemplate->tilemapLeft - 1, windowTemplate->tilemapTop - 1, 1, 1, 14);
	FillBgTilemapBufferRect(windowTemplate->bg, 0x1B2, windowTemplate->tilemapLeft, windowTemplate->tilemapTop - 1, windowTemplate->width, windowTemplate->height, 14);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B3, windowTemplate->tilemapLeft + windowTemplate->width, windowTemplate->tilemapTop - 1, 1, 1, 14);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B4, windowTemplate->tilemapLeft - 1, windowTemplate->tilemapTop, 1, windowTemplate->height, 14);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B6, windowTemplate->tilemapLeft + windowTemplate->width, windowTemplate->tilemapTop, 1, windowTemplate->height, 14);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B7, windowTemplate->tilemapLeft - 1, windowTemplate->tilemapTop + windowTemplate->height, 1, 1, 14);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B8, windowTemplate->tilemapLeft, windowTemplate->tilemapTop + windowTemplate->height, windowTemplate->width, 1, 14);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B9, windowTemplate->tilemapLeft + windowTemplate->width, windowTemplate->tilemapTop + windowTemplate->height, 1, 1, 14);
    CopyBgTilemapBufferToVram(windowTemplate->bg);
}

static void MainMenu_EraseWindow(const struct WindowTemplate * windowTemplate)
{
    FillBgTilemapBufferRect(
        windowTemplate->bg, 
        0x000, 
        windowTemplate->tilemapLeft - 1, 
        windowTemplate->tilemapTop - 1,  
        windowTemplate->tilemapLeft + 
        windowTemplate->width + 1, 
        windowTemplate->tilemapTop + 
        windowTemplate->height + 1,
        14
    );
    CopyBgTilemapBufferToVram(windowTemplate->bg);
}
