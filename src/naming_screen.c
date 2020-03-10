#include "global.h"
#include "gflib.h"
#include "data.h"
#include "data_8479668.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "graphics.h"
#include "help_system.h"
#include "menu.h"
#include "overworld.h"
#include "naming_screen.h"
#include "new_menu_helpers.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "trig.h"
#include "constants/help_system.h"
#include "constants/flags.h"
#include "constants/songs.h"
#include "constants/event_objects.h"

#define subsprite_table(ptr) {.subsprites = ptr, .subspriteCount = (sizeof ptr) / (sizeof(struct Subsprite))}

#define KBEVENT_NONE 0
#define KBEVENT_PRESSED_A 5
#define KBEVENT_PRESSED_B 6
#define KBEVENT_PRESSED_SELECT 8
#define KBEVENT_PRESSED_START 9

#define KBROW_COUNT 4

enum
{
    KBPAGE_LETTERS_LOWER,
    KBPAGE_LETTERS_UPPER,
    KBPAGE_SYMBOLS,
    KBPAGE_COUNT,
};

enum
{
    MAIN_STATE_BEGIN_FADE_IN,
    MAIN_STATE_WAIT_FADE_IN,
    MAIN_STATE_HANDLE_INPUT,
    MAIN_STATE_MOVE_TO_OK_BUTTON,
    MAIN_STATE_START_PAGE_SWAP,
    MAIN_STATE_WAIT_PAGE_SWAP,
    MAIN_STATE_6,
    MAIN_STATE_UPDATE_SENT_TO_PC_MESSAGE,
    MAIN_STATE_BEGIN_FADE_OUT,
    MAIN_STATE_WAIT_FADE_OUT_AND_EXIT,
};

enum
{
    INPUT_STATE_DISABLED,
    INPUT_STATE_ENABLED,
};

enum
{
    KEY_ROLE_CHAR,
    KEY_ROLE_PAGE,
    KEY_ROLE_BACKSPACE,
    KEY_ROLE_OK,
};

struct NamingScreenTemplate
{
    u8 copyExistingString;
    u8 maxChars;
    u8 iconFunction;
    u8 addGenderIcon;
    u8 initialPage;
    const u8 *title;
};

struct NamingScreenData {
    /*0x0*/    u8 tilemapBuffer1[0x800];
    /*0x800*/  u8 tilemapBuffer2[0x800];
    /*0x800*/  u8 tilemapBuffer3[0x800];
    /*0x1800*/ u8 textBuffer[0x10];
    /*0x1810*/ u8 tileBuffer[0x600];
    /*0x1E10*/ u8 state;
    /*0x1E11*/ u8 windows[5];
    /*0x1E16*/ u16 inputCharBaseXPos;
    /*0x1E18*/ u16 bg1vOffset;
    /*0x1E1A*/ u16 bg2vOffset;
    /*0x1E1C*/ u16 bg1Priority;
    /*0x1E1E*/ u16 bg2Priority;
    /*0x1E20*/ u8 bgToReveal;
    /*0x1E21*/ u8 bgToHide;
    /*0x1E22*/ u8 currentPage;
    /*0x1E23*/ u8 cursorSpriteId;
    /*0x1E24*/ u8 selectBtnFrameSpriteId;
    /*0x1E25*/ u8 keyRepeatStartDelayCopy;
    /*0x1E28*/ const struct NamingScreenTemplate *template;
    /*0x1E2C*/ u8 templateNum;
    /*0x1E30*/ u8 *destBuffer;
    /*0x1E34*/ u16 monSpecies;
    /*0x1E36*/ u16 monGender;
    /*0x1E38*/ u32 monPersonality;
    /*0x1E3C*/ MainCallback returnCallback;
};

EWRAM_DATA struct NamingScreenData * gNamingScreenData = NULL;

void C2_NamingScreen(void);
void NamingScreen_Init(void);
void NamingScreen_InitBGs(void);
void sub_809DD60(void);
void sub_809DD88(u8 taskId);
bool8 MainState_BeginFadeIn(void);
bool8 MainState_WaitFadeIn(void);
bool8 MainState_HandleInput(void);
bool8 MainState_MoveToOKButton(void);
bool8 pokemon_store(void);
bool8 MainState_BeginFadeInOut(void);
bool8 MainState_WaitFadeOutAndExit(void);
void pokemon_transfer_to_pc_with_message(void);
bool8 sub_809E1D4(void);
bool8 MainState_StartPageSwap(void);
bool8 MainState_WaitPageSwap(void);
void StartPageSwapAnim(void);
void Task_HandlePageSwapAnim(u8 taskId);
bool8 IsPageSwapAnimNotInProgress(void);
bool8 PageSwapAnimState_Init(struct Task * task);
bool8 PageSwapAnimState_1(struct Task * task);
bool8 PageSwapAnimState_2(struct Task * task);
bool8 PageSwapAnimState_Done(struct Task * task);
void sub_809E518(u8 a0, u8 a1, u8 a2);
void Task_809E58C(u8 taskId);
u16 sub_809E644(u8 tag);
void sub_809E6B8(u8 a0);
void sub_809E6E0(struct Task * task, u8 a1, u8 a2);
void sub_809E700(struct Sprite * sprite);
void sub_809E7F0(struct Sprite * sprite);
void sub_809E83C(struct Sprite * sprite);
void sub_809E898(void);
void CursorInit(void);
void SetCursorPos(s16 x, s16 y);
void GetCursorPos(s16 *xP, s16 *yP);
void MoveCursorToOKButton();
void sub_809EA0C(u8 a0);
void sub_809EA64(u8 a0);
bool8 IsCursorAnimFinished();
u8 GetCurrentPageColumnCount(void);
void CreatePageSwitcherSprites(void);
void sub_809EC20(void);
bool8 PageSwapSpritesCB_Init(struct Sprite * sprite);
bool8 PageSwapSpritesCB_Idle(struct Sprite * sprite);
bool8 PageSwapSpritesCB_SwapHide(struct Sprite * sprite);
bool8 PageSwapSpritesCB_SwapShow(struct Sprite * sprite);
void sub_809ED88(u8 a0, struct Sprite * spr1, struct Sprite * spr2);
void CreateBackOkSprites(void);
void CreateUnderscoreSprites(void);
void CreateInputTargetIcon(void);
void NamingScreen_NoCreateIcon(void);
void NamingScreen_CreatePlayerIcon(void);
void NamingScreen_CreatePCIcon(void);
void NamingScreen_CreateMonIcon(void);
void NamingScreen_CreateRivalIcon(void);
bool8 HandleKeyboardEvent(void);
bool8 KeyboardKeyHandler_Character(u8);
bool8 KeyboardKeyHandler_Page(u8);
bool8 KeyboardKeyHandler_Backspace(u8);
bool8 KeyboardKeyHandler_OK(u8);
bool8 TriggerKeyboardChange(void);
u8 GetInputEvent(void);
void SetInputState(u8 state);
void Task_HandleInput(u8 taskId);
void InputState_Disabled(struct Task * task);
void InputState_Enabled(struct Task * task);
void HandleDpadMovement(struct Task * task);
void PrintTitle(void);
void AddGenderIconFunc_No(void);
void AddGenderIconFunc_Yes(void);
void DeleteTextCharacter(void);
u8 GetTextCaretPosition(void);
bool8 AppendCharToBuffer_CheckBufferFull(void);
void AddTextCharacter(u8 character);
void CopyStringToDestBuffer(void);
void choose_name_or_words_screen_load_bg_tile_patterns(void);
void sub_809F8C0(void);
void choose_name_or_words_screen_apply_bg_pals(void);
void DecompressToBgTilemapBuffer(u8 bgId, const u32 * tmap);
void PrintBufferCharactersOnScreen(void);
void sub_809F9E8(u8 windowId, u8 kbPage);
void sub_809FA60(void);
void sub_809FAE4(void);
void sub_809FB70(void);
void NamingScreen_TurnOffScreen(void);
void NamingScreen_InitDisplayMode(void);
void VBlankCB_NamingScreen(void);
void ShowAllBgs(void);
bool8 IsLetter(u8 character);

extern const struct SubspriteTable gUnknown_83E2504[];
extern const struct SubspriteTable gUnknown_83E250C[];
extern const struct SubspriteTable gUnknown_83E2524[];
extern const struct SubspriteTable gUnknown_83E252C[];

extern const struct SpriteTemplate gUnknown_83E2574;
extern const struct SpriteTemplate gUnknown_83E258C;
extern const struct SpriteTemplate gUnknown_83E25A4;
extern const struct SpriteTemplate gUnknown_83E25BC;
extern const struct SpriteTemplate gUnknown_83E25D4;
extern const struct SpriteTemplate gUnknown_83E25EC;
extern const struct SpriteTemplate sSpriteTemplate_InputArrow;
extern const struct SpriteTemplate sSpriteTemplate_Underscore;
extern const struct SpriteTemplate gUnknown_83E2634;

extern const u8 *const sNamingScreenKeyboardText[][KBROW_COUNT];

extern const struct SpriteSheet gUnknown_83E267C[];
extern const struct SpritePalette gUnknown_83E26E4[];

