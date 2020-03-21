#include "global.h"
#include "gflib.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_special_anim_internal.h"
#include "strings.h"
#include "text_window.h"

void sub_811D7D4(u16 animType);

const u16 gUnknown_845963C[] = INCBIN_U16("graphics/pokemon_special_anim/unk_845963C.gbapal");
const u16 gUnknown_845965C[] = INCBIN_U16("graphics/pokemon_special_anim/unk_845965C.gbapal");
const u32 gUnknown_845967C[] = INCBIN_U32("graphics/pokemon_special_anim/unk_845967C.4bpp.lz");
const u32 gUnknown_845973C[] = INCBIN_U32("graphics/pokemon_special_anim/unk_845973C.bin.lz");
const u16 gUnknown_8459868[] = INCBIN_U16("graphics/pokemon_special_anim/unk_8459868.gbapal");
const u32 gUnknown_8459888[] = INCBIN_U32("graphics/pokemon_special_anim/unk_8459888.4bpp.lz");
const u16 gUnknown_84598A4[] = INCBIN_U16("graphics/pokemon_special_anim/unk_84598A4.gbapal");
const u32 gUnknown_84598C4[] = INCBIN_U32("graphics/pokemon_special_anim/unk_84598C4.4bpp.lz");
const u16 gUnknown_8459940[] = INCBIN_U16("graphics/pokemon_special_anim/unk_8459940.gbapal");
const u32 gUnknown_8459960[] = INCBIN_U32("graphics/pokemon_special_anim/unk_8459960.4bpp.lz");

const struct BgTemplate gUnknown_8459980[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x001
    }, {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

const struct WindowTemplate gUnknown_8459988[] = {
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 15,
        .width = 28,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x00a
    }, DUMMY_WIN_TEMPLATE
};

const u8 *const gUnknown_8459998[] = {
    gUnknown_841B2ED, // 1,
    gUnknown_841B2F1, // 2, and ‥ ‥ ‥
    gUnknown_841B2FF, // Poof!
};

void sub_811D184(struct PokemonSpecialAnimScene * buffer, u16 animType)
{
    FreeAllWindowBuffers();
    ResetTempTileDataBuffers();
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_8459980, NELEMS(gUnknown_8459980));
    InitWindows(gUnknown_8459988);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    SetBgTilemapBuffer(0, buffer->field_0914);
    SetBgTilemapBuffer(3, buffer->field_1914);
    RequestDma3Fill(0, (void *)BG_VRAM, 0x20, TRUE);
    FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 32, 32);
    sub_811D7D4(animType);
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    TextWindow_SetUserSelectedFrame(0, 0x000, 0xe0);
    CopyWindowToVram(0, 3);
    ShowBg(0);
    ShowBg(3);
    HideBg(1);
    HideBg(2);
    CopyBgTilemapBufferToVram(0);
    CopyBgTilemapBufferToVram(3);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
}

bool8 sub_811D280(void)
{
    if (!FreeTempTileDataBuffersIfPossible())
        return IsDma3ManagerBusyWithBgCopy();
    else
        return TRUE;
}

void sub_811D29C(void)
{
    FreeAllWindowBuffers();
}

void sub_811D2A8(void)
{
    PutWindowTilemap(0);
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    DrawTextBorderOuter(0, 0x001, 0xE);
    CopyWindowToVram(0, 3);
}

void sub_811D2D0(void)
{
    ClearWindowTilemap(0);
    ClearStdWindowAndFrameToTransparent(0, FALSE);
    CopyWindowToVram(0, 1);
}
