#ifndef GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
#define GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H

#include "pokemon_storage_system.h"
#include "mon_markings.h"

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
    u8 *wallpaperTiles;
    struct Sprite *movingMonSprite;
    struct Sprite *partySprites[PARTY_SIZE];
    struct Sprite *boxMonsSprites[IN_BOX_COUNT];
    struct Sprite **field_B00;
    struct Sprite **field_B04;
    u16 field_B08[40];
    u16 field_B58[40];
    u16 boxSpecies[IN_BOX_COUNT];
    u32 boxPersonalities[IN_BOX_COUNT];
    u8 field_C5C;
    u8 field_C5D;
    u8 field_C5E;
    u16 field_C60;
    s16 field_C62;
    s16 field_C64;
    u16 field_C66;
    u8 field_C68;
    s8 field_C69;
    u8 field_C6A;
    u8 field_C6B;
    struct WindowTemplate menuWindow;
    struct StorageMenu menuItems[7];
    u8 menuItemsCount;
    u8 menuWidth;
    u8 field_CAE;
    u16 field_CB0;
    struct Sprite *field_CB4;
    struct Sprite *field_CB8;
    s32 field_CBC;
    s32 field_CC0;
    u32 field_CC4;
    u32 field_CC8;
    s16 field_CCC;
    s16 field_CCE;
    u16 field_CD0;
    s8 field_CD2;
    s8 field_CD3;
    u8 field_CD4;
    u8 field_CD5;
    u8 field_CD6;
    u8 field_CD7;
    u8 field_CD8[2];
    const u32 *cursorMonPalette;
    u32 cursorMonPersonality;
    u16 cursorMonSpecies;
    u16 cursorMonItem;
    u16 field_CE8;
    bool8 setMosaic;
    u8 cursorMonMarkings;
    u8 cursorMonLevel;
    bool8 cursorMonIsEgg;
    u8 cursorMonNick[POKEMON_NAME_LENGTH + 1];
    u8 cursorMonNickText[36];
    u8 cursorMonSpeciesName[36];
    u8 cursorMonGenderLvlText[36];
    u8 cursorMonItemName[36];
    bool8 (*monPlaceChangeFunc)(void);
    u8 monPlaceChangeState;
    u8 field_D91;
    struct Sprite *field_D94;
    struct Sprite *field_D98[2];
    struct PokemonMarkMenu field_DA4;
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
};

extern struct PokemonStorageSystemData *sPSSData;

void Cb2_ExitPSS(void);

#endif //GUARD_POKEMON_STORAGE_SYSTEM_INTERNAL_H
