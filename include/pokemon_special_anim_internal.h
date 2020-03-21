#ifndef GUARD_POKEMON_SPECIAL_ANIM_INTERNAL_H
#define GUARD_POKEMON_SPECIAL_ANIM_INTERNAL_H

#include "pokemon_special_anim.h"

struct PokemonSpecialAnimScene
{
    u16 field_0000;
    u8 filler_0002[2];
    u16 field_0004;
    u16 field_0006;
    u16 field_0008;
    u8 field_000a;
    struct Sprite * field_000c;
    struct Sprite * field_0010;
    u8 field_0014[0x900];
    u8 field_0914[BG_SCREEN_SIZE];
    u8 field_1114[BG_SCREEN_SIZE];
    u8 field_1914[BG_SCREEN_SIZE];
    u8 field_2114[0x720];
}; // size=0x2834

struct PokemonSpecialAnim
{
    /*0x0000*/ u8 filler_0000[0x4];
    /*0x0004*/ MainCallback savedCallback;
    /*0x0008*/ struct Pokemon pokemon;
    /*0x006c*/ u8 nickname[POKEMON_NAME_LENGTH + 1];
    /*0x0077*/ u8 nameOfMoveForgotten[13];
    /*0x0084*/ u8 nameOfMoveToTeach[13];
    /*0x0091*/ bool8 cancelDisabled;
    /*0x0092*/ u16 state;
    /*0x0094*/ u16 species;
    /*0x0096*/ u16 itemId;
    /*0x0098*/ u16 animType;
    /*0x009a*/ u16 slotId;
    /*0x009c*/ u16 closeness;
    /*0x009e*/ u16 field_009e;
    /*0x00a0*/ u32 personality;
    /*0x00a4*/ u32 field_00a4;
    /*0x00a8*/ struct PokemonSpecialAnimScene field_00a8;
}; // size=0x28dc

struct PokemonSpecialAnim * sub_811D080(void);
struct Pokemon * sub_811D094(void);
struct PokemonSpecialAnimScene * sub_811D0A8(void);
u16 sub_811D0B4(void);
u8 *sub_811D0C4(void);
u8 *sub_811D0D0(void);
u8 *sub_811D0DC(u8 *dest);
u8 *sub_811D0F4(void);
u8 sub_811D100(void);
u16 sub_811D110(void);
u32 sub_811D120(void);
void BufferMonStatsToTaskData(struct Pokemon * pokemon, u16 *data);
bool32 sub_811D178(void);

void sub_811D184(struct PokemonSpecialAnimScene * buffer, u16 animType);
bool8 sub_811D280(void);
void sub_811D29C(void);
void sub_811D2A8(void);
void sub_811D2D0(void);
void sub_811D2EC(u8 messageId);
void sub_811D4D4(void);
bool8 sub_811D4EC(void);
void sub_811D4FC(void);
bool8 sub_811D530(void);
void sub_811D5A0(void);
void sub_811D5B0(void);
bool8 sub_811D5C0(void);
void sub_811D6EC(void);
bool8 sub_811D6FC(void);
bool8 sub_811D754(void);
void sub_811D830(u8 closeness);
void sub_811D948(u8 closeness);
bool8 sub_811D9A8(void);
void sub_811DC54(u16 itemId, u8 closeness, bool32 a2);
void sub_811DCF0(u16 itemId);
bool8 sub_811DD90(void);
void sub_811E040(void);

#endif //GUARD_POKEMON_SPECIAL_ANIM_INTERNAL_H