const u16 gUnknown_83E1800[] = INCBIN_U16("graphics/interface/naming_screen_83E1800.4bpp");
const u16 gUnknown_83E18C0[] = INCBIN_U16("graphics/interface/naming_screen_83E18C0.4bpp");
const u16 gUnknown_83E1980[] = INCBIN_U16("graphics/interface/naming_screen_83E1980.4bpp");

const u8 *const sTransferredToPCMessages[] = {
    Text_MonSentToBoxInSomeonesPC,
    Text_MonSentToBoxInBillsPC,
    Text_MonSentToBoxSomeonesBoxFull,
    Text_MonSentToBoxBillsBoxFull
};

const struct BgTemplate gUnknown_83E2290[4] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

const struct WindowTemplate gUnknown_83E22A0[6] = {
    {
        .bg = 1,
        .tilemapLeft = 3,
        .tilemapTop = 10,
        .width = 19,
        .height = 8,
        .paletteNum = 10,
        .baseBlock = 0x0030
    }, {
        .bg = 2,
        .tilemapLeft = 3,
        .tilemapTop = 10,
        .width = 19,
        .height = 8,
        .paletteNum = 10,
        .baseBlock = 0x00c8
    }, {
        .bg = 3,
        .tilemapLeft = 8,
        .tilemapTop = 6,
        .width = 14,
        .height = 2,
        .paletteNum = 10,
        .baseBlock = 0x0030
    }, {
        .bg = 3,
        .tilemapLeft = 9,
        .tilemapTop = 4,
        .width = 16,
        .height = 2,
        .paletteNum = 10,
        .baseBlock = 0x004c
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 30,
        .height = 2,
        .paletteNum = 11,
        .baseBlock = 0x006c
    }, DUMMY_WIN_TEMPLATE
};

const u8 gUnknown_83E22D0[][4][8] = {
    [KBPAGE_LETTERS_LOWER] = {
        __("abcdef ."),
        __("ghijkl ,"),
        __("mnopqrs"),
        __("tuvwxyz"),
    },
    [KBPAGE_LETTERS_UPPER] = {
        __("ABCDEF ."),
        __("GHIJKL ,"),
        __("MNOPQRS"),
        __("TUVWXYZ"),
    },
    [KBPAGE_SYMBOLS] = {
        __("01234"),
        __("56789"),
        __("!?♂♀/-"),
        __("…“”‘'"),
    }
};

const u8 gUnknown_83E2330[] = {
    [KBPAGE_LETTERS_LOWER] = 8, // lower
    [KBPAGE_LETTERS_UPPER] = 8, // upper
    [KBPAGE_SYMBOLS]       = 6
};

const u8 gUnknown_83E2333[][8] = {
    [KBPAGE_LETTERS_LOWER] = {
          0,
         12,
         24,
         56,
         68,
         80,
         92,
        123
    },
    [KBPAGE_LETTERS_UPPER] = {
         0,
         12,
         24,
         56,
         68,
         80,
         92,
        123
    },
    [KBPAGE_SYMBOLS] = {
          0,
         22,
         44,
         66,
         88,
        110
    }
};

extern const struct NamingScreenTemplate *const sNamingScreenTemplates[];

void DoNamingScreen(u8 templateNum, u8 *destBuffer, u16 monSpecies, u16 monGender, u32 monPersonality, MainCallback returnCallback)
{
    gNamingScreenData = Alloc(sizeof(struct NamingScreenData));
    if (!gNamingScreenData)
    {
        SetMainCallback2(returnCallback);
    }
    else
    {
        gNamingScreenData->templateNum = templateNum;
        gNamingScreenData->monSpecies = monSpecies;
        gNamingScreenData->monGender = monGender;
        gNamingScreenData->monPersonality = monPersonality;
        gNamingScreenData->destBuffer = destBuffer;
        gNamingScreenData->returnCallback = returnCallback;

        if (templateNum == 0)
            StartTimer1();

        SetMainCallback2(C2_NamingScreen);
    }
}

void C2_NamingScreen(void)
{
    switch (gMain.state)
    {
    case 0:
        NamingScreen_TurnOffScreen();
        NamingScreen_Init();
        gMain.state++;
        break;
    case 1:
        NamingScreen_InitBGs();
        gMain.state++;
        break;
    case 2:
        ResetPaletteFade();
        gMain.state++;
        break;
    case 3:
        ResetSpriteData();
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 4:
        ResetTasks();
        gMain.state++;
        break;
    case 5:
        choose_name_or_words_screen_apply_bg_pals();
        gMain.state++;
        break;
    case 6:
        choose_name_or_words_screen_load_bg_tile_patterns();
        gMain.state++;
        break;
    case 7:
        sub_809E898();
        UpdatePaletteFade();
        ShowAllBgs();
        gMain.state++;
        break;
    default:
        sub_809F8C0();
        sub_809DD60();
        break;
    }
}

void NamingScreen_Init(void)
{
    gNamingScreenData->state = 0;
    gNamingScreenData->bg1vOffset = 0;
    gNamingScreenData->bg2vOffset = 0;
    gNamingScreenData->bg1Priority = BGCNT_PRIORITY(1);
    gNamingScreenData->bg2Priority = BGCNT_PRIORITY(2);
    gNamingScreenData->bgToReveal = 0;
    gNamingScreenData->bgToHide = 1;
    gNamingScreenData->template = sNamingScreenTemplates[gNamingScreenData->templateNum];
    gNamingScreenData->currentPage = gNamingScreenData->template->initialPage;
    gNamingScreenData->inputCharBaseXPos = (240 - gNamingScreenData->template->maxChars * 8) / 2 + 6;
    gNamingScreenData->keyRepeatStartDelayCopy = gKeyRepeatStartDelay;
    memset(gNamingScreenData->textBuffer, 0xFF, sizeof(gNamingScreenData->textBuffer));
    if (gNamingScreenData->template->copyExistingString != 0)
        StringCopy(gNamingScreenData->textBuffer, gNamingScreenData->destBuffer);
    gKeyRepeatStartDelay = 16;
}

void sub_809DB70(void)
{
    u8 i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (gSprites[i].inUse)
            gSprites[i].invisible = FALSE;
    }
    sub_809EA0C(0);
}

void NamingScreen_InitBGs(void)
{
    u8 i;

    DmaClearLarge16(3, (void *)VRAM, VRAM_SIZE, 0x1000);
    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);

    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_83E2290, NELEMS(gUnknown_83E2290));

    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);

    InitStandardTextBoxWindows();
    ResetBg0();

    for (i = 0; i < NELEMS(gUnknown_83E22A0) - 1; i++)
        gNamingScreenData->windows[i] = AddWindow(&gUnknown_83E22A0[i]);

    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0xC, 0x8));

    SetBgTilemapBuffer(1, gNamingScreenData->tilemapBuffer1);
    SetBgTilemapBuffer(2, gNamingScreenData->tilemapBuffer2);
    SetBgTilemapBuffer(3, gNamingScreenData->tilemapBuffer3);

    FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 0x20, 0x20);
    FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 0x20, 0x20);
    FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 0x20, 0x20);
}

void sub_809DD60(void)
{
    CreateTask(sub_809DD88, 2);
    SetMainCallback2(sub_809FB70);
    BackupHelpContext();
    SetHelpContext(HELPCONTEXT_NAMING_SCREEN);
}

void sub_809DD88(u8 taskId)
{
    switch (gNamingScreenData->state)
    {
    case MAIN_STATE_BEGIN_FADE_IN:
        MainState_BeginFadeIn();
        sub_809DB70();
        NamingScreen_InitDisplayMode();
        break;
    case MAIN_STATE_WAIT_FADE_IN:
        MainState_WaitFadeIn();
        break;
    case MAIN_STATE_HANDLE_INPUT:
        MainState_HandleInput();
        break;
    case MAIN_STATE_MOVE_TO_OK_BUTTON:
        MainState_MoveToOKButton();
        break;
    case MAIN_STATE_START_PAGE_SWAP:
        MainState_StartPageSwap();
        break;
    case MAIN_STATE_WAIT_PAGE_SWAP:
        MainState_WaitPageSwap();
        break;
    case MAIN_STATE_6:
        pokemon_store();
        break;
    case MAIN_STATE_UPDATE_SENT_TO_PC_MESSAGE:
        sub_809E1D4();
        break;
    case MAIN_STATE_BEGIN_FADE_OUT:
        MainState_BeginFadeInOut();
        break;
    case MAIN_STATE_WAIT_FADE_OUT_AND_EXIT:
        MainState_WaitFadeOutAndExit();
        break;
    }
}

const u8 sPageOrderLowerFirst[] = {
    KBPAGE_LETTERS_LOWER,
    KBPAGE_SYMBOLS,
    KBPAGE_LETTERS_UPPER
};

const u8 sPageOrderUpperFirst[] = {
    KBPAGE_LETTERS_UPPER,
    KBPAGE_LETTERS_LOWER,
    KBPAGE_SYMBOLS
};

