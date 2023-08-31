#ifndef GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
#define GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H

#include "pokemon_storage_system.h"
#include "mon_markings.h"
#include "quest_log.h"

// The maximum number of Pokémon icons that can appear on-screen.
// By default the limit is 40 (though in practice only 37 can be).
#define MAX_MON_ICONS (IN_BOX_COUNT + PARTY_SIZE + 1 >= 40 ? IN_BOX_COUNT + PARTY_SIZE + 1 : 40)

// The maximum number of item icons that can appear on-screen while
// moving held items. 1 in the cursor, and 2 more while switching
// between 2 Pokémon with held items
#define MAX_ITEM_ICONS 3

enum
{
    OPTION_WITHDRAW,
    OPTION_DEPOSIT,
    OPTION_MOVE_MONS,
    OPTION_MOVE_ITEMS,
    OPTION_EXIT,
    OPTIONS_COUNT
};

enum
{
    MENU_TEXT_CANCEL,
    MENU_TEXT_STORE,
    MENU_TEXT_WITHDRAW,
    MENU_TEXT_MOVE,
    MENU_TEXT_SHIFT,
    MENU_TEXT_PLACE,
    MENU_TEXT_SUMMARY,
    MENU_TEXT_RELEASE,
    MENU_TEXT_MARK,
    MENU_TEXT_JUMP,
    MENU_TEXT_WALLPAPER,
    MENU_TEXT_NAME,
    MENU_TEXT_TAKE,
    MENU_TEXT_GIVE,
    MENU_TEXT_GIVE2,
    MENU_TEXT_SWITCH,
    MENU_TEXT_BAG,
    MENU_TEXT_INFO,
    MENU_TEXT_SCENERY_1,
    MENU_TEXT_SCENERY_2,
    MENU_TEXT_SCENERY_3,
    MENU_TEXT_ETCETERA,
    MENU_TEXT_FOREST,
    MENU_TEXT_CITY,
    MENU_TEXT_DESERT,
    MENU_TEXT_SAVANNA,
    MENU_TEXT_CRAG,
    MENU_TEXT_VOLCANO,
    MENU_TEXT_SNOW,
    MENU_TEXT_CAVE,
    MENU_TEXT_BEACH,
    MENU_TEXT_SEAFLOOR,
    MENU_TEXT_RIVER,
    MENU_TEXT_SKY,
    MENU_TEXT_POLKADOT,
    MENU_TEXT_POKECENTER,
    MENU_TEXT_MACHINE,
    MENU_TEXT_SIMPLE,
};

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
    RELEASE_MON_NOT_ALLOWED,
    RELEASE_MON_ALLOWED,
    RELEASE_MON_UNDETERMINED = -1,
};

enum
{
    MODE_PARTY,
    MODE_BOX,
    MODE_MOVE,
};

enum
{
    CURSOR_AREA_IN_BOX,
    CURSOR_AREA_IN_PARTY,
    CURSOR_AREA_BOX_TITLE,
    CURSOR_AREA_BUTTONS, // Party Pokemon and Close Box
};
#define CURSOR_AREA_IN_HAND CURSOR_AREA_BOX_TITLE // Alt name for cursor area used by Move Items

// IDs for InitMonPlaceChange
enum
{
    CHANGE_GRAB,
    CHANGE_PLACE,
    CHANGE_SHIFT,
};

// IDs for the main functions for moving multiple Pokémon.
// Given as arguments to MultiMove_SetFunction
enum
{
    MULTIMOVE_START,
    MULTIMOVE_SINGLE,
    MULTIMOVE_CHANGE_SELECTION,
    MULTIMOVE_GRAB_SELECTION,
    MULTIMOVE_MOVE_MONS,
    MULTIMOVE_PLACE_MONS,
};

