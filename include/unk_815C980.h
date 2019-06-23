#ifndef GUARD_UNK_815C980_H
#define GUARD_UNK_815C980_H

struct UnkStruct3
{
    u8 field_0_0:2;
    u8 shape:2;
    u8 size:2;
    u8 priority:2;
    u8 field_1;
    u8 xDelta;
    s16 x;
    s16 y;
    const struct SpriteSheet *spriteSheet;
    const struct SpritePalette *spritePal;
};

void sub_815C9F4(void);
void sub_815D108(u32 id);
void sub_815D1A8(u32 id, bool32 arg1);
bool32 sub_815CA40(u32 id, s32 arg1, const struct UnkStruct3 *arg2);
void sub_815CD70(u32 id, s32 arg1);

#endif //GUARD_UNK_815C980_H
