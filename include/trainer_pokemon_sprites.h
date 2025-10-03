#ifndef GUARD_TRAINER_POKEMON_SPRITES_H
#define GUARD_TRAINER_POKEMON_SPRITES_H

// For the flags argument of CreateMonPicSprite_Affine
#define MON_PIC_AFFINE_BACK   0
#define MON_PIC_AFFINE_FRONT  1
#define MON_PIC_AFFINE_NONE   3
#define F_MON_PIC_NO_AFFINE (1 << 7)

u16 CreateTrainerCardTrainerPicSprite(u16 species, bool8 isFrontPic, u16 destX, u16 destY, u8 paletteSlot, u8 windowId);
u16 CreateMonPicSprite_Affine(u16 species, bool8 isShiny, u32 personality, u8 flags, s16 x, s16 y, u8 paletteSlot, u16 paletteTag);
bool16 ResetAllPicSprites(void);
u16 CreateTrainerPicSprite(u16 species, bool8 isFrontPic, s16 x, s16 y, u8 paletteSlot, u16 paletteTag);
u16 FreeAndDestroyMonPicSprite(u16);
u16 FreeAndDestroyMonPicSpriteNoPalette(u16 spriteId);
u16 FreeAndDestroyTrainerPicSprite(u16);
u16 LoadMonPicInWindow(u16 species, bool32 isShiny, u32 personality, bool8 isFrontPic, u8 paletteSlot, u8 windowId);
u16 CreateMonPicSprite(u16 species, bool32 isShiny, u32 personality, bool8 isFrontPic, s16 x, s16 y, u8 paletteSlot, u16 paletteTag);
u16 PlayerGenderToFrontTrainerPicId_Debug(u8 gender, bool8 getClass);
void CopyTrainerBackspriteFramesToDest(u8 trainerPicId, u8 *dest);

#endif // GUARD_TRAINER_POKEMON_SPRITES_H
