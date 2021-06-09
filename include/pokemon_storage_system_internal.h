#ifndef GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
#define GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H

#include "pokemon_storage_system.h"
#include "mon_markings.h"

#define IN_BOX_ROWS 5
#define IN_BOX_COLUMNS    6

#define MAX_MON_ICONS 40
#define MAX_ITEM_ICONS 3
#define MAX_MENU_ITEMS 7

enum
{
    MODE_PARTY,
    MODE_BOX,
    MODE_MOVE,
};

enum
{
    BOX_OPTION_WITHDRAW,
    BOX_OPTION_DEPOSIT,
    BOX_OPTION_MOVE_MONS,
    BOX_OPTION_MOVE_ITEMS,
    BOX_OPTION_EXIT,
    BOX_OPTION_COUNT,
};

enum
{
    PC_TEXT_EXIT_BOX,
    PC_TEXT_WHAT_YOU_DO,
    PC_TEXT_PICK_A_THEME,
    PC_TEXT_PICK_A_WALLPAPER,
    PC_TEXT_IS_SELECTED,
    PC_TEXT_JUMP_TO_WHICH_BOX,
    PC_TEXT_DEPOSIT_IN_WHICH_BOX,
    PC_TEXT_WAS_DEPOSITED,
    PC_TEXT_BOX_IS_FULL,
    PC_TEXT_RELEASE_POKE,
    PC_TEXT_WAS_RELEASED,
    PC_TEXT_BYE_BYE,
    PC_TEXT_MARK_POKE,
    PC_TEXT_LAST_POKE,
    PC_TEXT_PARTY_FULL,
    PC_TEXT_HOLDING_POKE,
    PC_TEXT_WHICH_ONE_WILL_TAKE,
    PC_TEXT_CANT_RELEASE_EGG,
    PC_TEXT_CONTINUE_BOX,
    PC_TEXT_CAME_BACK,
    PC_TEXT_WORRIED,
    PC_TEXT_SURPRISE,
    PC_TEXT_PLEASE_REMOVE_MAIL,
    PC_TEXT_IS_SELECTED2,
    PC_TEXT_GIVE_TO_MON,
    PC_TEXT_PLACED_IN_BAG,
    PC_TEXT_BAG_FULL,
    PC_TEXT_PUT_IN_BAG,
    PC_TEXT_ITEM_IS_HELD,
    PC_TEXT_CHANGED_TO_ITEM,
    PC_TEXT_CANT_STORE_MAIL,
};

enum
{
    PC_TEXT_FMT_NORMAL,
    PC_TEXT_FMT_MON_NAME_1,
    PC_TEXT_FMT_MON_NAME_2,
    PC_TEXT_FMT_MON_NAME_3,
    PC_TEXT_FMT_MON_NAME_4,
    PC_TEXT_FMT_MON_NAME_5,
    PC_TEXT_FMT_MON_NAME_6,
    PC_TEXT_FMT_ITEM_NAME,
};

// IDs for menu selection items. See SetMenuText, PokeStorage_HandleMenuInput, etc
enum
{
    MENU_CANCEL,
    MENU_STORE,
    MENU_WITHDRAW,
    MENU_MOVE,
    MENU_SHIFT,
    MENU_PLACE,
    MENU_SUMMARY,
    MENU_RELEASE,
    MENU_MARK,
    MENU_JUMP,
    MENU_WALLPAPER,
    MENU_NAME,
    MENU_TAKE,
    MENU_GIVE,
    MENU_GIVE_2,
    MENU_SWITCH,
    MENU_BAG,
    MENU_INFO,
    MENU_SCENERY_1,
    MENU_SCENERY_2,
    MENU_SCENERY_3,
    MENU_ETCETERA,
    MENU_FOREST,
    MENU_CITY,
    MENU_DESERT,
    MENU_SAVANNA,
    MENU_CRAG,
    MENU_VOLCANO,
    MENU_SNOW,
    MENU_CAVE,
    MENU_BEACH,
    MENU_SEAFLOOR,
    MENU_RIVER,
    MENU_SKY,
    MENU_POLKADOT,
    MENU_POKECENTER,
    MENU_MACHINE,
    MENU_SIMPLE,
};
#define MENU_WALLPAPER_SETS_START MENU_SCENERY_1
#define MENU_WALLPAPERS_START MENU_FOREST

