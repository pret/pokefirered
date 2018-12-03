#include "global.h"
#include "constants/species.h"
#include "bg.h"
#include "gpu_regs.h"
#include "palette.h"
#include "decompress.h"
#include "malloc.h"
#include "menu.h"
#include "pokemon_icon.h"
#include "mystery_gift_menu.h"
#include "menu_indicators.h"
#include "string_util.h"
#include "link_rfu.h"
#include "mevent.h"

struct UnkStruct_8467FB8
{
    u8 textPal1:4;
    u8 textPal2:4;
    u8 textPal3:4;
    u8 textPal4:4;
    const u8 * tiles;
    const u8 * map;
    const u16 * pal;
};

struct UnkStruct_203F3C8_02DC
{
    u8 unk_00;
    u8 unk_01[41];
    u8 unk_42[4];
};

struct UnkStruct_203F3C8
{
    /*0000*/ struct MEventBuffer_32E0_Sub unk_0000;
    /*014c*/ struct MEventBuffer_3430_Sub unk_014C;
    /*0170*/ const struct UnkStruct_8467FB8 * unk_0170;
    /*0174*/ u8 unk_0174;
    /*0175*/ u8 unk_0175;
    /*0176*/ u16 unk_0176[3];
    /*017C*/ u8 unk_017C;
    /*017D*/ u8 unk_017D[7][2];
    /*018B*/ u8 unk_018B[41];
    /*01B4*/ u8 unk_01B4[41];
    /*01DD*/ u8 unk_01DD[7];
    /*01E4*/ u8 unk_01E4[4][41];
    /*0288*/ u8 unk_0288[41];
    /*02B1*/ u8 unk_02B1[41];
    /*02DC*/ struct UnkStruct_203F3C8_02DC unk_02DC[8];
    /*045C*/ u8 buffer_045C[0x1000];
};

EWRAM_DATA struct UnkStruct_203F3C8 * gUnknown_203F3C8 = NULL;

void sub_8145A98(void);
void sub_8145D18(u8 whichWindow);
void sub_8146060(void);
void sub_81461D8(void);

extern const struct OamData gUnknown_83AC9F8;

const struct TextColor gUnknown_8467068[] = {
    {0, 2, 3},
    {0, 1, 2}
};
const u8 ALIGNED(4) gUnknown_8467070[3] = {7, 4, 7};
const struct WindowTemplate gUnknown_8467074[] = {
    {0x01, 0x01, 0x01, 0x19, 0x04, 0x0f, 0x029c},
    {0x01, 0x01, 0x06, 0x1c, 0x08, 0x0f, 0x01bc},
    {0x01, 0x01, 0x0e, 0x1c, 0x05, 0x0f, 0x0130}
};

