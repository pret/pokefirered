#include "global.h"
#include "bg.h"
#include "palette.h"
#include "decompress.h"
#include "malloc.h"
#include "menu.h"
#include "pokemon_icon.h"
#include "mystery_gift_menu.h"
#include "string_util.h"
#include "mevent.h"

struct UnkStruct_8467FB8
{
    u16 ident;
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
    /*014c*/ struct MEventBuffer_3430_Sub unk_014c;
    /*0170*/ const struct UnkStruct_8467FB8 * unk_0170;
    /*0174*/ u8 unk_0174;
    /*0175*/ u8 unk_0175;
    /*0176*/ u16 unk_0176;
    /*0178*/ u16 unk_0178;
    /*017A*/ u16 unk_017A;
    /*017C*/ u8 filler_017C[15];
    /*018B*/ u8 unk_018B[41];
    /*01B4*/ u8 unk_01B4[41];
    /*01DD*/ u8 unk_01DD[7];
    /*01E4*/ u8 unk_01E4[4][41];
    /*0288*/ u8 unk_0288[41];
    /*02B1*/ u8 unk_02B1[41];
    /*02DC*/ struct UnkStruct_203F3C8_02DC unk_02DC[8];
    /*045C*/ u8 buffer_045C[0x1000];
};

struct UnkStruct_203F3CC
{
    /*0000*/ u8 filler_0000[0x13a4];
};

EWRAM_DATA struct UnkStruct_203F3C8 * gUnknown_203F3C8 = NULL;
EWRAM_DATA struct UnkStruct_203F3CC * gUnknown_203F3CC = NULL;

void sub_8145A98(void);
void sub_8145D18(u8 bgId);
void sub_8146060(void);
void sub_81461D8(void);

extern const struct WindowTemplate gUnknown_8467074[3];

extern const struct UnkStruct_8467FB8 gUnknown_8467FB8[8];

bool32 sub_8145654(struct MEventBuffer_32E0_Sub * r5, struct MEventBuffer_3430_Sub * r6)
{
    if (r5 == NULL || r6 == NULL)
        return FALSE;
    gUnknown_203F3C8 = AllocZeroed(sizeof(struct UnkStruct_203F3C8));
    if (gUnknown_203F3C8 == NULL)
        return FALSE;
    gUnknown_203F3C8->unk_0000 = *r5;
    gUnknown_203F3C8->unk_014c = *r6;
    if (gUnknown_203F3C8->unk_0000.unk_08_2 > 7)
        gUnknown_203F3C8->unk_0000.unk_08_2 = 0;
    if (gUnknown_203F3C8->unk_0000.unk_08_0 > 2)
        gUnknown_203F3C8->unk_0000.unk_08_0 = 0;
    if (gUnknown_203F3C8->unk_0000.unk_09 > 7)
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
            gUnknown_203F3C8->unk_0176 = AddWindow(&gUnknown_8467074[0]);
            gUnknown_203F3C8->unk_0178 = AddWindow(&gUnknown_8467074[1]);
            gUnknown_203F3C8->unk_017A = AddWindow(&gUnknown_8467074[2]);
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
            RemoveWindow(gUnknown_203F3C8->unk_017A);
            RemoveWindow(gUnknown_203F3C8->unk_0178);
            RemoveWindow(gUnknown_203F3C8->unk_0176);
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
            sp0[0] = gUnknown_203F3C8->unk_014c.unk_00 < 999 ? gUnknown_203F3C8->unk_014c.unk_00 : 999;
            sp0[1] = gUnknown_203F3C8->unk_014c.unk_02 < 999 ? gUnknown_203F3C8->unk_014c.unk_02 : 999;
            sp0[2] = gUnknown_203F3C8->unk_014c.unk_04 < 999 ? gUnknown_203F3C8->unk_014c.unk_04 : 999;
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
