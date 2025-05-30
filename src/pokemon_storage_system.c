#include "global.h"
#include "gflib.h"
#include "data.h"
#include "decompress.h"
#include "dynamic_placeholder_text_util.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "graphics.h"
#include "help_system.h"
#include "item.h"
#include "item_icon.h"
#include "item_menu.h"
#include "mail.h"
#include "menu.h"
#include "mon_markings.h"
#include "naming_screen.h"
#include "overworld.h"
#include "pc_screen_effect.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system.h"
#include "pokemon_summary_screen.h"
#include "quest_log.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "trig.h"
#include "constants/help_system.h"
#include "constants/item_menu.h"
#include "constants/items.h"
#include "constants/pokemon_icon.h"
#include "constants/songs.h"


enum
{
    RELEASE_MON_NOT_ALLOWED,
    RELEASE_MON_ALLOWED,
    RELEASE_MON_UNDETERMINED = -1,
};

enum
{
#if OW_PC_MOVE_ORDER <= GEN_3
    OPTION_WITHDRAW,
    OPTION_DEPOSIT,
    OPTION_MOVE_MONS,
#elif OW_PC_MOVE_ORDER >= GEN_4 && OW_PC_MOVE_ORDER <= GEN_6_XY
    OPTION_DEPOSIT,
    OPTION_WITHDRAW,
    OPTION_MOVE_MONS,
#elif OW_PC_MOVE_ORDER >= GEN_7
    OPTION_MOVE_MONS,
    OPTION_DEPOSIT,
    OPTION_WITHDRAW,
#endif
    OPTION_MOVE_ITEMS,
    OPTION_EXIT,
    OPTIONS_COUNT
};

enum
{
    MSG_EXIT_BOX,
    MSG_WHAT_YOU_DO,
    MSG_PICK_A_THEME,
    MSG_PICK_A_WALLPAPER,
    MSG_IS_SELECTED,
    MSG_JUMP_TO_WHICH_BOX,
    MSG_DEPOSIT_IN_WHICH_BOX,
    MSG_WAS_DEPOSITED,
    MSG_BOX_IS_FULL,
    MSG_RELEASE_POKE,
    MSG_WAS_RELEASED,
    MSG_BYE_BYE,
    MSG_MARK_POKE,
    MSG_LAST_POKE,
    MSG_PARTY_FULL,
    MSG_HOLDING_POKE,
    MSG_WHICH_ONE_WILL_TAKE,
    MSG_CANT_RELEASE_EGG,
    MSG_CONTINUE_BOX,
    MSG_CAME_BACK,
    MSG_WORRIED,
    MSG_SURPRISE,
    MSG_PLEASE_REMOVE_MAIL,
    MSG_IS_SELECTED2,
    MSG_GIVE_TO_MON,
    MSG_PLACED_IN_BAG,
    MSG_BAG_FULL,
    MSG_PUT_IN_BAG,
    MSG_ITEM_IS_HELD,
    MSG_CHANGED_TO_ITEM,
    MSG_CANT_STORE_MAIL,
};

