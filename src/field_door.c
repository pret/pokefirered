#include "global.h"
#include "field_camera.h"
#include "task.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "constants/songs.h"

struct DoorAnimFrame
{
    u8 duration;
    u16 tile;
};

struct DoorGraphics
{
    u16 metatileId;
    s8 sliding;
    u8 size;
    const u8 * tiles;
    const u8 * palettes;
};

static void DrawDoorDefaultImage(const struct DoorGraphics * gfx, int x, int y);
static void LoadDoorFrameTiles(const u8 *a0);
static void SetDoorFramePalettes(const struct DoorGraphics * gfx, int x, int y, const u8 *a3);
static void BufferDoorFrameTilesWithPalettes(u16 *a0, u16 a1, const u8 *a2);
static bool32 PlayDoorAnimationFrame(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, s16 *data);
static const struct DoorAnimFrame * SeekToEndOfDoorAnim(const struct DoorAnimFrame * frames);
static s8 GetDoorOpenType(const struct DoorGraphics * gfx, int x, int y);

const u8 gUnknown_8353088[] = INCBIN_U8("graphics/door_anims/frame_8353088_1.4bpp", "graphics/door_anims/frame_8353088_2.4bpp", "graphics/door_anims/frame_8353088_3.4bpp");
const u8 gUnknown_8353208[32] = {};
const u8 gUnknown_8353228[] = INCBIN_U8("graphics/door_anims/frame_8353228_1.4bpp", "graphics/door_anims/frame_8353228_2.4bpp", "graphics/door_anims/frame_8353228_3.4bpp");
const u8 gUnknown_83533A8[32] = {};
const u8 gUnknown_83533C8[] = INCBIN_U8("graphics/door_anims/frame_83533C8_1.4bpp", "graphics/door_anims/frame_83533C8_2.4bpp", "graphics/door_anims/frame_83533C8_3.4bpp");
const u8 gUnknown_8353548[32] = {};
const u8 gUnknown_8353568[] = INCBIN_U8("graphics/door_anims/frame_8353568_1.4bpp", "graphics/door_anims/frame_8353568_2.4bpp", "graphics/door_anims/frame_8353568_3.4bpp");
const u8 gUnknown_83536E8[32] = {};
const u8 gUnknown_8353708[] = INCBIN_U8("graphics/door_anims/frame_8353708_1.4bpp", "graphics/door_anims/frame_8353708_2.4bpp", "graphics/door_anims/frame_8353708_3.4bpp");
const u8 gUnknown_8353888[32] = {};
const u8 gUnknown_83538A8[] = INCBIN_U8("graphics/door_anims/frame_83538A8_1.4bpp", "graphics/door_anims/frame_83538A8_2.4bpp", "graphics/door_anims/frame_83538A8_3.4bpp");
const u8 gUnknown_8353A28[32] = {};
const u8 gUnknown_8353A48[] = INCBIN_U8("graphics/door_anims/frame_8353A48_1.4bpp", "graphics/door_anims/frame_8353A48_2.4bpp", "graphics/door_anims/frame_8353A48_3.4bpp");
const u8 gUnknown_8353BC8[32] = {};
const u8 gUnknown_8353BE8[] = INCBIN_U8("graphics/door_anims/frame_8353BE8_1.4bpp", "graphics/door_anims/frame_8353BE8_2.4bpp", "graphics/door_anims/frame_8353BE8_3.4bpp");
const u8 gUnknown_8353D68[32] = {};
const u8 gUnknown_8353D88[] = INCBIN_U8("graphics/door_anims/frame_8353D88_1.4bpp", "graphics/door_anims/frame_8353D88_2.4bpp", "graphics/door_anims/frame_8353D88_3.4bpp");
const u8 gUnknown_8353F08[32] = {};
const u8 gUnknown_8353F28[] = INCBIN_U8("graphics/door_anims/frame_8353F28_1.4bpp", "graphics/door_anims/frame_8353F28_2.4bpp", "graphics/door_anims/frame_8353F28_3.4bpp");
const u8 gUnknown_83540A8[32] = {};
const u8 gUnknown_83540C8[] = INCBIN_U8("graphics/door_anims/frame_83540C8_1.4bpp", "graphics/door_anims/frame_83540C8_2.4bpp", "graphics/door_anims/frame_83540C8_3.4bpp");
const u8 gUnknown_8354248[32] = {};
const u8 gUnknown_8354268[] = INCBIN_U8("graphics/door_anims/frame_8354268_1.4bpp", "graphics/door_anims/frame_8354268_2.4bpp", "graphics/door_anims/frame_8354268_3.4bpp");
const u8 gUnknown_83543E8[32] = {};
const u8 gUnknown_8354408[] = INCBIN_U8("graphics/door_anims/frame_8354408_1.4bpp", "graphics/door_anims/frame_8354408_2.4bpp", "graphics/door_anims/frame_8354408_3.4bpp");
const u8 gUnknown_8354588[32] = {};
const u8 gUnknown_83545A8[] = INCBIN_U8("graphics/door_anims/frame_83545A8_1.4bpp", "graphics/door_anims/frame_83545A8_2.4bpp", "graphics/door_anims/frame_83545A8_3.4bpp");
const u8 gUnknown_8354728[32] = {};
const u8 gUnknown_8354748[] = INCBIN_U8("graphics/door_anims/frame_8354748_1.4bpp", "graphics/door_anims/frame_8354748_2.4bpp", "graphics/door_anims/frame_8354748_3.4bpp");
const u8 gUnknown_83548C8[32] = {};
const u8 gUnknown_83548E8[] = INCBIN_U8("graphics/door_anims/frame_83548E8_1.4bpp", "graphics/door_anims/frame_83548E8_2.4bpp", "graphics/door_anims/frame_83548E8_3.4bpp");
const u8 gUnknown_8354A68[32] = {};
const u8 gUnknown_8354A88[] = INCBIN_U8("graphics/door_anims/frame_8354A88_1.4bpp", "graphics/door_anims/frame_8354A88_2.4bpp", "graphics/door_anims/frame_8354A88_3.4bpp");
const u8 gUnknown_8354C08[32] = {};
const u8 gUnknown_8354C28[] = INCBIN_U8("graphics/door_anims/frame_8354C28_1.4bpp", "graphics/door_anims/frame_8354C28_2.4bpp", "graphics/door_anims/frame_8354C28_3.4bpp");
const u8 gUnknown_8354F28[32] = {};
const u8 gUnknown_8354F48[] = INCBIN_U8("graphics/door_anims/frame_8354F48_1.4bpp", "graphics/door_anims/frame_8354F48_2.4bpp", "graphics/door_anims/frame_8354F48_3.4bpp");
const u8 gUnknown_8355248[32] = {};
const u8 gUnknown_8355268[] = INCBIN_U8("graphics/door_anims/frame_8355268_1.4bpp", "graphics/door_anims/frame_8355268_2.4bpp", "graphics/door_anims/frame_8355268_3.4bpp");
const u8 gUnknown_8355568[32] = {};
const u8 gUnknown_8355588[] = INCBIN_U8("graphics/door_anims/frame_8355588_1.4bpp", "graphics/door_anims/frame_8355588_2.4bpp", "graphics/door_anims/frame_8355588_3.4bpp");
const u8 gUnknown_8355888[32] = {};
const u8 gUnknown_83558A8[256] = {};
const u8 gUnknown_83559A8[256] = {};
const u8 gUnknown_8355AA8[256] = {};
const u8 gUnknown_8355BA8[32] = {};
const u8 gUnknown_8355BC8[256] = {};
const u8 gUnknown_8355CC8[256] = {};
const u8 gUnknown_8355DC8[256] = {};
const u8 gUnknown_8355EC8[32] = {};
const u8 gUnknown_8355EE8[256] = {};
const u8 gUnknown_8355FE8[256] = {};
const u8 gUnknown_83560E8[256] = {};
const u8 gUnknown_83561E8[32] = {};
const u8 gUnknown_8356208[256] = {};
const u8 gUnknown_8356308[256] = {};
const u8 gUnknown_8356408[256] = {};
const u8 gUnknown_8356508[32] = {};
const u8 gUnknown_8356528[256] = {};
const u8 gUnknown_8356628[256] = {};
const u8 gUnknown_8356728[256] = {};
const u8 gUnknown_8356828[32] = {};
const u8 gUnknown_8356848[256] = {};
const u8 gUnknown_8356948[256] = {};
const u8 gUnknown_8356A48[256] = {};
const u8 gUnknown_8356B48[32] = {};
const u8 gUnknown_8356B68[256] = {};
const u8 gUnknown_8356C68[256] = {};
const u8 gUnknown_8356D68[256] = {};
const u8 gUnknown_8356E68[32] = {};
const u8 gUnknown_8356E88[128] = {};
const u8 gUnknown_8356F08[128] = {};
const u8 gUnknown_8356F88[128] = {};
const u8 gUnknown_8357008[32] = {};
const u8 gUnknown_8357028[128] = {};
const u8 gUnknown_83570A8[128] = {};
const u8 gUnknown_8357128[128] = {};
const u8 gUnknown_83571A8[32] = {};
const u8 gUnknown_83571C8[128] = {};
const u8 gUnknown_8357248[128] = {};
const u8 gUnknown_83572C8[128] = {};
const u8 gUnknown_8357348[32] = {};
const u8 gUnknown_8357368[128] = {};
const u8 gUnknown_83573E8[128] = {};
const u8 gUnknown_8357468[128] = {};
const u8 gUnknown_83574E8[32] = {};
const u8 gUnknown_8357508[128] = {};
const u8 gUnknown_8357588[128] = {};
const u8 gUnknown_8357608[128] = {};
const u8 gUnknown_8357688[32] = {};
const u8 gUnknown_83576A8[128] = {};
const u8 gUnknown_8357728[128] = {};
const u8 gUnknown_83577A8[128] = {};
const u8 gUnknown_8357828[32] = {};
const u8 gUnknown_8357848[128] = {};
const u8 gUnknown_83578C8[128] = {};
const u8 gUnknown_8357948[128] = {};
const u8 gUnknown_83579C8[32] = {};
const u8 gUnknown_83579E8[128] = {};
const u8 gUnknown_8357A68[128] = {};
const u8 gUnknown_8357AE8[128] = {};
const u8 gUnknown_8357B68[32] = {};
const u8 gUnknown_8357B88[128] = {};
const u8 gUnknown_8357C08[128] = {};
const u8 gUnknown_8357C88[128] = {};
const u8 gUnknown_8357D08[32] = {};
const u8 gUnknown_8357D28[128] = {};
const u8 gUnknown_8357DA8[128] = {};
const u8 gUnknown_8357E28[128] = {};
const u8 gUnknown_8357EA8[32] = {};
const u8 gUnknown_8357EC8[128] = {};
const u8 gUnknown_8357F48[128] = {};
const u8 gUnknown_8357FC8[128] = {};
const u8 gUnknown_8358048[32] = {};
const u8 gUnknown_8358068[128] = {};
const u8 gUnknown_83580E8[128] = {};
const u8 gUnknown_8358168[128] = {};
const u8 gUnknown_83581E8[32] = {};
const u8 gUnknown_8358208[128] = {};
const u8 gUnknown_8358288[128] = {};
const u8 gUnknown_8358308[128] = {};
const u8 gUnknown_8358388[32] = {};
const u8 gUnknown_83583A8[128] = {};
const u8 gUnknown_8358428[128] = {};
const u8 gUnknown_83584A8[128] = {};
const u8 gUnknown_8358528[32] = {};
const u8 gUnknown_8358548[128] = {};
const u8 gUnknown_83585C8[128] = {};
const u8 gUnknown_8358648[128] = {};
const u8 gUnknown_83586C8[32] = {};
const u8 gUnknown_83586E8[128] = {};
const u8 gUnknown_8358768[128] = {};
const u8 gUnknown_83587E8[128] = {};
const u8 gUnknown_8358868[32] = {};
const u8 gUnknown_8358888[128] = {};
const u8 gUnknown_8358908[128] = {};
const u8 gUnknown_8358988[128] = {};
const u8 gUnknown_8358A08[32] = {};
const u8 gUnknown_8358A28[128] = {};
const u8 gUnknown_8358AA8[128] = {};
const u8 gUnknown_8358B28[128] = {};
const u8 gUnknown_8358BA8[32] = {};
const u8 gUnknown_8358BC8[128] = {};
const u8 gUnknown_8358C48[128] = {};
const u8 gUnknown_8358CC8[128] = {};
const u8 gUnknown_8358D48[32] = {};
const u8 gUnknown_8358D68[128] = {};
const u8 gUnknown_8358DE8[128] = {};
const u8 gUnknown_8358E68[128] = {};
const u8 gUnknown_8358EE8[32] = {};
const u8 gUnknown_8358F08[128] = {};
const u8 gUnknown_8358F88[128] = {};
const u8 gUnknown_8359008[128] = {};
const u8 gUnknown_8359088[32] = {};
const u8 gUnknown_83590A8[128] = {};
const u8 gUnknown_8359128[128] = {};
const u8 gUnknown_83591A8[128] = {};
const u8 gUnknown_8359228[32] = {};
const u8 gUnknown_8359248[128] = {};
const u8 gUnknown_83592C8[128] = {};
const u8 gUnknown_8359348[128] = {};
const u8 gUnknown_83593C8[32] = {};
const u8 gUnknown_83593E8[128] = {};
const u8 gUnknown_8359468[128] = {};
const u8 gUnknown_83594E8[128] = {};
const u8 gUnknown_8359568[32] = {};
const u8 gUnknown_8359588[] = INCBIN_U8("graphics/door_anims/frame_8359588_1.4bpp", "graphics/door_anims/frame_8359588_2.4bpp");
const u8 gUnknown_8359688[256] = {};
const u8 gUnknown_8359788[] = INCBIN_U8("graphics/door_anims/frame_8359788_1.4bpp", "graphics/door_anims/frame_8359788_2.4bpp", "graphics/door_anims/frame_8359788_3.4bpp", "graphics/door_anims/frame_8359788_4.4bpp");
const u8 gUnknown_8359888[256] = {};
const u8 gUnknown_8359988[] = INCBIN_U8("graphics/door_anims/frame_8359988_1.4bpp", "graphics/door_anims/frame_8359988_2.4bpp", "graphics/door_anims/frame_8359988_3.4bpp", "graphics/door_anims/frame_8359988_4.4bpp");
const u8 gUnknown_8359A88[256] = {};
const u8 gUnknown_8359B88[] = INCBIN_U8("graphics/door_anims/frame_8359B88_1.4bpp", "graphics/door_anims/frame_8359B88_2.4bpp", "graphics/door_anims/frame_8359B88_3.4bpp", "graphics/door_anims/frame_8359B88_4.4bpp");
const u8 gUnknown_8359C88[32] = {};
const u8 gUnknown_8359CA8[] = INCBIN_U8("graphics/door_anims/frame_8359CA8_1.4bpp", "graphics/door_anims/frame_8359CA8_2.4bpp", "graphics/door_anims/frame_8359CA8_3.4bpp");
const u8 gUnknown_8359FA8[32] = {};
const u8 gUnknown_8359FC8[] = INCBIN_U8("graphics/door_anims/frame_8359FC8_1.4bpp", "graphics/door_anims/frame_8359FC8_2.4bpp", "graphics/door_anims/frame_8359FC8_3.4bpp");
const u8 gUnknown_835A148[32] = {};
const u8 gUnknown_835A168[] = INCBIN_U8("graphics/door_anims/frame_835A168_1.4bpp", "graphics/door_anims/frame_835A168_2.4bpp", "graphics/door_anims/frame_835A168_3.4bpp");
const u8 gUnknown_835A2E8[32] = {};
const u8 gUnknown_835A308[] = INCBIN_U8("graphics/door_anims/frame_835A308_1.4bpp", "graphics/door_anims/frame_835A308_2.4bpp", "graphics/door_anims/frame_835A308_3.4bpp");
const u8 gUnknown_835A488[32] = {};
const u8 gUnknown_835A4A8[] = INCBIN_U8("graphics/door_anims/frame_835A4A8_1.4bpp", "graphics/door_anims/frame_835A4A8_2.4bpp", "graphics/door_anims/frame_835A4A8_3.4bpp");
const u8 gUnknown_835A628[32] = {};
const u8 gUnknown_835A648[] = INCBIN_U8("graphics/door_anims/frame_835A648_1.4bpp", "graphics/door_anims/frame_835A648_2.4bpp", "graphics/door_anims/frame_835A648_3.4bpp");
const u8 gUnknown_835A7C8[32] = {};
const u8 gUnknown_835A7E8[] = INCBIN_U8("graphics/door_anims/frame_835A7E8_1.4bpp", "graphics/door_anims/frame_835A7E8_2.4bpp", "graphics/door_anims/frame_835A7E8_3.4bpp");
const u8 gUnknown_835A968[32] = {};
const u8 gUnknown_835A988[] = INCBIN_U8("graphics/door_anims/frame_835A988_1.4bpp", "graphics/door_anims/frame_835A988_2.4bpp", "graphics/door_anims/frame_835A988_3.4bpp");
const u8 gUnknown_835AB08[32] = {};
const u8 gUnknown_835AB28[] = INCBIN_U8("graphics/door_anims/frame_835AB28_1.4bpp", "graphics/door_anims/frame_835AB28_2.4bpp", "graphics/door_anims/frame_835AB28_3.4bpp");
const u8 gUnknown_835AE28[32] = {};
const u8 gUnknown_835AE48[] = INCBIN_U8("graphics/door_anims/frame_835AE48_1.4bpp", "graphics/door_anims/frame_835AE48_2.4bpp", "graphics/door_anims/frame_835AE48_3.4bpp");
const u8 gUnknown_835B148[32] = {};
const u8 gUnknown_835B168[] = INCBIN_U8("graphics/door_anims/frame_835B168_1.4bpp", "graphics/door_anims/frame_835B168_2.4bpp", "graphics/door_anims/frame_835B168_3.4bpp");
const u8 gUnknown_835B468[32] = {};

