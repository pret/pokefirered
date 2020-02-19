#ifndef GUARD_POKEMON_JUMP_H
#define GUARD_POKEMON_JUMP_H

#include "main.h"
#include "link.h"

struct PokemonJump1_MonInfo
{
    u16 species;
    u32 otId;
    u32 personality;
};

struct PokemonJump1_82E4
{
    int unk0;
    int unk4;
    u8 filler8[0x4];
    u16 unkC;
    u16 unkE;
    u16 unk10;
    u16 unk12;
    int unk14;
    int unk18;
    u8 unk1C[11];
};

struct PokemonJump2
{
    int unk0;
    u16 unk4;
    u8 unk6;
    u8 filler7[0xa - 0x7];
    u8 unkA;
    u8 unkB;
    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
    u16 filler10;
    u16 unk12;
    u16 unk14;
    u32 unk18;
    u16 unk1C[5];
    u8 txtBuff[2][0x40];
    u8 strBuff[0x100];
    u16 tilemapBuffer[0x4000]; // Bug: way larger than it should be
    struct Sprite *unk81A8[MAX_RFU_PLAYERS];
    struct Sprite *unk81BC[MAX_RFU_PLAYERS];
    struct Sprite *unk81D0[8];
    u8 filler81F0[0xC];
    u8 unk81FC[MAX_RFU_PLAYERS];
};

struct PokemonJump1Sub
{
    u8 unk0;
    u8 unk1;
    u16 unk2;
    u16 unk4;
    u32 unk8;
};

void ResetPokeJumpResults(void);
bool32 IsSpeciesAllowedInPokemonJump(u16 species);
void StartPokemonJump(u16 species, MainCallback callback);
u16 sub_81499A4(void);
u16 sub_81499B4(void);
struct PokemonJump1_MonInfo *sub_81499C0(u8 multiplayerId);
u8 *sub_81499E0(u8 multiplayerId);

void sub_814A95C(int id);
void sub_8149CEC(struct PokemonJump2 *);
void sub_8149D24(void);
void sub_8149D40(int);
bool32 sub_8149D68(void);
void sub_814A3E4(void);
bool32 sub_814A408(void);
void sub_814A468(u16 itemId, u16 quantity);
void sub_814A53C(u16 itemId);
void sub_814A5B4(u16 itemId);
bool32 sub_814A62C(void);
void sub_814A6CC(void);
void sub_814A940(u32 id, s16 y);
void sub_814AA48(u8 multiplayerId);
bool32 sub_814A6FC(void);
void sub_814AA24(int);
s8 sub_814A744(void);
int sub_814A98C(u8 flags);
void sub_814AA34(u16);
void sub_814AA60(u8 multiplayerId);
int sub_814AA78(int multiplayerId);
void sub_814AA8C(void);
void sub_814AAA0(void);
void sub_814AAB4(int);
int sub_814AAC8(void);
void sub_8149A6C(struct PokemonJump1_MonInfo *arg0);
bool32 sub_8149A90(int multiplayerId, struct PokemonJump1_MonInfo *arg0);
void sub_8149AF8(struct PokemonJump1_82E4 *arg0, struct PokemonJump1Sub *arg1);
bool32 sub_8149B7C(struct PokemonJump1_82E4 *arg0, struct PokemonJump1Sub *arg1);
void sub_8149BF4(struct PokemonJump1_82E4 *arg0, u8 arg1, u16 arg2);
bool32 sub_8149C24(struct PokemonJump1_82E4 *arg0, int multiplayerId, u8 *arg2, u16 *arg3);
bool32 sub_8149C90(struct PokemonJump1_82E4 *arg0, int multiplayerId);
bool32 sub_814B494(u32 jumpScore, u16 jumpsInRow, u16 excellentsInRow);
void sub_814B4E8(void);

void sub_814AD6C(struct PokemonJump2 *);
void sub_814B294(struct PokemonJump2 *);
void sub_814B43C(struct PokemonJump2 *);
bool32 sub_814B460(void);
void sub_814B348(struct PokemonJump2 *, int);
void sub_814AF0C(struct PokemonJump2 *, int);
void sub_814ADCC(struct PokemonJump2 *, struct PokemonJump1_MonInfo *,s16, s16, u8);
void sub_814B240(struct PokemonJump2 *,s16, s16, u8);
void sub_814AFE8(struct PokemonJump2 *, int multiplayerId);
void sub_814B080(struct PokemonJump2 *, int multiplayerId);
bool32 sub_814B010(struct PokemonJump2 *, int multiplayerId);
void sub_814B0A8(struct PokemonJump2 *);
void sub_814B134(struct PokemonJump2 *);
void sub_814B168(struct PokemonJump2 *, int multiplayerId);
bool32 sub_814B190(struct PokemonJump2 *);

#endif // GUARD_POKEMON_JUMP_H
