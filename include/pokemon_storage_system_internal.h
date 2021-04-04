#ifndef GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
#define GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H

#include "pokemon_storage_system.h"
#include "mon_markings.h"

#define IN_BOX_COLUMNS 5
#define IN_BOX_ROWS    6

#define MAX_MON_ICONS 40
#define MAX_ITEM_ICONS 3
#define MAX_MENU_ITEMS 7

enum
{
    MODE_PARTY,
    MODE_BOX,
    MODE_2,
};

enum
{
    BOX_OPTION_WITHDRAW,
    BOX_OPTION_DEPOSIT,
    BOX_OPTION_MOVE_MONS,
    BOX_OPTION_MOVE_ITEMS,
    BOX_OPTION_EXIT,
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

enum
{
    PC_TEXT_CANCEL,
    PC_TEXT_STORE,
    PC_TEXT_WITHDRAW,
    PC_TEXT_MOVE,
    PC_TEXT_SHIFT,
    PC_TEXT_PLACE,
    PC_TEXT_SUMMARY,
    PC_TEXT_RELEASE,
    PC_TEXT_MARK,
    PC_TEXT_JUMP,
    PC_TEXT_WALLPAPER,
    PC_TEXT_NAME,
    PC_TEXT_TAKE,
    PC_TEXT_GIVE,
    PC_TEXT_GIVE2,
    PC_TEXT_SWITCH,
    PC_TEXT_BAG,
    PC_TEXT_INFO,
    PC_TEXT_SCENERY1,
    PC_TEXT_SCENERY2,
    PC_TEXT_SCENERY3,
    PC_TEXT_ETCETERA,
    PC_TEXT_FOREST,
    PC_TEXT_CITY,
    PC_TEXT_DESERT,
    PC_TEXT_SAVANNA,
    PC_TEXT_CRAG,
    PC_TEXT_VOLCANO,
    PC_TEXT_SNOW,
    PC_TEXT_CAVE,
    PC_TEXT_BEACH,
    PC_TEXT_SEAFLOOR,
    PC_TEXT_RIVER,
    PC_TEXT_SKY,
    PC_TEXT_POLKADOT,
    PC_TEXT_POKECENTER,
    PC_TEXT_MACHINE,
    PC_TEXT_SIMPLE,
};

enum
{
    CURSOR_AREA_IN_BOX,
    CURSOR_AREA_IN_PARTY,
    CURSOR_AREA_BOX,
    CURSOR_AREA_BUTTONS, // Party Pokemon and Close Box
};

enum
{
    SCREEN_CHANGE_EXIT_BOX,
    SCREEN_CHANGE_SUMMARY_SCREEN,
    SCREEN_CHANGE_NAME_BOX,
    SCREEN_CHANGE_ITEM_FROM_BAG,
};

#define TAG_PAL_WAVEFORM    0xDACA
#define TAG_PAL_DAC8        0xDAC8
#define TAG_PAL_DAC6        0xDAC6
#define TAG_PAL_DACE        0xDACE
#define TAG_PAL_DAC7        0xDAC7
#define TAG_PAL_DAC9        0xDAC9
#define TAG_PAL_DAC0        0xDAC0
#define TAG_PAL_DACB        0xDACB

#define TAG_TILE_WAVEFORM   0x5
#define TAG_TILE_10         0x10
#define TAG_TILE_2          0x2
#define TAG_TILE_D          0xD
#define TAG_TILE_A          0xA
#define TAG_TILE_3          0x3
#define TAG_TILE_4          0x4
#define TAG_TILE_12         0x12
#define TAG_TILE_7          0x7
#define TAG_TILE_0          0x0
#define TAG_TILE_1          0x1
#define TAG_TILE_6          0x6

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

struct UnkPSSStruct_2002370
{
    struct Sprite *unk_0000;
    struct Sprite *unk_0004[4];
    u32 unk_0014[3]; // unused
    struct Sprite *unk_0020[2];
    u8 buffer[0x200]; // passed but not used
    u8 strbuf[20];
    bool32 loadPal;
    u16 tilesTag;
    u16 paletteTag;
    u8 curBox;
    u8 unk_0245; // unused
    u8 subpriority;
};

struct StorageMenu
{
    const u8 *text;
    int textId;
};

struct UnkStruct_2000028
{
    const u8 *unk_00;
    u8 *unk_04;
    u16 unk_08;
    u16 unk_0a;
    u16 newField;
    void (*unk_0c)(struct UnkStruct_2000028 *data);
};

struct UnkStruct_2000020
{
    struct UnkStruct_2000028 *unk_00;
    u8 unk_04;
    u8 unk_05;
};

struct PSS_ItemIconSprite
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
    bool8 isReshowingPSS;
    u8 taskId;
    struct UnkStruct_2000020 unk_0020;
    struct UnkStruct_2000028 unk_0028[8];
    u16 field_B0[528 / 2];
    u16 field_2C0;
    u16 field_2C2;
    u8 field_2C4;
    u8 field_2C5;
    u8 showPartyMenuState;
    bool8 unk_02C7;
    u8 unk_02C8;
    bool8 unk_02C9;
    s16 newCurrBoxId;
    u16 bg2_X;
    s16 field_2CE;
    u16 field_2D0;
    u8 field_2D2;
    u8 field_2D3;
    u8 field_2D4;
    u16 field_2D6;
    s16 field_2D8;
    u16 field_2DA;
    u16 field_2DC;
    u16 field_2DE;
    u16 field_2E0;
    u8 filler[22];
    u8 field_2F8[512];
    u8 field_4F8[512];
    u8 field_6F8;
    u8 field_6F9;
    u8 field_6FA;
    s8 field_6FB;
    u16 field_6FC[16];
    u16 field_71C;
    u16 field_71E;
    struct Sprite *field_720[2];
    struct Sprite *field_728[2];
    struct Sprite *field_730[2];
    u32 field_738;
    u8 field_73C[80];
    u16 field_78C;
    s16 wallpaperSetId;
    s16 wallpaperId;
    u16 field_792[360];
    u8 wallpaperChangeState;
    u8 field_A63;
    u8 field_A64;
    s8 field_A65;
    // u8 *wallpaperTiles; // used only in Emerald for Walda
    /* 0a68 */ struct Sprite *movingMonSprite;
    /* 0a6c */ struct Sprite *partySprites[PARTY_SIZE];
    /* 0a84 */ struct Sprite *boxMonsSprites[IN_BOX_COUNT];
    /* 0afc */ struct Sprite **field_B00;
    /* 0b00 */ struct Sprite **field_B04;
    /* 0b04 */ u16 field_B08[MAX_MON_ICONS];
    /* 0b54 */ u16 field_B58[MAX_MON_ICONS];
    /* 0ba4 */ u16 boxSpecies[IN_BOX_COUNT];
    /* 0be0 */ u32 boxPersonalities[IN_BOX_COUNT];
    /* 0c58 */ u8 field_C5C;
    /* 0c59 */ u8 field_C5D;
    /* 0c5a */ u8 field_C5E;
    /* 0c5c */ u16 field_C60;
    /* 0c5e */ s16 field_C62;
    /* 0c60 */ s16 field_C64;
    /* 0c62 */ u16 field_C66;
    /* 0c64 */ u8 field_C68;
    /* 0c65 */ s8 field_C69;
    /* 0c66 */ u8 field_C6A;
    /* 0c67 */ u8 field_C6B;
    /* 0c68 */ struct WindowTemplate menuWindow;
    /* 0c70 */ struct StorageMenu menuItems[MAX_MENU_ITEMS];
    /* 0ca8 */ u8 menuItemsCount;
    /* 0ca9 */ u8 menuWidth;
    /* 0caa */ u8 field_CAE;
    /* 0cac */ u16 field_CB0;
    /* 0cb0 */ struct Sprite *field_CB4;
    /* 0cb4 */ struct Sprite *field_CB8;
    /* 0cb8 */ s32 field_CBC;
    /* 0cbc */ s32 field_CC0;
    /* 0cc0 */ u32 field_CC4;
    /* 0cc4 */ u32 field_CC8;
    /* 0cc8 */ s16 field_CCC;
    /* 0cca */ s16 field_CCE;
    /* 0ccc */ u16 field_CD0;
    /* 0cce */ s8 field_CD2;
    /* 0ccf */ s8 field_CD3;
    /* 0cd0 */ u8 field_CD4;
    /* 0cd1 */ u8 field_CD5;
    /* 0cd2 */ u8 field_CD6;
    /* 0cd3 */ u8 field_CD7;
    /* 0cd4 */ u8 field_CD8[2];
    /* 0cd8 */ const u32 *cursorMonPalette;
    /* 0cdc */ u32 cursorMonPersonality;
    /* 0ce0 */ u16 cursorMonSpecies;
    /* 0ce2 */ u16 cursorMonItem;
    /* 0ce4 */ u16 field_CE8;
    /* 0ce6 */ bool8 setMosaic;
    /* 0ce7 */ u8 cursorMonMarkings;
    /* 0ce8 */ u8 cursorMonLevel;
    /* 0ce9 */ bool8 cursorMonIsEgg;
    /* 0cea */ u8 cursorMonNick[POKEMON_NAME_LENGTH + 1];
    /* 0cf5 */ u8 cursorMonTexts[4][36];
    /* 0d88 */ bool8 (*monPlaceChangeFunc)(void);
    /* 0d8c */ u8 monPlaceChangeState;
    /* 0d8d */ u8 field_D91;
    /* 0d90 */ struct Sprite *monMarkingSprite;
    /* 0d94 */ struct Sprite *field_D98[2];
    /* 0d9c */ u16 *monMarkingSpriteTileStart;
    /* 0da0 */ struct PokemonMarkMenu field_DA4;
    /* 1e58 */ struct UnkPSSStruct_2002370 field_1E5C;
    /* 20a0 */ struct Pokemon movingMon;
    /* 2104 */ struct Pokemon field_2108;
    /* 2168 */ u8 field_216C;
    /* 2169 */ u8 field_216D;
    /* 216c */ bool8 isSurfMon;
    /* 216d */ bool8 isDiveMon;
    /* 216a */ s8 field_216E;
    /* 216b */ s8 field_216F;
    /* 216e */ s8 field_2170;
    /* 216f */ s8 field_2171;
    /* 2170 */ u16 field_2172;
    /* 2172 */ u16 field_2176[3];
    /* 2178 */ u8 field_2186;
    /* 2179 */ u8 field_2187;
    /* 217a */ u8 summaryScreenMode;
    /* 217c */ union
    {
        struct Pokemon *mon;
        struct BoxPokemon *box;
    } field_218C;
    /* 2180 */ u8 field_2190[40];
    /* 21a8 */ u8 field_21B8[40];
    /* 21d0 */ u8 field_21E0[POKEMON_NAME_LENGTH + 1];
    /* 21db */ u8 itemName[20];
    /* 21ef */ u8 inBoxMovingMode;
    /* 21f0 */ u16 field_2200;
    /* 21f4 */ struct PSS_ItemIconSprite itemIconSprites[MAX_ITEM_ICONS];
    /* 2224 */ u16 movingItem;
    /* 2226 */ u16 field_2236;
    /* 2228 */ struct PssQuestLogBuffer qlogBuffer;
    /* 2230 */ u16 field_2238;
    /* 2232 */ u16 field_223A;
    /* 2234 */ u16 *field_223C;
    /* 2238 */ struct Sprite *cursorMonSprite;
    /* 223c */ u16 field_2244[0x40];
    /* 22bc */ u8 field_22C4[0x800];
    /* 2abc */ u8 field_2AC4[0x1800];
    /* 42bc */ u8 field_42C4[0x800];
    /* 4abc */ u8 field_4AC4[0x1000];
    /* 5abc */ u8 field_5AC4[0x800];
}; // size=62bc