enum
{
    MSG_FMT_NONE,
    MSG_FMT_MON_NAME_1,
    MSG_FMT_MON_NAME_2,
    MSG_FMT_MON_NAME_3,
    MSG_FMT_RELEASE_MON_1,
    MSG_FMT_RELEASE_MON_2,
    MSG_FMT_RELEASE_MON_3,
    MSG_FMT_ITEM_NAME,
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

#define GENDER_MASK 0x7FFF

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
    SCREEN_CHANGE_EXIT_BOX,
    SCREEN_CHANGE_SUMMARY_SCREEN,
    SCREEN_CHANGE_NAME_BOX,
    SCREEN_CHANGE_ITEM_FROM_BAG,
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

enum {
    CURSOR_ANIM_BOUNCE,
    CURSOR_ANIM_STILL,
    CURSOR_ANIM_OPEN,
    CURSOR_ANIM_FIST,
};

// Special box ids for the choose box menu
#define BOXID_NONE_CHOSEN 200
#define BOXID_CANCELED    201

enum
{
    PALTAG_MON_ICON_0 = POKE_ICON_BASE_PAL_TAG,
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

// The maximum number of Pokémon icons that can appear on-screen.
// By default the limit is 40 (though in practice only 37 can be).
#define MAX_MON_ICONS (IN_BOX_COUNT + PARTY_SIZE + 1 >= 40 ? IN_BOX_COUNT + PARTY_SIZE + 1 : 40)

// The maximum number of item icons that can appear on-screen while
// moving held items. 1 in the cursor, and 2 more while switching
// between 2 Pokémon with held items
#define MAX_ITEM_ICONS 3

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

// IDs for the item icon sprite callbacks
enum {
    ITEM_CB_WAIT_ANIM,
    ITEM_CB_TO_HAND,
    ITEM_CB_TO_MON,
    ITEM_CB_SWAP_TO_HAND,
    ITEM_CB_SWAP_TO_MON,
    ITEM_CB_UNUSED_1,
    ITEM_CB_UNUSED_2,
    ITEM_CB_HIDE_PARTY,
};

enum
{
    RELEASE_ANIM_RELEASE,
    RELEASE_ANIM_COME_BACK,
};

// IDs for InitMonPlaceChange
enum
{
    CHANGE_GRAB,
    CHANGE_PLACE,
    CHANGE_SHIFT,
};

// Modes for selecting and moving Pokémon in the box. Multiple Pokémon can be
// selected by pressing the Select button to change the cursor, then holding
// down the A button while moving the cursor around. This is
// MOVE_MODE_MULTIPLE_SELECTING. After releasing the A button, those Pokémon
// will be picked up and can be moved around as a single unit. This is
// MOVE_MODE_MULTIPLE_MOVING.
enum
{
    MOVE_MODE_NORMAL,
    MOVE_MODE_MULTIPLE_SELECTING,
    MOVE_MODE_MULTIPLE_MOVING,
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

enum {
    TILEMAP_PKMN_DATA, // The "Pkmn Data" text at the top of the display
    TILEMAP_PARTY_MENU,
    TILEMAP_CLOSE_BUTTON,
    TILEMAP_COUNT
};

// Window IDs for sWindowTemplates
enum {
    WIN_DISPLAY_INFO,
    WIN_MESSAGE,
    WIN_ITEM_DESC,
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
    const u16 *displayMonPalette;
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
    u8 ALIGNED(4) tileBuffer[MON_PIC_SIZE * MAX_MON_PIC_FRAMES];
    u8 ALIGNED(4) itemIconBuffer[0x200];
    u8 wallpaperBgTilemapBuffer[0x1000];
    u8 menuTilemapBuffer[0x800];
};

static EWRAM_DATA u8 sPreviousBoxOption = 0;
static EWRAM_DATA struct ChooseBoxMenu *sChooseBoxMenu = NULL;
EWRAM_DATA struct PokemonStorageSystemData *gStorage = NULL;
static EWRAM_DATA bool8 sInPartyMenu = 0;
static EWRAM_DATA u8 sCurrentBoxOption = 0;
static EWRAM_DATA u8 sDepositBoxId = 0;
static EWRAM_DATA u8 sWhichToReshow = 0;
static EWRAM_DATA u8 sLastUsedBox = 0;
static EWRAM_DATA u16 sMovingItemId = ITEM_NONE;
static EWRAM_DATA struct Pokemon sMonBeingCarried = {};
static EWRAM_DATA s8 sCursorArea = 0;
static EWRAM_DATA s8 sCursorPosition = 0;
static EWRAM_DATA bool8 sIsMonBeingMoved = FALSE;
static EWRAM_DATA u8 sMovingMonOrigBoxId = 0;
static EWRAM_DATA u8 sMovingMonOrigBoxPos = 0;
static EWRAM_DATA bool8 sInMultiMoveMode = FALSE;
static EWRAM_DATA u8 sSavedCursorPosition = 0;


// Main tasks
static void Task_InitPokeStorage(u8 taskId);
static void Task_ShowPokeStorage(u8 taskId);
static void Task_ReshowPokeStorage(u8 taskId);
static void Task_PokeStorageMain(u8 taskId);
static void Task_ShowPartyPokemon(u8 taskId);
static void Task_HidePartyPokemon(u8 taskId);
static void Task_OnSelectedMon(u8 taskId);
static void Task_MoveMon(u8 taskId);
static void Task_PlaceMon(u8 taskId);
static void Task_ShiftMon(u8 taskId);
static void Task_WithdrawMon(u8 taskId);
static void Task_DepositMenu(u8 taskId);
static void Task_ReleaseMon(u8 taskId);
static void Task_ShowMarkMenu(u8 taskId);
static void Task_TakeItemForMoving(u8 taskId);
static void Task_GiveMovingItemToMon(u8 taskId);
static void Task_ItemToBag(u8 taskId);
static void Task_SwitchSelectedItem(u8 taskId);
static void Task_ShowItemInfo(u8 taskId);
static void Task_HandleMovingMonFromParty(u8 taskId);

// Input handlers
static u8 HandleInput(void);

// Choose box menu
static void CreatePCMainMenu(u8 whichMenu, s16 *windowIdPtr);
static void ChooseBoxMenu_CreateSprites(u8 curBox);
static void ChooseBoxMenu_DestroySprites(void);
static void ChooseBoxMenu_MoveRight(void);
static void ChooseBoxMenu_MoveLeft(void);
static void ChooseBoxMenu_PrintBoxNameAndCount(void);
static void ChooseBoxMenu_PrintTextToSprite(const u8 *a0, u16 x, u16 y);
static void SpriteCB_ChooseBoxArrow(struct Sprite *sprite);

static void Task_PrintCantStoreMail(u8 taskId);
static void Task_HandleBoxOptions(u8 taskId);
static void Task_HandleWallpapers(u8 taskId);
static void Task_JumpBox(u8 taskId);
static void Task_NameBox(u8 taskId);
static void Task_ShowMonSummary(u8 taskId);
static void Task_GiveItemFromBag(u8 taskId);
static void Task_OnCloseBoxPressed(u8 taskId);
static void Task_OnBPressed(u8 taskId);
static void Task_ChangeScreen(u8 taskId);
static void GiveChosenBagItem(void);
static void FreePokeStorageData(void);
static void SetScrollingBackground(void);
static void ScrollBackground(void);
static void LoadPokeStorageMenuGfx(void);
static bool8 InitPokeStorageWindows(void);
static void LoadsMiscSpritePalette(void);
static void InitPalettesAndSprites(void);
static void CreateMarkingComboSprite(void);
static void CreateWaveformSprites(void);
static void RefreshDisplayMonData(void);
static void StartDisplayMonMosaic(void);
static void SpriteCB_DisplayMonMosaic(struct Sprite *sprite);
static bool8 IsDisplayMonMosaicActive(void);
static void CreateDisplayMonSprite(void);
static void LoadDisplayMonGfx(u16 species, u32 personality);
static void PrintDisplayMonInfo(void);
static void UpdateWaveformAnimation(void);
static void InitSupplementalTilemaps(void);
static void SetUpHidePartyMenu(void);
static bool8 HidePartyMenu(void);
static void UpdateCloseBoxButtonTilemap(bool8 normal);
static void StartFlashingCloseBoxButton(void);
static void StopFlashingCloseBoxButton(void);
static void UpdateCloseBoxButtonFlash(void);
static void SetPartySlotTilemaps(void);
static void SetPartySlotTilemap(u8 pos, bool8 isPartyMon);
static void UpdatePartySlotColors(void);
static void SetUpDoShowPartyMenu(void);
static bool8 DoShowPartyMenu(void);
static void InitPokeStorageBg0(void);
static void PrintStorageMessage(u8 textId);
static void ShowYesNoWindow(s8 cursorPos);
static void ClearBottomWindow(void);
static void AddWallpaperSetsMenu(void);
static void AddWallpapersMenu(u8 wallpaperSet);
static void InitCursorItemIcon(void);
static void SetPokeStorageQuestLogEvent(u8 species);
static void UpdateBoxToSendMons(void);

// Options menus
static void InitMenu(void);
static void SetMenuText(u8 textId);
static s8 GetMenuItemTextId(u8 menuIndex);
static void AddMenu(void);
static s16 HandleMenuInput(void);
static void RemoveMenu(void);
static bool8 IsMenuLoading(void);

// Pokémon sprites
static void InitMonIconFields(void);
static void SpriteCB_BoxMonIconScrollOut(struct Sprite *sprite);
static void SetBoxSpeciesAndPersonalities(u8 boxId);
static void MovePartySpriteToNextSlot(struct Sprite *sprite, u16 idx);
static void SpriteCB_MovePartySpriteToNextSlot(struct Sprite *sprite);
static void DestroyBoxMonIcon(struct Sprite *sprite);
static void SpriteCB_HeldMon(struct Sprite *sprite);
static void Task_InitBox(u8 taskId);
static s8 DetermineBoxScrollDirection(u8 boxId);
static void LoadWallpaperGfx(u8 wallpaperId, s8 direction);
static bool32 WaitForWallpaperGfxLoad(void);
static void DrawWallpaper(void *unused, const void *tilemap, s8 direction, u8 offset);
static void TrimOldWallpaper(void *buffer);
static void InitBoxTitle(u8 wallpaperId);
static void CreateIncomingBoxTitle(u8 wallpaperId, s8 direction);
static void SpriteCB_IncomingBoxTitle(struct Sprite *sprite);
static void SpriteCB_OutgoingBoxTitle(struct Sprite *sprite);
static s16 GetBoxTitleBaseX(const u8 *boxName);
static void CycleBoxTitleSprites(void);
static void CycleBoxTitleColor(void);
static void CreateBoxScrollArrows(void);
static void StartBoxScrollArrowsSlide(s8 direction);
static void StopBoxScrollArrowsSlide(void);
static void SpriteCB_BoxScrollArrow(struct Sprite *sprite);
static void CreatePartyMonsSprites(bool8 visible);
static void CompactPartySprites(void);
static u8 GetNumPartySpritesCompacting(void);
static void MovePartySprites(s16 yDelta);
static void DestroyAllPartyMonIcons(void);
static void DoReleaseMonComeBackAnim(void);
static bool8 ResetReleaseMonSpritePtr(void);
static void SetMovingMonPriority(u8 priority);
static struct Sprite *CreateMonIconSprite(u16 species, u32 personality, s16 x, s16 y, u8 oamPriority, u8 subpriority);

// Pokémon data
static bool8 TryStorePartyMonInBox(u8 boxId);
static void ResetSelectionAfterDeposit(void);
static void InitReleaseMon(void);
static bool8 TryHideReleaseMon(void);
static void InitCanReleaseMonVars(void);
static void ReleaseMon(void);
static s8 RunCanReleaseMon(void);
static void SaveMovingMon(void);
static void LoadSavedMovingMon(void);
static void InitSummaryScreenData(void);
static void SetSelectionAfterSummaryScreen(void);
static void SetMonMarkings(u8 markings);
static bool8 CanPlaceMon(void);
static bool8 CanShiftMon(void);
static bool8 IsMonBeingMoved(void);
static void DoTrySetDisplayMonData(void);

static bool8 CanMovePartyMon(void);
static u8 GetMovingMonOriginalBoxId(void);

// Moving multiple Pokémon at once
static bool8 MultiMove_Init(void);
static void MultiMove_Free(void);
static bool8 MultiMove_CanPlaceSelection(void);
static u8 MultiMove_GetOriginPosition(void);
static void MultiMove_SetFunction(u8 funcId);
static bool8 MultiMove_RunFunction(void);
static bool8 MultiMove_TryMoveGroup(u8 dir);
static bool8 MultiMove_Function_Start(void);
static bool8 MultiMove_Function_Single(void);
static bool8 MultiMove_Function_ChangeSelection(void);
static bool8 MultiMove_Function_GrabSelection(void);
static bool8 MultiMove_Function_MoveMons(void);
static bool8 MultiMove_Function_PlaceMons(void);
static void MultiMove_UpdateSelectedIcons(void);
static void MultiMove_SelectColumn(u8 column, u8 minRow, u8 maxRow);
static void MultiMove_SelectRow(u8 row, u8 minColumn, u8 maxColumn);
static void MultiMove_DeselectColumn(u8 arg0, u8 minRow, u8 maxRow);
static void MultiMove_DeselectRow(u8 row, u8 minColumn, u8 maxColumn);
static void MultiMove_SetIconToBg(u8 x, u8 y);
static void MultiMove_ClearIconFromBg(u8 x, u8 y);
static void MultiMove_InitBg(u16 bgX, u16 bgY, u16 duration);
static u8 MultiMove_UpdateBg(void);
static void MultiMove_GetMonsFromSelection(void);
static void MultiMove_RemoveMonsFromBox(void);
static void MultiMove_CreatePlacedMonIcons(void);
static void MultiMove_SetPlacedMonData(void);
static void MultiMove_ResetBg(void);

// Move Items mode
static bool32 IsItemIconAtPosition(u8 cursorArea, u8 cursorPos);
static u8 GetNewItemIconIdx(void);
static u8 GetItemIconIdxByPosition(u8 cursorArea, u8 cursorPos);
static void SetItemIconPosition(u8 id, u8 cursorArea, u8 cursorPos);
static void LoadItemIconGfx(u8 id, const u32 * tiles, const u16 * pal);
static void SetItemIconAffineAnim(u8 id, u8 affineAnimNo);
static void SetItemIconCallback(u8 id, u8 command, u8 cursorArea, u8 cursorPos);
static void SetItemIconActive(u8 id, bool8 show);
static void DrawItemInfoWindow(u32 x);
static void SpriteCB_ItemIcon_WaitAnim(struct Sprite *sprite);
static void SpriteCB_ItemIcon_ToHand(struct Sprite *sprite);
static void SpriteCB_ItemIcon_SetPosToCursor(struct Sprite *sprite);
static void SpriteCB_ItemIcon_ToMon(struct Sprite *sprite);
static void SpriteCB_ItemIcon_SwapToHand(struct Sprite *sprite);
static void SpriteCB_ItemIcon_SwapToMon(struct Sprite *sprite);
static void SpriteCB_ItemIcon_HideParty(struct Sprite *sprite);
static bool8 UpdateItemInfoWindowSlideIn(void);
static bool8 UpdateItemInfoWindowSlideOut(void);
static void InitItemInfoWindow(void);
static void PrintItemDescription(void);
static u16 GetMovingItem(void);
static bool8 IsActiveItemMoving(void);
static bool8 IsItemIconAnimActive(void);
static void MoveHeldItemWithPartyMenu(void);
static const u8 *GetMovingItemName(void);
static void MoveItemFromCursorToBag(void);
static void Item_TakeMons(u8 cursorArea, u8 cursorPos);
static void Item_GiveMovingToMon(u8 cursorArea, u8 cursorPos);
static void Item_SwitchMonsWithMoving(u8 cursorArea, u8 cursorPos);
static void InitItemIconInCursor(u16 item);
static void Item_FromMonToMoving(u8 cursorArea, u8 cursorPos);
static void TryHideItemIconAtPos(u8 cursorArea, u8 cursorPos);
static void TryLoadItemIconAtPos(u8 cursorArea, u8 cursorPos);
static void CreateItemIconSprites(void);

// Cursor
static u8 GetBoxCursorPosition(void);
static void StartCursorAnim(u8 animNum);
static void TryHideItemAtCursor(void);
static void TryShowItemAtCursor(void);
static void InitCursor(void);
static void InitCursorOnReopen(void);
static bool8 UpdateCursorPos(void);
static void SetCursorInParty(void);
static void SetCursorBoxPosition(u8 cursorBoxPosition);
static void ClearSavedCursorPos(void);
static void DoCursorNewPosUpdate(void);
static void MoveMon(void);
static void PlaceMon(void);
static void SetMovedMonData(u8 boxId, u8 cursorPos);
static void SetPlacedMonData(u8 boxId, u8 cursorPos);
static void PurgeMonOrBoxMon(u8 boxId, u8 cursorPos);
static void SetShiftedMonData(u8 boxId, u8 cursorPos);
static void TrySetDisplayMonData(void);
static void SetDisplayMonData(void *pokemon, u8 mode);
static void ReshowDisplayMon(void);
static u8 HandleInput_InBox_Normal(void);
static u8 HandleInput_InBox_GrabbingMultiple(void);
static u8 HandleInput_InBox_MovingMultiple(void);
static void AddBoxMenu(void);
static bool8 SetSelectionMenuTexts(void);
static bool8 SetMenuTextsForMon(void);
static bool8 SetMenuTextsForItem(void);
static void CreateCursorSprites(void);
static void ToggleCursorMultiMoveMode(void);
static void SaveCursorPos(void);
static u8 GetSavedCursorPos(void);
static void InitMonPlaceChange(u8 type);
static bool8 DoMonPlaceChange(void);
static bool8 MonPlaceChange_Shift(void);
static bool8 MonPlaceChange_Grab(void);
static bool8 MonPlaceChange_Place(void);
static bool8 MonPlaceChange_DoMoveCursorUp(void);
static bool8 MonPlaceChange_DoMoveCursorDown(void);
static bool8 MonPlaceChange_MoveCursorUp(void);
static bool8 MonPlaceChange_MoveCursorDown(void);
static void TrySetCursorFistAnim(void);
static bool8 IsCursorOnCloseBox(void);
static bool8 IsCursorOnBoxTitle(void);
static bool8 IsCursorInBox(void);

// Scroll arrows
static void AnimateBoxScrollArrows(bool8 animate);
static struct Sprite *CreateChooseBoxArrows(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority);

// Box title

// Wallpaper
static void SetWallpaperForCurrentBox(u8 wallpaperId);
static bool8 DoWallpaperGfxChange(void);
static u8 GetBoxWallpaper(u8 boxId);
static void SetBoxWallpaper(u8 boxId, u8 wallpaperId);

// General box
static void CreateInitBoxTask(u8 boxId);
static bool8 IsInitBoxActive(void);
static void SetUpScrollToBox(u8 boxId);
static bool8 ScrollToBox(void);
static void SetCurrentBox(u8 boxId);

// Misc
static u8 GetCurrentBoxOption(void);

// Tilemap utility
static void TilemapUtil_SetRect(u8 tilemapId, u16 x, u16 y, u16 width, u16 height);
static void TilemapUtil_Move(u8 tilemapId, u8 mode, s8 param);
static void TilemapUtil_SetTilemap(u8 tilemapId, u8 bg, const void *tilemap, u16 width, u16 height);
static void TilemapUtil_SetPos(u8 tilemapId, u16 destX, u16 destY);
static void TilemapUtil_Init(u8 numTilemapIds);
static void TilemapUtil_Free(void);
static void TilemapUtil_Update(u8 tilemapId);
static void TilemapUtil_DrawPrev(u8 tilemapId);
static void TilemapUtil_Draw(u8 tilemapId);

struct {
    const u8 *text;
    const u8 *desc;
} static const sMainMenuTexts[OPTIONS_COUNT] = {
    [OPTION_WITHDRAW]   = {COMPOUND_STRING("WITHDRAW POKéMON"), COMPOUND_STRING("You can withdraw a POKéMON if you\nhave any in a BOX.")},
    [OPTION_DEPOSIT]    = {COMPOUND_STRING("DEPOSIT POKéMON"),  COMPOUND_STRING("You can deposit your party\nPOKéMON in any BOX.")},
    [OPTION_MOVE_MONS]  = {COMPOUND_STRING("MOVE POKéMON"),     COMPOUND_STRING("You can move POKéMON that are\nstored in any BOX.")},
    [OPTION_MOVE_ITEMS] = {COMPOUND_STRING("MOVE ITEMS"),       COMPOUND_STRING("You can move items held by any\nPOKéMON in a BOX or your party.")},
    [OPTION_EXIT]       = {COMPOUND_STRING("SEE YA!"),          COMPOUND_STRING("See you later!")}
};

static const struct WindowTemplate sWindowTemplate_MainMenu = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 17,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const union AnimCmd sAnim_ChooseBoxMenu_TopLeft[] = {
    ANIMCMD_FRAME( 0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_ChooseBoxMenu_BottomLeft[] = {
    ANIMCMD_FRAME( 4, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_ChooseBoxMenu_TopRight[] = {
    ANIMCMD_FRAME( 6, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_ChooseBoxMenu_BottomRight[] = {
    ANIMCMD_FRAME(10, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_ChooseBoxMenu[] = {
    sAnim_ChooseBoxMenu_TopLeft,
    sAnim_ChooseBoxMenu_BottomLeft,
    sAnim_ChooseBoxMenu_TopRight,
    sAnim_ChooseBoxMenu_BottomRight,
};

static const union AffineAnimCmd sAffineAnim_ChooseBoxMenu[] = {
    AFFINEANIMCMD_FRAME(224, 224, 0, 0),
    AFFINEANIMCMD_END
};

// Unused
static const union AffineAnimCmd *const sAffineAnims_ChooseBoxMenu[] = {
    sAffineAnim_ChooseBoxMenu
};

// Unused, since LoadChooseBoxMenuGfx is always called with `loadPal` as false
static const u16 sChooseBoxMenu_Pal[] = INCBIN_U16("graphics/pokemon_storage/unused_choose_box_menu.gbapal");
static const u8 sChooseBoxMenuCenter_Gfx[] = INCBIN_U8("graphics/pokemon_storage/choose_box_menu_center.4bpp");
static const u8 sChooseBoxMenuCorners_Gfx[] = INCBIN_U8("graphics/pokemon_storage/choose_box_menu_corners.4bpp");
static const u32 sScrollingBg_Gfx[]     = INCBIN_U32("graphics/pokemon_storage/scrolling_bg.4bpp.lz");
static const u32 sScrollingBg_Tilemap[] = INCBIN_U32("graphics/pokemon_storage/scrolling_bg.bin.lz");
static const u16 sMenu_Pal[] = INCBIN_U16("graphics/pokemon_storage/menu.gbapal"); // Unused
static const u32 sMenu_Tilemap[]             = INCBIN_U32("graphics/pokemon_storage/menu.bin.lz");
static const u16 sPkmnData_Tilemap[]         = INCBIN_U16("graphics/pokemon_storage/pkmn_data.bin");
static const u16 gPokeStorageInterface_Pal[] = INCBIN_U16("graphics/pokemon_storage/interface.gbapal");
static const u16 gPokeStorageInterface_NoDisplayMon_Pal[] = INCBIN_U16("graphics/pokemon_storage/interface_no_display_mon.gbapal");
static const u16 sScrollingBg_Pal[]          = INCBIN_U16("graphics/pokemon_storage/scrolling_bg.gbapal");
static const u16 sScrollingBgMoveItems_Pal[] = INCBIN_U16("graphics/pokemon_storage/scrolling_bg_move_items.gbapal");
static const u16 sCloseBoxButton_Tilemap[]   = INCBIN_U16("graphics/pokemon_storage/close_box_button.bin");
static const u16 sPartySlotFilled_Tilemap[]  = INCBIN_U16("graphics/pokemon_storage/party_slot_filled.bin");
static const u16 sPartySlotEmpty_Tilemap[]   = INCBIN_U16("graphics/pokemon_storage/party_slot_empty.bin");
static const u16 sPokeStorageMisc2Pal[]      = INCBIN_U16("graphics/pokemon_storage/misc2.gbapal");
static const u16 sWaveform_Gfx[]             = INCBIN_U16("graphics/pokemon_storage/waveform.4bpp");
static const u16 sUnused_Pal[] = INCBIN_U16("graphics/pokemon_storage/unused.gbapal");
static const u16 sItemInfoFrame_Pal[] = INCBIN_U16("graphics/pokemon_storage/item_info_frame.gbapal");

static const struct WindowTemplate sWindowTemplates[] = {
    [WIN_DISPLAY_INFO] = {
        .bg = 1,
        .tilemapLeft = 0,
        .tilemapTop = 11,
        .width = 9,
        .height = 7,
        .paletteNum = 3,
        .baseBlock = 0x0c0
    },
    [WIN_MESSAGE] = {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 17,
        .width = 18,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x014
    },
    [WIN_ITEM_DESC] = {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 12,
        .width = 25,
        .height = 8,
        .paletteNum = 15,
        .baseBlock = 0x014
    },
    DUMMY_WIN_TEMPLATE
};

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x100
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 27,
        .screenSize = 1,
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

static const struct SpritePalette sMiscSpritePalette = {
    sPokeStorageMisc2Pal, PALTAG_MISC_2
};

static const struct SpriteSheet sWaveformSpriteSheet = {
    sWaveform_Gfx, 0x01C0, GFXTAG_WAVEFORM
};

static const struct OamData sOamData_DisplayMon;

static const struct SpriteTemplate sSpriteTemplate_DisplayMon = {
    .tileTag = GFXTAG_DISPLAY_MON,
    .paletteTag = PALTAG_DISPLAY_MON,
    .oam = &sOamData_DisplayMon,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct StorageMessage sMessages[] = {
    [MSG_EXIT_BOX]             = {gText_ExitFromBox,             MSG_FMT_NONE},
    [MSG_WHAT_YOU_DO]          = {gText_WhatDoYouWantToDo,       MSG_FMT_NONE},
    [MSG_PICK_A_THEME]         = {gText_PleasePickATheme,        MSG_FMT_NONE},
    [MSG_PICK_A_WALLPAPER]     = {gText_PickTheWallpaper,        MSG_FMT_NONE},
    [MSG_IS_SELECTED]          = {gText_PkmnIsSelected,          MSG_FMT_MON_NAME_1},
    [MSG_JUMP_TO_WHICH_BOX]    = {gText_JumpToWhichBox,          MSG_FMT_NONE},
    [MSG_DEPOSIT_IN_WHICH_BOX] = {gText_DepositInWhichBox,       MSG_FMT_NONE},
    [MSG_WAS_DEPOSITED]        = {gText_PkmnWasDeposited,        MSG_FMT_MON_NAME_1},
    [MSG_BOX_IS_FULL]          = {gText_BoxIsFull2,              MSG_FMT_NONE},
    [MSG_RELEASE_POKE]         = {gText_ReleaseThisPokemon,      MSG_FMT_NONE},
    [MSG_WAS_RELEASED]         = {gText_PkmnWasReleased,         MSG_FMT_RELEASE_MON_1},
    [MSG_BYE_BYE]              = {gText_ByeByePkmn,              MSG_FMT_RELEASE_MON_3},
    [MSG_MARK_POKE]            = {gText_MarkYourPkmn,            MSG_FMT_NONE},
    [MSG_LAST_POKE]            = {gText_ThatsYourLastPkmn,       MSG_FMT_NONE},
    [MSG_PARTY_FULL]           = {gText_YourPartysFull,          MSG_FMT_NONE},
    [MSG_HOLDING_POKE]         = {gText_YoureHoldingAPkmn,       MSG_FMT_NONE},
    [MSG_WHICH_ONE_WILL_TAKE]  = {gText_WhichOneWillYouTake,     MSG_FMT_NONE},
    [MSG_CANT_RELEASE_EGG]     = {gText_YouCantReleaseAnEgg,     MSG_FMT_NONE},
    [MSG_CONTINUE_BOX]         = {gText_ContinueBoxOperations,   MSG_FMT_NONE},
    [MSG_CAME_BACK]            = {gText_PkmnCameBack,            MSG_FMT_MON_NAME_1},
    [MSG_WORRIED]              = {gText_WasItWorriedAboutYou,    MSG_FMT_NONE},
    [MSG_SURPRISE]             = {gText_FourEllipsesExclamation, MSG_FMT_NONE},
    [MSG_PLEASE_REMOVE_MAIL]   = {gText_PleaseRemoveTheMail,     MSG_FMT_NONE},
    [MSG_IS_SELECTED2]         = {gText_PkmnIsSelected,          MSG_FMT_ITEM_NAME},
    [MSG_GIVE_TO_MON]          = {gText_GiveToAPkmn,             MSG_FMT_NONE},
    [MSG_PLACED_IN_BAG]        = {gText_PlacedItemInBag,         MSG_FMT_ITEM_NAME},
    [MSG_BAG_FULL]             = {gText_BagIsFull2,              MSG_FMT_NONE},
    [MSG_PUT_IN_BAG]           = {gText_PutItemInBag,            MSG_FMT_NONE},
    [MSG_ITEM_IS_HELD]         = {gText_ItemIsNowHeld,           MSG_FMT_ITEM_NAME},
    [MSG_CHANGED_TO_ITEM]      = {gText_ChangedToNewItem,        MSG_FMT_ITEM_NAME},
    [MSG_CANT_STORE_MAIL]      = {gText_MailCantBeStored,        MSG_FMT_NONE},
};

static const struct WindowTemplate sYesNoWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 24,
    .tilemapTop = 11,
    .width = 5,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x05c
};

static const struct OamData sOamData_DisplayMon = {
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
    .priority = 0,
    .paletteNum = 0
};

// Waveform

static const struct OamData sOamData_Waveform = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x8),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0
};

static const union AnimCmd sAnim_Waveform_LeftOff[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_Waveform_LeftOn[] = {
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(6, 8),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Waveform_RightOff[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_Waveform_RightOn[] = {
    ANIMCMD_FRAME(10, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(12, 8),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnims_Waveform[] = {
    sAnim_Waveform_LeftOff,
    sAnim_Waveform_LeftOn,
    sAnim_Waveform_RightOff,
    sAnim_Waveform_RightOn
};

static const struct SpriteTemplate sSpriteTemplate_Waveform = {
    .tileTag = GFXTAG_WAVEFORM,
    .paletteTag = PALTAG_MISC_2,
    .oam = &sOamData_Waveform,
    .anims = sAnims_Waveform,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct OamData sOamData_MonIcon;
static const struct SpriteTemplate sSpriteTemplate_MonIcon = {
    .tileTag = GFXTAG_MON_ICON,
    .paletteTag = PALTAG_MON_ICON_0,
    .oam = &sOamData_MonIcon,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_MonIcon = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0
};

static const union AffineAnimCmd sAffineAnim_ReleaseMon_Release[] = {
    AFFINEANIMCMD_FRAME(-2, -2, 0, 120),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ReleaseMon_ComeBack[] = {
    AFFINEANIMCMD_FRAME(16, 16, 0,  0),
    AFFINEANIMCMD_FRAME(16, 16, 0, 15),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnims_ReleaseMon[] = {
    [RELEASE_ANIM_RELEASE]   = sAffineAnim_ReleaseMon_Release,
    [RELEASE_ANIM_COME_BACK] = sAffineAnim_ReleaseMon_ComeBack,
};

#include "data/wallpapers.h"

static const u16 sUnusedColor = RGB(26, 29, 8);

static const struct SpriteSheet sSpriteSheet_BoxScrollArrow = {
    sBoxScrollArrow_Gfx, 0x0080, GFXTAG_BOX_SCROLL_ARROW
};

static const struct OamData sOamData_BoxTitle = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0
};

static const union AnimCmd sAnim_BoxTitle_Left[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_BoxTitle_Right[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_BoxTitle[] = {
    sAnim_BoxTitle_Left,
    sAnim_BoxTitle_Right,
};

static const struct SpriteTemplate sSpriteTemplate_BoxTitle = {
    .tileTag = GFXTAG_BOX_TITLE,
    .paletteTag = PALTAG_BOX_TITLE,
    .oam = &sOamData_BoxTitle,
    .anims = sAnims_BoxTitle,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_BoxScrollArrow = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x16),
    .tileNum = 0x000,
    .priority = 2,
    .paletteNum = 0
};

static const union AnimCmd sAnim_BoxScrollArrow_Left[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_BoxScrollArrow_Right[] = {
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_BoxScrollArrow[] = {
    sAnim_BoxScrollArrow_Left,
    sAnim_BoxScrollArrow_Right,
};

static const struct SpriteTemplate sSpriteTemplate_BoxScrollArrow = {
    .tileTag = GFXTAG_BOX_SCROLL_ARROW,
    .paletteTag = PALTAG_MISC_2,
    .oam = &sOamData_BoxScrollArrow,
    .anims = sAnims_BoxScrollArrow,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_BoxScrollArrow,
};

static const u16 sPokeStorageMisc1Pal[] = INCBIN_U16("graphics/pokemon_storage/misc1.gbapal");
static const u16 sHandCursor_Gfx[] = INCBIN_U16("graphics/pokemon_storage/hand_cursor.4bpp");
static const u16 sHandCursorShadow_Gfx[] = INCBIN_U16("graphics/pokemon_storage/hand_cursor_shadow.4bpp");


//------------------------------------------------------------------------------
//  SECTION: Misc utility
//------------------------------------------------------------------------------

void DrawTextWindowAndBufferTiles(const u8 *string, void *dst, u8 zero1, u8 zero2, u8 *unused, s32 bytesToBuffer)
{
    s32 i, tileBytesToBuffer, remainingBytes;
    u16 windowId;
    u8 txtColor[3];
    u8 *tileData1, *tileData2;
    struct WindowTemplate winTemplate = {0};

    winTemplate.width = 24;
    winTemplate.height = 2;
    windowId = AddWindow(&winTemplate);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(zero2));
    tileData1 = (u8 *)GetWindowAttribute(windowId, WINDOW_TILE_DATA);
    tileData2 = (winTemplate.width * TILE_SIZE_4BPP) + tileData1;

    if (!zero1)
        txtColor[0] = TEXT_COLOR_TRANSPARENT;
    else
        txtColor[0] = zero2;
    txtColor[1] = TEXT_DYNAMIC_COLOR_6;
    txtColor[2] = TEXT_DYNAMIC_COLOR_5;
    AddTextPrinterParameterized4(windowId, FONT_NORMAL_COPY_1, 0, 2, 0, 0, txtColor, -1, string);

    tileBytesToBuffer = bytesToBuffer;
    if (tileBytesToBuffer > 6)
        tileBytesToBuffer = 6;
    remainingBytes = bytesToBuffer - 6;
    if (tileBytesToBuffer > 0)
    {
        for (i = tileBytesToBuffer; i != 0; i--)
        {
            CpuCopy16(tileData1, dst, 0x80);
            CpuCopy16(tileData2, dst + 0x80, 0x80);
            tileData1 += 0x80;
            tileData2 += 0x80;
            dst += 0x100;
        }
    }

    // Never used. bytesToBuffer is always passed <= 6, so remainingBytes is always <= 0 here
    if (remainingBytes > 0)
        CpuFill16((zero2 << 4) | zero2, dst, (u32)(remainingBytes) * 0x100);

    RemoveWindow(windowId);
}

static void PrintStringToBufferCopyNow(const u8 *string, void *dst, u16 offset, u8 bgColor, u8 fgColor, u8 shadowColor, u8 *unused)
{
    u32 var;
    u8 windowId;
    u8 txtColor[3];
    u8 *tileData1, *tileData2;
    struct WindowTemplate winTemplate = {0};

    winTemplate.width = StringLength_Multibyte(string);
    winTemplate.height = 2;
    var = winTemplate.width * 32;
    windowId = AddWindow(&winTemplate);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(bgColor));
    tileData1 = (u8 *)GetWindowAttribute(windowId, WINDOW_TILE_DATA);
    tileData2 = (winTemplate.width * 32) + tileData1;
    txtColor[0] = bgColor;
    txtColor[1] = fgColor;
    txtColor[2] = shadowColor;
    AddTextPrinterParameterized4(windowId, FONT_NORMAL_COPY_1, 0, 2, 0, 0, txtColor, -1, string);
    CpuCopy16(tileData1, dst, var);
    CpuCopy16(tileData2, dst + offset, var);
    RemoveWindow(windowId);
}

u8 CountMonsInBox(u8 boxId)
{
    u16 i, count;

    for (i = 0, count = 0; i < IN_BOX_COUNT; i++)
    {
        if (GetBoxMonDataAt(boxId, i, MON_DATA_SPECIES) != SPECIES_NONE)
            count++;
    }

    return count;
}

s16 GetFirstFreeBoxSpot(u8 boxId)
{
    u16 i;

    for (i = 0; i < IN_BOX_COUNT; i++)
    {
        if (GetBoxMonDataAt(boxId, i, MON_DATA_SPECIES) == SPECIES_NONE)
            return i;
    }

    return -1; // all spots are taken
}

u32 CountPartyNonEggMons(void)
{
    u32 i, count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != SPECIES_NONE
                && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
            count++;
    }

    return count;
}

u8 CountPartyAliveNonEggMonsExcept(u8 slotToIgnore)
{
    u16 i, count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (i != slotToIgnore
                && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != SPECIES_NONE
                && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG)
                && GetMonData(&gPlayerParty[i], MON_DATA_HP) != 0)
            count++;
    }

    return count;
}

u16 CountPartyAliveNonEggMons_IgnoreVar0x8004Slot(void)
{
    return CountPartyAliveNonEggMonsExcept(gSpecialVar_0x8004);
}

u8 CountPartyMons(void)
{
    u16 i, count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != SPECIES_NONE)
            count++;
    }

    return count;
}

enum {
    STATE_LOAD,
    STATE_FADE_IN,
    STATE_HANDLE_INPUT,
    STATE_ERROR_MSG,
    STATE_ENTER_PC,
};

#define tState          data[0]
#define tSelectedOption data[1]
#define tInput          data[2]
#define tNextOption     data[3]
#define tWindowId       data[15]

static void Task_PCMainMenu(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case STATE_LOAD:
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        CreatePCMainMenu(task->tSelectedOption, &task->tWindowId);
        LoadMessageBoxAndBorderGfx();
        DrawDialogueFrame(0, FALSE);
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, TEXT_SKIP_DRAW, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
        CopyWindowToVram(0, COPYWIN_FULL);
        CopyWindowToVram(task->tWindowId, COPYWIN_FULL);
        task->tState++;
        break;
    case STATE_FADE_IN:
        if (IsWeatherNotFadingIn())
            task->tState++;

        break;
    case STATE_HANDLE_INPUT:
        task->tInput = Menu_ProcessInput();
        switch(task->tInput)
        {
        case MENU_NOTHING_CHOSEN:
            task->tNextOption = task->tSelectedOption;
            if (JOY_NEW(DPAD_UP) && --task->tNextOption < 0)
                task->tNextOption = OPTIONS_COUNT - 1;
            if (JOY_NEW(DPAD_DOWN) && ++task->tNextOption > OPTIONS_COUNT - 1)
                task->tNextOption = 0;

            if (task->tSelectedOption != task->tNextOption)
            {
                task->tSelectedOption = task->tNextOption;
                FillWindowPixelBuffer(0, PIXEL_FILL(1));
                AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            }
            break;
        case MENU_B_PRESSED:
        case OPTION_EXIT:
            ClearStdWindowAndFrame(0, TRUE);
            ClearStdWindowAndFrame(task->tWindowId, TRUE);
            UnlockPlayerFieldControls();
            ScriptContext_Enable();
            DestroyTask(taskId);
            break;
        default:
            if (task->tInput == OPTION_WITHDRAW && CountPartyMons() == PARTY_SIZE)
            {
                // Can't withdraw
                FillWindowPixelBuffer(0, PIXEL_FILL(1));
                AddTextPrinterParameterized2(0, FONT_NORMAL, gText_PartyFull, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
                task->tState = STATE_ERROR_MSG;
            }
            else if (task->tInput == OPTION_DEPOSIT && CountPartyMons() == 1)
            {
                // Can't deposit
                FillWindowPixelBuffer(0, PIXEL_FILL(1));
                AddTextPrinterParameterized2(0, FONT_NORMAL, gText_JustOnePkmn, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
                task->tState = STATE_ERROR_MSG;
            }
            else
            {
                // Enter PC
                FadeScreen(FADE_TO_BLACK, 0);
                task->tState = STATE_ENTER_PC;
            }
            break;
        }
        break;
    case STATE_ERROR_MSG:
        // Printed "can't do PC option message"
        // Wait for new input after message
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            FillWindowPixelBuffer(0, PIXEL_FILL(1));
            AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = STATE_HANDLE_INPUT;
        }
        else if (JOY_NEW(DPAD_UP))
        {
            if (--task->tSelectedOption < 0)
                task->tSelectedOption = 4;
            Menu_MoveCursor(-1);
            task->tSelectedOption = Menu_GetCursorPos();
            FillWindowPixelBuffer(0, PIXEL_FILL(1));
            AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = STATE_HANDLE_INPUT;
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            if (++task->tSelectedOption > 3)
                task->tSelectedOption = 0;
            Menu_MoveCursor(1);
            task->tSelectedOption = Menu_GetCursorPos();
            FillWindowPixelBuffer(0, PIXEL_FILL(1));
            AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = STATE_HANDLE_INPUT;
        }
        break;
    case STATE_ENTER_PC:
        if (!gPaletteFade.active)
        {
            CleanupOverworldWindowsAndTilemaps();
            EnterPokeStorage(task->tInput);
            DestroyTask(taskId);
        }
        break;
    }
}

void ShowPokemonStorageSystemPC(void)
{
    u8 taskId = CreateTask(Task_PCMainMenu, 80);
    gTasks[taskId].tState = STATE_LOAD;
    gTasks[taskId].tSelectedOption = 0;
    LockPlayerFieldControls();
}

static void FieldTask_ReturnToPcMenu(void)
{
    u8 taskId;
    MainCallback vblankCb = gMain.vblankCallback;

    SetVBlankCallback(NULL);
    taskId = CreateTask(Task_PCMainMenu, 80);
    gTasks[taskId].tState = STATE_LOAD;
    gTasks[taskId].tSelectedOption = sPreviousBoxOption;
    Task_PCMainMenu(taskId);
    SetVBlankCallback(vblankCb);
    FadeInFromBlack();
}

static void CreatePCMainMenu(u8 whichMenu, s16 *windowIdPtr)
{
    s16 windowId = AddWindow(&sWindowTemplate_MainMenu);

    DrawStdWindowFrame(windowId, FALSE);
    PrintMenuActionTextsAtPos(windowId, FONT_NORMAL, GetMenuCursorDimensionByFont(FONT_NORMAL, 0), 2, 16, ARRAY_COUNT(sMainMenuTexts), (void *)sMainMenuTexts);
    InitMenuNormal(windowId, FONT_NORMAL, 0, 2, 16, ARRAY_COUNT(sMainMenuTexts), whichMenu);
    *windowIdPtr = windowId;
}

void CB2_ExitPokeStorage(void)
{
    sPreviousBoxOption = GetCurrentBoxOption();
    gFieldCallback = FieldTask_ReturnToPcMenu;
    SetMainCallback2(CB2_ReturnToField);
}

void ResetPokemonStorageSystem(void)
{
    u16 boxId, boxPosition;

    SetCurrentBox(0);
    for (boxId = 0; boxId < TOTAL_BOXES_COUNT; boxId++)
    {
        for (boxPosition = 0; boxPosition < IN_BOX_COUNT; boxPosition++)
            ZeroBoxMonAt(boxId, boxPosition);
    }
    for (boxId = 0; boxId < TOTAL_BOXES_COUNT; boxId++)
    {
        u8 *dest = StringCopy(GetBoxNamePtr(boxId), gText_Box);
        ConvertIntToDecimalStringN(dest, boxId + 1, STR_CONV_MODE_LEFT_ALIGN, 2);
    }

    for (boxId = 0; boxId < TOTAL_BOXES_COUNT; boxId++)
        SetBoxWallpaper(boxId, boxId % (MAX_DEFAULT_WALLPAPER + 1));
}

void LoadChooseBoxMenuGfx(struct ChooseBoxMenu *menu, u16 tileTag, u16 palTag, u8 subpriority, bool32 loadPal)
{
    struct SpritePalette palette = {
        sChooseBoxMenu_Pal, palTag
    };
    struct SpriteSheet sheets[] = {
        {sChooseBoxMenuCenter_Gfx, 0x800, tileTag},
        {sChooseBoxMenuCorners_Gfx,  0x180, tileTag + 1},
        {}
    };

    if (loadPal) // Always false
        LoadSpritePalette(&palette);

    LoadSpriteSheets(sheets);
    sChooseBoxMenu = menu;
    menu->tileTag = tileTag;
    menu->paletteTag = palTag;
    menu->subpriority = subpriority;
    menu->loadedPalette = loadPal;
}

void FreeBoxSelectionPopupSpriteGfx(void)
{
    if (sChooseBoxMenu->loadedPalette)
        FreeSpritePaletteByTag(sChooseBoxMenu->paletteTag);
    FreeSpriteTilesByTag(sChooseBoxMenu->tileTag);
    FreeSpriteTilesByTag(sChooseBoxMenu->tileTag + 1);
}

void CreateChooseBoxMenuSprites(u8 curBox)
{
    ChooseBoxMenu_CreateSprites(curBox);
}

void DestroyChooseBoxMenuSprites(void)
{
    ChooseBoxMenu_DestroySprites();
}

u8 HandleBoxChooseSelectionInput(void)
{
    if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        return BOXID_CANCELED;
    }
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        return sChooseBoxMenu->curBox;
    }
    if (JOY_NEW(DPAD_LEFT))
    {
        PlaySE(SE_SELECT);
        ChooseBoxMenu_MoveLeft();
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        PlaySE(SE_SELECT);
        ChooseBoxMenu_MoveRight();
    }
    return BOXID_NONE_CHOSEN;
}

static void ChooseBoxMenu_CreateSprites(u8 curBox)
{
    u16 i;
    u8 spriteId;
    struct SpriteTemplate template;
    struct OamData oamData = {};
    oamData.size = SPRITE_SIZE(64x64);
    oamData.paletteNum = 1;
    template = (struct SpriteTemplate){
        0, 0, &oamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    };
    {
    const u8 sText_OutOf30[] = _("/30");

    sChooseBoxMenu->curBox = curBox;
    template.tileTag = sChooseBoxMenu->tileTag;
    template.paletteTag = sChooseBoxMenu->paletteTag;

    spriteId = CreateSprite(&template, 160, 96, 0);
    sChooseBoxMenu->menuSprite = gSprites + spriteId;

    oamData.shape = SPRITE_SHAPE(8x32);
    oamData.size = SPRITE_SIZE(8x32);
    template.tileTag = sChooseBoxMenu->tileTag + 1;
    template.anims = sAnims_ChooseBoxMenu;
    for (i = 0; i < ARRAY_COUNT(sChooseBoxMenu->menuCornerSprites); i++)
    {
        // corner sprites are created in order of top left, bottom left, top right, bottom right
        u16 animNum;
        spriteId = CreateSprite(&template, 124, 80, sChooseBoxMenu->subpriority); // place at top left
        sChooseBoxMenu->menuCornerSprites[i] = &gSprites[spriteId];
        animNum = 0;
        if (i & 2)
        {
            sChooseBoxMenu->menuCornerSprites[i]->x = 196; // move to bottom
            animNum = 2;
        }
        if (i & 1)
        {
            sChooseBoxMenu->menuCornerSprites[i]->y = 112; // move to right
            sChooseBoxMenu->menuCornerSprites[i]->oam.size = SPRITE_SIZE(8x16);
            animNum++;
        }
        StartSpriteAnim(sChooseBoxMenu->menuCornerSprites[i], animNum);
    }
    for (i = 0; i < ARRAY_COUNT(sChooseBoxMenu->arrowSprites); i++)
    {
        sChooseBoxMenu->arrowSprites[i] = CreateChooseBoxArrows(72 * i + 124, 88, i, 0, sChooseBoxMenu->subpriority);
        if (sChooseBoxMenu->arrowSprites[i])
        {
            sChooseBoxMenu->arrowSprites[i]->data[0] = (i == 0 ? -1 : 1);
            sChooseBoxMenu->arrowSprites[i]->callback = SpriteCB_ChooseBoxArrow;
        }
    }
    ChooseBoxMenu_PrintBoxNameAndCount();
    ChooseBoxMenu_PrintTextToSprite(sText_OutOf30, 5, 3);
    }
}

static void ChooseBoxMenu_DestroySprites(void)
{
    u16 i;
    if (sChooseBoxMenu->menuSprite)
    {
        DestroySprite(sChooseBoxMenu->menuSprite);
        sChooseBoxMenu->menuSprite = NULL;
    }
    for (i = 0; i < ARRAY_COUNT(sChooseBoxMenu->menuCornerSprites); i++)
    {
        if (sChooseBoxMenu->menuCornerSprites[i])
        {
            DestroySprite(sChooseBoxMenu->menuCornerSprites[i]);
            sChooseBoxMenu->menuCornerSprites[i] = NULL;
        }
    }
    for (i = 0; i < ARRAY_COUNT(sChooseBoxMenu->arrowSprites); i++)
    {
        if (sChooseBoxMenu->arrowSprites[i])
            DestroySprite(sChooseBoxMenu->arrowSprites[i]);
    }
}

static void ChooseBoxMenu_MoveRight(void)
{
    if (++sChooseBoxMenu->curBox >= TOTAL_BOXES_COUNT)
        sChooseBoxMenu->curBox = 0;
    ChooseBoxMenu_PrintBoxNameAndCount();
}

static void ChooseBoxMenu_MoveLeft(void)
{
    sChooseBoxMenu->curBox = (sChooseBoxMenu->curBox == 0 ? TOTAL_BOXES_COUNT - 1 : sChooseBoxMenu->curBox - 1);
    ChooseBoxMenu_PrintBoxNameAndCount();
}

static void ChooseBoxMenu_PrintBoxNameAndCount(void)
{
    u8 numMonInBox = CountMonsInBox(sChooseBoxMenu->curBox);
    u8 *boxName = StringCopy(sChooseBoxMenu->strbuf, GetBoxNamePtr(sChooseBoxMenu->curBox));

    while (boxName < sChooseBoxMenu->strbuf + BOX_NAME_LENGTH)
        *boxName++ = CHAR_SPACE;
    *boxName = EOS;

    ChooseBoxMenu_PrintTextToSprite(sChooseBoxMenu->strbuf, 0, 1);

    ConvertIntToDecimalStringN(sChooseBoxMenu->strbuf, numMonInBox, STR_CONV_MODE_RIGHT_ALIGN, 2);

    ChooseBoxMenu_PrintTextToSprite(sChooseBoxMenu->strbuf, 3, 3);
}

static void ChooseBoxMenu_PrintTextToSprite(const u8 *str, u16 x, u16 y)
{
    void *dst = (void *)(OBJ_VRAM0 + GetSpriteTileStartByTag(sChooseBoxMenu->tileTag) * 32 + 256 * y + 32 * x);
    PrintStringToBufferCopyNow(str, dst, 0x100, TEXT_COLOR_RED, TEXT_DYNAMIC_COLOR_6, TEXT_DYNAMIC_COLOR_5, sChooseBoxMenu->buffer);
}

static void SpriteCB_ChooseBoxArrow(struct Sprite *sprite)
{
    if (++sprite->data[1] > 3)
    {
        sprite->data[1] = 0;
        sprite->x2 += sprite->data[0];
        if (++sprite->data[2] > 5)
        {
            sprite->data[2] = 0;
            sprite->x2 = 0;
        }
    }
}

//

static void VBlankCB_PokeStorage(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    SetGpuReg(REG_OFFSET_BG2HOFS, gStorage->bg2_X);
}

static void CB2_PokeStorage(void)
{
    RunTasks();
    DoScheduledBgTilemapCopiesToVram();
    ScrollBackground();
    UpdateCloseBoxButtonFlash();
    AnimateSprites();
    BuildOamBuffer();
}

void EnterPokeStorage(u8 boxOption)
{
    ResetTasks();
    sCurrentBoxOption = boxOption;
    gStorage = Alloc(sizeof(struct PokemonStorageSystemData));
    if (gStorage == NULL)
        SetMainCallback2(CB2_ExitPokeStorage);
    else
    {
        gStorage->boxOption = boxOption;
        gStorage->isReopening = FALSE;
        sMovingItemId = 0;
        gStorage->state = 0;
        gStorage->taskId = CreateTask(Task_InitPokeStorage, 3);
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        sLastUsedBox = StorageGetCurrentBox();
        SetMainCallback2(CB2_PokeStorage);
    }
}

void CB2_ReturnToPokeStorage(void)
{
    ResetTasks();
    gStorage = Alloc(sizeof(struct PokemonStorageSystemData));
    if (gStorage == NULL)
        SetMainCallback2(CB2_ExitPokeStorage);
    else
    {
        gStorage->boxOption = sCurrentBoxOption;
        gStorage->isReopening = TRUE;
        gStorage->state = 0;
        gStorage->taskId = CreateTask(Task_InitPokeStorage, 3);
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        SetMainCallback2(CB2_PokeStorage);
    }
}

static void ResetAllBgCoords(void)
{
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
}

static void ResetForPokeStorage(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeSpriteTileRanges();
    FreeAllSpritePalettes();
    ClearDma3Requests();
    gReservedSpriteTileCount = 0x280;
    gKeyRepeatStartDelay = 20;
    ClearScheduledBgCopiesToVram();
    TilemapUtil_Init(TILEMAP_COUNT);
    TilemapUtil_SetTilemap(TILEMAP_PKMN_DATA, 1, sPkmnData_Tilemap, 8, 4);
    TilemapUtil_SetPos(TILEMAP_PKMN_DATA, 1, 0);
    gStorage->closeBoxFlashing = FALSE;
}

static void InitStartingPosData(void)
{
    ClearSavedCursorPos();
    sInPartyMenu = gStorage->boxOption == OPTION_DEPOSIT;
    sDepositBoxId = 0;
}

static void SetMonIconTransparency(void)
{
    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL);
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(7, 11));
    }
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_1D_MAP);
}

static void SetPokeStorageTask(TaskFunc newFunc)
{
    gTasks[gStorage->taskId].func = newFunc;
    gStorage->state = 0;
}

static void Task_InitPokeStorage(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        ResetForPokeStorage();
        if (gStorage->isReopening)
        {
            switch (sWhichToReshow)
            {
            case SCREEN_CHANGE_NAME_BOX - 1:
                LoadSavedMovingMon();
                break;
            case SCREEN_CHANGE_SUMMARY_SCREEN - 1:
                SetSelectionAfterSummaryScreen();
                break;
            case SCREEN_CHANGE_ITEM_FROM_BAG - 1:
                GiveChosenBagItem();
                break;
            }
        }
        LoadPokeStorageMenuGfx();
        LoadsMiscSpritePalette();
        break;
    case 1:
        if (!InitPokeStorageWindows())
        {
            SetPokeStorageTask(Task_ChangeScreen);
            return;
        }
        break;
    case 2:
        PutWindowTilemap(0);
        ClearWindowTilemap(1);
        CpuFill32(0, (void *)VRAM, 0x200);
        LoadUserWindowBorderGfx(1, 0xB, BG_PLTT_ID(14));
        break;
    case 3:
        ResetAllBgCoords();
        if (!gStorage->isReopening)
            InitStartingPosData();
        break;
    case 4:
        InitMonIconFields();
        if (!gStorage->isReopening)
            InitCursor();
        else
            InitCursorOnReopen();
        break;
    case 5:
        if (!MultiMove_Init())
        {
            SetPokeStorageTask(Task_ChangeScreen);
            return;
        }
        else
        {
            SetScrollingBackground();
            InitPokeStorageBg0();
        }
        break;
    case 6:
        InitPalettesAndSprites();
        break;
    case 7:
        InitSupplementalTilemaps();
        break;
    case 8:
        CreateInitBoxTask(StorageGetCurrentBox());
        break;
    case 9:
        if (IsInitBoxActive())
            return;

        if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        {
            gStorage->markMenu.baseTileTag = GFXTAG_MARKING_MENU;
            gStorage->markMenu.basePaletteTag = PALTAG_MARKING_MENU;
            InitMonMarkingsMenu(&gStorage->markMenu);
            BufferMonMarkingsMenuTiles();
        }
        else
        {
            CreateItemIconSprites();
            InitCursorItemIcon();
        }
        break;
    case 10:
        SetMonIconTransparency();
        if (!gStorage->isReopening)
        {
            BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
            SetPokeStorageTask(Task_ShowPokeStorage);
        }
        else
        {
            BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
            SetPokeStorageTask(Task_ReshowPokeStorage);
        }
        SetVBlankCallback(VBlankCB_PokeStorage);
        return;
    default:
        return;
    }

    gStorage->state++;
}

static void Task_ShowPokeStorage(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        PlaySE(SE_PC_LOGIN);
        BeginPCScreenEffect_TurnOn(20, 0, 1);
        gStorage->state++;
        break;
    case 1:
        if (!IsPCScreenEffectRunning_TurnOn())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_ReshowPokeStorage(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 0x10, 0, RGB_BLACK);
        gStorage->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_PokeStorageMain(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        switch (HandleInput())
        {
        case INPUT_MOVE_CURSOR:
            PlaySE(SE_SELECT);
            gStorage->state = 1;
            break;
        case INPUT_SHOW_PARTY:
            if (gStorage->boxOption != OPTION_MOVE_MONS && gStorage->boxOption != OPTION_MOVE_ITEMS)
            {
                PrintStorageMessage(MSG_WHICH_ONE_WILL_TAKE);
                gStorage->state = 3;
            }
            else
            {
                ClearSavedCursorPos();
                SetPokeStorageTask(Task_ShowPartyPokemon);
            }
            break;
        case INPUT_HIDE_PARTY:
            if (gStorage->boxOption == OPTION_MOVE_MONS)
            {
                if (IsMonBeingMoved() && ItemIsMail(gStorage->displayMonItemId))
                    gStorage->state = 5;
                else
                    SetPokeStorageTask(Task_HidePartyPokemon);
            }
            else if (gStorage->boxOption == OPTION_MOVE_ITEMS)
                SetPokeStorageTask(Task_HidePartyPokemon);
            break;
        case INPUT_CLOSE_BOX:
            SetPokeStorageTask(Task_OnCloseBoxPressed);
            break;
        case INPUT_PRESSED_B:
            SetPokeStorageTask(Task_OnBPressed);
            break;
        case INPUT_BOX_OPTIONS:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_HandleBoxOptions);
            break;
        case INPUT_IN_MENU:
            SetPokeStorageTask(Task_OnSelectedMon);
            break;
        case INPUT_SCROLL_RIGHT:
            PlaySE(SE_SELECT);
            gStorage->newCurrBoxId = StorageGetCurrentBox() + 1;
            if (gStorage->newCurrBoxId >= TOTAL_BOXES_COUNT)
                gStorage->newCurrBoxId = 0;
            if (gStorage->boxOption != OPTION_MOVE_ITEMS)
            {
                SetUpScrollToBox(gStorage->newCurrBoxId);
                gStorage->state = 2;
            }
            else
            {
                TryHideItemAtCursor();
                gStorage->state = 10;
            }
            break;
        case INPUT_SCROLL_LEFT:
            PlaySE(SE_SELECT);
            gStorage->newCurrBoxId = StorageGetCurrentBox() - 1;
            if (gStorage->newCurrBoxId < 0)
                gStorage->newCurrBoxId = TOTAL_BOXES_COUNT - 1;
            if (gStorage->boxOption != OPTION_MOVE_ITEMS)
            {
                SetUpScrollToBox(gStorage->newCurrBoxId);
                gStorage->state = 2;
            }
            else
            {
                TryHideItemAtCursor();
                gStorage->state = 10;
            }
            break;
        case INPUT_DEPOSIT:
            if (!CanMovePartyMon())
            {
                if (ItemIsMail(gStorage->displayMonItemId))
                    gStorage->state = 5;
                else
                {
                    PlaySE(SE_SELECT);
                    SetPokeStorageTask(Task_DepositMenu);
                }
            }
            else
                gStorage->state = 4;
            break;
        case INPUT_MOVE_MON:
            if (CanMovePartyMon())
                gStorage->state = 4;

            else
            {
                PlaySE(SE_SELECT);
                SetPokeStorageTask(Task_MoveMon);
            }
            break;
        case INPUT_SHIFT_MON:
            if (!CanShiftMon())
                gStorage->state = 4;
            else
            {
                PlaySE(SE_SELECT);
                SetPokeStorageTask(Task_ShiftMon);
            }
            break;
        case INPUT_WITHDRAW:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_WithdrawMon);
            break;
        case INPUT_PLACE_MON:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_PlaceMon);
            break;
        case INPUT_TAKE_ITEM:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_TakeItemForMoving);
            break;
        case INPUT_GIVE_ITEM:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_GiveMovingItemToMon);
            break;
        case INPUT_SWITCH_ITEMS:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_SwitchSelectedItem);
            break;
        case INPUT_MULTIMOVE_START:
            PlaySE(SE_SELECT);
            MultiMove_SetFunction(MULTIMOVE_START);
            gStorage->state = 7;
            break;
        case INPUT_MULTIMOVE_SINGLE:
            MultiMove_SetFunction(MULTIMOVE_SINGLE);
            gStorage->state = 8;
            break;
        case INPUT_MULTIMOVE_CHANGE_SELECTION:
            PlaySE(SE_SELECT);
            MultiMove_SetFunction(MULTIMOVE_CHANGE_SELECTION);
            gStorage->state = 9;
            break;
        case INPUT_MULTIMOVE_GRAB_SELECTION:
            MultiMove_SetFunction(MULTIMOVE_GRAB_SELECTION);
            gStorage->state = 7;
            break;
        case INPUT_MULTIMOVE_MOVE_MONS:
            PlaySE(SE_SELECT);
            MultiMove_SetFunction(MULTIMOVE_MOVE_MONS);
            gStorage->state = 9;
            break;
        case INPUT_MULTIMOVE_PLACE_MONS:
            PlaySE(SE_SELECT);
            SetPokeStorageQuestLogEvent(3);
            MultiMove_SetFunction(MULTIMOVE_PLACE_MONS);
            gStorage->state = 7;
            break;
        case INPUT_MULTIMOVE_UNABLE:
            PlaySE(SE_FAILURE);
            break;
        }
        break;
    case 1:
        if (!UpdateCursorPos())
        {
            if (IsCursorOnCloseBox())
                StartFlashingCloseBoxButton();
            else
                StopFlashingCloseBoxButton();

            if (gStorage->setMosaic)
                StartDisplayMonMosaic();
            gStorage->state = 0;
        }
        break;
    case 2:
        if (!ScrollToBox())
        {
            SetCurrentBox(gStorage->newCurrBoxId);
            if (!sInPartyMenu && !IsMonBeingMoved())
            {
                DoTrySetDisplayMonData();
                StartDisplayMonMosaic();
            }

            if (gStorage->boxOption == OPTION_MOVE_ITEMS)
            {
                TryShowItemAtCursor();
                gStorage->state = 11;
            }
            else
                gStorage->state = 0;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gStorage->state = 0;
        }
        break;
    case 4:
        PlaySE(SE_FAILURE);
        PrintStorageMessage(MSG_LAST_POKE);
        gStorage->state = 6;
        break;
    case 5:
        PlaySE(SE_FAILURE);
        PrintStorageMessage(MSG_PLEASE_REMOVE_MAIL);
        gStorage->state = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 7:
        if (!MultiMove_RunFunction())
            gStorage->state = 0;
        break;
    case 8:
        if (!MultiMove_RunFunction())
            SetPokeStorageTask(Task_MoveMon);
        break;
    case 9:
        if (!MultiMove_RunFunction())
        {
            if (gStorage->setMosaic)
                StartDisplayMonMosaic();
            gStorage->state = 0;
        }
        break;
    case 10:
        if (!IsItemIconAnimActive())
        {
            SetUpScrollToBox(gStorage->newCurrBoxId);
            gStorage->state = 2;
        }
        break;
    case 11:
        if (!IsItemIconAnimActive())
            gStorage->state = 0;
        break;
    }
}