// Return IDs for input handlers
enum {
    INPUT_NONE,
    INPUT_MOVE_CURSOR,
    INPUT_2, // Unused
    INPUT_3, // Unused
    INPUT_CLOSE_BOX,
    INPUT_SHOW_PARTY,
    INPUT_HIDE_PARTY,
    INPUT_BOX_OPTIONS,
    INPUT_IN_MENU,
    INPUT_SCROLL_RIGHT,
    INPUT_SCROLL_LEFT,
    INPUT_DEPOSIT,
    INPUT_WITHDRAW,
    INPUT_MOVE_MON,
    INPUT_SHIFT_MON,
    INPUT_PLACE_MON,
    INPUT_TAKE_ITEM,
    INPUT_GIVE_ITEM,
    INPUT_SWITCH_ITEMS,
    INPUT_PRESSED_B,
    INPUT_MULTIMOVE_START,
    INPUT_MULTIMOVE_CHANGE_SELECTION,
    INPUT_MULTIMOVE_SINGLE,
    INPUT_MULTIMOVE_GRAB_SELECTION,
    INPUT_MULTIMOVE_UNABLE,
    INPUT_MULTIMOVE_MOVE_MONS,
    INPUT_MULTIMOVE_PLACE_MONS,
};

enum
{
    CURSOR_AREA_IN_BOX,
    CURSOR_AREA_IN_PARTY,
    CURSOR_AREA_BOX,
    CURSOR_AREA_BUTTONS, // Party Pokemon and Close Box
};

enum {
    CURSOR_ANIM_BOUNCE,
    CURSOR_ANIM_STILL,
    CURSOR_ANIM_OPEN,
    CURSOR_ANIM_FIST,
};

enum
{
    SCREEN_CHANGE_EXIT_BOX,
    SCREEN_CHANGE_SUMMARY_SCREEN,
    SCREEN_CHANGE_NAME_BOX,
    SCREEN_CHANGE_ITEM_FROM_BAG,
};

enum {
    PSS_WIN_DISPLAY_MON_INFO = 0,
    PSS_WIN_MESSAGE_BOX,
    PSS_WIN_2,
};

#define TAG_PAL_MON_ICON_0  0xDAC0
#define TAG_PAL_MON_ICON_1  0xDAC1
#define TAG_PAL_MON_ICON_2  0xDAC2
#define TAG_PAL_MON_ICON_3  0xDAC3
#define TAG_PAL_MON_ICON_4  0xDAC4
#define TAG_PAL_MON_ICON_5  0xDAC5
#define TAG_PAL_DAC6        0xDAC6
#define TAG_PAL_DAC7        0xDAC7
#define TAG_PAL_DAC8        0xDAC8
#define TAG_PAL_BOX_TITLE   0xDAC9
#define TAG_PAL_WAVEFORM    0xDACA
#define TAG_PAL_DACB        0xDACB
#define TAG_PAL_DACE        0xDACE

#define TAG_TILE_0              0x0
#define TAG_TILE_1              0x1
#define TAG_TILE_2              0x2
#define TAG_TILE_BOX_TITLE      0x3
#define TAG_TILE_BOX_TITLE_ALT  0x4
#define TAG_TILE_WAVEFORM       0x5
#define TAG_TILE_6              0x6
#define TAG_TILE_7              0x7
#define TAG_TILE_A              0xA
#define TAG_TILE_D              0xD
#define TAG_TILE_10             0x10
#define TAG_TILE_MON_ICON             0x12

#define BOXID_NONE_CHOSEN   200
#define BOXID_CANCELED      201

struct WallpaperTable
{
    const u32 *tiles;
    const u32 *tileMap;
    const u16 *palettes;
};

struct StorageAction
{
    const u8 *text;
    u8 format;
};