const struct DoorAnimFrame sDoorAnimFrames_OpenSmall[] = {
    {4, 0xFFFF},
    {4, 0x0000},
    {4, 0x0080},
    {4, 0x0100},
    {}
};

const struct DoorAnimFrame sDoorAnimFrames_OpenLarge[] = {
    {4, 0xFFFF},
    {4, 0x0000},
    {4, 0x0100},
    {4, 0x0200},
    {}
};

const struct DoorAnimFrame sDoorAnimFrames_CloseSmall[] = {
    {4, 0x0100},
    {4, 0x0080},
    {4, 0x0000},
    {4, 0xFFFF},
    {}
};

const struct DoorAnimFrame sDoorAnimFrames_CloseLarge[] = {
    {4, 0x0200},
    {4, 0x0100},
    {4, 0x0000},
    {4, 0xFFFF},
    {}
};

const u8 gUnknown_835B4D8[] = {0x2, 0x2, 0x2, 0x2, 0x2, 0x2, 0x2, 0x2};
const u8 gUnknown_835B4E0[] = {0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3};
const u8 gUnknown_835B4E8[] = {0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3};
const u8 gUnknown_835B4F0[] = {0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8};
const u8 gUnknown_835B4F8[] = {0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa};
const u8 gUnknown_835B500[] = {0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8};
const u8 gUnknown_835B508[] = {0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8};
const u8 gUnknown_835B510[] = {0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8};
const u8 gUnknown_835B518[] = {0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3};
const u8 gUnknown_835B520[] = {0xc, 0xc, 0xc, 0xc, 0xc, 0xc, 0xc, 0xc};
const u8 gUnknown_835B528[] = {0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9};
const u8 gUnknown_835B530[] = {0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9};
const u8 gUnknown_835B538[] = {0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9};
const u8 gUnknown_835B540[] = {0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3};
const u8 gUnknown_835B548[] = {0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8};
const u8 gUnknown_835B550[] = {0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9, 0x9};
const u8 gUnknown_835B558[] = {0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3};
const u8 gUnknown_835B560[] = {0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8};
const u8 gUnknown_835B568[] = {0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8};
const u8 gUnknown_835B570[] = {0xc, 0xc, 0x2, 0x2, 0x2, 0x2, 0x2, 0x2};
const u8 gUnknown_835B578[] = {0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7};
const u8 gUnknown_835B580[] = {0x8, 0x8, 0x2, 0x2, 0x2, 0x2, 0x2, 0x2};
const u8 gUnknown_835B588[] = {0x5, 0x5, 0x5, 0x5, 0x5, 0x5, 0x5, 0x5};
const u8 gUnknown_835B590[] = {0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3};
const u8 gUnknown_835B598[] = {0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3};
const u8 gUnknown_835B5A0[] = {0x5, 0x5, 0x5, 0x5, 0x5, 0x5, 0x5, 0x5};
const u8 gUnknown_835B5A8[] = {0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3};
const u8 gUnknown_835B5B0[] = {0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa};
const u8 gUnknown_835B5B8[] = {0x5, 0x5, 0x5, 0x5, 0x5, 0x5, 0x5, 0x5};
const u8 gUnknown_835B5C0[] = {0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8, 0x8};
const u8 gUnknown_835B5C8[] = {0x8, 0x8, 0x2, 0x2, 0x2, 0x2, 0x2, 0x2};
const u8 gUnknown_835B5D0[] = {0xb, 0xb, 0x2, 0x2, 0x2, 0x2, 0x2, 0x2};

