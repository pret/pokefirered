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

#define GFXTAG_TRIANGLE_CURSOR               0
#define GFXTAG_RECTANGLE_CURSOR              1
#define GFXTAG_SCROLL_INDICATOR              2
#define GFXTAG_START_SELECT_BUTTONS          3
#define GFXTAG_MODE_WINDOW                   4
#define GFXTAG_RS_INTERVIEW_FRAME            5
#define GFXTAG_BUTTON_WINDOW                 6

#define PALTAG_TRIANGLE_CURSOR               0
#define PALTAG_RECTANGLE_CURSOR              1
#define PALTAG_MISC_UI                       2
#define PALTAG_RS_INTERVIEW_FRAME            3

enum {
    ECWIN_TITLE,
    ECWIN_INSTRUCTIONS,
    ECWIN_LOWER,
};

enum {
    MSG_INSTRUCTIONS,
    MSG_CONFIRM_DELETE,
    MSG_CONFIRM_EXIT,
    MSG_CONFIRM,
};

// Types of animations for the lower window (keyboard/word select), given to InitLowerWindowAnim
enum {
    WINANIM_OPEN_KEYBOARD,
    WINANIM_CLOSE_KEYBOARD,
    WINANIM_OPEN_WORD_SELECT,
    WINANIM_CLOSE_WORD_SELECT,
    WINANIM_RETURN_TO_KEYBOARD,
    WINANIM_KEYBOARD_SWITCH_OUT,
    WINANIM_KEYBOARD_SWITCH_IN,
};

// IDs for supplementary Easy Chat functions
// Returned by the input handler functions, and run
// in the main task (MAINSTATE_RUN_FUNC)
enum {
    ECFUNC_NONE,
    ECFUNC_REPRINT_PHRASE,
    ECFUNC_UPDATE_MAIN_CURSOR,
    ECFUNC_UPDATE_MAIN_CURSOR_ON_BUTTONS,
    ECFUNC_PROMPT_DELETE_ALL,
    ECFUNC_PROMPT_EXIT,
    ECFUNC_PROMPT_CONFIRM,
    ECFUNC_CLOSE_PROMPT,
    ECFUNC_CLOSE_PROMPT_AFTER_DELETE,
    ECFUNC_OPEN_KEYBOARD,
    ECFUNC_CLOSE_KEYBOARD,
    ECFUNC_OPEN_WORD_SELECT,
    ECFUNC_CLOSE_WORD_SELECT,
    ECFUNC_RETURN_TO_KEYBOARD,
    ECFUNC_UPDATE_KEYBOARD_CURSOR,
    ECFUNC_GROUP_NAMES_SCROLL_DOWN,
    ECFUNC_GROUP_NAMES_SCROLL_UP,
    ECFUNC_UPDATE_WORD_SELECT_CURSOR,
    ECFUNC_WORD_SELECT_SCROLL_UP,
    ECFUNC_WORD_SELECT_SCROLL_DOWN,
    ECFUNC_WORD_SELECT_PAGE_UP,
    ECFUNC_WORD_SELECT_PAGE_DOWN,
    ECFUNC_SWITCH_KEYBOARD_MODE,
};

