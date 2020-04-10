#ifndef GUARD_BERRY_CRUSH_H
#define GUARD_BERRY_CRUSH_H

struct BerryCrushGame_Player
{
    u16 unk0;
    u16 unk2;
    union
    {
        u8 as_2d_bytes[2][8];
        u16 as_hwords[8];
    } unk4;
    u8 unk14[12];
};

struct __attribute__((packed, aligned(2))) BerryCrushGame_4E
{
    u16 unk0;
    u16 filler2;
    u8 unk4_0:1;
    u8 unk4_1:1;
    s8 unk5;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC;
};

struct __attribute__((packed)) BerryCrushGame_40
{
    u8 unk0[2];
    u16 unk2[6];
    struct BerryCrushGame_4E unkE;
};

struct BerryCrushGame_5C
{
    u16 unk00;
    u8 unk02_0:1;
    u8 unk02_1:1;
    u8 unk02_2:1;
    u8 unk02_3:5;
    u8 unk03;
    u16 unk04;
    u16 unk06;
    u16 unk08;
    u16 unk0A;
};

union BerryCrushGame_68
{
    struct BerryCrushGame_68_x
    {
        struct BerryCrushGame_68_x_SubStruct
        {
            s32 unk00;
            u16 unk04;
            s16 unk06;
            u16 unk08;
            u16 unk0A;
            u16 unk0C[2][5];
            u8 filler20[16];
        } unk00;
        u8 unk30[12];
        struct BerryCrushGame_Player others[4];
        u8 fillerBC[20];
    } as_four_players;
    struct BerryCrushGame_68_y
    {
        u8 filler00[28];
        struct BerryCrushGame_Player unk1C[5];
        u8 fillerBC[20];
    } as_five_players;
};

struct BerryCrushGame_138_C
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unkA;
};

struct BerryCrushGame_138
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    const struct BerryCrushGame_138_C *unkC[5];
    struct Sprite *unk20;
    struct Sprite *unk24[5];
    struct Sprite *unk38[5];
    struct Sprite *unk4C[11];
    struct Sprite *unk78[2];
    u8 unk80;
    u8 filler81;
    u8 unk82;
    u8 unk83[5];
};

struct BerryCrushGame
{
    MainCallback unk0;
    u32 (*unk4)(struct BerryCrushGame *, u8 *);
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 textSpeed;
    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
    u16 unk10;
    u16 unk12;
    u16 unk14;
    u16 unk16;
    s16 unk18;
    s16 unk1A;
    int unk1C;
    s32 unk20;
    u8 unk24;
    u8 unk25_0:1;
    u8 unk25_1:1;
    u8 unk25_2:1;
    u8 unk25_3:1;
    u8 unk25_4:1;
    u8 unk25_5:3;
    u16 unk26;
    u16 unk28;
    s16 unk2A;
    s16 unk2C;
    s16 unk2E;
    s16 unk30;
    s16 unk32;
    s16 unk34;
    u8 unk36[0xA];
    struct BerryCrushGame_40 unk40;
    struct BerryCrushGame_5C unk5C;
    union BerryCrushGame_68 unk68;
    struct BerryCrushGame_138 unk138;
    u8 unk1C0[0x1000];
    u8 unk11C0[0x1000];
    u8 unk21C0[0x1000];
    u8 unk31C0[0x1000];
};

#define PLAYER_UNK14(game, i)                        \
    ((u8 *)(game)                                    \
    + offsetof(struct BerryCrushGame, unk68)         \
    + offsetof(struct BerryCrushGame_68_x, unk30)    \
    + sizeof(struct BerryCrushGame_Player) * (i))

struct BerryCrushGame *sub_814B6F0(void);
void StartBerryCrush(MainCallback callback);
u32 sub_814B6FC(MainCallback callback);
void sub_814B8F0(void);
void sub_814B914(void);
void sub_814B924(void);
void sub_814B930(void);
void sub_814BABC(struct BerryCrushGame *arg0);
void sub_814BB4C(u16, u8, u8 *);
void sub_814D564(u8 *, u32, s32, u32, u32, u32, u32);
int sub_814D9CC(struct BerryCrushGame *arg0);
int sub_814D5C8(void);
int sub_814D888(void);
void sub_814DA24(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
void sub_814DC24(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
void sub_814DC5C(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
bool32 sub_814DE50(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
bool32 sub_814E644(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
void sub_814E80C(struct BerryCrushGame *arg0);
void sub_814DA04(struct BerryCrushGame *arg0);
void sub_814EB04(struct BerryCrushGame_138 *arg0);
void sub_814DB84(struct Sprite * sprite);
void ShowBerryCrushRankings(void);

#endif //GUARD_BERRY_CRUSH_H