enum
{
    PALTAG_MON_ICON_0 = 56000,
    PALTAG_MON_ICON_1, // Used implicitly in CreateMonIconSprite
    PALTAG_MON_ICON_2, // Used implicitly in CreateMonIconSprite
    PALTAG_3, // Unused
    PALTAG_4, // Unused
    PALTAG_5, // Unused
    PALTAG_DISPLAY_MON,
    PALTAG_MISC_1, // Used by cursor in multimove mode, choose box menu popup
    PALTAG_MARKING_COMBO,
    PALTAG_BOX_TITLE,
    PALTAG_MISC_2, // Used by waveforms, cursor in normal mode, cursor shadow, box scroll arrows
    PALTAG_ITEM_ICON_0,
    PALTAG_ITEM_ICON_1, // Used implicitly in CreateItemIconSprites
    PALTAG_ITEM_ICON_2, // Used implicitly in CreateItemIconSprites
    PALTAG_MARKING_MENU,
};

enum
{
    GFXTAG_CURSOR,
    GFXTAG_CURSOR_SHADOW,
    GFXTAG_DISPLAY_MON,
    GFXTAG_BOX_TITLE,
    GFXTAG_BOX_TITLE_ALT,
    GFXTAG_WAVEFORM,
    GFXTAG_BOX_SCROLL_ARROW,
    GFXTAG_ITEM_ICON_0,
    GFXTAG_ITEM_ICON_1, // Used implicitly in CreateItemIconSprites
    GFXTAG_ITEM_ICON_2, // Used implicitly in CreateItemIconSprites
    GFXTAG_CHOOSE_BOX_MENU_CENTER,
    GFXTAG_CHOOSE_BOX_MENU_CORNERS, // Used implicitly in LoadChooseBoxMenuGfx
    GFXTAG_12, // Unused
    GFXTAG_MARKING_MENU,
    GFXTAG_14, // Unused
    GFXTAG_15, // Unused
    GFXTAG_MARKING_COMBO,
    GFXTAG_17, // Unused
    GFXTAG_MON_ICON,
};

// Special box ids for the choose box menu
#define BOXID_NONE_CHOSEN 200
#define BOXID_CANCELED    201


enum {
    CURSOR_ANIM_BOUNCE,
    CURSOR_ANIM_STILL,
    CURSOR_ANIM_OPEN,
    CURSOR_ANIM_FIST,
};

enum
{
    RELEASE_ANIM_RELEASE,
    RELEASE_ANIM_COME_BACK,
};

// IDs for the item icons affine anims
enum
{
    ITEM_ANIM_NONE,
    ITEM_ANIM_APPEAR,
    ITEM_ANIM_DISAPPEAR,
    ITEM_ANIM_PICK_UP,
    ITEM_ANIM_PUT_DOWN,
    ITEM_ANIM_PUT_AWAY,
    ITEM_ANIM_LARGE,
};

struct Wallpaper
{
    const u32 *tiles;
    const u32 *tileMap;
    const u16 *palettes;
};

struct StorageMessage
{
    const u8 *text;
    u8 format;
};

struct ChooseBoxMenu
{
    struct Sprite *menuSprite;
    struct Sprite *menuCornerSprites[4];
    u32 unused1[3];
    struct Sprite *arrowSprites[2];
    u8 buffer[0x200]; // passed but not used
    u8 strbuf[20];
    bool32 loadedPalette;
    u16 tileTag;
    u16 paletteTag;
    u8 curBox;
    u8 unused3;
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
    u16 size;
    u16 unk;
    u16 height;
    void (*func)(struct UnkUtilData *data);
};

struct UnkUtil
{
    struct UnkUtilData *data;
    u8 numActive;
    u8 max;
};

