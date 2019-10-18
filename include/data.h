#ifndef GUARD_DATA_H
#define GUARD_DATA_H

#include "global.h"
#include "constants/species.h"

struct MonCoords
{
    // This would use a bitfield, but some function
    // uses it as a u8 and casting won't match.
    u8 size; // u8 width:4, height:4;
    u8 y_offset;
};

extern struct MonCoords gTrainerBackPicCoords[];
extern struct MonCoords gTrainerFrontPicCoords[];

extern const u8 gSpeciesNames[][POKEMON_NAME_LENGTH + 1];
extern const u8 gMoveNames[][13];
extern const u16 gUnknown_8251CB8[];
extern const u16 gUnknown_8251FEE[];
extern const u16 gUnknown_8252324[];
extern const u16 gUnknown_82539D4[];

extern const struct CompressedSpriteSheet gMonFrontPicTable[];
extern const struct CompressedSpriteSheet gMonBackPicTable[];
extern const struct CompressedSpritePalette gMonPaletteTable[];
extern const struct CompressedSpritePalette gMonShinyPaletteTable[];
extern const struct CompressedSpriteSheet gTrainerFrontPicTable[];
extern const struct CompressedSpritePalette gTrainerFrontPicPaletteTable[];
extern const struct CompressedSpritePalette gTrainerBackPicPaletteTable[];
extern const struct MonCoords gMonFrontPicCoords[];
extern const struct MonCoords gMonBackPicCoords[];

extern const struct CompressedSpriteSheet gSpriteSheet_EnemyShadow;
extern const struct SpriteTemplate gSpriteTemplate_EnemyShadow;

extern const u8 gEnemyMonElevation[NUM_SPECIES];

extern const u8 *const gBattleAnims_General[];
extern const u8 *const gBattleAnims_Special[];

extern const union AnimCmd *const *const gTrainerBackAnimsPtrTable[];
extern const union AnimCmd *const *const gTrainerFrontAnimsPtrTable[];

extern const struct OamData gOamData_824F010;
extern const struct OamData gOamData_824F018;
extern const union AnimCmd *const gSpriteAnimTable_82349BC[];
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_82348C8[];
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_8234944[];
extern const struct SpriteFrameImage gUnknown_8234698[];
extern const struct SpriteFrameImage gUnknown_82346B8[];
extern const struct SpriteFrameImage gUnknown_82346D8[];
extern const struct SpriteFrameImage gUnknown_82346F8[];
extern const struct SpriteFrameImage gUnknown_8234718[];
extern const struct SpriteFrameImage gUnknown_8234740[];
extern const struct SpriteFrameImage gUnknown_8234768[];
extern const struct SpriteFrameImage gUnknown_8234788[];
extern const struct SpriteFrameImage gUnknown_82347A8[];
extern const struct SpriteFrameImage gUnknown_82347C8[];

#endif // GUARD_DATA_H