struct EasyChatScreenControl
{
    u16 funcState;
    u16 windowId;
    u16 currentFuncId;
    u8 curWindowAnimState;
    u8 destWindowAnimState;
    s8 windowAnimStateDir;
    u8 modeWindowState;
    u8 phrasePrintBuffer[193];
    u8 wordSelectPrintBuffer[512];
    u16 scrollOffset;
    int scrollDest;
    int scrollSpeed;
    struct Sprite * mainCursorSprite;
    struct Sprite * rectangleCursorSpriteRight;
    struct Sprite * rectangleCursorSpriteLeft;
    struct Sprite * wordSelectCursorSprite;
    struct Sprite * buttonWindowSprite;
    struct Sprite * modeWindowSprite;
    struct Sprite * scrollIndicatorUpSprite;
    struct Sprite * scrollIndicatorDownSprite;
    struct Sprite * startButtonSprite;
    struct Sprite * selectButtonSprite;
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

static EWRAM_DATA struct EasyChatScreenControl * sScreenControl = NULL;

static bool8 ECCmd_ReprintPhrase(void);
static bool8 ECCmd_UpdateMainCursor(void);
static bool8 ECCmd_UpdateMainCursorOnButtons(void);
static bool8 ECCmd_ShowConfirmExitPrompt(void);
static bool8 ECCmd_ShowConfirmPrompt(void);
static bool8 ECCmd_ShowConfirmDeleteAllPrompt(void);
static bool8 ECCmd_ClosePrompt(void);
static bool8 ECCmd_ClosePromptAfterDeleteAll(void);
static bool8 ECCmd_OpenKeyboard(void);
static bool8 ECCmd_CloseKeyboard(void);
static bool8 ECCmd_SwitchKeyboardMode(void);
static bool8 ECCmd_UpdateKeyboardCursor(void);
static bool8 ECCmd_GroupNamesScrollDown(void);
static bool8 ECCmd_GroupNamesScrollUp(void);
static bool8 ECCmd_OpenWordSelect(void);
static bool8 ECCmd_CloseWordSelect(void);
static bool8 ECCmd_ReturnToKeyboard(void);
static bool8 ECCmd_UpdateWordSelectCursor(void);
static bool8 ECCmd_WordSelectScrollDown(void);
static bool8 ECCmd_WordSelectScrollUp(void);
static bool8 ECCmd_WordSelectPageScrollDown(void);
static bool8 ECCmd_WordSelectPageScrollUp(void);
static bool8 InitEasyChatScreenControl_(void);
static void SetGpuRegsForEasyChatInit(void);
static void LoadEasyChatPals(void);
static void EC_PrintTitle(void);
static void PrintEasyChatTextWithColors(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, u8 bg, u8 fg, u8 shadow);
static void EC_PrintInitialInstructions(void);
static void PrintEasyChatStdMessage(u8 message);
static void CreateEasyChatYesNoMenu(u8 initialCursorPos);
static void AddPhraseWindow(void);
static void EC_PrintCurrentPhrase(void);
static void BufferFrameTilemap(u16 *tilemap);
static void EC_DrawLowerWindow(void);
static void InitLowerWindowText(u32 id);
static void PrintKeyboardText(void);
static void PrintECGroupsMenu(void);
static void PrintEasyChatKeyboardText(void);
static void PrintECWordsMenu(void);
static void PrintWordSelectNextRowDown(void);
static void PrintWordSelectNextRowUp(void);
static void PrintWordSelectRowsPageDown(void);
static void PrintWordSelectRowsPageUp(void);
static void PrintWordSelectText(u8 scrollOffset, u8 numRows);
static void EraseWordSelectRows(u8 row, u8 remrow);
static void ClearWordSelectWindow(void);
static void InitLowerWindowAnim(int anims);
static bool8 UpdateLowerWindowAnim(void);
static void DrawLowerWindowFrame(u8 direction);
static void BufferLowerWindowFrame(int left, int top, int width, int height);
static void ResetLowerWindowScroll(void);
static void InitLowerWindowScroll(s16 direction, u8 speed);
static bool8 UpdateLowerWindowScroll(void);
static int GetLowerWindowScrollOffset(void);
static void SetWindowDimensions(u8 left, u8 top, u8 width, u8 height);
static void LoadEasyChatGfx(void);
static void EC_CreateMainCursorSprite(void);
static void SpriteCB_BounceCursor(struct Sprite * sprite);
static void EC_SetMainCursorPos(u8 x, u8 y);
static void StopMainCursorAnim(void);
static void StartMainCursorAnim(void);
static void CreateRectangleCursorSprites(void);
static void DestroyRectangleCursorSprites(void);
static void UpdateRectangleCursorPos(void);
static void MoveCursor_Group(s8 x, s8 y);
static void MoveCursor_Alpha(s8 x, s8 y);
static void CreateSelectWordCursorSprite(void);
static void SpriteCB_SelectWordCursorSprite(struct Sprite * sprite);
static void UpdateWordSelectCursorPos(void);
static void SetSelectWordCursorSpritePosExplicit(u8 x, u8 y);
static void DestroySelectWordCursorSprite(void);
static void CreateSideWindowSprites(void);
static bool8 ShowSideWindow(void);
static void HideModeWindow(void);
static bool8 RunModeIconHidingAnimation(void);
static void SetModeWindowToTransition(void);
static void UpdateModeWindowAnim(void);
static bool8 IsModeWindowAnimActive(void);
static void CreateScrollIndicatorSprites(void);
static void UpdateScrollIndicatorsVisibility(void);
static void HideScrollIndicators(void);
static void SetScrollIndicatorXPos(int direction);
static void CreateStartSelectButtonsSprites(void);
static void UpdateStartSelectButtonsVisibility(void);
static void HideStartSelectButtons(void);
static void AddMainScreenButtonWindow(void);

static const u16 sTriangleCursor_Pal[] = INCBIN_U16("graphics/link_rfu/unk_843F3F8.gbapal");
static const u16 gEasyChatRectangleCursor_Pal[] = INCBIN_U16("graphics/link_rfu/unk_8E9BD28.gbapal");
static const u16 sTriangleCursor_Gfx[] = INCBIN_U16("graphics/link_rfu/unk_843F3F8.4bpp");
static const u16 sScrollIndicator_Gfx[] = INCBIN_U16("graphics/link_rfu/unk_843F418.4bpp");
static const u16 sStartSelectButtons_Gfx[] = INCBIN_U16("graphics/link_rfu/unk_843F518.4bpp");
static const u16 sRSInterviewFrame_Pal[] = INCBIN_U16("graphics/link_rfu/unk_843F638.gbapal");
static const u32 sRSInterviewFrame_Gfx[] = INCBIN_U32("graphics/link_rfu/unk_843F638.4bpp.lz");
static const u16 sTextInputFrameOrange_Pal[] = INCBIN_U16("graphics/link_rfu/unk_843F76C.gbapal");
static const u16 sTextInputFrameGreen_Pal[] = INCBIN_U16("graphics/link_rfu/unk_843F78C.gbapal");
static const u32 sTextInputFrame_Gfx[] = INCBIN_U32("graphics/link_rfu/unk_843F7AC.4bpp.lz");

static const u16 sTitleText_Pal[] = {
    RGB( 0,  0,  0),
    RGB( 0,  0,  0),
    RGB( 7, 25, 31),
    RGB(21, 21, 29)
};

static const u16 sText_Pal[] = {
    RGB( 0,  0,  0),
    RGB(31, 31, 31),
    RGB(12, 12, 12),
    RGB(27, 26, 27),
    RGB( 8, 17,  9)
};

static const struct EasyChatPhraseFrameDimensions sPhraseFrameDimensions[] = {
    {
        .left = 0x03,
        .top = 0x04,
        .width = 0x18,
        .height = 0x04
    }, {
        .left = 0x01,
        .top = 0x04,
        .width = 0x1b,
        .height = 0x04
    }, {
        .left = 0x03,
        .top = 0x00,
        .width = 0x18,
        .height = 0x0a
    }, {
        .left = 0x06,
        .top = 0x06,
        .width = 0x12,
        .height = 0x04
    }, {
        .left = 0x10,
        .top = 0x04,
        .width = 0x09,
        .height = 0x02
    }, {
        .left = 0x0e,
        .top = 0x04,
        .width = 0x12,
        .height = 0x04
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
    [ECWIN_TITLE] = {
        .bg = 1,
        .tilemapLeft = 7,
        .tilemapTop = 0,
        .width = 16,
        .height = 2,
        .paletteNum = 10,
        .baseBlock = 0x10,
    },
    [ECWIN_INSTRUCTIONS] = {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 15,
        .width = 22,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0xA,
    },
    [ECWIN_LOWER] = {
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

static const u8 sDummyECWord[] = _("{UNDERSCORE}");
static const u8 sText_Clear17[] = _("{CLEAR 17}");

static const u8 *const sEasyChatKeyboardText[] = {
    gText_EasyChatKeyboard_ABCDEFothers,
    gText_EasyChatKeyboard_GHIJKL,
    gText_EasyChatKeyboard_MNOPQRS,
    gText_EasyChatKeyboard_TUVWXYZ
};

static const struct SpriteSheet sEasyChatSpriteSheets[] = {
    {
        .data = sTriangleCursor_Gfx,
        .size = 0x0020,
        .tag = GFXTAG_TRIANGLE_CURSOR
    },
    {
        .data = sScrollIndicator_Gfx,
        .size = 0x0100,
        .tag = GFXTAG_SCROLL_INDICATOR
    },
    {
        .data = sStartSelectButtons_Gfx,
        .size = 0x0100,
        .tag = GFXTAG_START_SELECT_BUTTONS
    },
    {0}
};

static const struct SpritePalette sSpritePalettes[] = {
    {
        .data = sTriangleCursor_Pal,
        .tag = PALTAG_TRIANGLE_CURSOR
    },
    {
        .data = gEasyChatRectangleCursor_Pal,
        .tag = PALTAG_RECTANGLE_CURSOR
    },
    {
        .data = gEasyChatButtonWindow_Pal,
        .tag = PALTAG_MISC_UI
    },
    {
        .data = sRSInterviewFrame_Pal,
        .tag = PALTAG_RS_INTERVIEW_FRAME
    },
    {0}
};

static const struct CompressedSpriteSheet sCompressedSpriteSheets[] = {
    {
        .data = sRSInterviewFrame_Gfx,
        .size = 0x0800,
        .tag = GFXTAG_RS_INTERVIEW_FRAME
    },
    {
        .data = gEasyChatRectangleCursor_Gfx,
        .size = 0x1000,
        .tag = GFXTAG_RECTANGLE_CURSOR
    },
    {
        .data = gEasyChatButtonWindow_Gfx,
        .size = 0x0800,
        .tag = GFXTAG_BUTTON_WINDOW
    },
    {
        .data = gEasyChatMode_Gfx,
        .size = 0x1000,
        .tag = GFXTAG_MODE_WINDOW
    }
};

static const u8 sECDisplay_AlphaModeXCoords[] = {
     0,
    12,
    24,
    56,
    68,
    80,
    92
};

static const struct OamData sOamData_RightTriangleCursor = {
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
    .oam = &sOamData_RightTriangleCursor,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_BounceCursor
};

static const struct OamData sOamData_RedRectangularCursor = {
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

static const union AnimCmd sAnimCmd_RectCursor_Wide[] = {
    ANIMCMD_FRAME(0x00, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_RectCursor_Norm[] = {
    ANIMCMD_FRAME(0x20, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_RectCursor_NormTaller[] = {
    ANIMCMD_FRAME(0x40, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_RectCursor_Narrow[] = {
    ANIMCMD_FRAME(0x60, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_RedRectangularCursor[] = {
    sAnimCmd_RectCursor_Wide,
    sAnimCmd_RectCursor_Norm,
    sAnimCmd_RectCursor_NormTaller,
    sAnimCmd_RectCursor_Narrow
};

static const struct SpriteTemplate sSpriteTemplate_RedRectangularCursor = {
    .tileTag = GFXTAG_RECTANGLE_CURSOR,
    .paletteTag = PALTAG_RECTANGLE_CURSOR,
    .oam = &sOamData_RedRectangularCursor,
    .anims = sAnimTable_RedRectangularCursor,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_BounceCursor
};

static const struct OamData sOamData_EasyChatModeIcons = {
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

static const union AnimCmd sAnim_EasyChatModeIcon_Hidden[] = {
    ANIMCMD_FRAME(0x60, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_EasyChatModeIcon_ToGroupMode[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnim_EasyChatModeIcon_ToAlphaMode[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_FRAME(0x00, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnim_EasyChatModeIcon_ToHidden[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_FRAME(0x60, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_EasyChatModeIcon_HoldSmall[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_EasyChatModeIcons[] = {
    sAnim_EasyChatModeIcon_Hidden,
    sAnim_EasyChatModeIcon_ToGroupMode,
    sAnim_EasyChatModeIcon_ToAlphaMode,
    sAnim_EasyChatModeIcon_ToHidden,
    sAnim_EasyChatModeIcon_HoldSmall
};

static const struct SpriteTemplate sSpriteTemplate_EasyChatModeIcons = {
    .tileTag = GFXTAG_MODE_WINDOW,
    .paletteTag = PALTAG_MISC_UI,
    .oam = &sOamData_EasyChatModeIcons,
    .anims = sAnimTable_EasyChatModeIcons,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_SelectGroupHelp = {
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

static const struct SpriteTemplate sSpriteTemplate_SelectGroupHelp = {
    .tileTag = GFXTAG_BUTTON_WINDOW,
    .paletteTag = PALTAG_MISC_UI,
    .oam = &sOamData_SelectGroupHelp,
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

bool8 InitEasyChatScreenControl(void)
{
    if (!InitEasyChatScreenControl_())
        return FALSE;
    else
        return TRUE;
}

bool8 LoadEasyChatScreen(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, sEasyChatBgTemplates, NELEMS(sEasyChatBgTemplates));
        SetBgTilemapBuffer(3, sScreenControl->bg3TilemapBuffer);
        SetBgTilemapBuffer(1, sScreenControl->bg1TilemapBuffer);
        InitWindows(sEasyChatWindowTemplates);
        DeactivateAllTextPrinters();
        LoadEasyChatPals();
        SetGpuRegsForEasyChatInit();
        CpuFastFill(0, (void *)OAM, 0x400);
        break;
    case 1:
        DecompressAndLoadBgGfxUsingHeap(3, gEasyChatWindow_Gfx, 0, 0, 0);
        CopyToBgTilemapBuffer(3, gEasyChatWindow_Tilemap, 0, 0);
        AddPhraseWindow();
        AddMainScreenButtonWindow();
        CopyBgTilemapBufferToVram(3);
        break;
    case 2:
        BufferFrameTilemap(sScreenControl->bg1TilemapBuffer);
        DecompressAndLoadBgGfxUsingHeap(1, sTextInputFrame_Gfx, 0, 0, 0);
        CopyBgTilemapBufferToVram(1);
        break;
    case 3:
        EC_PrintTitle();
        EC_PrintInitialInstructions();
        EC_PrintCurrentPhrase();
        EC_DrawLowerWindow();
        break;
    case 4:
        LoadEasyChatGfx();
        EC_CreateMainCursorSprite();
        break;
    case 5:
        if (IsDma3ManagerBusyWithBgCopy())
        {
            return TRUE;
        }
        else
        {
            SetWindowDimensions(0, 0, 0, 0);
            SetGpuReg(REG_OFFSET_WININ, WIN_RANGE(0, 63));
            SetGpuReg(REG_OFFSET_WINOUT, WIN_RANGE(0, 59));
            ShowBg(3);
            ShowBg(1);
            ShowBg(2);
            ShowBg(0);
            CreateScrollIndicatorSprites();
            CreateStartSelectButtonsSprites();
        }
        break;
    default:
        return FALSE;
    }

    sScreenControl->funcState++;
    return TRUE;
}

void FreeEasyChatScreenControl(void)
{
    if (sScreenControl)
        Free(sScreenControl);
}

void StartEasyChatFunction(u16 funcId)
{
    sScreenControl->currentFuncId = funcId;
    sScreenControl->funcState = 0;
    RunEasyChatFunction();
}

bool8 RunEasyChatFunction(void)
{
    switch (sScreenControl->currentFuncId)
    {
    case ECFUNC_NONE:  return FALSE;
    case ECFUNC_REPRINT_PHRASE:  return ECCmd_ReprintPhrase();
    case ECFUNC_UPDATE_MAIN_CURSOR:  return ECCmd_UpdateMainCursor();
    case ECFUNC_UPDATE_MAIN_CURSOR_ON_BUTTONS:  return ECCmd_UpdateMainCursorOnButtons();
    case ECFUNC_PROMPT_DELETE_ALL:  return ECCmd_ShowConfirmDeleteAllPrompt();
    case ECFUNC_PROMPT_EXIT:  return ECCmd_ShowConfirmExitPrompt();
    case ECFUNC_PROMPT_CONFIRM:  return ECCmd_ShowConfirmPrompt();
    case ECFUNC_CLOSE_PROMPT:  return ECCmd_ClosePrompt();
    case ECFUNC_CLOSE_PROMPT_AFTER_DELETE:  return ECCmd_ClosePromptAfterDeleteAll();
    case ECFUNC_OPEN_KEYBOARD:  return ECCmd_OpenKeyboard();
    case ECFUNC_CLOSE_KEYBOARD: return ECCmd_CloseKeyboard();
    case ECFUNC_OPEN_WORD_SELECT: return ECCmd_OpenWordSelect();
    case ECFUNC_CLOSE_WORD_SELECT: return ECCmd_CloseWordSelect();
    case ECFUNC_RETURN_TO_KEYBOARD: return ECCmd_ReturnToKeyboard();
    case ECFUNC_UPDATE_KEYBOARD_CURSOR: return ECCmd_UpdateKeyboardCursor();
    case ECFUNC_GROUP_NAMES_SCROLL_DOWN: return ECCmd_GroupNamesScrollDown();
    case ECFUNC_GROUP_NAMES_SCROLL_UP: return ECCmd_GroupNamesScrollUp();
    case ECFUNC_UPDATE_WORD_SELECT_CURSOR: return ECCmd_UpdateWordSelectCursor();
    case ECFUNC_WORD_SELECT_SCROLL_UP: return ECCmd_WordSelectScrollUp();
    case ECFUNC_WORD_SELECT_SCROLL_DOWN: return ECCmd_WordSelectScrollDown();
    case ECFUNC_WORD_SELECT_PAGE_UP: return ECCmd_WordSelectPageScrollUp();
    case ECFUNC_WORD_SELECT_PAGE_DOWN: return ECCmd_WordSelectPageScrollDown();
    case ECFUNC_SWITCH_KEYBOARD_MODE: return ECCmd_SwitchKeyboardMode();
    default: return FALSE;
    }
}

static bool8 ECCmd_ReprintPhrase(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        EC_PrintCurrentPhrase();
        sScreenControl->funcState++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECCmd_UpdateMainCursor(void)
{
    u8 i;
    u16 *currentPhrase;
    u16 *ecWord;
    u8 frameId;
    u8 cursorColumn, cursorRow, numColumns;
    s16 x;
    int stringWidth;
    int trueStringWidth;
    int y;
    u8 str[64];

    currentPhrase = GetEasyChatWordBuffer();
    frameId = GetEasyChatScreenFrameId();
    cursorColumn = GetMainCursorColumn();
    cursorRow = GetMainCursorRow();
    numColumns = GetNumColumns();
    ecWord = &currentPhrase[cursorRow * numColumns];
    x = 8 * sPhraseFrameDimensions[frameId].left + 13;
    for (i = 0; i < cursorColumn; i++)
    {
        if (*ecWord == 0xFFFF)
        {
            stringWidth = GetStringWidth(1, sDummyECWord, 0) * 7;
        }
        else
        {
            CopyEasyChatWord(str, *ecWord);
            stringWidth = GetStringWidth(1, str, 0);
        }

        trueStringWidth = stringWidth + 17;
        x += trueStringWidth;
        ecWord++;
    }

    y = 8 * (sPhraseFrameDimensions[frameId].top + cursorRow * 2 + 1) + 1;
    EC_SetMainCursorPos(x, y);
    return FALSE;
}

static bool8 ECCmd_UpdateMainCursorOnButtons(void)
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
    EC_SetMainCursorPos(xOffset, 97);
    return FALSE;
}

static bool8 ECCmd_ShowConfirmExitPrompt(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        StopMainCursorAnim();
        PrintEasyChatStdMessage(MSG_CONFIRM_EXIT);
        CreateEasyChatYesNoMenu(1);
        sScreenControl->funcState++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECCmd_ShowConfirmPrompt(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        StopMainCursorAnim();
        PrintEasyChatStdMessage(MSG_CONFIRM);
        CreateEasyChatYesNoMenu(0);
        sScreenControl->funcState++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECCmd_ShowConfirmDeleteAllPrompt(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        StopMainCursorAnim();
        PrintEasyChatStdMessage(MSG_CONFIRM_DELETE);
        CreateEasyChatYesNoMenu(1);
        sScreenControl->funcState++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECCmd_ClosePrompt(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        StartMainCursorAnim();
        PrintEasyChatStdMessage(MSG_INSTRUCTIONS);
        ShowBg(0);
        sScreenControl->funcState++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECCmd_ClosePromptAfterDeleteAll(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        StartMainCursorAnim();
        PrintEasyChatStdMessage(MSG_INSTRUCTIONS);
        EC_PrintCurrentPhrase();
        sScreenControl->funcState++;
        // Fall through
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 ECCmd_OpenKeyboard(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        StopMainCursorAnim();
        HideBg(0);
        SetWindowDimensions(0, 0, 0, 0);
        PrintKeyboardText();
        sScreenControl->funcState++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            InitLowerWindowAnim(WINANIM_OPEN_KEYBOARD);
            sScreenControl->funcState++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy() && !UpdateLowerWindowAnim())
            sScreenControl->funcState++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CreateSideWindowSprites();
            sScreenControl->funcState++;
        }
        break;
    case 4:
        if (!ShowSideWindow())
        {
            CreateRectangleCursorSprites();
            SetScrollIndicatorXPos(0);
            UpdateScrollIndicatorsVisibility();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    default:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECCmd_CloseKeyboard(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        DestroyRectangleCursorSprites();
        HideModeWindow();
        HideScrollIndicators();
        sScreenControl->funcState++;
        break;
    case 1:
        if (RunModeIconHidingAnimation() == TRUE)
            break;

        InitLowerWindowAnim(WINANIM_CLOSE_KEYBOARD);
        sScreenControl->funcState++;
        // Fall through
    case 2:
        if (!UpdateLowerWindowAnim())
            sScreenControl->funcState++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            StartMainCursorAnim();
            ShowBg(0);
            sScreenControl->funcState++;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECCmd_SwitchKeyboardMode(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        DestroyRectangleCursorSprites();
        HideScrollIndicators();
        SetModeWindowToTransition();
        InitLowerWindowAnim(WINANIM_KEYBOARD_SWITCH_OUT);
        sScreenControl->funcState++;
        break;
    case 1:
        if (!UpdateLowerWindowAnim() && !IsModeWindowAnimActive())
        {
            PrintKeyboardText();
            sScreenControl->funcState++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            InitLowerWindowAnim(WINANIM_KEYBOARD_SWITCH_IN);
            UpdateModeWindowAnim();
            sScreenControl->funcState++;
        }
        break;
    case 3:
        if (!UpdateLowerWindowAnim() && !IsModeWindowAnimActive())
        {
            UpdateScrollIndicatorsVisibility();
            CreateRectangleCursorSprites();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECCmd_UpdateKeyboardCursor(void)
{
    UpdateRectangleCursorPos();
    return FALSE;
}

static bool8 ECCmd_GroupNamesScrollDown(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        InitLowerWindowScroll(1, 2);
        sScreenControl->funcState++;
        // Fall through
    case 1:
        if (!UpdateLowerWindowScroll())
        {
            UpdateRectangleCursorPos();
            UpdateScrollIndicatorsVisibility();
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 ECCmd_GroupNamesScrollUp(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        InitLowerWindowScroll(-1, 2);
        sScreenControl->funcState++;
        // Fall through
    case 1:
        if (!UpdateLowerWindowScroll())
        {
            UpdateScrollIndicatorsVisibility();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECCmd_OpenWordSelect(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        DestroyRectangleCursorSprites();
        HideModeWindow();
        HideScrollIndicators();
        sScreenControl->funcState++;
        break;
    case 1:
        if (!RunModeIconHidingAnimation())
        {
            ClearWordSelectWindow();
            sScreenControl->funcState++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            InitLowerWindowAnim(WINANIM_OPEN_WORD_SELECT);
            sScreenControl->funcState++;
        }
        break;
    case 3:
        if (!UpdateLowerWindowAnim())
        {
            InitLowerWindowText(2);
            sScreenControl->funcState++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CreateSelectWordCursorSprite();
            SetScrollIndicatorXPos(1);
            UpdateScrollIndicatorsVisibility();
            UpdateStartSelectButtonsVisibility();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECCmd_CloseWordSelect(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        EC_PrintCurrentPhrase();
        sScreenControl->funcState++;
        break;
    case 1:
        DestroySelectWordCursorSprite();
        HideScrollIndicators();
        HideStartSelectButtons();
        ClearWordSelectWindow();
        sScreenControl->funcState++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            InitLowerWindowAnim(WINANIM_CLOSE_WORD_SELECT);
            sScreenControl->funcState++;
        }
        break;
    case 3:
        if (!UpdateLowerWindowAnim())
        {
            ShowBg(0);
            sScreenControl->funcState++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            StartMainCursorAnim();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECCmd_ReturnToKeyboard(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        DestroySelectWordCursorSprite();
        HideScrollIndicators();
        HideStartSelectButtons();
        ClearWordSelectWindow();
        sScreenControl->funcState++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            InitLowerWindowAnim(WINANIM_RETURN_TO_KEYBOARD);
            sScreenControl->funcState++;
        }
        break;
    case 2:
        if (!UpdateLowerWindowAnim())
        {
            PrintKeyboardText();
            sScreenControl->funcState++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CreateSideWindowSprites();
            sScreenControl->funcState++;
        }
        break;
    case 4:
        if (!ShowSideWindow())
        {
            CreateRectangleCursorSprites();
            SetScrollIndicatorXPos(0);
            UpdateScrollIndicatorsVisibility();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 ECCmd_UpdateWordSelectCursor(void)
{
    UpdateWordSelectCursorPos();
    return FALSE;
}

static bool8 ECCmd_WordSelectScrollDown(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        PrintWordSelectNextRowDown();
        sScreenControl->funcState++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            InitLowerWindowScroll(1, 2);
            sScreenControl->funcState++;
        }
        break;
    case 2:
        if (!UpdateLowerWindowScroll())
        {
            UpdateWordSelectCursorPos();
            UpdateScrollIndicatorsVisibility();
            UpdateStartSelectButtonsVisibility();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECCmd_WordSelectScrollUp(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        PrintWordSelectNextRowUp();
        sScreenControl->funcState++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            InitLowerWindowScroll(-1, 2);
            sScreenControl->funcState++;
        }
        break;
    case 2:
        if (!UpdateLowerWindowScroll())
        {
            UpdateScrollIndicatorsVisibility();
            UpdateStartSelectButtonsVisibility();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECCmd_WordSelectPageScrollDown(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        PrintWordSelectRowsPageDown();
        sScreenControl->funcState++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 direction = GetWordSelectScrollOffset() - GetLowerWindowScrollOffset();
            InitLowerWindowScroll(direction, 4);
            sScreenControl->funcState++;
        }
        break;
    case 2:
        if (!UpdateLowerWindowScroll())
        {
            UpdateWordSelectCursorPos();
            UpdateScrollIndicatorsVisibility();
            UpdateStartSelectButtonsVisibility();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 ECCmd_WordSelectPageScrollUp(void)
{
    switch (sScreenControl->funcState)
    {
    case 0:
        PrintWordSelectRowsPageUp();
        sScreenControl->funcState++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 direction = GetWordSelectScrollOffset() - GetLowerWindowScrollOffset();
            InitLowerWindowScroll(direction, 4);
            sScreenControl->funcState++;
        }
        break;
    case 2:
        if (!UpdateLowerWindowScroll())
        {
            UpdateScrollIndicatorsVisibility();
            UpdateStartSelectButtonsVisibility();
            sScreenControl->funcState++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 InitEasyChatScreenControl_(void)
{
    sScreenControl = Alloc(sizeof(*sScreenControl));
    if (sScreenControl == NULL)
        return FALSE;

    sScreenControl->funcState = 0;
    sScreenControl->mainCursorSprite = NULL;
    sScreenControl->rectangleCursorSpriteRight = NULL;
    sScreenControl->rectangleCursorSpriteLeft = NULL;
    sScreenControl->wordSelectCursorSprite = NULL;
    sScreenControl->buttonWindowSprite = NULL;
    sScreenControl->modeWindowSprite = NULL;
    sScreenControl->scrollIndicatorUpSprite = NULL;
    sScreenControl->scrollIndicatorDownSprite = NULL;
    sScreenControl->startButtonSprite = NULL;
    sScreenControl->selectButtonSprite = NULL;
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
    LoadPalette(gEasyChatMode_Pal, 0, 32);
    LoadPalette(sTextInputFrameOrange_Pal, 1 * 16, 32);
    LoadPalette(sTextInputFrameGreen_Pal, 4 * 16, 32);
    LoadPalette(sTitleText_Pal, 10 * 16, 8);
    LoadPalette(sText_Pal, 11 * 16, 10);
    LoadPalette(sText_Pal, 15 * 16, 10);
    LoadPalette(sText_Pal, 3 * 16, 10);
}

static void EC_PrintTitle(void)
{
    int xOffset;
    const u8 *titleText = GetTitleText();
    if (titleText == NULL)
        return;

    xOffset = PRINT_X_CENTER_ALIGN(titleText, 0, 128, 1, 0);
    FillWindowPixelBuffer(ECWIN_TITLE, PIXEL_FILL(0));
    PrintEasyChatTextWithColors(ECWIN_TITLE, 1, titleText, xOffset, 0, TEXT_SPEED_FF, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY);
    PutWindowTilemap(ECWIN_TITLE);
    CopyWindowToVram(ECWIN_TITLE, COPYWIN_BOTH);
}

static void PrintEasyChatText(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16))
{
    if (fontId == 1) y += 2;
    AddTextPrinterParameterized(windowId, fontId, str, x, y, speed, callback);
}

static void PrintEasyChatTextWithColors(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, u8 bg, u8 fg, u8 shadow)
{
    u8 color[3];
    if (fontId == 1) y += 2;
    color[0] = bg;
    color[1] = fg;
    color[2] = shadow;
    AddTextPrinterParameterized3(windowId, fontId, x, y, color, speed, str);
}

static void EC_PrintInitialInstructions(void)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 20, 0x11);
    TextWindow_SetUserSelectedFrame(ECWIN_INSTRUCTIONS, 1, 0xE0);
    DrawTextBorderOuter(ECWIN_INSTRUCTIONS, 1, 0xE);
    PrintEasyChatStdMessage(MSG_INSTRUCTIONS);
    PutWindowTilemap(ECWIN_INSTRUCTIONS);
    CopyBgTilemapBufferToVram(0);
}

static void PrintEasyChatStdMessage(u8 message)
{
    const u8 *text2 = NULL;
    const u8 *text1 = NULL;
    switch (message)
    {
    case MSG_INSTRUCTIONS:
        GetEasyChatInstructionsText(&text1, &text2);
        break;
    case MSG_CONFIRM_EXIT:
        GetEasyChatConfirmCancelText(&text1, &text2);
        break;
    case MSG_CONFIRM:
        GetEasyChatConfirmText(&text1, &text2);
        break;
    case MSG_CONFIRM_DELETE:
        GetEasyChatConfirmDeletionText(&text1, &text2);
        break;
    }

    FillWindowPixelBuffer(ECWIN_INSTRUCTIONS, PIXEL_FILL(1));
    if (text1)
        PrintEasyChatText(ECWIN_INSTRUCTIONS, 1, text1, 0, 0, TEXT_SPEED_FF, NULL);

    if (text2)
        PrintEasyChatText(ECWIN_INSTRUCTIONS, 1, text2, 0, 16, TEXT_SPEED_FF, NULL);

    CopyWindowToVram(ECWIN_INSTRUCTIONS, COPYWIN_BOTH);
}

static void CreateEasyChatYesNoMenu(u8 initialCursorPos)
{
    CreateYesNoMenu(&sEasyChatYesNoWindowTemplate, 1, 0, 2, 0x001, 0xE, initialCursorPos);
}

static void AddPhraseWindow(void)
{
    u8 frameId;
    struct WindowTemplate template;

    frameId = GetEasyChatScreenFrameId();
    template.bg = 3;
    template.tilemapLeft = sPhraseFrameDimensions[frameId].left;
    template.tilemapTop = sPhraseFrameDimensions[frameId].top;
    template.width = sPhraseFrameDimensions[frameId].width;
    template.height = sPhraseFrameDimensions[frameId].height;
    template.paletteNum = 0xB;
    template.baseBlock = 0x060;
    sScreenControl->windowId = AddWindow(&template);
    PutWindowTilemap(sScreenControl->windowId);
}

static void EC_PrintCurrentPhrase(void)
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
    FillWindowPixelBuffer(sScreenControl->windowId, PIXEL_FILL(1));
    for (i = 0; i < numRows; i++)
    {
        str = sScreenControl->phrasePrintBuffer;
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
                    *str++ = CHAR_EXTRA_EMOJI;
                    *str++ = 9;
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
        PrintEasyChatText(sScreenControl->windowId, 1, sScreenControl->phrasePrintBuffer, 0, i * 16, TEXT_SPEED_FF,
                          NULL);
    }

    CopyWindowToVram(sScreenControl->windowId, COPYWIN_BOTH);
}

static void BufferFrameTilemap(u16 *tilemap)
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

static void EC_DrawLowerWindow(void)
{
    PutWindowTilemap(ECWIN_LOWER);
    CopyBgTilemapBufferToVram(2);
}

static void InitLowerWindowText(u32 id)
{
    ResetLowerWindowScroll();
    FillWindowPixelBuffer(ECWIN_LOWER, PIXEL_FILL(1));
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

    CopyWindowToVram(ECWIN_LOWER, COPYWIN_GFX);
}

static void PrintKeyboardText(void)
{
    if (!IsEasyChatAlphaMode())
        InitLowerWindowText(0);
    else
        InitLowerWindowText(1);
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
                InitLowerWindowScroll(GetECSelectGroupRowsAbove(), 0);
                return;
            }

            PrintEasyChatText(2, 1, GetEasyChatWordGroupName(groupId), x * 84 + 10, y, TEXT_SPEED_FF, NULL);
        }

        y += 16;
    }
}

static void PrintEasyChatKeyboardText(void)
{
    u32 i;

    for (i = 0; i < NELEMS(sEasyChatKeyboardText); i++)
        PrintEasyChatText(ECWIN_LOWER, 1, sEasyChatKeyboardText[i], 10, 96 + i * 16, TEXT_SPEED_FF, NULL);
}

static void PrintECWordsMenu(void)
{
    PrintWordSelectText(0, 4);
}

static void PrintWordSelectNextRowDown(void)
{
    u8 rowsAbove = GetWordSelectScrollOffset() + 3;
    EraseWordSelectRows(rowsAbove, 1);
    PrintWordSelectText(rowsAbove, 1);
}

static void PrintWordSelectNextRowUp(void)
{
    u8 rowsAbove = GetWordSelectScrollOffset();
    EraseWordSelectRows(rowsAbove, 1);
    PrintWordSelectText(rowsAbove, 1);
}

static void PrintWordSelectRowsPageDown(void)
{
    u8 row = GetWordSelectScrollOffset();
    u8 maxrow = row + 4;
    u8 numrowsplus1 = GetECSelectWordNumRows() + 1;
    if (maxrow > numrowsplus1)
        maxrow = numrowsplus1;

    if (row < maxrow)
    {
        u8 remrow = maxrow - row;
        EraseWordSelectRows(row, remrow);
        PrintWordSelectText(row, remrow);
    }
}

static void PrintWordSelectRowsPageUp(void)
{
    u8 wordScroll = GetWordSelectScrollOffset();
    u8 windowScroll = GetLowerWindowScrollOffset();
    if (wordScroll < windowScroll)
    {
        u8 numRows = windowScroll - wordScroll;
        EraseWordSelectRows(wordScroll, numRows);
        PrintWordSelectText(wordScroll, numRows);
    }
}

// Print the easy chat words available for selection in
// the currently selected group and at the given offset and row
static void PrintWordSelectText(u8 scrollOffset, u8 numRows)
{
    int i, j;
    u16 easyChatWord;
    int y;
    u8 y_;
    int wordIndex;

    wordIndex = scrollOffset * 2;
    y = (scrollOffset * 16 + 96) & 0xFF;

    for (i = 0; i < numRows; i++)
    {
        for (j = 0; j < 2; j++)
        {
            // FIXME: Dumb trick needed to match
            y_ = y << 18 >> 18;
            easyChatWord = GetWordFromSelectedGroup(wordIndex++);
            if (easyChatWord != 0xFFFF)
            {

                CopyEasyChatWordPadded(sScreenControl->wordSelectPrintBuffer, easyChatWord, 0);

                PrintEasyChatText(ECWIN_LOWER, 1, sScreenControl->wordSelectPrintBuffer, (j * 13 + 3) * 8, y_, TEXT_SPEED_FF, NULL);
            }
        }

        y += 16;
    }

    CopyWindowToVram(ECWIN_LOWER, COPYWIN_GFX);
}

static void EraseWordSelectRows(u8 row, u8 remrow)
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

    FillWindowPixelRect(ECWIN_LOWER, PIXEL_FILL(1), 0, y, 224, heightToBottom);
    if (heightWrappedAround)
        FillWindowPixelRect(ECWIN_LOWER, PIXEL_FILL(1), 0, 0, 224, heightWrappedAround);
}

static void ClearWordSelectWindow(void)
{
    FillWindowPixelBuffer(ECWIN_LOWER, PIXEL_FILL(1));
    CopyWindowToVram(ECWIN_LOWER, COPYWIN_GFX);
}

static void InitLowerWindowAnim(int animNo)
{
    switch (animNo)
    {
    case WINANIM_OPEN_KEYBOARD:
        sScreenControl->curWindowAnimState = 0;
        sScreenControl->destWindowAnimState = 10;
        break;
    case WINANIM_CLOSE_KEYBOARD:
        sScreenControl->curWindowAnimState = 9;
        sScreenControl->destWindowAnimState = 0;
        break;
    case WINANIM_OPEN_WORD_SELECT:
        sScreenControl->curWindowAnimState = 11;
        sScreenControl->destWindowAnimState = 17;
        break;
    case WINANIM_CLOSE_WORD_SELECT:
        sScreenControl->curWindowAnimState = 17;
        sScreenControl->destWindowAnimState = 0;
        break;
    case WINANIM_RETURN_TO_KEYBOARD:
        sScreenControl->curWindowAnimState = 17;
        sScreenControl->destWindowAnimState = 10;
        break;
    case WINANIM_KEYBOARD_SWITCH_OUT:
        sScreenControl->curWindowAnimState = 18;
        sScreenControl->destWindowAnimState = 22;
        break;
    case WINANIM_KEYBOARD_SWITCH_IN:
        sScreenControl->curWindowAnimState = 22;
        sScreenControl->destWindowAnimState = 18;
        break;
    }

    sScreenControl->windowAnimStateDir = sScreenControl->curWindowAnimState < sScreenControl->destWindowAnimState ? 1 : -1;
}

static bool8 UpdateLowerWindowAnim(void)
{
    if (sScreenControl->curWindowAnimState == sScreenControl->destWindowAnimState)
        return FALSE;

    sScreenControl->curWindowAnimState += sScreenControl->windowAnimStateDir;
    DrawLowerWindowFrame(sScreenControl->curWindowAnimState);
    return sScreenControl->curWindowAnimState != sScreenControl->destWindowAnimState;
}

static void DrawLowerWindowFrame(u8 direction)
{
    FillBgTilemapBufferRect_Palette0(1, 0, 0, 10, 30, 10);
    switch (direction)
    {
    case 0:
        break;
    case 1:
        BufferLowerWindowFrame(11, 14, 3, 2);
        break;
    case 2:
        BufferLowerWindowFrame(9, 14, 7, 2);
        break;
    case 3:
        BufferLowerWindowFrame(7, 14, 11, 2);
        break;
    case 4:
        BufferLowerWindowFrame(5, 14, 15, 2);
        break;
    case 5:
        BufferLowerWindowFrame(3, 14, 19, 2);
        break;
    case 6:
        BufferLowerWindowFrame(1, 14, 23, 2);
        break;
    case 7:
        BufferLowerWindowFrame(1, 13, 23, 4);
        break;
    case 8:
        BufferLowerWindowFrame(1, 12, 23, 6);
        break;
    case 9:
        BufferLowerWindowFrame(1, 11, 23, 8);
        break;
    case 10:
        BufferLowerWindowFrame(1, 10, 23, 10);
        break;
    case 11:
        BufferLowerWindowFrame(1, 10, 24, 10);
        break;
    case 12:
        BufferLowerWindowFrame(1, 10, 25, 10);
        break;
    case 13:
        BufferLowerWindowFrame(1, 10, 26, 10);
        break;
    case 14:
        BufferLowerWindowFrame(1, 10, 27, 10);
        break;
    case 15:
        BufferLowerWindowFrame(1, 10, 28, 10);
        break;
    case 16:
        BufferLowerWindowFrame(1, 10, 29, 10);
        break;
    case 17:
        BufferLowerWindowFrame(0, 10, 30, 10);
        break;
    case 18:
        BufferLowerWindowFrame(1, 10, 23, 10);
        break;
    case 19:
        BufferLowerWindowFrame(1, 11, 23, 8);
        break;
    case 20:
        BufferLowerWindowFrame(1, 12, 23, 6);
        break;
    case 21:
        BufferLowerWindowFrame(1, 13, 23, 4);
        break;
    case 22:
        BufferLowerWindowFrame(1, 14, 23, 2);
        break;
    }

    CopyBgTilemapBufferToVram(1);
}

static void BufferLowerWindowFrame(int left, int top, int width, int height)
{
    u16 *tilemap;
    int right;
    int bottom;
    int x, y;

    tilemap = sScreenControl->bg1TilemapBuffer;
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
    SetWindowDimensions((left + 1) * 8, (top + 1) * 8, (width - 2) * 8, (height - 2) * 8);
}

static void ResetLowerWindowScroll(void)
{
    ChangeBgY(2, 0x800, 0);
    sScreenControl->scrollOffset = 0;
}

static void InitLowerWindowScroll(s16 direction, u8 speed)
{
    int bgY;
    s16 totalDelta;

    bgY = GetBgY(2);
    sScreenControl->scrollOffset += direction;
    totalDelta = direction * 16;
    bgY += totalDelta << 8;
    if (speed)
    {
        sScreenControl->scrollDest = bgY;
        sScreenControl->scrollSpeed = speed * 256;
        if (totalDelta < 0)
            sScreenControl->scrollSpeed = -sScreenControl->scrollSpeed;
    }
    else
    {
        ChangeBgY(2, bgY, 0);
    }
}

static bool8 UpdateLowerWindowScroll(void)
{
    int bgY;

    bgY = GetBgY(2);
    if (bgY == sScreenControl->scrollDest)
    {
        return FALSE;
    }
    else
    {
        ChangeBgY(2, sScreenControl->scrollSpeed, 1);
        return TRUE;
    }
}

static int GetLowerWindowScrollOffset(void)
{
    return sScreenControl->scrollOffset;
}

static void SetWindowDimensions(u8 left, u8 top, u8 width, u8 height)
{
    u16 horizontalDimensions = WIN_RANGE(left, left + width);
    u16 verticalDimensions = WIN_RANGE(top, top + height);
    SetGpuReg(REG_OFFSET_WIN0H, horizontalDimensions);
    SetGpuReg(REG_OFFSET_WIN0V, verticalDimensions);
}

static void LoadEasyChatGfx(void)
{
    u32 i;

    LoadSpriteSheets(sEasyChatSpriteSheets);
    LoadSpritePalettes(sSpritePalettes);
    for (i = 0; i < NELEMS(sCompressedSpriteSheets); i++)
        LoadCompressedSpriteSheet(&sCompressedSpriteSheets[i]);
}

#define sDelayTimer    data[0]
#define sAnimateCursor data[1]

static void EC_CreateMainCursorSprite(void)
{
    u8 frameId = GetEasyChatScreenFrameId();
    s16 x = sPhraseFrameDimensions[frameId].left * 8 + 13;
    s16 y = (sPhraseFrameDimensions[frameId].top + 1) * 8 + 1;
    u8 spriteId = CreateSprite(&sSpriteTemplate_TriangleCursor, x, y, 2);
    sScreenControl->mainCursorSprite = &gSprites[spriteId];
    gSprites[spriteId].sAnimateCursor = TRUE;
}

static void SpriteCB_BounceCursor(struct Sprite * sprite)
{
    if (sprite->sAnimateCursor)
    {
        if (++sprite->sDelayTimer > 2)
        {
            sprite->sDelayTimer = 0;
            if (++sprite->pos2.x > 0)
                sprite->pos2.x = -6;
        }
    }
}

static void EC_SetMainCursorPos(u8 x, u8 y)
{
    sScreenControl->mainCursorSprite->pos1.x = x;
    sScreenControl->mainCursorSprite->pos1.y = y;
    sScreenControl->mainCursorSprite->pos2.x = 0;
    sScreenControl->mainCursorSprite->sDelayTimer = 0;
}

static void StopMainCursorAnim(void)
{
    sScreenControl->mainCursorSprite->sDelayTimer = 0;
    sScreenControl->mainCursorSprite->sAnimateCursor = FALSE;
    sScreenControl->mainCursorSprite->pos2.x = 0;
}

static void StartMainCursorAnim(void)
{
    sScreenControl->mainCursorSprite->sAnimateCursor = TRUE;
}

static void CreateRectangleCursorSprites(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_RedRectangularCursor, 0, 0, 3);
    sScreenControl->rectangleCursorSpriteRight = &gSprites[spriteId];
    sScreenControl->rectangleCursorSpriteRight->pos2.x = 32;

    spriteId = CreateSprite(&sSpriteTemplate_RedRectangularCursor, 0, 0, 3);
    sScreenControl->rectangleCursorSpriteLeft = &gSprites[spriteId];
    sScreenControl->rectangleCursorSpriteLeft->pos2.x = -32;

    sScreenControl->rectangleCursorSpriteRight->hFlip = TRUE;
    UpdateRectangleCursorPos();
}

static void DestroyRectangleCursorSprites(void)
{
    DestroySprite(sScreenControl->rectangleCursorSpriteRight);
    sScreenControl->rectangleCursorSpriteRight = NULL;
    DestroySprite(sScreenControl->rectangleCursorSpriteLeft);
    sScreenControl->rectangleCursorSpriteLeft = NULL;
}

static void UpdateRectangleCursorPos(void)
{
    u8 x;
    u8 y;

    if (sScreenControl->rectangleCursorSpriteRight && sScreenControl->rectangleCursorSpriteLeft)
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
        StartSpriteAnim(sScreenControl->rectangleCursorSpriteRight, 0);
        sScreenControl->rectangleCursorSpriteRight->pos1.x = x * 84 + 58;
        sScreenControl->rectangleCursorSpriteRight->pos1.y = y * 16 + 96;

        StartSpriteAnim(sScreenControl->rectangleCursorSpriteLeft, 0);
        sScreenControl->rectangleCursorSpriteLeft->pos1.x = x * 84 + 58;
        sScreenControl->rectangleCursorSpriteLeft->pos1.y = y * 16 + 96;
    }
    else
    {
        StartSpriteAnim(sScreenControl->rectangleCursorSpriteRight, 1);
        sScreenControl->rectangleCursorSpriteRight->pos1.x = 216;
        sScreenControl->rectangleCursorSpriteRight->pos1.y = y * 16 + 112;

        StartSpriteAnim(sScreenControl->rectangleCursorSpriteLeft, 1);
        sScreenControl->rectangleCursorSpriteLeft->pos1.x = 216;
        sScreenControl->rectangleCursorSpriteLeft->pos1.y = y * 16 + 112;
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
            anim = 2;
        }
        else
        {
            x += sECDisplay_AlphaModeXCoords[cursorX < NELEMS(sECDisplay_AlphaModeXCoords) ? cursorX : 0];
            anim = 3;
        }

        StartSpriteAnim(sScreenControl->rectangleCursorSpriteRight, anim);
        sScreenControl->rectangleCursorSpriteRight->pos1.x = x;
        sScreenControl->rectangleCursorSpriteRight->pos1.y = y;

        StartSpriteAnim(sScreenControl->rectangleCursorSpriteLeft, anim);
        sScreenControl->rectangleCursorSpriteLeft->pos1.x = x;
        sScreenControl->rectangleCursorSpriteLeft->pos1.y = y;
    }
    else
    {
        StartSpriteAnim(sScreenControl->rectangleCursorSpriteRight, 1);
        sScreenControl->rectangleCursorSpriteRight->pos1.x = 216;
        sScreenControl->rectangleCursorSpriteRight->pos1.y = cursorY * 16 + 112;

        StartSpriteAnim(sScreenControl->rectangleCursorSpriteLeft, 1);
        sScreenControl->rectangleCursorSpriteLeft->pos1.x = 216;
        sScreenControl->rectangleCursorSpriteLeft->pos1.y = cursorY * 16 + 112;
    }
}

static void CreateSelectWordCursorSprite(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_TriangleCursor, 0, 0, 4);
    sScreenControl->wordSelectCursorSprite = &gSprites[spriteId];
    sScreenControl->wordSelectCursorSprite->callback = SpriteCB_SelectWordCursorSprite;
    sScreenControl->wordSelectCursorSprite->oam.priority = 2;
    UpdateWordSelectCursorPos();
}

static void SpriteCB_SelectWordCursorSprite(struct Sprite * sprite)
{
    if (++sprite->sDelayTimer > 2)
    {
        sprite->sDelayTimer = 0;
        if (++sprite->pos2.x > 0)
            sprite->pos2.x = -6;
    }
}

static void UpdateWordSelectCursorPos(void)
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
    if (sScreenControl->wordSelectCursorSprite)
    {
        sScreenControl->wordSelectCursorSprite->pos1.x = x * 8 + 4;
        sScreenControl->wordSelectCursorSprite->pos1.y = (y + 1) * 8 + 1;
        sScreenControl->wordSelectCursorSprite->pos2.x = 0;
        sScreenControl->wordSelectCursorSprite->sDelayTimer = 0;
    }
}

static void DestroySelectWordCursorSprite(void)
{
    if (sScreenControl->wordSelectCursorSprite)
    {
        DestroySprite(sScreenControl->wordSelectCursorSprite);
        sScreenControl->wordSelectCursorSprite = NULL;
    }
}

static void CreateSideWindowSprites(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_SelectGroupHelp, 208, 128, 6);
    sScreenControl->buttonWindowSprite = &gSprites[spriteId];
    sScreenControl->buttonWindowSprite->pos2.x = -64;

    spriteId = CreateSprite(&sSpriteTemplate_EasyChatModeIcons, 208, 80, 5);
    sScreenControl->modeWindowSprite = &gSprites[spriteId];
    sScreenControl->modeWindowState = 0;
}

static bool8 ShowSideWindow(void)
{
    switch (sScreenControl->modeWindowState)
    {
    default:
        return FALSE;
    case 0:
        sScreenControl->buttonWindowSprite->pos2.x += 8;
        if (sScreenControl->buttonWindowSprite->pos2.x >= 0)
        {
            sScreenControl->buttonWindowSprite->pos2.x = 0;
            if (!IsEasyChatAlphaMode())
                StartSpriteAnim(sScreenControl->modeWindowSprite, 1);
            else
                StartSpriteAnim(sScreenControl->modeWindowSprite, 2);

            sScreenControl->modeWindowState++;
        }
        break;
    case 1:
        if (sScreenControl->modeWindowSprite->animEnded)
        {
            sScreenControl->modeWindowState = 2;
            return FALSE;
        }
    }

    return TRUE;
}

static void HideModeWindow(void)
{
    sScreenControl->modeWindowState = 0;
    StartSpriteAnim(sScreenControl->modeWindowSprite, 3);
}

static bool8 RunModeIconHidingAnimation(void)
{
    switch (sScreenControl->modeWindowState)
    {
    default:
        return FALSE;
    case 0:
        if (sScreenControl->modeWindowSprite->animEnded)
            sScreenControl->modeWindowState = 1;
        break;
    case 1:
        sScreenControl->buttonWindowSprite->pos2.x -= 8;
        if (sScreenControl->buttonWindowSprite->pos2.x <= -64)
        {
            DestroySprite(sScreenControl->modeWindowSprite);
            DestroySprite(sScreenControl->buttonWindowSprite);
            sScreenControl->modeWindowSprite = NULL;
            sScreenControl->buttonWindowSprite = NULL;
            sScreenControl->modeWindowState++;
            return FALSE;
        }
    }

    return TRUE;
}

static void SetModeWindowToTransition(void)
{
    StartSpriteAnim(sScreenControl->modeWindowSprite, 4);
}

static void UpdateModeWindowAnim(void)
{
    if (!IsEasyChatAlphaMode())
        StartSpriteAnim(sScreenControl->modeWindowSprite, 1);
    else
        StartSpriteAnim(sScreenControl->modeWindowSprite, 2);
}

static bool8 IsModeWindowAnimActive(void)
{
    return !sScreenControl->modeWindowSprite->animEnded;
}

static void CreateScrollIndicatorSprites(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_ScrollIndicator, 96, 80, 0);
    if (spriteId != MAX_SPRITES)
        sScreenControl->scrollIndicatorUpSprite = &gSprites[spriteId];

    spriteId = CreateSprite(&sSpriteTemplate_ScrollIndicator, 96, 156, 0);
    if (spriteId != MAX_SPRITES)
    {
        sScreenControl->scrollIndicatorDownSprite = &gSprites[spriteId];
        sScreenControl->scrollIndicatorDownSprite->vFlip = TRUE;
    }

    HideScrollIndicators();
}

static void UpdateScrollIndicatorsVisibility(void)
{
    sScreenControl->scrollIndicatorUpSprite->invisible = !ShouldDrawECUpArrow();
    sScreenControl->scrollIndicatorDownSprite->invisible = !ShouldDrawECDownArrow();
}

static void HideScrollIndicators(void)
{
    sScreenControl->scrollIndicatorUpSprite->invisible = TRUE;
    sScreenControl->scrollIndicatorDownSprite->invisible = TRUE;
}

static void SetScrollIndicatorXPos(int direction)
{
    if (!direction)
    {
        // Group select
        sScreenControl->scrollIndicatorUpSprite->pos1.x = 96;
        sScreenControl->scrollIndicatorDownSprite->pos1.x = 96;
    }
    else
    {
        // Word select
        sScreenControl->scrollIndicatorUpSprite->pos1.x = 120;
        sScreenControl->scrollIndicatorDownSprite->pos1.x = 120;
    }
}

static void CreateStartSelectButtonsSprites(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_StartSelectButtons, 220, 84, 1);
    if (spriteId != MAX_SPRITES)
        sScreenControl->startButtonSprite = &gSprites[spriteId];

    spriteId = CreateSprite(&sSpriteTemplate_StartSelectButtons, 220, 156, 1);
    if (spriteId != MAX_SPRITES)
    {
        sScreenControl->selectButtonSprite = &gSprites[spriteId];
        StartSpriteAnim(sScreenControl->selectButtonSprite, 1);
    }

    HideStartSelectButtons();
}

static void UpdateStartSelectButtonsVisibility(void)
{
    sScreenControl->startButtonSprite->invisible = !ShouldDrawECUpArrow();
    sScreenControl->selectButtonSprite->invisible = !ShouldDrawECDownArrow();
}

static void HideStartSelectButtons(void)
{
    sScreenControl->startButtonSprite->invisible = TRUE;
    sScreenControl->selectButtonSprite->invisible = TRUE;
}

static void AddMainScreenButtonWindow(void)
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
    PrintEasyChatText(windowId, 1, gText_DelAll_Cancel_OK, 0, 0, 0, NULL);
    PutWindowTilemap(windowId);
}
