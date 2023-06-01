#include "global.h"
#include "gflib.h"
#include "keyboard_text.h"
#include "decompress.h"
#include "easy_chat.h"
#include "graphics.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "strings.h"
#include "text_window.h"

enum {
    GFXTAG_TRIANGLE_CURSOR,
    GFXTAG_RECTANGLE_CURSOR,
    GFXTAG_SCROLL_INDICATOR,
    GFXTAG_START_SELECT_BUTTONS,
    GFXTAG_MODE_WINDOW,
    GFXTAG_RS_INTERVIEW_FRAME,
    GFXTAG_BUTTON_WINDOW,
};

enum {
    PALTAG_TRIANGLE_CURSOR,
    PALTAG_RECTANGLE_CURSOR,
    PALTAG_MISC_UI,
    PALTAG_RS_INTERVIEW_FRAME,
};

struct ECWork
{
    u16 state;
    u16 windowId;
    u16 id;
    u8 frameAnimIdx;
    u8 frameAnimTarget;
    s8 frameAnimDelta;
    u8 modeIconState;
    u8 ecPrintBuffer[0xC1];
    u8 ecPaddedWordBuffer[0x200];
    u16 bg2ScrollRow;
    int tgtBgY;
    int deltaBgY;
    struct Sprite *selectDestFieldCursorSprite;
    struct Sprite *rectCursorSpriteRight;
    struct Sprite *rectCursorSpriteLeft;
    struct Sprite *selectWordCursorSprite;
    struct Sprite *selectGroupHelpSprite;
    struct Sprite *modeIconsSprite;
    struct Sprite *upTriangleCursorSprite;
    struct Sprite *downTriangleCursorSprite;
    struct Sprite *startPgUpButtonSprite;
    struct Sprite *selectPgDnButtonSprite;
    u16 bg1TilemapBuffer[BG_SCREEN_SIZE / 2];
    u16 bg3TilemapBuffer[BG_SCREEN_SIZE / 2];
};

struct EasyChatPhraseFrameDimensions
{
    u8 left;
    u8 top;
    u8 width;
    u8 height;
};

static EWRAM_DATA struct ECWork * sEasyChatGraphicsResources = NULL;

static bool8 ECInterfaceCmd_01(void);
static bool8 ECInterfaceCmd_02(void);
static bool8 ECInterfaceCmd_03(void);
static bool8 ECInterfaceCmd_05(void);
static bool8 ECInterfaceCmd_06(void);
static bool8 ECInterfaceCmd_04(void);
static bool8 ECInterfaceCmd_07(void);
static bool8 ECInterfaceCmd_08(void);
static bool8 ECInterfaceCmd_09(void);
static bool8 ECInterfaceCmd_10(void);
static bool8 ECInterfaceCmd_22(void);
static bool8 ECInterfaceCmd_14(void);
static bool8 ECInterfaceCmd_15(void);
static bool8 ECInterfaceCmd_16(void);
static bool8 ECInterfaceCmd_11(void);
static bool8 ECInterfaceCmd_12(void);
static bool8 ECInterfaceCmd_13(void);
static bool8 ECInterfaceCmd_17(void);
static bool8 ECInterfaceCmd_19(void);
static bool8 ECInterfaceCmd_18(void);
static bool8 ECInterfaceCmd_21(void);
static bool8 ECInterfaceCmd_20(void);
static bool8 InitEasyChatGraphicsWork_Internal(void);
static void SetGpuRegsForEasyChatInit(void);
static void LoadEasyChatPals(void);
static void PrintTitleText(void);
static void EC_AddTextPrinterParameterized2(u8 windowId, u8 fontId, const u8 *str, u8 left, u8 top, u8 speed, u8 bg, u8 fg, u8 shadow);
static void PrintECInstructionsText(void);
static void PrintECInterfaceTextById(u8 a0);
static void EC_CreateYesNoMenuWithInitialCursorPos(u8 initialCursorPos);
static void CreatePhraseFrameWindow(void);
static void PrintECFields(void);
static void DrawECFrameInTilemapBuffer(u16 *buffer);
static void PutWin2TilemapAndCopyToVram(void);
static void PrintECMenuById(u32 a0);
static void PrintECGroupOrAlphaMenu(void);
static void PrintECGroupsMenu(void);
static void PrintEasyChatKeyboardText(void);
static void PrintECWordsMenu(void);
static void UpdateWin2PrintWordsScrollDown(void);
static void UpdateWin2PrintWordsScrollUp(void);
static void UpdateWin2PrintWordsScrollPageDown(void);
static void UpdateWin2PrintWordsScrollPageUp(void);
static void PrintECRowsWin2(u8 row, u8 remrow);
static void ClearECRowsWin2(u8 row, u8 remrow);
static void ClearWin2AndCopyToVram(void);
static void StartWin2FrameAnim(int a0);
static bool8 AnimateFrameResize(void);
static void RedrawFrameByIndex(u8 a0);
static void RedrawFrameByRect(int left, int top, int width, int height);
static void InitBg2Scroll(void);
static void ScheduleBg2VerticalScroll(s16 direction, u8 speed);
static bool8 AnimateBg2VerticalScroll(void);
static int GetBg2ScrollRow(void);
static void SetRegWin0Coords(u8 left, u8 top, u8 right, u8 bottom);
static void LoadSpriteGfx(void);
static void CreateSelectDestFieldCursorSprite(void);
static void SpriteCB_BounceCursor(struct Sprite *sprite);
static void SetSelectDestFieldCursorSpritePosAndResetAnim(u8 x, u8 y);
static void FreezeSelectDestFieldCursorSprite(void);
static void UnfreezeSelectDestFieldCursorSprite(void);
static void CreateRedRectangularCursorSpritePair(void);
static void DestroyRedRectangularCursor(void);
static void EC_MoveCursor(void);
static void MoveCursor_Group(s8 a0, s8 a1);
static void MoveCursor_Alpha(s8 a0, s8 a1);
static void CreateSelectWordCursorSprite(void);
static void SpriteCB_SelectWordCursorSprite(struct Sprite *sprite);
static void SetSelectWordCursorSpritePos(void);
static void SetSelectWordCursorSpritePosExplicit(u8 x, u8 y);
static void DestroySelectWordCursorSprite(void);
static void CreateSelectGroupHelpSprite(void);
static bool8 AnimateSeletGroupModeAndHelpSpriteEnter(void);
static void StartModeIconHidingAnimation(void);
static bool8 RunModeIconHidingAnimation(void);
static void ShrinkModeIconsSprite(void);
static void ShowModeIconsSprite(void);
static bool8 ModeIconsSpriteAnimIsEnded(void);
static void CreateVerticalScrollArrowSprites(void);
static void UpdateVerticalScrollArrowVisibility(void);
static void HideVerticalScrollArrowSprites(void);
static void UpdateVerticalScrollArrowSpriteXPos(int a0);
static void CreateStartSelectButtonsSprites(void);
static void UpdateStartSelectButtonSpriteVisibility(void);
static void HideStartSelectButtonSprites(void);
static void CreateFooterWindow(void);

static const u16 sTriangleCursor_Pal[] = INCBIN_U16("graphics/easy_chat/triangle_cursor.gbapal");
static const u16 sRectangleCursor_Pal[] = INCBIN_U16("graphics/easy_chat/rectangle_cursor.gbapal");
static const u16 sTriangleCursor_Gfx[] = INCBIN_U16("graphics/easy_chat/triangle_cursor.4bpp");
static const u16 sScrollIndicator_Gfx[] = INCBIN_U16("graphics/easy_chat/scroll_indicator.4bpp");
static const u16 sStartSelectButtons_Gfx[] = INCBIN_U16("graphics/easy_chat/start_select_buttons.4bpp");
// In Ruby/Sapphire Easy Chat screens had a black background, and when the player & interviewer were present
// on screen the interview_frame gfx was shown behind them.
// In FRLG all Easy Chat screens have a filled background, so these gfx go unused
static const u16 sRSInterviewFrame_Pal[] = INCBIN_U16("graphics/easy_chat/interview_frame.gbapal");
static const u32 sRSInterviewFrame_Gfx[] = INCBIN_U32("graphics/easy_chat/interview_frame.4bpp.lz");
static const u16 sTextInputFrameOrange_Pal[] = INCBIN_U16("graphics/easy_chat/text_input_frame_orange.gbapal");
static const u16 sTextInputFrameGreen_Pal[] = INCBIN_U16("graphics/easy_chat/text_input_frame_green.gbapal");
static const u32 sTextInputFrame_Gfx[] = INCBIN_U32("graphics/easy_chat/text_input_frame.4bpp.lz");
static const u16 sTitleText_Pal[] = INCBIN_U16("graphics/easy_chat/title_text.gbapal");
static const u16 sText_Pal[] = INCBIN_U16("graphics/easy_chat/text.gbapal");