struct PokeStorageItemIcon
{
    struct Sprite *sprite;
    u8 *tiles;
    u16 palIndex;
    u8 cursorArea;
    u8 cursorPos;
    u8 active;
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
    u16 partyMenuTilemapBuffer[0x108];
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
    s16 scrollDirectionUnused; // Never read.
    u16 scrollUnused3; // Never read
    u16 scrollUnused4; // Never read
    u16 scrollUnused5; // Never read
    u16 scrollUnused6; // Never read
    u8 filler1[22];
    u8 boxTitleTiles[512];
    u8 boxTitleUnused[512];
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
    u16 unusedField1; // Never read.
    s16 wallpaperSetId;
    s16 wallpaperId;
    u16 wallpaperTilemap[360];
    u8 wallpaperChangeState;
    u8 scrollState;
    u8 scrollToBoxId;
    s8 scrollDirection;
    // u8 *wallpaperTiles; // used only in Emerald for Walda
    struct Sprite *movingMonSprite;
    struct Sprite *partySprites[PARTY_SIZE];
    struct Sprite *boxMonsSprites[IN_BOX_COUNT];
    struct Sprite **shiftMonSpritePtr;
    struct Sprite **releaseMonSpritePtr;
    u16 numIconsPerSpecies[MAX_MON_ICONS];
    u16 iconSpeciesList[MAX_MON_ICONS];
    u16 boxSpecies[IN_BOX_COUNT];
    u32 boxPersonalities[IN_BOX_COUNT];
    u8 incomingBoxId;
    u8 shiftTimer;
    u8 numPartySpritesToCompact;
    u16 iconScrollDistance;
    s16 iconScrollPos;
    s16 iconScrollSpeed;
    u16 iconScrollNumIncoming;
    u8 iconScrollCurColumn;
    s8 iconScrollDirection; // Unnecessary duplicate of scrollDirection
    u8 iconScrollState;
    u8 iconScrollToBoxId; // Unused duplicate of scrollToBoxId
    struct WindowTemplate menuWindow;
    struct StorageMenu menuItems[7];
    u8 menuItemsCount;
    u8 menuWidth;
    u8 menuUnusedField; // Never read.
    u16 menuWindowId;
    struct Sprite *cursorSprite;
    struct Sprite *cursorShadowSprite;
    s32 cursorNewX;
    s32 cursorNewY;
    u32 cursorSpeedX;
    u32 cursorSpeedY;
    s16 cursorTargetX;
    s16 cursorTargetY;
    u16 cursorMoveSteps;
    s8 cursorVerticalWrap;
    s8 cursorHorizontalWrap;
    u8 newCursorArea;
    u8 newCursorPosition;
    u8 cursorPrevPartyPos;
    u8 cursorFlipTimer;
    u8 cursorPalNums[2];
    const u32 *displayMonPalette;
    u32 displayMonPersonality;
    u16 displayMonSpecies;
    u16 displayMonItemId;
    u16 displayUnusedVar;
    bool8 setMosaic;
    u8 displayMonMarkings;
    u8 displayMonLevel;
    bool8 displayMonIsEgg;
    u8 displayMonNickname[POKEMON_NAME_LENGTH + 1];
    u8 displayMonTexts[4][36]; // nickname, species name, gender and level, item name
    bool8 (*monPlaceChangeFunc)(void);
    u8 monPlaceChangeState;
    u8 shiftBoxId;
    struct Sprite *markingComboSprite;
    struct Sprite *waveformSprites[2];
    u16 *markingComboTilesPtr;
    struct MonMarkingsMenu markMenu;
    struct ChooseBoxMenu chooseBoxMenu;
    struct Pokemon movingMon;
    struct Pokemon tempMon;
    s8 releaseMonStatus;
    bool8 releaseMonStatusResolved;
    bool8 isSurfMon;
    bool8 isDiveMon;
    s8 releaseCheckBoxId;
    s8 releaseCheckBoxPos;
    s8 releaseBoxId;
    s8 releaseBoxPos;
    u16 releaseCheckState;
    u16 restrictedMoveList[3];
    u8 summaryLastIndex;
    u8 summaryCursorPos;
    u8 summaryScreenMode;
    union
    {
        struct Pokemon *mon;
        struct BoxPokemon *box;
    } summaryMonPtr;
    u8 actionText[40];
    u8 boxTitleText[40];
    u8 releaseMonName[POKEMON_NAME_LENGTH + 1];
    u8 itemName[20];
    u8 inBoxMovingMode;
    u16 multiMoveWindowId;
    struct PokeStorageItemIcon itemIcons[MAX_ITEM_ICONS];
    u16 movingItemId;
    u16 itemInfoWindowOffset;
    struct QuestLogEvent_MovedBoxMon questLogData;
    u16 unusedField2;
    u16 displayMonPalOffset;
    u16 *displayMonTilePtr;
    struct Sprite *displayMonSprite;
    u16 displayMonPalBuffer[0x20];
    u8 unusedBuffer1[0x40];
    u8 tileBuffer[0x800];
    u8 unusedBuffer2[0x1800];
    u8 itemIconBuffer[0x200];
    u8 unusedBuffer3[0x600];
    u8 wallpaperBgTilemapBuffer[0x1000];
    u8 menuTilemapBuffer[0x800];
};