const u8 sPageOrderSymbolsFirst[] = {
    KBPAGE_SYMBOLS,
    KBPAGE_LETTERS_UPPER,
    KBPAGE_LETTERS_LOWER
};

u8 sub_809DE20(u8 a1)
{
    return sPageOrderLowerFirst[a1];
}

u8 sub_809DE30(void)
{
    return sPageOrderUpperFirst[gNamingScreenData->currentPage];
}

u8 sub_809DE50(void)
{
    return sPageOrderSymbolsFirst[gNamingScreenData->currentPage];
}

bool8 MainState_BeginFadeIn(void)
{
    DecompressToBgTilemapBuffer(3, gUnknown_8E982BC);
    gNamingScreenData->currentPage = KBPAGE_LETTERS_UPPER;
    DecompressToBgTilemapBuffer(2, gUnknown_8E98458);
    DecompressToBgTilemapBuffer(1, gUnknown_8E98398);
    sub_809F9E8(gNamingScreenData->windows[1], KBPAGE_LETTERS_LOWER);
    sub_809F9E8(gNamingScreenData->windows[0], KBPAGE_LETTERS_UPPER);
    PrintBufferCharactersOnScreen();
    PrintTitle();
    sub_809FAE4();
    CopyBgTilemapBufferToVram(1);
    CopyBgTilemapBufferToVram(2);
    CopyBgTilemapBufferToVram(3);
    BlendPalettes(-1, 16, RGB_BLACK);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
    gNamingScreenData->state++;
    return FALSE;
}

bool8 MainState_WaitFadeIn(void)
{
    if (!gPaletteFade.active)
    {
        SetInputState(INPUT_STATE_ENABLED);
        sub_809EA64(1);
        gNamingScreenData->state++;
    }
    return FALSE;
}

bool8 MainState_HandleInput(void)
{
    return HandleKeyboardEvent();
}

bool8 MainState_MoveToOKButton(void)
{
    if (IsCursorAnimFinished())
    {
        SetInputState(INPUT_STATE_ENABLED);
        MoveCursorToOKButton();
        gNamingScreenData->state = MAIN_STATE_HANDLE_INPUT;
    }
    return FALSE;
}

bool8 pokemon_store(void)
{
    CopyStringToDestBuffer();
    SetInputState(INPUT_STATE_DISABLED);
    sub_809EA64(0);
    sub_809E518(3, 0, 1);
    if (gNamingScreenData->templateNum == NAMING_SCREEN_CAUGHT_MON &&
        CalculatePlayerPartyCount() >= 6)
    {
        pokemon_transfer_to_pc_with_message();
        gNamingScreenData->state = MAIN_STATE_UPDATE_SENT_TO_PC_MESSAGE;
        return FALSE;
    }
    else
    {
        gNamingScreenData->state = MAIN_STATE_BEGIN_FADE_OUT;
        return TRUE;  //Exit the naming screen
    }
}

bool8 MainState_BeginFadeInOut(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    gNamingScreenData->state++;
    return FALSE;
}

bool8 MainState_WaitFadeOutAndExit(void)
{
    if (!gPaletteFade.active)
    {
        if (gNamingScreenData->templateNum == NAMING_SCREEN_PLAYER)
            SeedRngAndSetTrainerId();
        SetMainCallback2(gNamingScreenData->returnCallback);
        DestroyTask(FindTaskIdByFunc(sub_809DD88));
        FreeAllWindowBuffers();
        FREE_AND_SET_NULL(gNamingScreenData);
        RestoreHelpContext();
    }
    return FALSE;
}

void pokemon_transfer_to_pc_with_message(void)
{
    u8 stringToDisplay = 0;

    if (!IsDestinationBoxFull())
    {
        StringCopy(gStringVar1, GetBoxNamePtr(VarGet(VAR_PC_BOX_TO_SEND_MON)));
        StringCopy(gStringVar2, gNamingScreenData->destBuffer);
    }
    else
    {
        StringCopy(gStringVar1, GetBoxNamePtr(VarGet(VAR_PC_BOX_TO_SEND_MON)));
        StringCopy(gStringVar2, gNamingScreenData->destBuffer);
        StringCopy(gStringVar3, GetBoxNamePtr(GetPCBoxToSendMon()));
        stringToDisplay = 2;
    }

    if (FlagGet(FLAG_SYS_NOT_SOMEONES_PC))
        stringToDisplay++;

    StringExpandPlaceholders(gStringVar4, sTransferredToPCMessages[stringToDisplay]);
    DrawDialogueFrame(0, FALSE);
    gTextFlags.canABSpeedUpPrint = TRUE;
    AddTextPrinterParameterized2(0, 2, gStringVar4, GetTextSpeedSetting(), NULL, TEXT_COLOR_DARK_GREY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GREY);
    CopyWindowToVram(0, 3);
}

bool8 sub_809E1D4(void)
{
    RunTextPrinters();

    if (!IsTextPrinterActive(0) && (JOY_NEW(A_BUTTON)))
        gNamingScreenData->state = MAIN_STATE_BEGIN_FADE_OUT;

    return FALSE;
}

bool8 MainState_StartPageSwap(void)
{
    SetInputState(INPUT_STATE_DISABLED);
    sub_809EC20();
    StartPageSwapAnim();
    sub_809EA0C(1);
    sub_809E518(0, 0, 1);
    PlaySE(SE_WIN_OPEN);
    gNamingScreenData->state = MAIN_STATE_WAIT_PAGE_SWAP;
    return FALSE;
}

bool8 MainState_WaitPageSwap(void)
{
    s16 cursorX;
    s16 cursorY;
    bool32 var3;

    if (IsPageSwapAnimNotInProgress())
    {

        GetCursorPos(&cursorX, &cursorY);
        var3 = (cursorX == GetCurrentPageColumnCount());

        gNamingScreenData->state = MAIN_STATE_HANDLE_INPUT;
        gNamingScreenData->currentPage++;
        gNamingScreenData->currentPage %= 3;

        if (var3)
        {
            cursorX = GetCurrentPageColumnCount();
        }
        else
        {
            if (cursorX >= GetCurrentPageColumnCount())
                cursorX = GetCurrentPageColumnCount() - 1;
        }

        SetCursorPos(cursorX, cursorY);
        sub_809FA60();
        SetInputState(INPUT_STATE_ENABLED);
        sub_809EA0C(0);
    }
    return FALSE;
}

//--------------------------------------------------
// Page Swap
//--------------------------------------------------

#define tState data[0]
#define tFrameCount data[1]

bool8 (*const sPageSwapAnimStateFuncs[])(struct Task * task) = {
    PageSwapAnimState_Init,
    PageSwapAnimState_1,
    PageSwapAnimState_2,
    PageSwapAnimState_Done
};

void StartPageSwapAnim(void)
{
    u8 taskId;

    taskId = CreateTask(Task_HandlePageSwapAnim, 0);
    Task_HandlePageSwapAnim(taskId);
}

void Task_HandlePageSwapAnim(u8 taskId)
{
    while (sPageSwapAnimStateFuncs[gTasks[taskId].tState](&gTasks[taskId]))
        ;
}