static const struct EasyChatPhraseFrameDimensions sPhraseFrameDimensions[] = {
    {
        .left = 3,
        .top = 4,
        .width = 24,
        .height = 4
    }, {
        .left = 1,
        .top = 4,
        .width = 27,
        .height = 4
    }, {
        .left = 3,
        .top = 0,
        .width = 24,
        .height = 10
    }, {
        .left = 6,
        .top = 6,
        .width = 18,
        .height = 4
    }, {
        .left = 16,
        .top = 4,
        .width = 9,
        .height = 2
    }, {
        .left = 14,
        .top = 4,
        .width = 18,
        .height = 4
    }
};

static const struct BgTemplate sEasyChatBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0,
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0,
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x80,
    }, {
        .bg = 3,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0,
    }
};

static const struct WindowTemplate sEasyChatWindowTemplates[] = {
    {
        .bg = 1,
        .tilemapLeft = 7,
        .tilemapTop = 0,
        .width = 16,
        .height = 2,
        .paletteNum = 10,
        .baseBlock = 0x10,
    },
    {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 15,
        .width = 22,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0xA,
    },
    {
        .bg = 2,
        .tilemapLeft = 1,
        .tilemapTop = 0,
        .width = 28,
        .height = 32,
        .paletteNum = 3,
        .baseBlock = 0,
    },
    DUMMY_WIN_TEMPLATE,
};

static const struct WindowTemplate sEasyChatYesNoWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 22,
    .tilemapTop = 9,
    .width = 5,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x062
};

static const u8 sText_Underscore[] = _("{UNDERSCORE}");
static const u8 sText_Clear17[] = _("{CLEAR 17}");

static const u8 *const sEasyChatKeyboardAlphabet[NUM_ALPHABET_ROWS] = {
    gText_EasyChatKeyboard_ABCDEFothers,
    gText_EasyChatKeyboard_GHIJKL,
    gText_EasyChatKeyboard_MNOPQRS,
    gText_EasyChatKeyboard_TUVWXYZ
};

static const struct SpriteSheet sEasyChatSpriteSheets[] = {
    {.data = sTriangleCursor_Gfx,     .size = 0x0020, .tag = GFXTAG_TRIANGLE_CURSOR},
    {.data = sScrollIndicator_Gfx,    .size = 0x0100, .tag = GFXTAG_SCROLL_INDICATOR},
    {.data = sStartSelectButtons_Gfx, .size = 0x0100, .tag = GFXTAG_START_SELECT_BUTTONS},
    {}
};

static const struct SpritePalette sEasyChatSpritePalettes[] = {
    {.data = sTriangleCursor_Pal,       .tag = PALTAG_TRIANGLE_CURSOR},
    {.data = sRectangleCursor_Pal,      .tag = PALTAG_RECTANGLE_CURSOR},
    {.data = gEasyChatButtonWindow_Pal, .tag = PALTAG_MISC_UI}, // The palette is generated from the button window but used for various parts of the UI
    {.data = sRSInterviewFrame_Pal,     .tag = PALTAG_RS_INTERVIEW_FRAME},
    {}
};

static const struct CompressedSpriteSheet sEasyChatCompressedSpriteSheets[] = {
    {.data = sRSInterviewFrame_Gfx,        .size = 0x0800, .tag = GFXTAG_RS_INTERVIEW_FRAME},
    {.data = gEasyChatRectangleCursor_Gfx, .size = 0x1000, .tag = GFXTAG_RECTANGLE_CURSOR},
    {.data = gEasyChatButtonWindow_Gfx,    .size = 0x0800, .tag = GFXTAG_BUTTON_WINDOW},
    {.data = gEasyChatMode_Gfx,            .size = 0x1000, .tag = GFXTAG_MODE_WINDOW}
};

static const u8 sAlphabetKeyboardColumnOffsets[NUM_ALPHABET_COLUMNS] = {0, 12, 24, 56, 68, 80, 92};

static const struct OamData sOamData_TriangleCursor = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .mosaic = FALSE,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0x000,
    .priority = 3,
    .paletteNum = 0
};

static const struct SpriteTemplate sSpriteTemplate_TriangleCursor = {
    .tileTag = GFXTAG_TRIANGLE_CURSOR,
    .paletteTag = PALTAG_TRIANGLE_CURSOR,
    .oam = &sOamData_TriangleCursor,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_BounceCursor
};

