#ifndef GUARD_TEXT_WINDOW_GRAPHICS_H
#define GUARD_TEXT_WINDOW_GRAPHICS_H

struct TextWindowGraphics
{
    const void * tiles;
    const void * palette;
};

extern const u16 gUnknown_8471A4C[];
extern const u16 gUnknown_8471B6C[];
extern const u16 gUnknown_8471DEC[][16];

extern const struct TextWindowGraphics gUnknown_8471E8C[];

const struct TextWindowGraphics * sub_8069788(u8 idx);

#endif //GUARD_TEXT_WINDOW_GRAPHICS_H