bool8 IsPageSwapAnimNotInProgress(void)
{
    if (FindTaskIdByFunc(Task_HandlePageSwapAnim) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

bool8 PageSwapAnimState_Init(struct Task *task)
{
    gNamingScreenData->bg1vOffset = 0;
    gNamingScreenData->bg2vOffset = 0;
    task->tState++;
    return 0;
}

bool8 PageSwapAnimState_1(struct Task *task)
{
    u16 *const arr[] =
        {
            &gNamingScreenData->bg2vOffset,
            &gNamingScreenData->bg1vOffset
        };

    task->tFrameCount += 4;
    *arr[gNamingScreenData->bgToReveal] = Sin(task->tFrameCount, 40);
    *arr[gNamingScreenData->bgToHide] = Sin((task->tFrameCount + 128) & 0xFF, 40);
    if (task->tFrameCount >= 64)
    {
        u8 temp = gNamingScreenData->bg1Priority;  //Why u8 and not u16?

        gNamingScreenData->bg1Priority = gNamingScreenData->bg2Priority;
        gNamingScreenData->bg2Priority = temp;
        task->tState++;
    }
    return 0;
}

bool8 PageSwapAnimState_2(struct Task *task)
{
    u16 *const arr[] =
        {
            &gNamingScreenData->bg2vOffset,
            &gNamingScreenData->bg1vOffset
        };

    task->tFrameCount += 4;
    *arr[gNamingScreenData->bgToReveal] = Sin(task->tFrameCount, 40);
    *arr[gNamingScreenData->bgToHide] = Sin((task->tFrameCount + 128) & 0xFF, 40);
    if (task->tFrameCount >= 128)
    {
        u8 temp = gNamingScreenData->bgToReveal;

        gNamingScreenData->bgToReveal = gNamingScreenData->bgToHide;
        gNamingScreenData->bgToHide = temp;
        task->tState++;
    }
    return 0;
}

bool8 PageSwapAnimState_Done(struct Task *task)
{
    DestroyTask(FindTaskIdByFunc(Task_HandlePageSwapAnim));
    return 0;
}

#undef tState
#undef tFrameCount

//--------------------------------------------------
// Cursor blink
//--------------------------------------------------

#define tIdent data[0]

void sub_809E4F0(void)
{
    u8 taskId;

    taskId = CreateTask(Task_809E58C, 3);
    gTasks[taskId].data[0] = 3;
}

void sub_809E518(u8 a, u8 b, u8 c)
{
    struct Task *task = &gTasks[FindTaskIdByFunc(Task_809E58C)];

    if (a == task->data[0] && c == 0)
    {
        task->data[1] = b;
        task->data[2] = 1;
        return;
    }
    if (a == 3 && task->data[1] == 0 && c == 0)
        return;
    if (task->data[0] != 3)
        sub_809E6B8(task->data[0]);
    sub_809E6E0(task, a, b);
}

void Task_809E58C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (task->data[0] == 3 || task->data[2] == 0)
        return;
    MultiplyInvertedPaletteRGBComponents(sub_809E644(task->data[0]), task->data[3], task->data[3], task->data[3]);
    if (task->data[5] != 0)
    {
        task->data[5]--;
        if (task->data[5] != 0)
            return;
    }
    task->data[5] = 2;
    if (task->data[4] >= 0)
    {
        if (task->data[3] < 14)
        {
            task->data[3] += task->data[4];
            task->data[6] += task->data[4];
        }
        else
        {
            task->data[3] = 16;
            task->data[6]++;
        }
    }
    else
    {
        task->data[3] += task->data[4];
        task->data[6] += task->data[4];
    }

    if (task->data[3] == 16 && task->data[6] == 22)
    {
        task->data[4] = -4;
    }
    else if (task->data[3] == 0)
    {
        task->data[2] = task->data[1];
        task->data[4] = 2;
        task->data[6] = 0;
    }
}

u16 sub_809E644(u8 a)
{
    const u16 arr[] =
    {
        IndexOfSpritePaletteTag(4) * 16 + 0x10E, // Swap
        IndexOfSpritePaletteTag(6) * 16 + 0x10E, // BACK
        IndexOfSpritePaletteTag(7) * 16 + 0x10E, // OK
        IndexOfSpritePaletteTag(7) * 16 + 0x101, // kbd
    };

    return arr[a];
}

void sub_809E6B8(u8 a)
{
    u16 index = sub_809E644(a);

    gPlttBufferFaded[index] = gPlttBufferUnfaded[index];
}

void sub_809E6E0(struct Task *task, u8 b, u8 c)
{
    task->data[0] = b;
    task->data[1] = c;
    task->data[2] = 1;
    task->data[3] = 4;
    task->data[4] = 2;
    task->data[5] = 0;
    task->data[6] = 4;
}

//--------------------------------------------------
// Cursor
//--------------------------------------------------

void sub_809E700(struct Sprite *sprite)
{
    if (sprite->animEnded)
        StartSpriteAnim(sprite, 0);
    sprite->invisible = (sprite->data[4] & 0xFF);
    if (sprite->data[0] == GetCurrentPageColumnCount())
        sprite->invisible = TRUE;
    if (sprite->invisible || (sprite->data[4] & 0xFF00) == 0
        || sprite->data[0] != sprite->data[2] || sprite->data[1] != sprite->data[3])
    {
        sprite->data[5] = 0;
        sprite->data[6] = 2;
        sprite->data[7] = 2;
    }
    sprite->data[7]--;
    if (sprite->data[7] == 0)
    {
        sprite->data[5] += sprite->data[6];
        if (sprite->data[5] == 16 || sprite->data[5] == 0)
            sprite->data[6] = -sprite->data[6];
        sprite->data[7] = 2;
    }
    if ((sprite->data[4] & 0xFF00) != 0)
    {
        s8 gb = sprite->data[5];
        s8 r = sprite->data[5] >> 1;
        u16 index = IndexOfSpritePaletteTag(5) * 16 + 0x0101;

        MultiplyInvertedPaletteRGBComponents(index, r, gb, gb);
    }
}

void sub_809E7F0(struct Sprite *sprite)
{
    const s16 arr[] = {0, -4, -2, -1};

    if (sprite->data[0] == 0 || --sprite->data[0] == 0)
    {
        sprite->data[0] = 8;
        sprite->data[1] = (sprite->data[1] + 1) & 3;
    }
    sprite->pos2.x = arr[sprite->data[1]];
}

void sub_809E83C(struct Sprite *sprite)
{
    const s16 arr[] = {2, 3, 2, 1};
    u8 var;

    var = GetTextCaretPosition();
    if (var != (u8)sprite->data[0])
    {
        sprite->pos2.y = 0;
        sprite->data[1] = 0;
        sprite->data[2] = 0;
    }
    else
    {
        sprite->pos2.y = arr[sprite->data[1]];
        sprite->data[2]++;
        if (sprite->data[2] > 8)
        {
            sprite->data[1] = (sprite->data[1] + 1) & 3;
            sprite->data[2] = 0;
        }
    }
}

void sub_809E898(void)
{
    CursorInit();
    CreatePageSwitcherSprites();
    CreateBackOkSprites();
    CreateUnderscoreSprites();
    CreateInputTargetIcon();
}

void CursorInit(void)
{
    gNamingScreenData->cursorSpriteId = CreateSprite(&gUnknown_83E25EC, 38, 88, 1);
    sub_809EA0C(1);
    gSprites[gNamingScreenData->cursorSpriteId].oam.priority = 1;
    gSprites[gNamingScreenData->cursorSpriteId].oam.objMode = ST_OAM_OBJ_BLEND;
    gSprites[gNamingScreenData->cursorSpriteId].data[6] = 1;
    gSprites[gNamingScreenData->cursorSpriteId].data[6] = 2;
    SetCursorPos(0, 0);
}

void SetCursorPos(s16 x, s16 y)
{
    struct Sprite *cursorSprite = &gSprites[gNamingScreenData->cursorSpriteId];

    if (x < gUnknown_83E2330[sub_809DE50()])
        cursorSprite->pos1.x = gUnknown_83E2333[sub_809DE50()][x] + 38;
    else
        cursorSprite->pos1.x = 0;

    cursorSprite->pos1.y = y * 16 + 88;
    cursorSprite->data[2] = cursorSprite->data[0];
    cursorSprite->data[3] = cursorSprite->data[1];
    cursorSprite->data[0] = x;
    cursorSprite->data[1] = y;
}

void GetCursorPos(s16 *x, s16 *y)
{
    struct Sprite *cursorSprite = &gSprites[gNamingScreenData->cursorSpriteId];

    *x = cursorSprite->data[0];
    *y = cursorSprite->data[1];
}

void MoveCursorToOKButton(void)
{
    SetCursorPos(GetCurrentPageColumnCount(), 2);
}

void sub_809EA0C(u8 a)
{
    gSprites[gNamingScreenData->cursorSpriteId].data[4] &= ~0xFF;
    gSprites[gNamingScreenData->cursorSpriteId].data[4] |= a;
    StartSpriteAnim(&gSprites[gNamingScreenData->cursorSpriteId], 0);
}

void sub_809EA64(u8 a)
{
    gSprites[gNamingScreenData->cursorSpriteId].data[4] &= 0xFF;
    gSprites[gNamingScreenData->cursorSpriteId].data[4] |= a << 8;
}

void sub_809EAA8(void)
{
    StartSpriteAnim(&gSprites[gNamingScreenData->cursorSpriteId], 1);
}

bool8 IsCursorAnimFinished(void)
{
    return gSprites[gNamingScreenData->cursorSpriteId].animEnded;
}

const u8 sKeyRoles[] = {KEY_ROLE_PAGE, KEY_ROLE_BACKSPACE, KEY_ROLE_OK};

u8 GetKeyRoleAtCursorPos(void)
{
    s16 cursorX;
    s16 cursorY;

    GetCursorPos(&cursorX, &cursorY);
    if (cursorX < GetCurrentPageColumnCount())
        return KEY_ROLE_CHAR;
    else
        return sKeyRoles[cursorY];
}

u8 GetCurrentPageColumnCount(void)
{
    return gUnknown_83E2330[sub_809DE50()];
}

void CreatePageSwitcherSprites(void)
{
    u8 spriteId1;
    u8 spriteId2;
    u8 spriteId3;

    spriteId1 = CreateSprite(&gUnknown_83E2574, 0xCC, 0x58, 0);
    gNamingScreenData->selectBtnFrameSpriteId = spriteId1;
    SetSubspriteTables(&gSprites[spriteId1], gUnknown_83E2504);
    gSprites[spriteId1].invisible = TRUE;

    spriteId2 = CreateSprite(&gUnknown_83E25A4, 0xCC, 0x54, 1);
    gSprites[spriteId1].data[6] = spriteId2;
    SetSubspriteTables(&gSprites[spriteId2], gUnknown_83E250C);
    gSprites[spriteId2].invisible = TRUE;

    spriteId3 = CreateSprite(&gUnknown_83E258C, 0xCC, 0x53, 2);
    gSprites[spriteId3].oam.priority = 1;
    gSprites[spriteId1].data[7] = spriteId3;
    gSprites[spriteId3].invisible = TRUE;
}

void sub_809EC20(void)
{
    struct Sprite *sprite = &gSprites[gNamingScreenData->selectBtnFrameSpriteId];

    sprite->data[0] = 2;
    sprite->data[1] = gNamingScreenData->currentPage;
}

bool8 (*const sPageSwapSpritesCBs[])(struct Sprite * sprite) = {
    PageSwapSpritesCB_Init,
    PageSwapSpritesCB_Idle,
    PageSwapSpritesCB_SwapHide,
    PageSwapSpritesCB_SwapShow
};

void SpriteCB_PageSwap(struct Sprite *sprite)
{
    while (sPageSwapSpritesCBs[sprite->data[0]](sprite))
        ;
}

bool8 PageSwapSpritesCB_Init(struct Sprite *sprite)
{
    struct Sprite *sprite1 = &gSprites[sprite->data[6]];
    struct Sprite *sprite2 = &gSprites[sprite->data[7]];

    sub_809ED88(sub_809DE20(gNamingScreenData->currentPage), sprite1, sprite2);
    sprite->data[0]++;
    return FALSE;
}

bool8 PageSwapSpritesCB_Idle(struct Sprite *sprite)
{
    struct Sprite *sprite1 = &gSprites[sprite->data[6]];
    struct Sprite *sprite2 = &gSprites[sprite->data[7]];

    return FALSE;
}

bool8 PageSwapSpritesCB_SwapHide(struct Sprite *sprite)
{
    struct Sprite *sprite1 = &gSprites[sprite->data[6]];
    struct Sprite *sprite2 = &gSprites[sprite->data[7]];
    u8 page;

    sprite1->pos2.y++;
    if (sprite1->pos2.y > 7)
    {
        sprite->data[0]++;
        sprite1->pos2.y = -4;
        sprite1->invisible = TRUE;
        page = sprite->data[1];
        sub_809ED88(sub_809DE20((page + 1) % 3), sprite1, sprite2);
    }
    return FALSE;
}

bool8 PageSwapSpritesCB_SwapShow(struct Sprite *sprite)
{
    struct Sprite *sprite1 = &gSprites[sprite->data[6]];
    struct Sprite *sprite2 = &gSprites[sprite->data[7]];

    sprite1->invisible = FALSE;
    sprite1->pos2.y++;
    if (sprite1->pos2.y >= 0)
    {
        sprite1->pos2.y = 0;
        sprite->data[0] = 1;
    }
    return FALSE;
}

const u16 gUnknown_83E2388[] = {1, 3, 2};
const u16 gUnknown_83E238E[] = {4, 6, 5};

void sub_809ED88(u8 page, struct Sprite * sprite1, struct Sprite * sprite2)
{
    sprite2->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_83E2388[page]);
    sprite1->sheetTileStart = GetSpriteTileStartByTag(gUnknown_83E238E[page]);
    sprite1->subspriteTableNum = page;
}

