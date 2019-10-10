#ifndef GUARD_TEXT_WINDOW_GRAPHICS_H
#define GUARD_TEXT_WINDOW_GRAPHICS_H

struct TextWindowGraphics
{
    const void * tiles;
    const void * palette;
};

extern const u16 gUnknown_8470B0C[];
extern const u16 gStdFrame0[];
extern const u16 gStdFrame1[];
extern const u16 gUnknown_8471DEC[][16];

extern const struct TextWindowGraphics gUserFrames[];

const struct TextWindowGraphics * GetUserFrameGraphicsInfo(u8 idx);

#endif //GUARD_TEXT_WINDOW_GRAPHICS_H