const struct DoorGraphics sDoorGraphics[] = {
    {0x03d, 0, 0, gUnknown_8353088, gUnknown_835B4D8},
    {0x062, 1, 0, gUnknown_8353228, gUnknown_835B4E0},
    {0x15b, 1, 0, gUnknown_83533C8, gUnknown_835B4E8},
    {0x2a3, 0, 0, gUnknown_8353568, gUnknown_835B4F0},
    {0x2ac, 0, 0, gUnknown_8353708, gUnknown_835B4F8},
    {0x299, 0, 0, gUnknown_83538A8, gUnknown_835B500},
    {0x2ce, 0, 0, gUnknown_8353A48, gUnknown_835B508},
    {0x284, 0, 0, gUnknown_8353BE8, gUnknown_835B510},
    {0x2bc, 1, 0, gUnknown_8353D88, gUnknown_835B518},
    {0x298, 0, 0, gUnknown_8353F28, gUnknown_835B520},
    {0x2a2, 0, 0, gUnknown_83540C8, gUnknown_835B528},
    {0x29e, 0, 0, gUnknown_8354268, gUnknown_835B530},
    {0x2e1, 0, 0, gUnknown_8354408, gUnknown_835B538},
    {0x294, 1, 0, gUnknown_83545A8, gUnknown_835B540},
    {0x2bf, 0, 0, gUnknown_8354748, gUnknown_835B548},
    {0x2d2, 1, 0, gUnknown_83548E8, gUnknown_835B550},
    {0x2ad, 0, 0, gUnknown_8354A88, gUnknown_835B558},
    {0x297, 0, 0, gUnknown_8359FC8, gUnknown_835B588},
    {0x29b, 1, 0, gUnknown_835A168, gUnknown_835B590},
    {0x2eb, 0, 0, gUnknown_835A308, gUnknown_835B598},
    {0x29a, 0, 0, gUnknown_835A4A8, gUnknown_835B5A0},
    {0x2b9, 0, 0, gUnknown_835A648, gUnknown_835B5A8},
    {0x2af, 0, 0, gUnknown_835A7E8, gUnknown_835B5B0},
    {0x30c, 0, 0, gUnknown_835A988, gUnknown_835B5B8},
    {0x28d, 1, 1, gUnknown_8354C28, gUnknown_835B560},
    {0x2de, 1, 1, gUnknown_8354F48, gUnknown_835B568},
    {0x2ab, 1, 1, gUnknown_8355268, gUnknown_835B570},
    {0x281, 0, 1, gUnknown_8355588, gUnknown_835B578},
    {0x2e2, 1, 1, gUnknown_8359CA8, gUnknown_835B580},
    {0x296, 1, 1, gUnknown_835AB28, gUnknown_835B5C0},
    {0x2c3, 1, 1, gUnknown_835AE48, gUnknown_835B5C8},
    {0x356, 1, 1, gUnknown_835B168, gUnknown_835B5D0},
    {}
};