//

void CreateBackOkSprites(void)
{
    u8 spriteId;

    spriteId = CreateSprite(&gUnknown_83E25BC, 0xCC, 0x74, 0);
    SetSubspriteTables(&gSprites[spriteId], gUnknown_83E2524);
    gSprites[spriteId].invisible = TRUE;

    spriteId = CreateSprite(&gUnknown_83E25D4, 0xCC, 0x8C, 0);
    SetSubspriteTables(&gSprites[spriteId], gUnknown_83E2524);
    gSprites[spriteId].invisible = TRUE;
}

void CreateUnderscoreSprites(void)
{
    u8 spriteId;
    s16 xPos;
    u8 i;

    xPos = gNamingScreenData->inputCharBaseXPos - 5;
    spriteId = CreateSprite(&sSpriteTemplate_InputArrow, xPos, 0x38, 0);
    gSprites[spriteId].oam.priority = 3;
    gSprites[spriteId].invisible = TRUE;
    xPos = gNamingScreenData->inputCharBaseXPos;
    for (i = 0; i < gNamingScreenData->template->maxChars; i++, xPos += 8)
    {
        spriteId = CreateSprite(&sSpriteTemplate_Underscore, xPos + 3, 0x3C, 0);
        gSprites[spriteId].oam.priority = 3;
        gSprites[spriteId].data[0] = i;
        gSprites[spriteId].invisible = TRUE;
    }
}

//--------------------------------------------------
// Icon creation (the thing you're naming or giving input to)
//--------------------------------------------------

void (*const sIconFunctions[])(void) = {
    NamingScreen_NoCreateIcon,
    NamingScreen_CreatePlayerIcon,
    NamingScreen_CreatePCIcon,
    NamingScreen_CreateMonIcon,
    NamingScreen_CreateRivalIcon
};

void CreateInputTargetIcon(void)
{
    sIconFunctions[gNamingScreenData->template->iconFunction]();
}

void NamingScreen_NoCreateIcon(void)
{

}

void NamingScreen_CreatePlayerIcon(void)
{
    u8 rivalGfxId;
    u8 spriteId;

    rivalGfxId = sub_805C7C8(0, gNamingScreenData->monSpecies);
    spriteId = AddPseudoObjectEvent(rivalGfxId, SpriteCallbackDummy, 0x38, 0x25, 0);
    gSprites[spriteId].oam.priority = 3;
    StartSpriteAnim(&gSprites[spriteId], 4);
}

void NamingScreen_CreatePCIcon(void)
{
    u8 spriteId;

    spriteId = CreateSprite(&gUnknown_83E2634, 0x38, 0x29, 0);
    SetSubspriteTables(&gSprites[spriteId], gUnknown_83E252C);
    gSprites[spriteId].oam.priority = 3;
}

void NamingScreen_CreateMonIcon(void)
{
    u8 spriteId;

    LoadMonIconPalettes();
    spriteId = CreateMonIcon(gNamingScreenData->monSpecies, SpriteCallbackDummy, 0x38, 0x28, 0, gNamingScreenData->monPersonality, 1);
    gSprites[spriteId].oam.priority = 3;
}