const u16 gUnknown_846708C[] = INCBIN_U16("data/graphics/mevent/pal_46708C.gbapal");
const u16 gUnknown_84670AC[] = INCBIN_U16("data/graphics/mevent/pal_4670AC.gbapal");
const u16 gUnknown_84670CC[] = INCBIN_U16("data/graphics/mevent/pal_4670CC.gbapal");
const u16 gUnknown_84670EC[] = INCBIN_U16("data/graphics/mevent/pal_4670EC.gbapal");
const u16 gUnknown_846710C[] = INCBIN_U16("data/graphics/mevent/pal_46710C.gbapal");
const u16 gUnknown_846712C[] = INCBIN_U16("data/graphics/mevent/pal_46712C.gbapal");
const u16 gUnknown_846714C[] = INCBIN_U16("data/graphics/mevent/pal_46714C.gbapal");
const u16 gUnknown_846716C[] = INCBIN_U16("data/graphics/mevent/pal_46716C.gbapal");
const u8 gUnknown_846718C[] = INCBIN_U8("data/graphics/mevent/gfx_46718C.4bpp.lz");
const u8 gUnknown_8467288[] = INCBIN_U8("data/graphics/mevent/tilemap_467288.bin.lz");
const u8 gUnknown_846737C[] = INCBIN_U8("data/graphics/mevent/gfx_46737C.4bpp.lz");
const u8 gUnknown_8467470[] = INCBIN_U8("data/graphics/mevent/tilemap_467470.bin.lz");
const u8 gUnknown_8467558[] = INCBIN_U8("data/graphics/mevent/gfx_467558.4bpp.lz");
const u8 gUnknown_846762C[] = INCBIN_U8("data/graphics/mevent/tilemap_46762C.bin.lz");
const u8 gUnknown_8467700[] = INCBIN_U8("data/graphics/mevent/gfx_467700.4bpp.lz");
const u8 gUnknown_8467934[] = INCBIN_U8("data/graphics/mevent/tilemap_467934.bin.lz");
const u8 gUnknown_8467A7C[] = INCBIN_U8("data/graphics/mevent/gfx_467A7C.4bpp.lz");
const u8 gUnknown_8467CAC[] = INCBIN_U8("data/graphics/mevent/tilemap_467CAC.bin.lz");
const u16 gUnknown_8467DF4[] = INCBIN_U16("data/graphics/mevent/pal_467DF4.gbapal");
const u16 gUnknown_8467E14[] = INCBIN_U16("data/graphics/mevent/pal_467E14.gbapal");
const u16 gUnknown_8467E34[] = INCBIN_U16("data/graphics/mevent/pal_467E34.gbapal");
const u16 gUnknown_8467E54[] = INCBIN_U16("data/graphics/mevent/pal_467E54.gbapal");
const u16 gUnknown_8467E74[] = INCBIN_U16("data/graphics/mevent/pal_467E74.gbapal");
const u16 gUnknown_8467E94[] = INCBIN_U16("data/graphics/mevent/pal_467E94.gbapal");
const u16 gUnknown_8467EB4[] = INCBIN_U16("data/graphics/mevent/pal_467EB4.gbapal");
const u16 gUnknown_8467ED4[] = INCBIN_U16("data/graphics/mevent/pal_467ED4.gbapal");
const u8 gUnknown_8467EF4[] = INCBIN_U8("data/graphics/mevent/gfx_467EF4.4bpp.lz");

const struct CompressedSpriteSheet gUnknown_8467F58 = {
    gUnknown_8467EF4, 0x100, 0x8000
};
const struct SpritePalette gUnknown_8467F60[] = {
    {gUnknown_8467DF4, 0x8000},
    {gUnknown_8467E14, 0x8000},
    {gUnknown_8467E34, 0x8000},
    {gUnknown_8467E54, 0x8000},
    {gUnknown_8467E74, 0x8000},
    {gUnknown_8467E94, 0x8000},
    {gUnknown_8467EB4, 0x8000},
    {gUnknown_8467ED4, 0x8000}
};
const struct SpriteTemplate gUnknown_8467FA0 = {
    0x8000, 0x8000, &gUnknown_83AC9F8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};
const struct UnkStruct_8467FB8 gUnknown_8467FB8[8] = {
    {1, 0, 0, 0, gUnknown_846718C, gUnknown_8467288, gUnknown_846708C},
    {1, 0, 0, 1, gUnknown_846737C, gUnknown_8467470, gUnknown_84670AC},
    {1, 0, 0, 2, gUnknown_8467558, gUnknown_846762C, gUnknown_84670CC},
    {1, 0, 0, 3, gUnknown_8467558, gUnknown_846762C, gUnknown_84670EC},
    {1, 0, 0, 4, gUnknown_8467558, gUnknown_846762C, gUnknown_846710C},
    {1, 0, 0, 5, gUnknown_8467558, gUnknown_846762C, gUnknown_846712C},
    {1, 0, 0, 6, gUnknown_8467700, gUnknown_8467934, gUnknown_846714C},
    {1, 0, 0, 7, gUnknown_8467A7C, gUnknown_8467CAC, gUnknown_846716C}
};

bool32 sub_8145654(struct MEventBuffer_32E0_Sub * r5, struct MEventBuffer_3430_Sub * r6)
{
    if (r5 == NULL || r6 == NULL)
        return FALSE;
    gUnknown_203F3C8 = AllocZeroed(sizeof(struct UnkStruct_203F3C8));
    if (gUnknown_203F3C8 == NULL)
        return FALSE;
    gUnknown_203F3C8->unk_0000 = *r5;
    gUnknown_203F3C8->unk_014C = *r6;
    if (gUnknown_203F3C8->unk_0000.unk_08_2 >= NELEMS(gUnknown_8467FB8))
        gUnknown_203F3C8->unk_0000.unk_08_2 = 0;
    if (gUnknown_203F3C8->unk_0000.unk_08_0 >= NELEMS(gUnknown_8467070))
        gUnknown_203F3C8->unk_0000.unk_08_0 = 0;
    if (gUnknown_203F3C8->unk_0000.unk_09 > NELEMS(gUnknown_203F3C8->unk_017D))
        gUnknown_203F3C8->unk_0000.unk_09 = 0;
    gUnknown_203F3C8->unk_0170 = &gUnknown_8467FB8[gUnknown_203F3C8->unk_0000.unk_08_2];
    return TRUE;
}