static void UpdateDrawDoorFrame(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, int x, int y)
{
    if (frames->tile == 0xFFFF)
    {
        DrawDoorDefaultImage(gfx, x, y);
    }
    else
    {
        LoadDoorFrameTiles(&gfx->tiles[frames->tile]);
        SetDoorFramePalettes(gfx, x, y, gfx->palettes);
    }
}

static void DrawDoorDefaultImage(const struct DoorGraphics * gfx, int x, int y)
{
    if (gfx->size == 0)
    {
        CurrentMapDrawMetatileAt(x, y);
    }
    else
    {
        CurrentMapDrawMetatileAt(x, y);
        CurrentMapDrawMetatileAt(x, y - 1);
    }
}

static void LoadDoorFrameTiles(const u8 *a0)
{
    CpuFastCopy(a0, (void *)(BG_VRAM + 0x7F00), 0x100);
}

static void SetDoorFramePalettes(const struct DoorGraphics * gfx, int x, int y, const u8 *a3)
{
    u16 sp00[8];
    if (gfx->size == 0)
    {
        BufferDoorFrameTilesWithPalettes(sp00, 0x3F8, a3);
    }
    else
    {
        BufferDoorFrameTilesWithPalettes(sp00, 0x3F8, a3);
        DrawDoorMetatileAt(x, y - 1, sp00);
        BufferDoorFrameTilesWithPalettes(sp00, 0x3FC, a3 + 4);
    }
    DrawDoorMetatileAt(x, y, sp00);
}

