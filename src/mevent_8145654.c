#include "global.h"
#include "bg.h"
#include "palette.h"
#include "decompress.h"
#include "malloc.h"
#include "menu.h"
#include "pokemon_icon.h"
#include "mevent.h"

struct UnkStruct_8467FB8
{
    u16 ident;
    const u8 * tiles;
    const u8 * map;
    const u16 * pal;
};

struct UnkStruct_203F3C8
{
    /*0000*/ struct MEventBuffer_32E0_Sub unk_0000;
    /*014c*/ struct MEventBuffer_3430_Sub unk_014c;
    /*0170*/ const struct UnkStruct_8467FB8 * unk_0170;
    /*0174*/ u8 unk_0174;
    /*0176*/ u16 unk_0176;
    /*0178*/ u16 unk_0178;
    /*017A*/ u16 unk_017A;
    /*017C*/ u8 filler_0178[0x2E0];
    /*045C*/ u8 buffer_045C[0x1000];
};

EWRAM_DATA struct UnkStruct_203F3C8 * gUnknown_203F3C8 = NULL;

void sub_8145A98(void);
void sub_8145D18(u8 bgId);
void sub_8146060(void);

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