void sub_81456F0(void)
{
    if (gUnknown_203F3C8 != NULL)
    {
        *gUnknown_203F3C8 = (struct UnkStruct_203F3C8){};
        Free(gUnknown_203F3C8);
        gUnknown_203F3C8 = NULL;
    }
}

s32 sub_814571C(void)
{
    if (gUnknown_203F3C8 == NULL)
        return -1;
    switch(gUnknown_203F3C8->unk_0174)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            break;
        case 1:
            if (UpdatePaletteFade())
                return 0;
            break;
        case 2:
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 30, 20);
            CopyBgTilemapBufferToVram(0);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(2);
            decompress_and_copy_tile_data_to_vram(2, gUnknown_203F3C8->unk_0170->tiles, 0, 0x008, 0);
            gUnknown_203F3C8->unk_0176[0] = AddWindow(&gUnknown_8467074[0]);
            gUnknown_203F3C8->unk_0176[1] = AddWindow(&gUnknown_8467074[1]);
            gUnknown_203F3C8->unk_0176[2] = AddWindow(&gUnknown_8467074[2]);
            break;
        case 3:
            if (free_temp_tile_data_buffers_if_possible())
                return 0;
            gPaletteFade.bufferTransferDisabled = TRUE;
            LoadPalette(gUnknown_203F3C8->unk_0170->pal, 0x10, 0x20);
            LZ77UnCompWram(gUnknown_203F3C8->unk_0170->map, gUnknown_203F3C8->buffer_045C);
            CopyRectToBgTilemapBufferRect(2, gUnknown_203F3C8->buffer_045C, 0, 0, 30, 20, 0, 0, 30, 20, 1, 0x008, 0);
            CopyBgTilemapBufferToVram(2);
            break;
        case 4:
            sub_8145A98();
            break;
        case 5:
            sub_8145D18(0);
            sub_8145D18(1);
            sub_8145D18(2);
            CopyBgTilemapBufferToVram(1);
            break;
        case 6:
            sub_809707C();
            break;
        case 7:
            ShowBg(1);
            ShowBg(2);
            gPaletteFade.bufferTransferDisabled = FALSE;
            sub_8146060();
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
            UpdatePaletteFade();
            break;
        default:
            if (UpdatePaletteFade())
                return 0;
            gUnknown_203F3C8->unk_0174 = 0;
            return 1;
    }
    ++gUnknown_203F3C8->unk_0174;
    return 0;
}

s32 sub_814593C(bool32 flag)
{
    if (gUnknown_203F3C8 == NULL)
        return -1;
    switch (gUnknown_203F3C8->unk_0174)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            break;
        case 1:
            if (UpdatePaletteFade())
                return 0;
            break;
        case 2:
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 30, 20);
            CopyBgTilemapBufferToVram(0);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(2);
            break;
        case 3:
            HideBg(1);
            HideBg(2);
            RemoveWindow(gUnknown_203F3C8->unk_0176[2]);
            RemoveWindow(gUnknown_203F3C8->unk_0176[1]);
            RemoveWindow(gUnknown_203F3C8->unk_0176[0]);
            break;
        case 4:
            sub_81461D8();
            FreeMonIconPalettes();
            break;
        case 5:
            sub_8142344(gUnknown_203F3B8, flag);
            break;
        case 6:
            CopyBgTilemapBufferToVram(0);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
            break;
        default:
            if (UpdatePaletteFade())
                return 0;
            gUnknown_203F3C8->unk_0174 = 0;
            return 1;
    }
    ++gUnknown_203F3C8->unk_0174;
    return 0;
}