extern struct PokemonStorageSystemData *gStorage;

void EnterPokeStorage(u8 boxOption);
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
void LoadChooseBoxMenuGfx(struct ChooseBoxMenu *menu, u16 tileTag, u16 palTag, u8 subpriority, bool32 loadPal);
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
void DoTrySetDisplayMonData(void);
void ResetSelectionAfterDeposit(void);
void InitReleaseMon(void);
bool8 TryHideReleaseMon(void);
void TrySetCursorFistAnim(void);
void SaveMovingMon(void);
void LoadSavedMovingMon(void);
void InitSummaryScreenData(void);
void SetSelectionAfterSummaryScreen(void);
void StartCursorAnim(u8 animNum);
u8 GetMovingMonOriginalBoxId(void);
void TryHideItemAtCursor(void);
void TryShowItemAtCursor(void);
bool8 IsMenuLoading(void);
s16 HandleMenuInput(void);
void RemoveMenu(void);
bool8 MultiMove_Init(void);
void MultiMove_Free(void);
void MultiMove_SetFunction(u8 funcId);
bool8 MultiMove_RunFunction(void);
void CreateItemIconSprites(void);
void MoveItemFromCursorToBag(void);
void MoveHeldItemWithPartyMenu(void);
bool8 IsItemIconAnimActive(void);
const u8 *GetMovingItemName(void);
void InitItemInfoWindow(void);
bool8 UpdateItemInfoWindowSlideIn(void);
bool8 UpdateItemInfoWindowSlideOut(void);
void UnkUtil_Init(struct UnkUtil *arg0, struct UnkUtilData *arg1, u32 arg2);
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
void InitMonPlaceChange(u8 type);
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
bool8 IsCursorOnBoxTitle(void);
bool8 IsCursorInBox(void);

void InitMonIconFields(void);
struct Sprite *CreateMonIconSprite(u16 species, u32 pid, s16 x, s16 y, u8 priority, u8 subpriority);
void CreatePartyMonsSprites(bool8 species);
void CompactPartySprites(void);
u8 GetNumPartySpritesCompacting(void);
void MovePartySprites(s16 yDelta);
void DestroyAllPartyMonIcons(void);
void DoReleaseMonComeBackAnim(void);
bool8 ResetReleaseMonSpritePtr(void);
void CreateInitBoxTask(u8 boxId);
bool8 IsInitBoxActive(void);
void AnimateBoxScrollArrows(bool8 species);
void CreateMovingMonIcon(void);
void SetShiftMonSpritePtr(u8 boxId, u8 position);
bool8 ShiftMons(void);
void SetMovingMonSprite(u8 cursorArea, u8 cursorPos);
void SetPlacedMonSprite(u8 cursorArea, u8 cursorPos);
void DestroyPartyMonIcon(u8 partyId);
void DestroyMovingMonIcon(void);
s16 GetFirstFreeBoxSpot(u8 boxId);
void CreateBoxMonIconAtPos(u8 boxPosition);
void DoReleaseMonAnim(u8 mode, u8 position);
bool8 TryHideReleaseMonSprite(void);
void DestroyReleaseMonIcon(void);
u8 CountPartyMons(void);
u8 CountPartyAliveNonEggMonsExcept(u8 slotToIgnore);

s8 GetMenuItemTextId(u8 menuIndex);
bool8 MultiMove_TryMoveGroup(u8 dir);
u8 MultiMove_GetOriginPosition(void);
bool8 MultiMove_CanPlaceSelection(void);
void TryHideItemIconAtPos(u8 cursorArea, u8 cursorPos);
void GetCursorBoxColumnAndRow(u8 *column, u8 *row);
void SetCursorPriorityTo1(void);
void InitMultiMonPlaceChange(bool8 moveCursorUp);
void DestroyBoxMonIconAtPosition(u8 boxPosition);
void SetBoxMonIconObjMode(u8 cursorPos, u8 objMode);
void SetPartyMonIconObjMode(u8 cursorPos, u8 objMode);

#endif //GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
