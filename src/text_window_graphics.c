#include "global.h"
#include "text_window_graphics.h"

const u16 gSignpostWindow_Gfx[] = INCBIN_U16("graphics/text_window/signpost.4bpp");

static const u16 sUserFrame_Type1_Gfx[] = INCBIN_U16("graphics/text_window/type1.4bpp");
static const u16 sUserFrame_Type2_Gfx[] = INCBIN_U16("graphics/text_window/type2.4bpp");
static const u16 sUserFrame_Empty1[16] = {0};
static const u16 sUserFrame_Type3_Gfx[] = INCBIN_U16("graphics/text_window/type3.4bpp");
static const u16 sUserFrame_Type4_Gfx[] = INCBIN_U16("graphics/text_window/type4.4bpp");
static const u16 sUserFrame_Type5_Gfx[] = INCBIN_U16("graphics/text_window/type5.4bpp");
static const u16 sUserFrame_Type6_Gfx[] = INCBIN_U16("graphics/text_window/type6.4bpp");
static const u16 sUserFrame_Type7_Gfx[] = INCBIN_U16("graphics/text_window/type7.4bpp");
static const u16 sUserFrame_Type8_Gfx[] = INCBIN_U16("graphics/text_window/type8.4bpp");
static const u16 sUserFrame_Empty2[16] = {0};
static const u16 sUserFrame_Type9_Gfx[] = INCBIN_U16("graphics/text_window/type9.4bpp");
static const u16 sUserFrame_Type10_Gfx[] = INCBIN_U16("graphics/text_window/type10.4bpp");
static const u16 sUserFrame_Empty3[16] = {0};

static const u16 sUserFrame_Type1_Pal[] = INCBIN_U16("graphics/text_window/type1.gbapal");
static const u16 sUserFrame_Type2_Pal[] = INCBIN_U16("graphics/text_window/type2.gbapal");
static const u16 sUserFrame_Type3_Pal[] = INCBIN_U16("graphics/text_window/type3.gbapal");
static const u16 sUserFrame_Type4_Pal[] = INCBIN_U16("graphics/text_window/type4.gbapal");
static const u16 sUserFrame_Type5_Pal[] = INCBIN_U16("graphics/text_window/type5.gbapal");
static const u16 sUserFrame_Type6_Pal[] = INCBIN_U16("graphics/text_window/type6.gbapal");
static const u16 sUserFrame_Type7_Pal[] = INCBIN_U16("graphics/text_window/type7.gbapal");
static const u16 sUserFrame_Type8_Pal[] = INCBIN_U16("graphics/text_window/type8.gbapal");
static const u16 sUserFrame_Type9_Pal[] = INCBIN_U16("graphics/text_window/type9.gbapal");
static const u16 sUserFrame_Type10_Pal[] = INCBIN_U16("graphics/text_window/type10.gbapal");

const u16 gStdTextWindow_Gfx[] = INCBIN_U16("graphics/text_window/std.4bpp");
const u16 gQuestLogWindow_Gfx[] = INCBIN_U16("graphics/text_window/quest_log.4bpp");

const u16 gTextWindowPalettes[][16] = {
    INCBIN_U16("graphics/text_window/stdpal_0.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_1.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_2.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_3.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_4.gbapal")
};

const struct TextWindowGraphics gUserFrames[] = {
    {sUserFrame_Type1_Gfx,  sUserFrame_Type1_Pal},
    {sUserFrame_Type2_Gfx,  sUserFrame_Type2_Pal},
    {sUserFrame_Type3_Gfx,  sUserFrame_Type3_Pal},
    {sUserFrame_Type4_Gfx,  sUserFrame_Type4_Pal},
    {sUserFrame_Type5_Gfx,  sUserFrame_Type5_Pal},
    {sUserFrame_Type6_Gfx,  sUserFrame_Type6_Pal},
    {sUserFrame_Type7_Gfx,  sUserFrame_Type7_Pal},
    {sUserFrame_Type8_Gfx,  sUserFrame_Type8_Pal},
    {sUserFrame_Type9_Gfx,  sUserFrame_Type9_Pal},
    {sUserFrame_Type10_Gfx, sUserFrame_Type10_Pal},
};

const struct TextWindowGraphics *GetUserWindowGraphics(u8 idx)
{
#ifdef BUGFIX
    if (idx >= ARRAY_COUNT(gUserFrames))
#else
    if (idx >= 20) // Using the RSE number of elements
#endif
        return &gUserFrames[0];
    else
        return &gUserFrames[idx];
}
