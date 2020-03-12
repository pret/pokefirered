#ifndef GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
#define GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H

#include "pokemon_storage_system.h"
#include "mon_markings.h"

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

struct UnkPSSStruct_2002370
{
    struct Sprite *unk_0000;
    struct Sprite *unk_0004[4];
    u32 unk_0014[3];
    struct Sprite *unk_0020[2];
    u8 filler_0028[0x200];
    u8 unk_0228[20];
    u32 unk_023c;
    u16 unk_0240;
    u16 unk_0242;
    u8 curBox;
    u8 unk_0245;
    u8 unk_0246;
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

struct UnkStorageStruct
{
    struct Sprite *sprite;
    u8 *tiles;
    u16 palIndex;
    u8 unk8;
    u8 unk9;
    u8 unk10;
};

struct PssQuestLogBuffer
{
    u16 a0;
    u16 a2;
    u8 a4;
    u8 a5;
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
    u8 unk_02C7;
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
    u8 field_2F8[1024];
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
    /* 0b04 */ u16 field_B08[40];
    /* 0b54 */ u16 field_B58[40];
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
    /* 0c70 */ struct StorageMenu menuItems[7];
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
    /* 0cf5 */ u8 cursorMonNickText[36];
    /* 0d19 */ u8 cursorMonSpeciesName[36];
    /* 0d3d */ u8 cursorMonGenderLvlText[36];
    /* 0d61 */ u8 cursorMonItemName[36];
    /* 0d88 */ bool8 (*monPlaceChangeFunc)(void);
    /* 0d8c */ u8 monPlaceChangeState;
    /* 0d8d */ u8 field_D91;
    /* 0d90 */ struct Sprite *field_D94;
    /* 0d94 */ struct Sprite *field_D98[2];
    /* 0d9c */ u16 *field_DA0;
    /* 0da0 */ struct PokemonMarkMenu field_DA4;
    /* 1e58 */ struct UnkPSSStruct_2002370 field_1E5C;
    /* 20a0 */ struct Pokemon movingMon;
    /* 2104 */ struct Pokemon field_2108;
    /* 2168 */ s8 field_216C;
    /* 2169 */ u8 field_216D;
    /* 216a */ s8 field_216E;
    /* 216b */ s8 field_216F;
    /* 216c */ s8 field_2170;
    /* 216d */ s8 field_2171;
    /* 216e */ u8 field_2172;
    /* 216f */ u8 field_2173;
    /* 2170 */ u16 field_2174;
    /* 2172 */ u16 field_2176[3];
    /* 2178 */ u8 field_2186;
    /* 2179 */ u8 field_2187;
    /* 217a */ u8 field_2188;
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
    /* 21f4 */ struct UnkStorageStruct field_2204[3];
    /* 2224 */ u16 movingItem;
    /* 2226 */ u16 field_2236;
    /* 2228 */ struct PssQuestLogBuffer field_2238;
    /* 2230 */ u16 field_223A;
    /* 2234 */ u16 *field_223C;
    /* 2238 */ struct Sprite *cursorMonSprite;
    /* 223c */ u16 field_2244[0x40];
    /* 22bc */ u8 field_22C4[0x800];
    /* 2abc */ u8 field_2AC4[0x1800];
    /* 42bc */ u8 field_42C4[0x800];
    /* 4abc */ u8 field_4AC4[0x1000];
    /* 5abc */ u8 field_5AC4[0x800];
}; // size=62bc

extern struct PokemonStorageSystemData *sPSSData;

void Cb2_ExitPSS(void);

#endif //GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
