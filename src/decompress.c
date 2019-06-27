#include "global.h"
#include "malloc.h"
#include "decompress.h"
#include "pokemon.h"
#include "text.h"
#include "constants/species.h"

extern const struct CompressedSpriteSheet gMonFrontPicTable[];
extern const struct CompressedSpriteSheet gMonBackPicTable[];

static void DuplicateDeoxysTiles(void *pointer, s32 species);

void LZDecompressWram(const void *src, void *dest)
{
    LZ77UnCompWram(src, dest);
}

void LZDecompressVram(const void *src, void *dest)
{
    LZ77UnCompVram(src, dest);
}

u16 LoadCompressedSpriteSheet(const struct CompressedSpriteSheet *src)
{
    struct SpriteSheet dest;

    LZ77UnCompWram(src->data, gDecompressionBuffer);
    dest.data = gDecompressionBuffer;
    dest.size = src->size;
    dest.tag = src->tag;
    return LoadSpriteSheet(&dest);
}

void LoadCompressedSpriteSheetOverrideBuffer(const struct CompressedSpriteSheet *src, void *buffer)
{
    struct SpriteSheet dest;

    LZ77UnCompWram(src->data, buffer);
    dest.data = buffer;
    dest.size = src->size;
    dest.tag = src->tag;
    LoadSpriteSheet(&dest);
}

void LoadCompressedSpritePalette(const struct CompressedSpritePalette *src)
{
    struct SpritePalette dest;

    LZ77UnCompWram(src->data, gDecompressionBuffer);
    dest.data = (void*) gDecompressionBuffer;
    dest.tag = src->tag;
    LoadSpritePalette(&dest);
}

void LoadCompressedSpritePaletteOverrideBuffer(const struct CompressedSpritePalette *a, void *buffer)
{
    struct SpritePalette dest;

    LZ77UnCompWram(a->data, buffer);
    dest.data = buffer;
    dest.tag = a->tag;
    LoadSpritePalette(&dest);
}

void DecompressPicFromTable(const struct CompressedSpriteSheet *src, void* buffer, s32 species)
{
    if (species > NUM_SPECIES)
        LZ77UnCompWram(gMonFrontPicTable[0].data, buffer);
    else
        LZ77UnCompWram(src->data, buffer);
    DuplicateDeoxysTiles(buffer, species);
}

void HandleLoadSpecialPokePic(const struct CompressedSpriteSheet *src, void *dest, s32 species, u32 personality)
{
    bool8 isFrontPic;

    if (src == &gMonFrontPicTable[species])
        isFrontPic = TRUE; // frontPic
    else
        isFrontPic = FALSE; // backPic

    LoadSpecialPokePic(src, dest, species, personality, isFrontPic);
}