static const struct OamData sOamData_RectangleCursor = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .mosaic = FALSE,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const union AnimCmd sAnim_RectangleCursor_OnGroup[] = {
    ANIMCMD_FRAME(0x00, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_RectangleCursor_OnButton[] = {
    ANIMCMD_FRAME(0x20, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_RectangleCursor_OnOthers[] = {
    ANIMCMD_FRAME(0x40, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_RectangleCursor_OnLetter[] = {
    ANIMCMD_FRAME(0x60, 0),
    ANIMCMD_END
};

// Each anim changes the dimensions of the rectangle cursor to fit what it should be selecting
enum {
    RECTCURSOR_ANIM_ON_GROUP,
    RECTCURSOR_ANIM_ON_BUTTON,
    RECTCURSOR_ANIM_ON_OTHERS,
    RECTCURSOR_ANIM_ON_LETTER,
};

static const union AnimCmd *const sAnims_RectangleCursor[] = {
    [RECTCURSOR_ANIM_ON_GROUP]  = sAnim_RectangleCursor_OnGroup,
    [RECTCURSOR_ANIM_ON_BUTTON] = sAnim_RectangleCursor_OnButton,
    [RECTCURSOR_ANIM_ON_OTHERS] = sAnim_RectangleCursor_OnOthers,
    [RECTCURSOR_ANIM_ON_LETTER] = sAnim_RectangleCursor_OnLetter,
};

static const struct SpriteTemplate sSpriteTemplate_RectangleCursor = {
    .tileTag = GFXTAG_RECTANGLE_CURSOR,
    .paletteTag = PALTAG_RECTANGLE_CURSOR,
    .oam = &sOamData_RectangleCursor,
    .anims = sAnims_RectangleCursor,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_BounceCursor
};

static const struct OamData sOamData_ModeWindow = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .mosaic = FALSE,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const union AnimCmd sAnim_ModeWindow_Hidden[] = {
    ANIMCMD_FRAME(0x60, 0), // Hidden frame
    ANIMCMD_END
};

static const union AnimCmd sAnim_ModeWindow_ToGroup[] = {
    ANIMCMD_FRAME(0x40, 4), // Transition frame
    ANIMCMD_FRAME(0x20, 4), // 'Group' frame
    ANIMCMD_END
};

static const union AnimCmd sAnim_ModeWindow_ToAlphabet[] = {
    ANIMCMD_FRAME(0x40, 4), // Transition frame
    ANIMCMD_FRAME(0x00, 4), // 'A-Z' frame
    ANIMCMD_END
};

static const union AnimCmd sAnim_ModeWindow_ToHidden[] = {
    ANIMCMD_FRAME(0x40, 4), // Transition frame
    ANIMCMD_FRAME(0x60, 0), // Hidden frame
    ANIMCMD_END
};

static const union AnimCmd sAnim_ModeWindow_Transition[] = {
    ANIMCMD_FRAME(0x40, 4), // Transition frame
    ANIMCMD_END
};

enum {
    MODEWINDOW_ANIM_HIDDEN,
    MODEWINDOW_ANIM_TO_GROUP,
    MODEWINDOW_ANIM_TO_ALPHABET,
    MODEWINDOW_ANIM_TO_HIDDEN,
    MODEWINDOW_ANIM_TRANSITION,
};

static const union AnimCmd *const sAnims_ModeWindow[] = {
    [MODEWINDOW_ANIM_HIDDEN]      = sAnim_ModeWindow_Hidden,
    [MODEWINDOW_ANIM_TO_GROUP]    = sAnim_ModeWindow_ToGroup,
    [MODEWINDOW_ANIM_TO_ALPHABET] = sAnim_ModeWindow_ToAlphabet,
    [MODEWINDOW_ANIM_TO_HIDDEN]   = sAnim_ModeWindow_ToHidden,
    [MODEWINDOW_ANIM_TRANSITION]  = sAnim_ModeWindow_Transition,
};

static const struct SpriteTemplate sSpriteTemplate_ModeWindow = {
    .tileTag = GFXTAG_MODE_WINDOW,
    .paletteTag = PALTAG_MISC_UI,
    .oam = &sOamData_ModeWindow,
    .anims = sAnims_ModeWindow,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_ButtonWindow = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0x000,
    .priority = 3,
    .paletteNum = 0
};

static const struct SpriteTemplate sSpriteTemplate_ButtonWindow = {
    .tileTag = GFXTAG_BUTTON_WINDOW,
    .paletteTag = PALTAG_MISC_UI,
    .oam = &sOamData_ButtonWindow,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_StartSelectButton = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x8),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const struct OamData sOamData_ScrollIndicator = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const union AnimCmd sAnim_Frame0[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_Frame1[] = {
    ANIMCMD_FRAME(4, 0),
    ANIMCMD_END,
};

// Frame0 is Start button, Frame1 is Select button, both are identical for the scroll indicators
static const union AnimCmd *const sAnims_TwoFrame[] = {
    sAnim_Frame0,
    sAnim_Frame1,
};

static const struct SpriteTemplate sSpriteTemplate_StartSelectButtons = {
    .tileTag = GFXTAG_START_SELECT_BUTTONS,
    .paletteTag = PALTAG_MISC_UI,
    .oam = &sOamData_StartSelectButton,
    .anims = sAnims_TwoFrame,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sSpriteTemplate_ScrollIndicator = {
    .tileTag = GFXTAG_SCROLL_INDICATOR,
    .paletteTag = PALTAG_MISC_UI,
    .oam = &sOamData_ScrollIndicator,
    .anims = sAnims_TwoFrame,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

bool8 InitEasyChatGraphicsWork(void)
{
    if (!InitEasyChatGraphicsWork_Internal())
        return FALSE;
    else
        return TRUE;
}

bool8 LoadEasyChatGraphics(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, sEasyChatBgTemplates, NELEMS(sEasyChatBgTemplates));
        SetBgTilemapBuffer(3, sEasyChatGraphicsResources->bg3TilemapBuffer);
        SetBgTilemapBuffer(1, sEasyChatGraphicsResources->bg1TilemapBuffer);
        InitWindows(sEasyChatWindowTemplates);
        DeactivateAllTextPrinters();
        LoadEasyChatPals();
        SetGpuRegsForEasyChatInit();
        CpuFastFill(0, (void *)VRAM + 0x1000000, 0x400);
        break;
    case 1:
        DecompressAndLoadBgGfxUsingHeap(3, gEasyChatWindow_Gfx, 0, 0, 0);
        CopyToBgTilemapBuffer(3, gEasyChatWindow_Tilemap, 0, 0);
        CreatePhraseFrameWindow();
        CreateFooterWindow();
        CopyBgTilemapBufferToVram(3);
        break;
    case 2:
        DrawECFrameInTilemapBuffer(sEasyChatGraphicsResources->bg1TilemapBuffer);
        DecompressAndLoadBgGfxUsingHeap(1, sTextInputFrame_Gfx, 0, 0, 0);
        CopyBgTilemapBufferToVram(1);
        break;
    case 3:
        PrintTitleText();
        PrintECInstructionsText();
        PrintECFields();
        PutWin2TilemapAndCopyToVram();
        break;
    case 4:
        LoadSpriteGfx();
        CreateSelectDestFieldCursorSprite();
        break;
    case 5:
        if (IsDma3ManagerBusyWithBgCopy())
        {
            return TRUE;
        }
        else
        {
            SetRegWin0Coords(0, 0, 0, 0);
            SetGpuReg(REG_OFFSET_WININ, WIN_RANGE(0, 63));
            SetGpuReg(REG_OFFSET_WINOUT, WIN_RANGE(0, 59));
            ShowBg(3);
            ShowBg(1);
            ShowBg(2);
            ShowBg(0);
            CreateVerticalScrollArrowSprites();
            CreateStartSelectButtonsSprites();
        }
        break;
    default:
        return FALSE;
    }

    sEasyChatGraphicsResources->state++;
    return TRUE;
}

void DestroyEasyChatGraphicsResources(void)
{
    if (sEasyChatGraphicsResources)
        Free(sEasyChatGraphicsResources);
}

void EasyChatInterfaceCommand_Setup(u16 id)
{
    sEasyChatGraphicsResources->id = id;
    sEasyChatGraphicsResources->state = 0;
    EasyChatInterfaceCommand_Run();
}

bool8 EasyChatInterfaceCommand_Run(void)
{
    switch (sEasyChatGraphicsResources->id)
    {
    case 0:  return FALSE;
    case 1:  return ECInterfaceCmd_01();
    case 2:  return ECInterfaceCmd_02();
    case 3:  return ECInterfaceCmd_03();
    case 4:  return ECInterfaceCmd_04();
    case 5:  return ECInterfaceCmd_05();
    case 6:  return ECInterfaceCmd_06();
    case 7:  return ECInterfaceCmd_07();
    case 8:  return ECInterfaceCmd_08();
    case 9:  return ECInterfaceCmd_09();
    case 10: return ECInterfaceCmd_10();
    case 11: return ECInterfaceCmd_11();
    case 12: return ECInterfaceCmd_12();
    case 13: return ECInterfaceCmd_13();
    case 14: return ECInterfaceCmd_14();
    case 15: return ECInterfaceCmd_15();
    case 16: return ECInterfaceCmd_16();
    case 17: return ECInterfaceCmd_17();
    case 18: return ECInterfaceCmd_18();
    case 19: return ECInterfaceCmd_19();
    case 20: return ECInterfaceCmd_20();
    case 21: return ECInterfaceCmd_21();
    case 22: return ECInterfaceCmd_22();
    default: return FALSE;
    }
}

static bool8 ECInterfaceCmd_01(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        PrintECFields();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_02(void)
{
    u8 i;
    u16 *ecWordBuffer;
    u16 *ecWord;
    u8 frameId;
    u8 cursorColumn, cursorRow, numColumns;
    s16 var1;
    int stringWidth;
    int trueStringWidth;
    int var2;
    u8 str[64];

    ecWordBuffer = GetEasyChatWordBuffer();
    frameId = GetEasyChatScreenFrameId();
    cursorColumn = GetMainCursorColumn();
    cursorRow = GetMainCursorRow();
    numColumns = GetNumColumns();
    ecWord = &ecWordBuffer[cursorRow * numColumns];
    var1 = 8 * sPhraseFrameDimensions[frameId].left + 13;
    for (i = 0; i < cursorColumn; i++)
    {
        if (*ecWord == 0xFFFF)
        {
            stringWidth = GetStringWidth(FONT_NORMAL_COPY_1, sText_Underscore, 0) * 7;
        }
        else
        {
            CopyEasyChatWord(str, *ecWord);
            stringWidth = GetStringWidth(FONT_NORMAL_COPY_1, str, 0);
        }

        trueStringWidth = stringWidth + 17;
        var1 += trueStringWidth;
        ecWord++;
    }

    var2 = 8 * (sPhraseFrameDimensions[frameId].top + cursorRow * 2 + 1) + 1;
    SetSelectDestFieldCursorSpritePosAndResetAnim(var1, var2);
    return FALSE;
}

static bool8 ECInterfaceCmd_03(void)
{
    u8 xOffset;
    switch (GetMainCursorColumn())
    {
    case 0:
        xOffset = 28;
        break;
    case 1:
        xOffset = 115;
        break;
    case 2:
        xOffset = 191;
        break;
    default:
        return FALSE;
    }
    SetSelectDestFieldCursorSpritePosAndResetAnim(xOffset, 97);
    return FALSE;
}

static bool8 ECInterfaceCmd_05(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        FreezeSelectDestFieldCursorSprite();
        PrintECInterfaceTextById(2);
        EC_CreateYesNoMenuWithInitialCursorPos(1);
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_06(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        FreezeSelectDestFieldCursorSprite();
        PrintECInterfaceTextById(3);
        EC_CreateYesNoMenuWithInitialCursorPos(0);
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_04(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        FreezeSelectDestFieldCursorSprite();
        PrintECInterfaceTextById(1);
        EC_CreateYesNoMenuWithInitialCursorPos(1);
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_07(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        UnfreezeSelectDestFieldCursorSprite();
        PrintECInterfaceTextById(0);
        ShowBg(0);
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_08(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        UnfreezeSelectDestFieldCursorSprite();
        PrintECInterfaceTextById(0);
        PrintECFields();
        sEasyChatGraphicsResources->state++;
        // Fall through
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_09(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        FreezeSelectDestFieldCursorSprite();
        HideBg(0);
        SetRegWin0Coords(0, 0, 0, 0);
        PrintECGroupOrAlphaMenu();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            StartWin2FrameAnim(0);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy() && !AnimateFrameResize())
            sEasyChatGraphicsResources->state++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CreateSelectGroupHelpSprite();
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 4:
        if (!AnimateSeletGroupModeAndHelpSpriteEnter())
        {
            CreateRedRectangularCursorSpritePair();
            UpdateVerticalScrollArrowSpriteXPos(0);
            UpdateVerticalScrollArrowVisibility();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    default:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_10(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        DestroyRedRectangularCursor();
        StartModeIconHidingAnimation();
        HideVerticalScrollArrowSprites();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        if (RunModeIconHidingAnimation() == TRUE)
            break;

        StartWin2FrameAnim(1);
        sEasyChatGraphicsResources->state++;
        // Fall through
    case 2:
        if (!AnimateFrameResize())
            sEasyChatGraphicsResources->state++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            UnfreezeSelectDestFieldCursorSprite();
            ShowBg(0);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_22(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        DestroyRedRectangularCursor();
        HideVerticalScrollArrowSprites();
        ShrinkModeIconsSprite();
        StartWin2FrameAnim(5);
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        if (!AnimateFrameResize() && !ModeIconsSpriteAnimIsEnded())
        {
            PrintECGroupOrAlphaMenu();
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            StartWin2FrameAnim(6);
            ShowModeIconsSprite();
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 3:
        if (!AnimateFrameResize() && !ModeIconsSpriteAnimIsEnded())
        {
            UpdateVerticalScrollArrowVisibility();
            CreateRedRectangularCursorSpritePair();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_14(void)
{
    EC_MoveCursor();
    return FALSE;
}

static bool8 ECInterfaceCmd_15(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        ScheduleBg2VerticalScroll(1, 2);
        sEasyChatGraphicsResources->state++;
        // Fall through
    case 1:
        if (!AnimateBg2VerticalScroll())
        {
            EC_MoveCursor();
            UpdateVerticalScrollArrowVisibility();
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_16(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        ScheduleBg2VerticalScroll(-1, 2);
        sEasyChatGraphicsResources->state++;
        // Fall through
    case 1:
        if (!AnimateBg2VerticalScroll())
        {
            UpdateVerticalScrollArrowVisibility();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_11(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        DestroyRedRectangularCursor();
        StartModeIconHidingAnimation();
        HideVerticalScrollArrowSprites();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        if (!RunModeIconHidingAnimation())
        {
            ClearWin2AndCopyToVram();
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            StartWin2FrameAnim(2);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 3:
        if (!AnimateFrameResize())
        {
            PrintECMenuById(2);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CreateSelectWordCursorSprite();
            UpdateVerticalScrollArrowSpriteXPos(1);
            UpdateVerticalScrollArrowVisibility();
            UpdateStartSelectButtonSpriteVisibility();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_12(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        PrintECFields();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        DestroySelectWordCursorSprite();
        HideVerticalScrollArrowSprites();
        HideStartSelectButtonSprites();
        ClearWin2AndCopyToVram();
        sEasyChatGraphicsResources->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            StartWin2FrameAnim(3);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 3:
        if (!AnimateFrameResize())
        {
            ShowBg(0);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            UnfreezeSelectDestFieldCursorSprite();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_13(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        DestroySelectWordCursorSprite();
        HideVerticalScrollArrowSprites();
        HideStartSelectButtonSprites();
        ClearWin2AndCopyToVram();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            StartWin2FrameAnim(4);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 2:
        if (!AnimateFrameResize())
        {
            PrintECGroupOrAlphaMenu();
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CreateSelectGroupHelpSprite();
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 4:
        if (!AnimateSeletGroupModeAndHelpSpriteEnter())
        {
            CreateRedRectangularCursorSpritePair();
            UpdateVerticalScrollArrowSpriteXPos(0);
            UpdateVerticalScrollArrowVisibility();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_17(void)
{
    SetSelectWordCursorSpritePos();
    return FALSE;
}

static bool8 ECInterfaceCmd_19(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        UpdateWin2PrintWordsScrollDown();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            ScheduleBg2VerticalScroll(1, 2);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 2:
        if (!AnimateBg2VerticalScroll())
        {
            SetSelectWordCursorSpritePos();
            UpdateVerticalScrollArrowVisibility();
            UpdateStartSelectButtonSpriteVisibility();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_18(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        UpdateWin2PrintWordsScrollUp();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            ScheduleBg2VerticalScroll(-1, 2);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 2:
        if (!AnimateBg2VerticalScroll())
        {
            UpdateVerticalScrollArrowVisibility();
            UpdateStartSelectButtonSpriteVisibility();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_21(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        UpdateWin2PrintWordsScrollPageDown();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 direction = GetECSelectWordRowsAbove() - GetBg2ScrollRow();
            ScheduleBg2VerticalScroll(direction, 4);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 2:
        if (!AnimateBg2VerticalScroll())
        {
            SetSelectWordCursorSpritePos();
            UpdateVerticalScrollArrowVisibility();
            UpdateStartSelectButtonSpriteVisibility();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECInterfaceCmd_20(void)
{
    switch (sEasyChatGraphicsResources->state)
    {
    case 0:
        UpdateWin2PrintWordsScrollPageUp();
        sEasyChatGraphicsResources->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 direction = GetECSelectWordRowsAbove() - GetBg2ScrollRow();
            ScheduleBg2VerticalScroll(direction, 4);
            sEasyChatGraphicsResources->state++;
        }
        break;
    case 2:
        if (!AnimateBg2VerticalScroll())
        {
            UpdateVerticalScrollArrowVisibility();
            UpdateStartSelectButtonSpriteVisibility();
            sEasyChatGraphicsResources->state++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 InitEasyChatGraphicsWork_Internal(void)
{
    sEasyChatGraphicsResources = Alloc(sizeof(*sEasyChatGraphicsResources));
    if (sEasyChatGraphicsResources == NULL)
        return FALSE;

    sEasyChatGraphicsResources->state = 0;
    sEasyChatGraphicsResources->selectDestFieldCursorSprite = NULL;
    sEasyChatGraphicsResources->rectCursorSpriteRight = NULL;
    sEasyChatGraphicsResources->rectCursorSpriteLeft = NULL;
    sEasyChatGraphicsResources->selectWordCursorSprite = NULL;
    sEasyChatGraphicsResources->selectGroupHelpSprite = NULL;
    sEasyChatGraphicsResources->modeIconsSprite = NULL;
    sEasyChatGraphicsResources->upTriangleCursorSprite = NULL;
    sEasyChatGraphicsResources->downTriangleCursorSprite = NULL;
    sEasyChatGraphicsResources->startPgUpButtonSprite = NULL;
    sEasyChatGraphicsResources->selectPgDnButtonSprite = NULL;
    return TRUE;
}

static void SetGpuRegsForEasyChatInit(void)
{
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON);
}

static void LoadEasyChatPals(void)
{
    ResetPaletteFade();
    LoadPalette(gEasyChatWindow_Pal, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
    LoadPalette(sTextInputFrameOrange_Pal, BG_PLTT_ID(1), sizeof(sTextInputFrameOrange_Pal));
    LoadPalette(sTextInputFrameGreen_Pal, BG_PLTT_ID(4), sizeof(sTextInputFrameGreen_Pal));
    LoadPalette(sTitleText_Pal, BG_PLTT_ID(10), sizeof(sTitleText_Pal));
    LoadPalette(sText_Pal, BG_PLTT_ID(11), sizeof(sText_Pal));
    LoadPalette(sText_Pal, BG_PLTT_ID(15), sizeof(sText_Pal));
    LoadPalette(sText_Pal, BG_PLTT_ID(3), sizeof(sText_Pal));
}

static void PrintTitleText(void)
{
    int xOffset;
    const u8 *titleText = GetTitleText();
    if (titleText == NULL)
        return;

    xOffset = (128 - GetStringWidth(FONT_NORMAL_COPY_1, titleText, 0)) / 2u;
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    EC_AddTextPrinterParameterized2(0, FONT_NORMAL_COPY_1, titleText, xOffset, 0, TEXT_SKIP_DRAW, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY);
    PutWindowTilemap(0);
    CopyWindowToVram(0, COPYWIN_FULL);
}

static void EC_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16))
{
    if (fontId == FONT_NORMAL_COPY_1)
        y += 2;
    AddTextPrinterParameterized(windowId, fontId, str, x, y, speed, callback);
}

static void EC_AddTextPrinterParameterized2(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, u8 bg, u8 fg, u8 shadow)
{
    u8 color[3];
    if (fontId == FONT_NORMAL_COPY_1)
        y += 2;
    color[0] = bg;
    color[1] = fg;
    color[2] = shadow;
    AddTextPrinterParameterized3(windowId, fontId, x, y, color, speed, str);
}

static void PrintECInstructionsText(void)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 20, 17);
    LoadUserWindowGfx(1, 1, BG_PLTT_ID(14));
    DrawTextBorderOuter(1, 1, 14);
    PrintECInterfaceTextById(0);
    PutWindowTilemap(1);
    CopyBgTilemapBufferToVram(0);
}

static void PrintECInterfaceTextById(u8 direction)
{
    const u8 *text2 = NULL;
    const u8 *text1 = NULL;
    switch (direction)
    {
    case 0:
        GetEasyChatInstructionsText(&text1, &text2);
        break;
    case 2:
        GetEasyChatConfirmCancelText(&text1, &text2);
        break;
    case 3:
        GetEasyChatConfirmText(&text1, &text2);
        break;
    case 1:
        GetEasyChatConfirmDeletionText(&text1, &text2);
        break;
    }

    FillWindowPixelBuffer(1, PIXEL_FILL(1));
    if (text1)
        EC_AddTextPrinterParameterized(1, FONT_NORMAL_COPY_1, text1, 0, 0, TEXT_SKIP_DRAW, NULL);

    if (text2)
        EC_AddTextPrinterParameterized(1, FONT_NORMAL_COPY_1, text2, 0, 16, TEXT_SKIP_DRAW, NULL);

    CopyWindowToVram(1, COPYWIN_FULL);
}

static void EC_CreateYesNoMenuWithInitialCursorPos(u8 initialCursorPos)
{
    CreateYesNoMenu(&sEasyChatYesNoWindowTemplate, FONT_NORMAL_COPY_1, 0, 2, 0x001, 14, initialCursorPos);
}

static void CreatePhraseFrameWindow(void)
{
    u8 frameId;
    struct WindowTemplate template;

    frameId = GetEasyChatScreenFrameId();
    template.bg = 3;
    template.tilemapLeft = sPhraseFrameDimensions[frameId].left;
    template.tilemapTop = sPhraseFrameDimensions[frameId].top;
    template.width = sPhraseFrameDimensions[frameId].width;
    template.height = sPhraseFrameDimensions[frameId].height;
    template.paletteNum = 11;
    template.baseBlock = 0x060;
    sEasyChatGraphicsResources->windowId = AddWindow(&template);
    PutWindowTilemap(sEasyChatGraphicsResources->windowId);
}

static void PrintECFields(void)
{
    u16 *ecWord;
    u8 numColumns, numRows;
    u8 *str;
    u8 frameId;
    int i, j, k;

    ecWord = GetEasyChatWordBuffer();
    numColumns = GetNumColumns();
    numRows = GetNumRows();
    frameId = GetEasyChatScreenFrameId();
    FillWindowPixelBuffer(sEasyChatGraphicsResources->windowId, PIXEL_FILL(1));
    for (i = 0; i < numRows; i++)
    {
        str = sEasyChatGraphicsResources->ecPrintBuffer;
        str[0] = EOS;
        str = StringAppend(str, sText_Clear17);
        for (j = 0; j < numColumns; j++)
        {
            if (*ecWord != 0xFFFF)
            {
                str = CopyEasyChatWord(str, *ecWord);
                ecWord++;
            }
            else
            {
                str = WriteColorChangeControlCode(str, 0, TEXT_COLOR_RED);
                ecWord++;
                for (k = 0; k < 7; k++)
                {
                    *str++ = CHAR_EXTRA_SYMBOL;
                    *str++ = CHAR_UNDERSCORE;
                }

                str = WriteColorChangeControlCode(str, 0, TEXT_COLOR_DARK_GRAY);
            }

            str = StringAppend(str, sText_Clear17);
            if (frameId == 2)
            {
                if (j == 0 && i == 4)
                    break;
            }
        }

        *str = EOS;
        EC_AddTextPrinterParameterized(sEasyChatGraphicsResources->windowId, FONT_NORMAL_COPY_1, sEasyChatGraphicsResources->ecPrintBuffer, 0, i * 16, TEXT_SKIP_DRAW, NULL);
    }

    CopyWindowToVram(sEasyChatGraphicsResources->windowId, COPYWIN_FULL);
}

static void DrawECFrameInTilemapBuffer(u16 *tilemap)
{
    u8 frameId;
    int right, bottom;
    int x, y;

    frameId = GetEasyChatScreenFrameId();
    CpuFastFill(0, tilemap, BG_SCREEN_SIZE);
    if (frameId == 2)
    {
        right = sPhraseFrameDimensions[frameId].left + sPhraseFrameDimensions[frameId].width;
        bottom = sPhraseFrameDimensions[frameId].top + sPhraseFrameDimensions[frameId].height;
        for (y = sPhraseFrameDimensions[frameId].top; y < bottom; y++)
        {
            x = sPhraseFrameDimensions[frameId].left - 1;
            tilemap[y * 32 + x] = 0x1005;
            x++;
            for (; x < right; x++)
                tilemap[y * 32 + x] = 0x1000;

            tilemap[y* 32 + x] = 0x1007;
        }
    }
    else
    {
        y = sPhraseFrameDimensions[frameId].top - 1;
        x = sPhraseFrameDimensions[frameId].left - 1;
        right = sPhraseFrameDimensions[frameId].left + sPhraseFrameDimensions[frameId].width;
        bottom = sPhraseFrameDimensions[frameId].top + sPhraseFrameDimensions[frameId].height;
        tilemap[y * 32 + x] = 0x1001;
        x++;
        for (; x < right; x++)
            tilemap[y * 32 + x] = 0x1002;

        tilemap[y * 32 + x] = 0x1003;
        y++;
        for (; y < bottom; y++)
        {
            x = sPhraseFrameDimensions[frameId].left - 1;
            tilemap[y * 32 + x] = 0x1005;
            x++;
            for (; x < right; x++)
                tilemap[y * 32 + x] = 0x1000;

            tilemap[y* 32 + x] = 0x1007;
        }

        x = sPhraseFrameDimensions[frameId].left - 1;
        tilemap[y * 32 + x] = 0x1009;
        x++;
        for (; x < right; x++)
            tilemap[y * 32 + x] = 0x100A;

        tilemap[y * 32 + x] = 0x100B;
    }
}

static void PutWin2TilemapAndCopyToVram(void)
{
    PutWindowTilemap(2);
    CopyBgTilemapBufferToVram(2);
}

static void PrintECMenuById(u32 id)
{
    InitBg2Scroll();
    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    switch (id)
    {
    case 0:
        PrintECGroupsMenu();
        break;
    case 1:
        PrintEasyChatKeyboardText();
        break;
    case 2:
        PrintECWordsMenu();
        break;
    }

    CopyWindowToVram(2, COPYWIN_GFX);
}

static void PrintECGroupOrAlphaMenu(void)
{
    if (!IsEasyChatAlphaMode())
        PrintECMenuById(0);
    else
        PrintECMenuById(1);
}

static void PrintECGroupsMenu(void)
{
    int i;
    int x, y;

    i = 0;
    y = 96;
    while (1)
    {
        for (x = 0; x < 2; x++)
        {
            u8 groupId = GetSelectedGroupByIndex(i++);
            if (groupId == EC_NUM_GROUPS)
            {
                ScheduleBg2VerticalScroll(GetECSelectGroupRowsAbove(), 0);
                return;
            }

            EC_AddTextPrinterParameterized(2, FONT_NORMAL_COPY_1, GetEasyChatWordGroupName(groupId), x * 84 + 10, y, TEXT_SKIP_DRAW, NULL);
        }

        y += 16;
    }
}

static void PrintEasyChatKeyboardText(void)
{
    u32 i;

    for (i = 0; i < ARRAY_COUNT(sEasyChatKeyboardAlphabet); i++)
        EC_AddTextPrinterParameterized(2, FONT_NORMAL_COPY_1, sEasyChatKeyboardAlphabet[i], 10, 96 + i * 16, TEXT_SKIP_DRAW, NULL);
}

static void PrintECWordsMenu(void)
{
    PrintECRowsWin2(0, 4);
}

static void UpdateWin2PrintWordsScrollDown(void)
{
    u8 rowsAbove = GetECSelectWordRowsAbove() + 3;
    ClearECRowsWin2(rowsAbove, 1);
    PrintECRowsWin2(rowsAbove, 1);
}

static void UpdateWin2PrintWordsScrollUp(void)
{
    u8 rowsAbove = GetECSelectWordRowsAbove();
    ClearECRowsWin2(rowsAbove, 1);
    PrintECRowsWin2(rowsAbove, 1);
}

static void UpdateWin2PrintWordsScrollPageDown(void)
{
    u8 row = GetECSelectWordRowsAbove();
    u8 maxrow = row + 4;
    u8 numrowsplus1 = GetECSelectWordNumRows() + 1;
    if (maxrow > numrowsplus1)
        maxrow = numrowsplus1;

    if (row < maxrow)
    {
        u8 remrow = maxrow - row;
        ClearECRowsWin2(row, remrow);
        PrintECRowsWin2(row, remrow);
    }
}

static void UpdateWin2PrintWordsScrollPageUp(void)
{
    u8 row = GetECSelectWordRowsAbove();
    u8 maxrow = GetBg2ScrollRow();
    if (row < maxrow)
    {
        u8 remrow = maxrow - row;
        ClearECRowsWin2(row, remrow);
        PrintECRowsWin2(row, remrow);
    }
}

static void PrintECRowsWin2(u8 row, u8 remrow)
{
    int i, j;
    u16 easyChatWord;
    u8 *str;
    int y;
    u8 y_;
    int ecWordIdx;

    ecWordIdx = row * 2;
    y = (row * 16 + 96) & 0xFF;

    for (i = 0; i < remrow; i++)
    {
        for (j = 0; j < 2; j++)
        {
            // FIXME: Dumb trick needed to match
            y_ = y << 18 >> 18;
            easyChatWord = GetDisplayedWordByIndex(ecWordIdx++);
            if (easyChatWord != 0xFFFF)
            {

                CopyEasyChatWordPadded(sEasyChatGraphicsResources->ecPaddedWordBuffer, easyChatWord, 0);

                EC_AddTextPrinterParameterized(2, FONT_NORMAL_COPY_1, sEasyChatGraphicsResources->ecPaddedWordBuffer, (j * 13 + 3) * 8, y_, TEXT_SKIP_DRAW, NULL);
            }
        }
        y += 16;

    }

    CopyWindowToVram(2, COPYWIN_GFX);
}

static void ClearECRowsWin2(u8 row, u8 remrow)
{
    int y;
    int totalHeight;
    int heightWrappedAround;
    int heightToBottom;

    y = (row * 16 + 96) & 0xFF;
    heightToBottom = remrow * 16;
    totalHeight = y + heightToBottom;
    if (totalHeight > 255)
    {
        heightWrappedAround = totalHeight - 256;
        heightToBottom = 256 - y;
    }
    else
    {
        heightWrappedAround = 0;
    }

    FillWindowPixelRect(2, PIXEL_FILL(1), 0, y, 224, heightToBottom);
    if (heightWrappedAround)
        FillWindowPixelRect(2, PIXEL_FILL(1), 0, 0, 224, heightWrappedAround);
}

static void ClearWin2AndCopyToVram(void)
{
    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    CopyWindowToVram(2, COPYWIN_GFX);
}

static void StartWin2FrameAnim(int animNo)
{
    switch (animNo)
    {
    case 0:
        sEasyChatGraphicsResources->frameAnimIdx = 0;
        sEasyChatGraphicsResources->frameAnimTarget = 10;
        break;
    case 1:
        sEasyChatGraphicsResources->frameAnimIdx = 9;
        sEasyChatGraphicsResources->frameAnimTarget = 0;
        break;
    case 2:
        sEasyChatGraphicsResources->frameAnimIdx = 11;
        sEasyChatGraphicsResources->frameAnimTarget = 17;
        break;
    case 3:
        sEasyChatGraphicsResources->frameAnimIdx = 17;
        sEasyChatGraphicsResources->frameAnimTarget = 0;
        break;
    case 4:
        sEasyChatGraphicsResources->frameAnimIdx = 17;
        sEasyChatGraphicsResources->frameAnimTarget = 10;
        break;
    case 5:
        sEasyChatGraphicsResources->frameAnimIdx = 18;
        sEasyChatGraphicsResources->frameAnimTarget = 22;
        break;
    case 6:
        sEasyChatGraphicsResources->frameAnimIdx = 22;
        sEasyChatGraphicsResources->frameAnimTarget = 18;
        break;
    }

    sEasyChatGraphicsResources->frameAnimDelta = sEasyChatGraphicsResources->frameAnimIdx < sEasyChatGraphicsResources->frameAnimTarget ? 1 : -1;
}

static bool8 AnimateFrameResize(void)
{
    if (sEasyChatGraphicsResources->frameAnimIdx == sEasyChatGraphicsResources->frameAnimTarget)
        return FALSE;

    sEasyChatGraphicsResources->frameAnimIdx += sEasyChatGraphicsResources->frameAnimDelta;
    RedrawFrameByIndex(sEasyChatGraphicsResources->frameAnimIdx);
    return sEasyChatGraphicsResources->frameAnimIdx != sEasyChatGraphicsResources->frameAnimTarget;
}

static void RedrawFrameByIndex(u8 direction)
{
    FillBgTilemapBufferRect_Palette0(1, 0, 0, 10, 30, 10);
    switch (direction)
    {
    case 0:
        break;
    case 1:
        RedrawFrameByRect(11, 14, 3, 2);
        break;
    case 2:
        RedrawFrameByRect(9, 14, 7, 2);
        break;
    case 3:
        RedrawFrameByRect(7, 14, 11, 2);
        break;
    case 4:
        RedrawFrameByRect(5, 14, 15, 2);
        break;
    case 5:
        RedrawFrameByRect(3, 14, 19, 2);
        break;
    case 6:
        RedrawFrameByRect(1, 14, 23, 2);
        break;
    case 7:
        RedrawFrameByRect(1, 13, 23, 4);
        break;
    case 8:
        RedrawFrameByRect(1, 12, 23, 6);
        break;
    case 9:
        RedrawFrameByRect(1, 11, 23, 8);
        break;
    case 10:
        RedrawFrameByRect(1, 10, 23, 10);
        break;
    case 11:
        RedrawFrameByRect(1, 10, 24, 10);
        break;
    case 12:
        RedrawFrameByRect(1, 10, 25, 10);
        break;
    case 13:
        RedrawFrameByRect(1, 10, 26, 10);
        break;
    case 14:
        RedrawFrameByRect(1, 10, 27, 10);
        break;
    case 15:
        RedrawFrameByRect(1, 10, 28, 10);
        break;
    case 16:
        RedrawFrameByRect(1, 10, 29, 10);
        break;
    case 17:
        RedrawFrameByRect(0, 10, 30, 10);
        break;
    case 18:
        RedrawFrameByRect(1, 10, 23, 10);
        break;
    case 19:
        RedrawFrameByRect(1, 11, 23, 8);
        break;
    case 20:
        RedrawFrameByRect(1, 12, 23, 6);
        break;
    case 21:
        RedrawFrameByRect(1, 13, 23, 4);
        break;
    case 22:
        RedrawFrameByRect(1, 14, 23, 2);
        break;
    }

    CopyBgTilemapBufferToVram(1);
}

static void RedrawFrameByRect(int left, int top, int width, int height)
{
    u16 *tilemap;
    int right;
    int bottom;
    int x, y;

    tilemap = sEasyChatGraphicsResources->bg1TilemapBuffer;
    right = left + width - 1;
    bottom = top + height - 1;
    x = left;
    y = top;
    tilemap[y * 32 + x] = 0x4001;
    x++;
    for (; x < right; x++)
        tilemap[y * 32 + x] = 0x4002;

    tilemap[y * 32 + x] = 0x4003;
    y++;
    for (; y < bottom; y++)
    {
        tilemap[y * 32 + left] = 0x4005;
        x = left + 1;
        for (; x < right; x++)
            tilemap[y * 32 + x] = 0x4000;

        tilemap[y * 32 + x] = 0x4007;
    }

    tilemap[y * 32 + left] = 0x4009;
    x = left + 1;
    for (; x < right; x++)
        tilemap[y * 32 + x] = 0x400A;

    tilemap[y * 32 + x] = 0x400B;
    SetRegWin0Coords((left + 1) * 8, (top + 1) * 8, (width - 2) * 8, (height - 2) * 8);
}

static void InitBg2Scroll(void)
{
    ChangeBgY(2, 0x800, 0);
    sEasyChatGraphicsResources->bg2ScrollRow = 0;
}

static void ScheduleBg2VerticalScroll(s16 direction, u8 speed)
{
    int bgY;
    s16 totalDelta;

    bgY = GetBgY(2);
    sEasyChatGraphicsResources->bg2ScrollRow += direction;
    totalDelta = direction * 16;
    bgY += totalDelta << 8;
    if (speed)
    {
        sEasyChatGraphicsResources->tgtBgY = bgY;
        sEasyChatGraphicsResources->deltaBgY = speed * 256;
        if (totalDelta < 0)
            sEasyChatGraphicsResources->deltaBgY = -sEasyChatGraphicsResources->deltaBgY;
    }
    else
    {
        ChangeBgY(2, bgY, 0);
    }
}

static bool8 AnimateBg2VerticalScroll(void)
{
    int bgY;

    bgY = GetBgY(2);
    if (bgY == sEasyChatGraphicsResources->tgtBgY)
    {
        return FALSE;
    }
    else
    {
        ChangeBgY(2, sEasyChatGraphicsResources->deltaBgY, 1);
        return TRUE;
    }
}

static int GetBg2ScrollRow(void)
{
    return sEasyChatGraphicsResources->bg2ScrollRow;
}

static void SetRegWin0Coords(u8 left, u8 top, u8 width, u8 height)
{
    u16 horizontalDimensions = WIN_RANGE(left, left + width);
    u16 verticalDimensions = WIN_RANGE(top, top + height);
    SetGpuReg(REG_OFFSET_WIN0H, horizontalDimensions);
    SetGpuReg(REG_OFFSET_WIN0V, verticalDimensions);
}

static void LoadSpriteGfx(void)
{
    u32 i;

    LoadSpriteSheets(sEasyChatSpriteSheets);
    LoadSpritePalettes(sEasyChatSpritePalettes);
    for (i = 0; i < NELEMS(sEasyChatCompressedSpriteSheets); i++)
        LoadCompressedSpriteSheet(&sEasyChatCompressedSpriteSheets[i]);
}

static void CreateSelectDestFieldCursorSprite(void)
{
    u8 frameId = GetEasyChatScreenFrameId();
    s16 x = sPhraseFrameDimensions[frameId].left * 8 + 13;
    s16 y = (sPhraseFrameDimensions[frameId].top + 1) * 8 + 1;
    u8 spriteId = CreateSprite(&sSpriteTemplate_TriangleCursor, x, y, 2);
    sEasyChatGraphicsResources->selectDestFieldCursorSprite = &gSprites[spriteId];
    gSprites[spriteId].data[1] = 1;
}

static void SpriteCB_BounceCursor(struct Sprite *sprite)
{
    if (sprite->data[1])
    {
        if (++sprite->data[0] > 2)
        {
            sprite->data[0] = 0;
            if (++sprite->x2 > 0)
                sprite->x2 = -6;
        }
    }
}

static void SetSelectDestFieldCursorSpritePosAndResetAnim(u8 x, u8 y)
{
    sEasyChatGraphicsResources->selectDestFieldCursorSprite->x = x;
    sEasyChatGraphicsResources->selectDestFieldCursorSprite->y = y;
    sEasyChatGraphicsResources->selectDestFieldCursorSprite->x2 = 0;
    sEasyChatGraphicsResources->selectDestFieldCursorSprite->data[0] = 0;
}

static void FreezeSelectDestFieldCursorSprite(void)
{
    sEasyChatGraphicsResources->selectDestFieldCursorSprite->data[0] = 0;
    sEasyChatGraphicsResources->selectDestFieldCursorSprite->data[1] = 0;
    sEasyChatGraphicsResources->selectDestFieldCursorSprite->x2 = 0;
}

static void UnfreezeSelectDestFieldCursorSprite(void)
{
    sEasyChatGraphicsResources->selectDestFieldCursorSprite->data[1] = 1;
}

static void CreateRedRectangularCursorSpritePair(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_RectangleCursor, 0, 0, 3);
    sEasyChatGraphicsResources->rectCursorSpriteRight = &gSprites[spriteId];
    sEasyChatGraphicsResources->rectCursorSpriteRight->x2 = 32;

    spriteId = CreateSprite(&sSpriteTemplate_RectangleCursor, 0, 0, 3);
    sEasyChatGraphicsResources->rectCursorSpriteLeft = &gSprites[spriteId];
    sEasyChatGraphicsResources->rectCursorSpriteLeft->x2 = -32;

    sEasyChatGraphicsResources->rectCursorSpriteRight->hFlip = TRUE;
    EC_MoveCursor();
}

static void DestroyRedRectangularCursor(void)
{
    DestroySprite(sEasyChatGraphicsResources->rectCursorSpriteRight);
    sEasyChatGraphicsResources->rectCursorSpriteRight = NULL;
    DestroySprite(sEasyChatGraphicsResources->rectCursorSpriteLeft);
    sEasyChatGraphicsResources->rectCursorSpriteLeft = NULL;
}

static void EC_MoveCursor(void)
{
    u8 x;
    u8 y;

    if (sEasyChatGraphicsResources->rectCursorSpriteRight && sEasyChatGraphicsResources->rectCursorSpriteLeft)
    {
        GetECSelectGroupCursorCoords(&x, &y);
        if (!IsEasyChatAlphaMode())
            MoveCursor_Group(x, y);
        else
            MoveCursor_Alpha(x, y);
    }
}

static void MoveCursor_Group(s8 x, s8 y)
{
    if (x != -1)
    {
        StartSpriteAnim(sEasyChatGraphicsResources->rectCursorSpriteRight, RECTCURSOR_ANIM_ON_GROUP);
        sEasyChatGraphicsResources->rectCursorSpriteRight->x = x * 84 + 58;
        sEasyChatGraphicsResources->rectCursorSpriteRight->y = y * 16 + 96;

        StartSpriteAnim(sEasyChatGraphicsResources->rectCursorSpriteLeft, RECTCURSOR_ANIM_ON_GROUP);
        sEasyChatGraphicsResources->rectCursorSpriteLeft->x = x * 84 + 58;
        sEasyChatGraphicsResources->rectCursorSpriteLeft->y = y * 16 + 96;
    }
    else
    {
        StartSpriteAnim(sEasyChatGraphicsResources->rectCursorSpriteRight, RECTCURSOR_ANIM_ON_BUTTON);
        sEasyChatGraphicsResources->rectCursorSpriteRight->x = 216;
        sEasyChatGraphicsResources->rectCursorSpriteRight->y = y * 16 + 112;

        StartSpriteAnim(sEasyChatGraphicsResources->rectCursorSpriteLeft, RECTCURSOR_ANIM_ON_BUTTON);
        sEasyChatGraphicsResources->rectCursorSpriteLeft->x = 216;
        sEasyChatGraphicsResources->rectCursorSpriteLeft->y = y * 16 + 112;
    }
}

static void MoveCursor_Alpha(s8 cursorX, s8 cursorY)
{
    int anim;
    int x, y;

    if (cursorX != -1)
    {
        y = cursorY * 16 + 96;
        x = 32;
        if (cursorX == 6 && cursorY == 0)
        {
            x = 157;
            anim = RECTCURSOR_ANIM_ON_OTHERS;
        }
        else
        {
            x += sAlphabetKeyboardColumnOffsets[cursorX < ARRAY_COUNT(sAlphabetKeyboardColumnOffsets) ? cursorX : 0];
            anim = RECTCURSOR_ANIM_ON_LETTER;
        }

        StartSpriteAnim(sEasyChatGraphicsResources->rectCursorSpriteRight, anim);
        sEasyChatGraphicsResources->rectCursorSpriteRight->x = x;
        sEasyChatGraphicsResources->rectCursorSpriteRight->y = y;

        StartSpriteAnim(sEasyChatGraphicsResources->rectCursorSpriteLeft, anim);
        sEasyChatGraphicsResources->rectCursorSpriteLeft->x = x;
        sEasyChatGraphicsResources->rectCursorSpriteLeft->y = y;
    }
    else
    {
        StartSpriteAnim(sEasyChatGraphicsResources->rectCursorSpriteRight, RECTCURSOR_ANIM_ON_BUTTON);
        sEasyChatGraphicsResources->rectCursorSpriteRight->x = 216;
        sEasyChatGraphicsResources->rectCursorSpriteRight->y = cursorY * 16 + 112;

        StartSpriteAnim(sEasyChatGraphicsResources->rectCursorSpriteLeft, RECTCURSOR_ANIM_ON_BUTTON);
        sEasyChatGraphicsResources->rectCursorSpriteLeft->x = 216;
        sEasyChatGraphicsResources->rectCursorSpriteLeft->y = cursorY * 16 + 112;
    }
}

static void CreateSelectWordCursorSprite(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_TriangleCursor, 0, 0, 4);
    sEasyChatGraphicsResources->selectWordCursorSprite = &gSprites[spriteId];
    sEasyChatGraphicsResources->selectWordCursorSprite->callback = SpriteCB_SelectWordCursorSprite;
    sEasyChatGraphicsResources->selectWordCursorSprite->oam.priority = 2;
    SetSelectWordCursorSpritePos();
}

static void SpriteCB_SelectWordCursorSprite(struct Sprite *sprite)
{
    if (++sprite->data[0] > 2)
    {
        sprite->data[0] = 0;
        if (++sprite->x2 > 0)
            sprite->x2 = -6;
    }
}

static void SetSelectWordCursorSpritePos(void)
{
    s8 cursorX, cursorY;
    u8 x, y;

    GetECSelectWordCursorCoords(&cursorX, &cursorY);
    x = cursorX * 13 + 3;
    y = cursorY * 2 + 11;
    SetSelectWordCursorSpritePosExplicit(x, y);
}

static void SetSelectWordCursorSpritePosExplicit(u8 x, u8 y)
{
    if (sEasyChatGraphicsResources->selectWordCursorSprite)
    {
        sEasyChatGraphicsResources->selectWordCursorSprite->x = x * 8 + 4;
        sEasyChatGraphicsResources->selectWordCursorSprite->y = (y + 1) * 8 + 1;
        sEasyChatGraphicsResources->selectWordCursorSprite->x2 = 0;
        sEasyChatGraphicsResources->selectWordCursorSprite->data[0] = 0;
    }
}

static void DestroySelectWordCursorSprite(void)
{
    if (sEasyChatGraphicsResources->selectWordCursorSprite)
    {
        DestroySprite(sEasyChatGraphicsResources->selectWordCursorSprite);
        sEasyChatGraphicsResources->selectWordCursorSprite = NULL;
    }
}

static void CreateSelectGroupHelpSprite(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_ButtonWindow, 208, 128, 6);
    sEasyChatGraphicsResources->selectGroupHelpSprite = &gSprites[spriteId];
    sEasyChatGraphicsResources->selectGroupHelpSprite->x2 = -64;

    spriteId = CreateSprite(&sSpriteTemplate_ModeWindow, 208, 80, 5);
    sEasyChatGraphicsResources->modeIconsSprite = &gSprites[spriteId];
    sEasyChatGraphicsResources->modeIconState = 0;
}

static bool8 AnimateSeletGroupModeAndHelpSpriteEnter(void)
{
    switch (sEasyChatGraphicsResources->modeIconState)
    {
    default:
        return FALSE;
    case 0:
        sEasyChatGraphicsResources->selectGroupHelpSprite->x2 += 8;
        if (sEasyChatGraphicsResources->selectGroupHelpSprite->x2 >= 0)
        {
            sEasyChatGraphicsResources->selectGroupHelpSprite->x2 = 0;
            if (!IsEasyChatAlphaMode())
                StartSpriteAnim(sEasyChatGraphicsResources->modeIconsSprite, MODEWINDOW_ANIM_TO_GROUP);
            else
                StartSpriteAnim(sEasyChatGraphicsResources->modeIconsSprite, MODEWINDOW_ANIM_TO_ALPHABET);

            sEasyChatGraphicsResources->modeIconState++;
        }
        break;
    case 1:
        if (sEasyChatGraphicsResources->modeIconsSprite->animEnded)
        {
            sEasyChatGraphicsResources->modeIconState = 2;
            return FALSE;
        }
    }

    return TRUE;
}

static void StartModeIconHidingAnimation(void)
{
    sEasyChatGraphicsResources->modeIconState = 0;
    StartSpriteAnim(sEasyChatGraphicsResources->modeIconsSprite, MODEWINDOW_ANIM_TO_HIDDEN);
}

static bool8 RunModeIconHidingAnimation(void)
{
    switch (sEasyChatGraphicsResources->modeIconState)
    {
    default:
        return FALSE;
    case 0:
        if (sEasyChatGraphicsResources->modeIconsSprite->animEnded)
            sEasyChatGraphicsResources->modeIconState = 1;
        break;
    case 1:
        sEasyChatGraphicsResources->selectGroupHelpSprite->x2 -= 8;
        if (sEasyChatGraphicsResources->selectGroupHelpSprite->x2 <= -64)
        {
            DestroySprite(sEasyChatGraphicsResources->modeIconsSprite);
            DestroySprite(sEasyChatGraphicsResources->selectGroupHelpSprite);
            sEasyChatGraphicsResources->modeIconsSprite = NULL;
            sEasyChatGraphicsResources->selectGroupHelpSprite = NULL;
            sEasyChatGraphicsResources->modeIconState++;
            return FALSE;
        }
    }

    return TRUE;
}

static void ShrinkModeIconsSprite(void)
{
    StartSpriteAnim(sEasyChatGraphicsResources->modeIconsSprite, MODEWINDOW_ANIM_TRANSITION);
}

static void ShowModeIconsSprite(void)
{
    if (!IsEasyChatAlphaMode())
        StartSpriteAnim(sEasyChatGraphicsResources->modeIconsSprite, MODEWINDOW_ANIM_TO_GROUP);
    else
        StartSpriteAnim(sEasyChatGraphicsResources->modeIconsSprite, MODEWINDOW_ANIM_TO_ALPHABET);
}

static bool8 ModeIconsSpriteAnimIsEnded(void)
{
    return !sEasyChatGraphicsResources->modeIconsSprite->animEnded;
}

static void CreateVerticalScrollArrowSprites(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_ScrollIndicator, 96, 80, 0);
    if (spriteId != MAX_SPRITES)
        sEasyChatGraphicsResources->upTriangleCursorSprite = &gSprites[spriteId];

    spriteId = CreateSprite(&sSpriteTemplate_ScrollIndicator, 96, 156, 0);
    if (spriteId != MAX_SPRITES)
    {
        sEasyChatGraphicsResources->downTriangleCursorSprite = &gSprites[spriteId];
        sEasyChatGraphicsResources->downTriangleCursorSprite->vFlip = TRUE;
    }

    HideVerticalScrollArrowSprites();
}

static void UpdateVerticalScrollArrowVisibility(void)
{
    sEasyChatGraphicsResources->upTriangleCursorSprite->invisible = !ShouldDrawECUpArrow();
    sEasyChatGraphicsResources->downTriangleCursorSprite->invisible = !ShouldDrawECDownArrow();
}

static void HideVerticalScrollArrowSprites(void)
{
    sEasyChatGraphicsResources->upTriangleCursorSprite->invisible = TRUE;
    sEasyChatGraphicsResources->downTriangleCursorSprite->invisible = TRUE;
}

static void UpdateVerticalScrollArrowSpriteXPos(int direction)
{
    if (!direction)
    {
        // Group select
        sEasyChatGraphicsResources->upTriangleCursorSprite->x = 96;
        sEasyChatGraphicsResources->downTriangleCursorSprite->x = 96;
    }
    else
    {
        // Word select
        sEasyChatGraphicsResources->upTriangleCursorSprite->x = 120;
        sEasyChatGraphicsResources->downTriangleCursorSprite->x = 120;
    }
}

static void CreateStartSelectButtonsSprites(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_StartSelectButtons, 220, 84, 1);
    if (spriteId != MAX_SPRITES)
        sEasyChatGraphicsResources->startPgUpButtonSprite = &gSprites[spriteId];

    spriteId = CreateSprite(&sSpriteTemplate_StartSelectButtons, 220, 156, 1);
    if (spriteId != MAX_SPRITES)
    {
        sEasyChatGraphicsResources->selectPgDnButtonSprite = &gSprites[spriteId];
        StartSpriteAnim(sEasyChatGraphicsResources->selectPgDnButtonSprite, 1);
    }

    HideStartSelectButtonSprites();
}

static void UpdateStartSelectButtonSpriteVisibility(void)
{
    sEasyChatGraphicsResources->startPgUpButtonSprite->invisible = !ShouldDrawECUpArrow();
    sEasyChatGraphicsResources->selectPgDnButtonSprite->invisible = !ShouldDrawECDownArrow();
}

static void HideStartSelectButtonSprites(void)
{
    sEasyChatGraphicsResources->startPgUpButtonSprite->invisible = TRUE;
    sEasyChatGraphicsResources->selectPgDnButtonSprite->invisible = TRUE;
}

static void CreateFooterWindow(void)
{
    u16 windowId;
    struct WindowTemplate template;
    template.bg = 3;
    template.tilemapLeft = 4;
    template.tilemapTop = 11;
    template.width = 24;
    template.height = 2;
    template.paletteNum = 11;
    template.baseBlock = 0x030;
    windowId = AddWindow(&template);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    EC_AddTextPrinterParameterized(windowId, FONT_NORMAL_COPY_1, gText_DelAllCancelOk, 0, 0, 0, NULL);
    PutWindowTilemap(windowId);
}