struct ChooseBoxMenu
{
    struct Sprite *menuSprite;
    struct Sprite *menuSideSprites[4];
    u32 unused1[3]; // unused
    struct Sprite *arrowSprites[2];
    u8 buffer[0x200]; // passed but not used
    u8 strbuf[20];
    bool32 loadedPalette;
    u16 tilesTag;
    u16 paletteTag;
    u8 curBox;
    u8 unused3; // unused
    u8 subpriority;
};

struct StorageMenu
{
    const u8 *text;
    int textId;
};

struct UnkUtilData
{
    const u8 *src;
    u8 *dest;
    u16 copySize;
    u16 width;
    u16 height;
    void (*func)(struct UnkUtilData *data);
};

struct UnkUtil
{
    struct UnkUtilData *data;
    u8 numActive;
    u8 max;
};

struct ItemIcon
{
    struct Sprite *sprite;
    u8 *tiles;
    u16 palIndex;
    u8 cursorArea;
    u8 cursorPos;
    u8 active;
};

struct PssQuestLogBuffer
{
    u16 species;
    u16 species2;
    u8 fromBox;
    u8 toBox;
};

struct PokemonStorageSystemData
{
    u8 state;
    u8 boxOption;
    u8 screenChangeType;
    bool8 isReopening;
    u8 taskId;
    struct UnkUtil unkUtil;
    struct UnkUtilData unkUtilData[8];
    u16 partyMenuTilemapBuffer[528 / 2];
    u16 partyMenuUnused1; // Never read
    u16 partyMenuY;
    u8 partyMenuUnused2; // Unused
    u8 partyMenuMoveTimer;
    u8 showPartyMenuState;
    bool8 closeBoxFlashing;
    u8 closeBoxFlashTimer;
    bool8 closeBoxFlashState;
    s16 newCurrBoxId;
    u16 bg2_X;
    s16 scrollSpeed;
    u16 scrollTimer;
    u8 wallpaperOffset;
    u8 scrollUnused1; // Never read
    u8 scrollToBoxIdUnused; // Never read
    u16 scrollUnused2; // Never read
    s16 scrollDirectionUnused; // Never read
    u16 scrollUnused3; // Never read
    u16 scrollUnused4; // Never read
    u16 scrollUnused5; // Never read
    u16 scrollUnused6; // Never read
    u8 filler[22];
    u8 boxTitleTiles[512];
    u8 boxTitleTileBuffer[512];
    u8 boxTitleCycleId;
    u8 wallpaperLoadState; // Written to, but never read.
    u8 wallpaperLoadBoxId;
    s8 wallpaperLoadDir;
    u16 boxTitlePal[16];
    u16 boxTitlePalOffset;
    u16 boxTitleAltPalOffset;
    struct Sprite *curBoxTitleSprites[2];
    struct Sprite *nextBoxTitleSprites[2];
    struct Sprite *arrowSprites[2];
    u32 wallpaperPalBits;
    u8 filler2[80]; // Unused
    u16 unkUnused1; // Never read
    s16 wallpaperSetId;
    s16 wallpaperId;
    u16 wallpaperTilemap[360];
    u8 wallpaperChangeState;
    u8 scrollState;
    u8 scrollToBoxId;
    s8 scrollDirection;
    /* 0a68 */ struct Sprite *movingMonSprite;
    /* 0a6c */ struct Sprite *partySprites[PARTY_SIZE];
    /* 0a84 */ struct Sprite *boxMonsSprites[IN_BOX_COUNT];
    /* 0afc */ struct Sprite **shiftMonSpritePtr;
    /* 0b00 */ struct Sprite **releaseMonSpritePtr;
    /* 0b04 */ u16 numIconsPerSpecies[MAX_MON_ICONS];
    /* 0b54 */ u16 iconSpeciesList[MAX_MON_ICONS];
    /* 0ba4 */ u16 boxSpecies[IN_BOX_COUNT];
    /* 0be0 */ u32 boxPersonalities[IN_BOX_COUNT];
    /* 0c58 */ u8 incomingBoxId;
    /* 0c59 */ u8 shiftTimer;
    /* 0c5a */ u8 numPartyToCompact;
    /* 0c5c */ u16 iconScrollDistance;
    /* 0c5e */ s16 iconScrollPos;
    /* 0c60 */ s16 iconScrollSpeed;
    /* 0c62 */ u16 iconScrollNumIncoming;
    /* 0c64 */ u8 iconScrollCurColumn;
    /* 0c65 */ s8 iconScrollDirection; // Unnecessary duplicate of scrollDirection
    /* 0c66 */ u8 iconScrollState;
    /* 0c67 */ u8 iconScrollToBoxId; // Unnecessary duplicate of scrollToBoxId
    /* 0c68 */ struct WindowTemplate menuWindow;
    /* 0c70 */ struct StorageMenu menuItems[MAX_MENU_ITEMS];
    /* 0ca8 */ u8 menuItemsCount;
    /* 0ca9 */ u8 menuWidth;
    /* 0caa */ u8 menuUnusedField; // Never read.
    /* 0cac */ u16 menuWindowId;
    /* 0cb0 */ struct Sprite *cursorSprite;
    /* 0cb4 */ struct Sprite *cursorShadowSprite;
    /* 0cb8 */ s32 cursorNewX;
    /* 0cbc */ s32 cursorNewY;
    /* 0cc0 */ u32 cursorSpeedX;
    /* 0cc4 */ u32 cursorSpeedY;
    /* 0cc8 */ s16 cursorTargetX;
    /* 0cca */ s16 cursorTargetY;
    /* 0ccc */ u16 cursorMoveSteps;
    /* 0cce */ s8 cursorVerticalWrap;
    /* 0ccf */ s8 cursorHorizontalWrap;
    /* 0cd0 */ u8 newCursorArea;
    /* 0cd1 */ u8 newCursorPosition;
    /* 0cd2 */ u8 cursorPrevHorizPos;
    /* 0cd3 */ u8 cursorFlipTimer;
    /* 0cd4 */ u8 cursorPalNums[2];
    /* 0cd8 */ const u32 *displayMonPalette;
    /* 0cdc */ u32 displayMonPersonality;
    /* 0ce0 */ u16 displayMonSpecies;
    /* 0ce2 */ u16 displayMonItemId;
    /* 0ce4 */ u16 displayUnusedVar;
    /* 0ce6 */ bool8 setMosaic;
    /* 0ce7 */ u8 cursorMonMarkings;
    /* 0ce8 */ u8 cursorMonLevel;
    /* 0ce9 */ bool8 cursorMonIsEgg;
    /* 0cea */ u8 cursorMonNick[POKEMON_NAME_LENGTH + 1];
    /* 0cf5 */ u8 cursorMonTexts[4][36];
    /* 0d88 */ bool8 (*monPlaceChangeFunc)(void);
    /* 0d8c */ u8 monPlaceChangeState;
    /* 0d8d */ u8 shiftBoxId;
    /* 0d90 */ struct Sprite *markingComboSprite;
    /* 0d94 */ struct Sprite *waveformSprites[2];
    /* 0d9c */ u16 *markingComboTilesPtr;
    /* 0da0 */ struct MonMarkingsMenu markMenu;
    /* 1e58 */ struct ChooseBoxMenu chooseBoxMenu;
    /* 20a0 */ struct Pokemon movingMon;
    /* 2104 */ struct Pokemon tempMon;
    /* 2168 */ bool8 canReleaseMon;
    /* 2169 */ bool8 releaseStatusResolved;
    /* 216c */ bool8 isSurfMon;
    /* 216d */ bool8 isDiveMon;
    /* 216a */ s8 releaseCheckBoxId;
    /* 216b */ s8 releaseCheckBoxPos;
    /* 216e */ s8 releaseBoxId;
    /* 216f */ s8 releaseBoxPos;
    /* 2170 */ u16 releaseCheckState;
    /* 2172 */ u16 restrictedMoveList[3];
    /* 2178 */ u8 summaryMaxPos;
    /* 2179 */ u8 summaryStartPos;
    /* 217a */ u8 summaryScreenMode;
    /* 217c */ union
    {
        struct Pokemon *mon;
        struct BoxPokemon *box;
    } summaryMon;
    /* 2180 */ u8 messageText[40];
    /* 21a8 */ u8 boxTitleText[40];
    /* 21d0 */ u8 releaseMonName[POKEMON_NAME_LENGTH + 1];
    /* 21db */ u8 itemName[20];
    /* 21ef */ u8 inBoxMovingMode;
    /* 21f0 */ u16 multiMoveWindowId;
    /* 21f4 */ struct ItemIcon itemIconSprites[MAX_ITEM_ICONS];
    /* 2224 */ u16 movingItemId;
    /* 2226 */ u16 itemInfoWindowOffset;
    /* 2228 */ struct PssQuestLogBuffer qlogBuffer;
    /* 2230 */ u8 unkUnused2; // Unused
    /* 2232 */ u16 displayMonPalOffset;
    /* 2234 */ u16 *displayMonTilePtr;
    /* 2238 */ struct Sprite *displayMonSprite;
    /* 223c */ u16 displayMonPalBuffer[0x40];
    /* 22bc */ u8 tileBuffer[0x800];
    /* 2abc */ u8 unusedBuffer[0x1800]; // Unused
    /* 42bc */ u8 itemIconBuffer[0x800];
    /* 4abc */ u8 wallpaperBgTilemapBuffer[BG_SCREEN_SIZE * 2];
    /* 5abc */ u8 displayMenuTilemapBuffer[BG_SCREEN_SIZE];
}; // size=62bc

