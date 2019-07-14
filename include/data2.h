#ifndef GUARD_DATA2_H
#define GUARD_DATA2_H

#include "global.h"

struct MonCoords
{
    // This would use a bitfield, but some function
    // uses it as a u8 and casting won't match.
    u8 coords; // u8 x:4, y:4;
    u8 y_offset;
};

extern struct MonCoords gTrainerBackPicCoords[];
extern struct MonCoords gTrainerFrontPicCoords[];

extern const u8 gSpeciesNames[][POKEMON_NAME_LENGTH + 1];
extern const u8 gMoveNames[][13];
extern const u8 gAbilityNames[][13];
extern const u8 gTypeNames[][7];
extern u16 gUnknown_8251CB8[];
extern u16 gUnknown_8251FEE[];
extern u16 gUnknown_8252324[];
extern u16 gUnknown_82539D4[];
extern struct SpindaSpot gSpindaSpotGraphics[];
extern s8 gNatureStatTable[][5];
extern u32 gTMHMLearnsets[][2];

extern const struct CompressedSpritePalette gMonPaletteTable[];
extern const struct CompressedSpritePalette gMonShinyPaletteTable[];
extern const union AnimCmd *const *const gTrainerBackAnimsPtrTable[];
extern const union AnimCmd *const *const gTrainerFrontAnimsPtrTable[];

extern const union AnimCmd *const gUnknown_82349BC[];

extern const union AffineAnimCmd *const gUnknown_82348C8[];
extern const union AffineAnimCmd *const gUnknown_8234944[];

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

extern const struct OamData gUnknown_824F010;
extern const struct OamData gUnknown_824F018;

#endif // GUARD_DATA2_H