extern struct PokemonStorageSystemData *gPSSData;

void Cb2_EnterPSS(u8 a0);
u8 GetCurrentBoxOption(void);
struct Sprite *sub_809223C(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority);
void SetBoxWallpaper(u8 boxId, u8 wallpaperId);
void SetCurrentBox(u8 boxId);
void BoxMonAtToMon(u8 boxId, u8 boxPosition, struct Pokemon * dst);
void SetBoxMonAt(u8 boxId, u8 boxPosition, struct BoxPokemon * src);

void Cb2_ExitPSS(void);
void FreeBoxSelectionPopupSpriteGfx(void);
void sub_808C940(u8 curBox);
void sub_808C950(void);
u8 HandleBoxChooseSelectionInput(void);
void LoadBoxSelectionPopupSpriteGfx(struct UnkPSSStruct_2002370 *a0, u16 tileTag, u16 palTag, u8 a3, bool32 loadPal);
void SetCurrentBoxMonData(u8 boxPosition, s32 request, const void *value);
u32 GetCurrentBoxMonData(u8 boxPosition, s32 request);
u32 GetAndCopyBoxMonDataAt(u8 boxId, u8 boxPosition, s32 request, void *dst);

void sub_80922C0(void);
void sub_8092340(void);
bool8 sub_80924A8(void);
void sub_8092AE4(void);
void sub_8092B3C(u8 a0);
void sub_8092B50(void);
void sub_8092B5C(void);
u8 sub_8092B70(void);
void sub_8092F54(void);
void sub_8093174(void);
void sub_8093194(void);
bool8 sub_80931EC(void);
void sub_8093264(void);
void sub_8093630(void);
void sub_8093660(void);
void sub_80936B8(void);
void sub_80937B4(void);
void sub_8094D14(u8 a0);
u8 sub_8094D34(void);
void sub_8094D60(void);
void sub_8094D84(void);
bool8 sub_8094F90(void);
s16 sub_8094F94(void);
void sub_8095024(void);
bool8 sub_8095050(void);
void sub_80950A4(void);
void sub_80950BC(u8 a0);
bool8 sub_80950D0(void);
void sub_8095B5C(void);
void sub_8096088(void);
void sub_80960C0(void);
bool8 sub_809610C(void);
const u8 *GetMovingItemName(void);
void sub_80966F4(void);
bool8 sub_8096728(void);
bool8 sub_80967C0(void);
void sub_8096BE4(struct UnkStruct_2000020 *arg0, struct UnkStruct_2000028 *arg1, u32 arg2);
void sub_8096BF8(void);
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
void sub_8095C84(u8 cursorArea, u8 cursorPos);
void sub_8095E2C(u16 itemId);
u8 GetBoxWallpaper(u8 boxId);
bool8 IsCursorOnBox(void);
bool8 IsCursorInBox(void);