static void Task_ShowPartyPokemon(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        SetUpDoShowPartyMenu();
        gStorage->state++;
        break;
    case 1:
        if (!DoShowPartyMenu())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_HidePartyPokemon(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        PlaySE(SE_SELECT);
        SetUpHidePartyMenu();
        gStorage->state++;
        break;
    case 1:
        if (!HidePartyMenu())
        {
            SetCursorBoxPosition(GetSavedCursorPos());
            gStorage->state++;
        }
        break;
    case 2:
        if (!UpdateCursorPos())
        {
            if (gStorage->setMosaic)
                StartDisplayMonMosaic();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_OnSelectedMon(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        if (!IsDisplayMonMosaicActive())
        {
            PlaySE(SE_SELECT);
            if (gStorage->boxOption != OPTION_MOVE_ITEMS)
                PrintStorageMessage(MSG_IS_SELECTED);
            else if (IsActiveItemMoving() || gStorage->displayMonItemId != 0)
                PrintStorageMessage(MSG_IS_SELECTED2);
            else
                PrintStorageMessage(MSG_GIVE_TO_MON);

            AddMenu();
            gStorage->state = 1;
        }
        break;
    case 1:
        if (!IsMenuLoading())
            gStorage->state = 2;
        break;
    case 2:
        switch (HandleMenuInput())
        {
        case MENU_B_PRESSED:
        case MENU_TEXT_CANCEL:
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case MENU_TEXT_MOVE:
            if (CanMovePartyMon())
                gStorage->state = 3;
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPokeStorageTask(Task_MoveMon);
            }
            break;
        case MENU_TEXT_PLACE:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPokeStorageTask(Task_PlaceMon);
            break;
        case MENU_TEXT_SHIFT:
            if (!CanShiftMon())
                gStorage->state = 3;
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPokeStorageTask(Task_ShiftMon);
            }
            break;
        case MENU_TEXT_WITHDRAW:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPokeStorageTask(Task_WithdrawMon);
            break;
        case MENU_TEXT_STORE:
            if (CanMovePartyMon())
                gStorage->state = 3;
            else if (ItemIsMail(gStorage->displayMonItemId))
                gStorage->state = 4;
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPokeStorageTask(Task_DepositMenu);
            }
            break;
        case MENU_TEXT_RELEASE:
            if (CanMovePartyMon())
                gStorage->state = 3;
            else if (gStorage->displayMonIsEgg)
                gStorage->state = 5;
            else if (ItemIsMail(gStorage->displayMonItemId))
                gStorage->state = 4;
            else
            {
                PlaySE(SE_SELECT);
                SetPokeStorageTask(Task_ReleaseMon);
            }
            break;
        case MENU_TEXT_SUMMARY:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_ShowMonSummary);
            break;
        case MENU_TEXT_MARK:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_ShowMarkMenu);
            break;
        case MENU_TEXT_TAKE:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_TakeItemForMoving);
            break;
        case MENU_TEXT_GIVE:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_GiveMovingItemToMon);
            break;
        case MENU_TEXT_BAG:
            SetPokeStorageTask(Task_ItemToBag);
            break;
        case MENU_TEXT_SWITCH:
            SetPokeStorageTask(Task_SwitchSelectedItem);
            break;
        case MENU_TEXT_GIVE2:
            SetPokeStorageTask(Task_GiveItemFromBag);
            break;
        case MENU_TEXT_INFO:
            SetPokeStorageTask(Task_ShowItemInfo);
            break;
        }
        break;
    case 3:
        PlaySE(SE_FAILURE);
        PrintStorageMessage(MSG_LAST_POKE);
        gStorage->state = 6;
        break;
    case 5:
        PlaySE(SE_FAILURE);
        PrintStorageMessage(MSG_CANT_RELEASE_EGG);
        gStorage->state = 6;
        break;
    case 4:
        PlaySE(SE_FAILURE);
        PrintStorageMessage(MSG_PLEASE_REMOVE_MAIL);
        gStorage->state = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_MoveMon(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        InitMonPlaceChange(CHANGE_GRAB);
        gStorage->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            if (sInPartyMenu)
                SetPokeStorageTask(Task_HandleMovingMonFromParty);
            else
                SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_PlaceMon(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        SetPokeStorageQuestLogEvent(1);
        InitMonPlaceChange(CHANGE_PLACE);
        gStorage->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            if (sInPartyMenu)
                SetPokeStorageTask(Task_HandleMovingMonFromParty);
            else
                SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_ShiftMon(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        SetPokeStorageQuestLogEvent(0);
        InitMonPlaceChange(CHANGE_SHIFT);
        gStorage->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            StartDisplayMonMosaic();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_WithdrawMon(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        if (CalculatePlayerPartyCount() == PARTY_SIZE)
        {
            PrintStorageMessage(MSG_PARTY_FULL);
            gStorage->state = 1;
        }
        else
        {
            SaveCursorPos();
            InitMonPlaceChange(CHANGE_GRAB);
            gStorage->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 2:
        if (!DoMonPlaceChange())
        {
            SetMovingMonPriority(1);
            SetUpDoShowPartyMenu();
            gStorage->state++;
        }
        break;
    case 3:
        if (!DoShowPartyMenu())
        {
            SetPokeStorageQuestLogEvent(1);
            InitMonPlaceChange(CHANGE_PLACE);
            gStorage->state++;
        }
        break;
    case 4:
        if (!DoMonPlaceChange())
        {
            UpdatePartySlotColors();
            gStorage->state++;
        }
        break;
    case 5:
        SetPokeStorageTask(Task_HidePartyPokemon);
        break;
    }
}

static void Task_DepositMenu(u8 taskId)
{
    u8 boxId;

    switch (gStorage->state)
    {
    case 0:
        PrintStorageMessage(MSG_DEPOSIT_IN_WHICH_BOX);
        LoadChooseBoxMenuGfx(&gStorage->chooseBoxMenu, GFXTAG_CHOOSE_BOX_MENU_CENTER, PALTAG_MISC_1, 3, FALSE);
        CreateChooseBoxMenuSprites(sDepositBoxId);
        gStorage->state++;
        break;
    case 1:
        boxId = HandleBoxChooseSelectionInput();
        switch (boxId)
        {
        case BOXID_NONE_CHOSEN:
            break;
        case BOXID_CANCELED:
            ClearBottomWindow();
            DestroyChooseBoxMenuSprites();
            FreeBoxSelectionPopupSpriteGfx();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        default:
            if (TryStorePartyMonInBox(boxId))
            {
                sDepositBoxId = boxId;
                SetPokeStorageQuestLogEvent(2);
                ClearBottomWindow();
                DestroyChooseBoxMenuSprites();
                FreeBoxSelectionPopupSpriteGfx();
                gStorage->state = 2;
            }
            else
            {
                PrintStorageMessage(MSG_BOX_IS_FULL);
                gStorage->state = 4;
            }
            break;
        }
        break;
    case 2:
        CompactPartySlots();
        CompactPartySprites();
        gStorage->state++;
        break;
    case 3:
        if (GetNumPartySpritesCompacting() == 0)
        {
            ResetSelectionAfterDeposit();
            StartDisplayMonMosaic();
            UpdatePartySlotColors();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageMessage(MSG_DEPOSIT_IN_WHICH_BOX);
            gStorage->state = 1;
        }
        break;
    }
}

static void Task_ReleaseMon(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        PrintStorageMessage(MSG_RELEASE_POKE);
        ShowYesNoWindow(1);
        gStorage->state++;
        // fallthrough
    case 1:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1:
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case 0:
            ClearBottomWindow();
            InitCanReleaseMonVars();
            InitReleaseMon();
            gStorage->state++;
            break;
        }
        break;
    case 2:
        RunCanReleaseMon();
        if (!TryHideReleaseMon())
        {
            while (TRUE)
            {
                // keep checking until status is no longer RELEASE_MON_UNDETERMINED
                s8 canReleaseStatus = RunCanReleaseMon();
                if (canReleaseStatus == RELEASE_MON_ALLOWED)
                {
                    gStorage->state++;
                    break;
                }
                else if (canReleaseStatus == RELEASE_MON_NOT_ALLOWED)
                {
                    gStorage->state = 8; // Can't release the mon.
                    break;
                }
            }
        }
        break;
    case 3:
        ReleaseMon();
        RefreshDisplayMonData();
        PrintStorageMessage(MSG_WAS_RELEASED);
        gStorage->state++;
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageMessage(MSG_BYE_BYE);
            gStorage->state++;
        }
        break;
    case 5:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            if (sInPartyMenu)
            {
                CompactPartySlots();
                CompactPartySprites();
                gStorage->state++;
            }
            else
                gStorage->state = 7;
        }
        break;
    case 6:
        if (GetNumPartySpritesCompacting() == 0)
        {
            DoTrySetDisplayMonData();
            StartDisplayMonMosaic();
            UpdatePartySlotColors();
            gStorage->state++;
        }
        break;
    case 7:
        SetPokeStorageTask(Task_PokeStorageMain);
        break;
    case 8:
        // Start "can't release" sequence
        PrintStorageMessage(MSG_WAS_RELEASED);
        gStorage->state++;
        break;
    case 9:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageMessage(MSG_SURPRISE);
            gStorage->state++;
        }
        break;
    case 10:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            DoReleaseMonComeBackAnim();
            gStorage->state++;
        }
        break;
    case 11:
        if (!ResetReleaseMonSpritePtr())
        {
            TrySetCursorFistAnim();
            PrintStorageMessage(MSG_CAME_BACK);
            gStorage->state++;
        }
        break;
    case 12:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageMessage(MSG_WORRIED);
            gStorage->state++;
        }
        break;
    case 13:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_ShowMarkMenu(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        PrintStorageMessage(MSG_MARK_POKE);
        gStorage->markMenu.markings = gStorage->displayMonMarkings;
        OpenMonMarkingsMenu(gStorage->displayMonMarkings, 176, 16);
        gStorage->state++;
        break;
    case 1:
        if (!HandleMonMarkingsMenuInput())
        {
            FreeMonMarkingsMenu();
            ClearBottomWindow();
            SetMonMarkings(gStorage->markMenu.markings);
            RefreshDisplayMonData();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_TakeItemForMoving(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        if (!ItemIsMail(gStorage->displayMonItemId))
        {
            ClearBottomWindow();
            gStorage->state++;
        }
        else
            SetPokeStorageTask(Task_PrintCantStoreMail);
        break;
    case 1:
        StartCursorAnim(CURSOR_ANIM_OPEN);
        Item_FromMonToMoving(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        gStorage->state++;
        break;
    case 2:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(CURSOR_ANIM_FIST);
            ClearBottomWindow();
            DoTrySetDisplayMonData();
            PrintDisplayMonInfo();
            gStorage->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_GiveMovingItemToMon(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        ClearBottomWindow();
        gStorage->state++;
        break;
    case 1:
        StartCursorAnim(CURSOR_ANIM_OPEN);
        Item_GiveMovingToMon(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        gStorage->state++;
        break;
    case 2:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(CURSOR_ANIM_BOUNCE);
            DoTrySetDisplayMonData();
            PrintDisplayMonInfo();
            PrintStorageMessage(MSG_ITEM_IS_HELD);
            gStorage->state++;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gStorage->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_ItemToBag(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        if (!AddBagItem(gStorage->displayMonItemId, 1))
        {
            PlaySE(SE_FAILURE);
            PrintStorageMessage(MSG_BAG_FULL);
            gStorage->state = 3;
        }
        else
        {
            PlaySE(SE_SELECT);
            Item_TakeMons(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
            gStorage->state = 1;
        }
        break;
    case 1:
        if (!IsItemIconAnimActive())
        {
            PrintStorageMessage(MSG_PLACED_IN_BAG);
            gStorage->state = 2;
        }
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            DoTrySetDisplayMonData();
            PrintDisplayMonInfo();
            gStorage->state = 4;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_SwitchSelectedItem(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        if (!ItemIsMail(gStorage->displayMonItemId))
        {
            ClearBottomWindow();
            gStorage->state++;
        }
        else
            SetPokeStorageTask(Task_PrintCantStoreMail);
        break;
    case 1:
        StartCursorAnim(CURSOR_ANIM_OPEN);
        Item_SwitchMonsWithMoving(sInPartyMenu ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        gStorage->state++;
        break;
    case 2:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(CURSOR_ANIM_FIST);
            DoTrySetDisplayMonData();
            PrintDisplayMonInfo();
            PrintStorageMessage(MSG_CHANGED_TO_ITEM);
            gStorage->state++;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gStorage->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_ShowItemInfo(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        ClearBottomWindow();
        gStorage->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PlaySE(SE_WIN_OPEN);
            PrintItemDescription();
            InitItemInfoWindow();
            gStorage->state++;
        }
        break;
    case 2:
        if (!UpdateItemInfoWindowSlideIn())
            gStorage->state++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            gStorage->state++;
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PlaySE(SE_WIN_OPEN);
            gStorage->state++;
        }
        break;
    case 5:
        if (!UpdateItemInfoWindowSlideOut())
            gStorage->state++;
        break;
    case 6:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_CloseBoxWhileHoldingItem(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        PlaySE(SE_SELECT);
        PrintStorageMessage(MSG_PUT_IN_BAG);
        ShowYesNoWindow(0);
        gStorage->state = 1;
        break;
    case 1:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1:
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case 0:
            if (AddBagItem(gStorage->movingItemId, 1) == TRUE)
            {
                ClearBottomWindow();
                gStorage->state = 3;
            }
            else
            {
                PrintStorageMessage(MSG_BAG_FULL);
                gStorage->state = 2;
            }
            break;
        }
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gStorage->state = 5;
        }
        break;
    case 3:
        MoveItemFromCursorToBag();
        gStorage->state = 4;
        break;
    case 4:
        if (!IsItemIconAnimActive())
        {
            StartCursorAnim(CURSOR_ANIM_BOUNCE);
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_HandleMovingMonFromParty(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        CompactPartySlots();
        CompactPartySprites();
        gStorage->state++;
        break;
    case 1:
        if (GetNumPartySpritesCompacting() == 0)
        {
            UpdatePartySlotColors();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_PrintCantStoreMail(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        PrintStorageMessage(MSG_CANT_STORE_MAIL);
        gStorage->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            gStorage->state++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            gStorage->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPokeStorageTask(Task_PokeStorageMain);
        break;
    }
}

static void Task_HandleBoxOptions(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        PrintStorageMessage(MSG_WHAT_YOU_DO);
        AddMenu();
        gStorage->state++;
        break;
    case 1:
        if (IsMenuLoading())
            return;
        gStorage->state++;
    case 2:
        switch (HandleMenuInput())
        {
        case MENU_B_PRESSED:
        case MENU_TEXT_CANCEL:
            AnimateBoxScrollArrows(TRUE);
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case MENU_TEXT_NAME:
            PlaySE(SE_SELECT);
            SetPokeStorageTask(Task_NameBox);
            break;
        case MENU_TEXT_WALLPAPER:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPokeStorageTask(Task_HandleWallpapers);
            break;
        case MENU_TEXT_JUMP:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPokeStorageTask(Task_JumpBox);
            break;
        }
        break;
    }
}

static void Task_HandleWallpapers(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        AddWallpaperSetsMenu();
        PrintStorageMessage(MSG_PICK_A_THEME);
        gStorage->state++;
        break;
    case 1:
        if (!IsMenuLoading())
            gStorage->state++;
        break;
    case 2:
        gStorage->wallpaperSetId = HandleMenuInput();
        switch (gStorage->wallpaperSetId)
        {
        case MENU_B_PRESSED:
            AnimateBoxScrollArrows(TRUE);
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case MENU_TEXT_SCENERY_1:
        case MENU_TEXT_SCENERY_2:
        case MENU_TEXT_SCENERY_3:
        case MENU_TEXT_ETCETERA:
            PlaySE(SE_SELECT);
            RemoveMenu();
            gStorage->wallpaperSetId -= MENU_TEXT_SCENERY_1;
            gStorage->state++;
            break;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            AddWallpapersMenu(gStorage->wallpaperSetId);
            PrintStorageMessage(MSG_PICK_A_WALLPAPER);
            gStorage->state++;
        }
        break;
    case 4:
        gStorage->wallpaperId = HandleMenuInput();
        switch (gStorage->wallpaperId)
        {
        case MENU_NOTHING_CHOSEN:
            break;
        case MENU_B_PRESSED:
            ClearBottomWindow();
            gStorage->state = 0;
            break;
        default:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            gStorage->wallpaperId -= MENU_TEXT_FOREST;
            SetWallpaperForCurrentBox(gStorage->wallpaperId);
            gStorage->state++;
            break;
        }
        break;
    case 5:
        if (!DoWallpaperGfxChange())
        {
            AnimateBoxScrollArrows(TRUE);
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_JumpBox(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        PrintStorageMessage(MSG_JUMP_TO_WHICH_BOX);
        LoadChooseBoxMenuGfx(&gStorage->chooseBoxMenu, GFXTAG_CHOOSE_BOX_MENU_CENTER, PALTAG_MISC_1, 3, FALSE);
        CreateChooseBoxMenuSprites(StorageGetCurrentBox());
        gStorage->state++;
        break;
    case 1:
        gStorage->newCurrBoxId = HandleBoxChooseSelectionInput();
        switch (gStorage->newCurrBoxId)
        {
        case BOXID_NONE_CHOSEN:
            break;
        default:
            ClearBottomWindow();
            DestroyChooseBoxMenuSprites();
            FreeBoxSelectionPopupSpriteGfx();
            if (gStorage->newCurrBoxId == BOXID_CANCELED || gStorage->newCurrBoxId == StorageGetCurrentBox())
            {
                AnimateBoxScrollArrows(TRUE);
                SetPokeStorageTask(Task_PokeStorageMain);
            }
            else
                gStorage->state++;
            break;
        }
        break;
    case 2:
        SetUpScrollToBox(gStorage->newCurrBoxId);
        gStorage->state++;
        break;
    case 3:
        if (!ScrollToBox())
        {
            SetCurrentBox(gStorage->newCurrBoxId);
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    }
}

static void Task_NameBox(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        SaveMovingMon();
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        gStorage->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = SCREEN_CHANGE_NAME_BOX - 1;
            gStorage->screenChangeType = SCREEN_CHANGE_NAME_BOX;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_ShowMonSummary(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        InitSummaryScreenData();
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        gStorage->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = SCREEN_CHANGE_SUMMARY_SCREEN - 1;
            gStorage->screenChangeType = SCREEN_CHANGE_SUMMARY_SCREEN;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_GiveItemFromBag(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        gStorage->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = SCREEN_CHANGE_ITEM_FROM_BAG - 1;
            gStorage->screenChangeType = SCREEN_CHANGE_ITEM_FROM_BAG;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_OnCloseBoxPressed(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        if (IsMonBeingMoved())
        {
            PlaySE(SE_FAILURE);
            PrintStorageMessage(MSG_HOLDING_POKE);
            gStorage->state = 1;
        }
        else if (IsActiveItemMoving())
            SetPokeStorageTask(Task_CloseBoxWhileHoldingItem);
        else
        {
            PlaySE(SE_SELECT);
            PrintStorageMessage(MSG_EXIT_BOX);
            ShowYesNoWindow(0);
            gStorage->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1:
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case 0:
            PlaySE(SE_PC_OFF);
            ClearBottomWindow();
            gStorage->state++;
            break;
        }
        break;
    case 3:
        BeginPCScreenEffect_TurnOff(20, 0, 1);
        gStorage->state++;
        break;
    case 4:
        if (!IsPCScreenEffectRunning_TurnOff())
        {
            UpdateBoxToSendMons();
            gPlayerPartyCount = CalculatePlayerPartyCount();
            gStorage->screenChangeType = SCREEN_CHANGE_EXIT_BOX;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_OnBPressed(u8 taskId)
{
    switch (gStorage->state)
    {
    case 0:
        if (IsMonBeingMoved())
        {
            if (OW_PC_PRESS_B < GEN_4)
            {
                PlaySE(SE_FAILURE);
                PrintStorageMessage(MSG_HOLDING_POKE);
                gStorage->state = 1;
            }
            else if (CanPlaceMon())
            {
                PlaySE(SE_SELECT);
                SetPokeStorageTask(Task_PlaceMon);
            }
            else
            {
                SetPokeStorageTask(Task_PokeStorageMain);
            }
        }
        else if (IsActiveItemMoving())
            SetPokeStorageTask(Task_CloseBoxWhileHoldingItem);
        else
        {
            PlaySE(SE_SELECT);
            PrintStorageMessage(MSG_CONTINUE_BOX);
            ShowYesNoWindow(0);
            gStorage->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case 0:
            ClearBottomWindow();
            SetPokeStorageTask(Task_PokeStorageMain);
            break;
        case 1:
        case MENU_B_PRESSED:
            PlaySE(SE_PC_OFF);
            ClearBottomWindow();
            gStorage->state++;
            break;
        }
        break;
    case 3:
        BeginPCScreenEffect_TurnOff(20, 0, 0);
        gStorage->state++;
        break;
    case 4:
        if (!IsPCScreenEffectRunning_TurnOff())
        {
            UpdateBoxToSendMons();
            gPlayerPartyCount = CalculatePlayerPartyCount();
            gStorage->screenChangeType = SCREEN_CHANGE_EXIT_BOX;
            SetPokeStorageTask(Task_ChangeScreen);
        }
        break;
    }
}

static void Task_ChangeScreen(u8 taskId)
{
    struct Pokemon *party;
    u8 mode, cursorPos, lastIndex;
    u8 screenChangeType = gStorage->screenChangeType;

    if (gStorage->boxOption == OPTION_MOVE_ITEMS && IsActiveItemMoving() == TRUE)
        sMovingItemId = GetMovingItem();
    else
        sMovingItemId = ITEM_NONE;

    switch (screenChangeType)
    {
    case SCREEN_CHANGE_EXIT_BOX:
    default:
        FreePokeStorageData();
        SetMainCallback2(CB2_ExitPokeStorage);
        break;
    case SCREEN_CHANGE_SUMMARY_SCREEN:
        party = gStorage->summaryMonPtr.mon;
        cursorPos = gStorage->summaryCursorPos;
        lastIndex = gStorage->summaryLastIndex;
        mode = gStorage->summaryScreenMode;
        FreePokeStorageData();
        ShowPokemonSummaryScreen(party, cursorPos, lastIndex, CB2_ReturnToPokeStorage, mode);
        break;
    case SCREEN_CHANGE_NAME_BOX:
        FreePokeStorageData();
        DoNamingScreen(NAMING_SCREEN_BOX, GetBoxNamePtr(StorageGetCurrentBox()), 0, 0, 0, CB2_ReturnToPokeStorage);
        break;
    case SCREEN_CHANGE_ITEM_FROM_BAG:
        FreePokeStorageData();
        GoToBagMenu(ITEMMENULOCATION_PCBOX, OPEN_BAG_ITEMS, CB2_ReturnToPokeStorage);
        break;
    }

    DestroyTask(taskId);
}

static void GiveChosenBagItem(void)
{
    u16 item = gSpecialVar_ItemId;

    if (item != ITEM_NONE)
    {
        u8 id = GetBoxCursorPosition();

        if (sInPartyMenu)
            SetMonData(&gPlayerParty[id], MON_DATA_HELD_ITEM, &item);
        else
            SetCurrentBoxMonData(id, MON_DATA_HELD_ITEM, &item);

        RemoveBagItem(item, 1);
    }
}

static void FreePokeStorageData(void)
{
    TilemapUtil_Free();
    MultiMove_Free();
    FREE_AND_SET_NULL(gStorage);
    FreeAllWindowBuffers();
}

static void SetScrollingBackground(void)
{
    SetGpuReg(REG_OFFSET_BG3CNT, BGCNT_PRIORITY(3) | BGCNT_CHARBASE(3) | BGCNT_16COLOR | BGCNT_SCREENBASE(31));
    DecompressAndLoadBgGfxUsingHeap(3, sScrollingBg_Gfx, 0, 0, 0);
    LZ77UnCompVram(sScrollingBg_Tilemap, (void *)BG_SCREEN_ADDR(31));
}

static void ScrollBackground(void)
{
    ChangeBgX(3, 128, 1);
    ChangeBgY(3, 128, 2);
}

static void LoadPokeStorageMenuGfx(void)
{
    InitBgsFromTemplates(0, sBgTemplates, ARRAY_COUNT(sBgTemplates));
    DecompressAndLoadBgGfxUsingHeap(1, gPokeStorageMenu_Gfx, 0, 0, 0);
    LZ77UnCompWram(sMenu_Tilemap, gStorage->menuTilemapBuffer);
    SetBgTilemapBuffer(1, gStorage->menuTilemapBuffer);
    ShowBg(1);
    ScheduleBgCopyTilemapToVram(1);
}

static bool8 InitPokeStorageWindows(void)
{
    if (!InitWindows(sWindowTemplates))
        return FALSE;

    DeactivateAllTextPrinters();
    return TRUE;
}

static void LoadsMiscSpritePalette(void)
{
    LoadSpritePalette(&sMiscSpritePalette);
}

static void InitPalettesAndSprites(void)
{
    LoadPalette(gPokeStorageInterface_Pal, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
    LoadPalette(gPokeStorageInterface_NoDisplayMon_Pal, BG_PLTT_ID(2), PLTT_SIZE_4BPP);
    LoadPalette(sItemInfoFrame_Pal, BG_PLTT_ID(15), sizeof(sItemInfoFrame_Pal));
    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        LoadPalette(sScrollingBg_Pal, BG_PLTT_ID(3), sizeof(sScrollingBg_Pal));
    else
        LoadPalette(sScrollingBgMoveItems_Pal, BG_PLTT_ID(3), sizeof(sScrollingBgMoveItems_Pal));

    SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(1) | BGCNT_CHARBASE(1) | BGCNT_16COLOR | BGCNT_SCREENBASE(30));
    CreateDisplayMonSprite();
    CreateMarkingComboSprite();
    CreateWaveformSprites();
    RefreshDisplayMonData();
}

static void CreateMarkingComboSprite(void)
{
    gStorage->markingComboSprite = CreateMonMarkingComboSprite(GFXTAG_MARKING_COMBO, PALTAG_MARKING_COMBO, NULL);
    gStorage->markingComboSprite->oam.priority = 1;
    gStorage->markingComboSprite->subpriority = 1;
    gStorage->markingComboSprite->x = 40;
    gStorage->markingComboSprite->y = 150;
    gStorage->markingComboTilesPtr = (void *)OBJ_VRAM0 + 32 * GetSpriteTileStartByTag(GFXTAG_MARKING_COMBO);
}

static void CreateWaveformSprites(void)
{
    u16 i;
    struct SpriteSheet sheet = sWaveformSpriteSheet;

    LoadSpriteSheet(&sheet);
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&sSpriteTemplate_Waveform, i * 63 + 8, 9, 2);
        gStorage->waveformSprites[i] = &gSprites[spriteId];
    }
}

static void RefreshDisplayMonData(void)
{
    LoadDisplayMonGfx(gStorage->displayMonSpecies, gStorage->displayMonPersonality);
    PrintDisplayMonInfo();
    UpdateWaveformAnimation();
    ScheduleBgCopyTilemapToVram(0);
}

static void StartDisplayMonMosaic(void)
{
    RefreshDisplayMonData();
    if (gStorage->displayMonSprite)
    {
        gStorage->displayMonSprite->oam.mosaic = TRUE;
        gStorage->displayMonSprite->data[0] = 10;
        gStorage->displayMonSprite->data[1] = 1;
        gStorage->displayMonSprite->callback = SpriteCB_DisplayMonMosaic;
        SetGpuReg(REG_OFFSET_MOSAIC, (gStorage->displayMonSprite->data[0] << 12) | (gStorage->displayMonSprite->data[0] << 8));
    }
}

static u8 IsDisplayMonMosaicActive(void)
{
    return gStorage->displayMonSprite->oam.mosaic;
}

static void SpriteCB_DisplayMonMosaic(struct Sprite *sprite)
{
    sprite->data[0] -= sprite->data[1];
    if (sprite->data[0] < 0)
        sprite->data[0] = 0;
    SetGpuReg(REG_OFFSET_MOSAIC, (sprite->data[0] << 12) | (sprite->data[0] << 8));
    if (sprite->data[0] == 0)
    {
        sprite->oam.mosaic = FALSE;
        sprite->callback = SpriteCallbackDummy;
    }
}

static void CreateDisplayMonSprite(void)
{
    u16 i;
    u16 tileStart;
    u8 palSlot;
    u8 spriteId;
    struct SpriteSheet sheet = {gStorage->tileBuffer, MON_PIC_SIZE, GFXTAG_DISPLAY_MON};
    struct SpritePalette palette = {gStorage->displayMonPalette, PALTAG_DISPLAY_MON};
    struct SpriteTemplate template = sSpriteTemplate_DisplayMon;

    for (i = 0; i < MON_PIC_SIZE; i++)
        gStorage->tileBuffer[i] = 0;

    gStorage->displayMonSprite = NULL;

    do
    {
        tileStart = LoadSpriteSheet(&sheet);
        if (tileStart == 0)
            break;

        palSlot = LoadSpritePalette(&palette);
        if (palSlot == 0xFF)
            break;

        spriteId = CreateSprite(&template, 40, 48, 0);
        if (spriteId == MAX_SPRITES)
            break;

        gStorage->displayMonSprite = &gSprites[spriteId];
        gStorage->displayMonPalOffset = OBJ_PLTT_ID(palSlot);
        gStorage->displayMonTilePtr = (void *)OBJ_VRAM0 + tileStart * 32;
    } while (FALSE);

    if (gStorage->displayMonSprite == NULL)
    {
        FreeSpriteTilesByTag(GFXTAG_DISPLAY_MON);
        FreeSpritePaletteByTag(PALTAG_DISPLAY_MON);
    }
}

static void LoadDisplayMonGfx(u16 species, u32 personality)
{
    if (gStorage->displayMonSprite == NULL)
        return;

    if (species != SPECIES_NONE)
    {
        HandleLoadSpecialPokePic(TRUE, gStorage->tileBuffer, species, personality);
        CpuCopy32(gStorage->tileBuffer, gStorage->displayMonTilePtr, 0x800);
        LoadPalette(gStorage->displayMonPalette, gStorage->displayMonPalOffset, PLTT_SIZE_4BPP);
        gStorage->displayMonSprite->invisible = FALSE;
    }
    else
        gStorage->displayMonSprite->invisible = TRUE;
}

static void PrintDisplayMonInfo(void)
{
    u16 i;
    u16 y;
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
    {
        for (i = 0, y = 0; i < 3; i++, y += 14)
            AddTextPrinterParameterized(0, FONT_NORMAL, gStorage->displayMonTexts[i], i == 2 ? 10 : 6, y, TEXT_SKIP_DRAW, NULL);

        AddTextPrinterParameterized(0, FONT_SMALL, gStorage->displayMonTexts[3], 6, y + 2, TEXT_SKIP_DRAW, NULL);
    }
    else
    {
        AddTextPrinterParameterized(0, FONT_SMALL, gStorage->displayMonTexts[3], 6, 0, TEXT_SKIP_DRAW, NULL);
        for (i = 0, y = 15; i < 3; i++, y += 14)
            AddTextPrinterParameterized(0, FONT_NORMAL, gStorage->displayMonTexts[i], i == 2 ? 10 : 6, y, TEXT_SKIP_DRAW, NULL);
    }

    CopyWindowToVram(0, COPYWIN_GFX);
    if (gStorage->displayMonSpecies != SPECIES_NONE)
    {
        UpdateMonMarkingTiles(gStorage->displayMonMarkings, gStorage->markingComboTilesPtr);
        gStorage->markingComboSprite->invisible = FALSE;
    }
    else
        gStorage->markingComboSprite->invisible = TRUE;
}

static void UpdateWaveformAnimation(void)
{
    u16 i;

    if (gStorage->displayMonSpecies != SPECIES_NONE)
    {
        TilemapUtil_SetRect(TILEMAP_PKMN_DATA, 0, 0, 8, 2);
        for (i = 0; i < 2; i++)
            StartSpriteAnimIfDifferent(gStorage->waveformSprites[i], i * 2 + 1);
    }
    else
    {
        TilemapUtil_SetRect(TILEMAP_PKMN_DATA, 0, 2, 8, 2);
        for (i = 0; i < 2; i++)
            StartSpriteAnim(gStorage->waveformSprites[i], i * 2);
    }

    TilemapUtil_Update(TILEMAP_PKMN_DATA);
    ScheduleBgCopyTilemapToVram(1);
}

static void InitSupplementalTilemaps(void)
{
    LZ77UnCompWram(gPokeStoragePartyMenu_Tilemap, gStorage->partyMenuTilemapBuffer);
    LoadPalette(gPokeStoragePartyMenu_Pal, BG_PLTT_ID(1), PLTT_SIZE_4BPP);
    TilemapUtil_SetTilemap(TILEMAP_PARTY_MENU, 1, gStorage->partyMenuTilemapBuffer, 12, 22);
    TilemapUtil_SetTilemap(TILEMAP_CLOSE_BUTTON, 1, sCloseBoxButton_Tilemap, 9, 4);
    TilemapUtil_SetPos(TILEMAP_PARTY_MENU, 10, 0);
    TilemapUtil_SetPos(TILEMAP_CLOSE_BUTTON, 21, 0);
    SetPartySlotTilemaps();
    if (sInPartyMenu)
    {
        UpdateCloseBoxButtonTilemap(TRUE);
        CreatePartyMonsSprites(TRUE);
        TilemapUtil_Update(TILEMAP_CLOSE_BUTTON);
        TilemapUtil_Update(TILEMAP_PARTY_MENU);
    }
    else
    {
        TilemapUtil_SetRect(TILEMAP_PARTY_MENU, 0, 20, 12, 2);
        UpdateCloseBoxButtonTilemap(TRUE);
        TilemapUtil_Update(TILEMAP_PARTY_MENU);
        TilemapUtil_Update(TILEMAP_CLOSE_BUTTON);
    }

    ScheduleBgCopyTilemapToVram(1);
    gStorage->closeBoxFlashing = FALSE;
}

static void SetUpShowPartyMenu(void)
{
    gStorage->partyMenuUnused1 = 20;
    gStorage->partyMenuY = 2;
    gStorage->partyMenuMoveTimer = 0;
    CreatePartyMonsSprites(FALSE);
}

static bool8 ShowPartyMenu(void)
{
    if (gStorage->partyMenuMoveTimer == 20)
        return FALSE;

    gStorage->partyMenuUnused1--;
    gStorage->partyMenuY++;
    TilemapUtil_Move(TILEMAP_PARTY_MENU, 3, 1);
    TilemapUtil_Update(TILEMAP_PARTY_MENU);
    ScheduleBgCopyTilemapToVram(1);
    MovePartySprites(8);
    if (++gStorage->partyMenuMoveTimer == 20)
    {
        sInPartyMenu = TRUE;
        return FALSE;
    }
    else
        return TRUE;
}

static void SetUpHidePartyMenu(void)
{
    gStorage->partyMenuUnused1 = 0;
    gStorage->partyMenuY = 22;
    gStorage->partyMenuMoveTimer = 0;
    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
        MoveHeldItemWithPartyMenu();
}

static bool8 HidePartyMenu(void)
{
    if (gStorage->partyMenuMoveTimer != 20)
    {
        gStorage->partyMenuUnused1++;
        gStorage->partyMenuY--;
        TilemapUtil_Move(TILEMAP_PARTY_MENU, 3, -1);
        TilemapUtil_Update(TILEMAP_PARTY_MENU);
        FillBgTilemapBufferRect_Palette0(1, 0x100, 10, gStorage->partyMenuY, 12, 1);
        MovePartySprites(-8);
        if (++gStorage->partyMenuMoveTimer != 20)
        {
            ScheduleBgCopyTilemapToVram(1);
            return TRUE;
        }
        else
        {
            sInPartyMenu = FALSE;
            DestroyAllPartyMonIcons();
            CompactPartySlots();
            TilemapUtil_SetRect(TILEMAP_CLOSE_BUTTON, 0, 0, 9, 2);
            TilemapUtil_Update(TILEMAP_CLOSE_BUTTON);
            ScheduleBgCopyTilemapToVram(1);
            return FALSE;
        }
    }

    return FALSE;
}

static void UpdateCloseBoxButtonTilemap(bool8 normal)
{
    if (normal)
        TilemapUtil_SetRect(TILEMAP_CLOSE_BUTTON, 0, 0, 9, 2);
    else
        TilemapUtil_SetRect(TILEMAP_CLOSE_BUTTON, 0, 2, 9, 2);

    TilemapUtil_Update(TILEMAP_CLOSE_BUTTON);
    ScheduleBgCopyTilemapToVram(1);
}

static void StartFlashingCloseBoxButton(void)
{
    gStorage->closeBoxFlashing = TRUE;
    gStorage->closeBoxFlashTimer = 30;
    gStorage->closeBoxFlashState = TRUE;
}

static void StopFlashingCloseBoxButton(void)
{
    if (gStorage->closeBoxFlashing)
    {
        gStorage->closeBoxFlashing = FALSE;
        UpdateCloseBoxButtonTilemap(TRUE);
    }
}

static void UpdateCloseBoxButtonFlash(void)
{
    if (gStorage->closeBoxFlashing && ++gStorage->closeBoxFlashTimer > 30)
    {
        gStorage->closeBoxFlashTimer = 0;
        gStorage->closeBoxFlashState = (gStorage->closeBoxFlashState == FALSE);
        UpdateCloseBoxButtonTilemap(gStorage->closeBoxFlashState);
    }
}

static void SetPartySlotTilemaps(void)
{
    u8 i;

    // Skips first party slot, it should always be drawn
    // as if it has a Pokémon in it
    for (i = 1; i < PARTY_SIZE; i++)
    {
        s32 species = GetMonData(gPlayerParty + i, MON_DATA_SPECIES);
        SetPartySlotTilemap(i, (species != SPECIES_NONE));
    }
}

static void SetPartySlotTilemap(u8 pos, bool8 isFilled)
{
    u16 i, j, index;
    const u16 *tilemap;

    if (isFilled)
        tilemap = sPartySlotFilled_Tilemap;
    else
        tilemap = sPartySlotEmpty_Tilemap;

    index = 3 * (3 * (pos - 1) + 1);
    index *= 4;
    index += 7;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 4; j++)
            gStorage->partyMenuTilemapBuffer[index + j] = tilemap[j];

        tilemap += 4;
        index += 12;
    }
}

static void UpdatePartySlotColors(void)
{
    SetPartySlotTilemaps();
    TilemapUtil_SetRect(TILEMAP_PARTY_MENU, 0, 0, 12, 22);
    TilemapUtil_Update(TILEMAP_PARTY_MENU);
    ScheduleBgCopyTilemapToVram(1);
}

static void SetUpDoShowPartyMenu(void)
{
    gStorage->showPartyMenuState = 0;
    PlaySE(SE_WIN_OPEN);
    SetUpShowPartyMenu();
}

static bool8 DoShowPartyMenu(void)
{
    switch (gStorage->showPartyMenuState)
    {
    case 0:
        if (!ShowPartyMenu())
        {
            SetCursorInParty();
            gStorage->showPartyMenuState++;
        }
        break;
    case 1:
        if (!UpdateCursorPos())
        {
            if (gStorage->setMosaic)
                StartDisplayMonMosaic();
            gStorage->showPartyMenuState++;
        }
        break;
    case 2:
        return FALSE;
    }
    return TRUE;
}

static void InitPokeStorageBg0(void)
{
    SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(29));
    LoadStdWindowGfx(1, 2, BG_PLTT_ID(13));
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 20, 17);
    CopyBgTilemapBufferToVram(0);
}

static void PrintStorageMessage(u8 id)
{
    u8 *txtPtr;

    DynamicPlaceholderTextUtil_Reset();
    switch (sMessages[id].format)
    {
    case MSG_FMT_NONE:
        break;
    case MSG_FMT_MON_NAME_1:
    case MSG_FMT_MON_NAME_2:
    case MSG_FMT_MON_NAME_3:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStorage->displayMonNickname);
        break;
    case MSG_FMT_RELEASE_MON_1:
    case MSG_FMT_RELEASE_MON_2:
    case MSG_FMT_RELEASE_MON_3:
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStorage->releaseMonName);
        break;
    case MSG_FMT_ITEM_NAME:
        if (IsActiveItemMoving())
            txtPtr = StringCopy(gStorage->itemName, GetMovingItemName());
        else
            txtPtr = StringCopy(gStorage->itemName, gStorage->displayMonTexts[3]);

        while (*(txtPtr - 1) == CHAR_SPACE)
            txtPtr--;

        *txtPtr = EOS;
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gStorage->itemName);
        break;
    }

    DynamicPlaceholderTextUtil_ExpandPlaceholders(gStorage->actionText, sMessages[id].text);
    FillWindowPixelBuffer(1, PIXEL_FILL(1));
    AddTextPrinterParameterized(1, FONT_NORMAL_COPY_1, gStorage->actionText, 0, 2, TEXT_SKIP_DRAW, NULL);
    DrawTextBorderOuter(1, 2, 13);
    PutWindowTilemap(1);
    CopyWindowToVram(1, COPYWIN_GFX);
    ScheduleBgCopyTilemapToVram(0);
}

static void ShowYesNoWindow(s8 cursorPos)
{
    CreateYesNoMenuAtPos(&sYesNoWindowTemplate, FONT_NORMAL_COPY_1, 0, 2, 11, 14, 1);
    Menu_MoveCursorNoWrapAround(cursorPos);
}

static void ClearBottomWindow(void)
{
    ClearStdWindowAndFrameToTransparent(1, FALSE);
    ScheduleBgCopyTilemapToVram(0);
}

static void AddWallpaperSetsMenu(void)
{
    InitMenu();
    SetMenuText(MENU_TEXT_SCENERY_1);
    SetMenuText(MENU_TEXT_SCENERY_2);
    SetMenuText(MENU_TEXT_SCENERY_3);
    SetMenuText(MENU_TEXT_ETCETERA);
    AddMenu();
}

static void AddWallpapersMenu(u8 wallpaperSet)
{
    InitMenu();
    switch (wallpaperSet)
    {
    case 0: // SCENERY_1
        SetMenuText(MENU_TEXT_FOREST);
        SetMenuText(MENU_TEXT_CITY);
        SetMenuText(MENU_TEXT_DESERT);
        SetMenuText(MENU_TEXT_SAVANNA);
        break;
    case 1: // SCENERY_2
        SetMenuText(MENU_TEXT_CRAG);
        SetMenuText(MENU_TEXT_VOLCANO);
        SetMenuText(MENU_TEXT_SNOW);
        SetMenuText(MENU_TEXT_CAVE);
        break;
    case 2: // SCENERY_3
        SetMenuText(MENU_TEXT_BEACH);
        SetMenuText(MENU_TEXT_SEAFLOOR);
        SetMenuText(MENU_TEXT_RIVER);
        SetMenuText(MENU_TEXT_SKY);
        break;
    case 3: // ETCETERA
        SetMenuText(MENU_TEXT_POLKADOT);
        SetMenuText(MENU_TEXT_POKECENTER);
        SetMenuText(MENU_TEXT_MACHINE);
        SetMenuText(MENU_TEXT_SIMPLE);
        break;
    }
    AddMenu();
}

static u8 GetCurrentBoxOption(void)
{
    return sCurrentBoxOption;
}

static void InitCursorItemIcon(void)
{
    if (!IsCursorOnBoxTitle())
    {
        if (sInPartyMenu)
            TryLoadItemIconAtPos(CURSOR_AREA_IN_PARTY, GetBoxCursorPosition());
        else
            TryLoadItemIconAtPos(CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
    }

    if (sMovingItemId != ITEM_NONE)
    {
        InitItemIconInCursor(sMovingItemId);
        StartCursorAnim(CURSOR_ANIM_FIST);
    }
}

static void SetPokeStorageQuestLogEvent(u8 action)
{
    u16 event;
    struct QuestLogEvent_MovedBoxMon *questLogData;
    u8 box1 = GetMovingMonOriginalBoxId();
    u16 species1 = gStorage->displayMonSpecies;
    u16 species2;
    u8 box2;
    if (sInPartyMenu)
    {
        box2 = TOTAL_BOXES_COUNT;
        species2 = GetMonData(&gPlayerParty[GetBoxCursorPosition()], MON_DATA_SPECIES_OR_EGG);
    }
    else
    {
        box2 = StorageGetCurrentBox();
        species2 = GetCurrentBoxMonData(GetBoxCursorPosition(), MON_DATA_SPECIES_OR_EGG);
    }
    questLogData = &gStorage->questLogData;

    switch (action)
    {
    default:
        return;
    case 0:
        if (sInPartyMenu)
        {
            if (box1 == TOTAL_BOXES_COUNT)
                return;
            else
                event = QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON;
        }
        else
        {
            if (box1 == TOTAL_BOXES_COUNT)
                // Should upmerge but doesn't
                event = QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON;
            else
                event = box1 != box2 ? QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES : QL_EVENT_SWITCHED_MONS_WITHIN_BOX;
        }
        questLogData->species1 = species1;
        questLogData->species2 = species2;
        questLogData->box1 = box1;
        questLogData->box2 = box2;
        break;
    case 1:
        questLogData->species1 = species1;
        questLogData->species2 = SPECIES_NONE;
        questLogData->box1 = box1;
        questLogData->box2 = 0xFF;
        if (sInPartyMenu)
        {
            if (box1 == TOTAL_BOXES_COUNT)
                return;
            else
                event = QL_EVENT_WITHDREW_MON_PC;
        }
        else
        {
            if (box1 == TOTAL_BOXES_COUNT)
            {
                event = QL_EVENT_DEPOSITED_MON_PC;
                questLogData->box1 = box2;
            }
            else if (box1 != box2)
            {
                event = QL_EVENT_MOVED_MON_BETWEEN_BOXES;
                questLogData->box2 = box2;
            }
            else
                event = QL_EVENT_MOVED_MON_WITHIN_BOX;
        }
        break;
    case 2:
        event = QL_EVENT_DEPOSITED_MON_PC;
        questLogData->species1 = species1;
        questLogData->species2 = SPECIES_NONE;
        questLogData->box1 = sDepositBoxId;
        questLogData->box2 = 0xFF;
        break;
    case 3:
        event = QL_EVENT_SWITCHED_MULTIPLE_MONS;
        questLogData->species1 = SPECIES_NONE;
        questLogData->species2 = SPECIES_NONE;
        questLogData->box1 = box1;
        questLogData->box2 = box2;
        break;
    }
    SetQuestLogEvent(event, (const u16 *)questLogData);
}

static void UpdateBoxToSendMons(void)
{
    if (sLastUsedBox != StorageGetCurrentBox())
    {
        FlagClear(FLAG_SHOWN_BOX_WAS_FULL_MESSAGE);
        VarSet(VAR_PC_BOX_TO_SEND_MON, StorageGetCurrentBox());
    }
}

static void InitMonIconFields(void)
{
    u16 i;

    LoadMonIconPalettes();
    for (i = 0; i < MAX_MON_ICONS; i++)
        gStorage->numIconsPerSpecies[i] = 0;
    for (i = 0; i < MAX_MON_ICONS; i++)
        gStorage->iconSpeciesList[i] = SPECIES_NONE;
    for (i = 0; i < PARTY_SIZE; i++)
        gStorage->partySprites[i] = NULL;
    for (i = 0; i < IN_BOX_COUNT; i++)
        gStorage->boxMonsSprites[i] = NULL;

    gStorage->movingMonSprite = NULL;
    gStorage->unusedField1 = 0;
}

static u8 GetMonIconPriorityByCursorArea(void)
{
    return (IsCursorInBox() ? 2 : 1);
}

void CreateMovingMonIcon(void)
{
    u32 personality = GetMonData(&gStorage->movingMon, MON_DATA_PERSONALITY);
    u16 species = GetMonData(&gStorage->movingMon, MON_DATA_SPECIES_OR_EGG);
    u8 priority = GetMonIconPriorityByCursorArea();

    gStorage->movingMonSprite = CreateMonIconSprite(species, personality, 0, 0, priority, 7);
    gStorage->movingMonSprite->callback = SpriteCB_HeldMon;
}

static void InitBoxMonSprites(u8 boxId)
{
    u8 boxPosition;
    u16 i, j, count;
    u16 species;
    u32 personality;

    count = 0;
    boxPosition = 0;
    for (i = 0; i < IN_BOX_ROWS; i++)
    {
        for (j = 0; j < IN_BOX_COLUMNS; j++)
        {
            species = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_SPECIES_OR_EGG);
            if (species != SPECIES_NONE)
            {
                personality = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_PERSONALITY);
                gStorage->boxMonsSprites[count] = CreateMonIconSprite(species, personality, 8 * (3 * j) + 100, 8 * (3 * i) + 44, 2, 19 - j);
            }
            else
                gStorage->boxMonsSprites[count] = NULL;

            boxPosition++;
            count++;
        }
    }

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        for (boxPosition = 0; boxPosition < IN_BOX_COUNT; boxPosition++)
        {
            if (GetBoxMonDataAt(boxId, boxPosition, MON_DATA_HELD_ITEM) == 0)
                gStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
        }
    }
}

void CreateBoxMonIconAtPos(u8 boxPosition)
{
    u16 species = GetCurrentBoxMonData(boxPosition, MON_DATA_SPECIES_OR_EGG);

    if (species != SPECIES_NONE)
    {
        s16 x = 8 * (3 * (boxPosition % IN_BOX_COLUMNS)) + 100;
        s16 y = 8 * (3 * (boxPosition / IN_BOX_COLUMNS)) + 44;
        u32 personality = GetCurrentBoxMonData(boxPosition, MON_DATA_PERSONALITY);

        gStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(species, personality, x, y, 2, 19 - (boxPosition % IN_BOX_COLUMNS));
        if (gStorage->boxOption == OPTION_MOVE_ITEMS)
            gStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
    }
}

#define sDistance data[1]
#define sSpeed    data[2]
#define sDestX    data[3]
#define sDelay    data[4]
#define sPosX     data[5]

static void StartBoxMonIconsScrollOut(s16 speed)
{
    u16 i;

    for (i = 0; i < IN_BOX_COUNT; i++)
    {
        if (gStorage->boxMonsSprites[i] != NULL)
        {
            gStorage->boxMonsSprites[i]->sSpeed = speed;
            gStorage->boxMonsSprites[i]->sDelay = 1;
            gStorage->boxMonsSprites[i]->callback = SpriteCB_BoxMonIconScrollOut;
        }
    }
}

static void SpriteCB_BoxMonIconScrollIn(struct Sprite *sprite)
{
    if (sprite->sDistance != 0)
    {
        sprite->sDistance--;
        sprite->x += sprite->sSpeed;
    }
    else
    {
        gStorage->iconScrollNumIncoming--;
        sprite->x = sprite->sDestX;
        sprite->callback = SpriteCallbackDummy;
    }
}

static void SpriteCB_BoxMonIconScrollOut(struct Sprite *sprite)
{
    if (sprite->sDelay != 0)
        sprite->sDelay--;
    else
    {
        sprite->x += sprite->sSpeed;
        sprite->sPosX = sprite->x + sprite->x2;

        // Check if mon icon has scrolled out of view of the box area
        if (sprite->sPosX <= 68 || sprite->sPosX >= 252)
            sprite->callback = SpriteCallbackDummy;
    }
}

static void DestroyAllIconsInColumn(u8 column)
{
    u16 row;
    u8 boxPosition = column;

    for (row = 0; row < IN_BOX_ROWS; row++)
    {
        if (gStorage->boxMonsSprites[boxPosition] != NULL)
        {
            DestroyBoxMonIcon(gStorage->boxMonsSprites[boxPosition]);
            gStorage->boxMonsSprites[boxPosition] = NULL;
        }
        boxPosition += IN_BOX_COLUMNS;
    }
}

static u8 CreateBoxMonIconsInColumn(u8 column, u16 distance, s16 speed)
{
    s32 i;
    u16 y = 44;
    s16 xDest = 8 * (3 * column) + 100;
    u16 x = xDest - ((distance + 1) * speed);
    u8 subpriority = 19 - column;
    u8 count = 0;
    u8 boxPosition = column;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < IN_BOX_ROWS; i++)
        {
            if (gStorage->boxSpecies[boxPosition] != SPECIES_NONE)
            {
                gStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(gStorage->boxSpecies[boxPosition],
                                                                            gStorage->boxPersonalities[boxPosition],
                                                                            x, y, 2, subpriority);
                if (gStorage->boxMonsSprites[boxPosition] != NULL)
                {
                    gStorage->boxMonsSprites[boxPosition]->sDistance = distance;
                    gStorage->boxMonsSprites[boxPosition]->sSpeed = speed;
                    gStorage->boxMonsSprites[boxPosition]->sDestX = xDest;
                    gStorage->boxMonsSprites[boxPosition]->callback = SpriteCB_BoxMonIconScrollIn;
                    count++;
                }
            }
            boxPosition += IN_BOX_COLUMNS;
            y += 24;
        }
    }
    else
    {
        for (i = 0; i < IN_BOX_ROWS; i++)
        {
            if (gStorage->boxSpecies[boxPosition] != SPECIES_NONE)
            {
                gStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(gStorage->boxSpecies[boxPosition],
                                                                            gStorage->boxPersonalities[boxPosition],
                                                                            x, y, 2, subpriority);
                if (gStorage->boxMonsSprites[boxPosition] != NULL)
                {
                    gStorage->boxMonsSprites[boxPosition]->sDistance = distance;
                    gStorage->boxMonsSprites[boxPosition]->sSpeed = speed;
                    gStorage->boxMonsSprites[boxPosition]->sDestX = xDest;
                    gStorage->boxMonsSprites[boxPosition]->callback = SpriteCB_BoxMonIconScrollIn;
                    if (GetBoxMonDataAt(gStorage->incomingBoxId, boxPosition, MON_DATA_HELD_ITEM) == 0)
                        gStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
                    count++;
                }
            }
            boxPosition += IN_BOX_COLUMNS;
            y += 24;
        }
    }

    return count;
}

#undef sDistance
#undef sSpeed
#undef sDestX
#undef sDelay
#undef sPosX

static void InitBoxMonIconScroll(u8 boxId, s8 direction)
{
    gStorage->iconScrollState = 0;
    gStorage->iconScrollToBoxId = boxId;
    gStorage->iconScrollDirection = direction;
    gStorage->iconScrollDistance = 32;
    gStorage->iconScrollSpeed = -(6 * direction);
    gStorage->iconScrollNumIncoming = 0;
    SetBoxSpeciesAndPersonalities(boxId);
    if (direction > 0)
        gStorage->iconScrollCurColumn = 0;
    else
        gStorage->iconScrollCurColumn = IN_BOX_COLUMNS - 1;

    gStorage->iconScrollPos = (24 * gStorage->iconScrollCurColumn) + 100;
    StartBoxMonIconsScrollOut(gStorage->iconScrollSpeed);
}

static bool8 UpdateBoxMonIconScroll(void)
{
    if (gStorage->iconScrollDistance != 0)
        gStorage->iconScrollDistance--;

    switch (gStorage->iconScrollState)
    {
    case 0:
        gStorage->iconScrollPos += gStorage->iconScrollSpeed;
        if (gStorage->iconScrollPos <= 64 || gStorage->iconScrollPos >= 252)
        {
            // A column of icons has gone offscreen, destroy them
            DestroyAllIconsInColumn(gStorage->iconScrollCurColumn);
            gStorage->iconScrollPos += gStorage->iconScrollDirection * 24;
            gStorage->iconScrollState++;
        }
        break;
    case 1:
        // Create the new incoming column of icons
        gStorage->iconScrollPos += gStorage->iconScrollSpeed;
        gStorage->iconScrollNumIncoming += CreateBoxMonIconsInColumn(gStorage->iconScrollCurColumn, gStorage->iconScrollDistance, gStorage->iconScrollSpeed);
        if ((gStorage->iconScrollDirection > 0 && gStorage->iconScrollCurColumn == IN_BOX_COLUMNS - 1)
            || (gStorage->iconScrollDirection < 0 && gStorage->iconScrollCurColumn == 0))
        {
            // Scroll has reached final column
            gStorage->iconScrollState++;
        }
        else
        {
            // Continue scrolling
            gStorage->iconScrollCurColumn += gStorage->iconScrollDirection;
            gStorage->iconScrollState = 0;
        }
        break;
    case 2:
        // Wait to make sure all icons have arrived
        if (gStorage->iconScrollNumIncoming == 0)
        {
            gStorage->iconScrollDistance++;
            return FALSE;
        }
        break;
    default:
        return FALSE;
    }

    return TRUE;
}

static void SetBoxSpeciesAndPersonalities(u8 boxId)
{
    s32 i, j, boxPosition;

    boxPosition = 0;
    for (i = 0; i < IN_BOX_ROWS; i++)
    {
        for (j = 0; j < IN_BOX_COLUMNS; j++)
        {
            gStorage->boxSpecies[boxPosition] = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_SPECIES_OR_EGG);
            if (gStorage->boxSpecies[boxPosition] != SPECIES_NONE)
                gStorage->boxPersonalities[boxPosition] = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_PERSONALITY);
            boxPosition++;
        }
    }

    gStorage->incomingBoxId = boxId;
}

void DestroyBoxMonIconAtPosition(u8 boxPosition)
{
    if (gStorage->boxMonsSprites[boxPosition] != NULL)
    {
        DestroyBoxMonIcon(gStorage->boxMonsSprites[boxPosition]);
        gStorage->boxMonsSprites[boxPosition] = NULL;
    }
}

void SetBoxMonIconObjMode(u8 boxPosition, u8 objMode)
{
    if (gStorage->boxMonsSprites[boxPosition] != NULL)
    {
        gStorage->boxMonsSprites[boxPosition]->oam.objMode = objMode;
    }
}

static void CreatePartyMonsSprites(bool8 visible)
{
    u16 i, count;
    u16 species = GetMonData(&gPlayerParty[0], MON_DATA_SPECIES_OR_EGG);
    u32 personality = GetMonData(&gPlayerParty[0], MON_DATA_PERSONALITY);

    gStorage->partySprites[0] = CreateMonIconSprite(species, personality, 104, 64, 1, 12);
    count = 1;
    for (i = 1; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG);
        if (species != SPECIES_NONE)
        {
            personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
            gStorage->partySprites[i] = CreateMonIconSprite(species, personality, 152,  8 * (3 * (i - 1)) + 16, 1, 12);
            count++;
        }
        else
            gStorage->partySprites[i] = NULL;
    }

    if (!visible)
    {
        for (i = 0; i < count; i++)
        {
            gStorage->partySprites[i]->y -= 160;
            gStorage->partySprites[i]->invisible = TRUE;
        }
    }

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (gStorage->partySprites[i] != NULL && GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM) == 0)
                gStorage->partySprites[i]->oam.objMode = ST_OAM_OBJ_BLEND;
        }
    }
}

