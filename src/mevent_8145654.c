#include "global.h"
#include "malloc.h"
#include "mevent.h"

struct UnkStruct_8467FB8
{
    u16 ident;
    const void * unk_04;
    const void * unk_08;
    const void * unk_0C;
};

struct UnkStruct_203F3C8
{
    /*0000*/ struct MEventBuffer_32E0_Sub unk_0000;
    /*014c*/ struct MEventBuffer_3430_Sub unk_014c;
    /*0170*/ const struct UnkStruct_8467FB8 * unk_0170;
    /*0174*/ u8 filler_0174[0x12E8];
};

EWRAM_DATA struct UnkStruct_203F3C8 * gUnknown_203F3C8 = NULL;

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