static void BufferDoorFrameTilesWithPalettes(u16 *a0, u16 a1, const u8 *a2)
{
    int i;
    u16 tile;
    for (i = 0; i < 4; i++)
    {
        tile = *(a2++) << 12;
        a0[i] = tile | (a1 + i);
    }
    for (; i < 8; i++)
    {
        tile = *(a2++) << 12;
        a0[i] = tile;
    }
}

static void Task_AnimateDoor(u8 taskId)
{
    s16 *data = (void *)gTasks[taskId].data;
    const struct DoorAnimFrame * frames = (const void *)(((u16)data[0] << 16) | (u16)data[1]);
    const struct DoorGraphics * gfx = (const void *)(((u16)data[2] << 16) | (u16)data[3]);
    if (!PlayDoorAnimationFrame(gfx, frames, data))
        DestroyTask(taskId);
}

static bool32 PlayDoorAnimationFrame(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, s16 *data)
{
    if (data[5] == 0)
    {
        UpdateDrawDoorFrame(gfx, &frames[data[4]], data[6], data[7]);
    }
    if (data[5] == frames[data[4]].duration)
    {
        data[5] = 0;
        data[4]++;
        if (frames[data[4]].duration == 0)
            return FALSE;
    }
    else
    {
        data[5]++;
    }
    return TRUE;
}