static void CompactPartySprites(void)
{
    u16 i, targetPartyId;

    gStorage->numPartySpritesToCompact = 0;
    for (i = 0, targetPartyId = 0; i < PARTY_SIZE; i++)
    {
        if (gStorage->partySprites[i] != NULL)
        {
            if (i != targetPartyId)
            {
                MovePartySpriteToNextSlot(gStorage->partySprites[i], targetPartyId);
                gStorage->partySprites[i] = NULL;
                gStorage->numPartySpritesToCompact++;
            }
            targetPartyId++;
        }
    }
}

static u8 GetNumPartySpritesCompacting(void)
{
    return gStorage->numPartySpritesToCompact;
}

#define sPartyId   data[1]
#define sMonX      data[2]
#define sMonY      data[3]
#define sSpeedX    data[4]
#define sSpeedY    data[5]
#define sMoveSteps data[6]

static void MovePartySpriteToNextSlot(struct Sprite *sprite, u16 partyId)
{
    s16 x, y;

    sprite->sPartyId = partyId;
    if (partyId == 0)
        x = 104, y = 64;
    else
        x = 152, y = 8 * (3 * (partyId - 1)) + 16;

    sprite->sMonX = (u16)(sprite->x) * 8;
    sprite->sMonY = (u16)(sprite->y) * 8;
    sprite->sSpeedX = ((x * 8) - sprite->sMonX) / 8;
    sprite->sSpeedY = ((y * 8) - sprite->sMonY) / 8;
    sprite->sMoveSteps = 8;
    sprite->callback = SpriteCB_MovePartySpriteToNextSlot;
}

static void SpriteCB_MovePartySpriteToNextSlot(struct Sprite *sprite)
{
    if (sprite->sMoveSteps != 0)
    {
        s16 x = sprite->sMonX += sprite->sSpeedX;
        s16 y = sprite->sMonY += sprite->sSpeedY;
        sprite->x = x / 8u;
        sprite->y = y / 8u;
        sprite->sMoveSteps--;
    }
    else
    {
        if (sprite->sPartyId == 0)
        {
            sprite->x = 104;
            sprite->y = 64;
        }
        else
        {
            sprite->x = 152;
            sprite->y = 8 * (3 * (sprite->sPartyId - 1)) + 16;
        }
        sprite->callback = SpriteCallbackDummy;
        gStorage->partySprites[sprite->sPartyId] = sprite;
        gStorage->numPartySpritesToCompact--;
    }
}

#undef sPartyId
#undef sMonX
#undef sMonY
#undef sSpeedX
#undef sSpeedY
#undef sMoveSteps

void DestroyMovingMonIcon(void)
{
    if (gStorage->movingMonSprite != NULL)
    {
        DestroyBoxMonIcon(gStorage->movingMonSprite);
        gStorage->movingMonSprite = NULL;
    }
}

static void MovePartySprites(s16 yDelta)
{
    u16 i, posY;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (gStorage->partySprites[i] != NULL)
        {
            gStorage->partySprites[i]->y += yDelta;
            posY = gStorage->partySprites[i]->y + gStorage->partySprites[i]->y2 + gStorage->partySprites[i]->centerToCornerVecY;
            posY += 16;
            if (posY > 192)
                gStorage->partySprites[i]->invisible = TRUE;
            else
                gStorage->partySprites[i]->invisible = FALSE;
        }
    }
}

void DestroyPartyMonIcon(u8 partyId)
{
    if (gStorage->partySprites[partyId] != NULL)
    {
        DestroyBoxMonIcon(gStorage->partySprites[partyId]);
        gStorage->partySprites[partyId] = NULL;
    }
}

static void DestroyAllPartyMonIcons(void)
{
    u16 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (gStorage->partySprites[i] != NULL)
        {
            DestroyBoxMonIcon(gStorage->partySprites[i]);
            gStorage->partySprites[i] = NULL;
        }
    }
}

void SetPartyMonIconObjMode(u8 partyId, u8 objMode)
{
    if (gStorage->partySprites[partyId] != NULL)
        gStorage->partySprites[partyId]->oam.objMode = objMode;
}

void SetMovingMonSprite(u8 mode, u8 id)
{
    if (mode == MODE_PARTY)
    {
        gStorage->movingMonSprite = gStorage->partySprites[id];
        gStorage->partySprites[id] = NULL;
    }
    else if (mode == MODE_BOX)
    {
        gStorage->movingMonSprite = gStorage->boxMonsSprites[id];
        gStorage->boxMonsSprites[id] = NULL;
    }
    else
        return;

    gStorage->movingMonSprite->callback = SpriteCB_HeldMon;
    gStorage->movingMonSprite->oam.priority = GetMonIconPriorityByCursorArea();
    gStorage->movingMonSprite->subpriority = 7;
}

void SetPlacedMonSprite(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT) // party mon
    {
        gStorage->partySprites[position] = gStorage->movingMonSprite;
        gStorage->partySprites[position]->oam.priority = 1;
        gStorage->partySprites[position]->subpriority = 12;
    }
    else
    {
        gStorage->boxMonsSprites[position] = gStorage->movingMonSprite;
        gStorage->boxMonsSprites[position]->oam.priority = 2;
        gStorage->boxMonsSprites[position]->subpriority = 19 - (position % IN_BOX_COLUMNS);
    }
    gStorage->movingMonSprite->callback = SpriteCallbackDummy;
    gStorage->movingMonSprite = NULL;
}

void SetShiftMonSpritePtr(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT) // party mon
        gStorage->shiftMonSpritePtr = &gStorage->partySprites[position];
    else
        gStorage->shiftMonSpritePtr = &gStorage->boxMonsSprites[position];

    gStorage->movingMonSprite->callback = SpriteCallbackDummy;
    gStorage->shiftTimer = 0;
}

bool8 ShiftMons(void)
{
    if (gStorage->shiftTimer == 16)
        return FALSE;

    gStorage->shiftTimer++;
    if (gStorage->shiftTimer & 1)
    {
        (*gStorage->shiftMonSpritePtr)->y--;
        gStorage->movingMonSprite->y++;
    }

    (*gStorage->shiftMonSpritePtr)->x2 = gSineTable[gStorage->shiftTimer * 8] / 16;
    gStorage->movingMonSprite->x2 = -(gSineTable[gStorage->shiftTimer * 8] / 16);
    if (gStorage->shiftTimer == 8)
    {
        gStorage->movingMonSprite->oam.priority = (*gStorage->shiftMonSpritePtr)->oam.priority;
        gStorage->movingMonSprite->subpriority = (*gStorage->shiftMonSpritePtr)->subpriority;
        (*gStorage->shiftMonSpritePtr)->oam.priority = GetMonIconPriorityByCursorArea();
        (*gStorage->shiftMonSpritePtr)->subpriority = 7;
    }

    if (gStorage->shiftTimer == 16)
    {
        struct Sprite *sprite = gStorage->movingMonSprite;
        gStorage->movingMonSprite = (*gStorage->shiftMonSpritePtr);
        *gStorage->shiftMonSpritePtr = sprite;

        gStorage->movingMonSprite->callback = SpriteCB_HeldMon;
        (*gStorage->shiftMonSpritePtr)->callback = SpriteCallbackDummy;
    }

    return TRUE;
}

void DoReleaseMonAnim(u8 mode, u8 position)
{
    switch (mode)
    {
    case MODE_PARTY:
        gStorage->releaseMonSpritePtr = &gStorage->partySprites[position];
        break;
    case MODE_BOX:
        gStorage->releaseMonSpritePtr = &gStorage->boxMonsSprites[position];
        break;
    case MODE_MOVE:
        gStorage->releaseMonSpritePtr = &gStorage->movingMonSprite;
        break;
    default:
        return;
    }

    if (*gStorage->releaseMonSpritePtr != NULL)
    {
        InitSpriteAffineAnim(*gStorage->releaseMonSpritePtr);
        (*gStorage->releaseMonSpritePtr)->oam.affineMode = ST_OAM_AFFINE_NORMAL;
        (*gStorage->releaseMonSpritePtr)->affineAnims = sAffineAnims_ReleaseMon;
        StartSpriteAffineAnim(*gStorage->releaseMonSpritePtr, RELEASE_ANIM_RELEASE);
    }
}

bool8 TryHideReleaseMonSprite(void)
{
    if (*gStorage->releaseMonSpritePtr == NULL || (*gStorage->releaseMonSpritePtr)->invisible)
        return FALSE;

    if ((*gStorage->releaseMonSpritePtr)->affineAnimEnded)
        (*gStorage->releaseMonSpritePtr)->invisible = TRUE;

    return TRUE;
}

void DestroyReleaseMonIcon(void)
{
    if (*gStorage->releaseMonSpritePtr != NULL)
    {
        FreeOamMatrix((*gStorage->releaseMonSpritePtr)->oam.matrixNum);
        DestroyBoxMonIcon(*gStorage->releaseMonSpritePtr);
        *gStorage->releaseMonSpritePtr = NULL;
    }
}

static void DoReleaseMonComeBackAnim(void)
{
    if (*gStorage->releaseMonSpritePtr != NULL)
    {
        (*gStorage->releaseMonSpritePtr)->invisible = FALSE;
        StartSpriteAffineAnim(*gStorage->releaseMonSpritePtr, RELEASE_ANIM_COME_BACK);
    }
}

static bool8 ResetReleaseMonSpritePtr(void)
{
    if (gStorage->releaseMonSpritePtr == NULL)
        return FALSE;

    if ((*gStorage->releaseMonSpritePtr)->affineAnimEnded)
        gStorage->releaseMonSpritePtr = NULL;

    return TRUE;
}

static void SetMovingMonPriority(u8 priority)
{
    gStorage->movingMonSprite->oam.priority = priority;
}