void sub_8145A98(void)
{
    u16 i = 0;
    u16 r6;
    u16 sp0[3] = {0, 0, 0};

    memcpy(gUnknown_203F3C8->unk_018B, gUnknown_203F3C8->unk_0000.unk_0A, 40);
    gUnknown_203F3C8->unk_018B[40] = EOS;
    memcpy(gUnknown_203F3C8->unk_01B4, gUnknown_203F3C8->unk_0000.unk_32, 40);
    gUnknown_203F3C8->unk_01B4[40] = EOS;
    if (gUnknown_203F3C8->unk_0000.unk_04 > 999999)
        gUnknown_203F3C8->unk_0000.unk_04 = 999999;
    ConvertIntToDecimalStringN(gUnknown_203F3C8->unk_01DD, gUnknown_203F3C8->unk_0000.unk_04, STR_CONV_MODE_LEFT_ALIGN, 6);
    for (i = 0; i < 4; i++)
    {
        memcpy(gUnknown_203F3C8->unk_01E4[i], gUnknown_203F3C8->unk_0000.unk_5A[i], 40);
        gUnknown_203F3C8->unk_01E4[i][40] = EOS;
    }
    memcpy(gUnknown_203F3C8->unk_0288, gUnknown_203F3C8->unk_0000.unk_FA, 40);
    gUnknown_203F3C8->unk_0288[40] = EOS;
    switch (gUnknown_203F3C8->unk_0000.unk_08_0)
    {
        case 0:
            memcpy(gUnknown_203F3C8->unk_02B1, gUnknown_203F3C8->unk_0000.unk_122, 40);
            gUnknown_203F3C8->unk_02B1[40] = EOS;
            break;
        case 1:
            gUnknown_203F3C8->unk_02B1[00] = EOS;
            break;
        case 2:
            gUnknown_203F3C8->unk_02B1[00] = EOS;
            sp0[0] = gUnknown_203F3C8->unk_014C.unk_00 < 999 ? gUnknown_203F3C8->unk_014C.unk_00 : 999;
            sp0[1] = gUnknown_203F3C8->unk_014C.unk_02 < 999 ? gUnknown_203F3C8->unk_014C.unk_02 : 999;
            sp0[2] = gUnknown_203F3C8->unk_014C.unk_04 < 999 ? gUnknown_203F3C8->unk_014C.unk_04 : 999;
            for (i = 0; i < 8; i++)
            {
                memset(gUnknown_203F3C8->unk_02DC[i].unk_42, EOS, 4);
                memset(gUnknown_203F3C8->unk_02DC[i].unk_01, EOS, 41);
            }
            for (i = 0, r6 = 0; i < 40; i++)
            {
                if (gUnknown_203F3C8->unk_0000.unk_122[i] != 0xF7)
                {
                    gUnknown_203F3C8->unk_02DC[gUnknown_203F3C8->unk_0175].unk_01[r6] = gUnknown_203F3C8->unk_0000.unk_122[i];
                    r6++;
                }
                else
                {
                    u8 r3 = gUnknown_203F3C8->unk_0000.unk_122[i + 1];
                    if (r3 > 2)
                    {
                        i += 2;
                    }
                    else
                    {
                        ConvertIntToDecimalStringN(gUnknown_203F3C8->unk_02DC[gUnknown_203F3C8->unk_0175].unk_42, sp0[r3], STR_CONV_MODE_LEADING_ZEROS, 3);
                        gUnknown_203F3C8->unk_02DC[gUnknown_203F3C8->unk_0175].unk_00 = gUnknown_203F3C8->unk_0000.unk_122[i + 2];
                        gUnknown_203F3C8->unk_0175++;
                        if (gUnknown_203F3C8->unk_0175 > 7)
                            break;
                        r6 = 0;
                        i += 2;
                    }
                }
            }
    }
}