const union AnimCmd gUnknown_83E23A8[] = {
    ANIMCMD_FRAME( 0, 10),
    ANIMCMD_FRAME(24, 10),
    ANIMCMD_FRAME( 0, 10),
    ANIMCMD_FRAME(32, 10),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gUnknown_83E23BC[] = {
    gUnknown_83E23A8
};

void NamingScreen_CreateRivalIcon(void)
{
    const struct SpriteSheet sheet = {
        gUnknown_83E1980, 0x900, 255
    };
    const struct SpritePalette palette = {
        gUnknown_8E98004, 255
    };
    struct SpriteTemplate template;
    const struct SubspriteTable * tables_p;
    u8 spriteId;

    MakeObjectTemplateFromObjectEventGraphicsInfo(OBJ_EVENT_GFX_RED_NORMAL, SpriteCallbackDummy, &template, &tables_p);

    template.tileTag = sheet.tag;
    template.paletteTag = palette.tag;
    template.anims = gUnknown_83E23BC;
    LoadSpriteSheet(&sheet);
    LoadSpritePalette(&palette);
    spriteId = CreateSprite(&template, 0x38, 0x25, 0);
    gSprites[spriteId].oam.priority = 3;
}

bool8 (*const sKeyboardKeyHandlers[])(u8) = {
    KeyboardKeyHandler_Character,
    KeyboardKeyHandler_Page,
    KeyboardKeyHandler_Backspace,
    KeyboardKeyHandler_OK,
};

bool8 HandleKeyboardEvent(void)
{
    u8 event = GetInputEvent();
    u8 keyRole = GetKeyRoleAtCursorPos();

    if (event == KBEVENT_PRESSED_SELECT)
    {
        return TriggerKeyboardChange();
    }
    else if (event == KBEVENT_PRESSED_B)
    {
        DeleteTextCharacter();
        return FALSE;
    }
    else if (event == KBEVENT_PRESSED_START)
    {
        MoveCursorToOKButton();
        return FALSE;
    }
    else
    {
        return sKeyboardKeyHandlers[keyRole](event);
    }
}

bool8 KeyboardKeyHandler_Character(u8 event)
{
    sub_809E518(3, 0, 0);
    if (event == KBEVENT_PRESSED_A)
    {
        bool8 var = AppendCharToBuffer_CheckBufferFull();

        sub_809EAA8();
        if (var)
        {
            SetInputState(INPUT_STATE_DISABLED);
            gNamingScreenData->state = MAIN_STATE_MOVE_TO_OK_BUTTON;
        }
    }
    return FALSE;
}

bool8 KeyboardKeyHandler_Page(u8 event)
{
    sub_809E518(0, 1, 0);
    if (event == KBEVENT_PRESSED_A)
        return TriggerKeyboardChange();
    else
        return FALSE;
}

bool8 KeyboardKeyHandler_Backspace(u8 event)
{
    sub_809E518(1, 1, 0);
    if (event == KBEVENT_PRESSED_A)
        DeleteTextCharacter();
    return FALSE;
}

bool8 KeyboardKeyHandler_OK(u8 event)
{
    sub_809E518(2, 1, 0);
    if (event == KBEVENT_PRESSED_A)
    {
        PlaySE(SE_SELECT);
        gNamingScreenData->state = MAIN_STATE_6;
        return TRUE;
    }
    else
        return FALSE;
}

bool8 TriggerKeyboardChange(void)
{
    gNamingScreenData->state = MAIN_STATE_START_PAGE_SWAP;
    return TRUE;
}

//--------------------------------------------------
// Input handling
//--------------------------------------------------

enum
{
    FNKEY_CASE,
    FNKEY_BACK,
    FNKEY_OK,
};

#define tState data[0]
#define tKeyboardEvent data[1]
#define tKbFunctionKey data[2]

void (*const sInputStateFuncs[])(struct Task *) = {
    InputState_Disabled,
    InputState_Enabled
};

void InputInit(void)
{
    CreateTask(Task_HandleInput, 1);
}

u8 GetInputEvent(void)
{
    u8 taskId = FindTaskIdByFunc(Task_HandleInput);

    return gTasks[taskId].tKeyboardEvent;
}

void SetInputState(u8 state)
{
    u8 taskId = FindTaskIdByFunc(Task_HandleInput);

    gTasks[taskId].tState = state;
}

void Task_HandleInput(u8 taskId)
{
    sInputStateFuncs[gTasks[taskId].tState](&gTasks[taskId]);
}

void InputState_Disabled(struct Task *task)
{
    task->tKeyboardEvent = 0;
}

void InputState_Enabled(struct Task *task)
{
    task->tKeyboardEvent = 0;

    if (gMain.newKeys & A_BUTTON)
        task->tKeyboardEvent = KBEVENT_PRESSED_A;
    else if (gMain.newKeys & B_BUTTON)
        task->tKeyboardEvent = KBEVENT_PRESSED_B;
    else if (gMain.newKeys & SELECT_BUTTON)
        task->tKeyboardEvent = KBEVENT_PRESSED_SELECT;
    else if (gMain.newKeys & START_BUTTON)
        task->tKeyboardEvent = KBEVENT_PRESSED_START;
    else
        HandleDpadMovement(task);
}

void HandleDpadMovement(struct Task *task)
{
    const s16 sDpadDeltaX[] = {
         0,   //none
         0,   //up
         0,   //down
        -1,   //left
         1    //right
    };

    const s16 sDpadDeltaY[] = {
         0,   //none
        -1,   //up
         1,   //down
         0,   //left
         0    //right
    };

    const s16 s4RowTo3RowTableY[] = {0, 1, 1, 2};
    const s16 s3RowTo4RowTableY[] = {0, 0, 3};

    s16 cursorX;
    s16 cursorY;
    u16 dpadDir;
    s16 prevCursorX;

    GetCursorPos(&cursorX, &cursorY);
    dpadDir = 0;
    if (gMain.newAndRepeatedKeys & DPAD_UP)
        dpadDir = 1;
    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        dpadDir = 2;
    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
        dpadDir = 3;
    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
        dpadDir = 4;

    //Get new cursor position
    prevCursorX = cursorX;
    cursorX += sDpadDeltaX[dpadDir];
    cursorY += sDpadDeltaY[dpadDir];

    //Wrap cursor position in the X direction
    if (cursorX < 0)
        cursorX = GetCurrentPageColumnCount();
    if (cursorX > GetCurrentPageColumnCount())
        cursorX = 0;

    //Handle cursor movement in X direction
    if (sDpadDeltaX[dpadDir] != 0)
    {
        if (cursorX == GetCurrentPageColumnCount())
        {
            //We are now on the last column
            task->tKbFunctionKey = cursorY;
            cursorY = s4RowTo3RowTableY[cursorY];
        }
        else if (prevCursorX == GetCurrentPageColumnCount())
        {
            if (cursorY == 1)
                cursorY = task->tKbFunctionKey;
            else
                cursorY = s3RowTo4RowTableY[cursorY];
        }
    }

    if (cursorX == GetCurrentPageColumnCount())
    {
        //There are only 3 keys on the last column, unlike the others,
        //so wrap Y accordingly
        if (cursorY < 0)
            cursorY = 2;
        if (cursorY > 2)
            cursorY = 0;
        if (cursorY == 0)
            task->tKbFunctionKey = FNKEY_BACK;
        else if (cursorY == 2)
            task->tKbFunctionKey = FNKEY_OK;
    }
    else
    {
        if (cursorY < 0)
            cursorY = 3;
        if (cursorY > 3)
            cursorY = 0;
    }
    SetCursorPos(cursorX, cursorY);
}

#undef tState
#undef tKeyboardEvent
#undef tKbFunctionKey

void PrintTitleFunction_NoMon(void)
{
    FillWindowPixelBuffer(gNamingScreenData->windows[3], PIXEL_FILL(1));
    AddTextPrinterParameterized(gNamingScreenData->windows[3], 1, gNamingScreenData->template->title, 1, 1, 0, NULL);
    PutWindowTilemap(gNamingScreenData->windows[3]);
}

void PrintTitleFunction_WithMon(void)
{
    u8 buffer[0x20];

    StringCopy(buffer, gSpeciesNames[gNamingScreenData->monSpecies]);
    StringAppendN(buffer, gNamingScreenData->template->title, 15);
    FillWindowPixelBuffer(gNamingScreenData->windows[3], PIXEL_FILL(1));
    AddTextPrinterParameterized(gNamingScreenData->windows[3], 1, buffer, 1, 1, 0, NULL);
    PutWindowTilemap(gNamingScreenData->windows[3]);
}

void (*const sPrintTitleFuncs[])(void) = {
    [NAMING_SCREEN_PLAYER]     = PrintTitleFunction_NoMon,
    [NAMING_SCREEN_BOX]        = PrintTitleFunction_NoMon,
    [NAMING_SCREEN_CAUGHT_MON] = PrintTitleFunction_WithMon,
    [NAMING_SCREEN_NAME_RATER] = PrintTitleFunction_WithMon,
    [NAMING_SCREEN_RIVAL]      = PrintTitleFunction_NoMon
};

void PrintTitle(void)
{
    sPrintTitleFuncs[gNamingScreenData->templateNum]();
}

void (*const sAddGenderIconFuncs[])(void) = {
    AddGenderIconFunc_No,
    AddGenderIconFunc_Yes
};

void CallAddGenderIconFunc(void)
{
    sAddGenderIconFuncs[gNamingScreenData->template->addGenderIcon]();
}

void AddGenderIconFunc_No(void)
{

}

const u8 sGenderColors[2][3] = {
    {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_BLUE, TEXT_COLOR_BLUE},
    {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_RED, TEXT_COLOR_RED}
};

void AddGenderIconFunc_Yes(void)
{
    u8 genderSymbol[2];
    bool8 isFemale = FALSE;

    StringCopy(genderSymbol, gText_MaleSymbol);

    if (gNamingScreenData->monGender != MON_GENDERLESS)
    {
        if (gNamingScreenData->monGender == MON_FEMALE)
        {
            StringCopy(genderSymbol, gText_FemaleSymbol);
            isFemale = TRUE;
        }
        AddTextPrinterParameterized3(gNamingScreenData->windows[2], 2, 0x68, 1, sGenderColors[isFemale], TEXT_SPEED_FF, genderSymbol);
    }
}

u8 GetCharAtKeyboardPos(s16 x, s16 y)
{
    return gUnknown_83E22D0[sub_809DE50()][y][x];
}

u8 GetTextCaretPosition(void)
{
    u8 i;

    for (i = 0; i < gNamingScreenData->template->maxChars; i++)
    {
        if (gNamingScreenData->textBuffer[i] == EOS)
            return i;
    }
    return gNamingScreenData->template->maxChars - 1;
}

u8 GetPreviousTextCaretPosition(void)
{
    s8 i;

    for (i = gNamingScreenData->template->maxChars - 1; i > 0; i--)
    {
        if (gNamingScreenData->textBuffer[i] != EOS)
            return i;
    }
    return 0;
}

void DeleteTextCharacter(void)
{
    u8 index;
    u8 var2;

    index = GetPreviousTextCaretPosition();
    // Temporarily make this a space for redrawing purposes
    gNamingScreenData->textBuffer[index] = CHAR_SPACE;
    PrintBufferCharactersOnScreen();
    CopyBgTilemapBufferToVram(3);
    gNamingScreenData->textBuffer[index] = EOS;
    var2 = GetKeyRoleAtCursorPos();
    if (var2 == KEY_ROLE_CHAR || var2 == KEY_ROLE_BACKSPACE)
        sub_809E518(1, 0, 1);
    PlaySE(SE_BOWA);
}

bool8 AppendCharToBuffer_CheckBufferFull(void)
{
    s16 x;
    s16 y;

    GetCursorPos(&x, &y);
    AddTextCharacter(GetCharAtKeyboardPos(x, y));
    PrintBufferCharactersOnScreen();
    CopyBgTilemapBufferToVram(3);
    PlaySE(SE_SELECT);

    if (GetPreviousTextCaretPosition() != gNamingScreenData->template->maxChars - 1)
        return FALSE;
    else
        return TRUE;
}

void AddTextCharacter(u8 ch)
{
    u8 index = GetTextCaretPosition();

    gNamingScreenData->textBuffer[index] = ch;
}

void CopyStringToDestBuffer(void)
{
    // Copy from the first non-whitespace character
    u8 i;

    for (i = 0; i < gNamingScreenData->template->maxChars; i++)
    {
        if (gNamingScreenData->textBuffer[i] != CHAR_SPACE && gNamingScreenData->textBuffer[i] != EOS)
        {
            StringCopyN(gNamingScreenData->destBuffer, gNamingScreenData->textBuffer, gNamingScreenData->template->maxChars + 1);
            break;
        }
    }
}

void choose_name_or_words_screen_load_bg_tile_patterns(void)
{
    LZ77UnCompWram(gNamingScreenMenu_Gfx, gNamingScreenData->tileBuffer);
    LoadBgTiles(1, gNamingScreenData->tileBuffer, 0x600, 0);
    LoadBgTiles(2, gNamingScreenData->tileBuffer, 0x600, 0);
    LoadBgTiles(3, gNamingScreenData->tileBuffer, 0x600, 0);
    LoadSpriteSheets(gUnknown_83E267C);
    LoadSpritePalettes(gUnknown_83E26E4);
}

void sub_809F8C0(void)
{
    InputInit();
    sub_809E4F0();
}

void choose_name_or_words_screen_apply_bg_pals(void)
{
    LoadPalette(gNamingScreenMenu_Pal, 0, 0xC0);
    LoadPalette(gUnknown_8E97FE4, 0xA0, 0x20);
    LoadPalette(stdpal_get(2), 0xB0, 0x20);
}

void DecompressToBgTilemapBuffer(u8 bg, const u32 *src)
{
    CopyToBgTilemapBuffer(bg, src, 0, 0);
}

void PrintBufferCharactersOnScreen(void)
{
    u8 i;
    u8 temp[2];
    u16 xoff;
    u8 maxChars = gNamingScreenData->template->maxChars;
    u16 xpos = gNamingScreenData->inputCharBaseXPos - 0x40;

    FillWindowPixelBuffer(gNamingScreenData->windows[2], PIXEL_FILL(1));

    for (i = 0; i < maxChars; i++)
    {
        temp[0] = gNamingScreenData->textBuffer[i];
        temp[1] = gExpandedPlaceholder_Empty[0];
        xoff = (IsLetter(temp[0]) == TRUE) ? 2 : 0;

        AddTextPrinterParameterized(gNamingScreenData->windows[2], 2, temp, i * 8 + xpos + xoff, 1, TEXT_SPEED_FF, NULL);
    }

    CallAddGenderIconFunc();
    CopyWindowToVram(gNamingScreenData->windows[2], 2);
    PutWindowTilemap(gNamingScreenData->windows[2]);
}

struct TextColor   // Needed because of alignment
{
    u8 colors[3][4];
};

const struct TextColor sTextColorStruct = {
    {
        {TEXT_DYNAMIC_COLOR_4, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY},
        {TEXT_DYNAMIC_COLOR_5, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY},
        {TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY}
    }
};

const u8 sFillValues[KBPAGE_COUNT] = {
    [KBPAGE_LETTERS_LOWER] = PIXEL_FILL(14),
    [KBPAGE_LETTERS_UPPER] = PIXEL_FILL(13),
    [KBPAGE_SYMBOLS]       = PIXEL_FILL(15)
};

const u8 *const sKeyboardTextColors[KBPAGE_COUNT] = {
    [KBPAGE_LETTERS_LOWER] = sTextColorStruct.colors[1],
    [KBPAGE_LETTERS_UPPER] = sTextColorStruct.colors[0],
    [KBPAGE_SYMBOLS]       = sTextColorStruct.colors[2]
};

void sub_809F9E8(u8 window, u8 page)
{
    u8 i;

    FillWindowPixelBuffer(window, sFillValues[page]);

    for (i = 0; i < KBROW_COUNT; i++)
    {
        AddTextPrinterParameterized3(window, 1, 0, i * 16 + 1, sKeyboardTextColors[page], 0, sNamingScreenKeyboardText[page][i]);
    }

    PutWindowTilemap(window);
}

const u32 *const gUnknown_83E244C[] = {
    gUnknown_8E98398,
    gUnknown_8E98458,
    gUnknown_8E98518
};

void sub_809FA60(void)
{
    u8 bgId;
    u8 bgId_copy;
    u8 windowId;
    u8 bg1Priority = GetGpuReg(REG_OFFSET_BG1CNT) & 3;
    u8 bg2Priority = GetGpuReg(REG_OFFSET_BG2CNT) & 3;

    if (bg1Priority > bg2Priority)
    {
        bgId = 1;
        bgId_copy = 1;
        windowId = gNamingScreenData->windows[0];
    }
    else
    {
        bgId = 2;
        bgId_copy = 2;
        windowId = gNamingScreenData->windows[1];
    }

    DecompressToBgTilemapBuffer(bgId, gUnknown_83E244C[gNamingScreenData->currentPage]);
    sub_809F9E8(windowId, sub_809DE30());
    CopyBgTilemapBufferToVram(bgId_copy);
}

void sub_809FAE4(void)
{
    const u8 color[3] = { TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GREY };
    int strwidth = GetStringWidth(0, gText_MoveOkBack, 0);

    FillWindowPixelBuffer(gNamingScreenData->windows[4], PIXEL_FILL(15));
    AddTextPrinterParameterized3(gNamingScreenData->windows[4], 0, 236 - strwidth, 0, color, 0, gText_MoveOkBack);
    PutWindowTilemap(gNamingScreenData->windows[4]);
    CopyWindowToVram(gNamingScreenData->windows[4], 3);
}

void sub_809FB70(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void NamingScreen_TurnOffScreen(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

void NamingScreen_InitDisplayMode(void)
{
    SetVBlankCallback(VBlankCB_NamingScreen);
}

void VBlankCB_NamingScreen(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    SetGpuReg(REG_OFFSET_BG1VOFS, gNamingScreenData->bg1vOffset);
    SetGpuReg(REG_OFFSET_BG2VOFS, gNamingScreenData->bg2vOffset);
    SetGpuReg(REG_OFFSET_BG1CNT, GetGpuReg(REG_OFFSET_BG1CNT) & 0xFFFC); // clear priority bits
    SetGpuRegBits(REG_OFFSET_BG1CNT, gNamingScreenData->bg1Priority);
    SetGpuReg(REG_OFFSET_BG2CNT, GetGpuReg(REG_OFFSET_BG2CNT) & 0xFFFC); // clear priority bits
    SetGpuRegBits(REG_OFFSET_BG2CNT, gNamingScreenData->bg2Priority);
}

void ShowAllBgs(void)
{
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
}

bool8 IsLetter(u8 character)
{
    u8 i;

    for (i = 0; gText_AlphabetUpperLower[i] != EOS; i++)
    {
        if (character == gText_AlphabetUpperLower[i])
            return TRUE;
    }
    return FALSE;
}

//--------------------------------------------------
// Unused debug functions
//--------------------------------------------------

void Debug_DoNamingScreen_Player(void)
{
    DoNamingScreen(NAMING_SCREEN_PLAYER, gSaveBlock2Ptr->playerName, gSaveBlock2Ptr->playerGender, MON_MALE, 0, CB2_ReturnToFieldWithOpenMenu);
}

void Debug_DoNamingScreen_Box(void)
{
    DoNamingScreen(NAMING_SCREEN_BOX, gSaveBlock2Ptr->playerName, gSaveBlock2Ptr->playerGender, MON_MALE, 0, CB2_ReturnToFieldWithOpenMenu);
}

void Debug_DoNamingScreen_CaughtMon(void)
{
    DoNamingScreen(NAMING_SCREEN_CAUGHT_MON, gSaveBlock2Ptr->playerName, gSaveBlock2Ptr->playerGender, MON_MALE, 0, CB2_ReturnToFieldWithOpenMenu);
}

void Debug_DoNamingScreen_NameRater(void)
{
    DoNamingScreen(NAMING_SCREEN_NAME_RATER, gSaveBlock2Ptr->playerName, gSaveBlock2Ptr->playerGender, MON_MALE, 0, CB2_ReturnToFieldWithOpenMenu);
}

void Debug_DoNamingScreen_Rival(void)
{
    DoNamingScreen(NAMING_SCREEN_RIVAL, gSaveBlock2Ptr->playerName, gSaveBlock2Ptr->playerGender, MON_MALE, 0, CB2_ReturnToFieldWithOpenMenu);
}

//--------------------------------------------------
// Forward-declared variables
//--------------------------------------------------

const struct NamingScreenTemplate playerNamingScreenTemplate = {
    .copyExistingString = FALSE,
    .maxChars = PLAYER_NAME_LENGTH,
    .iconFunction = 1,
    .addGenderIcon = 0,
    .initialPage = KBPAGE_LETTERS_UPPER,
    .title = gText_YourName,
};

const struct NamingScreenTemplate pcBoxNamingTemplate = {
    .copyExistingString = FALSE,
    .maxChars = 8/*BOX_NAME_LENGTH*/,
    .iconFunction = 2,
    .addGenderIcon = 0,
    .initialPage = KBPAGE_LETTERS_UPPER,
    .title = gText_BoxName,
};

const struct NamingScreenTemplate monNamingScreenTemplate = {
    .copyExistingString = FALSE,
    .maxChars = POKEMON_NAME_LENGTH,
    .iconFunction = 3,
    .addGenderIcon = 1,
    .initialPage = KBPAGE_LETTERS_UPPER,
    .title = gText_PkmnsNickname,
};

const struct NamingScreenTemplate rivalNamingScreenTemplate = {
    .copyExistingString = FALSE,
    .maxChars = OT_NAME_LENGTH,
    .iconFunction = 4,
    .addGenderIcon = 0,
    .initialPage = KBPAGE_LETTERS_UPPER,
    .title = gText_RivalsName,
};

const struct NamingScreenTemplate *const sNamingScreenTemplates[] = {
    &playerNamingScreenTemplate,
    &pcBoxNamingTemplate,
    &monNamingScreenTemplate,
    &monNamingScreenTemplate,
    &rivalNamingScreenTemplate,
};

const struct OamData gOamData_858BFEC = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
};

const struct OamData gOamData_858BFF4 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
};

const struct OamData gOamData_858BFFC = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x16),
    .x = 0,
    .size = SPRITE_SIZE(32x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
};