static const struct DoorGraphics * door_find(const struct DoorGraphics * gfx, u16 id)
{
    while (gfx->tiles != NULL)
    {
        if (gfx->metatileId == id)
            return gfx;
        gfx++;
    }
    return NULL;
}

static s8 task_overworld_door_add_if_inactive(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, int a2, int a3)
{
    u8 taskId;
    s16 *data;
    if (FuncIsActiveTask(Task_AnimateDoor) == TRUE)
        return -1;
    taskId = CreateTask(Task_AnimateDoor, 80);
    data = gTasks[taskId].data;
    data[6] = a2;
    data[7] = a3;
    data[1] = (uintptr_t)frames;
    data[0] = (uintptr_t)frames >> 16;
    data[3] = (uintptr_t)gfx;
    data[2] = (uintptr_t)gfx >> 16;
    return taskId;
}

static void DrawClosedDoor(const struct DoorGraphics * gfx, int a1, int a2)
{
    DrawDoorDefaultImage(gfx, a1, a2);
}

static void DrawOpenedDoor(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = door_find(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx != NULL)
    {
        UpdateDrawDoorFrame(gfx, SeekToEndOfDoorAnim(gfx->size == 0 ? sDoorAnimFrames_OpenSmall : sDoorAnimFrames_OpenLarge), x, y);
    }
}