static void SpriteCB_HeldMon(struct Sprite *sprite)
{
    sprite->x = gStorage->cursorSprite->x;
    sprite->y = gStorage->cursorSprite->y + gStorage->cursorSprite->y2 + 4;
}

static u16 TryLoadMonIconTiles(u16 species, u32 personality)
{
    u16 i, offset;

#if P_GENDER_DIFFERENCES
    // Treat female mons as a seperate species as they may have a different icon than males
    if (gSpeciesInfo[species].iconSpriteFemale != NULL && IsPersonalityFemale(species, personality))
        species |= (1 << 15);
#endif

    // Find the currently-allocated slot
    for (i = 0; i < MAX_MON_ICONS; i++)
    {
        if (gStorage->iconSpeciesList[i] == species)
            break;
    }

    if (i == MAX_MON_ICONS)
    {
        // Find the first empty slot
        for (i = 0; i < MAX_MON_ICONS; i++)
        {
            if (gStorage->iconSpeciesList[i] == SPECIES_NONE)
                break;
        }
        if (i == MAX_MON_ICONS)
            return 0xFFFF;
    }

    gStorage->iconSpeciesList[i] = species;
    gStorage->numIconsPerSpecies[i]++;
    offset = 16 * i;
    species &= GENDER_MASK;
    CpuCopy32(GetMonIconTiles(species, personality), (void *)(OBJ_VRAM0) + offset * TILE_SIZE_4BPP, 0x200);

    return offset;
}

static void RemoveSpeciesFromIconList(u16 species)
{
    u16 i;
    bool8 hasFemale = FALSE;

    for (i = 0; i < MAX_MON_ICONS; i++)
    {
        if (gStorage->iconSpeciesList[i] == (species | 0x8000))
        {
            hasFemale = TRUE;
            break;
        }
    }

    for (i = 0; i < MAX_MON_ICONS; i++)
    {
        if (gStorage->iconSpeciesList[i] == species && !hasFemale)
        {
            if (--gStorage->numIconsPerSpecies[i] == 0)
                gStorage->iconSpeciesList[i] = SPECIES_NONE;
            break;
        }
    }
}

static struct Sprite *CreateMonIconSprite(u16 species, u32 personality, s16 x, s16 y, u8 oamPriority, u8 subpriority)
{
    u16 tileNum;
    u8 spriteId;
    struct SpriteTemplate template = sSpriteTemplate_MonIcon;

    species = GetIconSpecies(species, personality);
#if P_GENDER_DIFFERENCES
    if (gSpeciesInfo[species].iconSpriteFemale != NULL && IsPersonalityFemale(species, personality))
    {
        template.paletteTag = PALTAG_MON_ICON_0 + gSpeciesInfo[species].iconPalIndexFemale;
    }
    else
#endif
    {
        template.paletteTag = PALTAG_MON_ICON_0 + gSpeciesInfo[species].iconPalIndex;
    }

    tileNum = TryLoadMonIconTiles(species, personality);
    if (tileNum == 0xFFFF)
        return NULL;

    spriteId = CreateSprite(&template, x, y, subpriority);
    if (spriteId == MAX_SPRITES)
    {
        RemoveSpeciesFromIconList(species);
        return NULL;
    }

    gSprites[spriteId].oam.tileNum = tileNum;
    gSprites[spriteId].oam.priority = oamPriority;
    gSprites[spriteId].data[0] = species;
    return &gSprites[spriteId];
}

static void DestroyBoxMonIcon(struct Sprite *sprite)
{
    RemoveSpeciesFromIconList(sprite->data[0]);
    DestroySprite(sprite);
}

#define tState  data[0]
#define tDmaIdx data[1]
#define tBoxId  data[2]

static void CreateInitBoxTask(u8 boxId)
{
    u8 taskId = CreateTask(Task_InitBox, 2);

    gTasks[taskId].tBoxId = boxId;
}

static bool8 IsInitBoxActive(void)
{
    return FuncIsActiveTask(Task_InitBox);
}

static void Task_InitBox(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        gStorage->wallpaperOffset = 0;
        gStorage->bg2_X = 0;
        task->tDmaIdx = RequestDma3Fill(0, gStorage->wallpaperBgTilemapBuffer, sizeof(gStorage->wallpaperBgTilemapBuffer), DMA3_32BIT);
        break;
    case 1:
        if (WaitDma3Request(task->tDmaIdx) == -1)
            return;

        SetBgTilemapBuffer(2, gStorage->wallpaperBgTilemapBuffer);
        ShowBg(2);
        break;
    case 2:
        LoadWallpaperGfx(task->tBoxId, 0);
        break;
    case 3:
        if (!WaitForWallpaperGfxLoad())
            return;

        InitBoxTitle(task->tBoxId);
        CreateBoxScrollArrows();
        InitBoxMonSprites(task->tBoxId);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(27) | BGCNT_TXT512x256);
        break;
    case 4:
        DestroyTask(taskId);
        break;
    default:
        task->tState = 0;
        return;
    }

    task->tState++;
}

#undef tState
#undef tDmaIdx
#undef tBoxId

static void SetUpScrollToBox(u8 boxId)
{
    s8 direction = DetermineBoxScrollDirection(boxId);

    gStorage->scrollSpeed = (direction > 0) ? 6 : -6;
    gStorage->scrollUnused1 = (direction > 0) ? 1 : 2;
    gStorage->scrollTimer = 32;
    gStorage->scrollToBoxIdUnused = boxId;
    gStorage->scrollUnused2 = (direction <= 0) ? 5 : 0;
    gStorage->scrollDirectionUnused = direction;
    gStorage->scrollUnused3 = (direction > 0) ? 264 : 56;
    gStorage->scrollUnused4 = (direction <= 0) ? 5 : 0;
    gStorage->scrollUnused5 = 0;
    gStorage->scrollUnused6 = 2;
    gStorage->scrollToBoxId = boxId;
    gStorage->scrollDirection = direction;
    gStorage->scrollState = 0;
}

static bool8 ScrollToBox(void)
{
    bool8 isStillScrolling;

    switch (gStorage->scrollState)
    {
    case 0:
        LoadWallpaperGfx(gStorage->scrollToBoxId, gStorage->scrollDirection);
        gStorage->scrollState++;
    case 1:
        if (!WaitForWallpaperGfxLoad())
            return TRUE;

        InitBoxMonIconScroll(gStorage->scrollToBoxId, gStorage->scrollDirection);
        CreateIncomingBoxTitle(gStorage->scrollToBoxId, gStorage->scrollDirection);
        StartBoxScrollArrowsSlide(gStorage->scrollDirection);
        break;
    case 2:
        isStillScrolling = UpdateBoxMonIconScroll();
        if (gStorage->scrollTimer != 0)
        {
            gStorage->bg2_X += gStorage->scrollSpeed;
            if (--gStorage->scrollTimer != 0)
                return TRUE;
            CycleBoxTitleSprites();
            StopBoxScrollArrowsSlide();
        }
        return isStillScrolling;
    }

    gStorage->scrollState++;
    return TRUE;
}

static s8 DetermineBoxScrollDirection(u8 boxId)
{
    u8 i;
    u8 currentBox = StorageGetCurrentBox();

    for (i = 0; currentBox != boxId; i++)
    {
        currentBox++;
        if (currentBox >= TOTAL_BOXES_COUNT)
            currentBox = 0;
    }

    return (i < TOTAL_BOXES_COUNT / 2) ? 1 : -1;
}

static void SetWallpaperForCurrentBox(u8 wallpaperId)
{
    SetBoxWallpaper(StorageGetCurrentBox(), wallpaperId);
    gStorage->wallpaperChangeState = 0;
}

static bool8 DoWallpaperGfxChange(void)
{
    switch (gStorage->wallpaperChangeState)
    {
    case 0:
        BeginNormalPaletteFade(gStorage->wallpaperPalBits, 1, 0, 16, RGB_WHITEALPHA);
        gStorage->wallpaperChangeState++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            u8 curBox = StorageGetCurrentBox();
            LoadWallpaperGfx(curBox, 0);
            gStorage->wallpaperChangeState++;
        }
        break;
    case 2:
        if (WaitForWallpaperGfxLoad() == TRUE)
        {
            CycleBoxTitleColor();
            BeginNormalPaletteFade(gStorage->wallpaperPalBits, 1, 16, 0, RGB_WHITEALPHA);
            gStorage->wallpaperChangeState++;
        }
        break;
    case 3:
        if (!UpdatePaletteFade())
            gStorage->wallpaperChangeState++;
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

static void LoadWallpaperGfx(u8 boxId, s8 direction)
{
    u8 wallpaperId;
    const struct Wallpaper *wallpaper;

    gStorage->wallpaperLoadState = 0;
    gStorage->wallpaperLoadBoxId = boxId;
    gStorage->wallpaperLoadDir = direction;
    if (gStorage->wallpaperLoadDir != 0)
    {
        gStorage->wallpaperOffset = !gStorage->wallpaperOffset;
        TrimOldWallpaper(gStorage->wallpaperBgTilemapBuffer);
    }

    wallpaperId = GetBoxWallpaper(gStorage->wallpaperLoadBoxId);
    wallpaper = &sWallpapers[wallpaperId];
    LZ77UnCompWram(wallpaper->tileMap, gStorage->wallpaperTilemap);
    DrawWallpaper(gStorage->wallpaperBgTilemapBuffer, gStorage->wallpaperTilemap, gStorage->wallpaperLoadDir, gStorage->wallpaperOffset);

    if (gStorage->wallpaperLoadDir != 0)
        LoadPalette(wallpaper->palettes, BG_PLTT_ID(4) + BG_PLTT_ID(gStorage->wallpaperOffset * 2), 2 * PLTT_SIZE_4BPP);
    else
        CpuCopy16(wallpaper->palettes, &gPlttBufferUnfaded[BG_PLTT_ID(4) + BG_PLTT_ID(gStorage->wallpaperOffset * 2)], 2 * PLTT_SIZE_4BPP);

    DecompressAndLoadBgGfxUsingHeap(2, wallpaper->tiles, 0, 256 * gStorage->wallpaperOffset, 0);

    CopyBgTilemapBufferToVram(2);
}

static bool32 WaitForWallpaperGfxLoad(void)
{
    if (IsDma3ManagerBusyWithBgCopy() == TRUE)
        return FALSE;

    return TRUE;
}

static void DrawWallpaper(void *unused, const void *tilemap, s8 direction, u8 offset)
{
    s16 paletteNum = (offset * 2) + 3;
    s16 x = ((gStorage->bg2_X / 8 + 10) + (direction * 24)) & 0x3F;

    CopyRectToBgTilemapBufferRect(2, tilemap, 0, 0, 20, 18, x, 2, 20, 18, 17, offset << 8, paletteNum);

    if (direction == 0)
        return;
    else if (direction > 0)
        x *= 1, x += 20; // x * 1 is needed to match
    else
        x -= 4;

    FillBgTilemapBufferRect(2, 0, x, 2, 4, 18, 17);
}

static void TrimOldWallpaper(void *tilemapBuffer)
{
    u16 i;
    u16 *dest = tilemapBuffer;
    s16 right = ((gStorage->bg2_X / 8 + 10) + 20) & 0x3F;

    if (right < 32)
        dest += right + 0x260;
    else
        dest += right + 0x640;

    for (i = 0; i < 44; i++)
    {
        *dest++ = 0;
        right = (right + 1) & 0x3F;
        if (right == 0)
            dest -= 0x420;
        if (right == 32)
            dest += 0x3e0;
    }
}

static void InitBoxTitle(u8 boxId)
{
    u8 tagIndex;
    s16 x;
    u16 i;

    struct SpriteSheet spriteSheet = {gStorage->boxTitleTiles, 0x200, GFXTAG_BOX_TITLE};
    struct SpritePalette palettes[] = {
        {gStorage->boxTitlePal, PALTAG_BOX_TITLE},
        {}
    };

    u16 wallpaperId = GetBoxWallpaper(boxId);

    gStorage->boxTitlePal[14] = sBoxTitleColors[wallpaperId][0];
    gStorage->boxTitlePal[15] = sBoxTitleColors[wallpaperId][1];
    LoadSpritePalettes(palettes);
    gStorage->wallpaperPalBits = 0x3F0;

    tagIndex = IndexOfSpritePaletteTag(PALTAG_BOX_TITLE);
    gStorage->boxTitlePalOffset = OBJ_PLTT_ID(tagIndex) + 14;
    gStorage->wallpaperPalBits |= (1 << 16) << tagIndex;

    tagIndex = IndexOfSpritePaletteTag(PALTAG_BOX_TITLE);
    gStorage->boxTitleAltPalOffset = OBJ_PLTT_ID(tagIndex) + 14;
    gStorage->wallpaperPalBits |= (1 << 16) << tagIndex;

    StringCopyPadded(gStorage->boxTitleText, GetBoxNamePtr(boxId), 0, 8);
    DrawTextWindowAndBufferTiles(gStorage->boxTitleText, gStorage->boxTitleTiles, 0, 0, gStorage->boxTitleUnused, 2);
    LoadSpriteSheet(&spriteSheet);
    x = GetBoxTitleBaseX(GetBoxNamePtr(boxId));

    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&sSpriteTemplate_BoxTitle, x + i * 32, 28, 24);
        gStorage->curBoxTitleSprites[i] = &gSprites[spriteId];
        StartSpriteAnim(gStorage->curBoxTitleSprites[i], i);
    }
    gStorage->boxTitleCycleId = 0;
}

static void CreateIncomingBoxTitle(u8 boxId, s8 direction)
{
    u16 palOffset;
    s16 x, adjustedX;
    u16 i;
    struct SpriteSheet spriteSheet = {gStorage->boxTitleTiles, 0x200, GFXTAG_BOX_TITLE};
    struct SpriteTemplate template = sSpriteTemplate_BoxTitle;

    gStorage->boxTitleCycleId = !gStorage->boxTitleCycleId;
    if (gStorage->boxTitleCycleId == 0)
    {
        spriteSheet.tag = GFXTAG_BOX_TITLE;
        palOffset = gStorage->boxTitlePalOffset;
    }
    else
    {
        spriteSheet.tag = GFXTAG_BOX_TITLE_ALT;
        palOffset = gStorage->boxTitlePalOffset;
        template.tileTag = GFXTAG_BOX_TITLE_ALT;
        template.paletteTag = PALTAG_BOX_TITLE;
    }

    StringCopyPadded(gStorage->boxTitleText, GetBoxNamePtr(boxId), 0, BOX_NAME_LENGTH);
    DrawTextWindowAndBufferTiles(gStorage->boxTitleText, gStorage->boxTitleTiles, 0, 0, gStorage->boxTitleUnused, 2);
    LoadSpriteSheet(&spriteSheet);
    LoadPalette(sBoxTitleColors[GetBoxWallpaper(boxId)], palOffset, sizeof(sBoxTitleColors[0]));
    x = GetBoxTitleBaseX(GetBoxNamePtr(boxId));
    adjustedX = x;
    adjustedX += direction * 192;

    // Title is split across two sprites
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&template, i * 32 + adjustedX, 28, 24);

        gStorage->nextBoxTitleSprites[i] = &gSprites[spriteId];
        gStorage->nextBoxTitleSprites[i]->data[0] = (-direction) * 6;
        gStorage->nextBoxTitleSprites[i]->data[1] = i * 32 + x;
        gStorage->nextBoxTitleSprites[i]->data[2] = 0;
        gStorage->nextBoxTitleSprites[i]->callback = SpriteCB_IncomingBoxTitle;
        StartSpriteAnim(gStorage->nextBoxTitleSprites[i], i);

        gStorage->curBoxTitleSprites[i]->data[0] = (-direction) * 6;
        gStorage->curBoxTitleSprites[i]->data[1] = 1;
        gStorage->curBoxTitleSprites[i]->callback = SpriteCB_OutgoingBoxTitle;
    }
}

static void CycleBoxTitleSprites(void)
{
    if (gStorage->boxTitleCycleId == 0)
        FreeSpriteTilesByTag(GFXTAG_BOX_TITLE_ALT);
    else
        FreeSpriteTilesByTag(GFXTAG_BOX_TITLE);

    gStorage->curBoxTitleSprites[0] = gStorage->nextBoxTitleSprites[0];
    gStorage->curBoxTitleSprites[1] = gStorage->nextBoxTitleSprites[1];
}

static void SpriteCB_IncomingBoxTitle(struct Sprite *sprite)
{
    if (sprite->data[2] != 0)
        sprite->data[2]--;
    else if ((sprite->x += sprite->data[0]) == sprite->data[1])
        sprite->callback = SpriteCallbackDummy;
}

static void SpriteCB_OutgoingBoxTitle(struct Sprite *sprite)
{
    if (sprite->data[1] != 0)
        sprite->data[1]--;
    else
    {
        sprite->x += sprite->data[0];
        sprite->data[2] = sprite->x + sprite->x2;
        if (sprite->data[2] < 0x40 || sprite->data[2] > 0x100)
            DestroySprite(sprite);
    }
}

static void CycleBoxTitleColor(void)
{
    u8 boxId = StorageGetCurrentBox();
    u8 wallpaperId = GetBoxWallpaper(boxId);
    if (gStorage->boxTitleCycleId == 0)
        CpuCopy16(sBoxTitleColors[wallpaperId], &gPlttBufferUnfaded[gStorage->boxTitlePalOffset], PLTT_SIZEOF(2));
    else
        CpuCopy16(sBoxTitleColors[wallpaperId], &gPlttBufferUnfaded[gStorage->boxTitleAltPalOffset], PLTT_SIZEOF(2));
}

static s16 GetBoxTitleBaseX(const u8 *string)
{
    return DISPLAY_WIDTH - 64 - GetStringWidth(FONT_NORMAL_COPY_1, string, 0) / 2;
}

// Sprite data for box scroll arrows
#define sState data[0]
#define sTimer data[1]
#define sSpeed data[3]

static void CreateBoxScrollArrows(void)
{
    u16 i;

    LoadSpriteSheet(&sSpriteSheet_BoxScrollArrow);
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&sSpriteTemplate_BoxScrollArrow, 92 + i * 136, 28, 22);
        if (spriteId != MAX_SPRITES)
        {
            struct Sprite *sprite = &gSprites[spriteId];
            StartSpriteAnim(sprite, i);
            sprite->sSpeed = (i == 0) ? -1 : 1;
            gStorage->arrowSprites[i] = sprite;
        }
    }
    if (IsCursorOnBoxTitle())
        AnimateBoxScrollArrows(TRUE);
}

// Slide box scroll arrows horizontally for box change
static void StartBoxScrollArrowsSlide(s8 direction)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        gStorage->arrowSprites[i]->x2 = 0;
        gStorage->arrowSprites[i]->sState = 2;
    }
    if (direction < 0)
    {
        gStorage->arrowSprites[0]->sTimer = 29;
        gStorage->arrowSprites[1]->sTimer = 5;
        gStorage->arrowSprites[0]->data[2] = 72;
        gStorage->arrowSprites[1]->data[2] = 72;
    }
    else
    {
        gStorage->arrowSprites[0]->sTimer = 5;
        gStorage->arrowSprites[1]->sTimer = 29;
        gStorage->arrowSprites[0]->data[2] = DISPLAY_WIDTH + 8;
        gStorage->arrowSprites[1]->data[2] = DISPLAY_WIDTH + 8;
    }
    gStorage->arrowSprites[0]->data[7] = 0;
    gStorage->arrowSprites[1]->data[7] = 1;
}

// New box's scroll arrows have entered, stop sliding and set their position
static void StopBoxScrollArrowsSlide(void)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        gStorage->arrowSprites[i]->x = 136 * i + 92;
        gStorage->arrowSprites[i]->x2 = 0;
        gStorage->arrowSprites[i]->invisible = FALSE;
    }
    AnimateBoxScrollArrows(TRUE);
}

// Bounce scroll arrows while title is selected
static void AnimateBoxScrollArrows(bool8 animate)
{
    u16 i;

    if (animate)
    {
        // Start arrows moving
        for (i = 0; i < 2; i++)
        {
            gStorage->arrowSprites[i]->sState = 1;
            gStorage->arrowSprites[i]->sTimer = 0;
            gStorage->arrowSprites[i]->data[2] = 0;
            gStorage->arrowSprites[i]->data[4] = 0;
        }
    }
    else
    {
        // Stop arrows moving
        for (i = 0; i < 2; i++)
            gStorage->arrowSprites[i]->sState = 0;
    }
}

static void SpriteCB_BoxScrollArrow(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->x2 = 0;
        break;
    case 1:
        if (++sprite->sTimer > 3)
        {
            sprite->sTimer = 0;
            sprite->x2 += sprite->sSpeed;
            if (++sprite->data[2] > 5)
            {
                sprite->data[2] = 0;
                sprite->x2 = 0;
            }
        }
        break;
    case 2:
        sprite->sState = 3;
        break;
    case 3:
        sprite->x -= gStorage->scrollSpeed;
        if (sprite->x <= 72 || sprite->x >= DISPLAY_WIDTH + 8)
            sprite->invisible = TRUE;
        if (--sprite->sTimer == 0)
        {
            sprite->x = sprite->data[2];
            sprite->invisible = FALSE;
            sprite->sState = 4;
        }
        break;
    case 4:
        sprite->x -= gStorage->scrollSpeed;
        break;
    }
}

#undef sState
#undef sTimer
#undef sSpeed

// Arrows for Deposit/Jump Box selection
static struct Sprite *CreateChooseBoxArrows(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_BoxScrollArrow, x, y, subpriority);
    if (spriteId == MAX_SPRITES)
        return NULL;

    animId %= 2;
    StartSpriteAnim(&gSprites[spriteId], animId);
    gSprites[spriteId].oam.priority = priority;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    return &gSprites[spriteId];
}


//------------------------------------------------------------------------------
//  SECTION: Cursor movement
//
//  The functions below generally handle the cursor's movement, including
//  moving around the box and picking up/putting down Pokémon.
//------------------------------------------------------------------------------

static void InitCursor(void)
{
    if (gStorage->boxOption != OPTION_DEPOSIT)
        sCursorArea = CURSOR_AREA_IN_BOX;
    else
        sCursorArea = CURSOR_AREA_IN_PARTY;

    sCursorPosition = 0;
    sIsMonBeingMoved = FALSE;
    sMovingMonOrigBoxId = 0;
    sMovingMonOrigBoxPos = 0;
    sInMultiMoveMode = FALSE;
    ClearSavedCursorPos();
    CreateCursorSprites();
    gStorage->cursorPrevPartyPos = 1;
    gStorage->inBoxMovingMode = MOVE_MODE_NORMAL;
    TrySetDisplayMonData();
}

static void InitCursorOnReopen(void)
{
    CreateCursorSprites();
    ReshowDisplayMon();
    gStorage->cursorPrevPartyPos = 1;
    gStorage->inBoxMovingMode = MOVE_MODE_NORMAL;
    if (sIsMonBeingMoved)
    {
        gStorage->movingMon = sMonBeingCarried;
        CreateMovingMonIcon();
    }
}

static void GetCursorCoordsByPos(u8 cursorArea, u8 cursorPosition, u16 *x, u16 *y)
{
    switch (cursorArea)
    {
    case CURSOR_AREA_IN_BOX:
        *x = (cursorPosition % IN_BOX_COLUMNS) * 24 + 100;
        *y = (cursorPosition / IN_BOX_COLUMNS) * 24 +  32;
        break;
    case CURSOR_AREA_IN_PARTY:
        if (cursorPosition == 0)
        {
            *x = 104;
            *y = 52;
        }
        else if (cursorPosition == PARTY_SIZE)
        {
            *x = 152;
            *y = 132;
        }
        else
        {
            *x = 152;
            *y = (cursorPosition - 1) * 24 + 4;
        }
        break;
    case CURSOR_AREA_BOX_TITLE:
        *x = 162;
        *y = 12;
        break;
    case CURSOR_AREA_BUTTONS:
        *y = sIsMonBeingMoved ? 8 : 14;
        *x = cursorPosition * 88 + 120;
        break;
    case 4:
        *x = 160;
        *y = 96;
        break;
    }
}

static u16 GetSpeciesAtCursorPosition(void)
{
    switch (sCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        return GetMonData(&gPlayerParty[sCursorPosition], MON_DATA_SPECIES);
    case CURSOR_AREA_IN_BOX:
        return GetCurrentBoxMonData(sCursorPosition, MON_DATA_SPECIES);
    default:
        return SPECIES_NONE;
    }
}

static bool8 UpdateCursorPos(void)
{
    s16 tmp;

    if (gStorage->cursorMoveSteps == 0)
    {
        if (gStorage->boxOption != OPTION_MOVE_ITEMS)
            return FALSE;
        else
            return IsItemIconAnimActive();
    }
    else if (--gStorage->cursorMoveSteps != 0)
    {
        // Update position toward target
        gStorage->cursorNewX += gStorage->cursorSpeedX;
        gStorage->cursorNewY += gStorage->cursorSpeedY;
        gStorage->cursorSprite->x = gStorage->cursorNewX >> 8;
        gStorage->cursorSprite->y = gStorage->cursorNewY >> 8;

        // Limit cursor on right
        if (gStorage->cursorSprite->x > DISPLAY_WIDTH + 16)
        {
            tmp = gStorage->cursorSprite->x - (DISPLAY_WIDTH + 16);
            gStorage->cursorSprite->x = tmp + 64;
        }

        // Limit cursor on left
        if (gStorage->cursorSprite->x < 64)
        {
            tmp = 64 - gStorage->cursorSprite->x;
            gStorage->cursorSprite->x = DISPLAY_WIDTH + 16 - tmp;
        }

        // Limit cursor on bottom
        if (gStorage->cursorSprite->y > DISPLAY_HEIGHT + 16)
        {
            tmp = gStorage->cursorSprite->y - (DISPLAY_HEIGHT + 16);
            gStorage->cursorSprite->y = tmp - 16;
        }

        // Limit cursor on top
        if (gStorage->cursorSprite->y < -16)
        {
            tmp = -16 - gStorage->cursorSprite->y;
            gStorage->cursorSprite->y = DISPLAY_HEIGHT + 16 - tmp;
        }

        // Cursor flips vertically when moving on/off the top buttons
        if (gStorage->cursorFlipTimer && --gStorage->cursorFlipTimer == 0)
            gStorage->cursorSprite->vFlip = (gStorage->cursorSprite->vFlip == FALSE);
    }
    else
    {
        // Time is up for cursor movement, make sure it's exactly at target
        gStorage->cursorSprite->x = gStorage->cursorTargetX;
        gStorage->cursorSprite->y = gStorage->cursorTargetY;
        DoCursorNewPosUpdate();
    }

    return TRUE;
}

static void InitNewCursorPos(u8 newCursorArea, u8 newCursorPosition)
{
    u16 x = 0, y = 0;

    GetCursorCoordsByPos(newCursorArea, newCursorPosition, &x, &y);
    gStorage->newCursorArea = newCursorArea;
    gStorage->newCursorPosition = newCursorPosition;
    gStorage->cursorTargetX = x;
    gStorage->cursorTargetY = y;
}

static void InitCursorMove(void)
{
    int yDistance, xDistance;

    if (gStorage->cursorVerticalWrap != 0 || gStorage->cursorHorizontalWrap != 0)
        gStorage->cursorMoveSteps = 12;
    else
        gStorage->cursorMoveSteps = 6;

    if (gStorage->cursorFlipTimer)
        gStorage->cursorFlipTimer = gStorage->cursorMoveSteps / 2;

    switch (gStorage->cursorVerticalWrap)
    {
    default:
        yDistance = gStorage->cursorTargetY - gStorage->cursorSprite->y;
        break;
    case -1:
        yDistance = gStorage->cursorTargetY - 192 - gStorage->cursorSprite->y;
        break;
    case 1:
        yDistance = gStorage->cursorTargetY + 192 - gStorage->cursorSprite->y;
        break;
    }

    switch (gStorage->cursorHorizontalWrap)
    {
    default:
        xDistance = gStorage->cursorTargetX - gStorage->cursorSprite->x;
        break;
    case -1:
        xDistance = gStorage->cursorTargetX - 192 - gStorage->cursorSprite->x;
        break;
    case 1:
        xDistance = gStorage->cursorTargetX + 192 - gStorage->cursorSprite->x;
        break;
    }

    yDistance <<= 8;
    xDistance <<= 8;
    gStorage->cursorSpeedX = xDistance / gStorage->cursorMoveSteps;
    gStorage->cursorSpeedY = yDistance / gStorage->cursorMoveSteps;
    gStorage->cursorNewX = gStorage->cursorSprite->x << 8;
    gStorage->cursorNewY = gStorage->cursorSprite->y << 8;
}

static void SetCursorPosition(u8 newCursorArea, u8 newCursorPosition)
{
    InitNewCursorPos(newCursorArea, newCursorPosition);
    InitCursorMove();
    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
    {
        if (gStorage->inBoxMovingMode == MOVE_MODE_NORMAL && !sIsMonBeingMoved)
            StartSpriteAnim(gStorage->cursorSprite, 1);
    }
    else
    {
        if (!IsActiveItemMoving())
            StartSpriteAnim(gStorage->cursorSprite, 1);
    }

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        if (sCursorArea == CURSOR_AREA_IN_BOX)
            TryHideItemIconAtPos(CURSOR_AREA_IN_BOX, sCursorPosition);
        else if (sCursorArea == CURSOR_AREA_IN_PARTY)
            TryHideItemIconAtPos(CURSOR_AREA_IN_PARTY, sCursorPosition);

        if (newCursorArea == CURSOR_AREA_IN_BOX)
            TryLoadItemIconAtPos(newCursorArea, newCursorPosition);
        else if (newCursorArea == CURSOR_AREA_IN_PARTY)
            TryLoadItemIconAtPos(newCursorArea, newCursorPosition);
    }

    if (newCursorArea == CURSOR_AREA_IN_PARTY && sCursorArea != CURSOR_AREA_IN_PARTY)
    {
        gStorage->cursorPrevPartyPos = 1;
        gStorage->cursorShadowSprite->invisible = TRUE;
    }

    switch (newCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
    case CURSOR_AREA_BOX_TITLE:
    case CURSOR_AREA_BUTTONS:
        gStorage->cursorSprite->oam.priority = 1;
        gStorage->cursorShadowSprite->invisible = TRUE;
        gStorage->cursorShadowSprite->oam.priority = 1;
        break;
    case CURSOR_AREA_IN_BOX:
        if (gStorage->inBoxMovingMode != MOVE_MODE_NORMAL)
        {
            gStorage->cursorSprite->oam.priority = 0;
            gStorage->cursorShadowSprite->invisible = TRUE;
        }
        else
        {
            gStorage->cursorSprite->oam.priority = 2;
            if (sCursorArea == CURSOR_AREA_IN_BOX && sIsMonBeingMoved)
                SetMovingMonPriority(2);
        }
        break;
    }
}

static void DoCursorNewPosUpdate(void)
{
    sCursorArea = gStorage->newCursorArea;
    sCursorPosition = gStorage->newCursorPosition;
    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
    {
        if (gStorage->inBoxMovingMode == MOVE_MODE_NORMAL && !sIsMonBeingMoved)
            StartSpriteAnim(gStorage->cursorSprite, 1);
    }
    else if (!IsActiveItemMoving())
        StartSpriteAnim(gStorage->cursorSprite, 1);

    TrySetDisplayMonData();
    switch (sCursorArea)
    {
    case CURSOR_AREA_BUTTONS:
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_BOX_TITLE:
        AnimateBoxScrollArrows(TRUE);
        break;
    case CURSOR_AREA_IN_PARTY:
        gStorage->cursorShadowSprite->subpriority = 13;
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_IN_BOX:
        if (gStorage->inBoxMovingMode == MOVE_MODE_NORMAL)
        {
            gStorage->cursorSprite->oam.priority = 1;
            gStorage->cursorShadowSprite->oam.priority = 2;
            gStorage->cursorShadowSprite->subpriority = 21;
            gStorage->cursorShadowSprite->invisible = FALSE;
            SetMovingMonPriority(2);
        }
        break;
    }
}

static void SetCursorInParty(void)
{
    u8 partyCount;

    if (!sIsMonBeingMoved)
        partyCount = 0;
    else
    {
        partyCount = CalculatePlayerPartyCount();
        if (partyCount >= PARTY_SIZE)
            partyCount = PARTY_SIZE - 1;
    }
    if (gStorage->cursorSprite->vFlip)
        gStorage->cursorFlipTimer = 1;
    SetCursorPosition(CURSOR_AREA_IN_PARTY, partyCount);
}

static void SetCursorBoxPosition(u8 cursorBoxPosition)
{
    SetCursorPosition(CURSOR_AREA_IN_BOX, cursorBoxPosition);
}

static void ClearSavedCursorPos(void)
{
    sSavedCursorPosition = 0;
}

static void SaveCursorPos(void)
{
    sSavedCursorPosition = sCursorPosition;
}

static u8 GetSavedCursorPos(void)
{
    return sSavedCursorPosition;
}

static void InitMonPlaceChange(u8 type)
{
    static bool8 (*const placeChangeFuncs[])(void) = {
        [CHANGE_GRAB]  = MonPlaceChange_Grab,
        [CHANGE_PLACE] = MonPlaceChange_Place,
        [CHANGE_SHIFT] = MonPlaceChange_Shift,
    };

    gStorage->monPlaceChangeFunc = placeChangeFuncs[type];
    gStorage->monPlaceChangeState = 0;
}

void InitMultiMonPlaceChange(bool8 moveCursorUp)
{
    if (!moveCursorUp)
        gStorage->monPlaceChangeFunc = MonPlaceChange_DoMoveCursorDown;
    else
        gStorage->monPlaceChangeFunc = MonPlaceChange_DoMoveCursorUp;

    gStorage->monPlaceChangeState = 0;
}

static bool8 DoMonPlaceChange(void)
{
    return gStorage->monPlaceChangeFunc();
}

