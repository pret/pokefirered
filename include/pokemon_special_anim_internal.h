#ifndef GUARD_POKEMON_SPECIAL_ANIM_INTERNAL_H
#define GUARD_POKEMON_SPECIAL_ANIM_INTERNAL_H

#include "pokemon_special_anim.h"

enum
{
    PSA_TEXT_ITEM_USED,
    PSA_TEXT_LEVEL_ELEVATED,
    PSA_TEXT_FORGET_1,
    PSA_TEXT_FORGET_2_AND,
    PSA_TEXT_FORGET_POOF,
    PSA_TEXT_FORGET_FORGOT,
    PSA_TEXT_FORGET_AND,
    PSA_TEXT_MACHINE_SET,
    PSA_TEXT_HUH,
    PSA_TEXT_LEARNED_MOVE
};

struct PokemonSpecialAnimScene
{
    u16 state;
    u16 field_0002;
    u16 field_0004;
    u16 field_0006;
    u16 field_0008;
    u8 field_000a;
    struct Sprite * monSprite;
    struct Sprite * itemIconSprite;
    u8 textBuf[0x900];
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
    /*0x00a8*/ struct PokemonSpecialAnimScene sceneResources;
}; // size=0x28dc

struct PokemonSpecialAnim * GetPSAStruct(void);
struct Pokemon * PSA_GetPokemon(void);
struct PokemonSpecialAnimScene * PSA_GetSceneWork(void);
u16 PSA_GetItemId(void);
u8 *PSA_GetNameOfMoveForgotten(void);
u8 *PSA_GetNameOfMoveToTeach(void);
u8 *PSA_CopyMonNickname(u8 *dest);
u8 *PSA_GetMonNickname(void);
u8 PSA_GetAnimType(void);
u16 PSA_GetMonSpecies(void);
u32 PSA_GetMonPersonality(void);
void GetMonLevelUpWindowStats(struct Pokemon * pokemon, u16 *data);
bool32 PSA_IsCancelDisabled(void);

void InitPokemonSpecialAnimScene(struct PokemonSpecialAnimScene * buffer, u16 animType);
bool8 PokemonSpecialAnimSceneInitIsNotFinished(void);
void PSA_FreeWindowBuffers(void);
void sub_811D2A8(void);
void sub_811D2D0(void);
void PSA_PrintMessage(u8 messageId);
void sub_811D4D4(void);
bool8 PSA_IsMessagePrintTaskActive(void);
void sub_811D4FC(void);
bool8 sub_811D530(void);
void sub_811D5A0(void);
void sub_811D5B0(void);
bool8 sub_811D5C0(void);
void sub_811D6EC(void);
bool8 sub_811D6FC(void);
bool8 sub_811D754(void);
void sub_811D830(u8 closeness);
void PSA_SetUpZoomAnim(u8 closeness);
bool8 sub_811D9A8(void);
void PSA_SetUpZoomOutMonTask(u16 itemId, u8 closeness, bool32 a2);
void sub_811DCF0(u16 itemId);
bool8 PSA_IsZoomOutMonTaskRunning(void);
void sub_811E040(void);

#endif //GUARD_POKEMON_SPECIAL_ANIM_INTERNAL_H