void sub_8145D18(u8 whichWindow)
{
    s8 sp0C = 0;
    s32 windowId = gUnknown_203F3C8->unk_0176[whichWindow];
    PutWindowTilemap(windowId);
    FillWindowPixelBuffer(windowId, 0);
    switch (whichWindow)
    {
        case 0:
        {
            s32 x;
            box_print(windowId, 3, 0, 1, &gUnknown_8467068[gUnknown_203F3C8->unk_0170->textPal1], 0, gUnknown_203F3C8->unk_018B);
            x = 160 - GetStringWidth(3, gUnknown_203F3C8->unk_01B4, GetFontAttribute(3, 2));
            if (x < 0)
                x = 0;
            box_print(windowId, 3, x, 17, &gUnknown_8467068[gUnknown_203F3C8->unk_0170->textPal1], 0, gUnknown_203F3C8->unk_01B4);
            if (gUnknown_203F3C8->unk_0000.unk_04 != 0)
            {
                box_print(windowId, 2, 166, 17, &gUnknown_8467068[gUnknown_203F3C8->unk_0170->textPal1], 0, gUnknown_203F3C8->unk_01DD);
            }
            break;
        }
        case 1:
            for (; sp0C < 4; sp0C++)
            {
                box_print(windowId, 3, 0, 16 * sp0C + 2, &gUnknown_8467068[gUnknown_203F3C8->unk_0170->textPal2], 0, gUnknown_203F3C8->unk_01E4[sp0C]);
            }
            break;
        case 2:
            box_print(windowId, 3, 0, gUnknown_8467070[gUnknown_203F3C8->unk_0000.unk_08_0], &gUnknown_8467068[gUnknown_203F3C8->unk_0170->textPal3], 0, gUnknown_203F3C8->unk_0288);
            if (gUnknown_203F3C8->unk_0000.unk_08_0 != 2)
            {
                box_print(windowId, 3, 0, 16 + gUnknown_8467070[gUnknown_203F3C8->unk_0000.unk_08_0], &gUnknown_8467068[gUnknown_203F3C8->unk_0170->textPal3], 0, gUnknown_203F3C8->unk_02B1);
            }
            else
            {
                s32 x = 0;
                s32 y = gUnknown_8467070[gUnknown_203F3C8->unk_0000.unk_08_0] + 16;
                s32 spacing = GetFontAttribute(3, 2);
                for (; sp0C < gUnknown_203F3C8->unk_0175; sp0C++)
                {
                    box_print(windowId, 3, x, y, &gUnknown_8467068[gUnknown_203F3C8->unk_0170->textPal3], 0, gUnknown_203F3C8->unk_02DC[sp0C].unk_01);
                    if (gUnknown_203F3C8->unk_02DC[sp0C].unk_42[0] != EOS)
                    {
                        x += GetStringWidth(3, gUnknown_203F3C8->unk_02DC[sp0C].unk_01, spacing);
                        box_print(windowId, 2, x, y, &gUnknown_8467068[gUnknown_203F3C8->unk_0170->textPal3], 0, gUnknown_203F3C8->unk_02DC[sp0C].unk_42);
                        x += GetStringWidth(3, gUnknown_203F3C8->unk_02DC[sp0C].unk_42, spacing) + gUnknown_203F3C8->unk_02DC[sp0C].unk_00;
                    }
                }
            }
            break;
    }
    CopyWindowToVram(windowId, 3);
}

void sub_8146060(void)
{
    u8 r7 = 0;
    gUnknown_203F3C8->unk_017C = 0xFF;
    if (gUnknown_203F3C8->unk_014C.unk_06 != SPECIES_NONE)
    {
        gUnknown_203F3C8->unk_017C = sub_8096ECC(sub_8096FD4(gUnknown_203F3C8->unk_014C.unk_06), SpriteCallbackDummy, 0xDC, 0x14, 0, FALSE);
        gSprites[gUnknown_203F3C8->unk_017C].oam.priority = 2;
    }
    if (gUnknown_203F3C8->unk_0000.unk_09 != 0 && gUnknown_203F3C8->unk_0000.unk_08_0 == 1)
    {
        sub_800F034(&gUnknown_8467F58);
        LoadSpritePalette(&gUnknown_8467F60[gUnknown_203F3C8->unk_0170->textPal4]);
        for (; r7 < gUnknown_203F3C8->unk_0000.unk_09; r7++)
        {
            gUnknown_203F3C8->unk_017D[r7][0] = 0xFF;
            gUnknown_203F3C8->unk_017D[r7][1] = 0xFF;
            gUnknown_203F3C8->unk_017D[r7][0] = CreateSprite(&gUnknown_8467FA0, 0xd8 - 32 * r7, 0x90, 8);
            if (gUnknown_203F3C8->unk_014C.unk_08[0][r7] != 0)
            {
                gUnknown_203F3C8->unk_017D[r7][1] = sub_8096ECC(sub_8096FD4(gUnknown_203F3C8->unk_014C.unk_08[0][r7]), SpriteCallbackDummy, 0xd8 - 32 * r7, 0x88, 0, 0);
                gSprites[gUnknown_203F3C8->unk_017D[r7][1]].oam.priority = 2;
            }
        }
    }
}