static bool8 MonPlaceChange_Grab(void)
{
    switch (gStorage->monPlaceChangeState)
    {
    case 0:
        if (sIsMonBeingMoved)
            return FALSE;
        StartSpriteAnim(gStorage->cursorSprite, 2);
        gStorage->monPlaceChangeState++;
        break;
    case 1:
        if (!MonPlaceChange_MoveCursorDown())
        {
            StartSpriteAnim(gStorage->cursorSprite, 3);
            MoveMon();
            gStorage->monPlaceChangeState++;
        }
        break;
    case 2:
        if (!MonPlaceChange_MoveCursorUp())
            gStorage->monPlaceChangeState++;
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_Place(void)
{
    switch (gStorage->monPlaceChangeState)
    {
    case 0:
        if (!MonPlaceChange_MoveCursorDown())
        {
            StartSpriteAnim(gStorage->cursorSprite, 2);
            PlaceMon();
            gStorage->monPlaceChangeState++;
        }
        break;
    case 1:
        if (!MonPlaceChange_MoveCursorUp())
        {
            StartSpriteAnim(gStorage->cursorSprite, 0);
            gStorage->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_Shift(void)
{
    switch (gStorage->monPlaceChangeState)
    {
    case 0:
        switch (sCursorArea)
        {
        case CURSOR_AREA_IN_PARTY:
            gStorage->shiftBoxId = TOTAL_BOXES_COUNT;
            break;
        case CURSOR_AREA_IN_BOX:
            gStorage->shiftBoxId = StorageGetCurrentBox();
            break;
        default:
            return FALSE;
        }
        StartSpriteAnim(gStorage->cursorSprite, 2);
        SetShiftMonSpritePtr(gStorage->shiftBoxId, sCursorPosition);
        gStorage->monPlaceChangeState++;
        break;
    case 1:
        if (!ShiftMons())
        {
            StartSpriteAnim(gStorage->cursorSprite, 3);
            SetShiftedMonData(gStorage->shiftBoxId, sCursorPosition);
            gStorage->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_DoMoveCursorDown(void)
{
    return MonPlaceChange_MoveCursorDown();
}

static bool8 MonPlaceChange_DoMoveCursorUp(void)
{
    return MonPlaceChange_MoveCursorUp();
}

static bool8 MonPlaceChange_MoveCursorDown(void)
{
    switch (gStorage->cursorSprite->y2)
    {
    default:
        gStorage->cursorSprite->y2++;
        break;
    case 0:
        gStorage->cursorSprite->y2++;
        break;
    case 8: // Cursor has reached bottom
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_MoveCursorUp(void)
{
    switch (gStorage->cursorSprite->y2)
    {
    case 0: // Cursor has reached top
        return FALSE;
    default:
        gStorage->cursorSprite->y2--;
        break;
    }

    return TRUE;
}

static void MoveMon(void)
{
    switch (sCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        SetMovedMonData(TOTAL_BOXES_COUNT, sCursorPosition);
        SetMovingMonSprite(MODE_PARTY, sCursorPosition);
        break;
    case CURSOR_AREA_IN_BOX:
        if (gStorage->inBoxMovingMode == MOVE_MODE_NORMAL)
        {
            SetMovedMonData(StorageGetCurrentBox(), sCursorPosition);
            SetMovingMonSprite(MODE_BOX, sCursorPosition);
        }
        break;
    default:
        return;
    }

    sIsMonBeingMoved = TRUE;
}

static void PlaceMon(void)
{
    u8 boxId;

    switch (sCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        SetPlacedMonData(TOTAL_BOXES_COUNT, sCursorPosition);
        SetPlacedMonSprite(TOTAL_BOXES_COUNT, sCursorPosition);
        break;
    case CURSOR_AREA_IN_BOX:
        boxId = StorageGetCurrentBox();
        SetPlacedMonData(boxId, sCursorPosition);
        SetPlacedMonSprite(boxId, sCursorPosition);
        break;
    default:
        return;
    }

    sIsMonBeingMoved = FALSE;
}

static void DoTrySetDisplayMonData(void)
{
    TrySetDisplayMonData();
}

static void SetMovedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
    {
        gStorage->movingMon = gPlayerParty[sCursorPosition];
        if (&gPlayerParty[sCursorPosition] == GetFirstLiveMon())
            gFollowerSteps = 0;
    }
    else
        BoxMonAtToMon(boxId, position, &gStorage->movingMon);

    PurgeMonOrBoxMon(boxId, position);
    sMovingMonOrigBoxId = boxId;
    sMovingMonOrigBoxPos = position;
}

static void SetPlacedMonData(u8 boxId, u8 position)
{
    if (OW_PC_HEAL <= GEN_7)
        HealPokemon(&gStorage->movingMon);
    
    if (boxId == TOTAL_BOXES_COUNT)
    {
        gPlayerParty[position] = gStorage->movingMon;
        struct Pokemon *mon = &gPlayerParty[position];
        if (mon == GetFirstLiveMon())
            gFollowerSteps = 0;
    }
    else
    {
        BoxMonRestorePP(&gStorage->movingMon.box);
        SetBoxMonAt(boxId, position, &gStorage->movingMon.box);
    }
}

static void PurgeMonOrBoxMon(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        ZeroMonData(&gPlayerParty[position]);
    else
        ZeroBoxMonAt(boxId, position);
}

static void SetShiftedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        gStorage->tempMon = gPlayerParty[position];
    else
        BoxMonAtToMon(boxId, position, &gStorage->tempMon);

    SetPlacedMonData(boxId, position);
    gStorage->movingMon = gStorage->tempMon;
    SetDisplayMonData(&gStorage->movingMon, MODE_PARTY);
    sMovingMonOrigBoxId = boxId;
    sMovingMonOrigBoxPos = position;
}

static bool8 TryStorePartyMonInBox(u8 boxId)
{
    s16 boxPosition = GetFirstFreeBoxSpot(boxId);
    if (boxPosition == -1)
        return FALSE;

    if (sIsMonBeingMoved)
    {
        SetPlacedMonData(boxId, boxPosition);
        DestroyMovingMonIcon();
        sIsMonBeingMoved = FALSE;
    }
    else
    {
        SetMovedMonData(TOTAL_BOXES_COUNT, sCursorPosition);
        SetPlacedMonData(boxId, boxPosition);
        DestroyPartyMonIcon(sCursorPosition);
    }

    if (boxId == StorageGetCurrentBox())
        CreateBoxMonIconAtPos(boxPosition);

    StartSpriteAnim(gStorage->cursorSprite, 1);
    return TRUE;
}

static void ResetSelectionAfterDeposit(void)
{
    StartSpriteAnim(gStorage->cursorSprite, 0);
    TrySetDisplayMonData();
}

static void InitReleaseMon(void)
{
    u8 mode;

    if (sIsMonBeingMoved)
        mode = MODE_MOVE;
    else if (sCursorArea == CURSOR_AREA_IN_PARTY)
        mode = MODE_PARTY;
    else
        mode = MODE_BOX;

    DoReleaseMonAnim(mode, sCursorPosition);
    StringCopy(gStorage->releaseMonName, gStorage->displayMonNickname);
}

static bool8 TryHideReleaseMon(void)
{
    if (!TryHideReleaseMonSprite())
    {
        StartSpriteAnim(gStorage->cursorSprite, 0);
        return FALSE;
    }
    else
        return TRUE;
}

static void ReleaseMon(void)
{
    u8 boxId;
    u16 item = ITEM_NONE;

    DestroyReleaseMonIcon();
    if (sIsMonBeingMoved)
        sIsMonBeingMoved = FALSE;
    else
    {
        if (sCursorArea == CURSOR_AREA_IN_PARTY)
        {
            boxId = TOTAL_BOXES_COUNT;
            if (OW_PC_RELEASE_ITEM >= GEN_8)
                item = GetMonData(&gPlayerParty[sCursorPosition], MON_DATA_HELD_ITEM);
        }
        else
        {
            boxId = StorageGetCurrentBox();
            if (OW_PC_RELEASE_ITEM >= GEN_8)
                item = GetBoxMonDataAt(boxId, sCursorPosition, MON_DATA_HELD_ITEM);
        }

        PurgeMonOrBoxMon(boxId, sCursorPosition);
        if (item != ITEM_NONE)
            AddBagItem(item, 1);
    }
    TrySetDisplayMonData();
}

static void TrySetCursorFistAnim(void)
{
    if (sIsMonBeingMoved)
        StartSpriteAnim(gStorage->cursorSprite, 3);
}

static void InitCanReleaseMonVars(void)
{
    u16 knownMoveFlags;
    if (sIsMonBeingMoved)
    {
        gStorage->tempMon = gStorage->movingMon;
        gStorage->releaseBoxId = -1;
        gStorage->releaseBoxPos = -1;
    }
    else
    {
        if (sCursorArea == CURSOR_AREA_IN_PARTY)
        {
            gStorage->tempMon = gPlayerParty[sCursorPosition];
            gStorage->releaseBoxId = TOTAL_BOXES_COUNT;
        }
        else
        {
            BoxMonAtToMon(StorageGetCurrentBox(), sCursorPosition, &gStorage->tempMon);
            gStorage->releaseBoxId = StorageGetCurrentBox();
        }
        gStorage->releaseBoxPos = sCursorPosition;
    }

    gStorage->isSurfMon = FALSE;
    gStorage->isDiveMon = FALSE;
    gStorage->restrictedMoveList[0] = MOVE_SURF;
    gStorage->restrictedMoveList[1] = MOVE_DIVE;
    gStorage->restrictedMoveList[2] = MOVES_COUNT;
    knownMoveFlags = GetMonData(&gStorage->tempMon, MON_DATA_KNOWN_MOVES, (u8 *)gStorage->restrictedMoveList);
    gStorage->isSurfMon = knownMoveFlags & 1;
    gStorage->isDiveMon = (knownMoveFlags >> 1) & 1;
    if (gStorage->isSurfMon || gStorage->isDiveMon)
        gStorage->releaseMonStatusResolved = FALSE;
    else
    {
        gStorage->releaseMonStatusResolved = TRUE;
        gStorage->releaseMonStatus = RELEASE_MON_ALLOWED;
    }

    gStorage->releaseCheckState = 0;
}

static s8 RunCanReleaseMon(void)
{
    u16 i;
    u16 knownMoveFlags;

    if (gStorage->releaseMonStatusResolved)
        return gStorage->releaseMonStatus;

    switch (gStorage->releaseCheckState)
    {
    case 0:
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (gStorage->releaseBoxId != TOTAL_BOXES_COUNT || gStorage->releaseBoxPos != i)
            {
                knownMoveFlags = GetMonData(&gPlayerParty[i], MON_DATA_KNOWN_MOVES, (u8 *)gStorage->restrictedMoveList);
                if (knownMoveFlags & 1)
                    gStorage->isSurfMon = FALSE;
                if (knownMoveFlags & 2)
                    gStorage->isDiveMon = FALSE;
            }
        }
        if (!(gStorage->isSurfMon || gStorage->isDiveMon))
        {
            gStorage->releaseMonStatusResolved = TRUE;
            gStorage->releaseMonStatus = RELEASE_MON_ALLOWED;
        }
        else
        {
            gStorage->releaseCheckBoxId = 0;
            gStorage->releaseCheckBoxPos = 0;
            gStorage->releaseCheckState++;
        }
        break;
    case 1:
        // for some reason, check only 5 mons in box each time this function is called
        for (i = 0; i < 5; i++)
        {
            knownMoveFlags = GetAndCopyBoxMonDataAt(gStorage->releaseCheckBoxId, gStorage->releaseCheckBoxPos, MON_DATA_KNOWN_MOVES, (u8 *)gStorage->restrictedMoveList);
            if (knownMoveFlags != 0
                && !(gStorage->releaseBoxId == gStorage->releaseCheckBoxId && gStorage->releaseBoxPos == gStorage->releaseCheckBoxPos))
            {
                if (knownMoveFlags & 1)
                    gStorage->isSurfMon = FALSE;
                if (knownMoveFlags & 2)
                    gStorage->isDiveMon = FALSE;
            }
            if (++gStorage->releaseCheckBoxPos >= IN_BOX_COUNT)
            {
                gStorage->releaseCheckBoxPos = 0;
                if (++gStorage->releaseCheckBoxId >= TOTAL_BOXES_COUNT)
                {
                    gStorage->releaseMonStatusResolved = TRUE;
                    gStorage->releaseMonStatus = RELEASE_MON_NOT_ALLOWED;
                    break;
                }
            }
        }
        if (!(gStorage->isSurfMon || gStorage->isDiveMon))
        {
            gStorage->releaseMonStatusResolved = TRUE;
            gStorage->releaseMonStatus = RELEASE_MON_ALLOWED;
        }
        break;
    }

    return RELEASE_MON_UNDETERMINED;
}

static void SaveMovingMon(void)
{
    if (sIsMonBeingMoved)
        sMonBeingCarried = gStorage->movingMon;
}

static void LoadSavedMovingMon(void)
{
    if (sIsMonBeingMoved)
    {
        if (sMovingMonOrigBoxId == TOTAL_BOXES_COUNT)
            gStorage->movingMon = sMonBeingCarried;
        else
            gStorage->movingMon.box = sMonBeingCarried.box;
    }
}

static void InitSummaryScreenData(void)
{
    if (sIsMonBeingMoved)
    {
        SaveMovingMon();
        gStorage->summaryMonPtr.mon = &sMonBeingCarried;
        gStorage->summaryCursorPos = 0;
        gStorage->summaryLastIndex = 0;
        gStorage->summaryScreenMode = PSS_MODE_NORMAL;
    }
    else if (sCursorArea == CURSOR_AREA_IN_PARTY)
    {
        gStorage->summaryMonPtr.mon = gPlayerParty;
        gStorage->summaryCursorPos = sCursorPosition;
        gStorage->summaryLastIndex = CountPartyMons() - 1;
        gStorage->summaryScreenMode = PSS_MODE_NORMAL;
    }
    else
    {
        gStorage->summaryMonPtr.box = GetBoxedMonPtr(StorageGetCurrentBox(), 0);
        gStorage->summaryCursorPos = sCursorPosition;
        gStorage->summaryLastIndex = IN_BOX_COUNT - 1;
        gStorage->summaryScreenMode = PSS_MODE_BOX;
    }
}

static void SetSelectionAfterSummaryScreen(void)
{
    if (sIsMonBeingMoved)
        LoadSavedMovingMon();
    else
        sCursorPosition = GetLastViewedMonIndex();
}

s16 CompactPartySlots(void)
{
    s16 retVal = -1;
    u16 i, last;

    for (i = 0, last = 0; i < PARTY_SIZE; i++)
    {
        u16 species = GetMonData(gPlayerParty + i, MON_DATA_SPECIES);
        if (species != SPECIES_NONE)
        {
            if (i != last)
                gPlayerParty[last] = gPlayerParty[i];
            last++;
        }
        else if (retVal == -1)
            retVal = i;
    }
    for (; last < PARTY_SIZE; last++)
        ZeroMonData(gPlayerParty + last);

    return retVal;
}

static void SetMonMarkings(u8 markings)
{
    gStorage->displayMonMarkings = markings;
    if (sIsMonBeingMoved)
        SetMonData(&gStorage->movingMon, MON_DATA_MARKINGS, &markings);
    else
    {
        if (sCursorArea == CURSOR_AREA_IN_PARTY)
            SetMonData(gPlayerParty + sCursorPosition, MON_DATA_MARKINGS, &markings);
        if (sCursorArea == CURSOR_AREA_IN_BOX)
            SetCurrentBoxMonData(sCursorPosition, MON_DATA_MARKINGS, &markings);
    }
}

static bool8 CanMovePartyMon(void)
{
    if (sCursorArea == CURSOR_AREA_IN_PARTY && !sIsMonBeingMoved && CountPartyAliveNonEggMonsExcept(sCursorPosition) == 0)
        return TRUE;
    else
        return FALSE;
}

static bool8 CanPlaceMon(void)
{
    if (sIsMonBeingMoved)
    {
        if (sCursorArea == CURSOR_AREA_IN_PARTY && GetMonData(&gPlayerParty[sCursorPosition], MON_DATA_SPECIES) == SPECIES_NONE)
            return TRUE;
        else if (sCursorArea == CURSOR_AREA_IN_BOX && GetBoxMonDataAt(StorageGetCurrentBox(), sCursorPosition, MON_DATA_SPECIES_OR_EGG) == SPECIES_NONE)
            return TRUE;
        else
            return FALSE;
    }
    return FALSE;
}

static bool8 CanShiftMon(void)
{
    if (sIsMonBeingMoved)
    {
        if (sCursorArea == CURSOR_AREA_IN_PARTY && CountPartyAliveNonEggMonsExcept(sCursorPosition) == 0)
        {
            if (gStorage->displayMonIsEgg || GetMonData(&gStorage->movingMon, MON_DATA_HP) == 0)
                return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

static bool8 IsMonBeingMoved(void)
{
    return sIsMonBeingMoved;
}

static bool8 IsCursorOnBoxTitle(void)
{
    return (sCursorArea == CURSOR_AREA_BOX_TITLE);
}

static bool8 IsCursorOnCloseBox(void)
{
    return (sCursorArea == CURSOR_AREA_BUTTONS && sCursorPosition == 1);
}

static bool8 IsCursorInBox(void)
{
    return (sCursorArea == CURSOR_AREA_IN_BOX);
}

static void TrySetDisplayMonData(void)
{
    gStorage->setMosaic = (sIsMonBeingMoved == FALSE);
    if (!sIsMonBeingMoved)
    {
        switch (sCursorArea)
        {
        case CURSOR_AREA_IN_PARTY:
            if (sCursorPosition < PARTY_SIZE)
            {
                SetDisplayMonData(&gPlayerParty[sCursorPosition], MODE_PARTY);
                break;
            }
            // fallthrough
        case CURSOR_AREA_BUTTONS:
        case CURSOR_AREA_BOX_TITLE:
            SetDisplayMonData(NULL, MODE_MOVE);
            break;
        case CURSOR_AREA_IN_BOX:
            SetDisplayMonData(GetBoxedMonPtr(StorageGetCurrentBox(), sCursorPosition), MODE_BOX);
            break;
        }
    }
}

static void ReshowDisplayMon(void)
{
    if (sIsMonBeingMoved)
        SetDisplayMonData(&sMonBeingCarried, MODE_PARTY);
    else
        TrySetDisplayMonData();
}

#define displayMonNicknameText        displayMonTexts[0]
#define displayMonSpeciesNameText     displayMonTexts[1]
#define displayMonGenderAndLevelText  displayMonTexts[2]
#define displayMonItemNameText        displayMonTexts[3]

static void SetDisplayMonData(void *pokemon, u8 mode)
{
    u8 *txtPtr;
    u16 gender;
    bool8 sanityIsBagEgg;

    gStorage->displayMonItemId = ITEM_NONE;
    gender = MON_MALE;
    sanityIsBagEgg = FALSE;
    if (mode == MODE_PARTY)
    {
        struct Pokemon *mon = (struct Pokemon *)pokemon;

        gStorage->displayMonSpecies = GetMonData(mon, MON_DATA_SPECIES_OR_EGG);
        if (gStorage->displayMonSpecies != SPECIES_NONE)
        {
            sanityIsBagEgg = GetMonData(mon, MON_DATA_SANITY_IS_BAD_EGG);
            if (sanityIsBagEgg)
                gStorage->displayMonIsEgg = TRUE;
            else
                gStorage->displayMonIsEgg = GetMonData(mon, MON_DATA_IS_EGG);

            GetMonData(mon, MON_DATA_NICKNAME, gStorage->displayMonNickname);
            StringGet_Nickname(gStorage->displayMonNickname);
            gStorage->displayMonLevel = GetMonData(mon, MON_DATA_LEVEL);
            gStorage->displayMonMarkings = GetMonData(mon, MON_DATA_MARKINGS);
            gStorage->displayMonPersonality = GetMonData(mon, MON_DATA_PERSONALITY);
            gStorage->displayMonPalette = GetMonFrontSpritePal(mon);
            gender = GetMonGender(mon);
            gStorage->displayMonItemId = GetMonData(mon, MON_DATA_HELD_ITEM);
        }
    }
    else if (mode == MODE_BOX)
    {
        struct BoxPokemon *boxMon = (struct BoxPokemon *)pokemon;

        gStorage->displayMonSpecies = GetBoxMonData(pokemon, MON_DATA_SPECIES_OR_EGG);
        if (gStorage->displayMonSpecies != SPECIES_NONE)
        {
            bool32 isShiny = GetBoxMonData(boxMon, MON_DATA_IS_SHINY, NULL);
            sanityIsBagEgg = GetBoxMonData(boxMon, MON_DATA_SANITY_IS_BAD_EGG);
            if (sanityIsBagEgg)
                gStorage->displayMonIsEgg = TRUE;
            else
                gStorage->displayMonIsEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG);

            GetBoxMonData(boxMon, MON_DATA_NICKNAME, gStorage->displayMonNickname);
            StringGet_Nickname(gStorage->displayMonNickname);
            gStorage->displayMonLevel = GetLevelFromBoxMonExp(boxMon);
            gStorage->displayMonMarkings = GetBoxMonData(boxMon, MON_DATA_MARKINGS);
            gStorage->displayMonPersonality = GetBoxMonData(boxMon, MON_DATA_PERSONALITY);
            gStorage->displayMonPalette = GetMonSpritePalFromSpeciesAndPersonality(gStorage->displayMonSpecies, isShiny, gStorage->displayMonPersonality);
            gender = GetGenderFromSpeciesAndPersonality(gStorage->displayMonSpecies, gStorage->displayMonPersonality);
            gStorage->displayMonItemId = GetBoxMonData(boxMon, MON_DATA_HELD_ITEM);
        }
    }
    else
    {
        gStorage->displayMonSpecies = SPECIES_NONE;
        gStorage->displayMonItemId = ITEM_NONE;
    }

    if (gStorage->displayMonSpecies == SPECIES_NONE)
    {
        StringFill(gStorage->displayMonNickname, CHAR_SPACE, 5);
        StringFill(gStorage->displayMonNicknameText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonSpeciesNameText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonGenderAndLevelText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonItemNameText, CHAR_SPACE, 8);
    }
    else if (gStorage->displayMonIsEgg)
    {
        if (sanityIsBagEgg)
            StringCopyPadded(gStorage->displayMonNicknameText, gStorage->displayMonNickname, CHAR_SPACE, 5);
        else
            StringCopyPadded(gStorage->displayMonNicknameText, gText_EggNickname, CHAR_SPACE, 8);

        StringFill(gStorage->displayMonSpeciesNameText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonGenderAndLevelText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonItemNameText, CHAR_SPACE, 8);
    }
    else
    {
        if (gStorage->displayMonSpecies == SPECIES_NIDORAN_F || gStorage->displayMonSpecies == SPECIES_NIDORAN_M)
            gender = MON_GENDERLESS;

        // Buffer nickname
        StringCopyPadded(gStorage->displayMonNicknameText, gStorage->displayMonNickname, CHAR_SPACE, 5);

        // Buffer species name
        txtPtr = gStorage->displayMonSpeciesNameText;
        *(txtPtr)++ = CHAR_SLASH;
        StringCopyPadded(txtPtr, gSpeciesInfo[gStorage->displayMonSpecies].speciesName, CHAR_SPACE, 5);

        // Buffer gender and level
        txtPtr = gStorage->displayMonGenderAndLevelText;
        *(txtPtr)++ = EXT_CTRL_CODE_BEGIN;
        *(txtPtr)++ = EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW;
        switch (gender)
        {
        case MON_MALE:
            *(txtPtr)++ = TEXT_COLOR_RED;
            *(txtPtr)++ = TEXT_COLOR_WHITE;
            *(txtPtr)++ = TEXT_COLOR_LIGHT_RED;
            *(txtPtr)++ = CHAR_MALE;
            break;
        case MON_FEMALE:
            *(txtPtr)++ = TEXT_COLOR_GREEN;
            *(txtPtr)++ = TEXT_COLOR_WHITE;
            *(txtPtr)++ = TEXT_COLOR_LIGHT_GREEN;
            *(txtPtr)++ = CHAR_FEMALE;
            break;
        default:
            *(txtPtr)++ = TEXT_COLOR_DARK_GRAY;
            *(txtPtr)++ = TEXT_COLOR_WHITE;
            *(txtPtr)++ = TEXT_COLOR_LIGHT_GRAY;
            *(txtPtr)++ = CHAR_SPACE;
            break;
        }

        *(txtPtr++) = EXT_CTRL_CODE_BEGIN;
        *(txtPtr++) = EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW;
        *(txtPtr++) = TEXT_COLOR_DARK_GRAY;
        *(txtPtr++) = TEXT_COLOR_WHITE;
        *(txtPtr++) = TEXT_COLOR_LIGHT_GRAY;
        *(txtPtr++) = CHAR_SPACE;
        *(txtPtr++) = CHAR_EXTRA_SYMBOL;
        *(txtPtr++) = CHAR_LV_2;

        txtPtr = ConvertIntToDecimalStringN(txtPtr, gStorage->displayMonLevel, STR_CONV_MODE_LEFT_ALIGN, 3);
        txtPtr[0] = CHAR_SPACE;
        txtPtr[1] = EOS;

        // Buffer item name
        if (gStorage->displayMonItemId != ITEM_NONE)
            StringCopyPadded(gStorage->displayMonItemNameText, GetItemName(gStorage->displayMonItemId), CHAR_SPACE, 8);
        else
            StringFill(gStorage->displayMonItemNameText, CHAR_SPACE, 8);
    }
}

#undef displayMonNicknameText
#undef displayMonSpeciesNameText
#undef displayMonGenderAndLevelText
#undef displayMonItemNameText

static u8 HandleInput_InBox(void)
{
    switch (gStorage->inBoxMovingMode)
    {
    case MOVE_MODE_NORMAL:
    default:
        return HandleInput_InBox_Normal();
    case MOVE_MODE_MULTIPLE_SELECTING:
        return HandleInput_InBox_GrabbingMultiple();
    case MOVE_MODE_MULTIPLE_MOVING:
        return HandleInput_InBox_MovingMultiple();
    }
}

static u8 HandleInput_InBox_Normal(void)
{
    u8 input;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        cursorArea = sCursorArea;
        cursorPosition = sCursorPosition;
        gStorage->cursorVerticalWrap = 0;
        gStorage->cursorHorizontalWrap = 0;
        gStorage->cursorFlipTimer = 0;
        if (JOY_REPT(DPAD_UP))
        {
            input = INPUT_MOVE_CURSOR;
            if (sCursorPosition >= IN_BOX_COLUMNS)
                cursorPosition -= IN_BOX_COLUMNS;
            else
            {
                cursorArea = CURSOR_AREA_BOX_TITLE;
                cursorPosition = 0;
            }
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            input = INPUT_MOVE_CURSOR;
            cursorPosition += IN_BOX_COLUMNS;
            if (cursorPosition >= IN_BOX_COUNT)
            {
                cursorArea = CURSOR_AREA_BUTTONS;
                cursorPosition -= IN_BOX_COUNT;
                cursorPosition /= 3;
                gStorage->cursorVerticalWrap = 1;
                gStorage->cursorFlipTimer = 1;
            }
            break;
        }
        else if (JOY_REPT(DPAD_LEFT))
        {
            input = INPUT_MOVE_CURSOR;
            if (sCursorPosition % IN_BOX_COLUMNS != 0)
                cursorPosition--;
            else
            {
                gStorage->cursorHorizontalWrap = -1;
                cursorPosition += (IN_BOX_COLUMNS - 1);
            }
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            input = INPUT_MOVE_CURSOR;
            if ((sCursorPosition + 1) % IN_BOX_COLUMNS != 0)
                cursorPosition++;
            else
            {
                gStorage->cursorHorizontalWrap = 1;
                cursorPosition -= (IN_BOX_COLUMNS - 1);
            }
            break;
        }
        else if (JOY_NEW(START_BUTTON))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_BOX_TITLE;
            cursorPosition = 0;
            break;
        }

        if ((JOY_NEW(A_BUTTON)) && SetSelectionMenuTexts())
        {
            if (!sInMultiMoveMode)
                return INPUT_IN_MENU;

            if (gStorage->boxOption != OPTION_MOVE_MONS || sIsMonBeingMoved == TRUE)
            {
                switch (GetMenuItemTextId(0))
                {
                case MENU_TEXT_STORE:
                    return INPUT_DEPOSIT;
                case MENU_TEXT_WITHDRAW:
                    return INPUT_WITHDRAW;
                case MENU_TEXT_MOVE:
                    return INPUT_MOVE_MON;
                case MENU_TEXT_SHIFT:
                    return INPUT_SHIFT_MON;
                case MENU_TEXT_PLACE:
                    return INPUT_PLACE_MON;
                case MENU_TEXT_TAKE:
                    return INPUT_TAKE_ITEM;
                case MENU_TEXT_GIVE:
                    return INPUT_GIVE_ITEM;
                case MENU_TEXT_SWITCH:
                    return INPUT_SWITCH_ITEMS;
                }
            }
            else
            {
                gStorage->inBoxMovingMode = MOVE_MODE_MULTIPLE_SELECTING;
                return INPUT_MULTIMOVE_START;
            }
        }

        if (JOY_NEW(B_BUTTON))
            return INPUT_PRESSED_B;

        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return INPUT_SCROLL_LEFT;
            if (JOY_HELD(R_BUTTON))
                return INPUT_SCROLL_RIGHT;
        }

        if (JOY_NEW(SELECT_BUTTON))
        {
            ToggleCursorMultiMoveMode();
            return INPUT_NONE;
        }

        input = INPUT_NONE;

    } while (FALSE);

    if (input != INPUT_NONE)
        SetCursorPosition(cursorArea, cursorPosition);

    return input;
}

static u8 HandleInput_InBox_GrabbingMultiple(void)
{
    if (JOY_HELD(A_BUTTON))
    {
        if (JOY_REPT(DPAD_UP))
        {
            if (sCursorPosition / IN_BOX_COLUMNS != 0)
            {
                SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition - IN_BOX_COLUMNS);
                return INPUT_MULTIMOVE_CHANGE_SELECTION;
            }
            else
                return INPUT_MULTIMOVE_UNABLE;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            if (sCursorPosition + IN_BOX_COLUMNS < IN_BOX_COUNT)
            {
                SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition + IN_BOX_COLUMNS);
                return INPUT_MULTIMOVE_CHANGE_SELECTION;
            }
            else
                return INPUT_MULTIMOVE_UNABLE;
        }
        else if (JOY_REPT(DPAD_LEFT))
        {
            if (sCursorPosition % IN_BOX_COLUMNS != 0)
            {
                SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition - 1);
                return INPUT_MULTIMOVE_CHANGE_SELECTION;
            }
            else
                return INPUT_MULTIMOVE_UNABLE;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            if ((sCursorPosition + 1) % IN_BOX_COLUMNS != 0)
            {
                SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition + 1);
                return INPUT_MULTIMOVE_CHANGE_SELECTION;
            }
            else
                return INPUT_MULTIMOVE_UNABLE;
        }
        else
            return INPUT_NONE;
    }
    else
    {
        if (MultiMove_GetOriginPosition() == sCursorPosition)
        {
            gStorage->inBoxMovingMode = MOVE_MODE_NORMAL;
            gStorage->cursorShadowSprite->invisible = FALSE;
            return INPUT_MULTIMOVE_SINGLE;
        }
        else
        {
            sIsMonBeingMoved = (gStorage->displayMonSpecies != SPECIES_NONE);
            gStorage->inBoxMovingMode = MOVE_MODE_MULTIPLE_MOVING;
            sMovingMonOrigBoxId = StorageGetCurrentBox();
            return INPUT_MULTIMOVE_GRAB_SELECTION;
        }
    }
}

static u8 HandleInput_InBox_MovingMultiple(void)
{
    if (JOY_REPT(DPAD_UP))
    {
        if (MultiMove_TryMoveGroup(0))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition - IN_BOX_COLUMNS);
            return INPUT_MULTIMOVE_MOVE_MONS;
        }
        else
            return INPUT_MULTIMOVE_UNABLE;
    }
    else if (JOY_REPT(DPAD_DOWN))
    {
        if (MultiMove_TryMoveGroup(1))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition + IN_BOX_COLUMNS);
            return INPUT_MULTIMOVE_MOVE_MONS;
        }
        else
            return INPUT_MULTIMOVE_UNABLE;
    }
    else if (JOY_REPT(DPAD_LEFT))
    {
        if (MultiMove_TryMoveGroup(2))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition - 1);
            return INPUT_MULTIMOVE_MOVE_MONS;
        }
        else
            return INPUT_SCROLL_LEFT;
    }
    else if (JOY_REPT(DPAD_RIGHT))
    {
        if (MultiMove_TryMoveGroup(3))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition + 1);
            return INPUT_MULTIMOVE_MOVE_MONS;
        }
        else
            return INPUT_SCROLL_RIGHT;
    }
    else if (JOY_NEW(A_BUTTON))
    {
        if (MultiMove_CanPlaceSelection())
        {
            sIsMonBeingMoved = FALSE;
            gStorage->inBoxMovingMode = MOVE_MODE_NORMAL;
            return INPUT_MULTIMOVE_PLACE_MONS;
        }
        else
            return INPUT_MULTIMOVE_UNABLE;
    }
    else if (JOY_NEW(B_BUTTON))
        return INPUT_MULTIMOVE_UNABLE;

    else
    {
        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return INPUT_SCROLL_LEFT;
            if (JOY_HELD(R_BUTTON))
                return INPUT_SCROLL_RIGHT;
        }

        return INPUT_NONE;
    }
}