extern struct PokemonStorageSystemData *sStorage;

void CB2_EnterPokeStorage(u8 boxOption);
u8 GetCurrentBoxOption(void);
struct Sprite *CreateChooseBoxArrows(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority);
void SetBoxWallpaper(u8 boxId, u8 wallpaperId);
void SetCurrentBox(u8 boxId);
void BoxMonAtToMon(u8 boxId, u8 boxPosition, struct Pokemon * dst);
void SetBoxMonAt(u8 boxId, u8 boxPosition, struct BoxPokemon * src);

void CB2_ExitPokeStorage(void);
void FreeBoxSelectionPopupSpriteGfx(void);
void CreateChooseBoxMenuSprites(u8 curBox);
void DestroyChooseBoxMenuSprites(void);
u8 HandleBoxChooseSelectionInput(void);
void LoadBoxSelectionPopupSpriteGfx(struct ChooseBoxMenu *menu, u16 tileTag, u16 palTag, u8 subpriority, bool32 loadPal);
void SetCurrentBoxMonData(u8 boxPosition, s32 request, const void *value);
u32 GetCurrentBoxMonData(u8 boxPosition, s32 request);
u32 GetAndCopyBoxMonDataAt(u8 boxId, u8 boxPosition, s32 request, void *dst);

void InitCursor(void);
void InitCursorOnReopen(void);
bool8 UpdateCursorPos(void);
void SetCursorInParty(void);
void SetCursorBoxPosition(u8 cursorBoxPosition);
void ClearSavedCursorPos(void);
void SaveCursorPos(void);
u8 GetSavedCursorPos(void);
void RefreshDisplayMon(void);
void ResetSelectionAfterDeposit(void);
void InitReleaseMon(void);
bool8 TryHideReleaseMon(void);
void TrySetCursorFistAnim(void);
void SaveMovingMon(void);
void LoadSavedMovingMon(void);
void InitSummaryScreenData(void);
void SetSelectionAfterSummaryScreen(void);
void StartCursorAnim(u8 animNum);
u8 PSS_GetMovingMonOrigBoxId(void);
void TryHideItemAtCursor(void);
void TryShowItemAtCursor(void);
bool8 IsMenuLoading(void);
s16 PokeStorage_HandleMenuInput(void);
void RemoveMenu(void);
bool8 MultiMove_Init(void);
void MultiMove_Free(void);
void MultiMove_SetFunction(u8 a0);
bool8 MultiMove_RunFunction(void);
void CreateItemIconSprites(void);
void MoveItemFromCursorToBag(void);
void MoveHeldItemWithPartyMenu(void);
bool8 IsItemIconAnimActive(void);
const u8 *GetMovingItemName(void);
void InitItemInfoWindow(void);
bool8 UpdateItemInfoWindowSlideIn(void);
bool8 UpdateItemInfoWindowSlideOut(void);
void PSS_InitCopyAndFillManager(struct UnkUtil *manager, struct UnkUtilData *specs, u32 count);
void UnkUtil_Run(void);
void AddMenu(void);
bool8 CanMovePartyMon(void);
bool8 CanShiftMon(void);
bool8 DoMonPlaceChange(void);
bool8 DoWallpaperGfxChange(void);
u8 GetBoxCursorPosition(void);
u16 GetMovingItem(void);
u8 HandleInput(void);
void InitCanReleaseMonVars(void);
void InitMonPlaceChange(u8 a0);
bool8 IsActiveItemMoving(void);
bool8 IsCursorOnCloseBox(void);
bool8 IsMonBeingMoved(void);
void Item_FromMonToMoving(u8 cursorArea, u8 cursorPos);
void Item_GiveMovingToMon(u8 cursorArea, u8 cursorPos);
void Item_SwitchMonsWithMoving(u8 cursorArea, u8 cursorPos);
void Item_TakeMons(u8 cursorArea, u8 cursorPos);
void PrintItemDescription(void);
void ReleaseMon(void);
s8 RunCanReleaseMon(void);
bool8 ScrollToBox(void);
void SetMonMarkings(u8 markings);
void SetMovingMonPriority(u8 priority);
void SetUpScrollToBox(u8 targetBox);
void SetWallpaperForCurrentBox(u8 wallpaper);
bool8 TryStorePartyMonInBox(u8 boxId);
void InitMenu(void);
void SetMenuText(u8 textId);
void TryLoadItemIconAtPos(u8 cursorArea, u8 cursorPos);
void InitItemIconInCursor(u16 itemId);
u8 GetBoxWallpaper(u8 boxId);
bool8 IsCursorOnBox(void);
bool8 IsCursorInBox(void);

