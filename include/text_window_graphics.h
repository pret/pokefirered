#ifndef GUARD_TEXT_WINDOW_GRAPHICS_H
#define GUARD_TEXT_WINDOW_GRAPHICS_H

struct TextWindowGraphics
{
    const void *tiles;
    const void *palette;
};

extern const u16 gSignpostWindow_Gfx[];
extern const u16 gStdTextWindow_Gfx[];
extern const u16 gQuestLogWindow_Gfx[];
extern const u16 gTextWindowPalettes[][16];

extern const struct TextWindowGraphics gUserFrames[];

const struct TextWindowGraphics *GetUserWindowGraphics(u8 idx);

#endif //GUARD_TEXT_WINDOW_GRAPHICS_H
