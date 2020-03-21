#include "global.h"
#include "gflib.h"
#include "dynamic_placeholder_text_util.h"
#include "item.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_special_anim_internal.h"
#include "strings.h"
#include "text_window.h"
#include "constants/songs.h"

void sub_811D7D4(u16 animType);
void sub_811DB7C(struct PokemonSpecialAnimScene * scene, u8 a1, u8 a2, u8 a3);
void sub_811DBA8(struct PokemonSpecialAnimScene * scene);
void sub_811E194(u8 a0);
void sub_811E204(struct PokemonSpecialAnimScene * scene);
bool8 sub_811E2F4(void);
void sub_811E348(struct PokemonSpecialAnimScene * scene);
void sub_811E388(void);
bool32 sub_811E5A4(void);

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

void sub_811D2EC(u8 a0)
{
    // a0 --> r5
    struct PokemonSpecialAnimScene * scene = sub_811D0A8(); // r4
    u16 itemId = sub_811D0B4(); // r7
    u16 strWidth = 0; // r8
    u8 textSpeed = GetTextSpeedSetting(); // r9
    struct Pokemon * pokemon = sub_811D094(); // r6
    u16 level;
    u8 *str;

    switch (a0)
    {
    case 0: // Item was used on Mon
        str = StringCopy(scene->field_0014, ItemId_GetName(itemId));
        str = StringCopy(str, gUnknown_841B285);
        GetMonData(pokemon, MON_DATA_NICKNAME, str);
        StringAppend(scene->field_0014, gUnknown_841B293);
        break;
    case 1: // Mon's level was elevated to level
        level = GetMonData(pokemon, MON_DATA_LEVEL);
        GetMonData(pokemon, MON_DATA_NICKNAME, scene->field_0014);
        str = StringAppend(scene->field_0014, gUnknown_841B295);
        if (level < MAX_LEVEL)
            level++;
        str = ConvertIntToDecimalStringN(str, level, STR_CONV_MODE_LEFT_ALIGN, level < MAX_LEVEL ? 2 : 3);
        StringAppend(str, gUnknown_841B2A7);
        break;
    case 9: // Mon learned move
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sub_811D0F4());
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, sub_811D0D0());
        DynamicPlaceholderTextUtil_ExpandPlaceholders(scene->field_0014, gUnknown_841B32E);
        break;
    case 4: //  poof!
        strWidth += GetStringWidth(2, gUnknown_841B2F1, -1);
        // fallthrough
    case 3: // 2 and...
        strWidth += GetStringWidth(2, gUnknown_841B2ED, -1);
        // fallthrough
    case 2: // 1
        StringCopy(scene->field_0014, gUnknown_8459998[a0 - 2]);
        textSpeed = 1;
        break;
    case 5: // Mon forgot move
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sub_811D0F4());
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, sub_811D0C4());
        DynamicPlaceholderTextUtil_ExpandPlaceholders(scene->field_0014, gUnknown_841B306);
        break;
    case 6: // And...
        StringCopy(scene->field_0014, gUnknown_841B315);
        break;
    case 7: // Machine set!
        StringCopy(scene->field_0014, gUnknown_841B31B);
        break;
    case 8: // Huh?
        StringCopy(scene->field_0014, gUnknown_841B329);
        break;
    default:
        return;
    }

    AddTextPrinterParameterized5(0, 2, scene->field_0014, strWidth, 0, textSpeed, NULL, 0, 4);
}

void sub_811D4D4(void)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    CopyWindowToVram(0, 2);
}

bool8 sub_811D4EC(void)
{
    return IsTextPrinterActive(0);
}

void sub_811D4FC(void)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    scene->field_0000 = 0;
    BlendPalettes((0x10000 << IndexOfSpritePaletteTag(0)) | 4, 16, RGB_BLACK);
    sub_811E204(scene);
}

bool8 sub_811D530(void)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();

    switch (scene->field_0000)
    {
    case 0:
        if (!sub_811E2F4())
        {
            BeginNormalPaletteFade((0x10000 << IndexOfSpritePaletteTag(0)) | 4, -1, 16, 0, RGB_BLACK);
            scene->field_0000++;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
            return FALSE;
        break;
    }
    return TRUE;
}

void sub_811D5A0(void)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    scene->field_0000 = 0;
}

void sub_811D5B0(void)
{
    sub_811E388();
    ResetPaletteFadeControl();
}

bool8 sub_811D5C0(void)
{
    struct PokemonSpecialAnimScene * scene = sub_811D0A8();
    switch (scene->field_0000)
    {
    case 0:
        sub_811E194(0);
        scene->field_0000++;
        break;
    case 1:
        if (!sub_811D9A8())
        {
            scene->field_0004 = 0;
            scene->field_0000++;
        }
        break;
    case 2:
        scene->field_0004++;
        if (scene->field_0004 > 20)
            scene->field_0000++;
        break;
    case 3:
        sub_811DB7C(scene, 1, 0, 1);
        scene->field_0004 = 0;
        scene->field_0000++;
        break;
    case 4:
        scene->field_0004++;
        if (scene->field_0004 > 0)
        {
            scene->field_0004 = 0;
            PlaySE(SE_W025);
            BeginNormalPaletteFade(0x00000001, 2, 0, 12, RGB(8, 13, 31));
            sub_811E348(scene);
            scene->field_0000++;
        }
        break;
    case 5:
        scene->field_0004++;
        if (scene->field_0004 > 70)
        {
            sub_811DBA8(scene);
            BeginNormalPaletteFade(0x00000001, 6, 12, 0, RGB(8, 13, 31));
            scene->field_0004 = 0;
            scene->field_0000++;
        }
        break;
    case 6:
        scene->field_0004++;
        if (!sub_811E5A4() && scene->field_0004 > 40)
        {
            scene->field_0004 = 0;
            scene->field_0000++;
        }
        break;
    case 7:
        scene->field_0004++;
        if (scene->field_0004 > 20)
        {
            scene->field_0000++;
        }
        break;
    case 8:
        PlaySE(SE_EXPMAX);
        DestroySprite(scene->field_0010);
        scene->field_0000++;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}
