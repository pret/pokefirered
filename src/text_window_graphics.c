#include "global.h"
#include "text_window_graphics.h"

const u16 gSignpostFrame_Tiles[] = INCBIN_U16("graphics/text_window/signpost_frame.4bpp");

static const u16 gUserFrame1_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_1.4bpp");
static const u16 gUserFrame2_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_2.4bpp");
static const u16 gUnk_Empty_Space_8470FAC[16] = {0}; // deleted frame maybe?
static const u16 gUserFrame3_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_3.4bpp");
static const u16 gUserFrame4_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_4.4bpp");
static const u16 gUserFrame5_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_5.4bpp");
static const u16 gUserFrame6_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_6.4bpp");
static const u16 gUserFrame7_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_7.4bpp");
static const u16 gUserFrame8_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_8.4bpp");
static const u16 gUnk_Empty_Space_847168C[16] = {0}; // deleted frame maybe?
static const u16 gUserFrame9_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_9.4bpp");
static const u16 gUserFrame10_Tiles[] = INCBIN_U16("graphics/text_window/user_frame_10.4bpp");
static const u16 gUnk_Empty_Space_84718EC[16] = {0}; // deleted frame maybe?
static const u16 gUserFrame1_Pal[] = INCBIN_U16("graphics/text_window/user_frame_1.gbapal");
static const u16 gUserFrame2_Pal[] = INCBIN_U16("graphics/text_window/user_frame_2.gbapal");
static const u16 gUserFrame3_Pal[] = INCBIN_U16("graphics/text_window/user_frame_3.gbapal");
static const u16 gUserFrame4_Pal[] = INCBIN_U16("graphics/text_window/user_frame_4.gbapal");
static const u16 gUserFrame5_Pal[] = INCBIN_U16("graphics/text_window/user_frame_5.gbapal");
static const u16 gUserFrame6_Pal[] = INCBIN_U16("graphics/text_window/user_frame_6.gbapal");
static const u16 gUserFrame7_Pal[] = INCBIN_U16("graphics/text_window/user_frame_7.gbapal");
static const u16 gUserFrame8_Pal[] = INCBIN_U16("graphics/text_window/user_frame_8.gbapal");
static const u16 gUserFrame9_Pal[] = INCBIN_U16("graphics/text_window/user_frame_9.gbapal");
static const u16 gUserFrame10_Pal[] = INCBIN_U16("graphics/text_window/user_frame_10.gbapal");

const u16 gStdFrame0[] = INCBIN_U16("graphics/text_window/std_frame_0.4bpp");
const u16 gStdFrame1[] = INCBIN_U16("graphics/text_window/std_frame_1.4bpp");

const u16 gStdPals[][16] = {
    INCBIN_U16("graphics/text_window/stdpal_0.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_1.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_2.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_3.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_4.gbapal")
};

const struct TextWindowGraphics gUserFrames[] = {
    {gUserFrame1_Tiles,  gUserFrame1_Pal},
    {gUserFrame2_Tiles,  gUserFrame2_Pal},
    {gUserFrame3_Tiles,  gUserFrame3_Pal},
    {gUserFrame4_Tiles,  gUserFrame4_Pal},
    {gUserFrame5_Tiles,  gUserFrame5_Pal},
    {gUserFrame6_Tiles,  gUserFrame6_Pal},
    {gUserFrame7_Tiles,  gUserFrame7_Pal},
    {gUserFrame8_Tiles,  gUserFrame8_Pal},
    {gUserFrame9_Tiles,  gUserFrame9_Pal},
    {gUserFrame10_Tiles, gUserFrame10_Pal}
}; // NELEMS = 10

const struct TextWindowGraphics * GetUserFrameGraphicsInfo(u8 idx)
{
#ifdef BUGFIX
#define NFRAMES NELEMS(gUserFrames)
#else
#define NFRAMES 20
#endif //BUGFIX
    if (idx >= NFRAMES)
        return &gUserFrames[0];
    else
        return &gUserFrames[idx];
}