void sub_808FFAC(void);
struct Sprite * CreateMonIconSprite(u16 species, u32 pid, s16 x, s16 y, u8 priority, u8 subpriority);
void CreatePartyMonsSprites(bool8 species);
void sub_80909F4(void);
bool8 sub_8090A60(void);
void sub_8090B98(s16 yDelta);
void DestroyAllPartyMonIcons(void);
void sub_8091114(void);
bool8 sub_8091150(void);
void sub_80913DC(u8 box);
bool8 sub_809140C(void);
void sub_80920FC(bool8 species);
void CreateMovingMonIcon(void);
void sub_8090E08(u8 boxId, u8 cursorPos);
bool8 sub_8090E74(void);
void sub_8090CC0(u8 cursorArea, u8 cursorPos);
void sub_8090D58(u8 cursorArea, u8 cursorPos);
void DestroyPartyMonIcon(u8 partyId);
void DestroyMovingMonIcon(void);
s16 GetFirstFreeBoxSpot(u8 boxId);
void sub_80901EC(u8 boxPosition);
void sub_8090FC4(u8 mode, u8 position);
bool8 sub_8091084(void);
void sub_80910CC(void);
u8 CountPartyMons(void);
u8 CountPartyAliveNonEggMonsExcept(u8 slotToIgnore);

s8 sub_8094E50(u8 a0);
bool8 sub_8095474(u8 action);
u8 sub_8095AA0(void);
bool8 sub_8095ABC(void);
void sub_8095D44(u8 cursorArea, u8 cursorPos);
void sub_8094CD4(u8 *arg0, u8 *arg1);
void sub_8094D40(void);
void sub_8092BAC(bool8 arg0);
void DestroyBoxMonIconAtPosition(u8 boxPosition);
void SetBoxMonIconObjMode(u8 cursorPos, u8 objMode);
void SetPartyMonIconObjMode(u8 cursorPos, u8 objMode);

#endif //GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