static u8 HandleInput_InParty(void)
{
    u8 input;
    bool8 gotoBox;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        cursorArea = sCursorArea;
        cursorPosition = sCursorPosition;
        gStorage->cursorHorizontalWrap = 0;
        gStorage->cursorVerticalWrap = 0;
        gStorage->cursorFlipTimer = 0;
        gotoBox = FALSE;
        input = INPUT_NONE;

        if (JOY_REPT(DPAD_UP))
        {
            if (--cursorPosition < 0)
                cursorPosition = PARTY_SIZE;
            if (cursorPosition != sCursorPosition)
                input = INPUT_MOVE_CURSOR;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            if (++cursorPosition > PARTY_SIZE)
                cursorPosition = 0;
            if (cursorPosition != sCursorPosition)
                input = INPUT_MOVE_CURSOR;
            break;
        }
        else if (JOY_REPT(DPAD_LEFT) && sCursorPosition != 0)
        {
            input = INPUT_MOVE_CURSOR;
            gStorage->cursorPrevPartyPos = sCursorPosition;
            cursorPosition = 0;
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            if (sCursorPosition == 0)
            {
                input = INPUT_MOVE_CURSOR;
                cursorPosition = gStorage->cursorPrevPartyPos;
            }
            else
            {
                input = INPUT_HIDE_PARTY;
                cursorArea = CURSOR_AREA_IN_BOX;
                cursorPosition = 0;
            }
            break;
        }

        if (JOY_NEW(A_BUTTON))
        {
            if (sCursorPosition == PARTY_SIZE)
            {
                if (gStorage->boxOption == OPTION_DEPOSIT)
                    return INPUT_CLOSE_BOX;

                gotoBox = TRUE;
            }
            else if (SetSelectionMenuTexts())
            {
                if (!sInMultiMoveMode)
                    return INPUT_IN_MENU;

                switch (GetMenuItemTextId(0))
                {
                case MENU_TEXT_STORE:
                    return INPUT_DEPOSIT;
                case MENU_TEXT_WITHDRAW:
                    return INPUT_WITHDRAW;
                case MENU_TEXT_MOVE:
                    return INPUT_MOVE_MON;
                case MENU_TEXT_SHIFT:
                    return INPUT_SHIFT_MON;
                case MENU_TEXT_PLACE:
                    return INPUT_PLACE_MON;
                case MENU_TEXT_TAKE:
                    return INPUT_TAKE_ITEM;
                case MENU_TEXT_GIVE:
                    return INPUT_GIVE_ITEM;
                case MENU_TEXT_SWITCH:
                    return INPUT_SWITCH_ITEMS;
                }
            }
        }

        if (JOY_NEW(B_BUTTON))
        {
            if (gStorage->boxOption == OPTION_DEPOSIT)
                return INPUT_PRESSED_B;

            gotoBox = TRUE;
        }

        if (gotoBox)
        {
            input = INPUT_HIDE_PARTY;
            cursorArea = CURSOR_AREA_IN_BOX;
            cursorPosition = 0;
        }
        else if (JOY_NEW(SELECT_BUTTON))
        {
            ToggleCursorMultiMoveMode();
            return INPUT_NONE;
        }

    } while (FALSE);

    if (input != INPUT_NONE && input != INPUT_HIDE_PARTY)
        SetCursorPosition(cursorArea, cursorPosition);

    return input;
}

static u8 HandleInput_BoxTitle(void)
{
    u8 input;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        gStorage->cursorHorizontalWrap = 0;
        gStorage->cursorVerticalWrap = 0;
        gStorage->cursorFlipTimer = 0;

        if (JOY_REPT(DPAD_UP))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_BUTTONS;
            cursorPosition = 0;
            gStorage->cursorFlipTimer = 1;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_IN_BOX;
            cursorPosition = 2;
            break;
        }

        if (JOY_HELD(DPAD_LEFT))
            return INPUT_SCROLL_LEFT;
        if (JOY_HELD(DPAD_RIGHT))
            return INPUT_SCROLL_RIGHT;

        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return INPUT_SCROLL_LEFT;
            if (JOY_HELD(R_BUTTON))
                return INPUT_SCROLL_RIGHT;
        }

        if (JOY_NEW(A_BUTTON))
        {
            AnimateBoxScrollArrows(FALSE);
            AddBoxMenu();
            return INPUT_BOX_OPTIONS;
        }

        if (JOY_NEW(B_BUTTON))
            return INPUT_PRESSED_B;

        if (JOY_NEW(SELECT_BUTTON))
        {
            ToggleCursorMultiMoveMode();
            return INPUT_NONE;
        }

        input = INPUT_NONE;

    } while (FALSE);

    if (input != INPUT_NONE)
    {
        if (cursorArea != CURSOR_AREA_BOX_TITLE)
            AnimateBoxScrollArrows(FALSE);
        SetCursorPosition(cursorArea, cursorPosition);
    }

    return input;
}

static u8 HandleInput_OnButtons(void)
{
    u8 input;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        cursorArea = sCursorArea;
        cursorPosition = sCursorPosition;
        gStorage->cursorHorizontalWrap = 0;
        gStorage->cursorVerticalWrap = 0;
        gStorage->cursorFlipTimer = 0;

        if (JOY_REPT(DPAD_UP))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_IN_BOX;
            gStorage->cursorVerticalWrap = -1;
            if (sCursorPosition == 0)
                cursorPosition = IN_BOX_COUNT - 1 - 5;
            else
                cursorPosition = IN_BOX_COUNT - 1;
            gStorage->cursorFlipTimer = 1;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN | START_BUTTON))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_BOX_TITLE;
            cursorPosition = 0;
            gStorage->cursorFlipTimer = 1;
            break;
        }

        if (JOY_REPT(DPAD_LEFT))
        {
            input = INPUT_MOVE_CURSOR;
            if (--cursorPosition < 0)
                cursorPosition = 1;
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            input = INPUT_MOVE_CURSOR;
            if (++cursorPosition > 1)
                cursorPosition = 0;
            break;
        }

        if (JOY_NEW(A_BUTTON))
            return cursorPosition == 0 ? INPUT_SHOW_PARTY : INPUT_CLOSE_BOX;

        if (JOY_NEW(B_BUTTON))
            return INPUT_PRESSED_B;

        if (JOY_NEW(SELECT_BUTTON))
        {
            ToggleCursorMultiMoveMode();
            return INPUT_NONE;
        }

        input = INPUT_NONE;
    } while (FALSE);

    if (input != INPUT_NONE)
        SetCursorPosition(cursorArea, cursorPosition);

    return input;
}

static u8 HandleInput(void)
{
    struct
    {
        u8 (*func)(void);
        s8 area;
    }
    static const inputFuncs[] = {
        {HandleInput_InBox,     CURSOR_AREA_IN_BOX},
        {HandleInput_InParty,   CURSOR_AREA_IN_PARTY},
        {HandleInput_BoxTitle,  CURSOR_AREA_BOX_TITLE},
        {HandleInput_OnButtons, CURSOR_AREA_BUTTONS},
        {NULL, 0},
    };

    u16 i = 0;
    while (inputFuncs[i].func != NULL)
    {
        if (inputFuncs[i].area == sCursorArea)
            return inputFuncs[i].func();
        i++;
    }

    return INPUT_NONE;
}

static void AddBoxMenu(void)
{
    InitMenu();
    SetMenuText(MENU_TEXT_JUMP);
    SetMenuText(MENU_TEXT_WALLPAPER);
    SetMenuText(MENU_TEXT_NAME);
    SetMenuText(MENU_TEXT_CANCEL);
}

static bool8 SetSelectionMenuTexts(void)
{
    InitMenu();
    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return SetMenuTextsForMon();
    else
        return SetMenuTextsForItem();
}

static bool8 SetMenuTextsForMon(void)
{
    u16 species = GetSpeciesAtCursorPosition();

    switch (gStorage->boxOption)
    {
    case OPTION_DEPOSIT:
        if (species != SPECIES_NONE)
            SetMenuText(MENU_TEXT_STORE);
        else
            return FALSE;
        break;
    case OPTION_WITHDRAW:
        if (species != SPECIES_NONE)
            SetMenuText(MENU_TEXT_WITHDRAW);
        else
            return FALSE;
        break;
    case OPTION_MOVE_MONS:
        if (sIsMonBeingMoved)
        {
            if (species != SPECIES_NONE)
                SetMenuText(MENU_TEXT_SHIFT);
            else
                SetMenuText(MENU_TEXT_PLACE);
        }
        else
        {
            if (species != SPECIES_NONE)
                SetMenuText(MENU_TEXT_MOVE);
            else
                return FALSE;
        }
        break;
    case OPTION_MOVE_ITEMS:
    default:
        return FALSE;
    }

    SetMenuText(MENU_TEXT_SUMMARY);
    if (gStorage->boxOption == OPTION_MOVE_MONS)
    {
        if (!sCursorArea)
            SetMenuText(MENU_TEXT_WITHDRAW);
        else
            SetMenuText(MENU_TEXT_STORE);
    }

    SetMenuText(MENU_TEXT_MARK);
    SetMenuText(MENU_TEXT_RELEASE);
    SetMenuText(MENU_TEXT_CANCEL);
    return TRUE;
}

static bool8 SetMenuTextsForItem(void)
{
    if (gStorage->displayMonSpecies == SPECIES_EGG)
        return FALSE;

    if (!IsActiveItemMoving())
    {
        if (gStorage->displayMonItemId == ITEM_NONE)
        {
            if (gStorage->displayMonSpecies == SPECIES_NONE)
                return FALSE;

            SetMenuText(MENU_TEXT_GIVE2);
        }
        else
        {
            if (!ItemIsMail(gStorage->displayMonItemId))
            {
                SetMenuText(MENU_TEXT_TAKE);
                SetMenuText(MENU_TEXT_BAG);
            }
            SetMenuText(MENU_TEXT_INFO);
        }
    }
    else
    {
        if (gStorage->displayMonItemId == ITEM_NONE)
        {
            if (gStorage->displayMonSpecies == SPECIES_NONE)
                return FALSE;

            SetMenuText(MENU_TEXT_GIVE);
        }
        else
        {
            if (ItemIsMail(gStorage->displayMonItemId) == TRUE)
                return FALSE;

            SetMenuText(MENU_TEXT_SWITCH);
        }
    }

    SetMenuText(MENU_TEXT_CANCEL);
    return TRUE;
}

static void SpriteCB_CursorShadow(struct Sprite *sprite)
{
    sprite->x = gStorage->cursorSprite->x;
    sprite->y = gStorage->cursorSprite->y + 20;
}

static void CreateCursorSprites(void)
{
    u16 x, y;
    u8 spriteId;
    u8 priority, subpriority;
    struct SpriteSheet spriteSheets[] = {
        {sHandCursor_Gfx, 0x800, GFXTAG_CURSOR},
        {sHandCursorShadow_Gfx, 0x80, GFXTAG_CURSOR_SHADOW},
        {}
    };

    struct SpritePalette spritePalettes[] = {
        {sPokeStorageMisc1Pal, PALTAG_MISC_1},
        {}
    };

    static const struct OamData sOamData_Cursor = {
        .shape = SPRITE_SHAPE(32x32),
        .size = SPRITE_SIZE(32x32),
        .priority = 1,
    };
    static const struct OamData sOamData_CursorShadow = {
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .priority = 1,
    };

    static const union AnimCmd sAnim_Cursor_Bouncing[] = {
        ANIMCMD_FRAME(0, 30),
        ANIMCMD_FRAME(16, 30),
        ANIMCMD_JUMP(0)
    };
    static const union AnimCmd sAnim_Cursor_Still[] = {
        ANIMCMD_FRAME(0, 5),
        ANIMCMD_END
    };
    static const union AnimCmd sAnim_Cursor_Open[] = {
        ANIMCMD_FRAME(32, 5),
        ANIMCMD_END
    };
    static const union AnimCmd sAnim_Cursor_Fist[] = {
        ANIMCMD_FRAME(48, 5),
        ANIMCMD_END
    };

    static const union AnimCmd *const sAnims_Cursor[] = {
        [CURSOR_ANIM_BOUNCE] = sAnim_Cursor_Bouncing,
        [CURSOR_ANIM_STILL]  = sAnim_Cursor_Still,
        [CURSOR_ANIM_OPEN]   = sAnim_Cursor_Open,
        [CURSOR_ANIM_FIST]   = sAnim_Cursor_Fist,
    };

    static const struct SpriteTemplate sSpriteTemplate_Cursor = {
        .tileTag = GFXTAG_CURSOR,
        .paletteTag = PALTAG_MISC_2,
        .oam = &sOamData_Cursor,
        .anims = sAnims_Cursor,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };

    static const struct SpriteTemplate sSpriteTemplate_CursorShadow = {
        .tileTag = GFXTAG_CURSOR_SHADOW,
        .paletteTag = PALTAG_MISC_2,
        .oam = &sOamData_CursorShadow,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_CursorShadow,
    };

    LoadSpriteSheets(spriteSheets);
    LoadSpritePalettes(spritePalettes);
    gStorage->cursorPalNums[0] = IndexOfSpritePaletteTag(PALTAG_MISC_2);
    gStorage->cursorPalNums[1] = IndexOfSpritePaletteTag(PALTAG_MISC_1);

    GetCursorCoordsByPos(sCursorArea, sCursorPosition, &x, &y);
    spriteId = CreateSprite(&sSpriteTemplate_Cursor, x, y, 6);
    if (spriteId != MAX_SPRITES)
    {
        gStorage->cursorSprite = &gSprites[spriteId];
        gStorage->cursorSprite->oam.paletteNum = gStorage->cursorPalNums[sInMultiMoveMode];
        gStorage->cursorSprite->oam.priority = 1;
        if (sIsMonBeingMoved)
            StartSpriteAnim(gStorage->cursorSprite, 3);
    }
    else
        gStorage->cursorSprite = NULL;


    if (sCursorArea == CURSOR_AREA_IN_PARTY)
    {
        subpriority = 13;
        priority = 1;
    }
    else
    {
        subpriority = 21;
        priority = 2;
    }

    spriteId = CreateSprite(&sSpriteTemplate_CursorShadow, 0, 0, subpriority);
    if (spriteId != MAX_SPRITES)
    {
        gStorage->cursorShadowSprite = &gSprites[spriteId];
        gStorage->cursorShadowSprite->oam.priority = priority;
        if (sCursorArea)
            gStorage->cursorShadowSprite->invisible = 1;
    }
    else
        gStorage->cursorShadowSprite = NULL;
}

static void ToggleCursorMultiMoveMode(void)
{
    sInMultiMoveMode = !sInMultiMoveMode;
    gStorage->cursorSprite->oam.paletteNum = gStorage->cursorPalNums[sInMultiMoveMode];
}

static u8 GetBoxCursorPosition(void)
{
    return sCursorPosition;
}

void GetCursorBoxColumnAndRow(u8 *column, u8 *row)
{
    if (sCursorArea == CURSOR_AREA_IN_BOX)
    {
        *column = sCursorPosition % IN_BOX_COLUMNS;
        *row = sCursorPosition / IN_BOX_COLUMNS;
    }
    else
    {
        *column = 0;
        *row = 0;
    }
}

static void StartCursorAnim(u8 animNum)
{
    StartSpriteAnim(gStorage->cursorSprite, animNum);
}

static u8 GetMovingMonOriginalBoxId(void)
{
    return sMovingMonOrigBoxId;
}

void SetCursorPriorityTo1(void)
{
    gStorage->cursorSprite->oam.priority = 1;
}

static void TryHideItemAtCursor(void)
{
    if (sCursorArea == CURSOR_AREA_IN_BOX)
        TryHideItemIconAtPos(CURSOR_AREA_IN_BOX, sCursorPosition);
}

static void TryShowItemAtCursor(void)
{
    if (sCursorArea == CURSOR_AREA_IN_BOX)
        TryLoadItemIconAtPos(CURSOR_AREA_IN_BOX, sCursorPosition);
}


//------------------------------------------------------------------------------
//  SECTION: Menu
//
//  The functions below handle the generic options menu that comes up whenever
//  something in the PC is selected.
//------------------------------------------------------------------------------


static void InitMenu(void)
{
    gStorage->menuItemsCount = 0;
    gStorage->menuWidth = 0;
    gStorage->menuWindow.bg = 0;
    gStorage->menuWindow.paletteNum = 15;
    gStorage->menuWindow.baseBlock = 92;
}

static const u8 *const sMenuTexts[] = {
    [MENU_TEXT_CANCEL]     = gPCText_Cancel,
    [MENU_TEXT_STORE]      = gPCText_Store,
    [MENU_TEXT_WITHDRAW]   = gPCText_Withdraw,
    [MENU_TEXT_MOVE]       = gPCText_Move,
    [MENU_TEXT_SHIFT]      = gPCText_Shift,
    [MENU_TEXT_PLACE]      = gPCText_Place,
    [MENU_TEXT_SUMMARY]    = gPCText_Summary,
    [MENU_TEXT_RELEASE]    = gPCText_Release,
    [MENU_TEXT_MARK]       = gPCText_Mark,
    [MENU_TEXT_JUMP]       = gPCText_Jump,
    [MENU_TEXT_WALLPAPER]  = gPCText_Wallpaper,
    [MENU_TEXT_NAME]       = gPCText_Name,
    [MENU_TEXT_TAKE]       = gPCText_Take,
    [MENU_TEXT_GIVE]       = gPCText_Give,
    [MENU_TEXT_GIVE2]      = gPCText_Give,
    [MENU_TEXT_SWITCH]     = gPCText_Switch,
    [MENU_TEXT_BAG]        = gPCText_Bag,
    [MENU_TEXT_INFO]       = gPCText_Info,
    [MENU_TEXT_SCENERY_1]  = gPCText_Scenery1,
    [MENU_TEXT_SCENERY_2]  = gPCText_Scenery2,
    [MENU_TEXT_SCENERY_3]  = gPCText_Scenery3,
    [MENU_TEXT_ETCETERA]   = gPCText_Etcetera,
    [MENU_TEXT_FOREST]     = gPCText_Forest,
    [MENU_TEXT_CITY]       = gPCText_City,
    [MENU_TEXT_DESERT]     = gPCText_Desert,
    [MENU_TEXT_SAVANNA]    = gPCText_Savanna,
    [MENU_TEXT_CRAG]       = gPCText_Crag,
    [MENU_TEXT_VOLCANO]    = gPCText_Volcano,
    [MENU_TEXT_SNOW]       = gPCText_Snow,
    [MENU_TEXT_CAVE]       = gPCText_Cave,
    [MENU_TEXT_BEACH]      = gPCText_Beach,
    [MENU_TEXT_SEAFLOOR]   = gPCText_Seafloor,
    [MENU_TEXT_RIVER]      = gPCText_River,
    [MENU_TEXT_SKY]        = gPCText_Sky,
    [MENU_TEXT_POLKADOT]   = gPCText_PolkaDot,
    [MENU_TEXT_POKECENTER] = gPCText_Pokecenter,
    [MENU_TEXT_MACHINE]    = gPCText_Machine,
    [MENU_TEXT_SIMPLE]     = gPCText_Simple,
};

static void SetMenuText(u8 textId)
{
    if (gStorage->menuItemsCount < ARRAY_COUNT(gStorage->menuItems))
    {
        u8 len;
        struct StorageMenu *menu = &gStorage->menuItems[gStorage->menuItemsCount];

        menu->text = sMenuTexts[textId];
        menu->textId = textId;
        len = StringLength(menu->text);
        if (len > gStorage->menuWidth)
            gStorage->menuWidth = len;

        gStorage->menuItemsCount++;
    }
}

static s8 GetMenuItemTextId(u8 menuIndex)
{
    if (menuIndex >= gStorage->menuItemsCount)
        return MENU_B_PRESSED;
    else
        return gStorage->menuItems[menuIndex].textId;
}

static void AddMenu(void)
{
    gStorage->menuWindow.width = gStorage->menuWidth + 2;
    gStorage->menuWindow.height = 2 * gStorage->menuItemsCount;
    gStorage->menuWindow.tilemapLeft = 29 - gStorage->menuWindow.width;
    gStorage->menuWindow.tilemapTop = 15 - gStorage->menuWindow.height;
    gStorage->menuWindowId = AddWindow(&gStorage->menuWindow);
    ClearWindowTilemap(gStorage->menuWindowId);
    DrawStdFrameWithCustomTileAndPalette(gStorage->menuWindowId, FALSE, 11, 14);
    PrintMenuActionTextsAtPos(gStorage->menuWindowId, FONT_NORMAL_COPY_1, 8, 2, 16, gStorage->menuItemsCount, (void *)gStorage->menuItems);
    InitMenuNormal(gStorage->menuWindowId, FONT_NORMAL_COPY_1, 0, 2, 16, gStorage->menuItemsCount, 0);
    ScheduleBgCopyTilemapToVram(0);
    gStorage->menuUnusedField = 0;
}

static bool8 IsMenuLoading(void)
{
    // Possibly stubbed out debug code?
    return FALSE;
}

static s16 HandleMenuInput(void)
{
    s32 input = MENU_NOTHING_CHOSEN;

    do
    {
        if (JOY_NEW(A_BUTTON))
        {
            input = Menu_GetCursorPos();
            break;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            input = MENU_B_PRESSED;
        }

        if (JOY_NEW(DPAD_UP))
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(-1);
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(1);
        }
    } while (FALSE);

    if (input != MENU_NOTHING_CHOSEN)
        RemoveMenu();

    if (input >= 0)
        input = gStorage->menuItems[input].textId;

    return input;
}

static void RemoveMenu(void)
{
    ClearStdWindowAndFrameToTransparent(gStorage->menuWindowId, TRUE);
    RemoveWindow(gStorage->menuWindowId);
}

//------------------------------------------------------------------------------
//  SECTION: MultiMove
//
//  The functions below handle moving and selecting multiple Pokémon at once.
//  The icon sprites are moved to bg 0, and this bg is manipulated to move
//  them as a group.
//------------------------------------------------------------------------------


static const struct WindowTemplate sWindowTemplate_MultiMove = {
    .bg = 0,
    .tilemapLeft = 10,
    .tilemapTop = 3,
    .width = 20,
    .height = 18,
    .paletteNum = 9,
    .baseBlock = 0x00a
};

EWRAM_DATA static struct
{
    u8 funcId;
    u8 state;
    u8 fromColumn;
    u8 fromRow;
    u8 toColumn;
    u8 toRow;
    u8 cursorColumn;
    u8 cursorRow;
    u8 minColumn;
    u8 minRow;
    u8 columnsTotal;
    u8 rowsTotal;
    u16 bgX;
    u16 bgY;
    u16 bgMoveSteps;
    struct BoxPokemon boxMons[IN_BOX_COUNT];
} *sMultiMove = NULL;


static bool8 MultiMove_Init(void)
{
    sMultiMove = Alloc(sizeof(*sMultiMove));
    if (sMultiMove != NULL)
    {
        gStorage->multiMoveWindowId = AddWindow8Bit(&sWindowTemplate_MultiMove);
        if (gStorage->multiMoveWindowId != WINDOW_NONE)
        {
            FillWindowPixelBuffer(gStorage->multiMoveWindowId, PIXEL_FILL(0));
            return TRUE;
        }
    }

    return FALSE;
}

static void MultiMove_Free(void)
{
    if (sMultiMove != NULL)
        Free(sMultiMove);
}

static void MultiMove_SetFunction(u8 funcId)
{
    sMultiMove->funcId = funcId;
    sMultiMove->state = 0;
}

static bool8 MultiMove_RunFunction(void)
{
    switch (sMultiMove->funcId)
    {
    case MULTIMOVE_START:
        return MultiMove_Function_Start();
    case MULTIMOVE_SINGLE:
        return MultiMove_Function_Single();
    case MULTIMOVE_CHANGE_SELECTION:
        return MultiMove_Function_ChangeSelection();
    case MULTIMOVE_GRAB_SELECTION:
        return MultiMove_Function_GrabSelection();
    case MULTIMOVE_MOVE_MONS:
        return MultiMove_Function_MoveMons();
    case MULTIMOVE_PLACE_MONS:
        return MultiMove_Function_PlaceMons();
    }

    return FALSE;
}

static bool8 MultiMove_Function_Start(void)
{
    switch (sMultiMove->state)
    {
    case 0:
        HideBg(0);
        TryLoadAllMonIconPalettesAtOffset(BG_PLTT_ID(8));
        sMultiMove->state++;
        break;
    case 1:
        GetCursorBoxColumnAndRow(&sMultiMove->fromColumn, &sMultiMove->fromRow);
        sMultiMove->toColumn = sMultiMove->fromColumn;
        sMultiMove->toRow = sMultiMove->fromRow;
        ChangeBgX(0, -1024, BG_COORD_SET);
        ChangeBgY(0, -1024, BG_COORD_SET);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
        FillWindowPixelBuffer8Bit(gStorage->multiMoveWindowId, PIXEL_FILL(0));
        MultiMove_SetIconToBg(sMultiMove->fromColumn, sMultiMove->fromRow);
        SetBgAttribute(0, BG_ATTR_PALETTEMODE, 1);
        PutWindowTilemap(gStorage->multiMoveWindowId);
        CopyWindowToVram8Bit(gStorage->multiMoveWindowId, COPYWIN_FULL);
        BlendPalettes(0x3F00, 8, RGB_WHITE);
        StartCursorAnim(CURSOR_ANIM_OPEN);
        SetGpuRegBits(REG_OFFSET_BG0CNT, BGCNT_256COLOR);
        sMultiMove->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 MultiMove_Function_Single(void)
{
    switch (sMultiMove->state)
    {
    case 0:
        HideBg(0);
        sMultiMove->state++;
        break;
    case 1:
        MultiMove_ResetBg();
        StartCursorAnim(CURSOR_ANIM_BOUNCE);
        sMultiMove->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            SetCursorPriorityTo1();
            LoadPalette(GetTextWindowPalette(3), BG_PLTT_ID(13), PLTT_SIZE_4BPP);
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 MultiMove_Function_ChangeSelection(void)
{
    switch (sMultiMove->state)
    {
    case 0:
        if (!UpdateCursorPos())
        {
            GetCursorBoxColumnAndRow(&sMultiMove->cursorColumn, &sMultiMove->cursorRow);
            MultiMove_UpdateSelectedIcons();
            sMultiMove->toColumn = sMultiMove->cursorColumn;
            sMultiMove->toRow = sMultiMove->cursorRow;
            CopyWindowToVram8Bit(gStorage->multiMoveWindowId, COPYWIN_GFX);
            sMultiMove->state++;
        }
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 MultiMove_Function_GrabSelection(void)
{
    u8 movingBg, movingMon;

    switch (sMultiMove->state)
    {
    case 0:
        MultiMove_GetMonsFromSelection();
        MultiMove_RemoveMonsFromBox();
        InitMultiMonPlaceChange(FALSE);
        sMultiMove->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            StartCursorAnim(CURSOR_ANIM_FIST);
            MultiMove_InitBg(0, 256, 8);
            InitMultiMonPlaceChange(TRUE);
            sMultiMove->state++;
        }
        break;
    case 2:
        movingBg = MultiMove_UpdateBg();
        movingMon = DoMonPlaceChange();
        if (!movingBg && !movingMon)
            return FALSE;
        break;
    }

    return TRUE;
}

static bool8 MultiMove_Function_MoveMons(void)
{
    u8 movingCursor = UpdateCursorPos();
    u8 movingBg = MultiMove_UpdateBg();

    if (!movingCursor && !movingBg)
        return FALSE;
    else
        return TRUE;
}

static bool8 MultiMove_Function_PlaceMons(void)
{
    switch (sMultiMove->state)
    {
    case 0:
        MultiMove_SetPlacedMonData();
        MultiMove_InitBg(0, -256, 8);
        InitMultiMonPlaceChange(FALSE);
        sMultiMove->state++;
        break;
    case 1:
        if (!DoMonPlaceChange() && !MultiMove_UpdateBg())
        {
            MultiMove_CreatePlacedMonIcons();
            StartCursorAnim(CURSOR_ANIM_OPEN);
            InitMultiMonPlaceChange(TRUE);
            HideBg(0);
            sMultiMove->state++;
        }
        break;
    case 2:
        if (!DoMonPlaceChange())
        {
            StartCursorAnim(CURSOR_ANIM_BOUNCE);
            MultiMove_ResetBg();
            sMultiMove->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            LoadPalette(GetTextWindowPalette(3), BG_PLTT_ID(13), PLTT_SIZE_4BPP);
            SetCursorPriorityTo1();
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 MultiMove_TryMoveGroup(u8 dir)
{
    switch (dir)
    {
    case 0: // up
        if (sMultiMove->minRow == 0)
            return FALSE;
        sMultiMove->minRow--;
        MultiMove_InitBg(0, 1024, 6);
        break;
    case 1: // down
        if (sMultiMove->minRow + sMultiMove->rowsTotal >= 5)
            return FALSE;
        sMultiMove->minRow++;
        MultiMove_InitBg(0, -1024, 6);
        break;
    case 2: // left
        if (sMultiMove->minColumn == 0)
            return FALSE;
        sMultiMove->minColumn--;
        MultiMove_InitBg(1024, 0, 6);
        break;
    case 3: // right
        if (sMultiMove->minColumn + sMultiMove->columnsTotal > 5)
            return FALSE;
        sMultiMove->minColumn++;
        MultiMove_InitBg(-1024, 0, 6);
        break;
    }

    return TRUE;
}

static void MultiMove_UpdateSelectedIcons(void)
{
    s16 columnChange = (abs(sMultiMove->fromColumn - sMultiMove->cursorColumn)) - (abs(sMultiMove->fromColumn - sMultiMove->toColumn));
    s16 rowChange = (abs(sMultiMove->fromRow - sMultiMove->cursorRow)) - (abs(sMultiMove->fromRow - sMultiMove->toRow));

    if (columnChange > 0)
        MultiMove_SelectColumn(sMultiMove->cursorColumn, sMultiMove->fromRow, sMultiMove->toRow);

    if (columnChange < 0)
    {
        MultiMove_DeselectColumn(sMultiMove->toColumn, sMultiMove->fromRow, sMultiMove->toRow);
        MultiMove_SelectColumn(sMultiMove->cursorColumn, sMultiMove->fromRow, sMultiMove->toRow);
    }

    if (rowChange > 0)
        MultiMove_SelectRow(sMultiMove->cursorRow, sMultiMove->fromColumn, sMultiMove->toColumn);

    if (rowChange < 0)
    {
        MultiMove_DeselectRow(sMultiMove->toRow, sMultiMove->fromColumn, sMultiMove->toColumn);
        MultiMove_SelectRow(sMultiMove->cursorRow, sMultiMove->fromColumn, sMultiMove->toColumn);
    }
}

static void MultiMove_SelectColumn(u8 column, u8 minRow, u8 maxRow)
{
    u8 tmp = minRow;

    if (minRow > maxRow)
    {
        minRow = maxRow;
        maxRow = tmp;
    }

    while (minRow <= maxRow)
        MultiMove_SetIconToBg(column, minRow++);
}

static void MultiMove_SelectRow(u8 row, u8 minColumn, u8 maxColumn)
{
    u8 tmp = minColumn;

    if (minColumn > maxColumn)
    {
        minColumn = maxColumn;
        maxColumn = tmp;
    }

    while (minColumn <= maxColumn)
        MultiMove_SetIconToBg(minColumn++, row);
}

static void MultiMove_DeselectColumn(u8 column, u8 minRow, u8 maxRow)
{
    u8 tmp = minRow;

    if (minRow > maxRow)
    {
        minRow = maxRow;
        maxRow = tmp;
    }

    while (minRow <= maxRow)
        MultiMove_ClearIconFromBg(column, minRow++);
}

static void MultiMove_DeselectRow(u8 row, u8 minColumn, u8 maxColumn)
{
    u8 tmp = minColumn;

    if (minColumn > maxColumn)
    {
        minColumn = maxColumn;
        maxColumn = tmp;
    }

    while (minColumn <= maxColumn)
        MultiMove_ClearIconFromBg(minColumn++, row);
}

static void MultiMove_SetIconToBg(u8 x, u8 y)
{
    u8 position = x + (IN_BOX_COLUMNS * y);
    u16 species = GetCurrentBoxMonData(position, MON_DATA_SPECIES_OR_EGG);
    u32 personality = GetCurrentBoxMonData(position, MON_DATA_PERSONALITY);

    if (species != SPECIES_NONE)
    {
        const u8 *iconGfx = GetMonIconPtr(species, personality);
        u8 palNum = GetValidMonIconPalIndex(species) + 8;
        BlitBitmapRectToWindow4BitTo8Bit(gStorage->multiMoveWindowId, iconGfx, 0, 0, 32, 32, 24 * x, 24 * y, 32, 32, palNum);
    }
}

static void MultiMove_ClearIconFromBg(u8 x, u8 y)
{
    u8 position = x + (IN_BOX_COLUMNS * y);
    u16 species = GetCurrentBoxMonData(position, MON_DATA_SPECIES_OR_EGG);

    if (species != SPECIES_NONE)
        FillWindowPixelRect8Bit(gStorage->multiMoveWindowId, PIXEL_FILL(0), 24 * x, 24 * y, 32, 32);
}

static void MultiMove_InitBg(u16 bgX, u16 bgY, u16 duration)
{
    sMultiMove->bgX = bgX;
    sMultiMove->bgY = bgY;
    sMultiMove->bgMoveSteps = duration;
}

static u8 MultiMove_UpdateBg(void)
{
    if (sMultiMove->bgMoveSteps != 0)
    {
        ChangeBgX(0, sMultiMove->bgX, BG_COORD_ADD);
        ChangeBgY(0, sMultiMove->bgY, BG_COORD_ADD);
        sMultiMove->bgMoveSteps--;
    }

    return sMultiMove->bgMoveSteps;
}

static void MultiMove_GetMonsFromSelection(void)
{
    s32 i, j;
    s32 columnCount, rowCount;
    u8 boxId;
    u8 monArrayId;

    sMultiMove->minColumn = min(sMultiMove->fromColumn, sMultiMove->toColumn);
    sMultiMove->minRow = min(sMultiMove->fromRow, sMultiMove->toRow);
    sMultiMove->columnsTotal = abs(sMultiMove->fromColumn - sMultiMove->toColumn) + 1;
    sMultiMove->rowsTotal = abs(sMultiMove->fromRow - sMultiMove->toRow) + 1;
    boxId = StorageGetCurrentBox();
    monArrayId = 0;
    columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            struct BoxPokemon *boxMon = GetBoxedMonPtr(boxId, boxPosition);
            // UB: possible null dereference
#ifdef UBFIX
            if (boxMon != NULL)
                sMultiMove->boxMons[monArrayId] = *boxMon;
#else
            sMultiMove->boxMons[monArrayId] = *boxMon;
#endif
            monArrayId++;
            boxPosition++;
        }
    }
}

static void MultiMove_RemoveMonsFromBox(void)
{
    s32 i, j;
    s32 columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    s32 rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    u8 boxId = StorageGetCurrentBox();

    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            DestroyBoxMonIconAtPosition(boxPosition);
            ZeroBoxMonAt(boxId, boxPosition);
            boxPosition++;
        }
    }
}

static void MultiMove_CreatePlacedMonIcons(void)
{
    s32 i, j;
    s32 columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    s32 rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    u8 monArrayId = 0;

    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            if (GetBoxMonData(&sMultiMove->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES))
                CreateBoxMonIconAtPos(boxPosition);
            monArrayId++;
            boxPosition++;
        }
    }
}

static void MultiMove_SetPlacedMonData(void)
{
    s32 i, j;
    s32 columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    s32 rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    u8 boxId = StorageGetCurrentBox();
    u8 monArrayId = 0;

    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            if (OW_PC_HEAL <= GEN_7)
                HealBoxPokemon(&sMultiMove->boxMons[monArrayId]);
            if (GetBoxMonData(&sMultiMove->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES))
                SetBoxMonAt(boxId, boxPosition, &sMultiMove->boxMons[monArrayId]);
            boxPosition++;
            monArrayId++;
        }
    }
}