void sub_81461D8(void)
{
    u8 r6 = 0;
    if (gUnknown_203F3C8->unk_017C != 0xFF)
        sub_8097070(&gSprites[gUnknown_203F3C8->unk_017C]);
    if (gUnknown_203F3C8->unk_0000.unk_09 != 0 && gUnknown_203F3C8->unk_0000.unk_08_0 == 1)
    {
        for (; r6 < gUnknown_203F3C8->unk_0000.unk_09; r6++)
        {
            if (gUnknown_203F3C8->unk_017D[r6][0] != 0xFF)
            {
                DestroySprite(&gSprites[gUnknown_203F3C8->unk_017D[r6][0]]);
                // This might be a typo.  Uncomment the next line, and comment the one that follows, to get the presumed intended behavior.
                // if (gUnknown_203F3C8->unk_017D[r6][1] != 0xFF)
                if (gUnknown_203F3C8->unk_017D[r6][0] != 0xFF)
                {
                    sub_8097070(&gSprites[gUnknown_203F3C8->unk_017D[r6][1]]);
                }
            }
        }
        FreeSpriteTilesByTag(0x8000);
        FreeSpritePaletteByTag(0x8000);
    }
}

struct UnkStruct_8468720
{
    u8 unk0;
    const void * unk4;
    const void * unk8;
    const void * unkC;
};

struct UnkStruct_203F3CC
{
    /*0000*/ struct MEventBuffer_3120_Sub unk_0000;
    /*01bc*/ const struct UnkStruct_8468720 * unk_01BC;
    /*01c0*/ u8 unk_01C0_0:1;
    /*01c0*/ u8 unk_01C0_1:7;
    /*01c1*/ u8 unk_01C1;
    /*01c2*/ u8 filler_01C2[4];
    /*01c6*/ u16 unk_01C6;
    /*01c8*/ u16 unk_01C8[2];
    /*01cc*/ u8 filler_01CC[0x1C8];
    /*0394*/ struct ScrollIndicatorArrowPairTemplate unk_0394;
    /*03a4*/ u8 buffer_03A4[0x1000];
};

EWRAM_DATA struct UnkStruct_203F3CC * gUnknown_203F3CC = NULL;

void sub_8146980(void);
void sub_8146A30(void);

extern const struct TextColor gUnknown_8468038[2];
extern const struct WindowTemplate gUnknown_8468040[2];
extern const struct UnkStruct_8468720 gUnknown_8468720[8];
extern const struct ScrollIndicatorArrowPairTemplate gUnknown_8468050;

bool32 sub_8146288(const struct MEventBuffer_3120_Sub * a0)
{
    if (a0 == NULL)
        return FALSE;
    gUnknown_203F3CC = AllocZeroed(sizeof(struct UnkStruct_203F3CC));
    if (gUnknown_203F3CC == NULL)
        return FALSE;
    gUnknown_203F3CC->unk_0000 = *a0;
    if (gUnknown_203F3CC->unk_0000.unk_03 >= NELEMS(gUnknown_8468720))
        gUnknown_203F3CC->unk_0000.unk_03 = 0;
    gUnknown_203F3CC->unk_01BC = &gUnknown_8468720[gUnknown_203F3CC->unk_0000.unk_03];
    gUnknown_203F3CC->unk_01C1 = 0xFF;
    return TRUE;
}

void sub_81462EC(void)
{
    if (gUnknown_203F3CC != NULL)
    {
        *gUnknown_203F3CC = (struct UnkStruct_203F3CC){};
        Free(gUnknown_203F3CC);
        gUnknown_203F3CC = NULL;
    }
}

