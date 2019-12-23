#include "global.h"
#include "palette.h"
#include "task.h"
#include "malloc.h"
#include "overworld.h"
#include "event_data.h"
#include "region_map.h"
#include "constants/flags.h"
#include "constants/region_map.h"

struct UnkStruct_20399D4
{
    u8 filler_0000[0x4796];
    u8 field_4796;
    u8 field_4797[4];
    u8 field_479B;
    u8 field_479C;
    u8 filler_479D[3];
    u8 field_47A0;
    u8 filler_47A1[3];
    u8 field_47A4;
    u8 filler_47A5[3];
    u8 field_47A8;
    u8 filler_47A9[15];
    TaskFunc field_47B8;
    MainCallback field_47BC;
};

EWRAM_DATA struct UnkStruct_20399D4 * gUnknown_20399D4 = NULL;
EWRAM_DATA void * gUnknown_20399D8 = NULL;
EWRAM_DATA void * gUnknown_20399DC = NULL;
EWRAM_DATA void * gUnknown_20399E0 = NULL;
EWRAM_DATA void * gUnknown_20399E4 = NULL;
EWRAM_DATA void * gUnknown_20399E8 = NULL;
EWRAM_DATA void * gUnknown_20399EC = NULL;
EWRAM_DATA void * gUnknown_20399F0[3] = {};
EWRAM_DATA void * gUnknown_20399FC = NULL;

static void sub_80BFFD0(void);
void sub_80C0100(void);
void sub_80C04E4(u8 taskId);
void sub_80C4F08(u8 taskId);

#include "data/text/map_section_names.h"

extern const u16 gUnknown_83EF2DC[];
extern const u8 sSeviiMapsecs[3][30];
extern const u8 gUnknown_83F1B00[3][4];

static void RegionMap_DarkenPalette(u16 *pal, u16 size, u16 tint)
{
    int i;
    int r, g, b;

    for (i = 0; i < size; i++)
    {
        r = (*pal) & 0x1F;
        g = ((*pal) >> 5) & 0x1F;
        b = ((*pal) >> 10) & 0x1F;

        r = (((r << 8) / 100) * tint) >> 8;
        g = (((g << 8) / 100) * tint) >> 8;
        b = (((b << 8) / 100) * tint) >> 8;

        *pal = RGB2(r, g, b);
        pal++;
    }
}

void sub_80BFEA0(void)
{
    u16 pal[16];
    CpuCopy16(&gUnknown_83EF2DC[0x20], pal, sizeof(pal));
    RegionMap_DarkenPalette(pal, NELEMS(pal), 95);
    LoadPalette(pal, 0x20, 0x20);
    LoadPalette(&gUnknown_83EF2DC[0x2F], 0x2F, sizeof(u16));
}

void sub_80BFEDC(u8 kind)
{
    gUnknown_20399D4 = AllocZeroed(sizeof(struct UnkStruct_20399D4));
    if (gUnknown_20399D4 == NULL)
    {
        SetMainCallback2(CB2_ReturnToField);
    }
    else
    {
        gUnknown_2031DE0 = TRUE;
        gUnknown_20399D4->field_4796 = kind;
        gUnknown_20399D4->field_47A0 = 0;
        gUnknown_20399D4->field_47A4 = 0;
        gUnknown_20399D4->field_47A8 = 0;
        sub_80BFFD0();
        SetMainCallback2(sub_80C0100);
    }
}

void sub_80BFF50(u8 kind, MainCallback cb)
{
    gUnknown_20399D4 = AllocZeroed(sizeof(struct UnkStruct_20399D4));
    if (gUnknown_20399D4 == NULL)
    {
        SetMainCallback2(CB2_ReturnToField);
    }
    else
    {
        gUnknown_2031DE0 = TRUE;
        gUnknown_20399D4->field_4796 = kind;
        gUnknown_20399D4->field_47A0 = 0;
        gUnknown_20399D4->field_47A4 = 0;
        gUnknown_20399D4->field_47A8 = 0;
        gUnknown_20399D4->field_47BC = cb;
        sub_80BFFD0();
        SetMainCallback2(sub_80C0100);
    }
}

static void sub_80BFFD0(void)
{
    u8 i;
    u8 j;
    u8 r7;

    switch (gUnknown_20399D4->field_4796)
    {
    default:
    case 0:
    case 1:
        gUnknown_20399D4->field_47B8 = sub_80C04E4;
        break;
    case 2:
        gUnknown_20399D4->field_47B8 = sub_80C4F08;
        break;
    }
    for (i = 0; i < 4; i++)
    {
        gUnknown_20399D4->field_4797[i] = gUnknown_83F1B00[gUnknown_20399D4->field_4796][i];
    }
    if (!FlagGet(FLAG_SYS_SEVII_MAP_123))
        gUnknown_20399D4->field_4797[0] = FALSE;
    r7 = 0;
    j = 0;
    if (gMapHeader.regionMapSectionId >= MAPSECS_SEVII_123)
    {
        while (r7 == 0)
        {
            for (i = 0; sSeviiMapsecs[j][i] != MAPSEC_NONE; i++)
            {
                if (gMapHeader.regionMapSectionId == sSeviiMapsecs[j][i])
                {
                    r7 = j + 1;
                    break;
                }
            }
            j++;
        }
    }
    gUnknown_20399D4->field_479B = r7;
    gUnknown_20399D4->field_479C = r7;
}
