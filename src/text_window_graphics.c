#include "global.h"
#include "text_window_graphics.h"

const u16 gUnknown_8470B0C[] = INCBIN_U16("graphics/text_window/unk_8470B0C.4bpp");

static const u16 gUnknown_8470D6C[] = INCBIN_U16("graphics/text_window/unk_8470D6C.4bpp");
static const u16 gUnknown_8470E8C[] = INCBIN_U16("graphics/text_window/unk_8470E8C.4bpp");
static const u16 gUnk_Empty_Space_8470FAC[16] = {0};
static const u16 gUnknown_8470FCC[] = INCBIN_U16("graphics/text_window/unk_8470FCC.4bpp");
static const u16 gUnknown_84710EC[] = INCBIN_U16("graphics/text_window/unk_84710EC.4bpp");
static const u16 gUnknown_847120C[] = INCBIN_U16("graphics/text_window/unk_847120C.4bpp");
static const u16 gUnknown_847132C[] = INCBIN_U16("graphics/text_window/unk_847132C.4bpp");
static const u16 gUnknown_847144C[] = INCBIN_U16("graphics/text_window/unk_847144C.4bpp");
static const u16 gUnknown_847156C[] = INCBIN_U16("graphics/text_window/unk_847156C.4bpp");
static const u16 gUnk_Empty_Space_847168C[16] = {0};
static const u16 gUnknown_84716AC[] = INCBIN_U16("graphics/text_window/unk_84716AC.4bpp");
static const u16 gUnknown_84717CC[] = INCBIN_U16("graphics/text_window/unk_84717CC.4bpp");
static const u16 gUnk_Empty_Space_84718EC[16] = {0};
static const u16 gUnknown_847190C[] = INCBIN_U16("graphics/text_window/unk_8470D6C.gbapal");
static const u16 gUnknown_847192C[] = INCBIN_U16("graphics/text_window/unk_8470E8C.gbapal");
static const u16 gUnknown_847194C[] = INCBIN_U16("graphics/text_window/unk_8470FCC.gbapal");
static const u16 gUnknown_847196C[] = INCBIN_U16("graphics/text_window/unk_84710EC.gbapal");
static const u16 gUnknown_847198C[] = INCBIN_U16("graphics/text_window/unk_847120C.gbapal");
static const u16 gUnknown_84719AC[] = INCBIN_U16("graphics/text_window/unk_847132C.gbapal");
static const u16 gUnknown_84719CC[] = INCBIN_U16("graphics/text_window/unk_847144C.gbapal");
static const u16 gUnknown_84719EC[] = INCBIN_U16("graphics/text_window/unk_847156C.gbapal");
static const u16 gUnknown_8471A0C[] = INCBIN_U16("graphics/text_window/unk_84716AC.gbapal");
static const u16 gUnknown_8471A2C[] = INCBIN_U16("graphics/text_window/unk_84717CC.gbapal");

const u16 gStdFrame0[] = INCBIN_U16("graphics/text_window/unk_8471A4C.4bpp");
const u16 gStdFrame1[] = INCBIN_U16("graphics/text_window/unk_8471B6C.4bpp");

const u16 gUnknown_8471DEC[][16] = {
    INCBIN_U16("graphics/text_window/stdpal_0.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_1.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_2.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_3.gbapal"),
    INCBIN_U16("graphics/text_window/stdpal_4.gbapal")
};

const struct TextWindowGraphics gUserFrames[] = {
    {gUnknown_8470D6C, gUnknown_847190C},
    {gUnknown_8470E8C, gUnknown_847192C},
    {gUnknown_8470FCC, gUnknown_847194C},
    {gUnknown_84710EC, gUnknown_847196C},
    {gUnknown_847120C, gUnknown_847198C},
    {gUnknown_847132C, gUnknown_84719AC},
    {gUnknown_847144C, gUnknown_84719CC},
    {gUnknown_847156C, gUnknown_84719EC},
    {gUnknown_84716AC, gUnknown_8471A0C},
    {gUnknown_84717CC, gUnknown_8471A2C}
}; // NELEMS = 10

const struct TextWindowGraphics *GetWindowFrameTilesPal(u8 idx)
{
    if (idx >= 20) // if (idx >= NELEMS(gUserFrames))
        return &gUserFrames[0];
    else
        return &gUserFrames[idx];
}