const struct Subsprite gUnknown_83E24B8[] = {
    {
        .x = -20,
        .y = -16,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    }, {
        .x =  12,
        .y = -16,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 4,
        .priority = 1
    }, {
        .x = -20,
        .y = -8,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 5,
        .priority = 1
    }, {
        .x =  12,
        .y = -8,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 9,
        .priority = 1
    }, {
        .x = -20,
        .y =  0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 10,
        .priority = 1
    }, {
        .x =  12,
        .y =  0,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 14,
        .priority = 1
    }, {
        .x = -20,
        .y =  8,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 15,
        .priority = 1
    }, {
        .x =  12,
        .y =  8,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 19,
        .priority = 1
    }
};

const struct Subsprite gUnknown_83E24D8[] = {
    {
        .x = -12,
        .y = -4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 0,
        .priority = 1
    }, {
        .x =   4,
        .y = -4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 2,
        .priority = 1
    }
};

const struct Subsprite gUnknown_83E24E0[] = {
    {
        .x = -20,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    }, {
        .x =  12,
        .y = -12,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 4,
        .priority = 1
    }, {
        .x = -20,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 5,
        .priority = 1
    }, {
        .x =  12,
        .y = -4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 9,
        .priority = 1
    }, {
        .x = -20,
        .y =  4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 10,
        .priority = 1
    }, {
        .x =  12,
        .y =  4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 14,
        .priority = 1
    }
};

