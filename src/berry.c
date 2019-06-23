#include "global.h"
#include "berry.h"
#include "text.h"
#include "constants/items.h"

extern const struct Berry sBerries[];

#define ENIGMA_BERRY_STRUCT ({const struct Berry2 *berries = (const struct Berry2 *)sBerries;berries[ITEM_ENIGMA_BERRY - FIRST_BERRY_INDEX];})

void sub_809C718(void)
{
    s32 i;

    gSaveBlock1Ptr->enigmaBerry.berry = ENIGMA_BERRY_STRUCT;
    for (i = 0; i < 18; i++)
        gSaveBlock1Ptr->enigmaBerry.itemEffect[i] = 0;
    gSaveBlock1Ptr->enigmaBerry.holdEffect = 0;
    gSaveBlock1Ptr->enigmaBerry.holdEffectParam = 0;
    gSaveBlock1Ptr->enigmaBerry.checksum = GetEnigmaBerryChecksum(&gSaveBlock1Ptr->enigmaBerry);
}

void sub_809C794(void)
{
    CpuFill16(0, &gSaveBlock1Ptr->enigmaBerry, sizeof(gSaveBlock1Ptr->enigmaBerry));
    sub_809C718();
}

#ifdef NONMATCHING
void SetEnigmaBerry(u8 * berry)
{
    struct EnigmaBerry * enigmaBerry;

    sub_809C794();

    {
        const struct Berry2 * src = (const struct Berry2 *)berry;
        struct Berry2 * dest = &gSaveBlock1Ptr->enigmaBerry.berry;
        *dest = *src;
    }

    enigmaBerry = &gSaveBlock1Ptr->enigmaBerry;
    {
        s32 i = 0;
        u8 * dest = gSaveBlock1Ptr->enigmaBerry.itemEffect;
        const u8 * src = berry + 0x516;

        for (i = 0; i < 18; i++) dest[i] = src[i];
    }
    enigmaBerry->holdEffect = berry[0x528];
    enigmaBerry->holdEffectParam = berry[0x529];
    enigmaBerry->checksum = GetEnigmaBerryChecksum(enigmaBerry);
}
#else
NAKED
void SetEnigmaBerry(u8 * berry)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tadds r4, r0, 0\n"
                "\tbl sub_809C794\n"
                "\tadds r5, r4, 0\n"
                "\tldr r0, _0809C824 @ =gSaveBlock1Ptr\n"
                "\tldr r2, [r0]\n"
                "\tldr r0, _0809C828 @ =0x000030ec\n"
                "\tadds r4, r2, r0\n"
                "\tadds r1, r4, 0\n"
                "\tadds r0, r5, 0\n"
                "\tldm r0!, {r3,r6,r7}\n"
                "\tstm r1!, {r3,r6,r7}\n"
                "\tldm r0!, {r3,r6,r7}\n"
                "\tstm r1!, {r3,r6,r7}\n"
                "\tldr r0, [r0]\n"
                "\tstr r0, [r1]\n"
                "\tmovs r3, 0\n"
                "\tldr r0, _0809C82C @ =0x00003108\n"
                "\tadds r6, r2, r0\n"
                "\tldr r1, _0809C830 @ =0x00000516\n"
                "\tadds r2, r5, r1\n"
                "_0809C7F0:\n"
                "\tadds r0, r6, r3\n"
                "\tadds r1, r2, r3\n"
                "\tldrb r1, [r1]\n"
                "\tstrb r1, [r0]\n"
                "\tadds r3, 0x1\n"
                "\tcmp r3, 0x11\n"
                "\tble _0809C7F0\n"
                "\tmovs r3, 0xA5\n"
                "\tlsls r3, 3\n"
                "\tadds r0, r5, r3\n"
                "\tldrb r0, [r0]\n"
                "\tadds r1, r4, 0\n"
                "\tadds r1, 0x2E\n"
                "\tstrb r0, [r1]\n"
                "\tldr r6, _0809C834 @ =0x00000529\n"
                "\tadds r0, r5, r6\n"
                "\tldrb r0, [r0]\n"
                "\tadds r1, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tadds r0, r4, 0\n"
                "\tbl GetEnigmaBerryChecksum\n"
                "\tstr r0, [r4, 0x30]\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0809C824: .4byte gSaveBlock1Ptr\n"
                "_0809C828: .4byte 0x000030ec\n"
                "_0809C82C: .4byte 0x00003108\n"
                "_0809C830: .4byte 0x00000516\n"
                "_0809C834: .4byte 0x00000529");
}
#endif

u32 GetEnigmaBerryChecksum(struct EnigmaBerry * enigmaBerry)
{
    const u8 * src = (const u8 *)enigmaBerry;
    u32 result = 0;
    u32 i;

    for (i = 0; i < offsetof(struct EnigmaBerry, checksum); i++)
        result += src[i];

    return result;
}

bool32 IsEnigmaBerryValid(void)
{
    if (gSaveBlock1Ptr->enigmaBerry.berry.stageDuration == 0)
        return FALSE;
    if (gSaveBlock1Ptr->enigmaBerry.berry.maxYield == 0)
        return FALSE;
    if (GetEnigmaBerryChecksum(&gSaveBlock1Ptr->enigmaBerry) != gSaveBlock1Ptr->enigmaBerry.checksum)
        return FALSE;

    return TRUE;
}

const struct Berry * sub_809C8A0(u8 berryIdx)
{
    if (berryIdx == ITEM_TO_BERRY(ITEM_ENIGMA_BERRY) && IsEnigmaBerryValid())
        return (struct Berry *)&gSaveBlock1Ptr->enigmaBerry.berry;

    if (berryIdx == 0 || berryIdx > ITEM_TO_BERRY(ITEM_ENIGMA_BERRY))
        berryIdx = 1;

    return &sBerries[berryIdx - 1];
}

u8 ItemIdToBerryType(u16 itemId)
{
    if (itemId - FIRST_BERRY_INDEX < 0 || itemId - FIRST_BERRY_INDEX > ITEM_ENIGMA_BERRY - FIRST_BERRY_INDEX)
        return 1;

    return ITEM_TO_BERRY(itemId);
}

u16 BerryTypeToItemId(u16 berryType)
{
    if (berryType - 1 < 0 || berryType - 1 > ITEM_ENIGMA_BERRY - FIRST_BERRY_INDEX)
        return FIRST_BERRY_INDEX;

    return berryType + FIRST_BERRY_INDEX - 1;
}

void GetBerryNameByBerryType(u8 berryType, u8 * dest)
{
    const struct Berry * berry = sub_809C8A0(berryType);
    memcpy(dest, berry->name, 6);
    dest[6] = EOS;
}