static void MultiMove_ResetBg(void)
{
    ChangeBgX(0, 0, BG_COORD_SET);
    ChangeBgY(0, 0, BG_COORD_SET);
    SetBgAttribute(0, BG_ATTR_PALETTEMODE, 0);
    ClearGpuRegBits(REG_OFFSET_BG0CNT, BGCNT_256COLOR);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
    CopyBgTilemapBufferToVram(0);
}

static u8 MultiMove_GetOriginPosition(void)
{
    return (IN_BOX_COLUMNS * sMultiMove->fromRow) + sMultiMove->fromColumn;
}

static bool8 MultiMove_CanPlaceSelection(void)
{
    s32 i, j;
    s32 columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    s32 rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    u8 monArrayId = 0;

    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            if (GetBoxMonData(&sMultiMove->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES)
                && GetCurrentBoxMonData(boxPosition, MON_DATA_SANITY_HAS_SPECIES))
                return FALSE;

            monArrayId++;
            boxPosition++;
        }
    }

    return TRUE;
}


//------------------------------------------------------------------------------
//  SECTION: Item mode
//
//  The functions below handle the Move Items mode
//------------------------------------------------------------------------------


static const u32 sItemInfoFrame_Gfx[] = INCBIN_U32("graphics/pokemon_storage/item_info_frame.4bpp");

static const struct OamData sOamData_ItemIcon = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_Small[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_Appear[] = {
    AFFINEANIMCMD_FRAME(88, 88, 0, 0),
    AFFINEANIMCMD_FRAME(5, 5, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_Disappear[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(-5, -5, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_PickUp[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(10, 10, 0, 12),
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_PutDown[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(-10, -10, 0, 12),
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_PutAway[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(-5, -5, 0, 16),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_Large[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnims_ItemIcon[] = {
    [ITEM_ANIM_NONE]      = sAffineAnim_ItemIcon_Small,
    [ITEM_ANIM_APPEAR]    = sAffineAnim_ItemIcon_Appear,
    [ITEM_ANIM_DISAPPEAR] = sAffineAnim_ItemIcon_Disappear,
    [ITEM_ANIM_PICK_UP]   = sAffineAnim_ItemIcon_PickUp,
    [ITEM_ANIM_PUT_DOWN]  = sAffineAnim_ItemIcon_PutDown,
    [ITEM_ANIM_PUT_AWAY]  = sAffineAnim_ItemIcon_PutAway,
    [ITEM_ANIM_LARGE]     = sAffineAnim_ItemIcon_Large,
};

static const struct SpriteTemplate sSpriteTemplate_ItemIcon = {
    .tileTag = GFXTAG_ITEM_ICON_0,
    .paletteTag = PALTAG_ITEM_ICON_0,
    .oam = &sOamData_ItemIcon,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_ItemIcon,
    .callback = SpriteCallbackDummy,
};

static void CreateItemIconSprites(void)
{
    s32 i;
    u8 spriteId;
    struct CompressedSpriteSheet spriteSheet;
    struct SpriteTemplate spriteTemplate;
    static u32 sItemIconGfxBuffer[0x61];

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        spriteSheet.data = sItemIconGfxBuffer;
        spriteSheet.size = 0x200;
        spriteTemplate = sSpriteTemplate_ItemIcon;

        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            spriteSheet.tag = GFXTAG_ITEM_ICON_0 + i;
            LoadCompressedSpriteSheet(&spriteSheet);
            gStorage->itemIcons[i].tiles = GetSpriteTileStartByTag(spriteSheet.tag) * TILE_SIZE_4BPP + (void *)(OBJ_VRAM0);
            gStorage->itemIcons[i].palIndex = AllocSpritePalette(PALTAG_ITEM_ICON_0 + i);
            gStorage->itemIcons[i].palIndex = OBJ_PLTT_ID(gStorage->itemIcons[i].palIndex);
            spriteTemplate.tileTag = GFXTAG_ITEM_ICON_0 + i;
            spriteTemplate.paletteTag = PALTAG_ITEM_ICON_0 + i;
            spriteId = CreateSprite(&spriteTemplate, 0, 0, 11);
            gStorage->itemIcons[i].sprite = &gSprites[spriteId];
            gStorage->itemIcons[i].sprite->invisible = TRUE;
            gStorage->itemIcons[i].active = FALSE;
        }
    }
    gStorage->movingItemId = ITEM_NONE;
}

static void TryLoadItemIconAtPos(u8 cursorArea, u8 cursorPos)
{
    u16 heldItem;

    if ((gStorage->boxOption != OPTION_MOVE_ITEMS) || IsItemIconAtPosition(cursorArea, cursorPos))
        return;

    switch (cursorArea)
    {
    case CURSOR_AREA_IN_BOX:
        if (!GetCurrentBoxMonData(cursorPos, MON_DATA_SANITY_HAS_SPECIES))
            return;
        heldItem = GetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM);
        break;
    case CURSOR_AREA_IN_PARTY:
        if (!GetMonData(&gPlayerParty[cursorPos], MON_DATA_SANITY_HAS_SPECIES))
            return;
        heldItem = GetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM);
        break;
    default:
        return;
    }

    if (heldItem != ITEM_NONE)
    {
        const u32 *tiles = GetItemIconPic(heldItem);
        const u16 *pal = GetItemIconPalette(heldItem);
        u8 id = GetNewItemIconIdx();

        SetItemIconPosition(id, cursorArea, cursorPos);
        LoadItemIconGfx(id, tiles, pal);
        SetItemIconAffineAnim(id, ITEM_ANIM_APPEAR);
        SetItemIconActive(id, TRUE);
    }
}

static void TryHideItemIconAtPos(u8 cursorArea, u8 cursorPos)
{
    u8 id;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, ITEM_ANIM_DISAPPEAR);
    SetItemIconCallback(id, ITEM_CB_WAIT_ANIM, cursorArea, cursorPos);
}

static void Item_FromMonToMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    item = 0;
    SetItemIconAffineAnim(id, ITEM_ANIM_PICK_UP);
    SetItemIconCallback(id, ITEM_CB_TO_HAND, cursorArea, cursorPos);
    SetItemIconPosition(id, CURSOR_AREA_IN_HAND, 0);
    if (cursorArea  == CURSOR_AREA_IN_BOX)
    {
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &item);
        SetBoxMonIconObjMode(cursorPos, ST_OAM_OBJ_BLEND);
    }
    else
    {
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &item);
        SetPartyMonIconObjMode(cursorPos, ST_OAM_OBJ_BLEND);
    }

    gStorage->movingItemId = gStorage->displayMonItemId;
}

static void InitItemIconInCursor(u16 item)
{
    const u32 *tiles = GetItemIconPic(item);
    const u16 *pal = GetItemIconPalette(item);
    u8 id = GetNewItemIconIdx();

    LoadItemIconGfx(id, tiles, pal);
    SetItemIconAffineAnim(id, ITEM_ANIM_LARGE);
    SetItemIconCallback(id, ITEM_CB_TO_HAND, 0, 0);
    SetItemIconPosition(id, CURSOR_AREA_IN_HAND, 0);
    SetItemIconActive(id, TRUE);
    gStorage->movingItemId = item;
}

static void Item_SwitchMonsWithMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, ITEM_ANIM_PICK_UP);
    SetItemIconCallback(id, ITEM_CB_SWAP_TO_HAND, CURSOR_AREA_IN_HAND, 0);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        item = GetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM);
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &gStorage->movingItemId);
        gStorage->movingItemId = item;
    }
    else
    {
        item = GetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM);
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &gStorage->movingItemId);
        gStorage->movingItemId = item;
    }

    id = GetItemIconIdxByPosition(2, 0);
    SetItemIconAffineAnim(id, ITEM_ANIM_PUT_DOWN);
    SetItemIconCallback(id, ITEM_CB_SWAP_TO_MON, cursorArea, cursorPos);
}

static void Item_GiveMovingToMon(u8 cursorArea, u8 cursorPos)
{
    u8 id;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(2, 0);
    SetItemIconAffineAnim(id, ITEM_ANIM_PUT_DOWN);
    SetItemIconCallback(id, ITEM_CB_TO_MON, cursorArea, cursorPos);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &gStorage->movingItemId);
        SetBoxMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
    else
    {
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &gStorage->movingItemId);
        SetPartyMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
}

static void Item_TakeMons(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    item = ITEM_NONE;
    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, ITEM_ANIM_DISAPPEAR);
    SetItemIconCallback(id, ITEM_CB_WAIT_ANIM, cursorArea, cursorPos);
    if (cursorArea  == CURSOR_AREA_IN_BOX)
    {
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &item);
        SetBoxMonIconObjMode(cursorPos, ST_OAM_OBJ_BLEND);
    }
    else
    {
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &item);
        SetPartyMonIconObjMode(cursorPos, ST_OAM_OBJ_BLEND);
    }
}

static void MoveItemFromCursorToBag(void)
{
    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        u8 id = GetItemIconIdxByPosition(CURSOR_AREA_IN_HAND, 0);
        SetItemIconAffineAnim(id, ITEM_ANIM_PUT_AWAY);
        SetItemIconCallback(id, ITEM_CB_WAIT_ANIM, 2, 0);
    }
}

// The party menu is being closed, if the cursor is on
// a Pokémon that has a held item make sure it slides
// up along with the closing menu.
static void MoveHeldItemWithPartyMenu(void)
{
    s32 i;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active && gStorage->itemIcons[i].cursorArea == CURSOR_AREA_IN_PARTY)
            SetItemIconCallback(i, ITEM_CB_HIDE_PARTY, 2, 0);
    }
}

static bool8 IsItemIconAnimActive(void)
{
    s32 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active)
        {
            if (!gStorage->itemIcons[i].sprite->affineAnimEnded && gStorage->itemIcons[i].sprite->affineAnimBeginning)
                return TRUE;
            if (gStorage->itemIcons[i].sprite->callback != SpriteCallbackDummy && gStorage->itemIcons[i].sprite->callback != SpriteCB_ItemIcon_SetPosToCursor)
                return TRUE;
        }
    }

    return FALSE;
}

static bool8 IsActiveItemMoving(void)
{
    s32 i;

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            if (gStorage->itemIcons[i].active && gStorage->itemIcons[i].cursorArea == CURSOR_AREA_BOX_TITLE)
                return TRUE;
        }
    }

    return FALSE;
}

static const u8 *GetMovingItemName(void)
{
    return GetItemName(gStorage->movingItemId);
}

static u16 GetMovingItem(void)
{
    return gStorage->movingItemId;
}

static u8 GetNewItemIconIdx(void)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (!gStorage->itemIcons[i].active)
        {
            gStorage->itemIcons[i].active = TRUE;
            return i;
        }
    }

    return MAX_ITEM_ICONS;
}

static bool32 IsItemIconAtPosition(u8 cursorArea, u8 cursorPos)
{
    s32 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active
            && gStorage->itemIcons[i].cursorArea == cursorArea
            && gStorage->itemIcons[i].cursorPos == cursorPos)
            return TRUE;
    }

    return FALSE;
}

static u8 GetItemIconIdxByPosition(u8 cursorArea, u8 cursorPos)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active
            && gStorage->itemIcons[i].cursorArea == cursorArea
            && gStorage->itemIcons[i].cursorPos == cursorPos)
            return i;
    }

    return MAX_ITEM_ICONS;
}

static u8 GetItemIconIdxBySprite(struct Sprite *sprite)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active
            && gStorage->itemIcons[i].sprite == sprite)
            return i;
    }

    return MAX_ITEM_ICONS;
}

static void SetItemIconPosition(u8 id, u8 cursorArea, u8 cursorPos)
{
    u8 row, column;

    if (id >= MAX_ITEM_ICONS)
        return;

    switch (cursorArea)
    {
    case CURSOR_AREA_IN_BOX:
        row = cursorPos % IN_BOX_COLUMNS;
        column = cursorPos / IN_BOX_COLUMNS;
        gStorage->itemIcons[id].sprite->x = (24 * row) + 112;
        gStorage->itemIcons[id].sprite->y = (24 * column) + 56;
        gStorage->itemIcons[id].sprite->oam.priority = 2;
        break;
    case CURSOR_AREA_IN_PARTY:
        if (cursorPos == 0)
        {
            gStorage->itemIcons[id].sprite->x = 116;
            gStorage->itemIcons[id].sprite->y = 76;
        }
        else
        {
            gStorage->itemIcons[id].sprite->x = 164;
            gStorage->itemIcons[id].sprite->y = 24 * (cursorPos - 1) + 28;
        }
        gStorage->itemIcons[id].sprite->oam.priority = 1;
        break;
    }

    gStorage->itemIcons[id].cursorArea = cursorArea;
    gStorage->itemIcons[id].cursorPos = cursorPos;
}

static void LoadItemIconGfx(u8 id, const u32 *itemTiles, const u16 *itemPal)
{
    s32 i;

    if (id >= MAX_ITEM_ICONS)
        return;

    CpuFastFill(0, gStorage->itemIconBuffer, 0x200);
    LZ77UnCompWram(itemTiles, gStorage->tileBuffer);
    for (i = 0; i < 3; i++)
        CpuFastCopy(gStorage->tileBuffer + (i * 0x60), gStorage->itemIconBuffer + (i * 0x80), 0x60);

    CpuFastCopy(gStorage->itemIconBuffer, gStorage->itemIcons[id].tiles, 0x200);
    LoadPalette(itemPal, gStorage->itemIcons[id].palIndex, PLTT_SIZE_4BPP);
}

static void SetItemIconAffineAnim(u8 id, u8 animNum)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    StartSpriteAffineAnim(gStorage->itemIcons[id].sprite, animNum);
}

#define sItemIconId data[0]
#define sState      data[0]
#define sCursorArea data[6]
#define sCursorPos  data[7]

static void SetItemIconCallback(u8 id, u8 callbackId, u8 cursorArea, u8 cursorPos)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    switch (callbackId)
    {
    case ITEM_CB_WAIT_ANIM:
        gStorage->itemIcons[id].sprite->sItemIconId = id;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_WaitAnim;
        break;
    case ITEM_CB_TO_HAND:
        gStorage->itemIcons[id].sprite->sState = 0;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_ToHand;
        break;
    case ITEM_CB_TO_MON:
        gStorage->itemIcons[id].sprite->sState = 0;
        gStorage->itemIcons[id].sprite->sCursorArea = cursorArea;
        gStorage->itemIcons[id].sprite->sCursorPos = cursorPos;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_ToMon;
        break;
    case ITEM_CB_SWAP_TO_HAND:
        gStorage->itemIcons[id].sprite->sState = 0;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_SwapToHand;
        gStorage->itemIcons[id].sprite->sCursorArea = cursorArea;
        gStorage->itemIcons[id].sprite->sCursorPos = cursorPos;
        break;
    case ITEM_CB_SWAP_TO_MON:
        gStorage->itemIcons[id].sprite->sState = 0;
        gStorage->itemIcons[id].sprite->sCursorArea = cursorArea;
        gStorage->itemIcons[id].sprite->sCursorPos = cursorPos;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_SwapToMon;
        break;
    case ITEM_CB_HIDE_PARTY:
        // If cursor is on a Pokémon with a held item and
        // the player closes the party menu, have the held
        // item follow the Pokémon as the menu slides out
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_HideParty;
        break;
    }
}

static void SetItemIconActive(u8 id, bool8 show)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    gStorage->itemIcons[id].active = show;
    gStorage->itemIcons[id].sprite->invisible = (show == FALSE);
}

static void PrintItemDescription(void)
{
    const u8 *description;

    if (IsActiveItemMoving())
        description = GetItemDescription(gStorage->movingItemId);
    else
        description = GetItemDescription(gStorage->displayMonItemId);

    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    AddTextPrinterParameterized5(2, FONT_NORMAL, description, 2, 0, 0, NULL, 0, 0);
}

static void InitItemInfoWindow(void)
{
    gStorage->itemInfoWindowOffset = 25;
    LoadBgTiles(0, sItemInfoFrame_Gfx, 0x80, 0x1A4);
    DrawItemInfoWindow(0);
}

static bool8 UpdateItemInfoWindowSlideIn(void)
{
    s32 i, pos;

    if (gStorage->itemInfoWindowOffset == 0)
        return FALSE;

    gStorage->itemInfoWindowOffset--;
    pos = 25 - gStorage->itemInfoWindowOffset;
    for (i = 0; i < pos; i++)
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + gStorage->itemInfoWindowOffset + i, i, 12, 1, 8, 15, 25);

    DrawItemInfoWindow(pos);
    return (gStorage->itemInfoWindowOffset != 0);
}

static bool8 UpdateItemInfoWindowSlideOut(void)
{
    s32 i, pos;

    if (gStorage->itemInfoWindowOffset == 25)
        return FALSE;

    if (gStorage->itemInfoWindowOffset == 0)
        FillBgTilemapBufferRect(0, 0, 25, 11, 1, 10, 17);

    gStorage->itemInfoWindowOffset++;
    pos = 25 - gStorage->itemInfoWindowOffset;
    for (i = 0; i < pos; i++)
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + gStorage->itemInfoWindowOffset + i, i, 12, 1, 8, 15, 25);

    DrawItemInfoWindow(pos);

    FillBgTilemapBufferRect(0, 0, pos, 11, 1, 10, 17);
    return (gStorage->itemInfoWindowOffset != 25);
}

static void DrawItemInfoWindow(u32 x)
{
    if (x != 0)
    {
        FillBgTilemapBufferRect(0, 0x1A4, 0, 0xB, x, 1, 15);
        FillBgTilemapBufferRect(0, 0x9A4, 0, 0x14, x, 1, 15);
    }
    FillBgTilemapBufferRect(0, 0x1A5, x, 0xC, 1, 8, 15);
    FillBgTilemapBufferRect(0, 0x1A6, x, 0xB, 1, 1, 15);
    FillBgTilemapBufferRect(0, 0x1A7, x, 0x14, 1, 1, 15);
    ScheduleBgCopyTilemapToVram(0);
}

static void SpriteCB_ItemIcon_WaitAnim(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        SetItemIconActive(sprite->sItemIconId, FALSE);
        sprite->callback = SpriteCallbackDummy;
    }
}

static void SpriteCB_ItemIcon_ToHand(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->sState++;
    case 1:
        sprite->data[1] -= sprite->data[3];
        sprite->data[2] -= sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        if (++sprite->data[5] > 11)
            sprite->callback = SpriteCB_ItemIcon_SetPosToCursor;
        break;
    }
}

static void SpriteCB_ItemIcon_SetPosToCursor(struct Sprite *sprite)
{
    sprite->x = gStorage->cursorSprite->x + 4;
    sprite->y = gStorage->cursorSprite->y + gStorage->cursorSprite->y2 + 8;
    sprite->oam.priority = gStorage->cursorSprite->oam.priority;
}

static void SpriteCB_ItemIcon_ToMon(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->sState++;
    case 1:
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        if (++sprite->data[5] > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->sCursorArea, sprite->sCursorPos);
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

static void SpriteCB_ItemIcon_SwapToHand(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->sState++;
    case 1:
        sprite->data[1] -= sprite->data[3];
        sprite->data[2] -= sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        sprite->x2 = gSineTable[sprite->data[5] * 8] >> 4;
        if (++sprite->data[5] > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->sCursorArea, sprite->sCursorPos);
            sprite->x2 = 0;
            sprite->callback = SpriteCB_ItemIcon_SetPosToCursor;
        }
        break;
    }
}

static void SpriteCB_ItemIcon_SwapToMon(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->sState++;
    case 1:
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        sprite->x2 = -(gSineTable[sprite->data[5] * 8] >> 4);
        if (++sprite->data[5] > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->sCursorArea, sprite->sCursorPos);
            sprite->callback = SpriteCallbackDummy;
            sprite->x2 = 0;
        }
        break;
    }
}

static void SpriteCB_ItemIcon_HideParty(struct Sprite *sprite)
{
    sprite->y -= 8;
    if (sprite->y + sprite->y2 < -16)
    {
        sprite->callback = SpriteCallbackDummy;
        SetItemIconActive(GetItemIconIdxBySprite(sprite), FALSE);
    }
}

#undef sState
#undef sItemIconId
#undef sCursorArea
#undef sCursorPos


//------------------------------------------------------------------------------
//  SECTION: General utility
//------------------------------------------------------------------------------

void BackupPokemonStorage(struct PokemonStorage * dest)
{
    *dest = *gPokemonStoragePtr;
}

void RestorePokemonStorage(struct PokemonStorage * src)
{
    *gPokemonStoragePtr = *src;
}

// Functions here are general utility functions.
u8 StorageGetCurrentBox(void)
{
    return gPokemonStoragePtr->currentBox;
}

static void SetCurrentBox(u8 boxId)
{
    if (boxId < TOTAL_BOXES_COUNT)
        gPokemonStoragePtr->currentBox = boxId;
}

u32 GetBoxMonDataAt(u8 boxId, u8 boxPosition, s32 request)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        return GetBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition], request);
    else
        return 0;
}

void SetBoxMonDataAt(u8 boxId, u8 boxPosition, s32 request, const void *value)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        SetBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition], request, value);
}

u32 GetCurrentBoxMonData(u8 boxPosition, s32 request)
{
    return GetBoxMonDataAt(gPokemonStoragePtr->currentBox, boxPosition, request);
}

void SetCurrentBoxMonData(u8 boxPosition, s32 request, const void *value)
{
    SetBoxMonDataAt(gPokemonStoragePtr->currentBox, boxPosition, request, value);
}

void GetBoxMonNickAt(u8 boxId, u8 boxPosition, u8 *dst)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        GetBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition], MON_DATA_NICKNAME, dst);
    else
        *dst = EOS;
}

void SetBoxMonNickAt(u8 boxId, u8 boxPosition, const u8 *nick)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        SetBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition], MON_DATA_NICKNAME, nick);
}

u32 GetAndCopyBoxMonDataAt(u8 boxId, u8 boxPosition, s32 request, void *dst)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        return GetBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition], request, dst);
    else
        return 0;
}

void SetBoxMonAt(u8 boxId, u8 boxPosition, struct BoxPokemon * src)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        gPokemonStoragePtr->boxes[boxId][boxPosition] = *src;
}

void CopyBoxMonAt(u8 boxId, u8 boxPosition, struct BoxPokemon * dst)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        *dst = gPokemonStoragePtr->boxes[boxId][boxPosition];
}

void ZeroBoxMonAt(u8 boxId, u8 boxPosition)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        ZeroBoxMonData(&gPokemonStoragePtr->boxes[boxId][boxPosition]);
}

void BoxMonAtToMon(u8 boxId, u8 boxPosition, struct Pokemon * dst)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        BoxMonToMon(&gPokemonStoragePtr->boxes[boxId][boxPosition], dst);
}

struct BoxPokemon * GetBoxedMonPtr(u8 boxId, u8 boxPosition)
{
    if (boxId < TOTAL_BOXES_COUNT && boxPosition < IN_BOX_COUNT)
        return &gPokemonStoragePtr->boxes[boxId][boxPosition];
    else
        return NULL;
}

u8 *GetBoxNamePtr(u8 boxId)
{
    if (boxId < TOTAL_BOXES_COUNT)
        return gPokemonStoragePtr->boxNames[boxId];
    else
        return NULL;
}

static u8 GetBoxWallpaper(u8 boxId)
{
    if (boxId < TOTAL_BOXES_COUNT)
        return gPokemonStoragePtr->boxWallpapers[boxId];
    else
        return 0;
}

static void SetBoxWallpaper(u8 boxId, u8 wallpaperId)
{
    if (boxId < TOTAL_BOXES_COUNT && wallpaperId < WALLPAPER_COUNT)
        gPokemonStoragePtr->boxWallpapers[boxId] = wallpaperId;
}

s16 SeekToNextMonInBox(struct BoxPokemon * boxMons, s8 curIndex, u8 maxIndex, u8 flags)
{
    // flags:
    // bit 0: Allow eggs
    // bit 1: Search backwards
    s16 i;
    s16 adder;
    if (flags == 0 || flags == 1)
        adder = 1;
    else
        adder = -1;

    if (flags == 1 || flags == 3)
    {
        for (i = curIndex + adder; i >= 0 && i <= maxIndex; i += adder)
        {
            if (GetBoxMonData(&boxMons[i], MON_DATA_SPECIES) != SPECIES_NONE)
                return i;
        }
    }
    else
    {
        for (i = curIndex + adder; i >= 0 && i <= maxIndex; i += adder)
        {
            if (GetBoxMonData(&boxMons[i], MON_DATA_SPECIES) != SPECIES_NONE
                && !GetBoxMonData(&boxMons[i], MON_DATA_IS_EGG))
                return i;
        }
    }

    return -1;
}


//------------------------------------------------------------------------------
//  SECTION: TilemapUtil
//
//  Handles 3 particular tilemaps in a somewhat unusual way.
//  For example, while the cursor is on the Close Box button it flashes between
//  two states alternately. Both these states are their own part of the same
//  tilemap that's always present. The utility shifts the tilemap up and down
//  to show/hide the states, and limits the view with a rectangle that only
//  reveals one at a time.
//  Each tilemap is tracked with a TILEMAPID that can be used to reference it.
//------------------------------------------------------------------------------


struct TilemapUtil_RectData
{
    s16 x;
    s16 y;
    u16 width;
    u16 height;
    s16 destX;
    s16 destY;
};

struct TilemapUtil
{
    struct TilemapUtil_RectData prev; // Only read in unused function
    struct TilemapUtil_RectData cur;
    const void *savedTilemap; // Only written in unused function
    const void *tilemap;
    u16 altWidth; // Never read
    u16 altHeight; // Never read
    u16 width;
    u16 height;
    u16 rowSize; // Never read
    u8 tileSize;
    u8 bg;
    bool8 active; // Only read in unused function
};

static EWRAM_DATA struct TilemapUtil *sTilemapUtil = NULL;
static EWRAM_DATA u16 sNumTilemapUtilIds = 0;

static void TilemapUtil_Init(u8 numTilemapIds)
{
    u16 i;
    sTilemapUtil = Alloc(numTilemapIds * sizeof(struct TilemapUtil));
    sNumTilemapUtilIds = sTilemapUtil == NULL ? 0 : numTilemapIds;
    for (i = 0; i < sNumTilemapUtilIds; i++)
    {
        sTilemapUtil[i].savedTilemap = NULL;
        sTilemapUtil[i].active = FALSE;
    }
}

static void TilemapUtil_Free(void)
{
    Free(sTilemapUtil);
}

// Unused
static void UNUSED TilemapUtil_UpdateAll(void)
{
    int i;

    for (i = 0; i < sNumTilemapUtilIds; i++)
    {
        if (sTilemapUtil[i].active == TRUE)
            TilemapUtil_Update(i);
    }
}

static const struct {
    u16 width;
    u16 height;
} sTilemapDimensions[2][4] = {
    {
        { 256,  256},
        { 512,  256},
        { 256,  512},
        { 512,  512}
    }, {
        { 128,  128},
        { 256,  256},
        { 512,  512},
        {1024, 1024}
    }
};

static void TilemapUtil_SetTilemap(u8 tilemapId, u8 bg, const void *tilemap, u16 width, u16 height)
{
    u16 screenSize;
    u16 bgType;

    if (tilemapId < sNumTilemapUtilIds)
    {
        sTilemapUtil[tilemapId].savedTilemap = NULL;
        sTilemapUtil[tilemapId].tilemap = tilemap;
        sTilemapUtil[tilemapId].bg = bg;
        sTilemapUtil[tilemapId].width = width;
        sTilemapUtil[tilemapId].height = height;

        screenSize = GetBgAttribute(bg, BG_ATTR_SCREENSIZE);
        bgType = GetBgAttribute(bg, BG_ATTR_TYPE);
        sTilemapUtil[tilemapId].altWidth = sTilemapDimensions[bgType][screenSize].width;
        sTilemapUtil[tilemapId].altHeight = sTilemapDimensions[bgType][screenSize].height;
        if (bgType != 0)
            sTilemapUtil[tilemapId].tileSize = 1;
        else
            sTilemapUtil[tilemapId].tileSize = 2;
        sTilemapUtil[tilemapId].rowSize = width * sTilemapUtil[tilemapId].tileSize;
        sTilemapUtil[tilemapId].cur.width = width;
        sTilemapUtil[tilemapId].cur.height = height;
        sTilemapUtil[tilemapId].cur.x = 0;
        sTilemapUtil[tilemapId].cur.y = 0;
        sTilemapUtil[tilemapId].cur.destX = 0;
        sTilemapUtil[tilemapId].cur.destY = 0;
        sTilemapUtil[tilemapId].prev = sTilemapUtil[tilemapId].cur;
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

// Unused
static void UNUSED TilemapUtil_SetSavedMap(u8 tilemapId, const void *tilemap)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        sTilemapUtil[tilemapId].savedTilemap = tilemap;
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

static void TilemapUtil_SetPos(u8 tilemapId, u16 destX, u16 destY)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        sTilemapUtil[tilemapId].cur.destX = destX;
        sTilemapUtil[tilemapId].cur.destY = destY;
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

static void TilemapUtil_SetRect(u8 tilemapId, u16 x, u16 y, u16 width, u16 height)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        sTilemapUtil[tilemapId].cur.x = x;
        sTilemapUtil[tilemapId].cur.y = y;
        sTilemapUtil[tilemapId].cur.width = width;
        sTilemapUtil[tilemapId].cur.height = height;
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

static void TilemapUtil_Move(u8 tilemapId, u8 mode, s8 param)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        switch (mode)
        {
        case 0:
            sTilemapUtil[tilemapId].cur.destX += param;
            sTilemapUtil[tilemapId].cur.width -= param;
            break;
        case 1:
            sTilemapUtil[tilemapId].cur.x += param;
            sTilemapUtil[tilemapId].cur.width += param;
            break;
        case 2:
            sTilemapUtil[tilemapId].cur.destY += param;
            sTilemapUtil[tilemapId].cur.height -= param;
            break;
        case 3: // this is the only mode ever used
            sTilemapUtil[tilemapId].cur.y -= param;
            sTilemapUtil[tilemapId].cur.height += param;
            break;
        case 4:
            sTilemapUtil[tilemapId].cur.destX += param;
            break;
        case 5:
            sTilemapUtil[tilemapId].cur.destY += param;
            break;
        }
        sTilemapUtil[tilemapId].active = TRUE;
    }
}

static void TilemapUtil_Update(u8 tilemapId)
{
    if (tilemapId < sNumTilemapUtilIds)
    {
        if (sTilemapUtil[tilemapId].savedTilemap != NULL) // Always false
            TilemapUtil_DrawPrev(tilemapId);
        TilemapUtil_Draw(tilemapId);
        sTilemapUtil[tilemapId].prev = sTilemapUtil[tilemapId].cur;
    }
}

// Never called, see TilemapUtil_Update
static void TilemapUtil_DrawPrev(u8 tilemapId)
{
    int i;
    int rowSize = sTilemapUtil[tilemapId].tileSize * sTilemapUtil[tilemapId].altWidth;
    const void *tiles = sTilemapUtil[tilemapId].savedTilemap
                        + rowSize * sTilemapUtil[tilemapId].prev.destY
                        + sTilemapUtil[tilemapId].prev.destX * sTilemapUtil[tilemapId].tileSize;
    for (i = 0; i < sTilemapUtil[tilemapId].prev.height; i++)
    {
        CopyToBgTilemapBufferRect(sTilemapUtil[tilemapId].bg,
                                  tiles,
                                  sTilemapUtil[tilemapId].prev.destX,
                                  sTilemapUtil[tilemapId].prev.destY + i,
                                  sTilemapUtil[tilemapId].prev.width,
                                  1);
        tiles += rowSize;
    }
}

static void TilemapUtil_Draw(u8 tilemapId)
{
    int i;
    int rowSize = sTilemapUtil[tilemapId].tileSize * sTilemapUtil[tilemapId].width;
    const void *tiles = sTilemapUtil[tilemapId].tilemap
                        + rowSize * sTilemapUtil[tilemapId].cur.y
                        + sTilemapUtil[tilemapId].cur.x * sTilemapUtil[tilemapId].tileSize;
    for (i = 0; i < sTilemapUtil[tilemapId].cur.height; i++)
    {
        CopyToBgTilemapBufferRect(sTilemapUtil[tilemapId].bg,
                                  tiles,
                                  sTilemapUtil[tilemapId].cur.destX,
                                  sTilemapUtil[tilemapId].cur.destY + i,
                                  sTilemapUtil[tilemapId].cur.width,
                                  1);
        tiles += rowSize;
    }
}