const struct Subsprite gUnknown_83E24F8[] = {
    {
        .x = -8,
        .y = -12,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 0,
        .priority = 3
    }, {
        .x = -8,
        .y = -4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 2,
        .priority = 3
    }, {
        .x = -8,
        .y =  4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 4,
        .priority = 3
    }
};

const struct SubspriteTable gUnknown_83E2504[] = {
    subsprite_table(gUnknown_83E24B8)
};

const struct SubspriteTable gUnknown_83E250C[] = {
    subsprite_table(gUnknown_83E24D8),
    subsprite_table(gUnknown_83E24D8),
    subsprite_table(gUnknown_83E24D8)
};

const struct SubspriteTable gUnknown_83E2524[] = {
    subsprite_table(gUnknown_83E24E0)
};

const struct SubspriteTable gUnknown_83E252C[] = {
    subsprite_table(gUnknown_83E24F8)
};

const struct SpriteFrameImage gUnknown_0858C080[] = {
    {gUnknown_83E1800, sizeof(gUnknown_83E1800)},
    {gUnknown_83E18C0, sizeof(gUnknown_83E18C0)},
};

const union AnimCmd gSpriteAnim_858C090[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_858C098[] = {
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_858C0A4[] = {
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gSpriteAnimTable_858C0B0[] = {
    gSpriteAnim_858C090
};

const union AnimCmd *const gSpriteAnimTable_858C0B4[] = {
    gSpriteAnim_858C090,
    gSpriteAnim_858C098
};

const union AnimCmd *const gSpriteAnimTable_858C0BC[] = {
    gSpriteAnim_858C0A4
};

const struct SpriteTemplate gUnknown_83E2574 = {
    .tileTag = 0x0002,
    .paletteTag = 0x0004,
    .oam = &gOamData_858BFEC,
    .anims = gSpriteAnimTable_858C0B0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PageSwap
};

const struct SpriteTemplate gUnknown_83E258C = {
    .tileTag = 0x0003,
    .paletteTag = 0x0001,
    .oam = &gOamData_858BFFC,
    .anims = gSpriteAnimTable_858C0B0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpriteTemplate gUnknown_83E25A4 = {
    .tileTag = 0x0004,
    .paletteTag = 0x0004,
    .oam = &gOamData_858BFEC,
    .anims = gSpriteAnimTable_858C0B0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpriteTemplate gUnknown_83E25BC = {
    .tileTag = 0x0000,
    .paletteTag = 0x0006,
    .oam = &gOamData_858BFEC,
    .anims = gSpriteAnimTable_858C0B0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpriteTemplate gUnknown_83E25D4 = {
    .tileTag = 0x0001,
    .paletteTag = 0x0007,
    .oam = &gOamData_858BFEC,
    .anims = gSpriteAnimTable_858C0B0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpriteTemplate gUnknown_83E25EC = {
    .tileTag = 0x0007,
    .paletteTag = 0x0005,
    .oam = &gOamData_858BFF4,
    .anims = gSpriteAnimTable_858C0B4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_809E700
};

const struct SpriteTemplate sSpriteTemplate_InputArrow = {
    .tileTag = 0x000A,
    .paletteTag = 0x0003,
    .oam = &gOamData_858BFEC,
    .anims = gSpriteAnimTable_858C0B0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_809E7F0
};

const struct SpriteTemplate sSpriteTemplate_Underscore = {
    .tileTag = 0x000B,
    .paletteTag = 0x0003,
    .oam = &gOamData_858BFEC,
    .anims = gSpriteAnimTable_858C0B0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_809E83C
};

const struct SpriteTemplate gUnknown_83E2634 = {
    .tileTag = 0xFFFF,
    .paletteTag = 0x0000,
    .oam = &gOamData_858BFEC,
    .anims = gSpriteAnimTable_858C0BC,
    .images = gUnknown_0858C080,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const u8 *const sNamingScreenKeyboardText[KBPAGE_COUNT][KBROW_COUNT] = {
    [KBPAGE_LETTERS_LOWER] = {
        gText_NamingScreenKeyboard_abcdef,
        gText_NamingScreenKeyboard_ghijkl,
        gText_NamingScreenKeyboard_mnopqrs,
        gText_NamingScreenKeyboard_tuvwxyz
    },
    [KBPAGE_LETTERS_UPPER] = {
        gText_NamingScreenKeyboard_ABCDEF,
        gText_NamingScreenKeyboard_GHIJKL,
        gText_NamingScreenKeyboard_MNOPQRS,
        gText_NamingScreenKeyboard_TUVWXYZ
    },
    [KBPAGE_SYMBOLS] = {
        gText_NamingScreenKeyboard_01234,
        gText_NamingScreenKeyboard_56789,
        gText_NamingScreenKeyboard_Symbols1,
        gText_NamingScreenKeyboard_Symbols2
    },
};

// FIXME: Sync with Emerald
const struct SpriteSheet gUnknown_83E267C[] = {
    {gUnknown_8E98858, 0x1E0,  0x0000},
    {gUnknown_8E98A38, 0x1E0,  0x0001},
    {gUnknown_8E985D8, 0x280,  0x0002},
    {gUnknown_8E98FD8, 0x100,  0x0003},
    {gUnknown_8E98C18, 0x060,  0x0004},
    {gUnknown_8E98CB8, 0x060,  0x0005},
    {gUnknown_8E98D58, 0x060,  0x0006},
    {gUnknown_8E98DF8, 0x080,  0x0007},
    {gUnknown_8E98E98, 0x080,  0x0008},
    {gUnknown_8E98F38, 0x080,  0x0009},
    {gUnknown_8E990D8, 0x020,  0x000A},
    {gUnknown_8E990F8, 0x020,  0x000B},
    {NULL}
};

const struct SpritePalette gUnknown_83E26E4[] = {
    {gNamingScreenMenu_Pal,         0x0000},
    {gNamingScreenMenu_Pal + 0x10,  0x0001},
    {gNamingScreenMenu_Pal + 0x20,  0x0002},
    {gNamingScreenMenu_Pal + 0x30,  0x0003},
    {gNamingScreenMenu_Pal + 0x40,  0x0004},
    {gNamingScreenMenu_Pal + 0x50,  0x0005},
    {gNamingScreenMenu_Pal + 0x40,  0x0006},
    {gNamingScreenMenu_Pal + 0x40,  0x0007},
    {NULL}
};