s32 sub_8146318(void)
{
    if (gUnknown_203F3CC == NULL)
        return -1;

    switch (gUnknown_203F3CC->unk_01C0_1)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            break;
        case 1:
            if (UpdatePaletteFade())
                return 0;
            ChangeBgY(0, 0, 0);
            ChangeBgY(1, 0, 0);
            ChangeBgY(2, 0, 0);
            ChangeBgY(3, 0, 0);
            SetGpuReg(REG_OFFSET_WIN0H, 0xF0);
            SetGpuReg(REG_OFFSET_WIN0V, 0x1A98);
            SetGpuReg(REG_OFFSET_WININ, 0x1F);
            SetGpuReg(REG_OFFSET_WINOUT, 0x1B);
            SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
            break;
        case 2:
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(3, 0x000, 0, 0, 30, 20);
            CopyBgTilemapBufferToVram(0);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(3);
            decompress_and_copy_tile_data_to_vram(3, gUnknown_203F3CC->unk_01BC->unk4, 0, 8, 0);
            gUnknown_203F3CC->unk_01C8[0] = AddWindow(&gUnknown_8468040[0]);
            gUnknown_203F3CC->unk_01C8[1] = AddWindow(&gUnknown_8468040[1]);
            break;
        case 3:
            if (free_temp_tile_data_buffers_if_possible())
                return 0;
            gPaletteFade.bufferTransferDisabled = TRUE;
            LoadPalette(gUnknown_203F3CC->unk_01BC->unkC, 0x10, 0x20);
            LZ77UnCompWram(gUnknown_203F3CC->unk_01BC->unk8, gUnknown_203F3CC->buffer_03A4);
            CopyRectToBgTilemapBufferRect(1, gUnknown_203F3CC->buffer_03A4, 0, 0, 30, 3, 0, 0, 30, 3, 1, 8, 0);
            CopyRectToBgTilemapBufferRect(3, gUnknown_203F3CC->buffer_03A4, 0, 3, 30, 23, 0, 3, 30, 23, 1, 8, 0);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(3);
            break;
        case 4:
            sub_8146980();
            break;
        case 5:
            sub_8146A30();
            CopyBgTilemapBufferToVram(0);
            CopyBgTilemapBufferToVram(2);
            break;
        case 6:
            ShowBg(1);
            ShowBg(2);
            ShowBg(3);
            gPaletteFade.bufferTransferDisabled = FALSE;
            gUnknown_203F3CC->unk_01C1 = AddScrollIndicatorArrowPair(&gUnknown_203F3CC->unk_0394, &gUnknown_203F3CC->unk_01C6);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
            UpdatePaletteFade();
            break;
        default:
            if (UpdatePaletteFade())
                return 0;
            gUnknown_203F3CC->unk_01C0_1 = 0;
            return 1;
    }

    ++gUnknown_203F3CC->unk_01C0_1;
    return 0;
}

s32 sub_8146604(bool32 flag)
{
    if (gUnknown_203F3CC == NULL)
        return -1;
    switch (gUnknown_203F3CC->unk_01C0_1)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            break;
        case 1:
            if (UpdatePaletteFade())
                return 0;
            ChangeBgY(2, 0, 0);
            SetGpuReg(REG_OFFSET_WIN0H, 0);
            SetGpuReg(REG_OFFSET_WIN0V, 0);
            SetGpuReg(REG_OFFSET_WININ, 0);
            SetGpuReg(REG_OFFSET_WINOUT, 0);
            ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
            break;
        case 2:
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 30, 24);
            FillBgTilemapBufferRect_Palette0(3, 0x000, 0, 0, 30, 24);
            CopyBgTilemapBufferToVram(0);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(3);
            break;
        case 3:
            HideBg(1);
            HideBg(2);
            RemoveWindow(gUnknown_203F3CC->unk_01C8[1]);
            RemoveWindow(gUnknown_203F3CC->unk_01C8[0]);
            break;
        case 4:
            ChangeBgY(2, 0, 0);
            ChangeBgY(3, 0, 0);
            if (gUnknown_203F3CC->unk_01C1 != 0xFF)
            {
                RemoveScrollIndicatorArrowPair(gUnknown_203F3CC->unk_01C1);
                gUnknown_203F3CC->unk_01C1 = 0xFF;
            }
            break;
        case 5:
            sub_8142344(gUnknown_203F3B8, flag);
            break;
        case 6:
            sub_8142420();
            CopyBgTilemapBufferToVram(0);
            CopyBgTilemapBufferToVram(3);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
            break;
        default:
            if (UpdatePaletteFade())
                return 0;
            gUnknown_203F3CC->unk_01C0_1 = 0;
            return 1;
    }
    ++gUnknown_203F3CC->unk_01C0_1;
    return 0;
}

void sub_81467EC(void)
{
    if (!gUnknown_203F3CC->unk_01C0_0 && gUnknown_203F3CC->unk_01C1 != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(gUnknown_203F3CC->unk_01C1);
        gUnknown_203F3CC->unk_01C1 = 0xFF;
        gUnknown_203F3CC->unk_01C0_0 = TRUE;
    }
}


void sub_8146834(void)
{
    if (gUnknown_203F3CC->unk_01C0_0)
    {
        gUnknown_203F3CC->unk_01C1 = AddScrollIndicatorArrowPair(&gUnknown_203F3CC->unk_0394, &gUnknown_203F3CC->unk_01C6);
        gUnknown_203F3CC->unk_01C0_0 = FALSE;
    }
}