static const struct DoorAnimFrame * SeekToEndOfDoorAnim(const struct DoorAnimFrame * frames)
{
    while (frames->duration != 0)
        frames++;
    return frames - 1;
}

static s8 AnimateDoorOpenInternal(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = door_find(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else if (gfx->size == 0)
        return task_overworld_door_add_if_inactive(gfx, sDoorAnimFrames_OpenSmall, x, y);
    else
        return task_overworld_door_add_if_inactive(gfx, sDoorAnimFrames_OpenLarge, x, y);
}

static s8 AnimateDoorCloseInternal(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = door_find(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else if (gfx->size == 0)
        return task_overworld_door_add_if_inactive(gfx, sDoorAnimFrames_CloseSmall, x, y);
    else
        return task_overworld_door_add_if_inactive(gfx, sDoorAnimFrames_CloseLarge, x, y);
}

void FieldSetDoorOpened(int x, int y)
{
    if (MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        DrawOpenedDoor(sDoorGraphics, x, y);
}

void FieldSetDoorClosed(int x, int y)
{
    if (MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        DrawClosedDoor(sDoorGraphics, x, y);
}

s8 FieldAnimateDoorClose(int x, int y)
{
    if (!MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        return -1;
    return AnimateDoorCloseInternal(sDoorGraphics, x, y);
}

s8 FieldAnimateDoorOpen(int x, int y)
{
    if (!MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        return -1;
    return AnimateDoorOpenInternal(sDoorGraphics, x, y);
}

bool8 FieldIsDoorAnimationRunning(void)
{
    return FuncIsActiveTask(Task_AnimateDoor);
}

u16 GetDoorSoundEffect(x, y)
{
    if (!GetDoorOpenType(sDoorGraphics, x, y))
        return MUS_W_DOOR;
    else
        return SE_JIDO_DOA;
}

static s8 GetDoorOpenType(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = door_find(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    return gfx->sliding;
}