void LoadSpecialPokePic(const struct CompressedSpriteSheet *src, void *dest, s32 species, u32 personality, bool8 isFrontPic)
{
    if (species == SPECIES_UNOWN)
    {
        u16 i = (((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 3)) % 0x1C;

        // The other Unowns are separate from Unown A.
        if (i == 0)
            i = SPECIES_UNOWN;
        else
            i += SPECIES_UNOWN_B - 1;

        if (!isFrontPic)
            LZ77UnCompWram(gMonBackPicTable[i].data, dest);
        else
            LZ77UnCompWram(gMonFrontPicTable[i].data, dest);
    }
    else if (species > NUM_SPECIES) // is species unknown? draw the ? icon
        LZ77UnCompWram(gMonFrontPicTable[0].data, dest);
    else
        LZ77UnCompWram(src->data, dest);

    DuplicateDeoxysTiles(dest, species);
    DrawSpindaSpots(species, personality, dest, isFrontPic);
}

static void DuplicateDeoxysTiles(void *pointer, s32 species)
{
    if (species == SPECIES_DEOXYS)
        CpuCopy32(pointer + 0x800, pointer, 0x800);
}

static void Unused_LZDecompressWramIndirect(const void **src, void *dest)
{
    LZ77UnCompWram(*src, dest);
}

#ifdef NONMATCHING
static void sub_800EDDC(s32 a0, s32 a1, const u8 *a2, u8 *a3)
{
    u8 *v1, *v2;
    int i, j, k, l;

    if (a0 & 1)
    {
        u8 v40 = ((a0 >> 1) + 4);
        for (i = 0; i < a1; ++i)
        {
            // this nested loop failed to match
            for (j = 0; j < 8 - a0; ++j)
            {
                for (k = 0; k < 8; ++k)
                {

                    v1 = a3 + 0x100 * v40 + 0x100 * (j >> 1) + 0x20 * k;
                    v2 = a3 + 0x20 * k + 0x100 * (j >> 1);
                    for (l = 0; l < 0x10; ++l)
                    {
                        if (!(j & 1))
                        {
                            v2[0] = j & 1;
                            v1[16] = 0;
//                            a3[0x100 * (j / 2) + 0x20 * k + l] = 0;
//                            a3[0x100 * v40 + 0x100 * (j / 2) + 0x20 * k + l + 0x10] = 0;
                        }
                        else
                        {
                            v2[16] = 0;
                            v1[0x100] = 0;
//                            a3[0x100 * (j / 2) + 0x20 * k + l + 0x10] = 0;
//                            a3[0x100 * v40 + 0x100 * (j / 2) + 0x20 * k + l + 0x100] = 0;
                        }
                        ++v1;
                        ++v2; // this should be generated if you write stuff inside operator [] instead of declaring v1/v2
                    }
                }
            }
            for (j = 0; j < 2; ++j)
            {
                for (k = 0; k < 8; ++k)
                {
                    for (l = 0; l < 0x20; ++l)
                    {
                        a3[0x100 * k + 0x20 * j + l] = 0;
                        a3[0x100 * k + 0xC0 + 0x20 * j + l] = 0;
                    }
                }
            }
            if (a0 == 5)
                a3 += 0x120;
            for (j = 0; j < a0; ++j)
            {
                for (k = 0; k < a0; ++k)
                {
                    for (l = 0; l < 4; ++l)
                    {
                        a3[0x12 + 4 * l] = a2[0 + 4 * l];
                        a3[0x13 + 4 * l] = a2[1 + 4 * l];
                        a3[0x12 + 0x1E + 4 * l] = a2[2 + 4 * l];
                        a3[0x12 + 0x1F + 4 * l] = a2[3 + 4 * l];
                        a3[0x102 + 4 * l] = a2[0x10 + 4 * l];
                        a3[0x103 + 4 * l] = a2[0x11 + 4 * l];
                        a3[0x120 + 4 * l] = a2[0x12 + 4 * l];
                        a3[0x121 + 4 * l] = a2[0x13 + 4 * l];
                    }
                    a2 += 0x20;
                    a3 += 0x20;
                }
                if (a0 == 7)
                    a3 += 0x20;
                else if (a0 == 5)
                    a3 += 0x60;
            }
            if (a0 == 7)
                a3 += 0x100;
            else if (a0 == 5)
                a3 += 0x1E0;
        }
    }
    else
    {
        for (i = 0; i < a1; ++i)
        {
            if (a0 == 6)
                for (j = 0; j < 0x100; ++j)
                    *a3++ = 0;
            for (j = 0; j < a0; ++j)
            {
                if (a0 == 6)
                    for (k = 0; k < 0x20; ++k)
                        *a3++ = 0;
                for (k = 0; k < 0x20 * a0; ++k)
                    *a3++ = *a2++;
                if (a0 == 6)
                    for (k = 0; k < 0x20; ++k)
                        *a3++ = 0;
            }
            if (a0 == 6)
                for (j = 0; j < 0x100; ++j)
                    *a3++ = 0;
        }
    }
}
#else
NAKED
static void sub_800EDDC(s32 a0, s32 a1, const u8 *a2, u8 *a3)
{
    asm_unified("\n\
        push {r4-r7,lr}\n\
        mov r7, r10\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5-r7}\n\
        sub sp, 0x24\n\
        mov r9, r0\n\
        str r1, [sp]\n\
        str r2, [sp, 0x4]\n\
        adds r5, r3, 0\n\
        movs r0, 0x1\n\
        mov r1, r9\n\
        ands r0, r1\n\
        cmp r0, 0\n\
        bne _0800EDFC\n\
        b _0800EF94\n\
    _0800EDFC:\n\
        asrs r0, r1, 1\n\
        adds r0, 0x4\n\
        lsls r0, 24\n\
        lsrs r0, 24\n\
        str r0, [sp, 0x8]\n\
        movs r0, 0\n\
        ldr r2, [sp]\n\
        cmp r0, r2\n\
        blt _0800EE10\n\
        b _0800F024\n\
    _0800EE10:\n\
        movs r4, 0x8\n\
        subs r1, r4, r1\n\
        str r1, [sp, 0x10]\n\
    _0800EE16:\n\
        movs r7, 0\n\
        adds r0, 0x1\n\
        str r0, [sp, 0x14]\n\
        ldr r0, [sp, 0x10]\n\
        cmp r7, r0\n\
        bge _0800EE92\n\
        ldr r1, [sp, 0x8]\n\
        lsls r1, 8\n\
        str r1, [sp, 0x18]\n\
        movs r2, 0\n\
        mov r10, r2\n\
        mov r0, r9\n\
        movs r4, 0x8\n\
        subs r0, r4, r0\n\
        str r0, [sp, 0xC]\n\
    _0800EE34:\n\
        movs r3, 0\n\
        asrs r0, r7, 1\n\
        adds r1, r7, 0\n\
        movs r2, 0x1\n\
        ands r1, r2\n\
        str r1, [sp, 0x20]\n\
        lsls r0, 8\n\
        mov r8, r0\n\
        mov r12, r5\n\
    _0800EE46:\n\
        lsls r1, r3, 5\n\
        ldr r4, [sp, 0x18]\n\
        adds r0, r5, r4\n\
        adds r0, r1\n\
        mov r1, r8\n\
        adds r2, r0, r1\n\
        mov r1, r12\n\
        add r1, r8\n\
        movs r6, 0xF\n\
    _0800EE58:\n\
        ldr r4, [sp, 0x20]\n\
        cmp r4, 0\n\
        bne _0800EE68\n\
        strb r4, [r1]\n\
        add r4, sp, 0x20\n\
        ldrb r4, [r4]\n\
        strb r4, [r2, 0x10]\n\
        b _0800EE76\n\
    _0800EE68:\n\
        mov r0, r10\n\
        strb r0, [r1, 0x10]\n\
        movs r4, 0x80\n\
        lsls r4, 1\n\
        adds r4, r2, r4\n\
        str r4, [sp, 0x1C]\n\
        strb r0, [r4]\n\
    _0800EE76:\n\
        adds r2, 0x1\n\
        adds r1, 0x1\n\
        subs r6, 0x1\n\
        cmp r6, 0\n\
        bge _0800EE58\n\
        movs r0, 0x20\n\
        add r12, r0\n\
        adds r3, 0x1\n\
        cmp r3, 0x7\n\
        ble _0800EE46\n\
        adds r7, 0x1\n\
        ldr r1, [sp, 0xC]\n\
        cmp r7, r1\n\
        blt _0800EE34\n\
    _0800EE92:\n\
        movs r7, 0\n\
        movs r2, 0\n\
    _0800EE96:\n\
        movs r6, 0\n\
        adds r4, r7, 0x1\n\
        mov r8, r4\n\
        lsls r4, r7, 5\n\
    _0800EE9E:\n\
        adds r0, r6, 0x1\n\
        mov r10, r0\n\
        lsls r1, r6, 8\n\
        adds r0, r1, 0\n\
        adds r0, 0xC0\n\
        adds r0, r5, r0\n\
        adds r0, r4\n\
        adds r1, r5, r1\n\
        adds r1, r4\n\
        movs r3, 0x1F\n\
    _0800EEB2:\n\
        strb r2, [r1]\n\
        strb r2, [r0]\n\
        adds r0, 0x1\n\
        adds r1, 0x1\n\
        subs r3, 0x1\n\
        cmp r3, 0\n\
        bge _0800EEB2\n\
        mov r6, r10\n\
        cmp r6, 0x7\n\
        ble _0800EE9E\n\
        mov r7, r8\n\
        cmp r7, 0x1\n\
        ble _0800EE96\n\
        mov r1, r9\n\
        cmp r1, 0x5\n\
        bne _0800EED8\n\
        movs r2, 0x90\n\
        lsls r2, 1\n\
        adds r5, r2\n\
    _0800EED8:\n\
        movs r7, 0\n\
        cmp r7, r9\n\
        bge _0800EF6E\n\
    _0800EEDE:\n\
        movs r3, 0\n\
        adds r7, 0x1\n\
        mov r8, r7\n\
        cmp r3, r9\n\
        bge _0800EF4E\n\
    _0800EEE8:\n\
        adds r3, 0x1\n\
        mov r10, r3\n\
        ldr r4, [sp, 0x4]\n\
        adds r4, 0x20\n\
        adds r7, r5, 0\n\
        adds r7, 0x20\n\
        movs r0, 0x12\n\
        adds r0, r5\n\
        mov r12, r0\n\
        ldr r2, [sp, 0x4]\n\
        adds r3, r5, 0\n\
        movs r6, 0x3\n\
    _0800EF00:\n\
        ldrb r0, [r2]\n\
        mov r1, r12\n\
        strb r0, [r1]\n\
        ldrb r0, [r2, 0x1]\n\
        strb r0, [r1, 0x1]\n\
        ldrb r0, [r2, 0x2]\n\
        strb r0, [r1, 0x1E]\n\
        ldrb r0, [r2, 0x3]\n\
        strb r0, [r1, 0x1F]\n\
        movs r0, 0x81\n\
        lsls r0, 1\n\
        adds r1, r3, r0\n\
        ldrb r0, [r2, 0x10]\n\
        strb r0, [r1]\n\
        ldr r0, _0800EF58 @ =0x00000103\n\
        adds r1, r3, r0\n\
        ldrb r0, [r2, 0x11]\n\
        strb r0, [r1]\n\
        movs r0, 0x90\n\
        lsls r0, 1\n\
        adds r1, r3, r0\n\
        ldrb r0, [r2, 0x12]\n\
        strb r0, [r1]\n\
        ldr r0, _0800EF5C @ =0x00000121\n\
        adds r1, r3, r0\n\
        ldrb r0, [r2, 0x13]\n\
        strb r0, [r1]\n\
        movs r1, 0x4\n\
        add r12, r1\n\
        adds r2, 0x4\n\
        adds r3, 0x4\n\
        subs r6, 0x1\n\
        cmp r6, 0\n\
        bge _0800EF00\n\
        str r4, [sp, 0x4]\n\
        adds r5, r7, 0\n\
        mov r3, r10\n\
        cmp r3, r9\n\
        blt _0800EEE8\n\
    _0800EF4E:\n\
        mov r2, r9\n\
        cmp r2, 0x7\n\
        bne _0800EF60\n\
        adds r5, 0x20\n\
        b _0800EF68\n\
        .align 2, 0\n\
    _0800EF58: .4byte 0x00000103\n\
    _0800EF5C: .4byte 0x00000121\n\
    _0800EF60:\n\
        mov r4, r9\n\
        cmp r4, 0x5\n\
        bne _0800EF68\n\
        adds r5, 0x60\n\
    _0800EF68:\n\
        mov r7, r8\n\
        cmp r7, r9\n\
        blt _0800EEDE\n\
    _0800EF6E:\n\
        mov r0, r9\n\
        cmp r0, 0x7\n\
        bne _0800EF7C\n\
        movs r1, 0x80\n\
        lsls r1, 1\n\
        adds r5, r1\n\
        b _0800EF88\n\
    _0800EF7C:\n\
        mov r2, r9\n\
        cmp r2, 0x5\n\
        bne _0800EF88\n\
        movs r4, 0xF0\n\
        lsls r4, 1\n\
        adds r5, r4\n\
    _0800EF88:\n\
        ldr r0, [sp, 0x14]\n\
        ldr r1, [sp]\n\
        cmp r0, r1\n\
        bge _0800EF92\n\
        b _0800EE16\n\
    _0800EF92:\n\
        b _0800F024\n\
    _0800EF94:\n\
        movs r6, 0\n\
        ldr r2, [sp]\n\
        cmp r6, r2\n\
        bge _0800F024\n\
    _0800EF9C:\n\
        adds r6, 0x1\n\
        mov r10, r6\n\
        mov r4, r9\n\
        cmp r4, 0x6\n\
        bne _0800EFB4\n\
        movs r0, 0\n\
        movs r3, 0xFF\n\
    _0800EFAA:\n\
        strb r0, [r5]\n\
        adds r5, 0x1\n\
        subs r3, 0x1\n\
        cmp r3, 0\n\
        bge _0800EFAA\n\
    _0800EFB4:\n\
        movs r7, 0\n\
        cmp r7, r9\n\
        bge _0800F008\n\
    _0800EFBA:\n\
        adds r7, 0x1\n\
        mov r8, r7\n\
        mov r1, r9\n\
        lsls r0, r1, 5\n\
        cmp r1, 0x6\n\
        bne _0800EFD4\n\
        movs r1, 0\n\
        movs r3, 0x1F\n\
    _0800EFCA:\n\
        strb r1, [r5]\n\
        adds r5, 0x1\n\
        subs r3, 0x1\n\
        cmp r3, 0\n\
        bge _0800EFCA\n\
    _0800EFD4:\n\
        adds r1, r0, 0\n\
        cmp r1, 0\n\
        ble _0800EFEE\n\
        adds r3, r1, 0\n\
    _0800EFDC:\n\
        ldr r2, [sp, 0x4]\n\
        ldrb r0, [r2]\n\
        strb r0, [r5]\n\
        adds r2, 0x1\n\
        str r2, [sp, 0x4]\n\
        adds r5, 0x1\n\
        subs r3, 0x1\n\
        cmp r3, 0\n\
        bne _0800EFDC\n\
    _0800EFEE:\n\
        mov r4, r9\n\
        cmp r4, 0x6\n\
        bne _0800F002\n\
        movs r0, 0\n\
        movs r3, 0x1F\n\
    _0800EFF8:\n\
        strb r0, [r5]\n\
        adds r5, 0x1\n\
        subs r3, 0x1\n\
        cmp r3, 0\n\
        bge _0800EFF8\n\
    _0800F002:\n\
        mov r7, r8\n\
        cmp r7, r9\n\
        blt _0800EFBA\n\
    _0800F008:\n\
        mov r0, r9\n\
        cmp r0, 0x6\n\
        bne _0800F01C\n\
        movs r0, 0\n\
        movs r3, 0xFF\n\
    _0800F012:\n\
        strb r0, [r5]\n\
        adds r5, 0x1\n\
        subs r3, 0x1\n\
        cmp r3, 0\n\
        bge _0800F012\n\
    _0800F01C:\n\
        mov r6, r10\n\
        ldr r1, [sp]\n\
        cmp r6, r1\n\
        blt _0800EF9C\n\
    _0800F024:\n\
        add sp, 0x24\n\
        pop {r3-r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov r10, r5\n\
        pop {r4-r7}\n\
        pop {r0}\n\
        bx r0\n\
        ");
}
#endif

bool8 LoadCompressedSpriteSheetUsingHeap(const struct CompressedSpriteSheet* src)
{
    struct SpriteSheet dest;
    void* buffer;

    buffer = AllocZeroed(*((u32*)(&src->data[0])) >> 8);
    if (!buffer)
        return TRUE;
    LZ77UnCompWram(src->data, buffer);
    dest.data = buffer;
    dest.size = src->size;
    dest.tag = src->tag;
    LoadSpriteSheet(&dest);
    Free(buffer);
    return FALSE;
}

bool8 LoadCompressedSpritePaletteUsingHeap(const struct CompressedSpritePalette *src)
{
    struct SpritePalette dest;
    void* buffer;

    buffer = AllocZeroed(*((u32*)(&src->data[0])) >> 8);
    if (!buffer)
        return TRUE;
    LZ77UnCompWram(src->data, buffer);
    dest.data = buffer;
    dest.tag = src->tag;
    LoadSpritePalette(&dest);
    Free(buffer);
    return FALSE;
}

u32 GetDecompressedDataSize(const u8 *ptr)
{
    u32 ptr32[1];
    u8 *ptr8 = (u8 *)ptr32;

    ptr8[0] = ptr[1];
    ptr8[1] = ptr[2];
    ptr8[2] = ptr[3];
    ptr8[3] = 0;
    return ptr32[0];
}

void DecompressPicFromTable_DontHandleDeoxys(const struct CompressedSpriteSheet *src, void* buffer, s32 species)
{
    if (species > NUM_SPECIES)
        LZ77UnCompWram(gMonFrontPicTable[0].data, buffer);
    else
        LZ77UnCompWram(src->data, buffer);
}

void HandleLoadSpecialPokePic_DontHandleDeoxys(const struct CompressedSpriteSheet *src, void *dest, s32 species, u32 personality)
{
    bool8 isFrontPic;

    if (src == &gMonFrontPicTable[species])
        isFrontPic = TRUE; // frontPic
    else
        isFrontPic = FALSE; // backPic
    LoadSpecialPokePic_DontHandleDeoxys(src, dest, species, personality, isFrontPic);
}

void LoadSpecialPokePic_DontHandleDeoxys(const struct CompressedSpriteSheet *src, void *dest, s32 species, u32 personality, bool8 isFrontPic)
{
    if (species == SPECIES_UNOWN)
    {
        u16 i = (((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 3)) % 0x1C;

        // The other Unowns are separate from Unown A.
        if (i == 0)
            i = SPECIES_UNOWN;
        else
            i += SPECIES_UNOWN_B - 1;
        if (!isFrontPic)
            LZ77UnCompWram(gMonBackPicTable[i].data, dest);
        else
            LZ77UnCompWram(gMonFrontPicTable[i].data, dest);
    }
    else if (species > NUM_SPECIES) // is species unknown? draw the ? icon
    {
        LZ77UnCompWram(gMonFrontPicTable[0].data, dest);
    }
    else
    {
        LZ77UnCompWram(src->data, dest);
    }
    DrawSpindaSpots(species, personality, dest, isFrontPic);
}