void InitMonIconFields(void);
struct Sprite * CreateMonIconSprite(u16 species, u32 pid, s16 x, s16 y, u8 priority, u8 subpriority);
void CreatePartyMonsSprites(bool8 visible);
void CompactPartySprites(void);
bool8 GetNumPartySpritesCompacting(void);
void MovePartySprites(s16 yDelta);
void DestroyAllPartyMonIcons(void);
void ReshowReleaseMon(void);
bool8 ResetReleaseMonSpritePtr(void);
void CreateInitBoxTask(u8 box);
bool8 IsInitBoxActive(void);
void AnimateBoxScrollArrows(bool8 animate);
void CreateMovingMonIcon(void);
void SaveMonSpriteAtPos(u8 boxId, u8 cursorPos);
bool8 MoveShiftingMons(void);
void SetMovingMonSprite(u8 cursorArea, u8 cursorPos);
void SetPlacedMonSprite(u8 cursorArea, u8 cursorPos);
void DestroyPartyMonIcon(u8 partyId);
void DestroyMovingMonIcon(void);
s16 GetFirstFreeBoxSpot(u8 boxId);
void CreateBoxMonIconAtPos(u8 boxPosition);
void SetReleaseMon(u8 mode, u8 position);
bool8 TryHideReleaseMonSprite(void);
void DestroyReleaseMonIcon(void);
u8 CountPartyMons(void);
u8 CountPartyAliveNonEggMonsExcept(u8 slotToIgnore);

s8 GetMenuItemTextId(u8 a0);
bool8 MultiMove_TryMoveGroup(u8 action);
u8 MultiMove_GetOrigin(void);
bool8 MultiMove_CanPlaceSelection(void);
void TryHideItemIconAtPos(u8 cursorArea, u8 cursorPos);
void GetCursorBoxColumnAndRow(u8 *col_p, u8 *row_p);
void SetCursorPriorityTo1(void);
void InitMultiMonPlaceChange(bool8 up);
void DestroyBoxMonIconAtPosition(u8 boxPosition);
void SetBoxMonIconObjMode(u8 cursorPos, u8 objMode);
void SetPartyMonIconObjMode(u8 cursorPos, u8 objMode);

#endif //GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
